"use strict";
var __decorate = (this && this.__decorate) || function (decorators, target, key, desc) {
    var c = arguments.length, r = c < 3 ? target : desc === null ? desc = Object.getOwnPropertyDescriptor(target, key) : desc, d;
    if (typeof Reflect === "object" && typeof Reflect.decorate === "function") r = Reflect.decorate(decorators, target, key, desc);
    else for (var i = decorators.length - 1; i >= 0; i--) if (d = decorators[i]) r = (c < 3 ? d(r) : c > 3 ? d(target, key, r) : d(target, key)) || r;
    return c > 3 && r && Object.defineProperty(target, key, r), r;
};
var __metadata = (this && this.__metadata) || function (k, v) {
    if (typeof Reflect === "object" && typeof Reflect.metadata === "function") return Reflect.metadata(k, v);
};
Object.defineProperty(exports, "__esModule", { value: true });
exports.CacheService = void 0;
const common_1 = require("@nestjs/common");
const product_data_1 = require("./product.data");
const product_entity_1 = require("../product/entities/product.entity");
const uuid_1 = require("uuid");
const restaurant_entity_1 = require("../restaurant/entities/restaurant.entity");
const restaurant_data_1 = require("./restaurant.data");
const rating_entity_1 = require("../rating/entities/rating.entity");
const user_entity_1 = require("../user/entities/user.entity");
const faker_1 = require("@faker-js/faker");
const rating_data_1 = require("./rating.data");
const uuidNamespace = '6dbe4c21-009b-4b22-a9be-1c3eca2bc9ea';
let CacheService = class CacheService {
    constructor() {
        this.users = [
            new user_entity_1.User({
                id: 'f55b32d2-4d68-4c1e-a3ca-da9d7d0d92e5',
                username: 'test@codefactory.ai',
                password: 'testtest',
                imageUrl: '/logo/codefactory_logo.png',
                basket: [],
            }),
        ];
        this.orders = [];
        this.ratings = [];
        this.restaurants = [];
        this.products = [];
        this.createUsers();
        this.createRestaurants();
        this.createProducts();
        this.createRatings();
    }
    createProducts() {
        for (const restaurant of this.restaurants) {
            let products = [];
            switch (restaurant.name) {
                case '불타는 떡볶이':
                    products = product_data_1.ddeokBokGi;
                    break;
                case '매콤 멕시칸':
                    products = product_data_1.mexican;
                    break;
                case '엄마손 볶음밥':
                    products = product_data_1.friedRice;
                    break;
                case '신선 코팩 스시':
                    products = product_data_1.sushi;
                    break;
                case '사나이 대왕 스테이크':
                    products = product_data_1.steak;
                    break;
                case '현지맛 미미 쌀국수':
                    products = product_data_1.noodles;
                    break;
                case '불타는 냠냠 치킨':
                    products = product_data_1.chicken;
                    break;
                case '크리미 꾸덕 파스타':
                    products = product_data_1.italian;
                    break;
                default:
                    break;
            }
            products = products.map((item) => new product_entity_1.Product(Object.assign({ id: (0, uuid_1.v4)(), restaurant: new restaurant_entity_1.Restaurant(restaurant) }, item)));
            restaurant.products = products;
            this.products = [...this.products, ...products];
        }
    }
    getImagesByRestaurantName(name) {
        let images = [];
        switch (name) {
            case '불타는 떡볶이':
                images = product_data_1.ddeokBokGi.map((item) => item.imgUrl);
                break;
            case '매콤 멕시칸':
                images = product_data_1.mexican.map((item) => item.imgUrl);
                break;
            case '엄마손 볶음밥':
                images = product_data_1.friedRice.map((item) => item.imgUrl);
                break;
            case '신선 코팩 스시':
                images = product_data_1.sushi.map((item) => item.imgUrl);
                break;
            case '사나이 대왕 스테이크':
                images = product_data_1.steak.map((item) => item.imgUrl);
                break;
            case '현지맛 미미 쌀국수':
                images = product_data_1.noodles.map((item) => item.imgUrl);
                break;
            case '불타는 냠냠 치킨':
                images = product_data_1.chicken.map((item) => item.imgUrl);
                break;
            case '크리미 꾸덕 파스타':
                images = product_data_1.italian.map((item) => item.imgUrl);
                break;
            default:
                break;
        }
        return images;
    }
    createRestaurants() {
        const raws = new Array(100).fill(0).map((_, index) => new restaurant_entity_1.RestaurantDetail(Object.assign({ id: (0, uuid_1.v5)(`restaurant_${index}`, uuidNamespace), ratings: 5, ratingsCount: 100, products: [] }, restaurant_data_1.restaurants[index % restaurant_data_1.restaurants.length])));
        this.restaurants = raws;
    }
    createRatings() {
        const allRatings = [...rating_data_1.fiveStarRatings, ...rating_data_1.fourStarRatings];
        for (const restaurant of this.restaurants) {
            const randomInt = this.getRandomInt(100, 200);
            const indexArr = new Array(randomInt).fill(0).map((_, index) => {
                const randomImages = this.getImagesByRestaurantName(restaurant.name);
                randomImages.sort(() => Math.random() - 0.5);
                return new rating_entity_1.Rating(Object.assign({ id: (0, uuid_1.v4)(), restaurant: restaurant, imgUrls: index % 2 === 1 ? randomImages.slice(0, 5) : [], user: this.users[index % this.users.length] }, allRatings[index % allRatings.length]));
            });
            this.ratings = [...this.ratings, ...indexArr];
        }
        this.restaurants = this.restaurants.map((restaurant) => new restaurant_entity_1.RestaurantDetail(Object.assign(Object.assign({}, restaurant), { ratings: +this.ratings
                .filter((rating) => rating.restaurant.id === restaurant.id)
                .reduce((average, value, index, { length }) => index === length - 1
                ? (average + value.rating) / length
                : average + value.rating, 0)
                .toFixed(2) })));
    }
    createUsers() {
        for (let i = 0; i < 10000; i++) {
            this.users = [
                ...this.users,
                new user_entity_1.User({
                    id: (0, uuid_1.v4)(),
                    username: faker_1.faker.internet.email(),
                    password: faker_1.faker.datatype.string(16),
                    imageUrl: '/logo/codefactory_logo.png',
                    basket: [],
                }),
            ];
        }
    }
    getRandomInt(min, max) {
        min = Math.ceil(min);
        max = Math.floor(max);
        return Math.floor(Math.random() * (max - min) + min);
    }
};
CacheService = __decorate([
    (0, common_1.Injectable)(),
    __metadata("design:paramtypes", [])
], CacheService);
exports.CacheService = CacheService;
//# sourceMappingURL=cache.service.js.map