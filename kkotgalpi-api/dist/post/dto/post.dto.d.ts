import { Post } from '../model/post.model';
declare const PostDto_base: import("@nestjs/common").Type<Pick<Post, "title" | "no" | "content" | "author" | "viewCount" | "created" | "updated">>;
export declare class PostDto extends PostDto_base {
}
export {};
