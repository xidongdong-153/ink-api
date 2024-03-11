import { DynamicModule, Module } from '@nestjs/common';

import { createMeiliOptions } from '@/modules/meilisearch/helpers';
import { MeiliService } from '@/modules/meilisearch/meili.service';
import { MeliConfig } from '@/modules/meilisearch/types';

@Module({})
export class MeiliModule {
    static forRoot(configRegister: () => MeliConfig): DynamicModule {
        return {
            global: true,
            module: MeiliModule,
            providers: [
                {
                    provide: MeiliService,
                    useFactory: async () => {
                        const service = new MeiliService(
                            await createMeiliOptions(configRegister()),
                        );
                        service.createClients();
                        return service;
                    },
                },
            ],
            exports: [MeiliService],
        };
    }
}
