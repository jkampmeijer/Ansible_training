# To-do

- [ ] Refine exercise 01 into the blueprint for the other exercises.
- [ ] Plan the list of exercises and their concepts.
- [ ] Student laptop (Rancher Desktop, Windows 11) can't reach the Docker
  engine from Windows: "timed out dialing Hyper-V socket", even for
  `docker run --rm hello-world`. Docker inside the VM works
  (`rdctl shell docker version`). Next steps:
  - ask IT about endpoint protection and the Hyper-V firewall policy
  - test the lab from inside the VM: `rdctl shell docker compose version`,
    `rdctl shell ls /mnt/c`
  - fallback: one lab copy per student on a trainer-controlled Linux server
    (needs configurable ports and subnet)
- [ ] Smoke test on one student laptop (Rancher Desktop, Windows):
  - `docker compose up -d --build`
  - copy `solutions/01-ping` into `exercises/` and run its playbook on acs
  - `ssh -p 2220 ansible@127.0.0.1` and `-p 2221` from Windows
  - `systemctl is-system-running` on a node
