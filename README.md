# aws-infra-migrate-into-terraform-codes
- Noted: this notes is available in multiple places:
	- in github hammyr in README file.
	- in terraform workspace in 'tf-prac-11-import-into-modules' in README file.
	- in my terraform notes ''.

### how to import(migrate) aws services into terraform codes
	- three way for import aws services into terraform codes:
		- 1st: terraform import command (old one)
			- taken from yt 'Emmanuel Jijong' see yt url
				- url: https://youtu.be/qwER6zYGvdQ?si=gBDaDKfXqRyGBC9s
		
		- 2nd: how to `migrate` existing aws infra into `terraform modules` byusing `import command`
			- Noted: read README file in repo(hammyr).

		- 3rd: terraform import block 	(new feature from terraform-version=>1.5.0)
			- Noted: this is experimental from terraform side, so not add in your usecase.
			- taken from yt 'hashicorp' & 'Ned in the Cloud'
				- url: https://youtu.be/y8_5Ud29W8o?si=u_A6QxrqdtvTAw-E
				- url: https://youtu.be/znfh_00EDZ0?si=Zpibzg_Cya_qUs2B

		
		
## ========= 1st way byusing import command ================================= ##
#### lets say we have already our aws services for example we have ec2-instance 

#### and now we want to import that instance into terraform codes, so see how can do that:
	
#### write terraform block & provider block in provider.tf file

#### write import.tf file & define resource block for aws_instance, like this see below:
```
resource "aws_instance" "wp-bastion-server" {}
```


#### next, in terminal do this:
```
terraform init
terraform import <resource_name.resource_local_name> <resource_id>
terraform import aws_instance.wp-bastion-server i-085817386e3ee63ac
	# once imported then you get output like below: 
Import successful!

The resources that were imported are shown above. These resources are now in
your Terraform state and will henceforth be managed by Terraform.


#next we need to run terraform show command & copy entire resource block & paste into terraform script
$ terraform show
# aws_instance.wp-bastion-server:
resource "aws_instance" "wp-bastion-server" {
    ami                                  = "ami-0d9efc67b4e551155"
    arn                                  = "arn:aws:ec2:ap-southeast-1:214262210418:instance/i-085817386e3ee63ac"
    associate_public_ip_address          = true
    availability_zone                    = "ap-southeast-1a"
    cpu_core_count                       = 1
    cpu_threads_per_core                 = 1
    disable_api_stop                     = false
    disable_api_termination              = false
    ebs_optimized                        = false
    get_password_data                    = false
    hibernation                          = false
    id                                   = "i-085817386e3ee63ac"
    instance_initiated_shutdown_behavior = "stop"
    instance_state                       = "running"
    instance_type                        = "t2.micro"
    ipv6_address_count                   = 0
    ipv6_addresses                       = []
    key_name                             = "wp-project"
    monitoring                           = false
    placement_partition_number           = 0
    primary_network_interface_id         = "eni-07dddce4fd38529d5"
    private_dns                          = "ip-10-0-1-214.ap-southeast-1.compute.internal"
    private_ip                           = "10.0.1.214"
    public_dns                           = "ec2-18-143-163-15.ap-southeast-1.compute.amazonaws.com"
    public_ip                            = "18.143.163.15"
    secondary_private_ips                = []
    security_groups                      = []
    source_dest_check                    = true
    subnet_id                            = "subnet-037f574a992f75345"
    tags                                 = {
        "Name" = "bastion-server"
    }
    tags_all                             = {
        "Name" = "bastion-server"
    }
    tenancy                              = "default"
    vpc_security_group_ids               = [
        "sg-04391496e6ed354a7",
    ]

    capacity_reservation_specification {
        capacity_reservation_preference = "open"
    }

    cpu_options {
        core_count       = 1
        threads_per_core = 1
    }

    credit_specification {
        cpu_credits = "standard"
    }

    enclave_options {
        enabled = false
    }

    maintenance_options {
        auto_recovery = "default"
    }

    metadata_options {
        http_endpoint               = "enabled"
        http_put_response_hop_limit = 1
        http_tokens                 = "optional"
        instance_metadata_tags      = "disabled"
    }

    private_dns_name_options {
        enable_resource_name_dns_a_record    = false
        enable_resource_name_dns_aaaa_record = false
        hostname_type                        = "ip-name"
    }

    root_block_device {
        delete_on_termination = true
        device_name           = "/dev/xvda"
        encrypted             = false
        iops                  = 100
        tags                  = {}
        throughput            = 0
        volume_id             = "vol-071afd76a8925d842"
        volume_size           = 8
        volume_type           = "gp2"
    }
}
```


