#!/bin/bash -l
#SBATCH -A g2021012 -M snowy
#SBATCH -p core
#SBATCH -n 2
#SBATCH -t 20:00:00
#SBATCH -J Deseq2
#SBATCH -o Deseq2_all.log
#SBATCH --mail-user heidinaomi.ottesen.4894@student.uu.se
#SBATCH --mail-type=ALL

cat $0

module load bioinfo-tools
module load



