import { Injectable } from '@nestjs/common';

import { omit } from 'lodash';

import { CreateTagDto, UpdateTagDto } from '@/modules/content/dtos';
import { TagEntity } from '@/modules/content/entities';
import { TagRepository } from '@/modules/content/repositories';
import { BaseService } from '@/modules/database/base';

/**
 * 标签数据操作
 */
@Injectable()
export class TagService extends BaseService<TagEntity, TagRepository> {
    constructor(protected repository: TagRepository) {
        super(repository);
    }

    /**
     * 查询单个标签信息
     * @param id
     * @param callback 添加额外的查询
     */
    async detail(id: string) {
        const qb = this.repository.buildBaseQB();
        qb.where(`tag.id = :id`, { id });
        return qb.getOneOrFail();
    }

    /**
     * 创建标签
     * @param data
     */
    async create(data: CreateTagDto) {
        const item = await this.repository.save(data);
        return this.detail(item.id);
    }

    /**
     * 更新标签
     * @param data
     */
    async update(data: UpdateTagDto) {
        await this.repository.update(data.id, omit(data, ['id']));
        return this.detail(data.id);
    }
}
