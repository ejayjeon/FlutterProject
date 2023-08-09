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
exports.OrderProduct = void 0;
const base_entity_1 = require("../../core/entity/base.entity");
const class_transformer_1 = require("class-transformer");
const swagger_1 = require("@nestjs/swagger");
class OrderProduct extends base_entity_1.BaseEntity {
    constructor(params) {
        super(params);
        this.name = params.name;
        this.detail = params.detail;
        this.imgUrl = params.imgUrl;
        this.price = params.price;
    }
}
__decorate([
    (0, swagger_1.ApiProperty)({
        name: 'name',
        description: '이름',
        example: '떡볶이',
    }),
    __metadata("design:type", String)
], OrderProduct.prototype, "name", void 0);
__decorate([
    (0, class_transformer_1.Transform)(({ value }) => `/img/${value}`),
    (0, swagger_1.ApiProperty)({
        name: 'imgUrl',
        description: '이미지 URL',
        example: '/img/img.png',
    }),
    __metadata("design:type", String)
], OrderProduct.prototype, "imgUrl", void 0);
__decorate([
    (0, swagger_1.ApiProperty)({
        name: 'detail',
        description: '상품 상세설명',
        example: '맛있는 떡볶이',
    }),
    __metadata("design:type", String)
], OrderProduct.prototype, "detail", void 0);
__decorate([
    (0, swagger_1.ApiProperty)({
        name: 'price',
        description: '가격',
        example: 8000,
    }),
    __metadata("design:type", Number)
], OrderProduct.prototype, "price", void 0);
exports.OrderProduct = OrderProduct;
//# sourceMappingURL=order-product-entity.js.map