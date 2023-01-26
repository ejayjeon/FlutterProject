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
exports.UserController = void 0;
const common_1 = require("@nestjs/common");
const user_service_1 = require("./user.service");
const bearer_token_guard_1 = require("../auth/bearer-token.guard");
const user_entity_1 = require("./entities/user.entity");
const basket_item_dto_1 = require("./dto/basket-item.dto");
const patch_me_basket_dto_1 = require("./dto/patch-me-basket.dto");
const swagger_1 = require("@nestjs/swagger");
const api_bearer_token_header_1 = require("../core/decorator/api-bearer-token-header");
let UserController = class UserController {
    constructor(userService) {
        this.userService = userService;
    }
    async getMe(req) {
        return this.userService.findById(req.user.id);
    }
    async getMeBasket(req) {
        return this.userService.getBasket(req.user.id);
    }
    async patchMeBasket(req, body) {
        return this.userService.addToBasket(req.user.id, body.basket);
    }
};
__decorate([
    (0, common_1.UseGuards)(bearer_token_guard_1.BearerTokenGuard),
    (0, common_1.Get)('me'),
    (0, swagger_1.ApiOperation)({
        summary: '토큰을 기준으로 현재 사용자 정보를 가져옵니다.',
    }),
    (0, swagger_1.ApiOkResponse)({
        description: '사용자 가져오기 성공',
        type: user_entity_1.User,
    }),
    (0, api_bearer_token_header_1.ApiBearerTokenHeader)(),
    __param(0, (0, common_1.Request)()),
    __metadata("design:type", Function),
    __metadata("design:paramtypes", [Object]),
    __metadata("design:returntype", Promise)
], UserController.prototype, "getMe", null);
__decorate([
    (0, common_1.UseGuards)(bearer_token_guard_1.AccessTokenGuard),
    (0, common_1.Get)('me/basket'),
    (0, swagger_1.ApiOperation)({
        summary: '현재 사용자의 장바구니를 가져옵니다.',
    }),
    (0, swagger_1.ApiOkResponse)({
        description: '장바구니 가져오기 성공',
        type: basket_item_dto_1.BasketItemWithFullProductDto,
        isArray: true,
    }),
    (0, api_bearer_token_header_1.ApiBearerTokenHeader)(),
    __param(0, (0, common_1.Request)()),
    __metadata("design:type", Function),
    __metadata("design:paramtypes", [Object]),
    __metadata("design:returntype", Promise)
], UserController.prototype, "getMeBasket", null);
__decorate([
    (0, common_1.UseGuards)(bearer_token_guard_1.AccessTokenGuard),
    (0, common_1.Patch)('me/basket'),
    (0, swagger_1.ApiOperation)({
        summary: '현재 사용자의 장바구니를 업데이트합니다.',
    }),
    (0, swagger_1.ApiOkResponse)({
        description: '장바구니 업데이트 성공',
        type: basket_item_dto_1.BasketItemWithFullProductDto,
        isArray: true,
    }),
    (0, swagger_1.ApiBody)({
        type: patch_me_basket_dto_1.PatchMeBasketDto,
    }),
    __param(0, (0, common_1.Request)()),
    __param(1, (0, common_1.Body)()),
    __metadata("design:type", Function),
    __metadata("design:paramtypes", [Object, patch_me_basket_dto_1.PatchMeBasketDto]),
    __metadata("design:returntype", Promise)
], UserController.prototype, "patchMeBasket", null);
UserController = __decorate([
    (0, swagger_1.ApiTags)('user'),
    (0, common_1.Controller)('user'),
    __metadata("design:paramtypes", [user_service_1.UserService])
], UserController);
exports.UserController = UserController;
//# sourceMappingURL=user.controller.js.map