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
exports.RefreshTokenGuard = exports.AccessTokenGuard = exports.BearerTokenGuard = void 0;
const common_1 = require("@nestjs/common");
const auth_service_1 = require("./auth.service");
const user_service_1 = require("../user/user.service");
let BearerTokenGuard = class BearerTokenGuard {
    constructor(authService, userService) {
        this.authService = authService;
        this.userService = userService;
    }
    async canActivate(context) {
        const request = context.switchToHttp().getRequest();
        const rawToken = request.headers['authorization'];
        if (!rawToken) {
            throw new common_1.UnauthorizedException('토큰이 없습니다.');
        }
        const splitToken = rawToken.split(' ');
        if (splitToken.length !== 2 || splitToken[0] !== 'Bearer') {
            throw new common_1.UnauthorizedException('잘못된 토큰입니다.');
        }
        const token = splitToken[1];
        let payload;
        try {
            payload = this.authService.verifyToken(token);
        }
        catch (e) {
            throw new common_1.UnauthorizedException('잘못된 토큰입니다.');
        }
        if (!payload.sub) {
            throw new common_1.UnauthorizedException('잘못된 토큰입니다.');
        }
        request.user = await this.userService.findByUsername(payload.sub);
        request.token = token;
        request.tokenType = payload.type;
        return true;
    }
};
BearerTokenGuard = __decorate([
    (0, common_1.Injectable)(),
    __metadata("design:paramtypes", [auth_service_1.AuthService,
        user_service_1.UserService])
], BearerTokenGuard);
exports.BearerTokenGuard = BearerTokenGuard;
let AccessTokenGuard = class AccessTokenGuard extends BearerTokenGuard {
    async canActivate(context) {
        await super.canActivate(context);
        const req = context.switchToHttp().getRequest();
        if (req.tokenType !== 'access') {
            throw new common_1.UnauthorizedException('Access Token이 아닙니다.');
        }
        return true;
    }
};
AccessTokenGuard = __decorate([
    (0, common_1.Injectable)()
], AccessTokenGuard);
exports.AccessTokenGuard = AccessTokenGuard;
let RefreshTokenGuard = class RefreshTokenGuard extends BearerTokenGuard {
    async canActivate(context) {
        await super.canActivate(context);
        const req = context.switchToHttp().getRequest();
        if (req.tokenType !== 'refresh') {
            throw new common_1.UnauthorizedException('Refresh Token이 아닙니다.');
        }
        return true;
    }
};
RefreshTokenGuard = __decorate([
    (0, common_1.Injectable)()
], RefreshTokenGuard);
exports.RefreshTokenGuard = RefreshTokenGuard;
//# sourceMappingURL=bearer-token.guard.js.map