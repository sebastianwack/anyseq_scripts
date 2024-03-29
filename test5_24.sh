#!/bin/bash -l
#
#PBS -l nodes=24:ppn=40,walltime=3:00:00
#
# job name
#PBS -N test5_24
#
# stdout and stderr files
#PBS -o test5_24.out -e test5_24.err
# first non-empty non-comment line ends PBS options

echo '*************************************************'
echo 'STARTING SCRIPT'
echo '*************************************************'

module load gcc/8.1.0 git/2.2.1 cmake/3.12.1+f7dn6o openmpi/2.0.2-gcc
source anydsl/project.sh

cd anyseq/build_cpu

for i in `seq 1 1`;
do
	echo 'START>>'
	mpirun -npernode 1 ./align -i ../../anyseq_input_files/test5a.fna ../../anyseq_input_files/test5b.fna
	echo '<<END'
	sleep 3s
done

echo '*************************************************'
echo 'FINISHED SCRIPT'
echo '*************************************************'
