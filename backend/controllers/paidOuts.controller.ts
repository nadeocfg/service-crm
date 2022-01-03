import { NextFunction, Request, Response } from 'express';
import { UserRequest } from '../../frontend/src/models/UserRequestModels';
import db from '../config/db';
import dotenv from 'dotenv';
import moment from 'moment';

dotenv.config();

// @desc   get paid outs with filter
// @route  GET /api/paids/list
// @access Private
const getPaidsByUser = async (
  request: UserRequest,
  response: Response,
  next: NextFunction
) => {
  try {
    const userId = request.user?.id;
    const { count, page, searchValue } = request.query;

    let offset = 0;

    if (page && count) {
      offset = Number(page) * Number(count);
    } else {
      return response.status(400).json({
        message: 'Wrong GET params',
      });
    }

    if (!userId) {
      return response.status(400).json({
        message: 'Cannot find user id',
      });
    }

    let getPaidsByUser = null;

    if (
      request.user?.roleCode === 'ADMIN' ||
      request.user?.roleCode === 'SUPER_ADMIN'
    ) {
      getPaidsByUser = await db.query(
        `
          SELECT
            paids.*,
            users."fullName" as "fullName",
            orders."doneDate"
          FROM
            "${process.env.DB_NAME}"."serviceManPaidOuts" as paids
          LEFT JOIN
            "${process.env.DB_NAME}"."users" as users
          ON
            users.id = paids."userId"
          LEFT JOIN
            "${process.env.DB_NAME}"."orders" as orders
          ON
            orders.id = paids."orderId"
          WHERE
            orders."status" = (
              SELECT
                status.id
              FROM
                "${process.env.DB_NAME}"."dictOrderStatuses" as status
              WHERE
                status.code = 'DONE'
            )
            ${
              searchValue
                ? 'AND (paids.id::text LIKE $3 OR users."fullName" like $3 OR paids."orderId"::text like $3)'
                : ''
            }
          ORDER BY
            paids.id DESC
          LIMIT
            $1
          OFFSET
            $2;
        `,
        searchValue ? [count, offset, `%${searchValue}%`] : [count, offset]
      );
    } else {
      getPaidsByUser = await db.query(
        `
          SELECT
            paids.*,
            users."fullName" as "fullName",
            orders."doneDate"
          FROM
            "${process.env.DB_NAME}"."serviceManPaidOuts" as paids
          LEFT JOIN
            "${process.env.DB_NAME}"."users" as users
          ON
            users.id = paids."userId"
          LEFT JOIN
            "${process.env.DB_NAME}"."orders" as orders
          ON
            orders.id = paids."orderId"
          WHERE
            paids."userId" = $3 AND
            orders."status" = (
              SELECT
                status.id
              FROM
                "${process.env.DB_NAME}"."dictOrderStatuses" as status
              WHERE
                status.code = 'DONE'
            )
            ${
              searchValue
                ? 'AND (paids.id::text LIKE $4 OR users."fullName" like $4 OR paids."orderId"::text like $4)'
                : ''
            }
          ORDER BY
            paids.id DESC
          LIMIT
            $1
          OFFSET
            $2;
        `,
        searchValue
          ? [count, offset, userId, `%${searchValue}%`]
          : [count, offset, userId]
      );
    }

    const getPaidOutTerm = await db.query(
      `
        SELECT
          *
        FROM
          "${process.env.DB_NAME}"."utils"
        WHERE
          name = $1;
      `,
      ['paidOutTerm']
    );

    const resultArr = getPaidsByUser.rows.reduce((acc, item) => {
      acc.push({
        id: item.id,
        sum: +item.job + +item.parts + +item.visit,
        orderId: item.orderId,
        userId: item.userId,
        fullName: item.fullName,
        updatedDate: item.updatedDate,
        createdDate: item.createdDate,
        isPaid: item.isPaid,
        canBePaid:
          moment(new Date()).diff(
            moment(item.doneDate || new Date()),
            'days'
          ) >= (getPaidOutTerm.rows[0].value || 15),
      });

      return acc;
    }, []);

    let total = null;

    if (
      request.user?.roleCode === 'ADMIN' ||
      request.user?.roleCode === 'SUPER_ADMIN'
    ) {
      total = await db.query(
        `
          SELECT
            count(*) AS total
          FROM
            "${process.env.DB_NAME}"."serviceManPaidOuts";
        `
      );
    } else {
      total = await db.query(
        `
          SELECT
            count(*) AS total
          FROM
            "${process.env.DB_NAME}"."serviceManPaidOuts"
          WHERE
            "userId" = $1;
        `,
        [userId]
      );
    }

    response.json({
      paidOutsList: resultArr,
      total: +total.rows[0]?.total || 0,
    });
  } catch (error: any) {
    response.status(400).json({
      message: error.message,
    });
    next(`Error: ${error.message}`);
  }
};

// @desc   move service man paid out to cash table
// @route  POST /api/paids
// @access Private
const paidOut = async (
  request: UserRequest,
  response: Response,
  next: NextFunction
) => {
  try {
    const { paidOutId } = request.body;

    if (!paidOutId) {
      return response.status(400).json({
        message: 'Cannot find paid out id',
      });
    }

    const checkPaid = await db.query(
      `
        SELECT
          *
        FROM
          "${process.env.DB_NAME}"."serviceManPaidOuts"
        WHERE
          id = $1;
      `,
      [paidOutId]
    );

    if (checkPaid.rows.length > 0 && checkPaid.rows[0].isPaid) {
      return response.status(400).json({
        message: `Paid out with id ${paidOutId}, is already paid`,
      });
    }

    const paidOut = await db.query(
      `
        UPDATE
          "${process.env.DB_NAME}"."serviceManPaidOuts"
        SET
          "isPaid" = true,
          "updatedDate" = NOW()
        WHERE
          id = $1
        RETURNING
          *
      `,
      [paidOutId]
    );

    const updateCash = await db.query(
      `
        UPDATE
          "${process.env.DB_NAME}"."cash"
        SET
          "readySum" = "readySum" + $1,
          "notReadySum" = "notReadySum" - $1,
          "updatedDate" = NOW()
        WHERE
          "userId" = $2
        RETURNING
          *
      `,
      [
        +paidOut.rows[0].parts + +paidOut.rows[0].job + +paidOut.rows[0].visit,
        checkPaid.rows[0].userId,
      ]
    );

    response.json({
      ...paidOut.rows[0],
    });
  } catch (error: any) {
    response.status(400).json({
      message: error.message,
    });
    next(`Error: ${error.message}`);
  }
};

export { getPaidsByUser, paidOut };
