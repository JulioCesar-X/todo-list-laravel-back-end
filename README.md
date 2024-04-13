# Todo List Project with Laravel
This repository contains an example project for a Todo List with a Laravel Backend, creating a Restful API. It utilizes Docker for containerization, providing an easy configuration and consistent development environment.

# Requirements
- Docker

# Local Development Requirements
- Ubuntu 20.04 base image
- XAMPP (Apache, MySQL)
- Composer
- PHP v7.4
- ZSH

# How to Use
- Clone the repository:
    git clone https://github.com/juliocar-x/todo-list-laravel-back-end.git

- Navigate to the project directory:
    cd todo-List-Laravel-Back-End

- Build and start the Docker container:
    docker build -t laravel-backend .
    docker run -d -p 8000:80 --name laravel-container laravel-backend

- Wait until the container is running. Then you can access the application at http://localhost:8000.

# Development
To develop in this project, follow the steps below:
- Install Laravel dependencies:
    docker exec -it laravel-container composer install

- Copy the .env environment file:
    docker exec -it laravel-container cp .env.example .env

- Generate the Laravel application key:
    docker exec -it laravel-container php artisan key:generate

You can now edit the Laravel source code locally on your machine.
To reflect your changes within the container, you may need to restart the container.

- To stop the Docker environment:
    docker stop laravel-container