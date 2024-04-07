import { Module, ModuleMetadata } from '@nestjs/common';

import { TypeOrmModule } from '@nestjs/typeorm';

import { Configure } from '@/modules/config/configure';
import { PostService } from '@/modules/content/services/post.service';
import { SanitizeService } from '@/modules/content/services/sanitize.service';
import { SearchService } from '@/modules/content/services/search.service';
import { PostSubscriber } from '@/modules/content/subscribers';
import { ContentConfig } from '@/modules/content/types';

import { DatabaseModule } from '@/modules/database/database.module';

import { defaultContentConfig } from './config';
import * as entities from './entities';
import * as repositories from './repositories';
import * as services from './services';

@Module({})
export class ContentModule {
    static async forRoot(configure: Configure) {
        const config = await configure.get<ContentConfig>('content', defaultContentConfig);
        const providers: ModuleMetadata['providers'] = [
            ...Object.values(services),
            PostSubscriber,
            {
                provide: PostService,
                inject: [
                    repositories.PostRepository,
                    repositories.CategoryRepository,
                    services.CategoryService,
                    repositories.TagRepository,
                    { token: SearchService, optional: true },
                ],
                useFactory(
                    postRepository: repositories.PostRepository,
                    categoryRepository: repositories.CategoryRepository,
                    categoryService: services.CategoryService,
                    tagRepository: repositories.TagRepository,
                    searchService: SearchService,
                ) {
                    return new PostService(
                        postRepository,
                        categoryRepository,
                        categoryService,
                        tagRepository,
                        searchService,
                        config.searchType,
                    );
                },
            },
        ];
        const exports: ModuleMetadata['exports'] = [
            ...Object.values(services),
            PostService,
            DatabaseModule.forRepository(Object.values(repositories)),
        ];
        if (config.htmlEnabled) {
            providers.push(SanitizeService);
            exports.push(SanitizeService);
        }
        if (config.searchType === 'meili') {
            providers.push(SearchService);
            exports.push(SearchService);
        }
        return {
            module: ContentModule,
            imports: [
                TypeOrmModule.forFeature(Object.values(entities)),
                DatabaseModule.forRepository(Object.values(repositories)),
            ],
            // controllers: Object.values(controllers),
            providers,
            exports,
        };
    }
}
