touch /etc/ssh/sshd_config.d/base.conf

echo "PasswordAuthentication no" >> /etc/ssh/sshd_config.d/base.conf
echo "PermitEmptyPasswords no" >> /etc/ssh/sshd_config.d/base.conf
echo "PubkeyAuthentication yes" >> /etc/ssh/sshd_config.d/base.conf
echo "PermitRootLogin prohibit-password" >> /etc/ssh/sshd_config.d/base.conf

systemctl restart sshd
