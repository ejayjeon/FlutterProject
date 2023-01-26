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
exports.RestaurantController = void 0;
const common_1 = require("@nestjs/common");
const restaurant_service_1 = require("./restaurant.service");
const bearer_token_guard_1 = require("../auth/bearer-token.guard");
const pagination_dto_1 = require("../core/dto/pagination.dto");
const pagination_entity_1 = require("../core/entity/pagination.entity");
const restaurant_entity_1 = require("./entities/restaurant.entity");
const rating_entity_1 = require("../rating/entities/rating.entity");
const rating_service_1 = require("../rating/rating.service");
const create_rating_dto_1 = require("../rating/dto/create-rating.dto");
const swagger_1 = require("@nestjs/swagger");
const api_paginated_ok_response_decorator_1 = require("../core/decorator/api-paginated-ok-response.decorator");
const api_bearer_token_header_1 = require("../core/decorator/api-bearer-token-header");
let RestaurantController = class RestaurantController {
    constructor(restaurantService, ratingService) {
        this.restaurantService = restaurantService;
        this.ratingService = ratingService;
    }
    paginateRestaurants(paginationDto) {
        return this.restaurantService.paginateRestaurants(paginationDto);
    }
    getRestaurant(id) {
        const restaurant = this.restaurantService.getRestaurantById(id);
        if (!restaurant) {
            throw new common_1.NotFoundException('존재하지 않는 ID입니다.');
        }
        return restaurant;
    }
    paginateRestaurantRatings(id, paginationDto) {
        return this.ratingService.paginateRestaurantRatings(id, paginationDto);
    }
    postRestaurantRating(id, req, body) {
        return this.ratingService.createRestaurantRating(req.user, id, body);
    }
};
__decorate([
    (0, common_1.UseGuards)(bearer_token_guard_1.AccessTokenGuard),
    (0, common_1.Get)(),
    (0, swagger_1.ApiOperation)({
        summary: '레스토랑을 Pagination합니다.',
    }),
    (0, api_paginated_ok_response_decorator_1.ApiPaginatedOkResponseDecorator)(restaurant_entity_1.Restaurant, {
        description: '레스토랑 Pagination 결과값',
    }),
    (0, api_bearer_token_header_1.ApiBearerTokenHeader)(),
    __param(0, (0, common_1.Query)()),
    __metadata("design:type", Function),
    __metadata("design:paramtypes", [pagination_dto_1.PaginationDto]),
    __metadata("design:returntype", pagination_entity_1.Pagination)
], RestaurantController.prototype, "paginateRestaurants", null);
__decorate([
    (0, common_1.UseGuards)(bearer_token_guard_1.AccessTokenGuard),
    (0, common_1.Get)(':rid'),
    (0, swagger_1.ApiOperation)({
        summary: '레스토랑 정보 가져오기',
    }),
    (0, swagger_1.ApiOkResponse)({
        description: '레스토랑 정보 가져오기 성공',
        type: restaurant_entity_1.RestaurantDetail,
    }),
    (0, swagger_1.ApiParam)({
        name: 'rid',
        description: '레스토랑 ID',
        example: '1952a209-7c26-4f50-bc65-086f6e64dbbd',
    }),
    (0, api_bearer_token_header_1.ApiBearerTokenHeader)(),
    __param(0, (0, common_1.Param)('rid')),
    __metadata("design:type", Function),
    __metadata("design:paramtypes", [String]),
    __metadata("design:returntype", restaurant_entity_1.RestaurantDetail)
], RestaurantController.prototype, "getRestaurant", null);
__decorate([
    (0, common_1.UseGuards)(bearer_token_guard_1.AccessTokenGuard),
    (0, common_1.Get)(':rid/rating'),
    (0, swagger_1.ApiOperation)({
        summary: '레스토랑 평점 Pagination',
    }),
    (0, api_paginated_ok_response_decorator_1.ApiPaginatedOkResponseDecorator)(rating_entity_1.Rating, {
        description: 'Pagination 결과',
    }),
    (0, swagger_1.ApiParam)({
        name: 'rid',
        description: '레스토랑 ID',
        example: '1952a209-7c26-4f50-bc65-086f6e64dbbd',
    }),
    (0, api_bearer_token_header_1.ApiBearerTokenHeader)(),
    __param(0, (0, common_1.Param)('rid')),
    __param(1, (0, common_1.Query)()),
    __metadata("design:type", Function),
    __metadata("design:paramtypes", [String, pagination_dto_1.PaginationDto]),
    __metadata("design:returntype", pagination_entity_1.Pagination)
], RestaurantController.prototype, "paginateRestaurantRatings", null);
__decorate([
    (0, common_1.UseGuards)(bearer_token_guard_1.AccessTokenGuard),
    (0, common_1.Post)(':rid/rating'),
    (0, swagger_1.ApiOperation)({
        summary: '레스토랑 평점 생성하기',
    }),
    (0, swagger_1.ApiOkResponse)({
        status: 201,
        description: '생성된 평점',
        type: rating_entity_1.Rating,
    }),
    (0, swagger_1.ApiBody)({
        type: create_rating_dto_1.CreateRatingDto,
    }),
    (0, swagger_1.ApiParam)({
        name: 'rid',
        description: '레스토랑 ID',
        example: '1952a209-7c26-4f50-bc65-086f6e64dbbd',
    }),
    (0, api_bearer_token_header_1.ApiBearerTokenHeader)(),
    __param(0, (0, common_1.Param)('rid')),
    __param(1, (0, common_1.Request)()),
    __param(2, (0, common_1.Body)()),
    __metadata("design:type", Function),
    __metadata("design:paramtypes", [String, Object, create_rating_dto_1.CreateRatingDto]),
    __metadata("design:returntype", rating_entity_1.Rating)
], RestaurantController.prototype, "postRestaurantRating", null);
RestaurantController = __decorate([
    (0, swagger_1.ApiTags)('restaurant'),
    (0, swagger_1.ApiExtraModels)(pagination_entity_1.Pagination, restaurant_entity_1.Restaurant, rating_entity_1.Rating),
    (0, common_1.Controller)('restaurant'),
    __metadata("design:paramtypes", [restaurant_service_1.RestaurantService,
        rating_service_1.RatingService])
], RestaurantController);
exports.RestaurantController = RestaurantController;
//# sourceMappingURL=restaurant.controller.js.map