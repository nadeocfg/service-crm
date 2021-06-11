import { NextFunction, Request, Response } from 'express';
import { UserRequest } from '../../frontend/src/models/UserRequestModels';
import db from '../config/db';

// @desc   get all roles
// @route  GET /api/dicts/roles
// @access Private
const getDictRoles = async (
  request: UserRequest,
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
        WHERE
          "isActive" = true;
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

// @desc   create role
// @route  POST /api/dicts/roles/create
// @access Private
const createRole = async (
  request: UserRequest,
  response: Response,
  next: NextFunction
) => {
  try {
    const { code, name }: { code: string; name: string } = request.body;

    if (!code || !name) {
      return response.status(400).json({
        message: `Missing values, code or name`,
      });
    }

    const findExistingRole = await db.query(
      `SELECT id FROM "${process.env.DB_NAME}"."dictRoles" WHERE code = $1;`,
      [code.toUpperCase()]
    );

    if (findExistingRole.rowCount > 0) {
      return response.status(400).json({
        message: `Role with code: ${code}, already exist`,
      });
    }

    const insertRole = await db.query(
      `
        INSERT INTO
          "${process.env.DB_NAME}"."dictRoles" (code, name, "createdDate", "updatedDate")
        VALUES($1, $2, NOW(), NOW())
        RETURNING
          id,
          code,
          name,
          "createdDate",
          "updatedDate";
      `,
      [code.toUpperCase(), name]
    );

    response.json(insertRole.rows[0]);
  } catch (error) {
    response.status(404).json({
      message: error.message,
    });
    next(`Error: ${error.message}`);
  }
};

// @desc   get job types with pagination
// @route  GET /api/dicts/job-types?count=10&page=1
// @access Private
const getJobTypes = async (
  request: UserRequest,
  response: Response,
  next: NextFunction
) => {
  try {
    const { count, page } = request.query;

    let offset = 0;

    if (page && count) {
      offset = Number(page) * Number(count);
    } else {
      return response.status(400).json({
        message: 'Wrong GET params',
      });
    }

    const allJobs = await db.query(
      `
        SELECT
          *
        FROM
          "${process.env.DB_NAME}"."dictJobTypes"
        WHERE
          "isActive" = true
        ORDER BY
          id
        LIMIT
          $1
        OFFSET
          $2;
      `,
      [count, offset]
    );

    const total = await db.query(
      `
        SELECT
          count(*) AS total
        FROM
          "${process.env.DB_NAME}"."dictJobTypes"
        WHERE
          "isActive" = true;
      `
    );

    response.status(200).json({
      jobTypes: allJobs.rows,
      total: +total.rows[0].total,
    });
  } catch (error) {
    response.status(404).json({
      message: error.message,
    });
    next(`Error: ${error.message}`);
  }
};

// @desc   create job type
// @route  POST /api/dicts/job-types/create
// @access Private
const createJobType = async (
  request: UserRequest,
  response: Response,
  next: NextFunction
) => {
  try {
    const { code, name, monthsOfGuarantee, price, price1, price2, price3 } =
      request.body;
    const createdBy = request.user?.id;

    if (!createdBy) {
      return response.status(400).json({
        message: `Cannot find created user id`,
      });
    }

    const insertJobType = await db.query(
      `
        INSERT INTO
          "${process.env.DB_NAME}"."dictJobTypes" (code, name, price, "createdBy", "monthsOfGuarantee", price1, price2, price3, "createdDate", "updatedDate")
        VALUES($1, $2, $3, $4, $5, $6, $7, $8, NOW(), NOW())
        RETURNING
          id,
          code,
          name,
          "monthsOfGuarantee",
          price,
          price1,
          price2,
          price3,
          "createdBy",
          "createdDate",
          "updatedDate";
      `,
      [
        code.toUpperCase(),
        name,
        price,
        createdBy,
        monthsOfGuarantee,
        price1 || 0,
        price2 || 0,
        price3 || 0,
      ]
    );

    response.json(insertJobType.rows[0]);
  } catch (error) {
    response.status(404).json({
      message: error.message,
    });
    next(`Error: ${error.message}`);
  }
};

// @desc   update job type
// @route  POST /api/dicts/job-types/update
// @access Private
const updateJobType = async (
  request: UserRequest,
  response: Response,
  next: NextFunction
) => {
  try {
    const {
      name,
      price,
      price1,
      price2,
      price3,
      monthsOfGuarantee,
      isActive,
      id,
    } = request.body;

    const updateQuery = await db.query(
      `
        UPDATE
          "${process.env.DB_NAME}"."dictJobTypes"
        SET
          name = $1,
          price = $2,
          price1 = $3,
          price2 = $4,
          price3 = $5,
          "monthsOfGuarantee" = $6,
          "isActive" = $7,
          "updatedDate" = NOW()
        WHERE
          id = $8
        RETURNING
          *
      `,
      [
        name,
        price,
        price1 || 0,
        price2 || 0,
        price3 || 0,
        monthsOfGuarantee,
        isActive,
        id,
      ]
    );

    response.json(updateQuery.rows[0]);
  } catch (error) {
    response.status(404).json({
      message: error.message,
    });
    next(`Error: ${error.message}`);
  }
};

// @desc   get boilers with pagination
// @route  GET /api/dicts/boilers?count=10&page=1
// @access Private
const getBoilers = async (
  request: UserRequest,
  response: Response,
  next: NextFunction
) => {
  try {
    const { count, page } = request.query;

    let offset = 0;

    if (page && count) {
      offset = Number(page) * Number(count);
    } else {
      return response.status(400).json({
        message: 'Wrong GET params',
      });
    }

    const allBoilers = await db.query(
      `
        SELECT
          *
        FROM
          "${process.env.DB_NAME}"."dictBoilers"
        WHERE
          "isActive" = true
        ORDER BY
          id
        LIMIT
          $1
        OFFSET
          $2;
      `,
      [count, offset]
    );

    const total = await db.query(
      `
        SELECT
          count(*) AS total
        FROM
          "${process.env.DB_NAME}"."dictBoilers"
        WHERE
          "isActive" = true;
      `
    );

    response.status(200).json({
      boilers: allBoilers.rows,
      total: +total.rows[0].total,
    });
  } catch (error) {
    response.status(404).json({
      message: error.message,
    });
    next(`Error: ${error.message}`);
  }
};

// @desc   create boiler
// @route  POST /api/dicts/boilers/create
// @access Private
const createBoiler = async (
  request: UserRequest,
  response: Response,
  next: NextFunction
) => {
  try {
    const {
      article,
      name,
      price,
      monthsOfGuarantee,
      quantity,
      price1,
      price2,
      price3,
    } = request.body;
    const createdBy = request.user?.id;

    if (!createdBy) {
      return response.status(400).json({
        message: `Cannot find created user id`,
      });
    }

    const insertBoiler = await db.query(
      `
        INSERT INTO
          "${process.env.DB_NAME}"."dictBoilers" (article, name, price, "monthsOfGuarantee", quantity, price1, price2, price3, "createdDate", "updatedDate", "createdBy")
        VALUES($1, $2, $3, $4, $5, $6, $7, $8, NOW(), NOW(), $9)
        RETURNING
          article,
          name,
          price,
          "monthsOfGuarantee",
          quantity,
          price1,
          price2,
          price3,
          "createdBy",
          "createdDate",
          "updatedDate";
      `,
      [
        article,
        name,
        price,
        monthsOfGuarantee,
        quantity,
        price1 || 0,
        price2 || 0,
        price3 || 0,
        createdBy,
      ]
    );

    response.json(insertBoiler.rows[0]);
  } catch (error) {
    response.status(404).json({
      message: error.message,
    });
    next(`Error: ${error.message}`);
  }
};

// @desc   update boiler
// @route  POST /api/dicts/boilers/update
// @access Private
const updateBoiler = async (
  request: UserRequest,
  response: Response,
  next: NextFunction
) => {
  try {
    const {
      id,
      article,
      name,
      price,
      monthsOfGuarantee,
      quantity,
      price1,
      price2,
      price3,
      isActive,
    } = request.body;

    const updateQuery = await db.query(
      `
        UPDATE
          "${process.env.DB_NAME}"."dictBoilers"
        SET
          article = $1,
          name = $2,
          price = $3,
          "monthsOfGuarantee" = $4,
          quantity = $5,
          price1 = $6,
          price2 = $7,
          price3 = $8,
          "isActive" = $9,
          "updatedDate" = NOW()
        WHERE
          id = $10
        RETURNING
          *
      `,
      [
        article,
        name,
        price,
        monthsOfGuarantee,
        quantity,
        price1 || 0,
        price2 || 0,
        price3 || 0,
        isActive,
        id,
      ]
    );

    response.json(updateQuery.rows[0]);
  } catch (error) {
    response.status(404).json({
      message: error.message,
    });
    next(`Error: ${error.message}`);
  }
};

// @desc   get parts with pagination
// @route  GET /api/dicts/parts?count=10&page=1
// @access Private
const getParts = async (
  request: UserRequest,
  response: Response,
  next: NextFunction
) => {
  try {
    const { count, page } = request.query;

    let offset = 0;

    if (page && count) {
      offset = Number(page) * Number(count);
    } else {
      return response.status(400).json({
        message: 'Wrong GET params',
      });
    }

    const allParts = await db.query(
      `
        SELECT
          *
        FROM
          "${process.env.DB_NAME}"."dictParts"
        WHERE
          "isActive" = true
        ORDER BY
          id
        LIMIT
          $1
        OFFSET
          $2;
      `,
      [count, offset]
    );

    const total = await db.query(
      `
        SELECT
          count(*) AS total
        FROM
          "${process.env.DB_NAME}"."dictParts"
        WHERE
          "isActive" = true;
      `
    );

    response.status(200).json({
      parts: allParts.rows,
      total: +total.rows[0].total,
    });
  } catch (error) {
    response.status(404).json({
      message: error.message,
    });
    next(`Error: ${error.message}`);
  }
};

// @desc   create part
// @route  POST /api/dicts/parts/create
// @access Private
const createPart = async (
  request: UserRequest,
  response: Response,
  next: NextFunction
) => {
  try {
    const {
      article,
      name,
      price,
      monthsOfGuarantee,
      quantity,
      price1,
      price2,
      price3,
    } = request.body;
    const createdBy = request.user?.id;

    if (!createdBy) {
      return response.status(400).json({
        message: `Cannot find created user id`,
      });
    }

    const insertJobType = await db.query(
      `
        INSERT INTO
          "${process.env.DB_NAME}"."dictParts" (article, name, price, "monthsOfGuarantee", quantity, price1, price2, price3, "createdDate", "updatedDate", "createdBy")
        VALUES($1, $2, $3, $4, $5, $6, $7, $8, NOW(), NOW(), $9)
        RETURNING
          article,
          name,
          price,
          "monthsOfGuarantee",
          quantity,
          price1,
          price2,
          price3,
          "createdBy",
          "createdDate",
          "updatedDate";
      `,
      [
        article,
        name,
        price,
        monthsOfGuarantee,
        quantity,
        price1 || 0,
        price2 || 0,
        price3 || 0,
        createdBy,
      ]
    );

    response.json(insertJobType.rows[0]);
  } catch (error) {
    response.status(404).json({
      message: error.message,
    });
    next(`Error: ${error.message}`);
  }
};

// @desc   update part
// @route  POST /api/dicts/parts/update
// @access Private
const updatePart = async (
  request: UserRequest,
  response: Response,
  next: NextFunction
) => {
  try {
    const {
      id,
      article,
      name,
      price,
      monthsOfGuarantee,
      quantity,
      price1,
      price2,
      price3,
      isActive,
    } = request.body;

    const updateQuery = await db.query(
      `
        UPDATE
          "${process.env.DB_NAME}"."dictParts"
        SET
          article = $1,
          name = $2,
          price = $3,
          "monthsOfGuarantee" = $4,
          quantity = $5,
          price1 = $6,
          price2 = $7,
          price3 = $8,
          "isActive" = $9,
          "updatedDate" = NOW()
        WHERE
          id = $10
        RETURNING
          *
      `,
      [
        article,
        name,
        price,
        monthsOfGuarantee,
        quantity,
        price1 || 0,
        price2 || 0,
        price3 || 0,
        isActive,
        id,
      ]
    );

    response.json(updateQuery.rows[0]);
  } catch (error) {
    response.status(404).json({
      message: error.message,
    });
    next(`Error: ${error.message}`);
  }
};

export {
  getDictRoles,
  createRole,
  getJobTypes,
  createJobType,
  updateJobType,
  getBoilers,
  createBoiler,
  updateBoiler,
  getParts,
  createPart,
  updatePart,
};
