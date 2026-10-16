export PATH="/opt/ansible/bin:${PATH}"
# Windows bind mounts look world-writable, and Ansible then skips ./ansible.cfg.
# An explicit ANSIBLE_CONFIG bypasses that check.
export ANSIBLE_CONFIG=.
