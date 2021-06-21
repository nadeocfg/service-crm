import { NextFunction, Request, Response } from 'express';
import { UserRequest } from '../../frontend/src/models/UserRequestModels';
import db from '../config/db';

// @desc   create order
// @route  POST /api/orders/create
// @access Private
const createOrder = async (
  request: UserRequest,
  response: Response,
  next: NextFunction
) => {
  try {
    const createdBy = request.user?.id || 1;
    const { customer, address, serviceMan, comment, parts, jobTypes } =
      request.body;

    const insertOrder = await db.query(
      `
        INSERT INTO
          "${process.env.DB_NAME}"."orders" ("customerId", "createdBy", address, "createdDate", "updatedDate", status, "serviceManId", comment)
        VALUES($1, $2, $3, NOW(), NOW(), 1, $4, $5)
        RETURNING
          *;
      `,
      [customer.id, createdBy, address, serviceMan.id, comment]
    );

    for (let i = 0; i < parts.length; i += 1) {
      const { price, soldQuantity, id, monthsOfGuarantee } = parts[i];
      const insertSoldPart = await db.query(
        `
          INSERT INTO
            "${process.env.DB_NAME}"."soldParts" (price, quantity, sum, "orderId", "partId", "monthsOfGuarantee", "createdDate", "updatedDate")
          VALUES($1, $2, $3, $4, $5, $6, NOW(), NOW())
          RETURNING
            *;
        `,
        [
          price,
          soldQuantity,
          price * soldQuantity,
          insertOrder.rows[0].id,
          id,
          monthsOfGuarantee,
        ]
      );
    }

    for (let i = 0; i < jobTypes.length; i += 1) {
      const { id, price, soldQuantity, monthsOfGuarantee } = jobTypes[i];
      const insertSoldJobTypes = await db.query(
        `
          INSERT INTO
            "${process.env.DB_NAME}"."soldJobTypes" ("jobTypeId", price, quantity, sum, "orderId", "monthsOfGuarantee", "createdDate", "updatedDate")
          VALUES($1, $2, $3, $4, $5, $6, NOW(), NOW())
          RETURNING
            *;
        `,
        [
          id,
          price,
          soldQuantity,
          price * soldQuantity,
          insertOrder.rows[0].id,
          monthsOfGuarantee,
        ]
      );
    }

    response.json(insertOrder.rows);
  } catch (error) {
    response.status(404).json({
      message: error.message,
    });
    next(`Error: ${error.message}`);
  }
};

// @desc   get orders by role
// @route  GET /api/orders
// @access Private
const getOrders = async (
  request: UserRequest,
  response: Response,
  next: NextFunction
) => {
  try {
    const { count, page } = request.query;
    const roleCode = request.user?.roleCode || '';
    const userId = request.user?.id || '';

    let offset = 0;

    if (page && count) {
      offset = Number(page) * Number(count);
    } else {
      return response.status(400).json({
        message: 'Wrong GET params',
      });
    }

    if (roleCode === 'ADMIN' || roleCode === 'SUPER_ADMIN') {
      const getAllOrders = await db.query(
        `
          SELECT
            orders.id,
            orders.address,
            orders."createdDate",
            orders."updatedDate",
            orders.comment,
            status.name as "statusName",
            users."fullName" as "serviceManFullName"
          FROM
            "${process.env.DB_NAME}"."orders" as orders
          LEFT JOIN
            "${process.env.DB_NAME}"."dictOrderStatuses" as status
          ON
            orders.status = status.id
          LEFT JOIN
            "${process.env.DB_NAME}"."users" as users
          ON
            orders."serviceManId" = users.id
          WHERE
            orders."isActive" = true
          ORDER BY
            orders.id
          LIMIT
            $1
          OFFSET
            $2;
        `,
        [count, offset]
      );

      const orders = getAllOrders.rows;
      for (let i = 0; i < orders.length; i += 1) {
        const orderJobs = await db.query(
          `
            SELECT
              *
            FROM
              "${process.env.DB_NAME}"."soldJobTypes"
            WHERE
              "orderId" = $1 AND
              "isActive" = true
            ORDER BY
              id;
          `,
          [orders[i].id]
        );

        const orderParts = await db.query(
          `
            SELECT
              *
            FROM
              "${process.env.DB_NAME}"."soldParts"
            WHERE
              "orderId" = $1 AND
              "isActive" = true
            ORDER BY
              id;
          `,
          [orders[i].id]
        );

        orders[i].jobs = orderJobs.rows;
        orders[i].parts = orderParts.rows;
      }

      const total = await db.query(
        `
          SELECT
            count(*) AS total
          FROM
            "${process.env.DB_NAME}"."orders"
          WHERE
            "isActive" = true;
        `
      );

      response.json({
        orders: orders,
        total: +total.rows[0].total,
      });
    } else {
      const getUserOrders = await db.query(
        `
          SELECT
            orders.id,
            orders.address,
            orders."createdDate",
            orders."updatedDate",
            orders.comment,
            status.name as "statusName",
            users."fullName" as "serviceManFullName"
          FROM
            "${process.env.DB_NAME}"."orders" as orders
          LEFT JOIN
            "${process.env.DB_NAME}"."dictOrderStatuses" as status
          ON
            orders.status = status.id
          LEFT JOIN
            "${process.env.DB_NAME}"."users" as users
          ON
            orders."serviceManId" = users.id
          WHERE
            orders."serviceManId" = $3 AND
            orders."isActive" = true
          ORDER BY
            orders.id
          LIMIT
            $1
          OFFSET
            $2;
        `,
        [count, offset, userId]
      );

      const orders = getUserOrders.rows;
      for (let i = 0; i < orders.length; i += 1) {
        const orderJobs = await db.query(
          `
            SELECT
              *
            FROM
              "${process.env.DB_NAME}"."soldJobTypes"
            WHERE
              "orderId" = $1 AND
              "isActive" = true
            ORDER BY
              id;
          `,
          [orders[i].id]
        );

        const orderParts = await db.query(
          `
            SELECT
              *
            FROM
              "${process.env.DB_NAME}"."soldParts"
            WHERE
              "orderId" = $1 AND
              "isActive" = true
            ORDER BY
              id;
          `,
          [orders[i].id]
        );

        orders[i].jobs = orderJobs.rows;
        orders[i].parts = orderParts.rows;
      }

      const total = await db.query(
        `
          SELECT
            count(*) AS total
          FROM
            "${process.env.DB_NAME}"."orders"
          WHERE
            "serviceManId" = $1 AND
            "isActive" = true;
        `,
        [userId]
      );

      response.json({
        orders: orders,
        total: +total.rows[0].total,
      });
    }
  } catch (error) {
    response.status(404).json({
      message: error.message,
    });
    next(`Error: ${error.message}`);
  }
};

export { createOrder, getOrders };
