terraform {
  backend "s3" {
    bucket = "pavi-cicdpipleine-2k25" 
    key    = "EKS/terraform.tfstate"
    region = "us-east-1"
  }
}
