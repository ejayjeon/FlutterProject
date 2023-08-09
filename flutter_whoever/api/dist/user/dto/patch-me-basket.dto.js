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
exports.PatchMeBasketDto = exports.PatchMeBasketDtoBasket = void 0;
const swagger_1 = require("@nestjs/swagger");
class PatchMeBasketDtoBasket {
}
__decorate([
    (0, swagger_1.ApiProperty)({
        name: 'productId',
        description: '상품의 ID',
        example: '1952a209-7c26-4f50-bc65-086f6e64dbbd',
    }),
    __metadata("design:type", String)
], PatchMeBasketDtoBasket.prototype, "productId", void 0);
__decorate([
    (0, swagger_1.ApiProperty)({
        name: 'count',
        description: '장바구니에 넣을 갯수',
        example: 10,
    }),
    __metadata("design:type", Number)
], PatchMeBasketDtoBasket.prototype, "count", void 0);
exports.PatchMeBasketDtoBasket = PatchMeBasketDtoBasket;
class PatchMeBasketDto {
}
__decorate([
    (0, swagger_1.ApiProperty)({
        name: 'basket',
        type: [PatchMeBasketDtoBasket],
    }),
    __metadata("design:type", Array)
], PatchMeBasketDto.prototype, "basket", void 0);
exports.PatchMeBasketDto = PatchMeBasketDto;
//# sourceMappingURL=patch-me-basket.dto.js.map