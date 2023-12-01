variable "region" {
    type        = string
}
variable "cidr_block" {
    type        = string
}
variable "public_cidr1" {
    type        = string
}
variable "public_cidr2" {
    type        = string
}
variable "public_cidr3" {
    type        = string
}
variable "private_cidr1" {
    type        = string
}
variable "private_cidr2" {
    type        = string
}
variable "private_cidr3" {
    type        = string
}
variable "max_size" {
    type        = string
}
variable "min_size" {
    type        = string
}
variable "desired_capacity" {
    type        = string
}
variable "ssl_cert" {
    type        = string
}
variable "db_credentials" {
    type        = string
}
variable "s3_bucket_name" {
    type        = string
}

variable "tags" {
   type         = map(string)
}