import { PostService } from './post.service';
import { Controller, Post, Get } from '@nestjs/common';
import { ApiTags, ApiOperation } from '@nestjs/swagger';
import { Body, Res } from '@nestjs/common/decorators';
import { PostDto } from './dto/post.dto';
import { Post as posting } from './model/post.model';

@Controller('post')
@ApiTags('포스트 API')
export class PostController {
  constructor(private readonly postService: PostService) { }

  // 생성
  @Post()
  @ApiOperation({
    summary: '포스트 생성 API',
    description: '포스트를 생성한다'
  })
  async create(@Body() postDto: PostDto, @Res() res: Response) {
    const posting: posting = await this.postService.createPost(postDto);
  }

}
