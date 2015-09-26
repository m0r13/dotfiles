#!/bin/bash

ssh-conf-generate.py ~/bin/hetzner-hosts.json > ~/.ssh/42-hetzner.sshconf
ssh-conf-generate.py ~/bin/bpt-hosts.json > ~/.ssh/50-bpt.sshconf
ssh-conf-merge.sh

