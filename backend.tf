terraform {
  backend "s3" {
    bucket = "moc-tf-state"
    key    = "moc-github.json"
    region = "us-east-1"
  }
}
