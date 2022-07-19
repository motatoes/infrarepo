
module "monitoring-testb3047" {
  count = var.monitoring_enabled ? 1 : 0
  source = "./monitoring"
  ecs_cluster_name = aws_ecs_cluster.app.name
  ecs_service_name = "testb3047"
  alarms_sns_topic_arn = var.alarms_sns_topic_arn
}


  module "service-testb3047" {
    source = "../module-fargate-service"

    ecs_cluster = aws_ecs_cluster.app
    service_name = "testb3047"
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
    container_name = "test1a9ae-test042b8-testb3047"
    launch_type = "FARGATE"
    # ecs_autoscale_min_instances
    # ecs_autoscale_max_instances
    default_backend_image = "quay.io/turner/turner-defaultbackend:0.2.0"
    tags = var.tags

    


    # for *.dggr.app listeners
    
      dggr_acm_certificate_arn = "arn:aws:acm:us-east-1:739940681129:certificate/20be5ea8-0082-4346-90be-9890f94f10a0"
    


    task_cpu = "256" 
    task_memory = "512" 

    
  }

  
  

  


  # *.dggr.app domains
   
    resource "aws_route53_record" "testb3047_dggr_r53" {
      provider = aws.digger
      zone_id = "Z01023802GBWXW1MRJGTO"
      name    = "test1a9ae-test042b8-testb3047.dggr.app"
      type    = "A"

      alias {
        name                   = module.service-testb3047.lb_dns
        zone_id                = module.service-testb3047.lb_zone_id
        evaluate_target_health = false
      }
    }

    output "testb3047_dggr_domain" {
        value = aws_route53_record.testb3047_dggr_r53.fqdn
    }
  

  output "testb3047_docker_registry" {
    value = module.service-testb3047.docker_registry
  }

  output "testb3047_lb_dns" {
    value = module.service-testb3047.lb_dns
  }

  output "testb3047_task_security_group_id" {
    value = module.service-testb3047.task_security_group_id
  }

  output "testb3047_lb_arn" {
    value = module.service-testb3047.lb_arn
  }

  output "testb3047_lb_http_listener_arn" {
    value = module.service-testb3047.lb_http_listener_arn
  }

  output "testb3047" {
    value = ""
  }




