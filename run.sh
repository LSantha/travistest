#!/bin/sh
rm /tmp/com1.txt
echo "Starting JNode in QEMU"
qemu-system-x86_64 -cdrom jnode-x86-lite.iso -m 1024 -M pc -cpu pentium -boot once=d,menu=off -net none -serial file:/tmp/com1.txt -display none&
qemu_pid=$!
sleep 1
tail -f /tmp/com1.txt&
tail_pid=$!
until grep RAMFS /tmp/com1.txt; do
sleep 1
done
echo "Stopping QEMU"
kill $qemu_pid
kill $tail_pid
