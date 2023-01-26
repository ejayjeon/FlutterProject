import { SequelizeModuleOptions } from '@nestjs/sequelize';

export const dbHost: SequelizeModuleOptions = {
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