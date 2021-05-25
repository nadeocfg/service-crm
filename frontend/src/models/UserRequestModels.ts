import { Request } from 'express';

export type UserRequest = Request & {
  user?: any;
};
