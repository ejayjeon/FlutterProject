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
exports.User = void 0;
const base_entity_1 = require("../../core/entity/base.entity");
const class_transformer_1 = require("class-transformer");
const swagger_1 = require("@nestjs/swagger");
class User extends base_entity_1.BaseEntity {
    constructor(params) {
        super(params);
        Object.assign(this, params);
    }
}
__decorate([
    (0, swagger_1.ApiProperty)({
        name: 'username',
        description: '사용자 이메일',
        example: 'test@codefactory.ai',
    }),
    __metadata("design:type", String)
], User.prototype, "username", void 0);
__decorate([
    (0, class_transformer_1.Transform)(({ value }) => `/img/${value}`),
    (0, swagger_1.ApiProperty)({
        name: 'imageUrl',
        description: '프로필 이미지 URL',
        example: '/img/logo.png',
    }),
    __metadata("design:type", String)
], User.prototype, "imageUrl", void 0);
__decorate([
    (0, class_transformer_1.Exclude)(),
    __metadata("design:type", Array)
], User.prototype, "basket", void 0);
__decorate([
    (0, class_transformer_1.Exclude)(),
    __metadata("design:type", String)
], User.prototype, "password", void 0);
exports.User = User;
//# sourceMappingURL=user.entity.js.map