#!/bin/bash

if [ -z "$1" ]; then
  echo "Syntax: $(basename $0) <group>" >&2
  exit 1
fi

for flowcell in 140606_ST-E00105_0103_AH047HALXX \
                140606_ST-E00105_0104_BH04YVALXX \
                140609_ST-E00111_0068_AH047CALXX \
                140609_ST-E00111_0069_BH0564ALXX \
                140609_ST-E00137_0016_Ah03hralxx \
                140609_ST-E00137_0017_Bh03h5alxx \
                140610_ST-E00105_0105_BH03HEALXX \
                140610_ST-E00105_0106_AH03HYALXX \
                140610_ST-E00135_0012_AH03GYALXX \
                140610_ST-E00135_0013_BH03HDALXX \
                140613_ST-E00111_0070_BH05GGALXX \
                140613_ST-E00111_0071_AH05D9ALXX \
                140613_ST-E00135_0014_AH05H2ALXX \
                140613_ST-E00135_0015_BH05ELALXX
do
  cd $flowcell
  echo $flowcell
  /usr/bin/time chgrp -R $1 Config Data Interop Logs PeriodicSaveRates Recipe RTALogs
  echo " "
  cd ..
done
