# 單獨的代理

大部分時候，我們可能使用一個特別的 Shadowsocks 來用於日常上網，觀看視頻等。

然而，還有一些資源可能使用特定的代理。

同時，內置的 Shadowsocks 插件的 Socks5 設定無法滿足 SSR 代理需求。



## 梅林的 Socks5 和 HTTP Proxy

基於 ssr-local 搭建的 Socks5 代理，使用 Privoxy 轉化成 HTTP 代理。



## 默認的代理端口設定

    "---------------------------"
    "- Socks5 Proxy            -"
    "- Address: 192.168.1.1    -"
    "- Proxy:   5500           -"
    ""
    "- Http Proxy              -"
    "- Address: 192.168.1.1    -"
    "- Proxy:   5501           -"
    "---------------------------"
