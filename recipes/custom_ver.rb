#
# Cookbook Name:: imagemagick
# Recipe:: default
#
# Copyright 2013, bageljp
#
# All rights reserved - Do Not Redistribute
#

yum_key "RPM-GPG-KEY-CentOS-6" do
  url "http://mirror.centos.org/centos/RPM-GPG-KEY-CentOS-6"
  action :add
end

yum_repository "CentOS-Base" do
  description "CentOS-6 - Base"
  mirrorlist "http://mirrorlist.centos.org/?release=6&arch=x86_64&repo=os"
  key "RPM-GPG-KEY-CentOS-6"
  enabled 0
end

%w(
  libtool-ltdl
  libtool-ltdl-devel
  giflib-devel
  lcms-devel
  libXext-devel
  libXt-devel
  perl-devel
  libjpeg-devel
  libpng-devel
  libtiff-devel
  giflib-devel
  ghostscript-devel
  libwmf-devel
  jasper-devel
  libxml2-devel
  djvulibre
  djvulibre-libs
  djvulibre-devel
).each do |pkg|
  yum_package pkg do
    arch "x86_64"
    options "--enablerepo=epel,CentOS-Base"
  end
end

remote_file "/usr/local/src/#{node['imagemagick']['rpm']}" do
  owner "root"
  group "root"
  mode 00644
  source "#{node['imagemagick']['url']}"
end

remote_file "/usr/local/src/#{node['imagemagick']['rpm_devel']}" do
  owner "root"
  group "root"
  mode 00644
  source "#{node['imagemagick']['url_devel']}"
end

bash "install imagemagick" do
  user "root"
  group "root"
  cwd "/usr/local/src"
  code <<-EOC
    yum localinstall ImageMagick-#{node['imagemagick']['version']}.x86_64.rpm ImageMagick-devel-#{node['imagemagick']['version']}.x86_64.rpm --enablerepo=epel,CentOS-Base --nogpgcheck -y
  EOC
  not_if "rpm -q ImageMagick-#{node['imagemagick']['version']}"
end