#### next =>>
```
once you paste in terraform script then you need to run 'terraform plan'
command, then here you get error, so you need to update script like
you need to remove some argument/parameter bcuz once you run 'terraform show'
command then its fetch all data related to that resource/services from 'terraform.tfstate'
file and we dont require all data/parameter/argument in terraform script(resource block)
so we need to remove/update and next thing is run 'terraform plan' command if again
you get error then read error messege & then again update/remove data/argument, and
then again run 'terraform plan' command, once you get messege like
'No changes. Your infrastructure matches the configuration.' then it means you successful
imported aws services into terraform codes.
```


#### see =>>
```
once you updated terraform script which you copied from terminal to terraform script
and you get like 'No changes. Your infrastructure matches the configuration.' then it means
you successful imported/migrated aws services into terraform codes.
```


#### Noted: same way you can migrate other aws services/resources one by one like this one.

##### ========= upto here 1st way byusing import command ================================= #####





## ==== 2nd: how to `migrate` existing aws infra into `terraform modules` byusing `import command` ===== ##


# how to migrate existing aws infra into terraform modules
- same way like 1st way, but here we have child module and root module,


### services used in this project
- awscli commands to fetch resource-ids like vpc-id, subnet-ids, etc ids.
- s3 backend for remote backend.
	- bucket-name: terraform-migration-state-123
		- Noted: not using in my lab, but you have to explain in interview.
- dynamodb table for state locking.
	- Noted: not using in my lab, but you have to explain in interview.
- GitHub repo `aws-infra-migrate-into-terraform-codes` for terraform modules including `child-modules` & `root-module block` for `migration`.
	- url: 

- iam-policy for iam groups where 3 iam-users are added (these 3 are teamates including me)
	- here we have only `read' access, so we are able to fetch data byusing `awscli` command.
	- `terraform` is also communicate with api with awscli, so here also we are able to `migrate` aws `existing infra` into `terraform codes`.

	- iam-group: terraform-migrate-group
		- attached iam-users to group:
			- iam-users: tf-migrate-admin-1, tf-migrate-admin-2, tf-migrate-admin-3.
		- attached policies to group:
			- AmazonVPCReadOnlyAccess		#this is 'aws managed' policy.
			- AmazonS3ReadWriteOnlyAccess	#(custom policy where full read-write-access for 'terraform-migration-state-123' bucket.
			- AmazonEC2ReadOnlyAccess		#not used in this project so not added this.
			- AmazonRDSReadOnlyAccess		#not used in this project so not added this.
			- ElasticLoadBalancingReadOnly	#not used in this project so not added this.
			- see below these 2 policies:
```
# AmazonVPCReadOnlyAccess		#this is 'aws managed' policy.
{
    "Version": "2012-10-17",
    "Statement": [
        {
            "Effect": "Allow",
            "Action": [
                "ec2:DescribeAccountAttributes",
                "ec2:DescribeAddresses",
                "ec2:DescribeCarrierGateways",
                "ec2:DescribeClassicLinkInstances",
                "ec2:DescribeCustomerGateways",
                "ec2:DescribeDhcpOptions",
                "ec2:DescribeEgressOnlyInternetGateways",
                "ec2:DescribeFlowLogs",
                "ec2:DescribeInternetGateways",
                "ec2:DescribeLocalGatewayRouteTables",
                "ec2:DescribeLocalGatewayRouteTableVpcAssociations",
                "ec2:DescribeMovingAddresses",
                "ec2:DescribeNatGateways",
                "ec2:DescribeNetworkAcls",
                "ec2:DescribeNetworkInterfaceAttribute",
                "ec2:DescribeNetworkInterfacePermissions",
                "ec2:DescribeNetworkInterfaces",
                "ec2:DescribePrefixLists",
                "ec2:DescribeRouteTables",
                "ec2:DescribeSecurityGroupReferences",
                "ec2:DescribeSecurityGroupRules",
                "ec2:DescribeSecurityGroups",
                "ec2:DescribeStaleSecurityGroups",
                "ec2:DescribeSubnets",
                "ec2:DescribeTags",
                "ec2:DescribeVpcAttribute",
                "ec2:DescribeVpcClassicLink",
                "ec2:DescribeVpcClassicLinkDnsSupport",
                "ec2:DescribeVpcEndpoints",
                "ec2:DescribeVpcEndpointConnectionNotifications",
                "ec2:DescribeVpcEndpointConnections",
                "ec2:DescribeVpcEndpointServiceConfigurations",
                "ec2:DescribeVpcEndpointServicePermissions",
                "ec2:DescribeVpcEndpointServices",
                "ec2:DescribeVpcPeeringConnections",
                "ec2:DescribeVpcs",
                "ec2:DescribeVpnConnections",
                "ec2:DescribeVpnGateways"
            ],
            "Resource": "*"
        }
    ]
}



