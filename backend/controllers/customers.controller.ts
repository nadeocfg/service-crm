import { NextFunction, Response } from 'express';
import { UserRequest } from '../../frontend/src/models/UserRequestModels';
import db from '../config/db';
import dotenv from 'dotenv';

dotenv.config();

// @desc   get customers list with pagination
// @route  post /api/customers/find
// @access Private
const getCustomersList = async (
  request: UserRequest,
  response: Response,
  next: NextFunction
) => {
  try {
    const { page, count, searchValue } = request.body;

    const customers = await db.query(
      `
        SELECT
          *
        FROM
          "${process.env.DB_NAME}".customers
        WHERE
          "fullName" LIKE $1 OR
          phone LIKE $1 OR
          address LIKE $1 OR
          phone2 LIKE $1
        ORDER BY
          "isActive" DESC,
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
          "${process.env.DB_NAME}".customers
        WHERE
          "fullName" LIKE $1 OR
          phone LIKE $1 OR
          address LIKE $1 OR
          phone2 LIKE $1
      `,
      [`%${searchValue || ''}%`]
    );

    response.json({
      customers: customers.rows,
      total: +total.rows[0].total,
    });
  } catch (error) {
    response.status(404).json({
      message: error.message,
    });
    next(`Error: ${error.message}`);
  }
};

// @desc   create customer
// @route  post /api/customers/create
// @access Private
const createCustomer = async (
  request: UserRequest,
  response: Response,
  next: NextFunction
) => {
  try {
    const { address, email, createdBy, fullName, phone, phone2, boilerSerial } =
      request.body;

    const findExistingCustomer = await db.query(
      `SELECT id FROM "${process.env.DB_NAME}".customers WHERE "boilerSerial" = $1`,
      [boilerSerial]
    );

    if (findExistingCustomer.rowCount > 0) {
      return response.status(400).json({
        message: `Boiler serial ${boilerSerial}, already exist`,
      });
    }

    const insertCustomer = await db.query(
      `
        INSERT INTO
          "${process.env.DB_NAME}".customers(address, email, "createdDate", "updatedDate", "createdBy", "fullName", phone, phone2, "boilerSerial")
        VALUES($1, $2, NOW(), NOW(), $3, $4, $5, $6, $7)
        RETURNING
          *
        `,
      [address, email, createdBy, fullName, phone, phone2, boilerSerial]
    );

    response.json(insertCustomer.rows[0]);
  } catch (error) {
    response.status(404).json({
      message: error.message,
    });
    next(`Error: ${error.message}`);
  }
};

// @desc   update customer
// @route  POST /api/customers/update
// @access Private
const updateCustomer = async (
  request: UserRequest,
  response: Response,
  next: NextFunction
) => {
  try {
    if (
      request.user &&
      request.user.roleCode !== 'ADMIN' &&
      request.user.roleCode !== 'SUPER_ADMIN'
    ) {
      return response.status(401).json({
        message: `Current user don't have permission to this request`,
      });
    }

    const {
      address,
      email,
      fullName,
      id,
      isActive,
      phone,
      phone2,
      boilerSerial,
    } = request.body;

    const query = `
      UPDATE
        "${process.env.DB_NAME}".customers
      SET
        address = $1,
        email = $2,
        "fullName" = $3,
        "isActive" = $4,
        phone = $5,
        phone2 = $6,
        "boilerSerial" = $7,
        "updatedDate" = NOW()
      WHERE
        id = $8
      RETURNING
        *
    `;

    const updateQuery = await db.query(query, [
      address,
      email,
      fullName,
      isActive,
      phone,
      phone2,
      boilerSerial,
      id,
    ]);

    if (updateQuery.rows.length === 0) {
      return response.status(400).json({
        message: `Cannot find customer with id ${id}`,
      });
    }

    response.json(updateQuery.rows[0]);
  } catch (error) {
    response.status(404).json({
      message: error.message,
    });
    next(`Error: ${error.message}`);
  }
};

export { getCustomersList, createCustomer, updateCustomer };
