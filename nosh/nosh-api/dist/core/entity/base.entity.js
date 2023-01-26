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
exports.BaseEntity = void 0;
const swagger_1 = require("@nestjs/swagger");
class BaseEntity {
    constructor(params) {
        this.id = params.id;
    }
}
__decorate([
    (0, swagger_1.ApiProperty)({
        name: 'id',
        description: '객체 ID',
        example: '1952a209-7c26-4f50-bc65-086f6e64dbbd',
    }),
    __metadata("design:type", String)
], BaseEntity.prototype, "id", void 0);
exports.BaseEntity = BaseEntity;
//# sourceMappingURL=base.entity.js.map