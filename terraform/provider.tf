provider "aws" {
  region                      = "us-east-1"
  access_key                  = "mock_access_key"
  secret_key                  = "mock_secret_key"
  skip_credentials_validation = true
  skip_metadata_api_check     = true
  skip_requesting_account_id  = true
  #s3_force_path_style         = true
  endpoints {
    ec2             = "http://localhost:4566"
    iam             = "http://localhost:4566"
    sts             = "http://localhost:4566"
    s3              = "http://localhost:4566"
    dynamodb        = "http://localhost:4566"
    apigateway      = "http://localhost:4566"
    lambda          = "http://localhost:4566"
    route53         = "http://localhost:4566"
    cloudformation  = "http://localhost:4566"
    cloudwatch      = "http://localhost:4566"
    autoscaling     = "http://localhost:4566"
    elasticloadbalancing = "http://localhost:4566"
    // Añade más endpoints según sea necesario
  }
}
