import { Response, NextFunction } from 'express';
import jwt from 'jsonwebtoken';
import db from '../config/db';
import dotenv from 'dotenv';
import { UserRequest } from '../../global';

dotenv.config();

const protect = async (
  request: UserRequest,
  response: Response,
  next: NextFunction
) => {
  let token = null;

  if (
    request.headers.authorization &&
    request.headers.authorization.startsWith('Bearer')
  ) {
    try {
      token = request.headers.authorization.slice(7);

      const decoded: any = jwt.verify(token, process.env.JWT_SECRET || '');

      const findUser = await db.query(
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
          id = $1
        `,
        [decoded.id]
      );

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
        [findUser.rows[0].roleId]
      );

      request.user = {
        ...findUser.rows[0],
        ...userRole.rows[0],
      };
    } catch {
      response.status(401);
      next(new Error('Invalid or expired token'));
    }
  }

  if (!request.headers.authorization) {
    response.status(401);
    next(new Error('No token'));
  }

  next();
};

export { protect };
