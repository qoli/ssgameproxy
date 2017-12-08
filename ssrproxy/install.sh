#!/bin/sh
export KSROOT=/koolshare
source $KSROOT/scripts/base.sh

cp -r /tmp/ssgameproxy/* $KSROOT/
chmod a+x /koolshare/scripts/ssgameproxy.sh

# add icon into softerware center
dbus set softcenter_module_ssgameproxy_install=1
dbus set softcenter_module_ssgameproxy_version=0.1
dbus set softcenter_module_ssgameproxy_home_url=Module_ssgameproxy.asp