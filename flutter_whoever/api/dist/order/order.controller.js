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
var __param = (this && this.__param) || function (paramIndex, decorator) {
    return function (target, key) { decorator(target, key, paramIndex); }
};
Object.defineProperty(exports, "__esModule", { value: true });
exports.OrderController = void 0;
const common_1 = require("@nestjs/common");
const order_service_1 = require("./order.service");
const bearer_token_guard_1 = require("../auth/bearer-token.guard");
const create_order_dto_1 = require("./dto/create-order.dto");
const pagination_dto_1 = require("../core/dto/pagination.dto");
const pagination_entity_1 = require("../core/entity/pagination.entity");
const order_entity_1 = require("./entities/order.entity");
const swagger_1 = require("@nestjs/swagger");
const api_paginated_ok_response_decorator_1 = require("../core/decorator/api-paginated-ok-response.decorator");
let OrderController = class OrderController {
    constructor(orderService) {
        this.orderService = orderService;
    }
    paginateOrder(req, paginationDto) {
        return this.orderService.paginateOrders(req.user, paginationDto);
    }
    postOrder(req, body) {
        return this.orderService.postOrder(req.user, body);
    }
};
__decorate([
    (0, common_1.UseGuards)(bearer_token_guard_1.AccessTokenGuard),
    (0, swagger_1.ApiOperation)({
        summary: '주문 Pagination',
    }),
    (0, api_paginated_ok_response_decorator_1.ApiPaginatedOkResponseDecorator)(order_entity_1.Order, {
        description: 'Pagination 결과',
    }),
    (0, common_1.Get)(),
    __param(0, (0, common_1.Request)()),
    __param(1, (0, common_1.Query)()),
    __metadata("design:type", Function),
    __metadata("design:paramtypes", [Object, pagination_dto_1.PaginationDto]),
    __metadata("design:returntype", pagination_entity_1.Pagination)
], OrderController.prototype, "paginateOrder", null);
__decorate([
    (0, common_1.UseGuards)(bearer_token_guard_1.AccessTokenGuard),
    (0, common_1.Post)(),
    (0, swagger_1.ApiOperation)({
        summary: '주문 생성하기',
    }),
    (0, swagger_1.ApiBody)({
        type: create_order_dto_1.CreateOrderDto,
    }),
    (0, swagger_1.ApiOkResponse)({
        status: 201,
        type: order_entity_1.Order,
    }),
    __param(0, (0, common_1.Request)()),
    __param(1, (0, common_1.Body)()),
    __metadata("design:type", Function),
    __metadata("design:paramtypes", [Object, create_order_dto_1.CreateOrderDto]),
    __metadata("design:returntype", order_entity_1.Order)
], OrderController.prototype, "postOrder", null);
OrderController = __decorate([
    (0, swagger_1.ApiTags)('order'),
    (0, swagger_1.ApiExtraModels)(pagination_dto_1.PaginationDto, order_entity_1.Order),
    (0, common_1.Controller)('order'),
    __metadata("design:paramtypes", [order_service_1.OrderService])
], OrderController);
exports.OrderController = OrderController;
//# sourceMappingURL=order.controller.js.map