import { MeliConfig } from '@/modules/meilisearch/types';

export const meili = (): MeliConfig => [
    {
        name: 'default',
        host: 'http://localhost:7700',
        apiKey: 'ink-api-153',
    },
];