# AmazonS3ReadWriteOnlyAccess	#(custom policy where list, full read-write-access for 'terraform-migration-state-123' bucket.
{
    "Version": "2012-10-17",
    "Statement": [
        {
            "Sid": "VisualEditor0",
            "Effect": "Allow",
            "Action": [
                "s3:PutAnalyticsConfiguration",
                "s3:GetObjectVersionTagging",
                "s3:CreateBucket",
                "s3:ReplicateObject",
                "s3:GetObjectAcl",
                "s3:GetBucketObjectLockConfiguration",
                "s3:DeleteBucketWebsite",
                "s3:GetIntelligentTieringConfiguration",
                "s3:PutLifecycleConfiguration",
                "s3:GetObjectVersionAcl",
                "s3:DeleteObject",
                "s3:GetBucketPolicyStatus",
                "s3:GetObjectRetention",
                "s3:GetBucketWebsite",
                "s3:PutReplicationConfiguration",
                "s3:GetObjectAttributes",
                "s3:PutObjectLegalHold",
                "s3:InitiateReplication",
                "s3:GetObjectLegalHold",
                "s3:GetBucketNotification",
                "s3:PutBucketCORS",
                "s3:GetReplicationConfiguration",
                "s3:PutObject",
                "s3:GetObject",
                "s3:PutBucketNotification",
                "s3:PutBucketLogging",
                "s3:GetAnalyticsConfiguration",
                "s3:PutBucketObjectLockConfiguration",
                "s3:GetObjectVersionForReplication",
                "s3:GetLifecycleConfiguration",
                "s3:GetInventoryConfiguration",
                "s3:GetBucketTagging",
                "s3:PutAccelerateConfiguration",
                "s3:DeleteObjectVersion",
                "s3:GetBucketLogging",
                "s3:RestoreObject",
                "s3:GetAccelerateConfiguration",
                "s3:GetObjectVersionAttributes",
                "s3:GetBucketPolicy",
                "s3:PutEncryptionConfiguration",
                "s3:GetEncryptionConfiguration",
                "s3:GetObjectVersionTorrent",
                "s3:AbortMultipartUpload",
                "s3:GetBucketRequestPayment",
                "s3:GetObjectTagging",
                "s3:GetMetricsConfiguration",
                "s3:GetBucketOwnershipControls",
                "s3:DeleteBucket",
                "s3:PutBucketVersioning",
                "s3:GetBucketPublicAccessBlock",
                "s3:PutIntelligentTieringConfiguration",
                "s3:PutMetricsConfiguration",
                "s3:PutBucketOwnershipControls",
                "s3:GetBucketVersioning",
                "s3:GetBucketAcl",
                "s3:PutInventoryConfiguration",
                "s3:GetObjectTorrent",
                "s3:PutBucketWebsite",
                "s3:PutBucketRequestPayment",
                "s3:PutObjectRetention",
                "s3:GetBucketCORS",
                "s3:GetBucketLocation",
                "s3:ReplicateDelete",
                "s3:GetObjectVersion"
            ],
            "Resource": [
                "arn:aws:s3:::terraform-migration-state-123",
                "arn:aws:s3:::terraform-migration-state-123/*"
            ]
        },
        {
            "Sid": "VisualEditor1",
            "Effect": "Allow",
            "Action": [
                "s3:ListAccessPointsForObjectLambda",
                "s3:GetAccessPoint",
                "s3:ListBucketMultipartUploads",
                "s3:ListAccessPoints",
                "s3:ListBucketVersions",
                "s3:ListJobs",
                "s3:PutStorageLensConfiguration",
                "s3:ListBucket",
                "s3:ListMultiRegionAccessPoints",
                "s3:ListMultipartUploadParts",
                "s3:ListStorageLensConfigurations",
                "s3:GetAccountPublicAccessBlock",
                "s3:ListAllMyBuckets",
                "s3:CreateJob"
            ],
            "Resource": [
                "arn:aws:s3:::terraform-migration-state-123",
                "arn:aws:s3:::terraform-migration-state-123/*"
            ]
        }
    ]
}
```



### awscli commands to see vpc_id, subnets_id, rt_id, igw_id, etc ids.
- Noted: here we use `chatgpt` for `awscli commands`, dont remember these commands, just understand.
```
# to see vpc details
aws ec2 describe-vpcs --region ap-southeast-1 --query 'Vpcs[*].[VpcId, Tags]'
$ aws ec2 describe-vpcs --region ap-southeast-1 | grep -i "vpcid"
$ aws ec2 describe-vpcs --region ap-southeast-1 | grep -i -A5 -B5 "vpcid"	#to see which vpc, use before & after lines.


