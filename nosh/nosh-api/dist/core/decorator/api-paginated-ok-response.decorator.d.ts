import { Type } from '@nestjs/common';
import { ApiResponseOptions } from '@nestjs/swagger';
export declare const ApiPaginatedOkResponseDecorator: <T extends Type<any>>(model: T, options?: ApiResponseOptions) => <TFunction extends Function, Y>(target: object | TFunction, propertyKey?: string | symbol, descriptor?: TypedPropertyDescriptor<Y>) => void;
