# Ansible workshop

Docker Compose lab for an Ansible workshop: `acs` (control node, Ansible via
pip) and `node1`/`node2` (managed nodes). All are Rocky Linux 9 with systemd,
SSH and static IPs, so they behave like VMs. See [README.md](README.md) for usage.

## Layout

- `compose.yml`, `acs/`, `node/`: the lab; `common/` holds the shared image
  setup.
- `exercises/NN-name/`: full Ansible setup in its starting state plus
  `README.md` (Goal, Concepts, Start, Assignment, Expected result).
  The entry point is always `playbook.yml`, run with
  `ansible-playbook playbook.yml`.
- `solutions/NN-name/`: the same directory after the assignment is done
  (no README).

## Exercise rules

- One small change per exercise; related concepts may be combined.
- Never refer to the solution; state the goal, not the exact change.
- Only use concepts introduced in the same or an earlier exercise.
- Add each exercise to the list in README.md.
- Markdown passes markdownlint and playbooks pass `ansible-lint`, with
  default rules.

## Status

Exercise 01 (ping) is the blueprint and awaits the user's refinement.

- [decisions.md](decisions.md)
- [todo.md](todo.md)
