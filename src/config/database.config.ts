import { resolve } from 'path';

import type { TypeOrmModuleOptions } from '@nestjs/typeorm';

export const database = (): TypeOrmModuleOptions => ({
    type: 'better-sqlite3',
    database: resolve(__dirname, '../../back/database.db'),
    synchronize: true,
    autoLoadEntities: true,
});
