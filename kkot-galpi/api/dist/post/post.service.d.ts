import { PostDto } from './dto/post.dto';
export declare class PostService {
    createPost(no: number, body: PostDto): Promise<void>;
}
