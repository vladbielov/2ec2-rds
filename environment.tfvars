region                      =   "us-east-1"
cidr_block                  =   "10.0.0.0/16"

public_cidr1                =   "10.0.101.0/24"
public_cidr2                =   "10.0.102.0/24"
public_cidr3                =   "10.0.103.0/24"

private_cidr1               =   "10.0.1.0/24"
private_cidr2               =   "10.0.2.0/24"
private_cidr3               =   "10.0.3.0/24"

ssl_cert                    =   ""
db_credentials              =   "weasel_crm_rds" #use your own secret in AWS Secrets Manager
s3_bucket_name              =   "weasel-crm-bucket-rodent"
state_bucket                =   "weasel-crm-state-bucket"
dynamodb_table              =   "weasel-crm-dynamodb"

max_size                    =   "2"
min_size                    =   "2"
desired_capacity            =   "2"


tags    =   {
    Name                    =   "Weasel CRM Project"
    Created_by              =   "Viktoriia Bielova"
   }