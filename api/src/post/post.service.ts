import { Injectable } from '@nestjs/common';
import { PostDto } from './dto/post.dto';

@Injectable()
export class PostService {

  // [1. 포스팅]
  async createPost(body: PostDto) {
    // 
  }
}
