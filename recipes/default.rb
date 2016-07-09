#
# Cookbook Name:: imagemagick
# Recipe:: default
#
# Copyright 2013, bageljp
#
# All rights reserved - Do Not Redistribute
#

%w(
  ImageMagick
  ImageMagick-devel
).each do |pkg|
  package pkg do
    options "--enablerepo=epel"
  end
end

