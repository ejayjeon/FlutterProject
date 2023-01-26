import { CanActivate, ExecutionContext } from '@nestjs/common';
import { AuthService } from './auth.service';
import { UserService } from '../user/user.service';
export declare class BearerTokenGuard implements CanActivate {
    private readonly authService;
    private readonly userService;
    constructor(authService: AuthService, userService: UserService);
    canActivate(context: ExecutionContext): Promise<boolean>;
}
export declare class AccessTokenGuard extends BearerTokenGuard {
    canActivate(context: ExecutionContext): Promise<boolean>;
}
export declare class RefreshTokenGuard extends BearerTokenGuard {
    canActivate(context: ExecutionContext): Promise<boolean>;
}
