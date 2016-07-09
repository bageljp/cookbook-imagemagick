default['imagemagick']['version'] = "6.8.7-0"
default['imagemagick']['rpm'] = "ImageMagick-#{node['imagemagick']['version']}.x86_64.rpm"
default['imagemagick']['rpm_devel'] = "ImageMagick-devel-#{node['imagemagick']['version']}.x86_64.rpm"
default['imagemagick']['url'] = "http://www.imagemagick.org/download/linux/CentOS/x86_64/#{node['imagemagick']['rpm']}"
default['imagemagick']['url_devel'] = "ftp://ftp.kddlabs.co.jp/graphics/ImageMagick/linux/CentOS/x86_64/#{node['imagemagick']['rpm_devel']}"