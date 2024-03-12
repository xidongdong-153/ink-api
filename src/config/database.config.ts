import { toNumber } from 'lodash';

import { createDbConfig } from '@/modules/database/config';

export const database = createDbConfig((configure) => ({
    common: {
        synchronize: true,
    },
    connections: [
        {
            type: 'mysql',
            host: configure.env.get('DB_HOST', '127.0.0.1'),
            port: configure.env.get('DB_PORT', (v) => toNumber(v), 3306),
            username: configure.env.get('DB_USERNAME', 'root'),
            password: configure.env.get('DB_PASSWORD', '123456789'),
            database: configure.env.get('DB_NAME', 'ink-api'),
        },
        // {
        // type: 'better-sqlite3',
        // database: resolve(__dirname, configure.env.get('DB_PATH', '../../database.db')),
        // },
    ],
}));
