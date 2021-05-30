import { Response, NextFunction } from 'express';
import jwt from 'jsonwebtoken';
import { UserRequest } from '../../frontend/src/models/UserRequestModels';
import db from '../config/db';

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
          id = $1
        `,
        [decoded.id]
      );

      request.user = findUser.rows[0];
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
