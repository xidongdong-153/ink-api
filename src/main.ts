import { NestFactory } from '@nestjs/core';

import { FastifyAdapter, type NestFastifyApplication } from '@nestjs/platform-fastify';

import { AppModule } from './app.module';

async function bootstrap() {
    const app = await NestFactory.create<NestFastifyApplication>(AppModule, new FastifyAdapter(), {
        cors: true,
        logger: ['warn', 'error'],
    });

    app.setGlobalPrefix('api');

    await app.listen(3100, '0.0.0.0', () => {
        console.log('api: http://localhost:3100/api');
    });
}
bootstrap();
