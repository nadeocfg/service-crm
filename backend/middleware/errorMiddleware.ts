import { Request, Response, NextFunction } from 'express';

const notFound = (request: Request, response: Response, next: NextFunction) => {
  const error = new Error(`Not Found - ${request.originalUrl}`);
  response.status(404);
  next(error);
};

const errorHandler = (
  error: any,
  request: Request,
  response: Response,
  next: NextFunction
) => {
  const statusCode = response.statusCode === 200 ? 500 : response.statusCode;
  response.status(statusCode);
  response.json({
    message: error.message,
    stack: process.env.NODE_ENV === 'production' ? null : error.stack,
  });
};

export { notFound, errorHandler };
