resource "aws_vpc_peering_connection" "peer" {
  count = var.enable_peering ? 1 : 0

  vpc_id      = aws_vpc.this.id                                                           # requester
  peer_vpc_id = var.acceptor_vpc_id == "" ? data.aws_vpc.default.id : var.acceptor_vpc_id # acceptor
  auto_accept = var.acceptor_vpc_id == "" ? true : false

  tags = merge(
    var.common_tags,
    var.peering_tags,
    {
      Name = local.resource_name
    }
  )
}