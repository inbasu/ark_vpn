touch /etc/ssh/sshd_config.d/base.conf

eche "PasswordAuthentication no" >> /etc/ssh/sshd_config.d/base.conf
eche "PermitEmptyPasswords no" >> /etc/ssh/sshd_config.d/base.conf
eche "PubkeyAuthentication yes" >> /etc/ssh/sshd_config.d/base.conf
eche "PermitRootLogin prohibit-password" >> /etc/ssh/sshd_config.d/base.conf

systemctl restart sshd
