#!/usr/bin/env bash

if [[ "$#" -eq 1 ]]; then
	inDocRoot=$1
else
	printf "You need to input the DocumentRoot of opencart\n"
	exit 1
fi

if [[ "${inDocRoot: -1}" == "/" ]]; then
	docRoot=${inDocRoot::-1}
else
	docRoot=${inDocRoot}
fi

# Owner And Group
sudo chown -R apache:apache ${docRoot}

# Permissions
sudo chmod -R 774 ${docRoot}
sudo chmod -R 774 ${docRoot}/config.php
sudo chmod -R 774 ${docRoot}/admin/config.php
sudo chmod -R 774 ${docRoot}/image
sudo chmod -R 774 ${docRoot}/image/cache
sudo chmod -R 774 ${docRoot}/image/catalog
sudo chmod -R 774 ${docRoot}/system/storage/cache
sudo chmod -R 774 ${docRoot}/system/storage/logs
sudo chmod -R 774 ${docRoot}/system/storage/download
sudo chmod -R 774 ${docRoot}/system/storage/upload
sudo chmod -R 774 ${docRoot}/config.php
sudo chmod -R 774 ${docRoot}/system/storage/modification

# SeLinux
sudo chcon -Rv --type=httpd_sys_rw_content_t ${docRoot}/config.php
sudo chcon -Rv --type=httpd_sys_rw_content_t ${docRoot}/admin/config.php
sudo chcon -Rv --type=httpd_sys_rw_content_t ${docRoot}/image
sudo chcon -Rv --type=httpd_sys_rw_content_t ${docRoot}/image/cache
sudo chcon -Rv --type=httpd_sys_rw_content_t ${docRoot}/image/catalog
sudo chcon -Rv --type=httpd_sys_rw_content_t ${docRoot}/system/storage/cache
sudo chcon -Rv --type=httpd_sys_rw_content_t ${docRoot}/system/storage/logs
sudo chcon -Rv --type=httpd_sys_rw_content_t ${docRoot}/system/storage/download
sudo chcon -Rv --type=httpd_sys_rw_content_t ${docRoot}/system/storage/upload
sudo chcon -Rv --type=httpd_sys_rw_content_t ${docRoot}/system/storage/modification

exit 0

