---
layout: tutorial_page
permalink: /bicg_2018_recap
title: BiCG Recap
header1: Bioinformatics for Cancer Genomics 2018
header2: So how do I process my data?
image: /site_images/CBW_cancerDNA_icon-16.jpg
home: https://bioinformaticsdotca.github.io/bicg_2018
---

# Analysis workflows

As the modules mentioned, there are multiple workflows that have been developed to help you process your data. The Broad Institute has developed a set of [best practices](https://software.broadinstitute.org/gatk/best-practices/workflow) when doing certain analysis as part of it's Genome Analysis Toolkit. Flowcharts for their pipelines are available at their website, and cover:
* [Data pre-processing](https://software.broadinstitute.org/gatk/best-practices/workflow?id=11165)
* [Detecting somatic SNVs/Indels](https://software.broadinstitute.org/gatk/best-practices/workflow?id=11146)
* [Detecting germline SNVs/Indels](https://software.broadinstitute.org/gatk/best-practices/workflow?id=11145)
* [Detecting somatic CNVs](https://software.broadinstitute.org/gatk/best-practices/workflow?id=11147)

In addition to the workflows determined by the Broad institute, a few other workflows can be found here. These are meant :

* *RNA-Sequencing pipeline*
<img src="https://github.com/bioinformaticsdotca/BiCG_2018/blob/master/Workflows/Images/RNA_workflow_diffexp.jpg?raw=true" alt="Differential Expression" width="850" />


* *SNV Detection Workflow*
<img src="https://github.com/bioinformaticsdotca/BiCG_2018/blob/master/Workflows/Images/SNV_workflow.jpg?raw=true" alt="SNV Detection" width="850" />

# File formats

* GenBank Flat File: file format for genbank intended to be human readable
* Fasta: sequence(s)
* Fastq: sequence(s) with qualities
* Sam/Bam: aligned reads either human readable or not
* VCF: variant file

For definitions of file formats, check [here](http://genome.ucsc.edu/FAQ/FAQformat.html).

# Databases

[NCBI](http://ncbi.nlm.nih.gov)  
* many, many resources including literature (PubMed and PMC), health (dbGaP and ClinVar), genomes (WG adn RefSeq), proteins (Seq and 3D structures), and chemicals (PubChem and BioSystems)
* includes Entrez gene, the best way to explore gene information (according to BFFO)  

[ICGC data portal](https://dcc.icgc.org/)  
* provides tools for visualizing, querying and downloading the data released quarterly by the consortium's member projects.
* protected and non-protected data from 90 global cancer projects 
* includes tumor/normal pairs with genome, transcriptome, methylome, and clinical data  
* includes TCGA data

[TCGA: The Cancer Genome Atlas](https://cancergenome.nih.gov/)  

[COSMIC: Catalogue of Somatic Mutations in Cancer](http://cancer.sanger.ac.uk/cosmic)  

[European Genome-Phenome Archive (EGA)](https://www.ebi.ac.uk/ega/home)    

[Dockstore](http://dockstore.org)  

[UCSC Human Cancer](https://genome-cancer.ucsc.edu)  

[GDC: Genomic Data Commons Data Portal](https://portal.gdc.cancer.gov/)  

[Cancer Genome Collaboratory](https://www.cancercollaboratory.org)  

## Variation databases

[dbSNP](https://www.ncbi.nlm.nih.gov/SNP/)  

[dbGaP](https://www.ncbi.nlm.nih.gov/gap)    

## Gene fusion databases

[ChimerDB 3](http://ercsb.ewha.ac.kr/fusiongene)  

[TCGA gene fusion portal](http://www.tumorfusions.org/)  

[Cosmic](http://cancer.sanger.ac.uk/cosmic/fusion)  

[ConjoinDB](https://metasystems.riken.jp/conjoing/)  

# Genome browsers

Used to explore genomes. Can load "tracks" of extra info. Most common UCSC then EnsEMBL then NCBI Map Viewer. Many others exist.

# Tools

## Tools for CNVs

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

## Tools for SNVs

GATK: http://www.broadinstitute.org/gsa/wiki/index.php/The_Genome_Analysis_Toolkit  
SamTools: http://samtools.sourceforge.net/  
MuTect: http://www.broadinstitute.org/software/cprg/?q=node/34  
Strelka (from Illumina): https://sites.google.com/site/strelkasomaticvariantcaller/  

## Tools for Annotation

ANNOVAR: http://www.openbioinformatics.org/annovar/  
SNPEFF: http://snpeff.sourceforge.net/  

## Pathway and Network Analysis

[Reactome](https://reactome.org/)  

[g:Profiler](https://biit.cs.ut.ee/gprofiler/)  

# Command-line tricks

Pipe output for column view and scrolling

```
your command that would output to the screen in messy columns | column -t | less -S
```

`column -t` makes your tab delimited output into nice columns  
`less -S` makes content in less left/right scrollable instead of wrapping it to the next line  
