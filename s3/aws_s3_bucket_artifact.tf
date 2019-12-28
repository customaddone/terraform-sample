resource "aws_s3_bucket" "artifact" {
  bucket = "customaddone-artifact-pragmatic-terraform"

  lifecycle_rule {
    enabled = true

    expiration {
      days = "180"
    }
  }
}

output "artifact_id" {
  value = "${aws_s3_bucket.artifact.id}"
}
