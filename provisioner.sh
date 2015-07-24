#!/bin/bash
yum -y install sqlite-devel
yum -y groupinstall 'development tools'
source /etc/profile.d/rvm.sh
if [[ ! $(rvm list | grep ruby) ]]; then
  gpg --keyserver hkp://keys.gnupg.net --recv-keys 409B6B1796C275462A1703113804BB82D39DC0E3
  \curl -sSL https://get.rvm.io | bash -s stable
  source /etc/profile.d/rvm.sh
  rvm install ruby
  bash -l -c 'gem install bundler morph-cli --no-ri --no-rdoc'
fi
