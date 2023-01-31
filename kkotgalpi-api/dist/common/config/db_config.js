"use strict";
Object.defineProperty(exports, "__esModule", { value: true });
exports.dbHost = void 0;
exports.dbHost = {
    dialect: 'mysql',
    host: process.env.DB_HOST,
    port: 3306,
    username: process.env.DB_USER,
    password: process.env.DB_PWD,
    database: process.env.DB_DATABASE,
    retryAttempts: 10,
    retryDelay: 5000,
    autoLoadModels: true,
};
//# sourceMappingURL=db_config.js.map