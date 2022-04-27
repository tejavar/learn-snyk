provider "google" {
  region = var.region

  default_tags {
    tags = {
      hashicorp-learn = "learn-run-tasks-snyk"
    }
  }
}

resource "google_cloud_identity_groups" "allow_ssh" {
  name        = "allow_ssh"
  description = "Allow SSH inbound from anywhere"

  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
}
