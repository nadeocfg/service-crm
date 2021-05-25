import express from 'express';
import dotenv from 'dotenv';
import colors from 'colors';
import userRoutes from './routes/user.routes';
import { errorHandler, notFound } from './middleware/errorMiddleware';

dotenv.config();
const port = process.env.PORT || 5000;

const app = express();

app.use(express.json());

app.get('/', (request: express.Request, response: express.Response) => {
  response.send('API is running');
});

app.use('/api/users', userRoutes);

app.use(notFound);
app.use(errorHandler);

app.listen(port, () =>
  console.log(
    colors.cyan.underline(
      `Server running in ${process.env.NODE_ENV} mode, on port ${port}`
    )
  )
);
