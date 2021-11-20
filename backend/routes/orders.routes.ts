import express from 'express';
import {
  createOrder,
  getOrders,
  updateOrder,
  getOrderById,
} from '../controllers/orders.controller';
import { protect } from '../middleware/authMiddleware';

const ordersRoutes = express.Router();

ordersRoutes.route('/update').post(protect, updateOrder);
ordersRoutes.route('/create').post(protect, createOrder);
ordersRoutes.route('/:id').get(protect, getOrderById);
ordersRoutes.route('/').get(protect, getOrders);

export default ordersRoutes;
