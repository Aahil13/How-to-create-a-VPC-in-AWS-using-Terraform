######################################################################################
#                             AUTO SCALING GROUP MODULE
######################################################################################

resource "aws_autoscaling_group" "asg" {
  max_size                  = 2
  min_size                  = 0
  health_check_grace_period = 300
  health_check_type         = "ELB"
  desired_capacity          = 1
  force_delete              = true
  vpc_zone_identifier       = [aws_subnet.private_subnet_1a.id, aws_subnet.private_subnet_1b.id]

  initial_lifecycle_hook {
    name                 = "demo_instance_auto"
    default_result       = "CONTINUE"
    heartbeat_timeout    = 2000
    lifecycle_transition = "autoscaling:EC2_INSTANCE_LAUNCHING"
  }

  launch_template {
    id = aws_launch_template.demo_instance_auto.id
  }

  timeouts {
    delete = "15m"
  }
}

resource "aws_launch_template" "demo_instance_auto" {

  image_id      = var.image_id
  instance_type = var.instance_type

  key_name  = var.keypair
  user_data = base64encode(file("apache.sh"))
}
