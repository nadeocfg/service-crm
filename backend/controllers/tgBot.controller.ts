import { NextFunction, Response } from 'express';
import moment from 'moment';
import { UserRequest } from '../../frontend/src/models/UserRequestModels';
import db from '../config/db';
import dotenv from 'dotenv';
import axios from 'axios';

dotenv.config();

// @desc   send update order status message to telegram bot
// @route  POST /api/tg/update-order-status
// @access Private
const sendUpdateOrderStatusMessage = async (
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

    const serviceManId = await db.query(
      `
        SELECT
          orders."serviceManId"
        FROM
          "${process.env.DB_NAME}"."orders" as orders
        WHERE
          orders."id" = $1;
      `,
      [orderId]
    );

    const getUsers = await db.query(
      `
        SELECT
          *
        FROM
          "${process.env.DB_NAME}"."users" as users
        WHERE
          users.id = $1 OR
          users."roleId" = (SELECT id FROM "service-crm"."dictRoles" WHERE code = 'ADMIN') OR
          users."roleId" = (SELECT id FROM "service-crm"."dictRoles" WHERE code = 'SUPER_ADMIN');
      `,
      [serviceManId.rows[0].serviceManId]
    );

    const text = `<b>Смена статуса завки №${orderId}</b>\n\nНовый статус: "${
      getStatusInfo.rows[0].name
    }"\nКомментарий: ${comment}\nДата: ${moment(new Date())
      .utcOffset('+06:00')
      .format('DD.MM.YYYY HH:mm:ss')}\n`;

    let result: any = [];
    const url = `http://crm.z-star.kz/orders/view/${orderId}`;

    for (let i = 0; i < getUsers.rows.length; i += 1) {
      result.push({
        name: getUsers.rows[i].fullName,
        sent: false,
      });

      if (getUsers.rows[i].chatId) {
        const data = {
          chat_id: getUsers.rows[i].chatId,
          parse_mode: 'html',
          reply_markup: {
            inline_keyboard: [
              [
                {
                  text: 'Показать заявку',
                  url: url,
                },
              ],
            ],
          },
          text,
        };

        const sendMessage = await axios
          .post(
            `https://api.telegram.org/bot${process.env.TG_TOKEN}/sendMessage`,
            data
          )
          .then((res) => {
            result[i].sent = true;
            return true;
          })
          .catch((err) => {
            result[i].sent = false;
            return err;
          });
      }
    }

    response.json({
      result,
    });
  } catch (error: any) {
    response.status(400).json(error.response?.data || 'Неизвестная ошибка');
    next(`Error: ${error.message}`);
  }
};

// @desc   send create order message to telegram bot
// @route  POST /api/tg/create-order
// @access Private
const sendCreateOrderMessage = async (
  request: UserRequest,
  response: Response,
  next: NextFunction
) => {
  try {
    const { comment, id } = request.body;

    const serviceManId = await db.query(
      `
        SELECT
          orders."serviceManId",
          orders."id"
        FROM
          "${process.env.DB_NAME}"."orders" as orders
        WHERE
          orders."id" = $1;
      `,
      [id]
    );

    const getServiceMan = await db.query(
      `
        SELECT
          *
        FROM
          "${process.env.DB_NAME}"."users" as users
        WHERE
          users.id = $1;
      `,
      [serviceManId.rows[0].serviceManId]
    );

    const getUsers = await db.query(
      `
        SELECT
          *
        FROM
          "${process.env.DB_NAME}"."users" as users
        WHERE
          users.id = $1 OR
          users."roleId" = (SELECT id FROM "service-crm"."dictRoles" WHERE code = 'ADMIN') OR
          users."roleId" = (SELECT id FROM "service-crm"."dictRoles" WHERE code = 'SUPER_ADMIN');
      `,
      [serviceManId.rows[0].serviceManId]
    );

    const text = `<b>Новая заявка №${
      serviceManId.rows[0].id
    }</b>\n\nНазначена на:\n${getServiceMan.rows[0].fullName}(@${
      getServiceMan.rows[0].tgAccount
    })\nКомментарий: ${comment}\nДата: ${moment(new Date())
      .utcOffset('+06:00')
      .format('DD.MM.YYYY HH:mm:ss')}`;

    let result: any = [];
    const url = `http://crm.z-star.kz/orders/view/${request.body.id}`;

    for (let i = 0; i < getUsers.rows.length; i += 1) {
      result.push({
        name: getUsers.rows[i].fullName,
        sent: false,
      });

      if (getUsers.rows[i].chatId) {
        const data = {
          chat_id: getUsers.rows[i].chatId,
          parse_mode: 'html',
          reply_markup: {
            inline_keyboard: [
              [
                {
                  text: 'Показать заявку',
                  url: url,
                },
              ],
            ],
          },
          text,
        };

        const sendMessage = await axios
          .post(
            `https://api.telegram.org/bot${process.env.TG_TOKEN}/sendMessage`,
            data
          )
          .then((res) => {
            result[i].sent = true;
            return true;
          })
          .catch((err) => {
            result[i].sent = false;
            return err;
          });
      }
    }

    response.json({
      result,
    });
  } catch (error: any) {
    response.status(400).json(error.response?.data || 'Неизвестная ошибка');
    next(`Error: ${error.message}`);
  }
};

