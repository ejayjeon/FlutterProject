"use strict";
var __decorate = (this && this.__decorate) || function (decorators, target, key, desc) {
    var c = arguments.length, r = c < 3 ? target : desc === null ? desc = Object.getOwnPropertyDescriptor(target, key) : desc, d;
    if (typeof Reflect === "object" && typeof Reflect.decorate === "function") r = Reflect.decorate(decorators, target, key, desc);
    else for (var i = decorators.length - 1; i >= 0; i--) if (d = decorators[i]) r = (c < 3 ? d(r) : c > 3 ? d(target, key, r) : d(target, key)) || r;
    return c > 3 && r && Object.defineProperty(target, key, r), r;
};
Object.defineProperty(exports, "__esModule", { value: true });
exports.AppModule = void 0;
const common_1 = require("@nestjs/common");
const app_controller_1 = require("./app.controller");
const app_service_1 = require("./app.service");
const auth_module_1 = require("./auth/auth.module");
const user_module_1 = require("./user/user.module");
const product_module_1 = require("./product/product.module");
const core_1 = require("@nestjs/core");
const cache_module_1 = require("./cache/cache.module");
const restaurant_module_1 = require("./restaurant/restaurant.module");
const core_module_1 = require("./core/core.module");
const rating_module_1 = require("./rating/rating.module");
const response_delay_interceptor_1 = require("./core/interceptor/response-delay.interceptor");
const order_module_1 = require("./order/order.module");
let AppModule = class AppModule {
};
AppModule = __decorate([
    (0, common_1.Module)({
        imports: [
            auth_module_1.AuthModule,
            user_module_1.UserModule,
            product_module_1.ProductModule,
            cache_module_1.CacheModule,
            restaurant_module_1.RestaurantModule,
            core_module_1.CoreModule,
            rating_module_1.RatingModule,
            order_module_1.OrderModule,
        ],
        controllers: [app_controller_1.AppController],
        providers: [
            app_service_1.AppService,
            {
                provide: core_1.APP_INTERCEPTOR,
                useClass: common_1.ClassSerializerInterceptor,
            },
            {
                provide: core_1.APP_INTERCEPTOR,
                useClass: response_delay_interceptor_1.ResponseDelayInterceptor,
            },
        ],
    })
], AppModule);
exports.AppModule = AppModule;
//# sourceMappingURL=app.module.js.map