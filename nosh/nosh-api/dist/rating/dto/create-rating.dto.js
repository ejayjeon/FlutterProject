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
exports.CreateRatingDto = void 0;
const swagger_1 = require("@nestjs/swagger");
class CreateRatingDto {
}
__decorate([
    (0, swagger_1.ApiProperty)({
        name: 'restaurantId',
        description: '레스토랑 ID',
        example: '1952a209-7c26-4f50-bc65-086f6e64dbbd',
    }),
    __metadata("design:type", String)
], CreateRatingDto.prototype, "restaurantId", void 0);
__decorate([
    (0, swagger_1.ApiProperty)({
        name: 'rating',
        description: '평점',
        example: 5,
    }),
    __metadata("design:type", Number)
], CreateRatingDto.prototype, "rating", void 0);
__decorate([
    (0, swagger_1.ApiProperty)({
        name: 'content',
        description: '평가 내용',
        example: '맛있어요~',
    }),
    __metadata("design:type", String)
], CreateRatingDto.prototype, "content", void 0);
__decorate([
    (0, swagger_1.ApiProperty)({
        isArray: true,
        name: 'imageNames',
        description: '이미지 이름들',
        example: ['img/img.png', 'img/img2.png'],
    }),
    __metadata("design:type", Array)
], CreateRatingDto.prototype, "imageNames", void 0);
exports.CreateRatingDto = CreateRatingDto;
//# sourceMappingURL=create-rating.dto.js.map