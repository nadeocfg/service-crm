import express from 'express';
import {
  createOrder,
  getOrders,
  updateOrder,
  getOrderById,
  getOrderActions,
  executeAction,
} from '../controllers/orders.controller';
import { protect } from '../middleware/authMiddleware';

const ordersRoutes = express.Router();

ordersRoutes.route('/update').post(protect, updateOrder);
ordersRoutes.route('/create').post(protect, createOrder);
ordersRoutes.route('/execute-action').post(protect, executeAction);
ordersRoutes.route('/:id').get(protect, getOrderById);
ordersRoutes.route('/:id/actions').get(protect, getOrderActions);
ordersRoutes.route('/').get(protect, getOrders);

export default ordersRoutes;
