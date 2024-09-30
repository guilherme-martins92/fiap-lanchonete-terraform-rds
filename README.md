# Terraform AWS RDS Module

Este repositório contém código Terraform para provisionar e configurar um banco de dados Amazon RDS na AWS.

## Índice

- [Pré-requisitos](#pré-requisitos)
- [Recursos Provisionados](#recursos-provisionados)
- [Uso](#uso)
- [Variáveis](#variáveis)
- [Saídas](#saídas)
- [Comandos Úteis](#comandos-úteis)
- [Licença](#licença)

## Pré-requisitos

Antes de usar este repositório, você precisa ter os seguintes requisitos atendidos:

- [Terraform](https://www.terraform.io/downloads.html) versão >= 1.0.0
- Uma conta na [AWS](https://aws.amazon.com/)
- Configuração do [AWS CLI](https://docs.aws.amazon.com/cli/latest/userguide/cli-configure-quickstart.html)
- Credenciais válidas no `~/.aws/credentials`

## Recursos Provisionados

Este módulo do Terraform cria e configura os seguintes recursos na AWS:

- Amazon RDS Instance (MySQL, PostgreSQL, etc.)
- Subnet Group para o RDS
- Security Group para o acesso ao RDS
- Backup e retenção de snapshots
- (Opcional) Logs habilitados para o CloudWatch

## Uso

Você pode utilizar este repositório para provisionar um RDS configurado com seus parâmetros de escolha.

### Exemplo de uso:

```hcl
provider "aws" {
  region = "us-east-1"
}

module "rds" {
  source              = "./modules/rds"
  db_instance_class   = "db.t3.medium"
  allocated_storage   = 20
  engine              = "mysql"
  engine_version      = "8.0"
  db_name             = "mydatabase"
  username            = "admin"
  password            = "strongpassword"
  vpc_security_group_ids = ["sg-0123456789abcdef"]
  db_subnet_group_name = "my-subnet-group"
}
