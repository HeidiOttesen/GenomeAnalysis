#!/bin/bash -l
#SBATCH -A g2021012 -M snowy
#SBATCH -p core
#SBATCH -n 2
#SBATCH -t 5:15:00
#SBATCH -J HTSeq_RNA_Serum_ERR1797971
#SBATCH -o HTSeq_RNA_Serum_ERR1797971_2.log
#SBATCH --mail-user heidinaomi.ottesen.4894@student.uu.se
#SBATCH --mail-type=ALL

cat $0

module load bioinfo-tools
module load htseq/0.12.4
module load python/3.7.2

inbam=/domus/h1/heidio/GenomeAnalysis/03_Assembly/6_Transcriptomic/1_BWA/RNA-Seq_Serum/BWA_RNA_BHI_paired_ERR1797971_sorted.bam
gffref=/domus/h1/heidio/GenomeAnalysis/04_Assembly_evaluation/1_PROKKA/3_PB_illumina_NanoPore/PacBio_illumina_NanoPore.gff
id="HTSeq_RNA_Serum_ERR1797971_2"

htseq-count -r name -f bam $inbam $gffref > ${id}.txt



