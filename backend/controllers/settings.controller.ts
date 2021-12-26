import { NextFunction, Request, Response } from 'express';
import { UserRequest } from '../../frontend/src/models/UserRequestModels';
import db from '../config/db';
import dotenv from 'dotenv';

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

export { getSettings };
