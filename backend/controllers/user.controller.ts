import { NextFunction, Request, Response } from 'express';
import db from '../config/db';

// @desc   get all users
// @route  GET /api/users/all
// @access Public
const getAllUsers = async (
  request: Request,
  response: Response,
  next: NextFunction
) => {
  try {
    const allUsers = await db.query(
      `SELECT * FROM "${process.env.DB_NAME}".users`
    );

    response.json(allUsers.rows);
  } catch (error) {
    response.status(404).json({
      message: error.message,
    });
    next(`Error: ${error.message}`);
  }
};

export { getAllUsers };
