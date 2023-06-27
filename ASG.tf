######################################################################################
#                         AUTO SCALING GROUP CONFIGURATION
######################################################################################

resource "aws_launch_configuration" "demo_instance_auto" {
  name            = "demo_instance_auto"
  image_id        = var.image_id
  instance_type   = var.instance_type
  key_name        = var.keypair
  security_groups = [aws_security_group.ec2_sg.id]
  user_data       = base64encode(file("apache.sh"))
}

resource "aws_autoscaling_group" "asg" {
  max_size                  = 2
  min_size                  = 0
  health_check_grace_period = 300
  health_check_type         = "ELB"
  desired_capacity          = 1
  force_delete              = true
  depends_on                = [aws_launch_configuration.demo_instance_auto]
  vpc_zone_identifier       = [aws_subnet.private_subnet_1a.id, aws_subnet.private_subnet_1b.id]
  launch_configuration      = aws_launch_configuration.demo_instance_auto.id
  target_group_arns         = [aws_lb_target_group.alb_tg.arn]

  timeouts {
    delete = "15m"
  }
}


