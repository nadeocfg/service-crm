import { SHA256 } from 'crypto-js';
import { NextFunction, Request, Response } from 'express';
import { UserRequest } from '../../frontend/src/models/UserRequestModels';
import db from '../config/db';
import generateJwt from '../utils/generateToken';

// @desc   auth user
// @route  POST /api/users/auth
// @access Public
const authUser = async (
  request: Request,
  response: Response,
  next: NextFunction
) => {
  try {
    const { login, password } = request.body;
    const cryptedPass = password ? SHA256(password).toString() : '';

    const currentUser = await db.query(
      `
      SELECT
        id,
        login,
        "firstName",
        "lastName",
        "birthDay",
        phone,
        "isAdmin",
        "updatedDate"
      FROM
        "${process.env.DB_NAME}".users
      WHERE
        login = $1 AND password = $2
      `,
      [login, cryptedPass]
    );

    if (currentUser.rows.length > 0) {
      response.json({
        ...currentUser.rows[0],
        token: generateJwt(JSON.stringify(currentUser.rows[0].id)),
      });
    } else {
      response.status(404).json({
        message: `Incorrect login or password`,
      });
    }
  } catch (error) {
    response.status(404).json({
      message: error.message,
    });
    next(`Error: ${error.message}`);
  }
};

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

// @desc   create user
// @route  POST /api/users/all
// @access Private
const createUser = async (
  request: UserRequest,
  response: Response,
  next: NextFunction
) => {
  try {
    const { login, password, firstName, lastName, birthDay, phone } =
      request.body;
    const cryptedPass = password ? SHA256(password).toString() : '';

    const findExistingUser = await db.query(
      `SELECT 1 FROM "${process.env.DB_NAME}".users WHERE login = $1`,
      [login]
    );

    if (findExistingUser.rows.length > 0) {
      return response.status(400).json({
        message: `User with login ${login}, already exist`,
      });
    }

    const insertUser = await db.query(
      `
      INSERT INTO
        "${process.env.DB_NAME}".users(login, password, "firstName", "lastName", "birthDay", phone)
      VALUES($1, $2, $3, $4, $5, $6)
      RETURNING
        *
      `,
      [login, cryptedPass, firstName, lastName, birthDay, phone]
    );

    response.json(insertUser);
  } catch (error) {
    response.status(404).json({
      message: error.message,
    });
    next(`Error: ${error.message}`);
  }
};

export { getAllUsers, createUser, authUser };
