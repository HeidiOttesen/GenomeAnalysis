#!/bin/bash -l
#SBATCH -A g2021012 -M snowy
#SBATCH -p core
#SBATCH -n 5
#SBATCH -t 7:15:00
#SBATCH -J Spades_illumina_Nanopore_PacBio
#SBATCH --mail-user heidinaomi.ottesen.4894@student.uu.se
#SBATCH --mail-type=ALL

module load bioinfo-tools 
module load spades/3.14.1    #spades/3.14.1 latest version in April 2021

read1="/domus/h1/heidio/GenomeAnalysis/01_RawData/GenomicsData/Illumina/E745-1.L500_SZAXPI015146-56_1_clean.fq.gz"
read2="/domus/h1/heidio/GenomeAnalysis/01_RawData/GenomicsData/Illumina/E745-1.L500_SZAXPI015146-56_2_clean.fq.gz"
read3="/domus/h1/heidio/GenomeAnalysis/01_RawData/GenomicsData/Nanopore/E745_all.fasta.gz" #Nanopore
read4="/domus/h1/heidio/GenomeAnalysis/01_RawData/GenomicsData/PacBio/m131023_233432_42174_c100519312550000001823081209281335_s1_X0.1.subreads.fastq.gz" #PacBio
read5="/domus/h1/heidio/GenomeAnalysis/01_RawData/GenomicsData/PacBio/m131023_233432_42174_c100519312550000001823081209281335_s1_X0.2.subreads.fastq.gz"
read6="/domus/h1/heidio/GenomeAnalysis/01_RawData/GenomicsData/PacBio/m131023_233432_42174_c100519312550000001823081209281335_s1_X0.3.subreads.fastq.gz"
read7="/domus/h1/heidio/GenomeAnalysis/01_RawData/GenomicsData/PacBio/m131024_200535_42174_c100563672550000001823084212221342_s1_p0.1.subreads.fastq.gz"
read8="/domus/h1/heidio/GenomeAnalysis/01_RawData/GenomicsData/PacBio/m131024_200535_42174_c100563672550000001823084212221342_s1_p0.2.subreads.fastq.gz"
read9="/domus/h1/heidio/GenomeAnalysis/01_RawData/GenomicsData/PacBio/m131024_200535_42174_c100563672550000001823084212221342_s1_p0.3.subreads.fastq.gz"

#id="EfaeciumE745"
outdir="/domus/h1/heidio/GenomeAnalysis/03_Assembly/4_illumina_Nanopore_PacBio/"

spades.py --careful -t 5 -k auto -o $outdir --pe1-1 $read1 --pe1-2 $read2 --nanopore $read3 --pacbio $read4 $read5 $read6 $read7 $read8 $read9
