"use strict";
Object.defineProperty(exports, "__esModule", { value: true });
exports.PostDto = void 0;
const swagger_1 = require("@nestjs/swagger");
const post_model_1 = require("../model/post.model");
class PostDto extends (0, swagger_1.PickType)(post_model_1.Post, ['no', 'title', 'content', 'author', 'viewCount', 'created', 'updated']) {
}
exports.PostDto = PostDto;
//# sourceMappingURL=post.dto.js.map