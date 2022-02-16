
  module "service-medus86d26" {
    source = "git::https://github.com/diggerhq/module-fargate-service.git?ref=v2.0.3"

    ecs_cluster = aws_ecs_cluster.app
    service_name = "medus86d26"
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
    health_check = "/health"

    

    

    

    

    

    

    # health_check_interval
    # health_check_timeout
    # health_check_matcher
    # lb_access_logs_expiration_days
    container_port = "9000"
    # replicas
    container_name = "medus4fa49-produ9b715-medus86d26"
    launch_type = "FARGATE"
    # ecs_autoscale_min_instances
    # ecs_autoscale_max_instances
    default_backend_image = "quay.io/turner/turner-defaultbackend:0.2.0"
    tags = var.tags

    


    # for *.dggr.app listeners
    
      dggr_acm_certificate_arn = "arn:aws:acm:us-west-2:209539466991:certificate/d2c986c5-6c6f-4642-abe5-2666fc3af7d8"
    


    task_cpu = "256" 
    task_memory = "512" 

    
  }

  
  

  


  # *.dggr.app domains
   
    resource "aws_route53_record" "medus86d26_dggr_r53" {
      provider = aws.digger
      zone_id = "Z01023802GBWXW1MRJGTO"
      name    = "medus4fa49-produ9b715-medus86d26.dggr.app"
      type    = "A"

      alias {
        name                   = module.service-medus86d26.lb_dns
        zone_id                = module.service-medus86d26.lb_zone_id
        evaluate_target_health = false
      }
    }

    output "medus86d26_dggr_domain" {
        value = aws_route53_record.medus86d26_dggr_r53.fqdn
    }
  

  output "medus86d26_docker_registry" {
    value = module.service-medus86d26.docker_registry
  }

  output "medus86d26_lb_dns" {
    value = module.service-medus86d26.lb_dns
  }

  output "medus86d26_lb_arn" {
    value = module.service-medus86d26.lb_arn
  }

  output "medus86d26_lb_http_listener_arn" {
    value = module.service-medus86d26.lb_http_listener_arn
  }

  output "medus86d26" {
    value = ""
  }




