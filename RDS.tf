
# Configure the VPC
resource "aws_vpc" "mainRDS" {
  cidr_block = "10.0.0.0/16"

  tags = {
    Name = "rds-vpc"
  }
}

resource "aws_subnet" "publicRDS" {
  vpc_id     = aws_vpc.mainRDS.id
  cidr_block = "10.0.2.0/24"

  tags = {
    Name = "rds-public-subnet"
  }
}

# Create the security group for the RDS instance
resource "aws_security_group" "rds_sg" {
  name   = "rds-sqlserver-sg"
  vpc_id = aws_vpc.mainRDS.id

  ingress {
    from_port   = 1433
    to_port     = 1433
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}

resource "aws_db_subnet_group" "main" {
  name       = "rds-sqlserver-subnet-group"
  subnet_ids = aws_subnet.publicRDS.id

  tags = {
    Name = "rds-sqlserver-subnet-group"
  }
}



# Create the RDS instance
resource "aws_db_instance" "main" {
  allocated_storage = 10
  engine             = "sqlserver-ee"
  engine_version     = "SQL Server 2019 Developer"
  instance_class     = "db.t3.micro"
  identifier         = "rds-sqlserver"
  db_name            = "fiap-sa"
  password           = "@Fiap12345678"
  port               = 1433
  skip_final_snapshot = true
  username           = "admin"

  vpc_security_group_ids = [aws_security_group.rds_sg.id]
  db_subnet_group_name   = aws_db_subnet_group.main.name

  tags = {
    Name = "rds-sqlserver"
  }
}

# Definir a variável para a senha do RDS
variable "rds_password" {
  type = string
}

# Definir as saídas
output "rds_endpoint" {
  value = aws_db_instance.main.address
}

output "rds_password" {
  value = var.rds_password
}
