import { Injectable } from '@nestjs/common';
import { PostDto } from './dto/post.dto';

@Injectable()
export class PostService {

  // constructor(private readonly cat) { }

  // [1. 포스팅]
  async createPost(no: number, body: PostDto) {
    // 
  }
}
