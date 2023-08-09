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
exports.RatingService = void 0;
const common_1 = require("@nestjs/common");
const core_service_1 = require("../core/core.service");
const rating_entity_1 = require("./entities/rating.entity");
const cache_service_1 = require("../cache/cache.service");
const uuid_1 = require("uuid");
const fs = require("fs");
const path = require("path");
let RatingService = class RatingService {
    constructor(coreService, cacheService) {
        this.coreService = coreService;
        this.cacheService = cacheService;
    }
    paginateRatings(paginationDto) {
        return this.coreService.paginate(this.cacheService.ratings, paginationDto);
    }
    paginateRestaurantRatings(restaurantId, paginationDto) {
        return this.coreService.paginate(this.cacheService.ratings.filter((x) => x.restaurant.id === restaurantId), paginationDto);
    }
    createRestaurantRating(user, restaurantId, createRatingDto) {
        const restaurant = this.cacheService.restaurants.find((x) => x.id === restaurantId);
        const imgUrls = [];
        for (const img of createRatingDto.imageNames) {
            fs.renameSync(path.join(process.cwd(), 'public', 'uploads', img), path.join(process.cwd(), 'public', 'img', 'ratings', img));
            imgUrls.push(path.join('ratings', img));
        }
        const newRating = new rating_entity_1.Rating({
            id: (0, uuid_1.v4)(),
            user,
            restaurant,
            rating: createRatingDto.rating,
            content: createRatingDto.content,
            imgUrls: imgUrls,
        });
        this.cacheService.ratings = [newRating, ...this.cacheService.ratings];
        return newRating;
    }
};
RatingService = __decorate([
    (0, common_1.Injectable)(),
    __metadata("design:paramtypes", [core_service_1.CoreService,
        cache_service_1.CacheService])
], RatingService);
exports.RatingService = RatingService;
//# sourceMappingURL=rating.service.js.map