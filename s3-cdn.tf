resource "aws_s3_bucket" "cdn-bucket" {
    bucket                      = "dev-cdn.falvumhealth.com"
    tags                        = {
        "Environment" = "dev"
        "Name"        = "dev-cdn.falvumhealth.com"
    }
    tags_all                    = {
        "Environment" = "dev"
        "Name"        = "dev-cdn.falvumhealth.com"
    }
}

resource "aws_s3_bucket_acl" "cdn-bucket" {
 bucket = aws_s3_bucket.cdn-bucket.id
}
