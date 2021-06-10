import express from 'express';
import { protect } from '../middleware/authMiddleware';
import {
  getDictRoles,
  createRole,
  getJobTypes,
} from '../controllers/dict.controller';

const dictRoutes = express.Router();

dictRoutes.route('/roles').get(protect, getDictRoles);
dictRoutes.route('/roles/create').post(protect, createRole);

dictRoutes.route('/job-types').get(protect, getJobTypes);

export default dictRoutes;
