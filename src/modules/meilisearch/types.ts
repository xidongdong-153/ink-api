import { Config } from 'meilisearch';

// MeliSearch模块的配置
export type MeliConfig = MeliOption[];

// MeiliSearch的连接节点配置
export type MeliOption = Config & { name: string };
