import type { StartOptions } from 'pm2';

export type DemoCommandArguments = {
    sleep?: boolean;
};

export type Pm2Arguments = {
    /**
     * 应用入口文件，默认为dist/main.js
     */
    entry?: string;

    /**
     * 是否监控,所有环境都可以使用(但在非PM2启动的生产环境下此选项无效)
     */
    watch?: boolean;

    /**
     * 是否重启应用(PM2进程)
     */
    restart?: boolean;

    /**
     * 是否执行额外命令
     */
    args?: string[];
};

/**
 * PM2配置
 */
export type Pm2Option = Pick<Pm2Arguments, 'watch' | 'args'> &
    Omit<StartOptions, 'name' | 'cwd' | 'script' | 'args' | 'interpreter' | 'watch'>;
