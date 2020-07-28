variable "namespace" {
  type        = string
  description = "Namespace, which could be your organization name or abbreviation, e.g. 'eg' or 'cp'"
  default     = ""
}

variable "stage" {
  type        = string
  description = "Stage, e.g. 'prod', 'staging', 'dev', OR 'source', 'build', 'test', 'deploy', 'release'"
  default     = ""
}

variable "attributes" {
  type        = list
  description = "Additional attributes (e.g. 1)"
  default     = []
}

variable "delimiter" {
  type        = string
  description = "Delimiter to be used between namespace, environment, stage, name and attributes"
  default     = "-"
}

variable "name" {
  type        = string
  description = "A prefix to add to project resources"
  default     = ""
}

variable "enable_key_rotation" {
  description = "Specifies whether key rotation is enabled"
  default     = true
}

variable "ssh_key_name" {
  type        = string
  description = "SSH key for ec2 ssh"
  default     = ""
}

variable "vpc_id" {
  type        = string
  description = "VPC-id"
  default     = ""
}

variable "public_subnet_id" {
  type        = list
  description = "A list of public subnet IDs to attach"
  default     = []
}

variable "private_subnet_id" {
  type        = list
  description = "A list of private subnet IDs to attach"
  default     = []
}

variable "rds_allocated_storage" {
  type        = string
  description = "The allocated storage in gigabytes"
  default     = "20"
}

variable "maintenance_window" {
  type        = string
  description = "The window to perform maintenance in. Syntax: 'ddd:hh24:mi-ddd:hh24:mi'. Eg: 'Mon:00:00-Mon:03:00'"
  default     = "Mon:00:00-Mon:03:00"
}

variable "backup_window" {
  type        = string
  description = "The daily time range (in UTC) during which automated backups are created if they are enabled. Example: '09:46-10:16'. Must not overlap with maintenance_window"
  default     = "03:00-06:00"
}

variable "mysql_name" {
  type        = string
  description = "The DB name to create. If omitted, no database is created initially"
  default     = ""
}

variable "mysql_username" {
  type        = string
  description = "Username for the master DB user"
  default     = ""
}

variable "mysql_password" {
  type        = string
  description = "Password for the master DB user. Note that this may show up in logs, and it will be stored in the state file"
  default     = ""
}

variable "mysql_port" {
  type        = number
  description = "The port on which the DB accepts connections"
  default     = 3306
}

variable "rds_multi_az" {
  type        = bool
  description = "Specifies if the RDS instance is multi-AZ"
  default     = false
}

variable "backup_retention_days" {
  type        = number
  description = "The days to retain backups for"
  default     = 1
}