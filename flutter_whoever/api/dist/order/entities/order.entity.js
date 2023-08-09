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
exports.Order = void 0;
const base_entity_1 = require("../../core/entity/base.entity");
const user_entity_1 = require("../../user/entities/user.entity");
const class_transformer_1 = require("class-transformer");
const restaurant_entity_1 = require("../../restaurant/entities/restaurant.entity");
const basket_item_dto_1 = require("../../user/dto/basket-item.dto");
const swagger_1 = require("@nestjs/swagger");
class Order extends base_entity_1.BaseEntity {
    constructor(params) {
        super(params);
        Object.assign(this, params);
    }
}
__decorate([
    (0, class_transformer_1.Exclude)(),
    __metadata("design:type", user_entity_1.User)
], Order.prototype, "user", void 0);
__decorate([
    (0, swagger_1.ApiProperty)({
        name: 'products',
        isArray: true,
        type: basket_item_dto_1.BasketItemWithFullProductDto,
        description: '장바구니 상품',
    }),
    __metadata("design:type", Array)
], Order.prototype, "products", void 0);
__decorate([
    (0, swagger_1.ApiProperty)({
        name: 'restaurant',
        type: restaurant_entity_1.Restaurant,
        description: '레스토랑 정보',
    }),
    __metadata("design:type", restaurant_entity_1.Restaurant)
], Order.prototype, "restaurant", void 0);
__decorate([
    (0, swagger_1.ApiProperty)({
        name: 'totalPrice',
        description: '총 금액',
        example: 10000,
    }),
    __metadata("design:type", Number)
], Order.prototype, "totalPrice", void 0);
__decorate([
    (0, swagger_1.ApiProperty)({
        name: 'createdAt',
        description: '생성일자',
    }),
    __metadata("design:type", String)
], Order.prototype, "createdAt", void 0);
exports.Order = Order;
//# sourceMappingURL=order.entity.js.map