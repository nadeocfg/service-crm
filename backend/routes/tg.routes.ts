import express from 'express';
import {
  sendUpdateOrderMessage,
  sendCreateOrderMessage,
} from '../controllers/tgBot.controller';
import { protect } from '../middleware/authMiddleware';

const tgRoutes = express.Router();

tgRoutes.route('/update-order').post(protect, sendUpdateOrderMessage);
tgRoutes.route('/create-order').post(protect, sendCreateOrderMessage);

export default tgRoutes;
