import { TypeOrmModuleOptions } from '@nestjs/typeorm';

export const database = (): TypeOrmModuleOptions => ({
    // 以下为mysql配置
    charset: 'utf8mb4',
    logging: ['error'],
    type: 'mysql',
    host: '127.0.0.1',
    port: 3306,
    username: 'xidongdong',
    password: '123456789',
    database: 'ink-api',
    synchronize: true,
    autoLoadEntities: true,
});
