import { MiddlewareConsumer, NestModule } from '@nestjs/common';
export declare class AppModule implements NestModule {
    private readonly mode;
    configure(consumer: MiddlewareConsumer): void;
}
