import { NextFunction, Request, Response } from 'express';
import db from '../config/db';
import dotenv from 'dotenv';
import { UserRequest } from '../../global';
import { SettingsItem } from '../../frontend/src/models/storeModel';
import format from 'pg-format';

dotenv.config();

// @desc   get settings
// @route  GET /api/settings
// @access Private
const getSettings = async (
  request: UserRequest,
  response: Response,
  next: NextFunction
) => {
  try {
    const getSettings = await db.query(
      `
        SELECT
          *
        FROM
          "${process.env.DB_NAME}"."utils";
      `
    );

    response.json(getSettings.rows);
  } catch (error: any) {
    response.status(404).json({
      message: error.message,
    });
    next(`Error: ${error.message}`);
  }
};

// @desc   set settings
// @route  POST /api/settings
// @access Private
const setSettings = async (
  request: UserRequest,
  response: Response,
  next: NextFunction
) => {
  try {
    const { settings } = request.body;
    const currentTimestamp = format('%s', 'NOW()');

    const setSettings = await db.query(
      `
        UPDATE
          "${process.env.DB_NAME}"."utils" as u set -- postgres FTW
        value = u2.value,
        "updatedDate" = u2.updateDate
        FROM
          (values
            ${settings
              .map((item: SettingsItem) => {
                return `(${item.id}, ${item.value}, ${currentTimestamp})`;
              })
              .join(', ')}
          ) as u2(id, value, updateDate)
        WHERE
          u2.id = u.id
        RETURNING
          *;
      `
    );

    response.json(setSettings.rows);
  } catch (error: any) {
    console.log(error);
    response.status(404).json({
      message: error.message,
    });
    next(`Error: ${error.message}`);
  }
};

export { getSettings, setSettings };
