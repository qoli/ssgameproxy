#!/bin/sh
export KSROOT=/koolshare
source $KSROOT/scripts/base.sh

cp -r /tmp/ssrproxy/* $KSROOT/
chmod a+x /koolshare/scripts/ssrproxy.sh

# add icon into softerware center
dbus set softcenter_module_ssrproxy_install=1
dbus set softcenter_module_ssrproxy_version=0.1
dbus set softcenter_module_ssrproxy_home_url=Module_ssgameproxy.asp