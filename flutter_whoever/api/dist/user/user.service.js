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
exports.UserService = void 0;
const common_1 = require("@nestjs/common");
const user_entity_1 = require("./entities/user.entity");
const uuid_1 = require("uuid");
const cache_service_1 = require("../cache/cache.service");
let UserService = class UserService {
    constructor(cacheService) {
        this.cacheService = cacheService;
    }
    async findById(id) {
        return this.cacheService.users.find((user) => user.id);
    }
    async findByUsername(username) {
        return this.cacheService.users.find((user) => user.username === username);
    }
    async createUser({ username, password }) {
        const hasUser = this.cacheService.users.find((user) => user.username === username);
        if (hasUser) {
            throw new common_1.BadRequestException('이미 가입한 사용자입니다.');
        }
        if (password.length < 6 || password.length > 20) {
            throw new common_1.BadRequestException('비밀번호는 6자 이상 20자 이하로 입력해주세요.');
        }
        const newUser = new user_entity_1.User({
            id: (0, uuid_1.v4)(),
            username,
            password,
            imageUrl: '/logo/codefactory_logo.png',
            basket: [],
        });
        this.cacheService.users = [...this.cacheService.users, newUser];
        return {
            id: newUser.id,
        };
    }
    getBasket(userId) {
        return this.cacheService.users.find((x) => x.id === userId).basket;
    }
    addToBasket(userId, products) {
        const user = this.cacheService.users.find((x) => x.id === userId);
        user.basket = this._mapBasketDtoToProduct(products);
        return user.basket;
    }
    _mapBasketDtoToProduct(products) {
        const allProducts = this.cacheService.products;
        return products.map((dto) => ({
            product: allProducts.find((product) => product.id === dto.productId),
            count: dto.count,
        }));
    }
};
UserService = __decorate([
    (0, common_1.Injectable)(),
    __metadata("design:paramtypes", [cache_service_1.CacheService])
], UserService);
exports.UserService = UserService;
//# sourceMappingURL=user.service.js.map