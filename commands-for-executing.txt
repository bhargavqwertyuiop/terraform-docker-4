# 1. Initialize Terraform & download Docker provider
terraform init

# 2. Preview what Terraform will create
terraform plan

# 3. Create the container and pull the image
terraform apply
#   → Type “yes” when prompted

# 4. Inspect Terraform state
terraform state list
terraform state show docker_container.nginx_server

# 5. (Optional) Verify container in Docker
docker ps

# 6. Destroy everything created by Terraform
terraform destroy
#   → Type “yes” when prompted
