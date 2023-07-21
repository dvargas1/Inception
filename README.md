<div align="center">

![inception badge](https://github.com/byaliego/42-project-badges/blob/main/badges/inceptionm.png)

</div>

# Inception
> A project about containers

In this project, the main objective is to build a small-scale infrastructure within a virtual machine using Docker Compose. The critical aspect here is to ensure that each service runs in its dedicated container, and to achieve this, each Docker image must be named after its corresponding service. This setup will create a modular and efficient system where services can operate independently yet interact with each other seamlessly.

Docker Compose simplifies the process of orchestrating and managing containers, making it easier to deploy, maintain, and scale the infrastructure. By following specific rules and best practices, this project will result in a cohesive and functional environment, ideal for small-scale projects or as a foundation for more complex infrastructures in the future.

## Mandatory

* NGINX with TLSv1.2 or TLSv1.3 only.
* WordPress + php-fpm
* MariaDB only without nginx
* Volumes
    * WordPress database
	* WordPress database
* Network
    * docker-network


## Bonus

* Redis cache for your WordPres
* FTP server container pointing to the volume of your WordPress website
* Static website in the language of your choice except PHP
* Adminer
* Service of your choice that you think is useful

### Service of your choice

For this project, I decided to include two additional services. I created a specific monitoring network where Grafana is responsible for visualizing the data served by Prometheus and Cadvisor. Additionally, I paid a small tribute to the website that has taught me so much about Docker and has an incredible community - Linuxtips.com. I deployed an application called "Giropops Senhas," which was entirely created during a live session by Jeferson.

## Inception Diagram

![Compose Diagram](https://raw.github.com/dvargas1/inception/master/docker-compose.png)