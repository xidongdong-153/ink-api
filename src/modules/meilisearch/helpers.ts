import { MeliConfig } from '@/modules/meilisearch/types';

export const createMeiliOptions = async (config: MeliConfig): Promise<MeliConfig | undefined> => {
    if (config.length <= 0) return config;
    let options: MeliConfig = [...config];
    const names = options.map(({ name }) => name);
    if (!names.includes('default')) options[0].name = 'default';
    else if (names.filter((name) => name === 'default').length > 0) {
        options = options.reduce(
            (o, n) => (o.map(({ name }) => name).includes('default') ? o : [...o, n]),
            [],
        );
    }
    return options;
};
