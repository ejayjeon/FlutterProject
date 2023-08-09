import { AuthService } from './auth.service';
import { UserService } from '../user/user.service';
export declare class AuthController {
    private readonly authService;
    private readonly userService;
    constructor(authService: AuthService, userService: UserService);
    login(req: any): Promise<{
        refreshToken: string;
        accessToken: string;
    }>;
    token(req: any): Promise<{
        accessToken: string;
    }>;
}
