import { NextFunction, Request, Response } from 'express';
import moment from 'moment';
import { UserRequest } from '../../frontend/src/models/UserRequestModels';
import db from '../config/db';
import dotenv from 'dotenv';
import axios from 'axios';

dotenv.config();

// @desc   send update order message to telegram bot
// @route  POST /api/tg/update-order
// @access Private
const sendUpdateOrderMessage = async (
  request: UserRequest,
  response: Response,
  next: NextFunction
) => {
  try {
    const { comment, orderId, code } = request.body;

    const getStatusInfo = await db.query(
      `
        SELECT
          *
        FROM
          "${process.env.DB_NAME}"."dictOrderStatuses" as status
        WHERE
          status.code = $1;
      `,
      [code]
    );

    const text = `<b>Смена статуса завки №${orderId}</b>\n\nНовый статус: "${
      getStatusInfo.rows[0].name
    }"\nКомментарий: ${comment}\nДата: ${moment(new Date())
      .utcOffset('+06:00')
      .format('DD.MM.YYYY HH:mm:ss')}\n`;

    const data = {
      chat_id: '213781013',
      parse_mode: 'html',
      text,
    };

    const result = await axios
      .post(
        `https://api.telegram.org/bot${process.env.TG_TOKEN}/sendMessage`,
        data
      )
      .then((res) => {
        return true;
      })
      .catch((err) => {
        return err;
      });

    if (result !== true) {
      throw result;
    }

    response.json({
      result,
    });
  } catch (error: any) {
    response.status(400).json(error.response.data);
    next(`Error: ${error.message}`);
  }
};

export { sendUpdateOrderMessage };
