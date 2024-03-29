import cryptojs from 'crypto-js';
import express from 'express';
import db from '../config/db';
import generateJwt from '../utils/generateToken';
import getSetString from '../utils/queryBuilders';
import dotenv from 'dotenv';
import format from 'pg-format';
import { UserRequest } from '../../global';

dotenv.config();

// @desc   auth user
// @route  POST /api/users/auth
// @access Public
const authUser = async (
  request: express.Request,
  response: express.Response,
  next: express.NextFunction
) => {
  try {
    const { login, password } = request.body;
    const cryptedPass = password ? cryptojs.SHA256(password).toString() : '';

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
          "percentFromVisit",
          "isActive"
        FROM
          "${process.env.DB_NAME}".users
        WHERE
          login = $1 AND password = $2
      `,
      [login, cryptedPass]
    );

    if (currentUser.rowCount > 0 && currentUser.rows[0].isActive === false) {
      return response.status(400).json({
        message: `User is not active`,
      });
    }

    if (currentUser.rowCount === 0) {
      return response.status(404).json({
        message: `Incorrect login or password`,
      });
    }

    const userRole = await db.query(
      `
        SELECT
          code as "roleCode",
          name as "roleName"
        FROM
          "${process.env.DB_NAME}"."dictRoles"
        WHERE
          id = $1
      `,
      [currentUser.rows[0].roleId]
    );

    response.json({
      ...currentUser.rows[0],
      ...userRole.rows[0],
      token: generateJwt(JSON.stringify(currentUser.rows[0].id)),
    });
  } catch (error: any) {
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
  request: express.Request,
  response: express.Response,
  next: express.NextFunction
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
  } catch (error: any) {
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
  request: express.Request,
  response: express.Response,
  next: express.NextFunction
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
  } catch (error: any) {
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
  response: express.Response,
  next: express.NextFunction
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
      tgAccount,
      chatId,
    } = request.body;
    const cryptedPass = password ? cryptojs.SHA256(password).toString() : '';

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
        "${process.env.DB_NAME}".users(login, "birthDay", password, phone, "createdDate", "updatedDate", "fullName", "roleId", "percentFromJob", "percentFromParts", "percentFromVisit", "chatId", "tgAccount")
      VALUES($1, $2, $3, $4, NOW(), NOW(), $5, $6, $7, $8, $9, $10, $11)
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
        "percentFromVisit",
        "chatId",
        "tgAccount"
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
        chatId,
        tgAccount,
      ]
    );

    response.json(insertUser.rows[0]);
  } catch (error: any) {
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
  response: express.Response,
  next: express.NextFunction
) => {
  try {
    const { password } = request.body;
    const userId = request.params.id;
    const cryptedPass = password ? cryptojs.SHA256(password).toString() : '';

    if (
      request.user &&
      request.user.roleCode !== 'ADMIN' &&
      request.user.roleCode !== 'SUPER_ADMIN'
    ) {
      return response.status(401).json({
        message: `Current user don't have permission to this request`,
      });
    }

    const values: (string | boolean)[] = Object.keys(request.body).map(
      (key: string) => {
        if (
          key === 'id' ||
          key === 'createdDate' ||
          key === 'updatedDate' ||
          key === 'login'
        ) {
          return false;
        }

        if (
          (key === 'percentFromJob' ||
            key === 'percentFromParts' ||
            key === 'percentFromVisit') &&
          !request.body[key]
        ) {
          return false;
        }

        if (key === 'password') {
          return cryptedPass ? cryptedPass : false;
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
        "percentFromVisit",
        "chatId",
        "tgAccount"
    `;

    const insertUser = await db.query(
      query,
      values.filter((el) => !!el && el !== 'null')
    );

    if (insertUser.rows.length === 0) {
      return response.status(400).json({
        message: `Cannot find user with id ${userId}`,
      });
    }

    response.json(insertUser.rows[0]);
  } catch (error: any) {
    response.status(404).json({
      message: error.message,
    });
    next(`Error: ${error.message}`);
  }
};

// @desc   Get user by token
// @route  GET /api/users/profile
// @access Private
const getUserByToken = async (
  request: UserRequest,
  response: express.Response,
  next: express.NextFunction
) => {
  try {
    response.status(200);
    response.json({
      ...request.user,
      token: generateJwt(JSON.stringify(request.user?.id || '')),
    });
  } catch (error: any) {
    response.status(404).json({
      message: error.message,
    });
    next(`Error: ${error.message}`);
  }
};

// @desc   Get users with search params
// @route  POST /api/users/find
// @access Private
const findUsers = async (
  request: UserRequest,
  response: express.Response,
  next: express.NextFunction
) => {
  try {
    const {
      page,
      count,
      searchValue,
      roleCode,
      sort = 'id,desc',
    } = request.body;
    const sortBy = (<string>sort).split(',')[0];
    const order = (<string>sort).split(',')[1];

    if (roleCode) {
      const findRoleId = await db.query(
        `
          SELECT
            *
          FROM
            "${process.env.DB_NAME}"."dictRoles"
          WHERE
            code = $1
        `,
        [roleCode]
      );

      if (findRoleId.rowCount === 0) {
        response.status(404).json({
          message: `Cannot find role ${roleCode}`,
        });
      }

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
            "tgAccount",
            "isActive"
          FROM
            "${process.env.DB_NAME}".users
          WHERE
            ("isActive" = true AND "roleId" = $4) AND
            (LOWER("login") LIKE $1 OR
            LOWER("fullName") LIKE $1 OR
            LOWER("phone") LIKE $1)
          ORDER BY
            ${format('%I', sortBy)} ${format('%s', order)}
          LIMIT
            $2
          OFFSET
            $3;
        `,
        [`%${searchValue || ''}%`, count, page * count, findRoleId.rows[0].id]
      );

      const total = await db.query(
        `
          SELECT
            count(*) AS total
          FROM
            "${process.env.DB_NAME}".users
          WHERE
            ("isActive" = true AND "roleId" = $2) AND
            (LOWER("login") LIKE $1 OR
            LOWER("fullName") LIKE $1 OR
            LOWER("phone") LIKE $1)
        `,
        [`%${searchValue || ''}%`.toLowerCase(), findRoleId.rows[0].id]
      );

      return response.json({
        users: users.rows,
        total: +total.rows[0].total,
      });
    }

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
          "tgAccount",
          "isActive",
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
            users."isActive",
            users."tgAccount" as "tgAccount",
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
          LOWER("login") LIKE $1 OR
          id::text LIKE $1 OR
          LOWER("fullName") LIKE $1 OR
          LOWER("phone") LIKE $1
        ORDER BY
          ${format('%I', sortBy)} ${format('%s', order)}
        LIMIT
          $2
        OFFSET
          $3;
      `,
      [`%${searchValue || ''}%`.toLowerCase(), count, page * count]
    );

    const total = await db.query(
      `
        SELECT
          count(*) AS total
        FROM
          "${process.env.DB_NAME}".users
        WHERE
          LOWER("login") LIKE $1 OR
          LOWER("fullName") LIKE $1 OR
          LOWER("phone") LIKE $1
      `,
      [`%${searchValue || ''}%`.toLowerCase()]
    );

    response.json({
      users: users.rows,
      total: +total.rows[0].total,
    });
  } catch (error: any) {
    response.status(404).json({
      message: error.message,
    });
    next(`Error: ${error.message}`);
  }
};

// @desc   Get user by id
// @route  GET /api/users/:id
// @access Private
const getUserById = async (
  request: UserRequest,
  response: express.Response,
  next: express.NextFunction
) => {
  try {
    const { id } = request.params;

    const findUser = await db.query(
      `
        SELECT
          id,
          login,
          "fullName",
          "birthDay",
          phone,
          "roleId",
          "isActive",
          "percentFromJob",
          "percentFromParts",
          "percentFromVisit",
          "chatId",
          "tgAccount"
        FROM
          "${process.env.DB_NAME}".users
        WHERE
          id = $1
      `,
      [id]
    );

    if (findUser.rowCount === 0) {
      return response.status(400).json({
        message: `Cannot find user with id ${id}`,
      });
    }

    response.json({
      ...findUser.rows[0],
    });
  } catch (error: any) {
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
  getUserById,
};
