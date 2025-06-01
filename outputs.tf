output "container_id" {
  description = "The ID of the created Docker container"
  value       = docker_container.nginx_server.id
}

output "nginx_url" {
  description = "URL to access the nginx server from host"
  value       = "http://localhost:8080"
}