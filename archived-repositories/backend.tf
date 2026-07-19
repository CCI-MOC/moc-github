terraform {
  backend "s3" {
    bucket = "moc-tf-state"
    key    = "moc-github-archived.json"
    region = "us-east-1"
  }
}
