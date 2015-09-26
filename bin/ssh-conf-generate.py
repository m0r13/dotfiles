#!/usr/bin/env python

import sys
import json
import os
import shutil
import re

PREFIX = ""
USER = None
IDENTITY = None

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

def get_hosts_config(host, parent_host=None):
    host_name = PREFIX + host["name"]
    config = get_host_config(host_name, host["ip"], user=host.get("user", USER), identity=host.get("identity", IDENTITY), proxy=parent_host) + "\n"
    for sub_host in host.get("sub_hosts", []):
        config += get_hosts_config(sub_host, host_name) + "\n"
    return config.strip()

if __name__ == "__main__":
    if len(sys.argv) < 2:
        print("Usage: %s [hosts.json]" % sys.argv[0])
        sys.exit(1)

    hosts = json.load(open(sys.argv[1]))
    if "user" in hosts:
        USER = hosts["user"]
    if "prefix" in hosts:
        PREFIX = hosts["prefix"]
    if "identity" in hosts:
        IDENTITY = hosts["identity"]
    for host in hosts["hosts"]:
        print(get_hosts_config(host))

