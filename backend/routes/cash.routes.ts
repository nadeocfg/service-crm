import express from 'express';
import { getCashList } from '../controllers/cash.controller';
import { protect } from '../middleware/authMiddleware';

const cashRoutes = express.Router();

cashRoutes.route('/').post(protect, getCashList);

export default cashRoutes;
