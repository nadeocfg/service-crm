import express from 'express';
import { getCashList, payToServiceMan } from '../controllers/cash.controller';
import { protect } from '../middleware/authMiddleware';

const cashRoutes = express.Router();

cashRoutes.route('/').post(protect, getCashList);
cashRoutes.route('/pay').post(protect, payToServiceMan);

export default cashRoutes;
