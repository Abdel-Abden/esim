import { serve } from '@hono/node-server';
import 'dotenv/config';
import app from './index.js';

serve({ fetch: app.fetch, port: 3000 }, (info) => {
  console.log(`🚀 API ilotel sur http://localhost:${info.port}`);
});