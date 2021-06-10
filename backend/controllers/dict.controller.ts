import { NextFunction, Request, Response } from 'express';
import db from '../config/db';

// @desc   get all roles
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

// @desc   create role
// @route  POST /api/dicts/roles/create
// @access Private
const createRole = async (
  request: Request,
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
      `SELECT id FROM "${process.env.DB_NAME}"."dictRoles" WHERE code = $1`,
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
          "updatedDate"
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
// @route  GET /api/dicts/job-types
// @access Private
const getJobTypes = async (
  request: Request,
  response: Response,
  next: NextFunction
) => {
  try {
    const { count, page } = request.query;

    let offset = 0;

    if (page && count) {
      offset = Number(page) * Number(count);
    } else {
      response.status(400).json({
        message: 'Wrong GET params',
      });
    }

    const allJobs = await db.query(
      `
        SELECT
          *
        FROM
          "${process.env.DB_NAME}"."dictJobTypes"
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
      `
    );

    response.json({
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
export { getDictRoles, createRole, getJobTypes };
