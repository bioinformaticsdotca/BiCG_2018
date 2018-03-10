---
layout: tutorial_page
permalink: /bicg_2018_ia2
title: BiCG
header1: Bioinformatics for Cancer Genomics 2018
header2: Integrative Assignment Day 2
image: /site_images/CBW_cancerDNA_icon-16.jpg
home: https://bioinformaticsdotca.github.io//bicg_2018
---

# Overview of Day 2

The task for this assignment is to align a subset of reads from the the tumour and normal HCC1395 cell line samples to the human reference genome, and then perform copy number analysis on the samples. You will need to follow a similar procedure to the labs from Modules 5 and 6, while also making sure to check the `Data Preprocessing` sections to properly process the samples. The analysis should only be focused on chromosome 6 due to time constraints.

The fastq files for this assignment are stored in the following directory:

```
~/CourseData/CG_data/IA_tuesday/data/
```

Task list:
* 1) Align reads to the reference genome 
* 2) Convert the sam file to a bam output
* 3) Sort the bam file
* 4) Index your newly created bam
* 5) Follow the Data Preprocessing from Module 6 to generate coverage information and allelic frequencies for your sample
* 6) Run TitanCNA on the resulting files

Questions:
Do the reads map only to chromosome 6? If they were extracted from a previous bam file, what possible reasons could there be for them mapping to other chromosomes?
Why is indexing of the bam file required?
Compare the resulting TitanCNA output with the plots generated from Module 6 - what possible reason(s) could explain any differences?