// @desc   send update order message to telegram bot
// @route  POST /api/tg/update-order
// @access Private
const sendUpdateOrderMessage = async (
  request: UserRequest,
  response: Response,
  next: NextFunction
) => {
  try {
    const { comment, id } = request.body;

    const serviceManId = await db.query(
      `
        SELECT
          orders."serviceManId",
          orders."id"
        FROM
          "${process.env.DB_NAME}"."orders" as orders
        WHERE
          orders."id" = $1;
      `,
      [id]
    );

    const getServiceMan = await db.query(
      `
        SELECT
          *
        FROM
          "${process.env.DB_NAME}"."users" as users
        WHERE
          users.id = $1;
      `,
      [serviceManId.rows[0].serviceManId]
    );

    const getUsers = await db.query(
      `
        SELECT
          *
        FROM
          "${process.env.DB_NAME}"."users" as users
        WHERE
          users.id = $1 OR
          users."roleId" = (SELECT id FROM "service-crm"."dictRoles" WHERE code = 'ADMIN') OR
          users."roleId" = (SELECT id FROM "service-crm"."dictRoles" WHERE code = 'SUPER_ADMIN');
      `,
      [serviceManId.rows[0].serviceManId]
    );

    const text = `<b>Обновление заявки №${
      serviceManId.rows[0].id
    }</b>\n\nНазначена на:\n${getServiceMan.rows[0].fullName}(@${
      getServiceMan.rows[0].tgAccount
    })\nКомментарий: ${comment}\nДата: ${moment(new Date())
      .utcOffset('+06:00')
      .format('DD.MM.YYYY HH:mm:ss')}`;

    let result: any = [];
    const url = `http://crm.z-star.kz/orders/view/${id}`;

    for (let i = 0; i < getUsers.rows.length; i += 1) {
      result.push({
        name: getUsers.rows[i].fullName,
        sent: false,
      });

      if (getUsers.rows[i].chatId) {
        const data = {
          chat_id: getUsers.rows[i].chatId,
          parse_mode: 'HTML',
          reply_markup: {
            inline_keyboard: [
              [
                {
                  text: 'Показать заявку',
                  url: url,
                },
              ],
            ],
          },
          text,
        };

        const sendMessage = await axios
          .post(
            `https://api.telegram.org/bot${process.env.TG_TOKEN}/sendMessage`,
            data
          )
          .then((res) => {
            result[i].sent = true;
            return true;
          })
          .catch((err) => {
            result[i].sent = false;
            return err;
          });
      }
    }

    response.json({
      result,
    });
  } catch (error: any) {
    response.status(400).json(error.response?.data || 'Неизвестная ошибка');
    next(`Error: ${error.message}`);
  }
};

export {
  sendUpdateOrderStatusMessage,
  sendCreateOrderMessage,
  sendUpdateOrderMessage,
};
