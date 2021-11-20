import { NextFunction, Request, Response } from 'express';
import { UserRequest } from '../../frontend/src/models/UserRequestModels';
import db from '../config/db';
import dotenv from 'dotenv';

dotenv.config();

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
    const {
      customer,
      address,
      serviceMan,
      comment,
      parts,
      jobTypes,
      visitPrice,
    } = request.body;

    const requiredKeys = [
      'customer',
      'address',
      'visitPrice',
      'serviceMan',
      'parts',
      'jobTypes',
    ];

    for (let i = 0; i < requiredKeys.length; i += 1) {
      if (!Object.keys(request.body).includes(requiredKeys[i])) {
        throw Error(`Request body not have required key: ${requiredKeys[i]}`);
      }
    }

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

    let partsTotal: number = 0;
    for (let i = 0; i < parts.length; i += 1) {
      const { price, soldQuantity, id, monthsOfGuarantee, quantity } = parts[i];
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

      partsTotal += price * soldQuantity;
    }

    let jobTotal: number = 0;
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

      jobTotal += price * soldQuantity;
    }

    const serviceManPercents: any = await db.query(
      `
        SELECT
          users."percentFromVisit",
          users."percentFromParts",
          users."percentFromJob"
        FROM
          "${process.env.DB_NAME}"."users" as users
        WHERE
          users.id = $1
        ORDER BY
          users.id;
      `,
      [serviceMan.id]
    );

    const serviceManPartsPaidOut =
      (partsTotal / 100) * serviceManPercents.rows[0].percentFromParts;
    const serviceManJobPaidOut =
      (jobTotal / 100) * serviceManPercents.rows[0].percentFromJob;
    const serviceManVisitPaidOut =
      (visitPrice / 100) * serviceManPercents.rows[0].percentFromVisit;

    const insertPaidOut: any = await db.query(
      `
        INSERT INTO
          "${process.env.DB_NAME}"."serviceManPaidOuts" ("userId", job, parts, visit, "orderId")
        VALUES($1, $2, $3, $4, $5)
        RETURNING
          *;
      `,
      [
        serviceMan.id,
        serviceManJobPaidOut,
        serviceManPartsPaidOut,
        serviceManVisitPaidOut,
        insertOrder.rows[0].id,
      ]
    );

    response.json(insertOrder.rows);
  } catch (error: any) {
    response.status(400).json({
      message: error.message,
    });
    next(`Error: ${error.message}`);
  }
};

