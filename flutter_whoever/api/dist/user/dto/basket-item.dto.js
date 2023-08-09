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
exports.BasketItemWithFullProductDto = exports.BasketItemDto = void 0;
const class_validator_1 = require("class-validator");
const product_entity_1 = require("../../product/entities/product.entity");
const swagger_1 = require("@nestjs/swagger");
const order_product_entity_1 = require("../../order/entities/order-product-entity");
class BasketItemDto {
}
__decorate([
    (0, class_validator_1.IsString)(),
    (0, swagger_1.ApiProperty)({
        name: 'productId',
        description: '상품 ID',
        example: '1952a209-7c26-4f50-bc65-086f6e64dbbd',
    }),
    __metadata("design:type", String)
], BasketItemDto.prototype, "productId", void 0);
__decorate([
    (0, class_validator_1.IsInt)(),
    (0, swagger_1.ApiProperty)({
        name: 'count',
        description: '갯수',
        example: 10,
    }),
    __metadata("design:type", Number)
], BasketItemDto.prototype, "count", void 0);
exports.BasketItemDto = BasketItemDto;
class BasketItemWithFullProductDto {
}
__decorate([
    (0, swagger_1.ApiProperty)({
        name: 'product',
        description: '상품',
        type: product_entity_1.Product,
    }),
    __metadata("design:type", order_product_entity_1.OrderProduct)
], BasketItemWithFullProductDto.prototype, "product", void 0);
__decorate([
    (0, swagger_1.ApiProperty)({
        name: 'count',
        example: 10,
        description: '갯수',
    }),
    __metadata("design:type", Number)
], BasketItemWithFullProductDto.prototype, "count", void 0);
exports.BasketItemWithFullProductDto = BasketItemWithFullProductDto;
//# sourceMappingURL=basket-item.dto.js.map