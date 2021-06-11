import express from 'express';
import { protect } from '../middleware/authMiddleware';
import {
  getDictRoles,
  createRole,
  getJobTypes,
  createJobType,
  updateJobType,
  getBoilers,
  createBoiler,
  updateBoiler,
  getParts,
  createPart,
  updatePart,
} from '../controllers/dict.controller';

const dictRoutes = express.Router();

dictRoutes.route('/roles').get(protect, getDictRoles);
dictRoutes.route('/roles/create').post(protect, createRole);

dictRoutes.route('/job-types').get(protect, getJobTypes);
dictRoutes.route('/job-types/create').post(protect, createJobType);
dictRoutes.route('/job-types/update').post(protect, updateJobType);

dictRoutes.route('/boilers').get(protect, getBoilers);
dictRoutes.route('/boilers/create').post(protect, createBoiler);
dictRoutes.route('/boilers/update').post(protect, updateBoiler);

dictRoutes.route('/parts').get(protect, getParts);
dictRoutes.route('/parts/create').post(protect, createPart);
dictRoutes.route('/parts/update').post(protect, updatePart);

export default dictRoutes;
