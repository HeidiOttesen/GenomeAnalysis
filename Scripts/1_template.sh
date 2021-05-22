#!/bin/bash -l
#SBATCH -A g2021012 -M snowy
#SBATCH -p core
#SBATCH -n 2
#SBATCH -t 5:00:00
#SBATCH -t 5:00 --qos=short
#SBATCH -J JobName
#SBATCH -o JN.log
#SBATCH --mail-user heidinaomi.ottesen.4894@student.uu.se
#SBATCH --mail-type=ALL

module load bioinfo-tools
module load blast/2.11.0+


cat $0
subject=/domus/h1/heidio/GenomeAnalysis/
query=/domus/h1/heidio/GenomeAnalysis/
id=""
