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
exports.Product = void 0;
const class_transformer_1 = require("class-transformer");
const base_entity_1 = require("../../core/entity/base.entity");
const restaurant_entity_1 = require("../../restaurant/entities/restaurant.entity");
const swagger_1 = require("@nestjs/swagger");
class Product extends base_entity_1.BaseEntity {
    constructor(params) {
        super(params);
        this.restaurant = params.restaurant;
        this.name = params.name;
        this.detail = params.detail;
        this.imgUrl = params.imgUrl;
        this.price = params.price;
    }
}
__decorate([
    (0, swagger_1.ApiProperty)({
        name: 'restaurant',
        description: '레스토랑',
        type: restaurant_entity_1.Restaurant,
    }),
    __metadata("design:type", restaurant_entity_1.Restaurant)
], Product.prototype, "restaurant", void 0);
__decorate([
    (0, swagger_1.ApiProperty)({
        name: 'name',
        description: '이름',
        example: '마라맛 코팩 떡볶이',
    }),
    __metadata("design:type", String)
], Product.prototype, "name", void 0);
__decorate([
    (0, class_transformer_1.Transform)(({ value }) => `/img/${value}`),
    (0, swagger_1.ApiProperty)({
        name: 'imgUrl',
        description: '이미지 링크',
        example: '/img/img.png',
    }),
    __metadata("design:type", String)
], Product.prototype, "imgUrl", void 0);
__decorate([
    (0, swagger_1.ApiProperty)({
        name: 'detail',
        description: '상품설명',
        example: '서울에서 두번째로 맛있는 떡볶이집! 리뷰 이벤트 진행중~',
    }),
    __metadata("design:type", String)
], Product.prototype, "detail", void 0);
__decorate([
    (0, swagger_1.ApiProperty)({
        name: 'price',
        description: '가격',
        example: 8000,
    }),
    __metadata("design:type", Number)
], Product.prototype, "price", void 0);
exports.Product = Product;
//# sourceMappingURL=product.entity.js.map