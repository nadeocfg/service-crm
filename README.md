# service-crm

CRM for boilers service center industry

# Work flow

1. Client call to service center;
2. If client new, admin create new client on clients page
3. Admin create new order, add that client to order, add job types and parts and attach the service man to that order
4. Server calculate paid depend on service man percents
5. Service man take order in work with buttons on order page
6. After work is done, service man click "DONE" button on order page

# PERN Stack

- PostgreSQL
- Express
- React
- Node

## Instalation

Before installation you need to prepare Postgresql server with db(db dump included in repo) and .env file, for example:

```
  NODE_ENV = development
  PORT = 5000
  JWT_SECRET = secret_word_for_jwt_generation
  DB_USER = db_user_login
  DB_PASS = db_user_password
  DB_NAME = db_name
  DB_PORT = db_port
  DB_HOST = db_host
  TG_TOKEN = telegram_bot_token
```

1. `git clone git@github.com:nadeocfg/service-crm.git`
2. `cd path/to/project`
3. `yarn` or `npm install`
4. `cd ./frontend`
5. `yarn` or `npm install`

## Scripts

`yarn server` - Running express server with telegram bot

`yarn back` - Run only express server

`yarn client` - Run react app

`yarn bot` - Run telegram bot

`yarn start:dev` - Run express, telegram bot and react app concurrently

## Project description

### Entities

- Users
- Clients
- Orders
- Paids
- Cash

### Dictionaries

- User roles
- Job types
- Boilers
- Parts
- Order statuses

### Server requirements

- Installed Nodejs 16+;
- Installed ts-node(`npm install -g ts-node` - without this library, you not be able to run server.ts);
- Installed PostgreSQL server;
