terraform {
  backend "s3" {
    bucket = "moc-tf-state"
    key    = "moc-github-archived"
    region = "us-east-1"
  }
}
