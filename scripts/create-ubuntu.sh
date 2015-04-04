virt-install -n openstack -r 2048 \
--disk path=/var/lib/libvirt/images/openstack.img,bus=virtio,size=40 \
-c /data/ISO/ubuntu-14.04.2-server-amd64.iso \
--accelerate --network bridge=br1,model=virtio \
--vcpus=1 \
--connect=qemu:///system --vnc --noautoconsole -v
