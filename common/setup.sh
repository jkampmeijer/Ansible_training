#!/bin/bash
set -euo pipefail

sed -i '/^tsflags=nodocs/d' /etc/dnf/dnf.conf
dnf swap -y coreutils-single coreutils
dnf install -y bash-completion less man-db man-pages vim-enhanced nano sudo \
    iputils bind-utils tree wget unzip rsync tar findutils which hostname \
    iproute procps-ng diffutils
# Packages installed while docs were disabled lack their man pages.
dnf reinstall -y $(rpm -qa --qf '%{NAME}\n' | grep -v '^gpg-pubkey$')
dnf clean all
