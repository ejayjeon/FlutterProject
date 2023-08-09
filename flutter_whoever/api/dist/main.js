"use strict";
Object.defineProperty(exports, "__esModule", { value: true });
const core_1 = require("@nestjs/core");
const app_module_1 = require("./app.module");
const path_1 = require("path");
const common_1 = require("@nestjs/common");
const swagger_1 = require("@nestjs/swagger");
const response_delay_interceptor_1 = require("./core/interceptor/response-delay.interceptor");
async function bootstrap() {
    const app = await core_1.NestFactory.create(app_module_1.AppModule);
    app.useGlobalInterceptors(new common_1.ClassSerializerInterceptor(app.get(core_1.Reflector)));
    app.useGlobalInterceptors(new response_delay_interceptor_1.ResponseDelayInterceptor());
    const config = new swagger_1.DocumentBuilder()
        .setTitle('코드팩토리 API')
        .setDescription('코드팩토리 RiverPod 강의 API')
        .setVersion('1.0')
        .build();
    app.useGlobalPipes(new common_1.ValidationPipe({ transform: true }));
    app.useStaticAssets((0, path_1.join)(__dirname, '..', 'public'));
    const document = swagger_1.SwaggerModule.createDocument(app, config);
    swagger_1.SwaggerModule.setup('api', app, document);
    await app.listen(3000);
}
bootstrap();
//# sourceMappingURL=main.js.map