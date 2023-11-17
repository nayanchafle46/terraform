resource "aws_s3_bucket" "bucket" {
    bucket                      = "flavum-dev-user-profile-photo"
    tags                        = {
        "Environment" = "dev"
        "Name"        = "flavum-dev-user-profile-photo"
    }
    tags_all                    = {
        "Environment" = "dev"
        "Name"        = "flavum-dev-user-profile-photo"
    } 
}

resource "aws_s3_bucket_acl" "example" {
  bucket = aws_s3_bucket.bucket.id
}
