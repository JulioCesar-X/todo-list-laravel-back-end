# Todo List Project with Laravel
This repository contains a Todo List project utilizing a Laravel backend. It provides a RESTful API and uses Docker for containerization to ensure a consistent and easy-to-manage development environment.

## Requirements
- Docker
- Docker Compose

## Technologies Used
- Ubuntu 20.04: Base image for Docker.
- XAMPP: Includes Apache and MySQL services.
- PHP v7.4: Programming language used.
- Composer: Dependency manager for PHP.

## Setup and Usage
- Clone the repository to your local machine:
git clone https://github.com/juliocar-x/todo-list-laravel-back-end.git

- Enter:
cd todo-list-laravel-back-end

### Starting the Development Environment
- Use Docker Compose to build and start the services defined for Laravel and XAMPP:
docker-compose up -d

- This command builds the necessary Docker images, sets up and starts the containers. Your Laravel application is now accessible at http://localhost:8080 and phpMyAdmin at http://localhost:8000/phpmyadmin.

### Initial Configuration
- Install Laravel Dependencies
- Run Composer install within the Laravel container:
docker-compose exec laravel-app composer install

### Environment Configuration
- Copy the example environment file and generate an application key:

docker-compose exec laravel-app cp .env.example .env
docker-compose exec laravel-app php artisan key:generate

- Ensure the database settings in .env match those configured in docker-compose.yml.

### Development
- You can edit the Laravel source code locally on your machine. The changes will be reflected in the Docker container because the project directory is mounted as a volume in the docker-compose.yml.

- To apply changes that require a container restart or to refresh configurations:
docker-compose restart

- Stopping the Environment
To stop and remove the containers, use the following Docker Compose command:

docker-compose down

### Contributing
Contributions to the project are welcome. Please ensure any pull requests or changes maintain compatibility with the Docker setup.