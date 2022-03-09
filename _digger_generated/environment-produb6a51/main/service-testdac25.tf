

  module "service-testdac25" {
    source = "../module-lambda-service-dockerless" 
    project_name = var.project_name
    environment = var.environment
    service_name = "testdac25"
    runtime = "nodejs14.x"
    
    lambda_role = aws_iam_role.default_iam_for_lambda.arn
    

    

    

    
  }



output "testdac25_docker_registry" {
  value = aws_ecr_repository.lambda_repo.repository_url
}

output "testdac25_lb_dns" {
  value = ""
}

output "testdac25_function_name" {
  value = module.service-testdac25.function_name
}

output "testdac25_lambda_arn" {
  value = module.service-testdac25.lambda_arn
}

output "testdac25_lambda_invoke_arn" {
  value = module.service-testdac25.lambda_invoke_arn
}