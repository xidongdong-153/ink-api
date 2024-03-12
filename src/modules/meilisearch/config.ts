import { createConnectionOptions } from '@/modules/config/helpers';
import { ConfigureFactory, ConfigureRegister } from '@/modules/config/types';
import { MeliConfig } from '@/modules/meilisearch/types';

export const createMeilliConfig: (
    register: ConfigureRegister<RePartial<MeliConfig>>,
) => ConfigureFactory<MeliConfig, MeliConfig> = (register) => ({
    register,
    hook: (configure, value) => createConnectionOptions(value),
});
