#!/bin/bash
function reset_job
{
    dev=${1}
    vega_bqb_vtrc -device ${dev} reset
    echo reset device ${i} done
}


if [[ "$1" == "" ]]; then
    ndev=1
else
    ndev=$1
fi
echo plan to reset ${ndev} devices
# enable job control by -m 
set -m  
for ((i=0; i<${ndev}; i++)); do
    reset_job ${i} &
done
wait

rm -f b*.mp4
rm -f *.hlv
