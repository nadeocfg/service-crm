import { Pool } from 'pg';

const pool = new Pool({
  user: process.env.DB_USER,
  password: process.env.DB_PASS,
  host: 'localhost',
  port: +(process.env.DB_PORT || 5432),
  database: process.env.DB_NAME,
});

export default pool;