# to see subnets details
$ aws ec2 describe-subnets --region ap-southeast-1 --filters "Name=vpc-id,Values=vpc-0ed92f6cee57d0e4a" --query 'Subnets[*].[SubnetId, Tags]'
	#press 'space' key to scroll down, here is all subnets id which are created within a vpc.
$ aws ec2 describe-subnets --region ap-southeast-1 | grep -i "subnetid"
$ aws ec2 describe-subnets --region ap-southeast-1 | grep -E -i -n 'subnetid|key'


# to see route-table ids
aws ec2 describe-route-tables --region ap-southeast-1 --query 'RouteTables[*].[RouteTableId, Tags]'


# to see igw-id
aws ec2 describe-internet-gateways --region ap-southeast-1 --query 'InternetGateways[*].[InternetGatewayId, Tags]'

# to see elp 'Allocation ID'
aws ec2 describe-addresses --region ap-southeast-1 --query 'Addresses[*].[AllocationId, Tags]'

# to see nat-id
$ aws ec2 describe-nat-gateways --region ap-southeast-1 --query 'NatGateways[*].[NatGatewayId, Tags]'
```



### all terraform commands:
```
$ terraform init

# syntax to import aws services into module
terraform import module.module-name.child-resource-block-name.resource-local-name vpc-id(resource-id-or-name)


$ terraform import module.network.aws_vpc.vpc vpc-004762cb2022069c4


$ terraform state list
module.network.aws_vpc.vpc


$ terraform state show module.network.aws_vpc.vpc
$ terraform show
$ terraform plan
#Noted: not satisfied from output, but we continuously imported one by one all resources.


$ terraform import module.network.aws_subnet.public_subnet_1 subnet-08f5da1a06e5fba3c
$ terraform import module.network.aws_subnet.public_subnet_2 subnet-065e36e9690998b3d
$ terraform import module.network.aws_subnet.private_subnet_1 subnet-0ce4a4d7fdf9d2678
$ terraform import module.network.aws_subnet.private_subnet_2 subnet-0d2f749f3abf64249
$ terraform import module.network.aws_subnet.db_subnet_1 subnet-03190b37ecfa3cc7e
$ terraform import module.network.aws_subnet.db_subnet_2 subnet-0c8d529c858bf2a97

$ terraform import module.network.aws_route_table.public_rt_1 rtb-09eeb5514c789db62
$ terraform import module.network.aws_route_table.private_rt_1 rtb-06575f6c42ac42a36
$ terraform import module.network.aws_route_table.db_rt_1 rtb-02a75ed89a3463bc8

$ terraform import module.network.aws_route_table_association.public_subnet_1_association subnet-08f5da1a06e5fba3c/rtb-09eeb5514c789db62
		#here attribute is subnet-id/rt-id see in terraform documentation.
$ terraform import module.network.aws_route_table_association.public_subnet_2_association subnet-065e36e9690998b3d/rtb-09eeb5514c789db62
$ terraform import module.network.aws_route_table_association.private_subnet_1_association subnet-0ce4a4d7fdf9d2678/rtb-06575f6c42ac42a36
$ terraform import module.network.aws_route_table_association.private_subnet_2_association subnet-0d2f749f3abf64249/rtb-06575f6c42ac42a36
$ terraform import module.network.aws_route_table_association.db_subnet_1_association subnet-0019478a66cd0eef6/rtb-0bb1ada7c8ac5414c
$ terraform import module.network.aws_route_table_association.db_subnet_2_association subnet-0c8d529c858bf2a97/rtb-02a75ed89a3463bc8


$ terraform import module.network.aws_internet_gateway.igw igw-09afb1634b0e6a1ae
$ terraform import module.network.aws_eip.eip eipalloc-0b0c222376fe6af2c
$ terraform import module.network.aws_nat_gateway.nat_gw nat-0d908a422da27e650
$ terraform import module.network.aws_route.igw_add_public_rt_1 rtb-09eeb5514c789db62_0.0.0.0/0
$ terraform import module.network.aws_route.nat_add_private_subnet_1 rtb-06575f6c42ac42a36_0.0.0.0/0

