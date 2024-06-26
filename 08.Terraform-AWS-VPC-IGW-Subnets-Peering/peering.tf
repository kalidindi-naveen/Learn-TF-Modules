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

# count is useful to control when resource is required
resource "aws_route" "public_peering" {
  count                     = var.enable_peering && var.acceptor_vpc_id == "" ? 1 : 0
  route_table_id            = aws_route_table.public.id
  destination_cidr_block    = data.aws_vpc.default.cidr_block
  vpc_peering_connection_id = aws_vpc_peering_connection.peer[0].id
}

resource "aws_route" "private_peering" {
  count                     = var.enable_peering && var.acceptor_vpc_id == "" ? 1 : 0
  route_table_id            = aws_route_table.private.id
  destination_cidr_block    = data.aws_vpc.default.cidr_block
  vpc_peering_connection_id = aws_vpc_peering_connection.peer[0].id
}

resource "aws_route" "database_peering" {
  count                     = var.enable_peering && var.acceptor_vpc_id == "" ? 1 : 0
  route_table_id            = aws_route_table.database.id
  destination_cidr_block    = data.aws_vpc.default.cidr_block
  vpc_peering_connection_id = aws_vpc_peering_connection.peer[0].id
}

resource "aws_route" "default_peering" {
  count                     = var.enable_peering && var.acceptor_vpc_id == "" ? 1 : 0
  route_table_id            = data.aws_route_table.main.id # default vpc route table
  destination_cidr_block    = var.cidr_block
  vpc_peering_connection_id = aws_vpc_peering_connection.peer[0].id
}