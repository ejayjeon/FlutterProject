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
exports.ProductController = void 0;
const common_1 = require("@nestjs/common");
const product_service_1 = require("./product.service");
const product_entity_1 = require("./entities/product.entity");
const bearer_token_guard_1 = require("../auth/bearer-token.guard");
const pagination_dto_1 = require("../core/dto/pagination.dto");
const pagination_entity_1 = require("../core/entity/pagination.entity");
const swagger_1 = require("@nestjs/swagger");
const api_paginated_ok_response_decorator_1 = require("../core/decorator/api-paginated-ok-response.decorator");
let ProductController = class ProductController {
    constructor(productService) {
        this.productService = productService;
    }
    paginateProducts(paginationDto) {
        return this.productService.paginateProducts(paginationDto);
    }
    getProduct(pid) {
        const product = this.productService.getProductById(pid);
        if (!product) {
            throw new common_1.NotFoundException('존재하지 않는 상품입니다.');
        }
        return product;
    }
};
__decorate([
    (0, swagger_1.ApiOperation)({
        summary: '상품 Pagination',
    }),
    (0, api_paginated_ok_response_decorator_1.ApiPaginatedOkResponseDecorator)(product_entity_1.Product, {
        description: 'Pagination 결과',
    }),
    (0, swagger_1.ApiBody)({
        type: pagination_dto_1.PaginationDto,
    }),
    (0, common_1.UseGuards)(bearer_token_guard_1.AccessTokenGuard),
    (0, common_1.Get)(),
    __param(0, (0, common_1.Query)()),
    __metadata("design:type", Function),
    __metadata("design:paramtypes", [pagination_dto_1.PaginationDto]),
    __metadata("design:returntype", pagination_entity_1.Pagination)
], ProductController.prototype, "paginateProducts", null);
__decorate([
    (0, common_1.UseGuards)(bearer_token_guard_1.AccessTokenGuard),
    (0, common_1.Get)(':pid'),
    (0, swagger_1.ApiOperation)({
        summary: '개별 상품 가져오기',
    }),
    (0, swagger_1.ApiParam)({
        name: 'pid',
        description: '가져올 상품 ID',
        example: '1952a209-7c26-4f50-bc65-086f6e64dbbd',
    }),
    (0, swagger_1.ApiOkResponse)({
        description: '응답 성공',
        type: product_entity_1.Product,
    }),
    __param(0, (0, common_1.Param)('pid')),
    __metadata("design:type", Function),
    __metadata("design:paramtypes", [String]),
    __metadata("design:returntype", product_entity_1.Product)
], ProductController.prototype, "getProduct", null);
ProductController = __decorate([
    (0, swagger_1.ApiTags)('product'),
    (0, common_1.Controller)('product'),
    __metadata("design:paramtypes", [product_service_1.ProductService])
], ProductController);
exports.ProductController = ProductController;
//# sourceMappingURL=product.controller.js.map