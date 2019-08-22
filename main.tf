provider "ibm" {
  ibmcloud_api_key = "${var.ibmcloud_api_key}"
}

data "ibm_resource_group" "group" {
  name = "default"
}

resource "ibm_resource_instance" "resource_instance" {
  name              = "COS-tf-test"
  service           = "cloud-object-storage"
  plan              = "lite"
  location          = "global"
  resource_group_id = "${data.ibm_resource_group.group.id}"
  tags              = ["tag1", "tag2"]

  parameters = {
    "HMAC" = true
  }
  //User can increase timeouts 
  timeouts {
    create = "15m"
    update = "15m"
    delete = "15m"
  }
}