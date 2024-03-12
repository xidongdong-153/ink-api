import { Module } from '@nestjs/common';

import { Configure } from '@/modules/config/configure';
import { panic } from '@/modules/core/helpers/command';
import { MeiliService } from '@/modules/meilisearch/meili.service';

@Module({})
export class MeiliModule {
    static async forRoot(configure: Configure) {
        if (!configure.has('meilli')) {
            panic({ message: 'MeilliSearch config not exists or not right!' });
        }
        return {
            global: true,
            module: MeiliModule,
            providers: [
                {
                    provide: MeiliService,
                    useFactory: async () => {
                        const service = new MeiliService(await configure.get('meilli'));
                        service.createClients();
                        return service;
                    },
                },
            ],
            exports: [MeiliService],
        };
    }
}
