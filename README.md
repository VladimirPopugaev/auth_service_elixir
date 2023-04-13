# AuthService

# How to start

#### !!! You will need docker compose to run it!!!

1. Clone this repository to yourself locally using the command:

```git clone https://github.com/VladimirPopugaev/auth_service_elixir.git```

2. Run the docker compose file from the command line:

```docker compose up --build -d```

3. Add migrations to the database using the command:

```docker exec -it auth_service bin/auth_service eval "AuthService.Release.migrate"```

4. The app is now available at `http://localhost:4001`


# About project

The project implements a microservice for user authorization based on a JWT token. It supports requests: 
1. creation
2. authorization
3. account sign out
4. Manipulating the account