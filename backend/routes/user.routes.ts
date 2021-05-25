import express from 'express';
import { getAllUsers } from '../controllers/user.controller';

const userRoutes = express.Router();

userRoutes.get('/all', getAllUsers);

export default userRoutes;
