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
exports.RestaurantDetail = exports.Restaurant = exports.RestaurantProduct = exports.RestaurantPriceRange = void 0;
const base_entity_1 = require("../../core/entity/base.entity");
const class_transformer_1 = require("class-transformer");
const swagger_1 = require("@nestjs/swagger");
var RestaurantPriceRange;
(function (RestaurantPriceRange) {
    RestaurantPriceRange["cheap"] = "cheap";
    RestaurantPriceRange["medium"] = "medium";
    RestaurantPriceRange["expensive"] = "expensive";
})(RestaurantPriceRange = exports.RestaurantPriceRange || (exports.RestaurantPriceRange = {}));
class RestaurantProduct extends base_entity_1.BaseEntity {
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
        example: '마라맛 코팩 떡볶이',
    }),
    __metadata("design:type", String)
], RestaurantProduct.prototype, "name", void 0);
__decorate([
    (0, class_transformer_1.Transform)(({ value }) => `/img/${value}`),
    (0, swagger_1.ApiProperty)({
        name: 'imgUrl',
        description: '이미지 링크',
        example: '/img/img.png',
    }),
    __metadata("design:type", String)
], RestaurantProduct.prototype, "imgUrl", void 0);
__decorate([
    (0, swagger_1.ApiProperty)({
        name: 'detail',
        description: '상품설명',
        example: '서울에서 두번째로 맛있는 떡볶이집! 리뷰 이벤트 진행중~',
    }),
    __metadata("design:type", String)
], RestaurantProduct.prototype, "detail", void 0);
__decorate([
    (0, swagger_1.ApiProperty)({
        name: 'price',
        description: '가격',
        example: 8000,
    }),
    __metadata("design:type", Number)
], RestaurantProduct.prototype, "price", void 0);
exports.RestaurantProduct = RestaurantProduct;
class Restaurant extends base_entity_1.BaseEntity {
    constructor(params) {
        super(params);
        this.name = params.name;
        this.thumbUrl = params.thumbUrl;
        this.tags = params.tags;
        this.priceRange = params.priceRange;
        this.ratings = params.ratings;
        this.ratingsCount = params.ratingsCount;
        this.deliveryTime = params.deliveryTime;
        this.deliveryFee = params.deliveryFee;
    }
}
__decorate([
    (0, swagger_1.ApiProperty)({
        name: 'name',
        description: '이름',
        example: '우라나라에서 가장 맛있는 짜장면집',
    }),
    __metadata("design:type", String)
], Restaurant.prototype, "name", void 0);
__decorate([
    (0, class_transformer_1.Transform)(({ value }) => `/img/${value}`),
    (0, swagger_1.ApiProperty)({
        name: 'thumbUrl',
        description: '썸네일 URL',
        example: '/img/thumb.png',
    }),
    __metadata("design:type", String)
], Restaurant.prototype, "thumbUrl", void 0);
__decorate([
    (0, swagger_1.ApiProperty)({
        name: 'tags',
        description: '레스토랑 태그들',
        example: ['신규', '세일중'],
        type: String,
        isArray: true,
    }),
    __metadata("design:type", Array)
], Restaurant.prototype, "tags", void 0);
__decorate([
    (0, swagger_1.ApiProperty)({
        name: 'priceRange',
        description: '가격대',
        example: 'cheap',
    }),
    __metadata("design:type", String)
], Restaurant.prototype, "priceRange", void 0);
__decorate([
    (0, swagger_1.ApiProperty)({
        name: 'ratings',
        description: '별점',
        example: 4.89,
    }),
    __metadata("design:type", Number)
], Restaurant.prototype, "ratings", void 0);
__decorate([
    (0, swagger_1.ApiProperty)({
        name: 'ratingsCount',
        description: '별점 갯수',
        example: 200,
    }),
    __metadata("design:type", Number)
], Restaurant.prototype, "ratingsCount", void 0);
__decorate([
    (0, swagger_1.ApiProperty)({
        name: 'deliveryTime',
        description: '배달시간 (분)',
        example: 20,
    }),
    __metadata("design:type", Number)
], Restaurant.prototype, "deliveryTime", void 0);
__decorate([
    (0, swagger_1.ApiProperty)({
        name: 'deliveryFee',
        description: '배달료',
        example: 3000,
    }),
    __metadata("design:type", Number)
], Restaurant.prototype, "deliveryFee", void 0);
exports.Restaurant = Restaurant;
class RestaurantDetail extends Restaurant {
    constructor(params) {
        super(params);
        this.detail = params.detail;
        this.products = params.products;
    }
}
__decorate([
    (0, swagger_1.ApiProperty)({
        name: 'detail',
        description: '레스토랑 설명',
        example: '오늘 주문하면 배송비 3000원 할인!',
    }),
    __metadata("design:type", String)
], RestaurantDetail.prototype, "detail", void 0);
__decorate([
    (0, swagger_1.ApiProperty)({
        name: 'products',
        description: '판매 상품들',
        isArray: true,
        type: RestaurantProduct,
    }),
    __metadata("design:type", Array)
], RestaurantDetail.prototype, "products", void 0);
exports.RestaurantDetail = RestaurantDetail;
//# sourceMappingURL=restaurant.entity.js.map