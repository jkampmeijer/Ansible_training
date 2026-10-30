export PATH="/opt/ansible/bin:${PATH}"
# Windows bind mounts look world-writable, and Ansible then skips ./ansible.cfg.
# An explicit ANSIBLE_CONFIG bypasses that check.
export ANSIBLE_CONFIG=.
# Without a .git above the exercises, ansible-lint caches in the unwritable
# /.ansible. An explicit ANSIBLE_HOME makes it cache there instead.
export ANSIBLE_HOME="${HOME}/.ansible"
