terraform{
    backend "s3" {
        bucket= "bucketk8"
        key = "terraform/terraform.tfstate"
        region= "us-east-1"
    }
}
