import express from 'express';
import dotenv from 'dotenv';
import colors from 'colors';
import userRoutes from './routes/user.routes';
import { errorHandler, notFound } from './middleware/errorMiddleware';
import dictRoutes from './routes/dict.routes';
import customersRoutes from './routes/customers.routes';
import ordersRoutes from './routes/orders.routes';
import paidsRoutes from './routes/paidOuts.routes';
import settingsRoutes from './routes/settings.routes';
import cashRoutes from './routes/cash.routes';
import dashboardRoutes from './routes/dashboard.routes';

dotenv.config();
const port = process.env.PORT || 5000;

const app = express();

app.use(express.json());

app.get('/', (request: express.Request, response: express.Response) => {
  response.send('API is running');
});

app.use('/api/users', userRoutes);
app.use('/api/dicts', dictRoutes);
app.use('/api/customers', customersRoutes);
app.use('/api/orders', ordersRoutes);
app.use('/api/paids', paidsRoutes);
app.use('/api/settings', settingsRoutes);
app.use('/api/cash', cashRoutes);
app.use('/api/dashboard', dashboardRoutes);

app.use(notFound);
app.use(errorHandler);

app.listen(port, () =>
  console.log(
    colors.cyan.underline(
      `Server running in ${process.env.NODE_ENV} mode, on port ${port}`
    )
  )
);
