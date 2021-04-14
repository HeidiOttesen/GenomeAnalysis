#!/bin/bash -l
#SBATCH -A g2021012 -M snowy
#SBATCH -p core
#SBATCH -n 5
#SBATCH -t 7:15:00
#SBATCH -J Spades_illumina
#SBATCH --mail-user heidinaomi.ottesen.4894@student.uu.se
#SBATCH --mail-type=ALL

module load bioinfo-tools 
module load spades/3.14.1    #spades/3.14.1 latest version in April 2021

read1=$1
read2=$2

#id="EfaeciumE745"
outdir="/domus/h1/heidio/GenomeAnalysis/03_Assembly/2_illumina/"

spades.py --careful -t 5 -k auto -o $outdir --pe1-1 $READ1 --pe1-2 $READ2
