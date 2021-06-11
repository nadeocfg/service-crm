import express from 'express';
import { protect } from '../middleware/authMiddleware';
import {
  getDictRoles,
  createRole,
  getJobTypes,
  createJobType,
  updateJobType,
} from '../controllers/dict.controller';

const dictRoutes = express.Router();

dictRoutes.route('/roles').get(protect, getDictRoles);
dictRoutes.route('/roles/create').post(protect, createRole);

dictRoutes.route('/job-types').get(protect, getJobTypes);
dictRoutes.route('/job-types/create').post(protect, createJobType);
dictRoutes.route('/job-types/update').post(protect, updateJobType);

export default dictRoutes;
