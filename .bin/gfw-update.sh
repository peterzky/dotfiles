#!/usr/bin/env bash
ip_list="https://raw.githubusercontent.com/17mon/china_ip_list/master/china_ip_list.txt"
gfw_list="https://raw.githubusercontent.com/gfwlist/gfwlist/master/gfwlist.txt"
gfw_supplement="https://raw.githubusercontent.com/hq450/fancyss/master/rules/gfwlist.conf"

update_list() {
    cat /tmp/gfw_all_domain > $HOME/nixos/files/gfw_all_domain
    cat /tmp/china_ip_list  > $HOME/nixos/files/china_ip_list
    echo "Update Completed, Please rebuild the system when possible."
}

echo "update china_ip_list..."
curl -Ls $ip_list -o /tmp/china_ip_list
echo "download completed"
diff ~/nixos/files/china_ip_list /tmp/china_ip_list

echo "update gfw_list..."
curl -Ls $gfw_list \
    | base64 -d | sort -u | sed '/^$\|@@/d' \
    | sed 's#!.\+##; s#|##g; s#@##g; s#http:\/\/##; s#https:\/\/##;' \
    | sed '/\*/d; /apple\.com/d; /sina\.cn/d; /sina\.com\.cn/d; /baidu\.com/d; /qq\.com/d' \
    | sed '/^[0-9]\+\.[0-9]\+\.[0-9]\+\.[0-9]\+$/d' \
    | grep '^[0-9a-zA-Z\.-]\+$' \
    | grep '\.' | sed 's#^\.\+##' \
    | sort -u > /tmp/temp_gfwlist.txt
curl -Ls $gfw_supplement \
    | sed 's/ipset=\/\.//g; s/\/gfwlist//g; /^server/d' > /tmp/temp_koolshare.txt
echo "concatenate gfw_list and gfw_supplement"
cat /tmp/temp_gfwlist.txt /tmp/temp_koolshare.txt | sort -u > /tmp/gfw_all_domain
diff ~/nixos/files/gfw_all_domain /tmp/gfw_all_domain

while true; do
    read -p "Update List?(y/n): " yn
    case $yn in
        [Yy]* ) update_list;break;;
        [Nn]* ) exit;;
        * ) echo "Please answer yes or no.";;
    esac
done
