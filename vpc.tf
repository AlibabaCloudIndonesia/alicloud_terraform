#VPC and vswitch
resource "alicloud_vpc" "vpc" {
    name        = "terraform-vpc"
    cidr_block  = "192.168.0.0/16"
}

resource "alicloud_vswitch" "vsw" {
    vpc_id            = "${alicloud_vpc.vpc.id}"
    cidr_block        = "192.168.1.0/24"
    availability_zone = "${var.zone}"
}