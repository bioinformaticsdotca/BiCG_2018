---
layout: tutorial_page
permalink: /bicg_2018_recap
title: BiCG Recap
header1: Bioinformatics for Cancer Genomics 2018
header2: Things We Have Learned
image: /site_images/CBW_cancerDNA_icon-16.jpg
home: https://bioinformaticsdotca.github.io/bicg_2018
---

# What does all this mean?!?

## File formats

* GenBank Flat File: file format for genbank intended to be human readable
* Fasta: sequence(s)
* Fastq: sequence(s) with qualities
* Sam/Bam: aligned reads either human readable or not
* VCF: variant file

For definitions of file formats, check [here](http://genome.ucsc.edu/FAQ/FAQformat.html).

## Databases and what they are used for

[NCBI](http://ncbi.nlm.nih.gov)  
* many, many resources including literature (PubMed and PMC), health (dbGaP and ClinVar), genomes (WG adn RefSeq), proteins (Seq and 3D structures), and chemicals (PubChem and BioSystems)
* includes Entrez gene, the best way to explore gene information (according to BFFO)  

[ICGC data portal](https://dcc.icgc.org/)  
* provides tools for visualizing, querying and downloading the data released quarterly by the consortium's member projects.
* protected and non-protected data from 90 global cancer projects 
* includes tumor/normal pairs with genome, transcriptome, methylome, and clinical data  
* includes TCGA data

TCGA: The Cancer Genome Atlas

[COSMIC: Catalogue of Somatic Mutations in Cancer](http://cancer.sanger.ac.uk/cosmic)  

dbGaP  

EGA  

[Dockstore](http://dockstore.org)  

[UCSC Human Cancer](https://genome-cancer.ucsc.edu)  

[GDC: Genomic Data Commons Data Portal](https://portal.gdc.cancer.gov/)  

[Cancer Genome Collaboratory](https://www.cancercollaboratory.org)  

### Variation databases

[dbSNP](https://www.ncbi.nlm.nih.gov/SNP/)  

### Gene fusion databases

[ChimerDB 3](http://ercsb.ewha.ac.kr/fusiongene)  
* for browsing gene fusions

TCGA gene fusion



## Genome browsers

Used to explore genomes. Can load "tracks" of extra info. Most common UCSC then EnsEMBL then NCBI Map Viewer. Many others exist.

## Alignment vs Assembly

## CNVs, SNVs, and Fusions

### Tools for CNVs

CRMAv2: http://www.aroma-project.org/vignettes/CRMAv2  
DNACopy: http://www.bioconductor.org/packages/release/bioc/html/DNAcopy.html  
HMM-Dosage: http://compbio.bccrc.ca/software/hmm-dosage/  
PICNIC: http://www.sanger.ac.uk/genetics/CGP/Software/PICNIC/  
OncoSNP: https://sites.google.com/site/oncosnp/  
HMMCopy: http://compbio.bccrc.ca/software/hmmcopy/  
Apolloh: http://compbio.bccrc.ca/software/apolloh/  
Control-FreeC: http://bioinfo-out.curie.fr/projects/freec/  
ASCAT: https://www.crick.ac.uk/peter-van-loo/software/ASCAT  
ABSOLUTE: http://software.broadinstitute.org/cancer/software/genepattern/modules/docs/ABSOLUTE/1  
TITAN: http://compbio.bccrc.ca/software/titan/  

### Tools for SNVs

GATK: http://www.broadinstitute.org/gsa/wiki/index.php/The_Genome_Analysis_Toolkit  
SamTools: http://samtools.sourceforge.net/  
MuTect: http://www.broadinstitute.org/software/cprg/?q=node/34  
Strelka (from Illumina): https://sites.google.com/site/strelkasomaticvariantcaller/  

### Tools for Annotation

ANNOVAR: http://www.openbioinformatics.org/annovar/  
SNPEFF: http://snpeff.sourceforge.net/  

## Pathway and Network Analysis

Reactome  

## Command-line tricks

Pipe output for column view and scrolling

```
your command that would output to the screen in messy columns | column -t | less -S
```

`column -t` makes your tab delimited output into nice columns  
`less -S` makes content in less left/right scrollable instead of wrapping it to the next line  

**can we do a network diagram with inputs, outputs, and flows**
