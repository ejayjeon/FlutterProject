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
exports.CreateOrderDto = void 0;
const basket_item_dto_1 = require("../../user/dto/basket-item.dto");
const swagger_1 = require("@nestjs/swagger");
class CreateOrderDto {
}
__decorate([
    (0, swagger_1.ApiProperty)({
        name: 'id',
        description: '주문 ID',
        example: '1952a209-7c26-4f50-bc65-086f6e64dbbd',
    }),
    __metadata("design:type", String)
], CreateOrderDto.prototype, "id", void 0);
__decorate([
    (0, swagger_1.ApiProperty)({
        name: 'products',
        description: '주문 상품들',
        type: basket_item_dto_1.BasketItemDto,
        isArray: true,
    }),
    __metadata("design:type", Array)
], CreateOrderDto.prototype, "products", void 0);
__decorate([
    (0, swagger_1.ApiProperty)({
        name: 'totalPrice',
        description: '총액',
        example: 10000,
    }),
    __metadata("design:type", Number)
], CreateOrderDto.prototype, "totalPrice", void 0);
__decorate([
    (0, swagger_1.ApiProperty)({
        name: 'createdAt',
        description: '생성일자',
    }),
    __metadata("design:type", String)
], CreateOrderDto.prototype, "createdAt", void 0);
exports.CreateOrderDto = CreateOrderDto;
//# sourceMappingURL=create-order.dto.js.map