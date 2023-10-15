// User Data

data "template_file" "init" {

  template = <<EOF

#!/bin/bash

yum -y install httpd

systemctl enable httpd

echo "This is a static website" > /var/www/html/index.html

systemctl start httpd



EOF

}
