import express from 'express';
import {
  createOrder,
  getOrders,
  updateOrder,
  getOrderById,
  getOrderActions,
  executeAction,
  getOrderStatusHistory,
} from '../controllers/orders.controller';
import { protect } from '../middleware/authMiddleware';

const ordersRoutes = express.Router();

ordersRoutes.route('/update').post(protect, updateOrder);
ordersRoutes.route('/create').post(protect, createOrder);
ordersRoutes.route('/execute-action').post(protect, executeAction);
ordersRoutes.route('/:id').get(protect, getOrderById);
ordersRoutes.route('/:id/actions').get(protect, getOrderActions);
ordersRoutes.route('/:id/history').get(protect, getOrderStatusHistory);
ordersRoutes.route('/').get(protect, getOrders);

export default ordersRoutes;
