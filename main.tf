terraform {
  required_providers {
    docker = {
      source  = "kreuzwerker/docker"
      version = "~> 3.0"         # Lock to any 3.x release (adjust as needed)
    }
  }
}

provider "docker" {
  # No extra settings needed if Docker daemon is on localhost and uses default socket.
  # host  = "unix:///var/run/docker.sock"
}

data "docker_image" "nginx_latest" {
  name = "nginx:latest"
}

resource "docker_container" "nginx_server" {
  # A human-readable name for the container:
  name  = "terraform-nginx-demo"

  # Use the image we pulled above:
  image = data.docker_image.nginx_latest.latest

  # Restart policy, optional (always restart on failure)
  restart = "unless-stopped"

  # Expose port 80 on the container and map to 8080 on the host
  ports {
    internal = 80
    external = 8080
  }

  # (Optional) If you want to mount volumes, uncomment and adjust:
  # mounts {
  #   target = "/usr/share/nginx/html"
  #   source = "${path.module}/site-content"
  #   type   = "bind"
   }
}





