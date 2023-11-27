module.exports = {
  type: 'postgres',
  host: 'localhost',
  port: 5432,
  database: 'short_url_service',
  username: 'postgres',
  password: 'postgres',
  logging: true,
  synchronize: true,
  subscribers: [
    "subscriber/*.js"
  ],
  entitySchemas: [
    "schema/*.json"
  ],
  migrations: [__dirname + '/migrations/*{.ts,.js}'],
  entities: [__dirname + '/src/entities/*.entity.{ts,js}'],
}