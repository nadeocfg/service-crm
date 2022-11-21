import express from 'express';
import {
  sendUpdateOrderStatusMessage,
  sendCreateOrderMessage,
  sendUpdateOrderMessage,
} from '../controllers/tgBot.controller';
import { protect } from '../middleware/authMiddleware';

const tgRoutes = express.Router();

tgRoutes
  .route('/update-order-status')
  .post(protect, sendUpdateOrderStatusMessage);
tgRoutes.route('/create-order').post(protect, sendCreateOrderMessage);
tgRoutes.route('/update-order').post(protect, sendUpdateOrderMessage);

export default tgRoutes;
