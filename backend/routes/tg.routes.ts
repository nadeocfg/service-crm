import express from 'express';
import { sendUpdateOrderMessage } from '../controllers/tgBot.controller';
import { protect } from '../middleware/authMiddleware';

const tgRoutes = express.Router();

tgRoutes.route('/update-order').post(protect, sendUpdateOrderMessage);

export default tgRoutes;
