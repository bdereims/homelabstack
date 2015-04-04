#!/bin/bash
if [ "`cat /sys/kernel/mm/ksm/run`" -ne 1 ] ; then
       echo 'KSM is not enabled. Run echo 1 > /sys/kernel/mm/ksm/run' to enable it.
       exit 1
fi
echo Shared memory is $((`cat /sys/kernel/mm/ksm/pages_shared`*`getconf PAGE_SIZE`/1024/1024)) MB
echo Saved memory is $((`cat /sys/kernel/mm/ksm/pages_sharing`*`getconf PAGE_SIZE`/1024/1024)) MB
if ! `type bc &>/dev/null`  ; then
        echo "bc is missing or not in path, skipping ratio calculation"
        exit 1
fi
if [ "`cat /sys/kernel/mm/ksm/pages_sharing`" -ne 0 ] ; then
        echo -n "Shared pages usage ratio is ";echo "scale=2;`cat /sys/kernel/mm/ksm/pages_sharing`/`cat /sys/kernel/mm/ksm/pages_shared`"|bc -q
        echo -n "Unshared pages usage ratio is ";echo "scale=2;`cat /sys/kernel/mm/ksm/pages_unshared`/`cat /sys/kernel/mm/ksm/pages_sharing`"|bc -q
fi
