import express from 'express';
import { getSettings } from '../controllers/settings.controller';
import { protect } from '../middleware/authMiddleware';

const settingsRoutes = express.Router();

settingsRoutes.route('/').get(protect, getSettings);

export default settingsRoutes;
