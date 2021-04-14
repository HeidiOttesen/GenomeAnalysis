#!/bin/bash -l
#SBATCH -A g2021012 -M snowy
#SBATCH -p core
#SBATCH -n 2
#SBATCH -t 7:15:00 
#SBATCH -J Canu_assembly_PacBio
#SBATCH --mail-user heidinaomi.ottesen.4894@student.uu.se
#SBATCH --mail-type=ALL

module load bioinfo-tools
module load canu/2.0

id="E745"
output="/domus/h1/heidio/GenomeAnalysis/03_Assembly/1_PacBio/"

read1=$1
read2=$2
read3=$3
read4=$4
read5=$5
read6=$6

canu -p $id -d $output genomeSize=4.5m -pacbio $read1 $read2 $read3 $read4 $read5 $read6
#canu -p $id -d $output -pacbio $read1 $read2 $read3 $read4 $read5 $read6
