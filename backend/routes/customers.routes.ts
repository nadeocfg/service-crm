import express from 'express';
import {
  createCustomer,
  getCustomersList,
  updateCustomer,
} from '../controllers/customers.controller';
import { protect } from '../middleware/authMiddleware';

const customersRoutes = express.Router();

customersRoutes.route('/find').post(protect, getCustomersList);
customersRoutes.route('/create').post(protect, createCustomer);
customersRoutes.route('/update').post(protect, updateCustomer);

export default customersRoutes;
