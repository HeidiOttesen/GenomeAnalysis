#!/bin/bash -l
#SBATCH -A g2021012 -M snowy
#SBATCH -p core
#SBATCH -n 2
#SBATCH -t 15:00 --qos=short
#SBATCH -J Blast_prot_Lmono_vs_E745
#SBATCH -o Blast_prot_Lmono_vs_E745.log
#SBATCH --mail-user heidinaomi.ottesen.4894@student.uu.se
#SBATCH --mail-type=ALL

module load bioinfo-tools
module load blast/2.11.0+


cat $0
query1=/domus/h1/heidio/GenomeAnalysis/05_synteny/1_align/2_blast_prot/E_faecalis_prot.faa
query2=/domus/h1/heidio/GenomeAnalysis/05_synteny/1_align/2_blast_prot/E_cass_prot.faa
query3=/domus/h1/heidio/GenomeAnalysis/05_synteny/1_align/2_blast_prot/L_mono_prot.faa
db=/domus/h1/heidio/GenomeAnalysis/05_synteny/1_align/2_blast_prot/E_faecium_prot.faa
id="Lmono_vs_Efaecalis"

E=1e-5
date="May2021"

#Megablast option
#blastn -db nt -query $query -num_threads 4  -task megablast  -evalue $E -outfmt '6 qseqid qlen staxids bitscore std slen sscinames sskingdoms stitle' -out ${id}.tab


#Makedb:
#makeblastdb -in $db -dbtype prot

blastp -task blastp -db $db -query $query3 -evalue $E -outfmt '6' -out blastp_${id}_${E}_${date}.faa -num_threads 2 -max_target_seqs 1

#blastp -task blastp -db $db -query $query1 -outfmt '6' -out 'blastp${id}_${E}_${date}.faa' -num_threads 2

#blastp -task blastp -db "DB_blastp_E_faecium_${taxID}_May2021" -query $query1 -outfmt '6' -out 'blastp${id}_${E}_${date}.faa' -num_threads 2
