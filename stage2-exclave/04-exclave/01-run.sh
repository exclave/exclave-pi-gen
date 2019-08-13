#!/bin/bash -e

install -m 644 files/cmdline.txt          "${ROOTFS_DIR}/boot/"
install -m 644 files/config.txt           "${ROOTFS_DIR}/boot/"
install -m 644 files/fstab                "${ROOTFS_DIR}/etc/fstab"
install -m 644 files/exclave-sda.service  "${ROOTFS_DIR}/etc/systemd/system/"
install -m 644 files/exclave-sda1.service "${ROOTFS_DIR}/etc/systemd/system/"

# Disable consoles on the serial port, and enable exclave
on_chroot << EOF
systemctl mask serial-getty@ttyAMA0.service
sudo systemctl mask serial-getty@ttyS0.service
sudo systemctl enable exclave-sda.service
sudo systemctl enable exclave-sda1.service
systemctl enable exclave-sda.service
systemctl enable exclave-sda1.service
EOF
