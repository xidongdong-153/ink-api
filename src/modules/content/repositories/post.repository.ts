import { CommentEntity } from '@/modules/content/entities';
import { PostEntity } from '@/modules/content/entities/post.entity';
import { BaseRepository } from '@/modules/database/base';
import { CustomRepository } from '@/modules/database/decorators';

@CustomRepository(PostEntity)
export class PostRepository extends BaseRepository<PostEntity> {
    protected _qbName = 'post';

    buildBaseQB() {
        // 在查询之前先查询出评论数量在添加到commentCount字段上
        return this.createQueryBuilder(this.qbName)
            .leftJoinAndSelect(`${this.qbName}.category`, 'category')
            .leftJoinAndSelect(`${this.qbName}.tags`, 'tags')
            .addSelect((subQuery) => {
                return subQuery
                    .select('COUNT(c.id)', 'count')
                    .from(CommentEntity, 'c')
                    .where(`c.post.id = ${this.qbName}.id`);
            }, 'commentCount')
            .loadRelationCountAndMap(`${this.qbName}.commentCount`, `${this.qbName}.comments`);
    }
}
