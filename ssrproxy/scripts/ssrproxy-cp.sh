#!/bin/sh
export KSROOT=/koolshare
source $KSROOT/scripts/base.sh
eval `dbus export ssgameproxy_`
eval `dbus export ss`

$CONFIG_FILE=/koolshare/ss/ssgameproxy.json

cp_config(){
    cp /koolshare/ss/ss.json /koolshare/ss/ssgameproxy.json
    dbus set ssgameproxy_server=$(dbus get ss_basic_server)
}

set_mode(){

    ARG_OBFS=""
    case "$ss_basic_type" in
    0)
        echo "# SS 模式"
        BIN=ss-redir
        dbus set ssgameproxy_mode=0
        ;;
    1)
        echo "# SSR 模式"
        BIN=rss-redir
        dbus set ssgameproxy_mode=1
        ;;
    esac

    # $BIN -c $CONFIG_FILE $ARG_OBFS -U -f /var/run/shadowsocks.pid

}

