name             "slack"
maintainer       "Savedo IT-Team"
maintainer_email ""
license          "Apache 2.0"
description      "Slack LWRP for notifying slack.com channels"
long_description IO.read(File.join(File.dirname(__FILE__), "README.md"))
version          "0.1.1"

%w{redhat centos scientific fedora debian ubuntu arch freebsd amazon}.each do |os|
  supports os
end
