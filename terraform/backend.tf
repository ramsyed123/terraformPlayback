terraform{
    backend "s3" {
        bucket= "tfstatebucket133"
        key = "terraform/terraform.tfstate"
        region= "us-east-1"
    }
}
