

  # fetch data about the requester VPC

  # additional provider
  provider "aws" {
    alias  = "accepter"
    
    region = "us-east-1"
    
    # profile = var.aws_profile
    access_key = var.aws_key
    secret_key = var.aws_secret      
  }

  data "aws_vpc" "accepter" {
    provider = aws.accepter
    id = "vpc-0df8046b9bb28be75"
  }

  resource "aws_vpc_peering_connection" "peer_vpc-0df8046b9bb28be75" {
    # peer_owner_id = var.peer_owner_id
    peer_vpc_id   = "vpc-0df8046b9bb28be75"
    vpc_id        = local.vpc.id
    auto_accept   = false

    
    peer_region = "us-east-1"
    

    tags = {
      Name = "${var.ecs_cluster_name}-${var.environment}-PeerVPC"
    }
    # accepter {
    #   allow_remote_vpc_dns_resolution = true
    # }

    # requester {
    #   allow_remote_vpc_dns_resolution = true
    # }
  }


  # Accepter's side of the connection.
  resource "aws_vpc_peering_connection_accepter" "peer" {
    provider = aws.accepter
    vpc_peering_connection_id = aws_vpc_peering_connection.peer_vpc-0df8046b9bb28be75.id
    auto_accept               = true
  }  

  resource "aws_route" "requestor_vpc-0df8046b9bb28be75" {
    route_table_id = aws_route_table.route_table_public.id
    destination_cidr_block = data.aws_vpc.accepter.cidr_block
    vpc_peering_connection_id = aws_vpc_peering_connection.peer_vpc-0df8046b9bb28be75.id
  }


