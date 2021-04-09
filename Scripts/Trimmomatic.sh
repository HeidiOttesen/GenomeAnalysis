#!/bin/bash -l
#SBATCH -A g2021012 -M snowy
#SBATCH -p core
#SBATCH -n 2
#SBATCH -t 15:00 --qos=short
#SBATCH -J Trimmomatic1_illumina_read2
#SBATCH --mail-user heidinaomi.ottesen.4894@student.uu.se
#SBATCH --mail-type=ALL

module load bioinfo-tools
module load trimmomatic/0.36 #latest version April 2021: 0.36
module load java/sun_jdk1.8.0_151


id="illumina"

read1=$1 #forward
read2=$2 #reverse

java -jar $TRIMMOMATIC_HOME/trimmomatic.jar PE -phred33 $read1 $read2 ${id}.trimmomatic_r1_P ${id}.trimmomatic_r1_U ${id}.trimmomatic_r2_P ${id}.trimmomatic_r2_U TRAILING:3 SLIDINGWINDOW:4:15 MINLEN:36




