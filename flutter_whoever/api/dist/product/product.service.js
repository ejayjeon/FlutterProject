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
exports.ProductService = void 0;
const common_1 = require("@nestjs/common");
const product_entity_1 = require("./entities/product.entity");
const cache_service_1 = require("../cache/cache.service");
const core_service_1 = require("../core/core.service");
let ProductService = class ProductService {
    constructor(cacheService, coreService) {
        this.cacheService = cacheService;
        this.coreService = coreService;
    }
    getAllProducts() {
        return this.cacheService.products;
    }
    getProductById(id) {
        return this.cacheService.products.find((item) => item.id === id);
    }
    paginateProducts(paginationDto) {
        const result = this.coreService.paginate(this.cacheService.products, paginationDto);
        return Object.assign(Object.assign({}, result), { data: result.data.map((item) => new product_entity_1.Product(item)) });
    }
};
ProductService = __decorate([
    (0, common_1.Injectable)(),
    __metadata("design:paramtypes", [cache_service_1.CacheService,
        core_service_1.CoreService])
], ProductService);
exports.ProductService = ProductService;
//# sourceMappingURL=product.service.js.map