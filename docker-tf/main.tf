# My Name is BMEANS WUZ HERE


/* Adds in the Docker provider so
that we can use this specific
Docker container */

terraform {
  required_providers {
    docker = {
      source  = "kreuzwerker/docker"
      version = "~> 2.22.0"
    }
  }
}

provider "docker" {}

// Pulls down an nginx docker image
resource "docker_image" "nginx" {
  name         = "nginx:1.19.6"
  keep_locally = true    // keep image after "destroy"
}


// Names an nginx docker container tutorial
resource "docker_container" "nginx" {
  image = docker_image.nginx.image_id
  name  = "tutorial"
  ports {
    internal = 80
    external = 2224
  }
}

