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
exports.BasicTokenGuard = void 0;
const common_1 = require("@nestjs/common");
const auth_service_1 = require("./auth.service");
let BasicTokenGuard = class BasicTokenGuard {
    constructor(authService) {
        this.authService = authService;
    }
    async canActivate(context) {
        const req = context.switchToHttp().getRequest();
        const rawToken = req.headers['authorization'];
        if (!rawToken) {
            throw new common_1.BadRequestException('토큰이 없습니다.');
        }
        const splitToken = rawToken.split(' ');
        if (splitToken.length !== 2 || splitToken[0] !== 'Basic') {
            throw new common_1.ForbiddenException('잘못된 토큰입니다.');
        }
        const token = splitToken[1];
        const decoded = Buffer.from(token, 'base64').toString('utf8');
        const split = decoded.split(':');
        if (split.length !== 2) {
            throw new common_1.BadRequestException('잘못된 토큰입니다.');
        }
        const username = split[0];
        const password = split[1];
        const user = await this.authService.authenticate(username, password);
        if (!user) {
            throw new common_1.ForbiddenException('비밀번호가 틀렸습니다.');
        }
        req.user = user;
        return true;
    }
};
BasicTokenGuard = __decorate([
    (0, common_1.Injectable)(),
    __metadata("design:paramtypes", [auth_service_1.AuthService])
], BasicTokenGuard);
exports.BasicTokenGuard = BasicTokenGuard;
//# sourceMappingURL=basic-token.guard.js.map