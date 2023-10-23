import express from 'express';
import { getSettings, setSettings } from '../controllers/settings.controller';
import { protect } from '../middleware/authMiddleware';

const settingsRoutes = express.Router();

settingsRoutes.route('/').get(protect, getSettings);
settingsRoutes.route('/').post(protect, setSettings);

export default settingsRoutes;
