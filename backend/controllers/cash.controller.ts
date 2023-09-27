import { NextFunction, Request, Response } from 'express';
import { UserRequest } from '../../frontend/src/models/UserRequestModels';
import db from '../config/db';
import dotenv from 'dotenv';
import format from 'pg-format';

dotenv.config();

// @desc   get cash list
// @route  POST /api/cash
// @access Private
const getCashList = async (
  request: UserRequest,
  response: Response,
  next: NextFunction
) => {
  try {
    const { page, count, searchValue, sort = 'id,desc' } = request.body;
    const sortBy = (<string>sort).split(',')[0];
    const order = (<string>sort).split(',')[1];

    const cashList = await db.query(
      `
        SELECT
          cash.id,
          cash."readySum",
          cash."notReadySum",
          cash."updatedDate",
          cash."paidSum",
          users."fullName"
        FROM
          "${process.env.DB_NAME}".cash as cash
        LEFT JOIN
          "${process.env.DB_NAME}".users as users
        ON
          users.id = cash."userId"
        WHERE
          users."isActive" = true AND
          (LOWER(users."fullName") LIKE $1 OR
          cash.id::text LIKE $1)
        ORDER BY
          ${format('%I', sortBy)} ${format('%s', order)}
        LIMIT
          $2
        OFFSET
          $3;
      `,
      [`%${searchValue || ''}%`.toLowerCase(), count, page * count]
    );

    const total = await db.query(
      `
        SELECT
          count(*) AS total
        FROM
          "${process.env.DB_NAME}".cash as cash
        LEFT JOIN
          "${process.env.DB_NAME}".users as users
        ON
          users.id = cash."userId"
        WHERE
          users."isActive" = true AND
          (LOWER(users."fullName") LIKE $1 OR
          cash.id::text LIKE $1)
      `,
      [`%${searchValue || ''}%`.toLowerCase()]
    );

    response.json({
      cashList: cashList.rows,
      total: +total.rows[0].total,
    });
  } catch (error: any) {
    response.status(404).json({
      message: error.message,
    });
    next(`Error: ${error.message}`);
  }
};

// @desc   pay to service man
// @route  POST /api/cash/pay
// @access Private
const payToServiceMan = async (
  request: UserRequest,
  response: Response,
  next: NextFunction
) => {
  try {
    const { id, requestedAmount } = request.body;

    if (requestedAmount <= 0) {
      return response.status(400).json({
        message: `Выплата не может быть меньше 0`,
      });
    }

    const cashItem = await db.query(
      `
        SELECT
          *
        FROM
          "${process.env.DB_NAME}".cash as cash
        WHERE
          cash.id = $1;
      `,
      [id]
    );

    if (cashItem.rows.length === 0) {
      return response.status(404).json({
        message: `Касса с id:${id} не найдена`,
      });
    }

    if (cashItem.rows[0].readySum < requestedAmount) {
      return response.status(400).json({
        message: `Запрошенная сумма не может быть больше доступной`,
      });
    }

    const updateCashItem = await db.query(
      `
        UPDATE
          "${process.env.DB_NAME}"."cash"
        SET
          "readySum" = "readySum" - $1,
          "paidSum" = "paidSum" + $1,
          "updatedDate" = NOW()
        WHERE
          id = $2
        RETURNING
          *;
      `,
      [requestedAmount, id]
    );

    const insertCashHistory = await db.query(
      `
        INSERT INTO
          "${process.env.DB_NAME}"."cashHistoryLog"("createdBy", "serviceManId", "requestedAmount", "readySumAfter")
        VALUES($1, $2, $3, $4)
        RETURNING
          *;
      `,
      [
        request.user?.id,
        updateCashItem.rows[0].userId,
        requestedAmount,
        updateCashItem.rows[0].readySum,
      ]
    );

    return response.json(updateCashItem.rows[0]);
  } catch (error: any) {
    response.status(404).json({
      message: error.message,
    });
    next(`Error: ${error.message}`);
  }
};

// @desc   Reset paid sum of user
// @route  POST /api/cash/reset-paid-sum
// @access Private
const resetPaidSum = async (
  request: UserRequest,
  response: Response,
  next: NextFunction
) => {
  try {
    const { id } = request.body;

    const cashItem = await db.query(
      `
        SELECT
          *
        FROM
          "${process.env.DB_NAME}".cash as cash
        WHERE
          cash.id = $1;
      `,
      [id]
    );

    if (cashItem.rows.length === 0) {
      return response.status(404).json({
        message: `Касса с id:${id} не найдена`,
      });
    }

    const updateCashItem = await db.query(
      `
        UPDATE
          "${process.env.DB_NAME}"."cash"
        SET
          "paidSum" = 0,
          "updatedDate" = NOW()
        WHERE
          id = $1
        RETURNING
          *;
      `,
      [id]
    );

    return response.json(updateCashItem.rows[0]);
  } catch (error: any) {
    response.status(404).json({
      message: error.message,
    });
    next(`Error: ${error.message}`);
  }
};

export { getCashList, payToServiceMan, resetPaidSum };
