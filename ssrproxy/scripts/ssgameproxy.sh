#!/bin/sh
export KSROOT=/koolshare
source $KSROOT/scripts/base.sh
eval `dbus export ssgameproxy_`

rm /tmp/zzz_*

start_ssgameproxy(){
    stop_ssgameproxy
    rss-local -b 0.0.0.0 -l 5500 -c /koolshare/ss/ssgameproxy.json -u -f /var/run/ssgame1.pid --acl /koolshare/ss/socks5/chn.acl
    /koolshare/privoxy/privoxy
    pid_rsslocal=$(cat /var/run/ssgame1.pid)
    pid_privoxy=$(ps | grep privoxy | awk 'NR==1{print $1}')
    dbus set ssgameproxy_enable=1
    dbus set ssgameproxy_pid="$pid_rsslocal"
    dbus set ssgameproxy_pid_privoxy="$pid_privoxy"
    ps | grep privoxy
    echo "pid_privoxy: "$pid_privoxy""
    echo "---------------------------"
    echo "- Socks5 Proxy            -"
    echo "- Address: 192.168.1.1    -"
    echo "- Proxy:   5500           -"
    echo ""
    echo "- Http Proxy              -"
    echo "- Address: 192.168.1.1    -"
    echo "- Proxy:   5501           -"
    echo "---------------------------"
}

cp_config(){
    cp /koolshare/ss/ss.json /koolshare/ss/ssgameproxy.json
    dbus set ssgameproxy_server=$(dbus get ss_basic_server)
}

stop_ssgameproxy(){
    pid=$(cat /var/run/ssgame1.pid)
    pid_privoxy=$(ps | grep privoxy | awk 'NR==1{print $1}')
    kill $pid
    kill $pid_privoxy
    dbus set ssgameproxy_enable=0
    dbus set ssgameproxy_pid="-"
}

case $ACTION in
start)
    if [ "$ssgameproxy_enable" == "1" ]; then
        logger "[软件中心]: 启动 ssgameproxy"
        start_ssgameproxy
    else
        logger "[软件中心]: ssgameproxy 未设置开机启动，跳过！"
    fi
    ;;
stop)
    stop_ssgameproxy
    ;;
cp)
    cp_config
    ;;
read)
    echo $ssgameproxy_enable
    ;;
*)
    touch /tmp/zzz_$ssgameproxy_request
    echo 上次請求命令：$ssgameproxy_request
    case "$ssgameproxy_request" in
        cp)
            cp_config
            ;;
        switch)
            touch /tmp/zzz_$ssgameproxy_enable

            if [ "$ssgameproxy_enable" == "0" ]; then
                start_ssgameproxy
                echo '啟動完畢'
            else
                stop_ssgameproxy
                echo '服務關閉'
            fi
            ;;         
        *)
            echo $"Usage: $0 {start|stop|cp|read}"
            exit 1
    esac
    ;;
esac