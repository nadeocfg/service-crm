import express from 'express';
import {
  getCashInfo,
  getOrdersInfo,
} from '../controllers/dashboard.controller';
import { protect } from '../middleware/authMiddleware';

const dashboardRoutes = express.Router();

dashboardRoutes.route('/orders').get(protect, getOrdersInfo);
dashboardRoutes.route('/cash').get(protect, getCashInfo);

export default dashboardRoutes;
