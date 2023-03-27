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
exports.AuthService = void 0;
const common_1 = require("@nestjs/common");
const user_service_1 = require("../user/user.service");
const jwt_1 = require("@nestjs/jwt");
const cache_service_1 = require("../cache/cache.service");
let AuthService = class AuthService {
    constructor(cacheService, userService, jwtService) {
        this.cacheService = cacheService;
        this.userService = userService;
        this.jwtService = jwtService;
    }
    verifyToken(token) {
        return this.jwtService.verify(token);
    }
    async rotateAccessToken(refreshToken) {
        const decoded = this.jwtService.verify(refreshToken);
        return this.signToken({
            username: decoded.username,
            id: decoded.sub,
        }, false);
    }
    signToken(user, isRefreshToken) {
        const payload = {
            username: user.username,
            sub: user.id,
            type: isRefreshToken ? 'refresh' : 'access',
        };
        return this.jwtService.sign(payload, {
            expiresIn: isRefreshToken ? '1d' : '300s',
        });
    }
    async authenticate(username, password) {
        const user = await this.userService.findByUsername(username);
        if (!user) {
            return null;
        }
        if (user.password !== password) {
            return null;
        }
        return user;
    }
    async login(user) {
        return {
            refreshToken: this.signToken(user, true),
            accessToken: this.signToken(user, false),
        };
    }
};
AuthService = __decorate([
    (0, common_1.Injectable)(),
    __metadata("design:paramtypes", [cache_service_1.CacheService,
        user_service_1.UserService,
        jwt_1.JwtService])
], AuthService);
exports.AuthService = AuthService;
//# sourceMappingURL=auth.service.js.map