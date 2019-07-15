#!/bin/bash -l
#
#PBS -l nodes=8:ppn=40,walltime=03:48:00
#
# job name
#PBS -N ecoli_sboydii_8
#
# stdout and stderr files
#PBS -o ecoli_sboydii_8.out -e ecoli_sboydii_8.err
#PBS -M uni@sebastianwack.de -m abe
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
	mpirun -npernode 1 ./align -i ../sequences/ecoli.fna ../sequences/sboydii.fna
	echo '<<END'
	sleep 3s
done

echo '*************************************************'
echo 'FINISHED SCRIPT'
echo '*************************************************'
