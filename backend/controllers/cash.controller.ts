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

export { getCashList };
