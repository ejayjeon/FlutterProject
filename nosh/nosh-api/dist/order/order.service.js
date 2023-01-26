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
exports.OrderService = void 0;
const common_1 = require("@nestjs/common");
const cache_service_1 = require("../cache/cache.service");
const order_entity_1 = require("./entities/order.entity");
const core_service_1 = require("../core/core.service");
const order_product_entity_1 = require("./entities/order-product-entity");
let OrderService = class OrderService {
    constructor(cacheService, coreService) {
        this.cacheService = cacheService;
        this.coreService = coreService;
    }
    paginateOrders(user, paginationDto) {
        const result = this.coreService.paginate(this.cacheService.orders, paginationDto);
        return Object.assign(Object.assign({}, result), { data: result.data.map((item) => new order_entity_1.Order(item)) });
    }
    postOrder(user, createOrderDto) {
        const newOrder = new order_entity_1.Order({
            id: createOrderDto.id,
            user,
            restaurant: this.cacheService.products.find((x) => createOrderDto.products[0].productId === x.id).restaurant,
            products: createOrderDto.products.map((basketItem) => ({
                product: new order_product_entity_1.OrderProduct(this.cacheService.products.find((product) => basketItem.productId === product.id)),
                count: basketItem.count,
            })),
            totalPrice: createOrderDto.totalPrice,
            createdAt: createOrderDto.createdAt,
        });
        this.cacheService.orders = [newOrder, ...this.cacheService.orders];
        return newOrder;
    }
};
OrderService = __decorate([
    (0, common_1.Injectable)(),
    __metadata("design:paramtypes", [cache_service_1.CacheService,
        core_service_1.CoreService])
], OrderService);
exports.OrderService = OrderService;
//# sourceMappingURL=order.service.js.map