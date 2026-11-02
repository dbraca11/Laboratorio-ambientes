terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0"
    }
  }
}

provider "aws" {
  access_key = "test"
  secret_key = "test"
  region     = "us-east-1"
  
  # Configuración para que apunte a LocalStack (AWS emulado)
  endpoints {
    s3 = "http://localhost:4566"
  }
  
  # Evitar validaciones que fallarían al no ser una cuenta real de AWS
  skip_credentials_validation = true
  skip_requesting_account_id  = true
  skip_metadata_api_check     = true
}

# Creamos un "Bucket S3" de prueba
resource "aws_s3_bucket" "demo" {
  bucket = "mi-bucket-laboratorio"
}
