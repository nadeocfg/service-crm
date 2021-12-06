import express from 'express';
import { getPaidsByUser } from '../controllers/paidOuts.controller';
import { protect } from '../middleware/authMiddleware';

const paidsRoutes = express.Router();

paidsRoutes.route('/list').get(protect, getPaidsByUser);

export default paidsRoutes;