// @desc   update order
// @route  POST /api/orders/update
// @access Private
const updateOrder = async (
  request: UserRequest,
  response: Response,
  next: NextFunction
) => {
  try {
    const {
      customer,
      address,
      serviceMan,
      comment,
      parts,
      jobTypes,
      visitPrice,
      orderId,
    } = request.body;

    const requiredKeys = [
      'customer',
      'address',
      'visitPrice',
      'serviceMan',
      'parts',
      'jobTypes',
      'orderId',
    ];

    for (let i = 0; i < requiredKeys.length; i += 1) {
      if (!Object.keys(request.body).includes(requiredKeys[i])) {
        throw Error(`Request body not have required key: ${requiredKeys[i]}`);
      }
    }

    const updateOrder = await db.query(
      `
        UPDATE
          "service-crm"."orders" as orders
        SET
          "customerId" = $1,
          address = $2,
          "updatedDate" = NOW(),
          "serviceManId" = $3,
          comment = $4
        WHERE
          orders.id = $5
        RETURNING
          *;
      `,
      [customer.id, address, serviceMan.id, comment, orderId]
    );

    const disableOldSoldParts = await db.query(
      `
        UPDATE
          "${process.env.DB_NAME}"."soldParts"
        SET
          "isActive" = false,
          "updatedDate" = NOW()
        WHERE
          "orderId" = $1
        RETURNING
          *;
      `,
      [orderId]
    );

    let partsTotal: number = 0;
    for (let i = 0; i < parts.length; i += 1) {
      const { price, soldQuantity, id, monthsOfGuarantee, quantity } = parts[i];
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
          updateOrder.rows[0].id,
          id,
          monthsOfGuarantee,
        ]
      );

      partsTotal += price * soldQuantity;
    }

    const disableOldSoldJobTypes = await db.query(
      `
        UPDATE
          "${process.env.DB_NAME}"."soldJobTypes"
        SET
          "isActive" = false,
          "updatedDate" = NOW()
        WHERE
          "orderId" = $1
        RETURNING
          *;
      `,
      [orderId]
    );

    let jobTotal: number = 0;
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
          updateOrder.rows[0].id,
          monthsOfGuarantee,
        ]
      );

      jobTotal += price * soldQuantity;
    }

    const serviceManPercents: any = await db.query(
      `
        SELECT
          users."percentFromVisit",
          users."percentFromParts",
          users."percentFromJob"
        FROM
          "${process.env.DB_NAME}"."users" as users
        WHERE
          users.id = $1
        ORDER BY
          users.id;
      `,
      [serviceMan.id]
    );

    const serviceManPartsPaidOut =
      (partsTotal / 100) * serviceManPercents.rows[0].percentFromParts;
    const serviceManJobPaidOut =
      (jobTotal / 100) * serviceManPercents.rows[0].percentFromJob;
    const serviceManVisitPaidOut =
      (visitPrice / 100) * serviceManPercents.rows[0].percentFromVisit;

    const insertPaidOut: any = await db.query(
      `
        UPDATE
          "${process.env.DB_NAME}"."serviceManPaidOuts"
        SET
          "userId" = $1,
          "job" = $2,
          "parts" = $3,
          "visit" = $4,
          "updatedDate" = NOW()
        WHERE
          "orderId" = $5
        RETURNING
          *;
      `,
      [
        serviceMan.id,
        serviceManJobPaidOut,
        serviceManPartsPaidOut,
        serviceManVisitPaidOut,
        updateOrder.rows[0].id,
      ]
    );

    response.json(updateOrder.rows);
  } catch (error: any) {
    response.status(400).json({
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
            orders."customerId",
            orders."serviceManId",
            orders."createdBy",
            status.name as "statusName"
          FROM
            "${process.env.DB_NAME}"."orders" as orders
          LEFT JOIN
            "${process.env.DB_NAME}"."dictOrderStatuses" as status
          ON
            orders.status = status.id
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

        const customer = await db.query(
          `
            SELECT
              *
            FROM
              "${process.env.DB_NAME}"."customers"
            WHERE
              "id" = $1;
          `,
          [orders[i].customerId]
        );

        const serviceMan = await db.query(
          `
            SELECT
              id,
              login,
              phone,
              "fullName",
              "percentFromJob",
              "percentFromParts",
              "percentFromVisit"
            FROM
              "${process.env.DB_NAME}"."users"
            WHERE
              "id" = $1;
          `,
          [orders[i].serviceManId]
        );

        const createdBy = await db.query(
          `
            SELECT
              login,
              "fullName",
              phone
            FROM
              "${process.env.DB_NAME}"."users"
            WHERE
              "id" = $1;
          `,
          [orders[i].createdBy]
        );

        orders[i].jobs = orderJobs.rows;
        orders[i].parts = orderParts.rows;
        orders[i].customer = customer.rows.length > 0 ? customer.rows[0] : {};
        orders[i].serviceMan =
          serviceMan.rows.length > 0 ? serviceMan.rows[0] : {};
        orders[i].createdBy =
          createdBy.rows.length > 0 ? createdBy.rows[0] : {};
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
  } catch (error: any) {
    response.status(404).json({
      message: error.message,
    });
    next(`Error: ${error.message}`);
  }
};

export { createOrder, getOrders, updateOrder };