$ terraform plan
	#No changes. Your infrastructure matches the configuration.
$ terraform apply
	#Apply complete! Resources: 0 added, 0 changed, 0 destroyed.
```



### `Imp`: how to get `attribute ids`, etc from `terraform.tfstate` file through `terraform command`
```
# get all output attribute whatever you defined within output block
$ terraform output
dev_db_rt_id = "rtb-0bb1ada7c8ac5414c"
dev_db_subnet_id_1 = "subnet-0019478a66cd0eef6"
dev_db_subnet_id_2 = "subnet-0f9c4f719611b5176"
dev_private_rt_id = "rtb-03fc44892e1bfec80"
dev_private_subnet_1_id = "subnet-02326efd9e373b149"
dev_private_subnet_2_id = "subnet-052915fb5a9876f9f"
dev_public_rt_id = "rtb-0f11eb4a2882115e4"
dev_public_subnet_1_id = "subnet-09757ac85107a1de9"
dev_public_subnet_2_id = "subnet-03af45394ff564759"
dev_vpc_id = "vpc-0ed92f6cee57d0e4a"


# how to get attribute from a particular output block
terraform output ouput-block-name		#syntax
$ terraform output dev_vpc_id
"vpc-004762cb2022069c4"

$ terraform output dev_db_rt_id
"rtb-02a75ed89a3463bc8"


#-Noted: module ke case me root-module ka ouput-block-name define hoga, see syntax
terraform output root-module-ouput-block-name		#to see particular output value.
terraform output				# to see all outputs value from root-module-ouput-blocks.
```
## ==== 2nd: upt here how to `migrate` existing aws infra into `terraform modules` byusing `import command` ===== ##








## ========== 3rd way: byusing import block ================== ##


#### Noted:
```
-Noted: Warning: Config generation is experimental
│
│ Generating configuration during import is currently experimental, and the
│ generated configuration format may change in future versions.
	-Noted: so not fix now, its experimental stage in this feature.
```



#### lets say 

```
-we have already our aws services for example we have ec2-instance and
now we want to import that instance into terraform codes, so see how can do that:

-write terraform block & provider block in provider.tf file
```


#### write main.tf file & define import block for aws_instance, like this see below:
```
import {
  to = aws_instance.web-2
  id = "i-0f2830680a05887a8"		#this is instance_id of current existing instance
}
```


#### next run terraform commands:
```
terraform init
terraform plan -generate-config-out=generated.tf
	#-here we generated file 'generated.tf' but we also get error like 'planning failed, other error, which we solve next step.
```


#### next 
```
copy that resource block which terraform generated in 'generated.tf' file and paste
into main file(main.tf) below or above import block, next delete or commented out all script
in 'generated.tf' file,
	-Noted: here we can also update in same file means in 'generated.tf' file itself, here we
	 need to update resource block as per terraform registry or terraform rules, thats it.
```


#### next 
```
update that copied resource block as per you get error or as per required parameter/argument
which is define in terraform registry, and then run 'terraform plan' command, if you still get error then
again update/remove parameter/argument as per error messege, then again run 'terraform plan' command, once
you get messege like "1 to import, 0 to add, 0 to change, 0 to destroy." then it means you are successfully
updated resource block which you copied, which means your terraform codes is written as per your current
state (real infra).

# see here
terraform plan
	#you get messege like: Plan: 1 to import, 0 to add, 0 to change, 0 to destroy.
```


#### next, run terraform apply command, 
- once you run terraform apply command then it is going to imported into 'terraform.tfstate' file, see below:
```
$ terraform state list
$ terraform show
The state file is empty. No resources are represented.


$ terraform apply
	#you get messege like below:
aws_instance.web-2: Importing... [id=i-0f2830680a05887a8]
aws_instance.web-2: Import complete [id=i-0f2830680a05887a8]

Apply complete! Resources: 1 imported, 0 added, 0 changed, 0 destroyed.
```


#### next, upto here we successfully imported into 'terraform'tfstate' file 
- and we also updated terraform manifest script,



#### next, 
- we need to delete 'import block' from our terraform script(main.tf) & run 'terraform plan',
- once you deleted 'import block' & then run 'terraform plan' command then you get messege like below:
```
$ terraform plan
aws_instance.web-2: Refreshing state... [id=i-0f2830680a05887a8]

No changes. Your infrastructure matches the configuration.

Terraform has compared your real infrastructure against your configuration
and found no differences, so no changes are needed.
```


#### next, completed existing infra into terraform codes, 
- same process you can follow and import other aws services like that.

## ========== 3rd way: upto here byusing import block ================== ##



