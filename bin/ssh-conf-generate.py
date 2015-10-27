#!/usr/bin/env python

import sys
import json

def get_host_config(name, ip, user=None, identity=None, proxy=None):
    config = "Host %s" % name
    config += "\n    HostName %s" % ip
    if user:
        config += "\n    User %s" % user
    if identity:
        config += "\n    IdentityFile %s" % identity
    if proxy:
        config += "\n    ProxyCommand ssh -q {proxy} nc -q0 {ip} 22".format(ip=ip, proxy=proxy)
    return config

def get_hosts_config(host, user=None, prefix="", identity=None, proxy=None):
    user = host.get("user", user)
    prefix = host.get("prefix", prefix)
    identity = host.get("identity", identity)
    proxy = host.get("proxy", proxy)
    config = ""
    if "ip" in host:
        host_name = prefix + host.get("name", host["ip"])
        config = get_host_config(host_name, host["ip"], user, identity, proxy) + "\n"
    for sub_host in host.get("hosts", []):
        config += get_hosts_config(sub_host, user, prefix, identity, proxy) + "\n"
    return config.strip()

if __name__ == "__main__":
    if len(sys.argv) < 2:
        print("Usage: %s [hosts.json]" % sys.argv[0])
        sys.exit(1)

    hosts = json.load(open(sys.argv[1]))
    print(get_hosts_config(hosts))

