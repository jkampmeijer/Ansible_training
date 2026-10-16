# Ansible workshop

A lab with one Ansible Control Server (`acs`) and two managed nodes
(`node1`, `node2`), all on Rocky Linux 9.

## Start the lab

```bash
docker compose up -d --build
```

## Log in

All machines run systemd and behave like VMs.
Log in as `ansible` with password `ansible`:

```bash
ssh -p 2220 ansible@localhost   # acs
ssh -p 2221 ansible@localhost   # node1
ssh -p 2222 ansible@localhost   # node2
```

On `acs`, the exercises are in `~/exercises`. Edit the files on your own
machine or inside `acs`.

| Host  | IP          |
|-------|-------------|
| acs   | 172.30.0.10 |
| node1 | 172.30.0.11 |
| node2 | 172.30.0.12 |

On Linux you can also reach the machines directly on their IP,
e.g. `ssh ansible@172.30.0.11`.

## Windows (Rancher Desktop)

- Select the **dockerd (moby)** container engine in Rancher Desktop.
- Clone the repo anywhere, e.g. on `C:\`.
- Log in with `127.0.0.1` instead of `localhost`,
  e.g. `ssh -p 2220 ansible@127.0.0.1`.

## Exercises

1. [Ping your hosts][ex1]: control and managed nodes, inventory,
   `ansible.cfg`, playbook, ping, Python interpreter.

[ex1]: exercises/01-ping/README.md

## Reset the nodes

Recreate the nodes to undo everything Ansible or you changed on them:

```bash
docker compose up -d --force-recreate node1 node2   # both nodes
docker compose up -d --force-recreate node1         # one node
```

`acs`, the exercises and the SSH key stay as they are.

The nodes get new host keys, so `ssh` from your own machine warns that the host
key changed. Remove the old key and log in again:

```bash
ssh-keygen -R "[localhost]:2221"   # node1 via port
ssh-keygen -R 172.30.0.11          # node1 via IP
ssh-keygen -R "[127.0.0.1]:2221"   # node1 on Windows
```

## Stop the lab

```bash
docker compose down      # keeps the SSH key
docker compose down -v   # also removes the SSH key
```
