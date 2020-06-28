#ECS creation
resource "alicloud_instance" "web" {
    count = 1
    instance_name = "${var.short_name}-${var.role}-${format(var.count_format, count.index+1)}"
    host_name = "${var.short_name}-${var.role}-${format(var.count_format, count.index+1)}"
    password = "${var.ecs_password}"
    availability_zone = "${var.zone}"
    image_id = "${var.image_id}"
    instance_type = "ecs.n4.small"
    system_disk_category = "cloud_efficiency"
    security_groups = ["${alicloud_security_group.sg.id}"]
    vswitch_id = "${alicloud_vswitch.vsw.id}"
    depends_on = ["alicloud_db_instance.rds"]
}