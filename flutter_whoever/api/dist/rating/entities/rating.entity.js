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
exports.Rating = void 0;
const base_entity_1 = require("../../core/entity/base.entity");
const class_transformer_1 = require("class-transformer");
const restaurant_entity_1 = require("../../restaurant/entities/restaurant.entity");
const user_entity_1 = require("../../user/entities/user.entity");
const swagger_1 = require("@nestjs/swagger");
class Rating extends base_entity_1.BaseEntity {
    constructor(params) {
        super(params);
        Object.assign(this, params);
    }
}
__decorate([
    (0, swagger_1.ApiProperty)({
        name: 'user',
        description: '평점 작성한 유저',
        type: user_entity_1.User,
    }),
    __metadata("design:type", user_entity_1.User)
], Rating.prototype, "user", void 0);
__decorate([
    (0, class_transformer_1.Exclude)(),
    __metadata("design:type", restaurant_entity_1.Restaurant)
], Rating.prototype, "restaurant", void 0);
__decorate([
    (0, swagger_1.ApiProperty)({
        name: 'rating',
        example: 5,
        description: '평점',
    }),
    __metadata("design:type", Number)
], Rating.prototype, "rating", void 0);
__decorate([
    (0, swagger_1.ApiProperty)({
        name: 'content',
        description: '평가 내용',
        example: '너무 맛있어요~',
    }),
    __metadata("design:type", String)
], Rating.prototype, "content", void 0);
__decorate([
    (0, class_transformer_1.Transform)(({ value }) => value.map((item) => `/img/${item}`)),
    (0, swagger_1.ApiProperty)({
        isArray: true,
        type: String,
        name: 'imgUrls',
        description: '이미지 URL',
        example: ['/img/test.png'],
    }),
    __metadata("design:type", Array)
], Rating.prototype, "imgUrls", void 0);
exports.Rating = Rating;
//# sourceMappingURL=rating.entity.js.map