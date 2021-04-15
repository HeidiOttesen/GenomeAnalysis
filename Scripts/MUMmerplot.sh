#!/bin/bash -l
#SBATCH -A g2021012 -M snowy
#SBATCH -p core
#SBATCH -n 2
#SBATCH -t 2:00:00
#SBATCH -J mummer
#SBATCH --mail-user heidinaomi.ottesen.4894@student.uu.se
#SBATCH --mail-type=ALL

module load bioinfo-tools
module load MUMmer/3.23
module load gnuplot/5.2.7

ref=$1
query1=$2
query2=$3

#mummer -mum -b $ref $query1 $query2 > mummer_Pacbio_vs_illumina_Nanopore.mum 
mummerplot -p mummerplot mummer_Pacbio_vs_illumina_Nanopore.mum
