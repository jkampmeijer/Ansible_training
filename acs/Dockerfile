FROM rockylinux/rockylinux:9-ubi-init

ARG ANSIBLE_VERSION=14.5.0
ARG ANSIBLE_LINT_VERSION=26.10.1
ARG ANSIBLE_UID=1000

RUN --mount=type=bind,from=common,source=setup.sh,target=/tmp/setup.sh \
    bash /tmp/setup.sh
COPY --from=common aliases.sh /etc/profile.d/workshop-aliases.sh

RUN dnf install -y python3.12 python3.12-pip openssh-server openssh-clients \
    && dnf clean all

# The lib64 symlink puts site-packages on sys.path twice, so ansible-lint
# warns about every collection being installed twice.
RUN python3.12 -m venv /opt/ansible \
    && rm /opt/ansible/lib64 \
    && /opt/ansible/bin/pip install --no-cache-dir \
        "ansible==${ANSIBLE_VERSION}" \
        "ansible-lint==${ANSIBLE_LINT_VERSION}"

RUN useradd --uid "${ANSIBLE_UID}" --groups wheel ansible \
    && echo "ansible:ansible" | chpasswd \
    && install -d -o ansible -g ansible -m 0700 /home/ansible/.ssh

COPY ansible-env.sh /etc/profile.d/ansible-env.sh
COPY ssh_config /etc/ssh/ssh_config.d/50-workshop.conf
COPY ssh-key.service /etc/systemd/system/ssh-key.service
RUN systemctl enable sshd ssh-key
