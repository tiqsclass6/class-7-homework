terraform {
  backend "s3" {
    bucket  = "class-7-state-files"
    key     = "week-6-homework.tfstate"
    region  = "us-east-1"
    encrypt = true
  }
}
