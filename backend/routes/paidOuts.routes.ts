import express from 'express';
import { getPaidsByUser, paidOut } from '../controllers/paidOuts.controller';
import { protect } from '../middleware/authMiddleware';

const paidsRoutes = express.Router();

paidsRoutes.route('/').post(protect, paidOut);
paidsRoutes.route('/list').get(protect, getPaidsByUser);

export default paidsRoutes;
