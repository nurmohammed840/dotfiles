#!/usr/bin/env nu

def test-mirror [url: string] {
    let result = (
        curl -L -o /dev/null -s
        -w '%{time_namelookup} %{time_connect} %{time_appconnect} %{time_pretransfer} %{time_redirect} %{time_starttransfer} %{time_total} %{size_download} %{speed_download} %{http_code}'
        $"($url)/nix-cache-info"
        | str trim
    )

    let v = ($result | split row " ")
    let dns = ($v | get 0 | into float)

    {
        Mirror: $url
        DNS: $dns
        TCP: (($v | get 1 | into float) - $dns)
        TLS: (($v | get 2 | into float) - $dns)
        Pre: (($v | get 3 | into float) - $dns)
        Redirect: ($v | get 4 | into float)
        TTFB: (($v | get 5 | into float) - $dns)
        Total: (($v | get 6 | into float) - $dns)
        Size: ($v | get 7 | into int)
        Speed: ($v | get 8 | into int)
        HTTP: ($v | get 9 | into int)
    }
}


let urls = [
    "https://mirrors.ustc.edu.cn/nix-channels/store"
    "https://mirrors.tuna.tsinghua.edu.cn/nix-channels/store"
    "https://mirror.sjtu.edu.cn/nix-channels/store"
    "https://cache.nixos.org"
    "https://nix-community.cachix.org"
]

$urls
| each {|url| test-mirror $url }
| sort-by Total
| table