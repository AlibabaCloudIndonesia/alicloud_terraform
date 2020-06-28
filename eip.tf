# EIP Creation
resource "alicloud_eip" "eip" {}

resource "alicloud_eip_association" "eip_asso" {
    allocation_id  = "${alicloud_eip.eip.id}"
    instance_id    = "${alicloud_instance.web.id}"
}