import { PostService } from './post.service';
import { PostDto } from './dto/post.dto';
export declare class PostController {
    private readonly postService;
    constructor(postService: PostService);
    create(no: number, postDto: PostDto): Promise<void>;
}
