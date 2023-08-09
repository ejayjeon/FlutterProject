import { Module, MiddlewareConsumer, NestModule } from '@nestjs/common';
import { dbHost } from './common/config/db_config';
import { ConfigModule } from '@nestjs/config';
import { AuthModule } from './auth/auth.module';
import { PostModule } from './post/post.module';
import { SequelizeModule } from '@nestjs/sequelize';

@Module({
  imports: [
    // SequelizeModule.forRoot(dbHost),
    ConfigModule.forRoot(),
    AuthModule,
    PostModule,
  ],
  controllers: [],
  providers: [],
})
export class AppModule implements NestModule {
  private readonly mode: boolean = process.env.MODE === 'dev' ? true : false;
  configure(consumer: MiddlewareConsumer) {
    // throw new Error('Method not implemented.');
  }
}
