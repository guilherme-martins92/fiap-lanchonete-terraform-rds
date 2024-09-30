# Terraform AWS RDS Module

Este repositório contém código Terraform para provisionar e configurar um banco de dados Amazon RDS na AWS.

## Índice

- [Pré-requisitos](#pré-requisitos)
- [Recursos Provisionados](#recursos-provisionados)

## Pré-requisitos

Antes de usar este repositório, você precisa ter os seguintes requisitos atendidos:

- [Terraform](https://www.terraform.io/downloads.html) versão >= 1.0.0
- Uma conta na [AWS](https://aws.amazon.com/)
- Configuração do [AWS CLI](https://docs.aws.amazon.com/cli/latest/userguide/cli-configure-quickstart.html)
- Credenciais válidas no `~/.aws/credentials`

## Recursos Provisionados

Este módulo do Terraform cria e configura os seguintes recursos na AWS:

- Amazon RDS Instance (SQL Server)
- Subnet Group para o RDS
- Security Group para o acesso ao RDS
