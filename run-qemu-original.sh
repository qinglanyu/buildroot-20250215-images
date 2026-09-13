if [ "$(stat -c%s rootfs.ext2)" -lt $((64 * 1024 * 1024)) ]; then
    truncate -s 64M rootfs.ext2
fi


qemu-system-arm \
        -M mcimx6ul-evk \
        -m 512M \
        -kernel zImage \
        -dtb imx6ul-14x14-evk-qemu.dtb \
        -drive file=rootfs.ext2,format=raw,if=sd \
        -append "console=ttymxc0 root=/dev/mmcblk0 rw rootwait" \
        -nographic \
        -no-reboot

