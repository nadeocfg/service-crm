import express from 'express';
import {
  getCashList,
  payToServiceMan,
  resetPaidSum,
} from '../controllers/cash.controller';
import { protect } from '../middleware/authMiddleware';

const cashRoutes = express.Router();

cashRoutes.route('/').post(protect, getCashList);
cashRoutes.route('/pay').post(protect, payToServiceMan);
cashRoutes.route('/reset-paid-sum').post(protect, resetPaidSum);

export default cashRoutes;
