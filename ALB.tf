######################################################################################
#                      APPLICATION LOAD BALANCER CONFIGUATION
######################################################################################


# Create an ALB
resource "aws_lb" "alb" {
  name               = "alb"
  internal           = false
  load_balancer_type = "application"

  subnets         = [aws_subnet.public_subnet_1a.id, aws_subnet.public_subnet_1b.id]
  security_groups = [aws_security_group.alb_sg.id]


  tags = {
    Name = "alb"
  }
}

# Create a listener for the ALB
resource "aws_lb_listener" "alb_listener" {
  load_balancer_arn = aws_lb.alb.arn
  protocol          = "HTTP"
  port              = 80
  default_action {
    type             = "forward"
    target_group_arn = aws_lb_target_group.alb_tg.arn
  }
}
######################################################################################
######################################################################################

# Target Group Attachment
resource "aws_lb_target_group_attachment" "alb_attachment" {
  target_group_arn = aws_lb_target_group.alb_tg.arn
  target_id        = aws_instance.demo_instance.id
  port             = 80
}

resource "aws_lb_target_group_attachment" "new_instance" {
  target_group_arn = aws_lb_target_group.alb_tg.arn
  target_id        = "i-05a64885e30c395c9"
  port             = 80
}

resource "aws_lb_target_group_attachment" "new_asg" {
  target_group_arn = aws_lb_target_group.alb_tg.arn
  target_id        = "i-00b678b492d268f8c"
  port             = 80
}