resource "aws_route53_record" "expense" {
  count           = length(var.instances)
#   count           = 3
  zone_id         = var.zone_Id
  name            = "${var.instances[count.index]}.${var.domain_name}"
  type            = "A"
  ttl             = 1
  records         = [aws_instance.expense[count.index].private_ip]
  allow_overwrite = true
}

resource "aws_route53_record" "frontend" {
  zone_id         = var.zone_Id
  name            = var.domain_name
  type            = "A"
  ttl             = 1
  records         = [aws_instance.expense[2].public_ip]
  allow_overwrite = true
}