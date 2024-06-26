import { Body, Controller, Delete, Get, Post, Query, SerializeOptions } from '@nestjs/common';

import { ApiTags } from '@nestjs/swagger';

import { ContentModule } from '@/modules/content/content.module';
import { CreateCommentDto, QueryCommentDto, QueryCommentTreeDto } from '@/modules/content/dtos';
import { CommentService } from '@/modules/content/services';
import { Depends } from '@/modules/restful/decorators';
import { DeleteDto } from '@/modules/restful/dtos';

@ApiTags('评论操作')
@Depends(ContentModule)
@Controller('comments')
export class CommentController {
    constructor(protected service: CommentService) {}

    /**
     * 查询评论树
     * @param query
     */
    @Get('tree')
    @SerializeOptions({ groups: ['comment-tree'] })
    async tree(
        @Query()
        query: QueryCommentTreeDto,
    ) {
        return this.service.findTrees(query);
    }

    /**
     * 查询评论列表
     * @param query
     */
    @Get()
    @SerializeOptions({ groups: ['comment-list'] })
    async list(
        @Query()
        query: QueryCommentDto,
    ) {
        return this.service.paginate(query);
    }

    /**
     * 新增评论
     * @param data
     */
    @Post()
    @SerializeOptions({ groups: ['comment-detail'] })
    async store(
        @Body()
        data: CreateCommentDto,
    ) {
        return this.service.create(data);
    }

    /**
     * 删除评论
     * @param data
     */
    @Delete()
    @SerializeOptions({ groups: ['comment-list'] })
    async delete(
        @Body()
        data: DeleteDto,
    ) {
        const { ids } = data;
        return this.service.delete(ids);
    }
}
