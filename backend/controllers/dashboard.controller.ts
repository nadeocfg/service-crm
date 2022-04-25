import { NextFunction, Response } from 'express';
import { UserRequest } from '../../frontend/src/models/UserRequestModels';
import db from '../config/db';
import dotenv from 'dotenv';

dotenv.config();

// @access Private
// @desc   get orders info for dashboard
// @route  GET /api/dashboard/orders
const getOrdersInfo = async (
  request: UserRequest,
  response: Response,
  next: NextFunction
) => {
  try {
    const isAdmin =
      request.user?.roleCode === 'ADMIN' ||
      request.user?.roleCode === 'SUPER_ADMIN';

    const ordersCount = isAdmin
      ? await db.query(
          `
        SELECT
          count(*)
        FROM
          "${process.env.DB_NAME}".orders
        WHERE
          orders."isActive" = true;
      `,
          []
        )
      : await db.query(
          `
        SELECT
          count(*)
        FROM
          "${process.env.DB_NAME}".orders
        WHERE
          orders."isActive" = true AND
          orders."serviceManId" = $1;
      `,
          [request.user?.id]
        );

    const doneOrders = isAdmin
      ? await db.query(
          `
        SELECT
          count(*)
        FROM
          "${process.env.DB_NAME}".orders
        WHERE
          orders."isActive" = true AND
          orders.status = (SELECT id FROM "${process.env.DB_NAME}"."dictOrderStatuses" WHERE code = 'SERVICE_DONE');
          ;
      `,
          []
        )
      : await db.query(
          `
        SELECT
          count(*)
        FROM
          "${process.env.DB_NAME}".orders
        WHERE
          orders."isActive" = true AND
          orders."serviceManId" = $1 AND
          orders.status = (SELECT id FROM "${process.env.DB_NAME}"."dictOrderStatuses" WHERE code = 'SERVICE_DONE');
      `,
          [request.user?.id]
        );

    const wipOrders = isAdmin
      ? await db.query(
          `
        SELECT
          count(*)
        FROM
          "${process.env.DB_NAME}".orders
        WHERE
          orders."isActive" = true AND
          orders.status = (SELECT id FROM "${process.env.DB_NAME}"."dictOrderStatuses" WHERE code = 'IN_PROGRESS');
          ;
      `,
          []
        )
      : await db.query(
          `
        SELECT
          count(*)
        FROM
          "${process.env.DB_NAME}".orders
        WHERE
          orders."isActive" = true AND
          orders."serviceManId" = $1 AND
          orders.status = (SELECT id FROM "${process.env.DB_NAME}"."dictOrderStatuses" WHERE code = 'IN_PROGRESS');
      `,
          [request.user?.id]
        );

    const newOrders = isAdmin
      ? await db.query(
          `
        SELECT
          count(*)
        FROM
          "${process.env.DB_NAME}".orders
        WHERE
          orders."isActive" = true AND
          orders.status = (SELECT id FROM "${process.env.DB_NAME}"."dictOrderStatuses" WHERE code = 'CREATED');
          ;
      `,
          []
        )
      : await db.query(
          `
        SELECT
          count(*)
        FROM
          "${process.env.DB_NAME}".orders
        WHERE
          orders."isActive" = true AND
          orders."serviceManId" = $1 AND
          orders.status = (SELECT id FROM "${process.env.DB_NAME}"."dictOrderStatuses" WHERE code = 'CREATED');
      `,
          [request.user?.id]
        );

    const canceledOrders = isAdmin
      ? await db.query(
          `
        SELECT
          count(*)
        FROM
          "${process.env.DB_NAME}".orders
        WHERE
          orders."isActive" = true AND
          orders.status = (SELECT id FROM "${process.env.DB_NAME}"."dictOrderStatuses" WHERE code = 'CANCELED');
          ;
      `,
          []
        )
      : await db.query(
          `
        SELECT
          count(*)
        FROM
          "${process.env.DB_NAME}".orders
        WHERE
          orders."isActive" = true AND
          orders."serviceManId" = $1 AND
          orders.status = (SELECT id FROM "${process.env.DB_NAME}"."dictOrderStatuses" WHERE code = 'CANCELED');
      `,
          [request.user?.id]
        );

    const onHoldOrders = isAdmin
      ? await db.query(
          `
        SELECT
          count(*)
        FROM
          "${process.env.DB_NAME}".orders
        WHERE
          orders."isActive" = true AND
          orders.status = (SELECT id FROM "${process.env.DB_NAME}"."dictOrderStatuses" WHERE code = 'ON_HOLD');
          ;
      `,
          []
        )
      : await db.query(
          `
        SELECT
          count(*)
        FROM
          "${process.env.DB_NAME}".orders
        WHERE
          orders."isActive" = true AND
          orders."serviceManId" = $1 AND
          orders.status = (SELECT id FROM "${process.env.DB_NAME}"."dictOrderStatuses" WHERE code = 'ON_HOLD');
      `,
          [request.user?.id]
        );

    response.json({
      count: ordersCount.rows[0].count,
      doneOrders: doneOrders.rows[0].count,
      wipOrders: wipOrders.rows[0].count,
      newOrders: newOrders.rows[0].count,
      onHoldOrders: onHoldOrders.rows[0].count,
      canceledOrders: canceledOrders.rows[0].count,
    });
  } catch (error: any) {
    response.status(404).json({
      message: error.message,
    });
    next(`Error: ${error.message}`);
  }
};

// @access Private
// @desc   get cash info for dashboard
// @route  GET /api/dashboard/cash
const getCashInfo = async (
  request: UserRequest,
  response: Response,
  next: NextFunction
) => {
  try {
    const isAdmin =
      request.user?.roleCode === 'ADMIN' ||
      request.user?.roleCode === 'SUPER_ADMIN';

    if (isAdmin) {
      const readySum = await db.query(
        `
          SELECT
            SUM("readySum")
          FROM
            "${process.env.DB_NAME}".cash;
        `,
        []
      );

      const notReadySum = await db.query(
        `
          SELECT
            SUM("notReadySum")
          FROM
            "${process.env.DB_NAME}".cash;
        `,
        []
      );

      const paidSum = await db.query(
        `
          SELECT
            SUM("paidSum")
          FROM
            "${process.env.DB_NAME}".cash;
        `,
        []
      );

      response.json({
        readySum: readySum.rows.length === 0 ? 0 : readySum.rows[0].sum,
        notReadySum:
          notReadySum.rows.length === 0 ? 0 : notReadySum.rows[0].sum,
        paidSum: paidSum.rows.length === 0 ? 0 : paidSum.rows[0].sum,
      });
      return;
    } else {
      const cash = await db.query(
        `
          SELECT
            "readySum",
            "notReadySum",
            "paidSum"
          FROM
            "${process.env.DB_NAME}".cash
          WHERE
            cash."userId" = $1;
        `,
        [request.user?.id]
      );

      if (cash.rows.length === 0) {
        response.json({
          readySum: 0,
          notReadySum: 0,
          paidSum: 0,
        });
      } else {
        response.json({
          readySum: cash.rows[0].readySum,
          notReadySum: cash.rows[0].notReadySum,
          paidSum: cash.rows[0].paidSum,
        });
      }
    }
  } catch (error: any) {
    response.status(404).json({
      message: error.message,
    });
    next(`Error: ${error.message}`);
  }
};

export { getOrdersInfo, getCashInfo };
