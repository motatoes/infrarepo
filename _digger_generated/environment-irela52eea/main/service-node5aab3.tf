
  module "service-node5aab3" {
    source = "git::https://github.com/diggerhq/module-fargate-service.git?ref=v2.0.3"

    ecs_cluster = aws_ecs_cluster.app
    service_name = "node5aab3"
    region = var.region
    service_vpc = local.vpc
    service_security_groups = [aws_security_group.ecs_service_sg.id]
    # image_tag_mutability

    
      lb_subnet_a = aws_subnet.public_subnet_c
      lb_subnet_b = aws_subnet.public_subnet_d      
    

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
    container_port = "8081"
    # replicas
    container_name = "real96c3a-irela52eea-node5aab3"
    launch_type = "FARGATE"
    # ecs_autoscale_min_instances
    # ecs_autoscale_max_instances
    default_backend_image = "quay.io/turner/turner-defaultbackend:0.2.0"
    tags = var.tags

    
      lb_ssl_certificate_arn = "arn:aws:acm:us-west-1:209539466991:certificate/5bbb9a61-adde-42bf-bd51-34b5522148db"
    


    # for *.dggr.app listeners
    


    task_cpu = "512" 
    task_memory = "2048" 

    
  }

  
  

  


  # *.dggr.app domains
  

  output "node5aab3_docker_registry" {
    value = module.service-node5aab3.docker_registry
  }

  output "node5aab3_lb_dns" {
    value = module.service-node5aab3.lb_dns
  }

  output "node5aab3_lb_arn" {
    value = module.service-node5aab3.lb_arn
  }

  output "node5aab3_lb_http_listener_arn" {
    value = module.service-node5aab3.lb_http_listener_arn
  }

  output "node5aab3" {
    value = ""
  }




