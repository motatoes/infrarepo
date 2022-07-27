
module "monitoring-nodea6a056" {
  count = var.monitoring_enabled ? 1 : 0
  source = "./monitoring"
  ecs_cluster_name = aws_ecs_cluster.app.name
  ecs_service_name = "nodea6a056"
  alarms_sns_topic_arn = var.alarms_sns_topic_arn
}


  module "service-nodea6a056" {
    source = "../module-fargate-service"

    ecs_cluster = aws_ecs_cluster.app
    service_name = "nodea6a056"
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
    container_name = "nodea39b21-nodeafc8c7-nodea6a056"
    launch_type = "FARGATE"
    # ecs_autoscale_min_instances
    # ecs_autoscale_max_instances
    default_backend_image = "quay.io/turner/turner-defaultbackend:0.2.0"
    tags = var.tags

    


    # for *.dggr.app listeners
    
      dggr_acm_certificate_arn = "arn:aws:acm:us-east-1:209539466991:certificate/9b56736a-1b97-4ef4-a700-764d0c2a9d96"
    


    task_cpu = "256" 
    task_memory = "512" 

    
  }

  
  

  


  # *.dggr.app domains
   
    resource "aws_route53_record" "nodea6a056_dggr_r53" {
      provider = aws.digger
      zone_id = "Z01023802GBWXW1MRJGTO"
      name    = "nodea39b21-nodeafc8c7-nodea6a056.dggr.app"
      type    = "A"

      alias {
        name                   = module.service-nodea6a056.lb_dns
        zone_id                = module.service-nodea6a056.lb_zone_id
        evaluate_target_health = false
      }
    }

    output "nodea6a056_dggr_domain" {
        value = aws_route53_record.nodea6a056_dggr_r53.fqdn
    }
  

  output "nodea6a056_docker_registry" {
    value = module.service-nodea6a056.docker_registry
  }

  output "nodea6a056_lb_dns" {
    value = module.service-nodea6a056.lb_dns
  }

  output "nodea6a056_task_security_group_id" {
    value = module.service-nodea6a056.task_security_group_id
  }

  output "nodea6a056_lb_arn" {
    value = module.service-nodea6a056.lb_arn
  }

  output "nodea6a056_lb_http_listener_arn" {
    value = module.service-nodea6a056.lb_http_listener_arn
  }

  output "nodea6a056" {
    value = ""
  }




