######################################################################################
#                APPLICATION LOAD BALANCER TARGET GROUP CONFIGUATION
######################################################################################

resource "aws_lb_target_group" "alb_tg" {
  name     = "alb-tg"
  port     = 80
  protocol = "HTTP"
  vpc_id   = aws_vpc.demo_vpc.id
}

