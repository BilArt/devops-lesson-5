terraform {
  backend "s3" {
    bucket         = "artem-tfstate-lesson5-314175685469-eun1"
    key            = "lesson-5/terraform.tfstate"
    region         = "eu-north-1"
    dynamodb_table = "terraform-locks"
    encrypt        = true
    profile        = "tf-lesson5" # ← добавили это
  }
}
