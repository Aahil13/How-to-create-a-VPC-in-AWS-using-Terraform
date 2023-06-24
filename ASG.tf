######################################################################################
#                             AUTO SCALING GROUP MODULE
######################################################################################

module "asg" {
  source = "terraform-aws-modules/autoscaling/aws"

  # Launch configuration
  launch_template_name = "asg_launch_template"

  image_id        = var.image_id
  instance_type   = var.instance_type
  security_groups = [aws_security_group.alb_sg.id]

  block_device_mappings = [
    {
      # Root volume
      device_name = "/dev/xvda"
      no_device   = 0
      ebs = {
        delete_on_termination = true
        encrypted             = true
        volume_size           = 20
        volume_type           = "gp2"
      }
      }, {
      device_name = "/dev/sda1"
      no_device   = 1
      ebs = {
        delete_on_termination = true
        encrypted             = true
        volume_size           = 30
        volume_type           = "gp2"
      }
    }
  ]

  # Auto scaling group
  name                      = "demo_instance_auto"
  vpc_zone_identifier       = [aws_subnet.private_subnet_1a.id, aws_subnet.private_subnet_1b.id]
  health_check_type         = "EC2"
  min_size                  = 0
  max_size                  = 2
  desired_capacity          = 1
  wait_for_capacity_timeout = 0
  key_name                  = var.keypair

  user_data = base64encode(file("apache.sh"))
}