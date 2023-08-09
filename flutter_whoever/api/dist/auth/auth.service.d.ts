import { User } from '../user/entities/user.entity';
import { UserService } from '../user/user.service';
import { JwtService } from '@nestjs/jwt';
import { CacheService } from '../cache/cache.service';
export declare class AuthService {
    private cacheService;
    private userService;
    private jwtService;
    constructor(cacheService: CacheService, userService: UserService, jwtService: JwtService);
    verifyToken(token: string): any;
    rotateAccessToken(refreshToken: string): Promise<string>;
    signToken(user: any, isRefreshToken: boolean): string;
    authenticate(username: string, password: string): Promise<User | null>;
    login(user: User): Promise<{
        refreshToken: string;
        accessToken: string;
    }>;
}
