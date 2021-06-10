import express from 'express';
import { protect } from '../middleware/authMiddleware';
import { getDictRoles } from '../controllers/dict.controller';

const dictRoutes = express.Router();

dictRoutes.route('/roles').get(protect, getDictRoles);

export default dictRoutes;
