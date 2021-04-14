#!/bin/bash
#SBATCH -A g2021012 -M snowy
#SBATCH -p core
#SBATCH -n 2
#SBATCH -t 15:00 --qos=short
#SBATCH -J Create_Links_to_raw_data


#NOT WORKING!! Is copying files instead of creating links..

for i in /proj/g2021012/1_Zhang_2017/Transcriptomics_data/*
do
ln -s $i /domus/h1/heidio/GenomeAnalysis/01_RawData/GenomicsData/
done
