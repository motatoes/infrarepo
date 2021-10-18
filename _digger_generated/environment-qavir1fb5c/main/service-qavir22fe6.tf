
  module "service-qavir22fe6" {
    source = "git::https://github.com/diggerhq/module-fargate-service.git?ref=v2.0.2"

    ecs_cluster = aws_ecs_cluster.app
    service_name = "qavir22fe6"
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
    container_port = "8080"
    # replicas
    container_name = "multib190e-qavir1fb5c-qavir22fe6"
    launch_type = "FARGATE"
    # ecs_autoscale_min_instances
    # ecs_autoscale_max_instances
    default_backend_image = "quay.io/turner/turner-defaultbackend:0.2.0"
    tags = var.tags

    


    # for *.dggr.app listeners
    


    task_cpu = "256" 
    task_memory = "512" 
  }

  


  # *.dggr.app domains
  

  output "qavir22fe6_docker_registry" {
    value = module.service-qavir22fe6.docker_registry
  }

  output "qavir22fe6_lb_dns" {
    value = module.service-qavir22fe6.lb_dns
  }

  output "qavir22fe6" {
    value = ""
  }




