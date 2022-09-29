{
  "version": 4,
  "terraform_version": "1.3.0",
  "serial": 50,
  "lineage": "179dcda3-53e2-beb3-ad73-fb37802a7d1b",
  "outputs": {},
  "resources": [
    {
      "mode": "managed",
      "type": "aws_key_pair",
      "name": "deployer",
      "provider": "provider[\"registry.terraform.io/hashicorp/aws\"]",
      "instances": [
        {
          "schema_version": 1,
          "attributes": {
            "arn": "arn:aws:ec2:us-east-1:605303221660:key-pair/deployer-key",
            "fingerprint": "d8:c4:ee:54:02:c2:2c:38:12:6b:ef:ca:f9:8a:c9:1f",
            "id": "deployer-key",
            "key_name": "deployer-key",
            "key_name_prefix": "",
            "key_pair_id": "key-0907012d29ad85373",
            "key_type": "rsa",
            "public_key": "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABgQCztgnv2xC8DQOE+d9vtfAvvsF78A+4lHL6mQ/EHLo+Uoo5TEGfjQXUK943f/cmF5dSJZz7AgurhKPfp7LfOdbqRxTkwL9V6KOBO3XA+KWbak8Ju/JFyORyZaA0SmmD49MWR/9Lk5dBCp/zJ3DC599UlDuO0Sn59hF394kqnMRz1Hz2fk7eT8t8Bv3vsRYes6w11KeAGwY2hmNCsVZO2QadHrNnnHavwAk/HmgEufjYpzhA9deZH+qjIVtg7qjZlPwQ4zNCEeYpFcwLH7hW1jyaFoOriTP7RUmsoPTKuTR5mETNnBEW/N/qNw0JaLbhyhPL/iC1QmozTgSiOzHqQIOKaeCz1IcTt9yGz1FMYGCQnyjLgePps7n1b4hA5McFK1214PMwoze3l0zdYa3v2bEULxaa+cePgLQzeXbLeeg6uXUpshE4rNdE2/XjwrgzuWEfUNetgvKmhFPGZHmMZ0eJN6np4FZLxI9VBk6zBHDyBzUGoczpYhiBTOIROwZ1Mgk= ubuntu@ip-172-31-90-136",
            "tags": {},
            "tags_all": {}
          },
          "sensitive_attributes": [],
          "private": "eyJzY2hlbWFfdmVyc2lvbiI6IjEifQ=="
        }
      ]
    },
    {
      "mode": "managed",
      "type": "aws_security_group",
      "name": "allow_tls",
      "provider": "provider[\"registry.terraform.io/hashicorp/aws\"]",
      "instances": [
        {
          "schema_version": 1,
          "attributes": {
            "arn": "arn:aws:ec2:us-east-1:605303221660:security-group/sg-0651ea2cfbeb1ab99",
            "description": "Allow TLS inbound traffic",
            "egress": [
              {
                "cidr_blocks": [
                  "0.0.0.0/0"
                ],
                "description": "",
                "from_port": 0,
                "ipv6_cidr_blocks": [
                  "::/0"
                ],
                "prefix_list_ids": [],
                "protocol": "-1",
                "security_groups": [],
                "self": false,
                "to_port": 0
              }
            ],
            "id": "sg-0651ea2cfbeb1ab99",
            "ingress": [
              {
                "cidr_blocks": [
                  "10.0.0.0/16"
                ],
                "description": "",
                "from_port": 22,
                "ipv6_cidr_blocks": [],
                "prefix_list_ids": [],
                "protocol": "tcp",
                "security_groups": [],
                "self": false,
                "to_port": 22
              },
              {
                "cidr_blocks": [
                  "10.0.0.0/16"
                ],
                "description": "TLS from VPC",
                "from_port": 80,
                "ipv6_cidr_blocks": [],
                "prefix_list_ids": [],
                "protocol": "tcp",
                "security_groups": [],
                "self": false,
                "to_port": 80
              }
            ],
            "name": "allow_tls",
            "name_prefix": "",
            "owner_id": "605303221660",
            "revoke_rules_on_delete": false,
            "tags": {
              "Name": "allow_tls"
            },
            "tags_all": {
              "Name": "allow_tls"
            },
            "timeouts": null,
            "vpc_id": "vpc-085389fb00168854b"
          },
          "sensitive_attributes": [],
          "private": "eyJlMmJmYjczMC1lY2FhLTExZTYtOGY4OC0zNDM2M2JjN2M0YzAiOnsiY3JlYXRlIjo2MDAwMDAwMDAwMDAsImRlbGV0ZSI6OTAwMDAwMDAwMDAwfSwic2NoZW1hX3ZlcnNpb24iOiIxIn0=",
          "dependencies": [
            "aws_vpc.main"
          ]
        }
      ]
    },
    {
      "mode": "managed",
      "type": "aws_vpc",
      "name": "main",
      "provider": "provider[\"registry.terraform.io/hashicorp/aws\"]",
      "instances": [
        {
          "schema_version": 1,
          "attributes": {
            "arn": "arn:aws:ec2:us-east-1:605303221660:vpc/vpc-085389fb00168854b",
            "assign_generated_ipv6_cidr_block": false,
            "cidr_block": "10.0.0.0/16",
            "default_network_acl_id": "acl-063eb374e62b2a6ed",
            "default_route_table_id": "rtb-03537080ceba3a44f",
            "default_security_group_id": "sg-001751cd0e2ce0098",
            "dhcp_options_id": "dopt-0d2b1c9cb8b25c6ed",
            "enable_classiclink": false,
            "enable_classiclink_dns_support": false,
            "enable_dns_hostnames": false,
            "enable_dns_support": true,
            "id": "vpc-085389fb00168854b",
            "instance_tenancy": "default",
            "ipv4_ipam_pool_id": null,
            "ipv4_netmask_length": null,
            "ipv6_association_id": "",
            "ipv6_cidr_block": "",
            "ipv6_cidr_block_network_border_group": "",
            "ipv6_ipam_pool_id": "",
            "ipv6_netmask_length": 0,
            "main_route_table_id": "rtb-03537080ceba3a44f",
            "owner_id": "605303221660",
            "tags": {},
            "tags_all": {}
          },
          "sensitive_attributes": [],
          "private": "eyJzY2hlbWFfdmVyc2lvbiI6IjEifQ=="
        }
      ]
    }
  ],
  "check_results": []
}