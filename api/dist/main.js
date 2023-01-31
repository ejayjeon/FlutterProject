"use strict";
Object.defineProperty(exports, "__esModule", { value: true });
const core_1 = require("@nestjs/core");
const app_module_1 = require("./app.module");
const swagger_1 = require("@nestjs/swagger");
const dist_1 = require("@nestjs/swagger/dist");
const basicAuth = require("express-basic-auth");
const path = require("path");
const validation_pipe_1 = require("@nestjs/common/pipes/validation.pipe");
async function bootstrap() {
    const app = await core_1.NestFactory.create(app_module_1.AppModule);
    const mode = process.env.MODE === 'dev' ? true : false;
    const docConfig = new dist_1.DocumentBuilder()
        .setTitle(process.env.DOC_TITLE)
        .setDescription(process.env.DOC_DESCRIPTION)
        .setVersion(process.env.DOC_VERSION)
        .build();
    const document = swagger_1.SwaggerModule.createDocument(app, docConfig);
    swagger_1.SwaggerModule.setup('api-docs', app, document);
    app.useGlobalPipes(new validation_pipe_1.ValidationPipe());
    app.use('api-docs', basicAuth({
        users: {
            [process.env.SWAGGER_USER]: process.env.SWAGGER_PASSWORD,
        },
        challenge: true,
    }));
    app.enableCors({
        origin: mode,
        credentials: true,
    });
    app.useStaticAssets(path.join(__dirname, './common', 'uploads'), {
        prefix: '/image',
    });
    await app.listen(process.env.PORT);
}
bootstrap();
//# sourceMappingURL=main.js.map