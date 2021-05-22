# Genome Analysis


### ARTICLE I 
(TA Linnéa Smeds)

Title:
## RNA-seq and Tn-seq reveal fitness determinants of vancomycin-resistant Enterococcus faecium during growth in human serum

#### Authors:
> Xinglin Zhang, Vincent de Maat, Ana M. Guzmán Prieto, Tomasz K. Prajsnar, Jumamurat R. Bayjanov, Mark de Been, Malbert R. C. Rogers, Marc J. M. Bonten, Stéphane Mesnage, Rob J. L. Willems and Willem van Schaik 
#### Abstract:
> Enterococcus faecium is a commensal bacterium in the human gut that is associated with opportunistic bloodstream infections in immunocompromised hospitalized patients. 
> Moreover, it has recently acquired resistance to multiple antibiotics, which represents a big public health concern. 
> However, the growth and survival mechanisms of this opportunistic pathogen in the bloodstream have not been characterized. 
> In this study you will identify what genes allow E.faecium to grow in human blood by different profiling techniques based on RNA-Seq and Tn-Seq.
## Aim
The aim of this project is to assemble the genome of Enterococcus faecium based on three different types of raw reads (Nanopore, PacBio, illumina). And then we want to compare expression levels of the bacteria grown in rich medium vs in human serum to identify genes that are essential for survival in humans. These could be potential targets for developing new drugs. 


### Methods and pipeline used in article:

> -	Genome:<br>
> -	Assembly<br>
>		-	PacBio - Celera - assembly<br>
>		-	Illumina - BWA vs - mapped (for correction)<br>
>			-	--> 15 contigs (1 contig=2.77Mbp chromosome)<br>
>			-	confirmed with gap-spanning PCRs + sequencing<br>
>		-	illumina + MinION 2D -> Spades assembler to fill final gap in one plasmid --> complete assembly<br>
>		-	SAMtools on BWA short read alignments - to check coverage and find possible base-calling errors<br>
>		-	Prokka - for annotation<br>
>			-	--> On NCBI w accession numbers: CP014529 – CP014535.<br>
> <br>
>	-	Alignment with 72 other genomes of global E. faecium - ParSNP<br>
>	-	Phylogenetic tree based on Maximum likelihood<br>
>		-	visualized by MEGA<br>
>	-	ResFinder - to find genes involved in drug resistance<br>
>	-	RNA-seq:<br>
>		-	ScriptSeq - library prep -> cDNA (rRNA removed before) -> PCR -><br>
>			-	Illumina HiSeq 2500 100bp paired end read<br>
>		-	Rockhopper<br>
>		-	Mapping of expression reads on genome?<br>
>	-	qPCR to confirm a few genes expression levels between serum and medium - highly concordant<br>
>	-	Tn-seq - transposon insertion sequencing <br>
>		-	monitoring the fitness of transposon insertion mutant libraries - <br>
>		-	manual random insertion of a known transposon - mariner transposon + delivery plasmid - Mmel restriction sites<br>
>		-	transposon mutagenesis transposon insertion in genes disrupt gene function<br>
>		-	K-mers/windows of 25nt<br>
### Project Plan:
<pre>
1 Genome Assembly 
  	1.1 Quality Check on Raw Reads using FastQC
  	1.2 Trimming With Trimmomatic
  	1.3 Quality Check After Trimming Using FastQC
  	1.4 Assembly of Long PacBio Reads Using Canu
  	1.5 Genome Assembly of Short illumina and Nanopore Reads Using Spades
  	1.6 Aligning and Combining illumina Raw Reads Together With PacBio Assembly Using BWA and Pilon 
 	1.7 Evaluation of the Different Assemblies Using Quast
	1.8 Annotation of PacBio Assembly Using Prokka - structural and functional
	(1.9 Plasmid identification)
(Checkpoint 1 - trimming/qc/assembly)
2 SyntenyPhylogeny
	2.1 Blastn
	(2.2 Phylogenetic tree by ML)
	(2.3 ParSNP)	
3 Transcriptomics
	3.1 Mapping RNA-seq on assemblies using BWA
	3.2 Differential expression using Htseq and Deseq2
	(3.3 Tn-seq)
(4 Post_analyses)
	(4.1 Identify Resistance genes using ResFinder)
(Checkpoint 2 - RNAseq expression analysis)

</pre>

### Timeline
![Preliminary timeline:](git_general/Gantt_Timeline.jpg "Gantt Timeline")


### Sample: E. faecium strain E745
Metadata in file: [Metadata](https://github.com/HeidiOttesen/GenomeAnalysis/blob/b57f824e2be54d682f32d9a684108f95f5e8b7d6/git_general/Metadata_PRJEB19025_tsv.txt)<br>
Link to original files on [ENA (ebi)](https://www.ebi.ac.uk/ena/browser/view/PRJEB19025)<br>
An ampicillin- and vancomycin-resistant clinical isolate - clade A-1 strain (concluded from assembly and phylogeny)
isolated from a rectal swab of a patient (nephrology ward, Netherlands, 2000). Comparing growth of bacteria between human serum and a mediu, BHI - brain heart infusion broth at 37°C. <br>
Organization and raw read file sizes: see [folders_structure.txt](https://github.com/HeidiOttesen/GenomeAnalysis/blob/b57f824e2be54d682f32d9a684108f95f5e8b7d6/git_general/folders_structure.txt) file <br>
