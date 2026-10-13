terraform {
  backend "s3" {
    bucket = "moc-tf-state"
    key    = "moc-github"
    region = "us-east-1"
  }
}
