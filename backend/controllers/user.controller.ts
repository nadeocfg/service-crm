import { SHA256 } from 'crypto-js';
import { NextFunction, Request, Response } from 'express';
import { UserRequest } from '../../frontend/src/models/UserRequestModels';
import db from '../config/db';
import generateJwt from '../utils/generateToken';
import getSetString from '../utils/queryBuilders';

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
        "updatedDate",
        "createdDate"
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

// @desc   get active all users
// @route  GET /api/users/all-active
// @access Private
const getAllActiveUsers = async (
  request: Request,
  response: Response,
  next: NextFunction
) => {
  try {
    const allUsers = await db.query(
      `
      SELECT
        *
      FROM
        "${process.env.DB_NAME}".users
      WHERE
        "isActive" = true
      `
    );

    response.json(allUsers.rows);
  } catch (error) {
    response.status(404).json({
      message: error.message,
    });
    next(`Error: ${error.message}`);
  }
};

// @desc   get all inactive users
// @route  GET /api/users/all-inactive
// @access Private
const getAllInactiveUsers = async (
  request: Request,
  response: Response,
  next: NextFunction
) => {
  try {
    const allUsers = await db.query(
      `
      SELECT
        *
      FROM
        "${process.env.DB_NAME}".users
      WHERE
        "isActive" = false
      `
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
// @route  POST /api/users/create
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
        "${process.env.DB_NAME}".users(login, password, "firstName", "lastName", "birthDay", phone, "createdDate", "updatedDate")
      VALUES($1, $2, $3, $4, $5, $6, NOW(), NOW())
      RETURNING
        id, login, "firstName", "lastName", "birthDay", phone, "createdDate", "updatedDate"
      `,
      [login, cryptedPass, firstName, lastName, birthDay, phone]
    );

    response.json(insertUser.rows[0]);
  } catch (error) {
    response.status(400).json({
      message: error.message,
    });
    next(`Error: ${error.message}`);
  }
};

// @desc   update user
// @route  POST /api/users/update
// @access Private
const updateUser = async (
  request: UserRequest,
  response: Response,
  next: NextFunction
) => {
  try {
    const { password } = request.body;
    const userId = request.params.id;
    const cryptedPass = password ? SHA256(password).toString() : '';

    if (request.user && !request.user.isAdmin) {
      return response.status(401).json({
        message: `Current user don't have permission to this request`,
      });
    }

    const values = Object.keys(request.body).map(function (key) {
      if (key === 'password') {
        return cryptedPass;
      }

      if (key !== 'login') {
        return String(request.body[key]);
      }
    });
    values.push(userId);

    const query = `
    UPDATE
      "${process.env.DB_NAME}".users
    SET
      ${getSetString(request.body)}
    RETURNING
      id,
      login,
      "firstName",
      "lastName",
      "birthDay",
      phone,
      "isAdmin",
      "isActive"
    `;

    console.log(query);

    const insertUser = await db.query(
      query,
      values.filter((el) => !!el)
    );

    if (insertUser.rows.length === 0) {
      return response.status(400).json({
        message: `Cannot find user with id ${userId}`,
      });
    }

    response.json(insertUser.rows[0]);
  } catch (error) {
    response.status(404).json({
      message: error.message,
    });
    next(`Error: ${error.message}`);
  }
};

// @desc   Get user by token
// @route  GET /api/users/profile
// @access Private
const getUserByToken = (
  request: UserRequest,
  response: Response,
  next: NextFunction
) => {
  try {
    response.status(200);
    response.json({
      ...request.user,
      token: generateJwt(JSON.stringify(request.user.id)),
    });
  } catch (error) {
    response.status(404).json({
      message: error.message,
    });
    next(`Error: ${error.message}`);
  }
};

// @desc   Get users with serach params
// @route  POST /api/users/find
// @access Private
const findUsers = async (
  request: UserRequest,
  response: Response,
  next: NextFunction
) => {
  try {
    const { page, count, searchValue } = request.body;

    let field = '';
    if (!searchValue) {
      field = '';
    } else {
      field = searchValue;
    }

    const users = await db.query(
      `
      SELECT
        id, login, "firstName", "lastName", "birthDay", phone, "createdDate", "updatedDate", "isActive"
      FROM
        "${process.env.DB_NAME}".users
      WHERE
        login LIKE $1 OR
        "firstName" LIKE $1 OR
        "lastName" LIKE $1 OR
        phone LIKE $1
      ORDER BY
        id
      LIMIT
        $2
      OFFSET
        $3
      `,
      [`%${field}%`, count, page * count]
    );

    const total = await db.query(
      `
      SELECT
        count(*) AS total
      FROM
        "${process.env.DB_NAME}".users
      WHERE
        login LIKE $1 OR
        'firstName' LIKE $1 OR
        'lastName' LIKE $1 OR
        phone LIKE $1
      `,
      [`%${field}%`]
    );

    response.json({
      users: users.rows,
      total: +total.rows[0].total,
    });
  } catch (error) {
    response.status(404).json({
      message: error.message,
    });
    next(`Error: ${error.message}`);
  }
};

export {
  getAllActiveUsers,
  getAllInactiveUsers,
  createUser,
  authUser,
  updateUser,
  getUserByToken,
  findUsers,
};
