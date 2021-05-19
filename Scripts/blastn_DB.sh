#!/bin/bash -l
#SBATCH -A g2021012 -M snowy
#SBATCH -p core
#SBATCH -n 2
#SBATCH -t 3:00:00
#SBATCH -J blast_DB_Efaecalis
#SBATCH -o blast_DB_Efaecalis.log
#SBATCH --mail-user heidinaomi.ottesen.4894@student.uu.se
#SBATCH --mail-type=ALL

cat $0

module load bioinfo-tools
module load blast/2.11.0+

#taxID=1352 #Enterococcus faecium
taxID=1351 #Enterococcus faecalis
#taxID=37734 #Enterococcus casseliflavus
#taxID=1639 #Listeria monocytogenes

db=/domus/h1/heidio/GenomeAnalysis/05_synteny/genomes_other/E_faecalis_DB/E_faecalis_GCF_003319815.1_ASM331981v1_genomic.fna
id="E_faecalis"
query=/domus/h1/heidio/GenomeAnalysis/03_Assembly/contig_links/Pilon_illumina_Nanopore_PacBio.fasta

makeblastdb -in $db -dbtype nucl -taxid $taxID -out "DB_blast_${id}_${taxID}_Apr2021"

blastn -db $db -query $query -out $BlastDB_${id}_vs_EfaeciumE745.tab -num_threads 2 -outfmt '6 qseqid qlen staxids bitscore std sscinames scomnames sskingdoms stitle' -evalue '1e-20'

