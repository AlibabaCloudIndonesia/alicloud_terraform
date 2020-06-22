resource "alicloud_vpc" "vpc" {
    name = "tf_test_vpc"
    cidr_block = "172.16.0.0/12"
}

output "test_vpc_info" {
    value = "${alicloud_vpc.vpc.id}"
}