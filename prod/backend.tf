bucket = "your-s3-bucket-name"
key    = "terraform/prod/terraform.tfstate"
region = "your-aws-region"

backend "s3" {
  bucket         = var.bucket
  key            = var.key
  region         = var.region
}