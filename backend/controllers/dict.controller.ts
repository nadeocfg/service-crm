import { NextFunction, Request, Response } from 'express';
import db from '../config/db';

// @desc   get active all roles
// @route  GET /api/dicts/roles
// @access Private
const getDictRoles = async (
  request: Request,
  response: Response,
  next: NextFunction
) => {
  try {
    const allRoles = await db.query(
      `
      SELECT
        *
      FROM
        "${process.env.DB_NAME}"."dictRoles"
      `
    );

    response.json(allRoles.rows);
  } catch (error) {
    response.status(404).json({
      message: error.message,
    });
    next(`Error: ${error.message}`);
  }
};

export { getDictRoles };
