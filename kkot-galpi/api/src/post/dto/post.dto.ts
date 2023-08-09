import { PickType } from '@nestjs/swagger';
import { Post } from '../model/post.model';

export class PostDto extends PickType(Post, ['no', 'title', 'content', 'author', 'viewCount', 'created', 'updated'] as const) {

}