erraform {
  required_providers {
    linux = {
      source = "mavidser/linux"
      version = "1.0.2"
    }
  }
}

provider "linux" {
  host = "192.168.119.130"
  user = "root"
}

resource "linux_user" "testuser" {
  name = "testuser"
  uid = 1024
}

resource "linux_file" "testfile" {
  path = "/etc/testfile"
  content = "testcontent"
  owner = "${linux_user.testuser.name}:${linux_user.testuser.name}"
  permissions = 777
}
