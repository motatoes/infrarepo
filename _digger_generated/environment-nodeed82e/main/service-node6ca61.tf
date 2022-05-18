
module "monitoring-node6ca61" {
  count = var.monitoring_enabled ? 1 : 0
  source = "./monitoring"
  ecs_cluster_name = aws_ecs_cluster.app.name
  ecs_service_name = "node6ca61"
  alarms_sns_topic_arn = var.alarms_sns_topic_arn
}


  module "service-node6ca61" {
    source = "../module-fargate-service"

    ecs_cluster = aws_ecs_cluster.app
    service_name = "node6ca61"
    region = var.region
    service_vpc = local.vpc
    service_security_groups = [aws_security_group.ecs_service_sg.id]
    lb_enable_https_redirect = var.lb_enable_https_redirect
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
    container_port = "8080"
    # replicas
    container_name = "nodeae550-nodeed82e-node6ca61"
    launch_type = "FARGATE"
    # ecs_autoscale_min_instances
    # ecs_autoscale_max_instances
    default_backend_image = "quay.io/turner/turner-defaultbackend:0.2.0"
    tags = var.tags

    
      lb_ssl_certificate_arn = "arn:aws:acm:us-east-1:209539466991:certificate/cb409769-be79-4100-94ae-ac182c418d66"
    


    # for *.dggr.app listeners
    


    task_cpu = "256" 
    task_memory = "512" 

    
  }

  
  

  


  # *.dggr.app domains
  

  output "node6ca61_docker_registry" {
    value = module.service-node6ca61.docker_registry
  }

  output "node6ca61_lb_dns" {
    value = module.service-node6ca61.lb_dns
  }

  output "node6ca61_lb_arn" {
    value = module.service-node6ca61.lb_arn
  }

  output "node6ca61_lb_http_listener_arn" {
    value = module.service-node6ca61.lb_http_listener_arn
  }

  output "node6ca61" {
    value = ""
  }




