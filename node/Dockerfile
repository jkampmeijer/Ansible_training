FROM rockylinux/rockylinux:9-ubi-init

ARG ANSIBLE_UID=1000

RUN --mount=type=bind,from=common,source=setup.sh,target=/tmp/setup.sh \
    bash /tmp/setup.sh
COPY --from=common aliases.sh /etc/profile.d/workshop-aliases.sh

RUN dnf install -y openssh-server python3 \
    && dnf clean all

RUN useradd --uid "${ANSIBLE_UID}" --groups wheel ansible \
    && echo "ansible:ansible" | chpasswd \
    && install -d -o ansible -g ansible -m 0700 /home/ansible/.ssh

COPY authorized-key.service /etc/systemd/system/authorized-key.service
RUN systemctl enable sshd authorized-key
