terraform {
  backend "s3" {
    key = "terraform/tfstate.tfstate"
    bucket = "remote-backend-haithar"
    region = "us-east-1"
    access_key = "AKIAZUCQ5R7HUEIRKEFD"
    secret_key = "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"
  }
}