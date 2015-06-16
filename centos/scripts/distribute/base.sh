#!/bin/bash

set -e
yum -y update
yum -y install bzip2 gcc gawk lv ansible

yum -y install kernel-devel kernel-headers -avahi -bluez-utils -dogtail -kudzu -ipw2100-firmware -ipw2200-firmware -ivtv-firmware
