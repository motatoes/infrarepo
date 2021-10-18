
  module "service-node4e81e" {
    source = "git::https://github.com/diggerhq/module-fargate-service.git?ref=v2.0.2"

    ecs_cluster = aws_ecs_cluster.app
    service_name = "node4e81e"
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
    container_name = "multib190e-qalon293f3-node4e81e"
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
  

  output "node4e81e_docker_registry" {
    value = module.service-node4e81e.docker_registry
  }

  output "node4e81e_lb_dns" {
    value = module.service-node4e81e.lb_dns
  }

  output "node4e81e" {
    value = ""
  }




