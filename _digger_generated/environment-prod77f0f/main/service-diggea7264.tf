
module "monitoring-diggea7264" {
  count = var.monitoring_enabled ? 1 : 0
  source = "./monitoring"
  ecs_cluster_name = aws_ecs_cluster.app.name
  ecs_service_name = "diggea7264"
  alarms_sns_topic_arn = var.alarms_sns_topic_arn
}


  module "service-diggea7264" {
    source = "../module-fargate-service"

    ecs_cluster = aws_ecs_cluster.app
    service_name = "diggea7264"
    region = var.region
    service_vpc = local.vpc
    service_security_groups = [aws_security_group.ecs_service_sg.id]
    # image_tag_mutability

    
      lb_subnet_a = aws_subnet.public_subnet_a
      lb_subnet_b = aws_subnet.public_subnet_b
    

    # lb_port
    # lb_protocol

    # override by environmentconfig but also possible to have service internal be true
    
      internal = false
    

    # deregistration_delay
    health_check = "/"

    

    

    

    

    

    

    # health_check_interval
    # health_check_timeout
    # health_check_matcher
    # lb_access_logs_expiration_days
    container_port = "3000"
    # replicas
    container_name = "diggeb374b-prod77f0f-diggea7264"
    launch_type = "FARGATE"
    # ecs_autoscale_min_instances
    # ecs_autoscale_max_instances
    default_backend_image = "quay.io/turner/turner-defaultbackend:0.2.0"
    tags = var.tags

    
      lb_ssl_certificate_arn = "arn:aws:acm:us-east-1:739940681129:certificate/a0adf19c-75bc-49fe-812c-903e3a2fd6a9"
    


    # for *.dggr.app listeners
    


    task_cpu = "256" 
    task_memory = "512" 

    
  }

  
  

  


  # *.dggr.app domains
  

  output "diggea7264_docker_registry" {
    value = module.service-diggea7264.docker_registry
  }

  output "diggea7264_lb_dns" {
    value = module.service-diggea7264.lb_dns
  }

  output "diggea7264_lb_arn" {
    value = module.service-diggea7264.lb_arn
  }

  output "diggea7264_lb_http_listener_arn" {
    value = module.service-diggea7264.lb_http_listener_arn
  }

  output "diggea7264" {
    value = ""
  }




