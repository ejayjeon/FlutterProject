import { PostService } from './post.service';
import { Controller, Post, Get } from '@nestjs/common';
import { ApiTags, ApiOperation, ApiResponse } from '@nestjs/swagger';
import { Body, Param, Res } from '@nestjs/common/decorators';
import { PostDto } from './dto/post.dto';
import { Post as posts } from './model/post.model';

@Controller('post')
@ApiTags('포스트 API')
export class PostController {
  constructor(private readonly postService: PostService) { }

  // 글 가져오기
  @Get()

  // 글 생성
  @Post(':no')
  @ApiOperation({
    summary: '게시물 생성',
    description: '해당 요청을 통해 게시글을 생성한다'
  })
  @ApiResponse({
    status: 500,
    description: 'Server Error'
  })
  @ApiResponse({
    status: 400,
    description: 'Bad Request'
  })
  @ApiResponse({
    status: 200,
    description: 'Success'
  })
  async create(@Param('no') no: number, @Body() postDto: PostDto) {
    return this.postService.createPost(no, postDto);
  }

}
