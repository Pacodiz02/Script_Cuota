#!/usr/bin/env bash

umount /QUOTA
rm -r /QUOTA
cat /etc/fstab | sed '$d' >> /etc/fstab
