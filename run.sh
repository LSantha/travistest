#!/bin/sh
rm /tmp/com1.txt
qemu-system-x86_64 -cdrom jnode-x86-lite.iso -m 1024 -cpu pentium -serial file:/tmp/com1.txt -display none&
pid=$!
sleep 1
tail -f /tmp/com1.txt&
until grep RAMFS /tmp/com1.txt; do
sleep 1
done
kill $pid
