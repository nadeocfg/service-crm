import express from 'express';
import {
  getAllUsers,
  createUser,
  authUser,
} from '../controllers/user.controller';
import { protect } from '../middleware/authMiddleware';

const userRoutes = express.Router();

userRoutes.get('/all', getAllUsers);
userRoutes.route('/auth').post(authUser);
userRoutes.route('/create').post(protect, createUser);

export default userRoutes;
