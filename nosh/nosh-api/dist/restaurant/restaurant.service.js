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
exports.RestaurantService = void 0;
const common_1 = require("@nestjs/common");
const restaurant_entity_1 = require("./entities/restaurant.entity");
const core_service_1 = require("../core/core.service");
const cache_service_1 = require("../cache/cache.service");
let RestaurantService = class RestaurantService {
    constructor(coreService, cacheService) {
        this.coreService = coreService;
        this.cacheService = cacheService;
    }
    paginateRestaurants(paginationDto) {
        const result = this.coreService.paginate(this.cacheService.restaurants, paginationDto);
        return Object.assign(Object.assign({}, result), { data: result.data.map((item) => new restaurant_entity_1.Restaurant(item)) });
    }
    getRestaurantById(id) {
        return this.cacheService.restaurants.find((item) => item.id === id);
    }
};
RestaurantService = __decorate([
    (0, common_1.Injectable)(),
    __metadata("design:paramtypes", [core_service_1.CoreService,
        cache_service_1.CacheService])
], RestaurantService);
exports.RestaurantService = RestaurantService;
//# sourceMappingURL=restaurant.service.js.map