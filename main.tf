terraform {
  backend "s3" {
    bucket = "terraform-states.tobyjsullivan.com"
    key = "states/keybase-verification/terraform.tfstate"
    region = "us-east-1"
  }
}

variable "cloudflare_email" {}
variable "cloudflare_token" {}

provider "cloudflare" {
  email = "${var.cloudflare_email}"
  token = "${var.cloudflare_token}"
}

resource "cloudflare_record" "site-verification" {
  domain = "tobysullivan.net"
  name = "tobysullivan.net"
  value = "keybase-site-verification=F8-EfZijwTXgbwdzM7p-tUWqLjNVBZrfrxL5Ln2hnag"
  type = "TXT"
}

