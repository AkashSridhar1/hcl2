variable "app_name" {
  description = "The name of the application"
  type        = string
  default     = "appointment-service"
}

variable "environment" {
  description = "The environment for the deployment"
  type        = string
  default     = "prod"
}

variable "region" {
  description = "The AWS region to deploy the application"
  type        = string
  default     = "us-east-1"
}

variable "desired_count" {
  description = "The desired number of instances for the service"
  type        = number
  default     = 1
}

variable "cpu" {
  description = "The amount of CPU to allocate for the task"
  type        = string
  default     = "256"
}

variable "memory" {
  description = "The amount of memory to allocate for the task"
  type        = string
  default     = "512"
}

variable "vpc_id" {
  description = "The VPC ID where the service will be deployed"
  type        = string
}

variable "subnet_ids" {
  description = "The subnet IDs where the service will be deployed"
  type        = list(string)
}

variable "security_group_ids" {
  description = "The security group IDs to associate with the service"
  type        = list(string)
}