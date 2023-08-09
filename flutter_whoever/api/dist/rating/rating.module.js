"use strict";
var __decorate = (this && this.__decorate) || function (decorators, target, key, desc) {
    var c = arguments.length, r = c < 3 ? target : desc === null ? desc = Object.getOwnPropertyDescriptor(target, key) : desc, d;
    if (typeof Reflect === "object" && typeof Reflect.decorate === "function") r = Reflect.decorate(decorators, target, key, desc);
    else for (var i = decorators.length - 1; i >= 0; i--) if (d = decorators[i]) r = (c < 3 ? d(r) : c > 3 ? d(target, key, r) : d(target, key)) || r;
    return c > 3 && r && Object.defineProperty(target, key, r), r;
};
Object.defineProperty(exports, "__esModule", { value: true });
exports.RatingModule = void 0;
const common_1 = require("@nestjs/common");
const rating_service_1 = require("./rating.service");
const rating_controller_1 = require("./rating.controller");
const auth_module_1 = require("../auth/auth.module");
const core_module_1 = require("../core/core.module");
const cache_module_1 = require("../cache/cache.module");
let RatingModule = class RatingModule {
};
RatingModule = __decorate([
    (0, common_1.Module)({
        imports: [auth_module_1.AuthModule, core_module_1.CoreModule, cache_module_1.CacheModule],
        controllers: [rating_controller_1.RatingController],
        providers: [rating_service_1.RatingService],
        exports: [rating_service_1.RatingService],
    })
], RatingModule);
exports.RatingModule = RatingModule;
//# sourceMappingURL=rating.module.js.map