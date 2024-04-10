import { isNil, toNumber } from 'lodash';

import { toBoolean } from 'validator';

import { Configure } from '@/modules/config/configure';
import { ConfigureFactory, ConfigureRegister } from '@/modules/config/types';
import { getRandomCharString } from '@/modules/core/helpers';
import { AppConfig } from '@/modules/core/types';

/**
 * 默认应用配置
 * @param configure
 */
export const getDefaultAppConfig = (configure: Configure) => ({
    // 如果没有设置应用名称，则生成一个随机应用名
    name: configure.env.get('APP_NAME', getRandomCharString(9)),
    host: configure.env.get('APP_HOST', '127.0.0.1'),
    port: configure.env.get('APP_PORT', (v) => toNumber(v), 3000),
    https: configure.env.get('APP_SSL', (v) => toBoolean(v), false),
    locale: configure.env.get('APP_LOCALE', 'zh_CN'),
    fallbackLocale: configure.env.get('APP_FALLBACK_LOCALE', 'en'),
    pm2: {},
});

/**
 * 应用配置工厂
 */
export const createAppConfig: (
    register: ConfigureRegister<RePartial<AppConfig>>,
) => ConfigureFactory<AppConfig> = (register) => ({
    register,
    defaultRegister: (configure) => getDefaultAppConfig(configure),
    hook: (configure: Configure, value) => {
        if (isNil(value.url))
            value.url = `${value.https ? 'https' : 'http'}://${value.host}:${value.port}`;
        return value;
    },
});
