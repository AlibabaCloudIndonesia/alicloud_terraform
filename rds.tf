#database creation
resource "alicloud_db_account" "account" {
    count = 1
    instance_id = "${alicloud_db_instance.rds.id}"
    name = "${var.database_user_name}"
    password = "${var.database_user_password}"
}

resource "alicloud_db_database" "db" {
    count = 1
    instance_id = "${alicloud_db_instance.rds.id}"
    name = "${var.database_name}"
    description = "terraform magento"
}

resource "alicloud_db_instance" "rds" {
    engine = "MySQL"
    engine_version = "5.6"
    instance_type = "rds.mysql.t1.small"
    instance_storage = "10"
    vswitch_id = "${alicloud_vswitch.vsw.id}"
    security_ips = ["192.168.1.0/24"]
}    

resource "alicloud_db_account_privilege" "privilege" {
    count = 1
    instance_id = "${alicloud_db_instance.rds.id}"
    account_name = "${alicloud_db_account.account.name}"
    db_names = ["${alicloud_db_database.db.name}"]
    privilege = "ReadWrite"
}
