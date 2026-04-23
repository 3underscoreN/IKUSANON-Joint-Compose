# IKUSANON Joint Compose
This is a not-so-"monorepo" respoitory for all applications developed for IKUSANON.

## Applications
- [IKUSANON Bot](https://github.com/3underscoreN/IKU.SAN.ON._Chunithm_Bot)
  - This is the `bot` instance, which is a discord bot that provides users an entry point to the INKUSANON Boostday Form outlined below. It also comes with its own features.
- [IKUSANON Boostday Form](https://github.com/3underscoreN/ikusanon_boostday_form)
  - This is the `web` instance, which is more of the "brain" of all applications. It provides users with a form to fill out their proposed boostdays. Also comes with a database for storing the inputs, and APIs for the frontend, as well as the bot to interact with the database.

## Building
To build the applications, you would need [Docker](https://docs.docker.com/get-started/get-docker/) installed.

1. Clone the repository and navigate to the directory:
```sh
git clone https://github.com/3underscoreN/IKUSANON-Joint-Compose
cd IKUSANON-Joint-Compose
```

2. Populate `.env.dev.example` with the necessary environment variables using your favorite text editor. Then rename it to `.env.dev`.
```sh
mv .env.dev.example .env.dev
```

3. Run the following command to build and start the applications:
```sh
docker compose --env-file .env.dev -f docker-compose.dev.yml up -d
```
