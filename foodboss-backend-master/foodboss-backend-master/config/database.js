const path = require('path');
const parse = require('pg-connection-string').parse

module.exports = ({ env }) => {
  if(env('NODE_ENV')==="production"){
    // const config = parse(process.env.DATABASE_URL);
    // return {
    //   defaultConnection: "default",
    //   connections: {
    //     default: {
    //       connector: "bookshelf",
    //       settings: {
    //         client: "postgres",
    //         host: env("DATABASE_HOST", "postgres"),
    //         port: env.int("DATABASE_PORT", 5432),
    //         database: env("DATABASE_NAME", "kyraFashion"),
    //         username: env("DATABASE_USERNAME", "kyraFashion26"),
    //         password: env("DATABASE_PASSWORD", "kyra@Fashion26"),
    //         // ssl: env.bool("DATABASE_SSL", false),
    //         ssl: {
    //           rejectUnauthorized: false
    //         },
    //       },
    //       options: {},
    //     },
    //   },
    // };
    return {
      connection: {
        client: 'postgres',
        connection: {
          host: env('DATABASE_HOST','postgres'),
          port: env.int('DATABASE_PORT',5432),
          database: env('DATABASE_NAME','foodboss_strapi'),
          user: env('DATABASE_USERNAME','foodboss_user'),
          password: env('DATABASE_PASSWORD','foodboss_password'),
          ssl: false,
        },
        debug: false,
      },
    }
  }
  return {
  connection: {
    client: 'sqlite',
    connection: {
      filename: path.join(__dirname, '..', env('DATABASE_FILENAME', '.tmp/data.db')),
    },
    useNullAsDefault: true,
  },
}
};