import { buildCli, createApp } from '@/modules/core/helpers';
import { createOptions } from '@/options';

buildCli(createApp(createOptions));
