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
        "fullName",
        "birthDay",
        phone,
        "roleId",
        "updatedDate",
        "createdDate",
        "percentFromJob",
        "percentFromParts",
        "percentFromVisit"
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
        id,
        login,
        "fullName",
        "birthDay",
        phone,
        "roleId",
        "updatedDate",
        "createdDate",
        "percentFromJob",
        "percentFromParts",
        "percentFromVisit"
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
        id,
        login,
        "fullName",
        "birthDay",
        phone,
        "roleId",
        "updatedDate",
        "createdDate",
        "percentFromJob",
        "percentFromParts",
        "percentFromVisit"
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
    const {
      login,
      birthDay,
      password,
      phone,
      fullName,
      roleId,
      percentFromJob,
      percentFromParts,
      percentFromVisit,
    } = request.body;
    const cryptedPass = password ? SHA256(password).toString() : '';

    const findExistingUser = await db.query(
      `SELECT id FROM "${process.env.DB_NAME}".users WHERE login = $1`,
      [login]
    );

    if (findExistingUser.rowCount > 0) {
      return response.status(400).json({
        message: `User with login ${login}, already exist`,
      });
    }

    const insertUser = await db.query(
      `
      INSERT INTO
        "${process.env.DB_NAME}".users(login, "birthDay", password, phone, "createdDate", "updatedDate", "fullName", "roleId", "percentFromJob", "percentFromParts", "percentFromVisit")
      VALUES($1, $2, $3, $4, NOW(), NOW(), $5, $6, $7, $8, $9)
      RETURNING
        id,
        login,
        "birthDay",
        phone,
        "createdDate",
        "updatedDate",
        "fullName",
        "roleId",
        "percentFromJob",
        "percentFromParts",
        "percentFromVisit"
      `,
      [
        login,
        birthDay,
        cryptedPass,
        phone,
        fullName,
        roleId,
        percentFromJob,
        percentFromParts,
        percentFromVisit,
      ]
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

    if (request.user && ![1, 2].includes(request.user.roleId)) {
      return response.status(401).json({
        message: `Current user don't have permission to this request`,
      });
    }

    const values: (string | boolean)[] = Object.keys(request.body).map(
      function (key) {
        if (
          key === 'id' ||
          key === 'createdDate' ||
          key === 'updatedDate' ||
          key === 'login'
        ) {
          return false;
        }

        if (key === 'password') {
          return cryptedPass;
        }

        return String(request.body[key]);
      }
    );
    values.push(userId);

    const query = `
    UPDATE
      "${process.env.DB_NAME}".users
    SET
      ${getSetString(request.body)}
    RETURNING
      id,
      login,
      "birthDay",
      phone,
      "createdDate",
      "updatedDate",
      "fullName",
      "roleId",
      "percentFromJob",
      "percentFromParts",
      "percentFromVisit"
    `;

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

    const users = await db.query(
      `
      SELECT
        id,
        login,
        "birthDay",
        phone,
        "createdDate",
        "updatedDate",
        "fullName",
        "roleId",
        "percentFromJob",
        "percentFromParts",
        "percentFromVisit",
        "roleName",
        "roleCode"
      FROM
        (
        SELECT
          users.id,
          users.login,
          users."birthDay",
          users.phone,
          users."createdDate",
          users."updatedDate",
          users."fullName",
          users."roleId",
          users."percentFromJob",
          users."percentFromParts",
          users."percentFromVisit",
          roles.name as "roleName",
          roles.code as "roleCode"
        FROM
          "${process.env.DB_NAME}".users as users
        LEFT JOIN
          "${process.env.DB_NAME}"."dictRoles" as roles
        ON
          users."roleId" = roles.id
        ) as Users
      WHERE
        login LIKE $1 OR
        "fullName" LIKE $1 OR
        phone LIKE $1
      ORDER BY
        id
      LIMIT
        $2
      OFFSET
        $3;
      `,
      [`%${searchValue || ''}%`, count, page * count]
    );

    const total = await db.query(
      `
      SELECT
        count(*) AS total
      FROM
        "${process.env.DB_NAME}".users
      WHERE
        login LIKE $1 OR
        "fullName" LIKE $1 OR
        phone LIKE $1
      `,
      [`%${searchValue || ''}%`]
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
