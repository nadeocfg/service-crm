import express from 'express';
import { createOrder, getOrders } from '../controllers/orders.controller';
import { protect } from '../middleware/authMiddleware';

const ordersRoutes = express.Router();

ordersRoutes.route('/create').post(protect, createOrder);
ordersRoutes.route('/').get(protect, getOrders);

export default ordersRoutes;
