import { NestExpressApplication } from '@nestjs/platform-express';
import { NestFactory } from '@nestjs/core';
import { AppModule } from './app.module';
import { SwaggerModule } from '@nestjs/swagger';
import { DocumentBuilder } from '@nestjs/swagger/dist';
import * as basicAuth from 'express-basic-auth';
import * as path from 'path';
import { ValidationPipe } from '@nestjs/common/pipes/validation.pipe';

async function bootstrap() {
  const app = await NestFactory.create<NestExpressApplication>(AppModule);
  const mode: boolean = process.env.MODE === 'dev' ? true : false;
  const docConfig = new DocumentBuilder()
    .setTitle(process.env.DOC_TITLE)
    .setDescription(process.env.DOC_DESCRIPTION)
    .setVersion(process.env.DOC_VERSION)
    .build();
  const document = SwaggerModule.createDocument(app, docConfig);
  SwaggerModule.setup('api-docs', app, document);

  // [APP USE]
  app.useGlobalPipes(new ValidationPipe()); // class별 validation 작동
  app.use(
    '/api-docs',
    basicAuth({
      users: {
        [process.env.SWAGGER_USER]: process.env.SWAGGER_PASSWORD,
      },
      challenge: true,
    }),
  );
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
