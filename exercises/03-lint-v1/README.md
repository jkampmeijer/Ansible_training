# Exercise 01: Ping your hosts

## Goal

Let Ansible reach both managed nodes without warnings.

## Concepts

- **Control node**: the machine where Ansible runs. In this workshop that is
  `acs`.
- **Managed nodes**: the machines Ansible configures over SSH: `node1` and
  `node2`.
- **Inventory** (`inventory.ini`): the list of managed nodes, one host per
  line.
- **`ansible.cfg`**: settings Ansible reads from the current directory. Here it
  points to the inventory.
- **Playbook** (`playbook.yml`): a YAML file with one or more plays. Run it
  with `ansible-playbook playbook.yml`.
- **Play**: runs a list of `tasks` on the hosts in `hosts`. `all` means every
  host in the inventory.
- **Task**: one action, done by a module. `name` describes it in the output.
- **`ansible.builtin.ping` module**: logs in on a host and checks Ansible can
  run there.
- **Gathering Facts**: before the tasks, Ansible collects information about
  each host. You'll use these facts in a later exercise.
- **Python interpreter**: Ansible runs its modules with Python on the managed
  node. Without a configured interpreter it searches for one and warns that
  the result may change. The `interpreter_python` setting in `ansible.cfg`
  sets the path.

## Start

```bash
ssh -p 2220 ansible@localhost
cd exercises/01-ping
ansible-playbook playbook.yml
```

The play runs on `node1` only, and Ansible warns about the discovered Python
interpreter.

## Assignment

1. Only `node1` is in the inventory. Add `node2` so the play runs on both
   hosts.
2. Fix the Python interpreter warning.

## Expected result

No warnings, and both hosts in the recap:

```text
PLAY RECAP *********************************************************************
node1                      : ok=2    changed=0    unreachable=0    failed=0 ...
node2                      : ok=2    changed=0    unreachable=0    failed=0 ...
```
