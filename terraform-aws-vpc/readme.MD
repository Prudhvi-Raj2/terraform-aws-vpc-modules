# expense Ec2 Module

**Inputs:**

* amd_id (optional): String Value. Default values is devops-practice AMI ID
* sg_id(mandatory): User must supply sg_id
* instance_type (Optional): t3.micro is default value. user can provide t2.micro or t3.small
* tags(Optional): Default is empty. user can provide tags in map structure.

**Outputs:**

*  public_ip: public IP of the Instance created
* private_ip: private IP of the Instance created