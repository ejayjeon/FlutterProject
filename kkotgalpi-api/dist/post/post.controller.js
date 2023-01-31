"use strict";
var __decorate = (this && this.__decorate) || function (decorators, target, key, desc) {
    var c = arguments.length, r = c < 3 ? target : desc === null ? desc = Object.getOwnPropertyDescriptor(target, key) : desc, d;
    if (typeof Reflect === "object" && typeof Reflect.decorate === "function") r = Reflect.decorate(decorators, target, key, desc);
    else for (var i = decorators.length - 1; i >= 0; i--) if (d = decorators[i]) r = (c < 3 ? d(r) : c > 3 ? d(target, key, r) : d(target, key)) || r;
    return c > 3 && r && Object.defineProperty(target, key, r), r;
};
var __metadata = (this && this.__metadata) || function (k, v) {
    if (typeof Reflect === "object" && typeof Reflect.metadata === "function") return Reflect.metadata(k, v);
};
var __param = (this && this.__param) || function (paramIndex, decorator) {
    return function (target, key) { decorator(target, key, paramIndex); }
};
Object.defineProperty(exports, "__esModule", { value: true });
exports.PostController = void 0;
const post_service_1 = require("./post.service");
const common_1 = require("@nestjs/common");
const swagger_1 = require("@nestjs/swagger");
const decorators_1 = require("@nestjs/common/decorators");
const post_dto_1 = require("./dto/post.dto");
let PostController = class PostController {
    constructor(postService) {
        this.postService = postService;
    }
    async create(no, postDto) {
        return this.postService.createPost(no, postDto);
    }
};
__decorate([
    (0, common_1.Get)(),
    (0, common_1.Post)(':no'),
    (0, swagger_1.ApiOperation)({
        summary: '게시물 생성',
        description: '해당 요청을 통해 게시글을 생성한다'
    }),
    (0, swagger_1.ApiResponse)({
        status: 500,
        description: 'Server Error'
    }),
    (0, swagger_1.ApiResponse)({
        status: 400,
        description: 'Bad Request'
    }),
    (0, swagger_1.ApiResponse)({
        status: 200,
        description: 'Success'
    }),
    __param(0, (0, decorators_1.Param)('no')),
    __param(1, (0, decorators_1.Body)()),
    __metadata("design:type", Function),
    __metadata("design:paramtypes", [Number, post_dto_1.PostDto]),
    __metadata("design:returntype", Promise)
], PostController.prototype, "create", null);
PostController = __decorate([
    (0, common_1.Controller)('post'),
    (0, swagger_1.ApiTags)('포스트 API'),
    __metadata("design:paramtypes", [post_service_1.PostService])
], PostController);
exports.PostController = PostController;
//# sourceMappingURL=post.controller.js.map