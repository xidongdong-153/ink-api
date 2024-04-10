import { Arguments } from 'yargs';

import { pm2Handler } from '@/modules/core/commands/pm2.handler';
import type { Pm2Arguments } from '@/modules/core/commands/types';
import type { CommandItem } from '@/modules/core/types';

export const createPm2Command: CommandItem<any, Pm2Arguments> = async (app) => ({
    command: ['pm2'],
    describe: 'Start app in prod by pm2',
    builder: {
        entry: {
            type: 'string',
            alias: 'e',
            describe: 'The path of the script to run.',
            default: 'dist/main.js',
        },
        restart: {
            type: 'boolean',
            alias: 'r',
            describe: 'Retart app,pm2 will auto run start if process not exists.',
            default: false,
        },
        watch: {
            type: 'boolean',
            alias: 'w',
            describe: 'Run in watch mode (live-reload).',
            default: false,
        },
        args: {
            type: 'array',
            alias: 'a',
            describe: 'A string or array of strings composed of arguments to pass to the script.',
            default: [],
        },
    },
    handler: async (args: Arguments<Pm2Arguments>) => {
        const { configure } = app;
        pm2Handler(configure, args);
    },
});
