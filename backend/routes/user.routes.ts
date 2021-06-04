import express from 'express';
import {
  createUser,
  authUser,
  getAllActiveUsers,
  getAllInactiveUsers,
  updateUser,
  getUserByToken,
  findUsers,
} from '../controllers/user.controller';
import { protect } from '../middleware/authMiddleware';

const userRoutes = express.Router();

userRoutes.route('/all-active').get(protect, getAllActiveUsers);
userRoutes.route('/all-inactive').get(protect, getAllInactiveUsers);
userRoutes.route('/profile').get(protect, getUserByToken);
userRoutes.route('/auth').post(authUser);
userRoutes.route('/create').post(protect, createUser);
userRoutes.route('/update/:id').post(protect, updateUser);
userRoutes.route('/find').post(protect, findUsers);

export default userRoutes;
