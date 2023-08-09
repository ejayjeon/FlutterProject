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
Object.defineProperty(exports, "__esModule", { value: true });
exports.Post = void 0;
const class_validator_1 = require("class-validator");
const swagger_1 = require("@nestjs/swagger");
const class_validator_2 = require("class-validator");
const sequelize_typescript_1 = require("sequelize-typescript");
const now = Date.now();
let Post = class Post extends sequelize_typescript_1.Model {
};
__decorate([
    (0, swagger_1.ApiProperty)({
        description: '포스트 고유 번호',
        required: true,
        example: 123,
    }),
    sequelize_typescript_1.Column,
    (0, class_validator_2.IsNotEmpty)(),
    __metadata("design:type", Number)
], Post.prototype, "no", void 0);
__decorate([
    (0, swagger_1.ApiProperty)({
        description: '포스트 제목',
        required: true,
        example: '01, 눈내리던 어느 새벽',
    }),
    sequelize_typescript_1.Column,
    (0, class_validator_1.IsString)(),
    (0, class_validator_2.IsNotEmpty)(),
    __metadata("design:type", String)
], Post.prototype, "title", void 0);
__decorate([
    (0, swagger_1.ApiProperty)({
        description: '포스트 내용',
        required: true,
        example: '새벽 내내 잠을 뒤척이다 창문을 열어보았다. 밤새 눈이 내렸나보다.',
    }),
    sequelize_typescript_1.Column,
    (0, class_validator_1.IsString)(),
    (0, class_validator_2.IsNotEmpty)(),
    __metadata("design:type", String)
], Post.prototype, "content", void 0);
__decorate([
    (0, swagger_1.ApiProperty)({
        description: '글쓴이',
        required: true,
        example: '귀요미'
    }),
    sequelize_typescript_1.Column,
    (0, class_validator_1.IsString)(),
    (0, class_validator_2.IsNotEmpty)(),
    __metadata("design:type", String)
], Post.prototype, "author", void 0);
__decorate([
    (0, swagger_1.ApiProperty)({
        description: '포스트 조회수',
        required: true,
        example: 33
    }),
    (0, sequelize_typescript_1.Column)({ defaultValue: 0 }),
    (0, class_validator_2.IsNumber)(),
    (0, class_validator_2.IsPositive)(),
    __metadata("design:type", Number)
], Post.prototype, "viewCount", void 0);
__decorate([
    (0, swagger_1.ApiProperty)({
        description: '포스팅 일자',
        required: true,
        example: '2023-01-26 03:25:33'
    }),
    (0, sequelize_typescript_1.Column)({ defaultValue: now }),
    __metadata("design:type", String)
], Post.prototype, "created", void 0);
__decorate([
    (0, swagger_1.ApiProperty)({
        description: '포스트 업데이트 일자',
        required: false,
        example: '-'
    }),
    sequelize_typescript_1.Column,
    __metadata("design:type", String)
], Post.prototype, "updated", void 0);
__decorate([
    (0, swagger_1.ApiProperty)({
        description: '포스팅 존재여부, 존재(true), 삭제(false)',
        required: true,
        example: false,
    }),
    (0, sequelize_typescript_1.Column)({ defaultValue: true }),
    (0, class_validator_1.IsBoolean)(),
    __metadata("design:type", Boolean)
], Post.prototype, "isActive", void 0);
Post = __decorate([
    sequelize_typescript_1.Table
], Post);
exports.Post = Post;
//# sourceMappingURL=post.model.js.map