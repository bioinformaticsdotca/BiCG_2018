---
layout: tutorial_page
permalink: /BiCG_2018_module3_igv
title: BiCG Lab 3 IGV
header1: Workshop Pages for Students
header2: Bioinformatics for Cancer Genomics
image: /site_images/CBW_cancerDNA_icon-16.jpg
home: https://bioinformaticsdotca.github.io/bicg_2018
description: BiCG Lab 2 IGV
author: Sorana Morrissy and Florence Cavalli
modified: March 13th, 2018
---

# CBW BiCG Module 3 - IGV lab

This lab was created by Sorana Morrissy, then modified by Florence Cavalli

## Introduction

### Description of the lab

Welcome to the lab for **Genome Visualization**! This lab will introduce you to the [Integrative Genomics Viewer](http://www.broadinstitute.org/igv), one of the most popular visualization tools for High Throughput Sequencing (HTS) data.

After this lab, you will be able to:

* visualize a variety of genomic data
* very quickly navigate around the genome
* visualize HTS read alignments
* validate SNP calls and structural re-arrangements by eye

Things to know before you start:

* The lab may take between **1-2 hours**, depending on your familiarity with genome browsing. Don't worry if you don't complete the lab! It is available for you to complete later.
* There are a few thought-provoking **Questions** or **Notes** pertaining to sections of the lab. These are **optional**, and may take more time, but are meant to help you better understand the visualizations you are seeing. These questions will be denoted by boxes, as follows:

 **Question(s):**
 * Thought-provoking question goes here

### Requirements 

* [Integrative Genomics Viewer](http://www.broadinstitute.org/igv) 
* Ability to run Java

### Compatibility

This tutorial was intended for **IGV v2.3**, which is available on the [Download](http://www.broadinstitute.org/software/igv/download) page. It is *strongly* recommended that you use this version, as other versions may not be compatible. If you have installed a former version, please uninstall it and install the latest version.

### Data Set for IGV

* Chromosome 21: 19,000,000-20,000,000
* [HCC1143.normal.21.19M-20M.bam](https://github.com/bioinformatics-ca/bioinformatics-ca.github.io/raw/master/data_sets/HCC1143.normal.21.19M-20M.bam)
* [HCC1143.normal.21.19M-20M.bam.bai](https://github.com/bioinformatics-ca/bioinformatics-ca.github.io/raw/master/data_sets/HCC1143.normal.21.19M-20M.bam.bai)

### Check the online student page

Your instructors may update the lab with clarifications or more bonus sections.

# Visualization Part 1: Getting familiar with IGV

We will be visualizing read alignments using the
[Integrative Genomics Viewer](http://www.broadinstitute.org/igv), 
a popular visualization tool for HTS data.

First, lets familiarize ourselves with it.

## Get familiar with the interface 

### Load a Genome and Data Tracks

By default, IGV loads Human hg19. If you work with another version of the human genome, or another organism altogether, you can change the genome by clicking the drop down menu in the upper-left. For this lab, we'll be using Human hg19.  

We will also load additional tracks from **Server**:

* Ensembl genes (or your favourite source of gene annotations)
* GC Percentage
* dbSNP 1.4.7

*Note:* If you are using a computer with low memory, only load the gene annotations.

![loag_hg19_genome](https://github.com/bioinformaticsdotca/HT-Biology_2017/raw/master/HtSeq/img/igv_genome1.png)

![Load hg19 genome and additional data tracks](https://github.com/bioinformaticsdotca/HT-Biology_2017/raw/master/HtSeq/img/igv_server_load.png)
<!---(https://bioinformatics-ca.github.io/images/Igv_load_data_tracks.png)--->

### Navigation

You should see listing of chromosomes in this reference genome. Choose **1**, for chromosome 1.

![Chromosome chooser](https://bioinformatics-ca.github.io/images/Igv-chromosomes.png)

Navigate to **chr1:10,000-11,000** by entering this into the location field (in the top-left corner of the interface) and clicking **Go**. This shows a window of chromosome 1 that is 1,000 base pairs wide and beginning at position 10,000.

![Navigition using Location text field. Sequence track displayed as sequence of colours.](https://bioinformatics-ca.github.io/images/Igv-1.png)

IGV displays the sequence of letters in a genome as a sequence of colours (e.g. A = green). This makes repetitive sequences, like the ones found at the start of this region, easy to identify.

You can navigate to a gene of interest by typing it in the same box the genomic coordinates are in and pressing Enter/Return. Try it for your favourite gene, or BRCA1 if you can't decide. 

![Gene model.](https://bioinformatics-ca.github.io/images/Igv-genes.png)

Genes are represented as lines and boxes. Lines represent intronic regions, and boxes represent exotic regions. The arrows indicate the strand on which the gene lies.

When loaded, tracks are stacked on top of each other. You can identify which track is which by consulting the label to the left of each track.

## Region Lists

Sometimes, it's really useful to save where you are, or to load regions of interest. For this purpose, there is A **Region Navigator** in IGV. To access it, click Regions > Region Navigator. While you browse around the genome, you can save some bookmarks by pressing the Add button at any time.

![Bookmarks in IGV.](https://bioinformatics-ca.github.io/images/Igv-bookmarks.png)

## Loading Read Alignments

We will be using the breast cancer cell line HCC1143 to visualize alignments.  For speed, only a small portion of chr21 will be loaded (19M:20M).

*HCC1143 Alignments to hg19:* 

* [HCC1143.normal.21.19M-20M.bam](https://github.com/bioinformatics-ca/bioinformatics-ca.github.io/raw/master/data_sets/HCC1143.normal.21.19M-20M.bam)
* [HCC1143.normal.21.19M-20M.bam.bai](https://github.com/bioinformatics-ca/bioinformatics-ca.github.io/raw/master/data_sets/HCC1143.normal.21.19M-20M.bam.bai)


Copy the files to your local drive, and in IGV choose **File > Load from File...**, select the bam file, and click **OK**.  Note that the bam and index files must be in the same directory for IGV to load these properly.

![Load BAM track from File](https://bioinformatics-ca.github.io/images/Igv_load_bam.png)

## Visualizing read alignments

Navigate to a narrow window on chromosome 21: "chr21:19,480,041-19,480,386". 

To start our exploration, right click on the track-name, and select the following options:

* Sort alignments by “start location”
* Group alignments by "pair orientation"

Experiment with the various settings by right clicking the read alignment track and toggling the options. Think about which would be best for specific tasks (e.g. quality control, SNP calling, CNV finding).

![Read information.](https://bioinformatics-ca.github.io/images/Igv_sort_and_group.png)

You will see reads represented by grey or white bars stacked on top of each other, where they were aligned to the reference genome. The reads are pointed to indicate their orientation (i.e. the strand on which they are mapped).  Mouse over any read and notice that a lot of information is available. To toggle read display from "hover" to "click", select the yellow box and change the setting.

![Read information.](https://bioinformatics-ca.github.io/images/Igv_show_details_on_click.png)

Once you select a read, you will learn what many of these metrics mean, and how to use them to assess the quality of your datasets.  At each base that the read sequence **mismatches** the reference, the colour of the base represents the letter that exists in the read (using the same colour legend used for displaying the reference).

![Read information.](https://bioinformatics-ca.github.io/images/Igv_click_read.png)

# Visualization Part 2: Inspecting SNPs, SNVs, and SVs 

In this section we will be looking in detail at 8 positions in the genome, and determining whether they represent real events or artifacts.

## Neighbouring somatic SNV and germline SNP 

Navigate to position "chr21:19,479,237-19,479,814"

  * center on the SNV, sort by base (window "chr21:19,478,749-19,479,891" is centered on the SNV)
  * Sort alignments by “base”
  * Color alignments by “read strand”  
 
![Example1. Good quality SNVs/SNPs](https://bioinformatics-ca.github.io/images/Igv_example1_color.png)

 **Notes:**
 
 * High base qualities in all reads except one (where the alt allele is the last base of the read) 
 * Good mapping quality of reads, no strand bias, allele frequency consistent with heterozygous mutation

 **Question(s):**
 
 * What does Shade base by quality do? How might this be helpful?
 * How does Color by "read strand" help?

## Homopolymer repeat with indel 

Navigate to position "chr21:19,518,412-19,518,497"

 * Group alignments by "read strand"
 * Center on the second "T", and Sort alignments by “base” on the forward strand reads

![Example2](https://bioinformatics-ca.github.io/images/Igv_example2a.png)

 * center on the one base deletion, and Sort alignments by “base” on the reverse strand reads
 
![Example2](https://bioinformatics-ca.github.io/images/Igv_example2b.png)

 **Notes:**
 
 * The alt allele is either a deletion or insertion of one or two "T"s
 * The remaining bases are mismatched, because the alignment is now out of sync
 * (Using an older version of dbSNP (1.3.1) the entry at this location (rs74604068) is an A->T, and in all likelihood an artifact i.e. the common variants included some cases that are actually common misalignments caused by repeats. This is getting better; this entry is not present anymore in dbSNP 1.4.7!)

## Coverage by GC 

Navigate to position "chr21:19,611,925-19,631,555"  
Note that the range contains areas where coverage drops to zero in a few places.

 * use Collapsed view
 * Color alignments by "insert size"
 * load GC track (if not loaded already)
   * see concordance of coverage with GC content

![Example3](https://bioinformatics-ca.github.io/images/Igv_example3.png)

 **Question:**
 
 * Why are there blue and red reads throughout the alignments?

## Heterozygous SNPs on different alleles 

Navigate to region "chr21:19,666,833-19,667,007"
  
  * sort by base

![Example4](https://bioinformatics-ca.github.io/images/Igv_example4.png)

 **Note:**
 
 * Linkage between alleles is obvious in this case because both are spanned by the same reads

## Low mapping quality 

Navigate to region "chr21:19,800,320-19,818,162"

* use Collapsed view
* load repeat track

![Load repeats](https://github.com/bioinformaticsdotca/HT-Biology_2017/raw/master/HtSeq/img/igv_RepeatMasker_load.png)
<!---(https://bioinformatics-ca.github.io/images/Igv_load_repeats.png)-->

![Example5](https://bioinformatics-ca.github.io/images/Igv_example5.png)

 **Notes:**
 
 * Mapping quality plunges in all reads (white instead of grey).  Once we load repeat elements, we see that
   * : there are two LINE elements that cause this.

## Homozygous deletion 

Navigate to region "chr21:19,324,469-19,331,468"

 * sort reads by insert size
 * turn on "View as Pairs" and "Expanded" view
 * click on a red read pair to pull up information on alignments

![Example6](https://bioinformatics-ca.github.io/images/Igv_example6.png)

 **Notes:**
 
 * Typical insert size of read pair in the vicinity: 350bp
 * New insert size of red read pairs: 2,875bp
 * This corresponds to a homozygous deletion of 2.5kb

## Mis-alignment 

Navigate to region "chr21:19,102,154-19,103,108"
* turn on "View as Pairs" and "Expanded" view
* Group alignments by "Pair orientation"
* Color alignments by "Insert size and pair orientation"

![Example7](https://bioinformatics-ca.github.io/images/Igv_example7.png)

 **Notes:**
 
 * This is a position where AluY element causes mis-alignment.  
 * Misaligned reads have mismatches to the reference and 
 * Well-aligned reads have partners on other chromosomes where additional AluY elements are encoded.

## Translocation 

Navigate to region "chr21:19,089,694-19,095,362"

 * Expanded view
 * Group by "Pair orientation"
 * Color alignments by "Insert size and pair orientation"

![Example8](https://bioinformatics-ca.github.io/images/Igv_example8.png)

 **Notes:**
 
  * many reads with mismatches to reference
  * read pairs in RL pattern (instead of LR pattern)
  * region is flanked by reads with poor mapping quality (white instead of grey)
  * presence of reads with pairs on other chromosomes (coloured reads at the bottom when scrolling down)

## Optional- Visualization Part 3: Automating Tasks in IGV

We can use the Tools menu to invoke running a batch script. Using a batch script, you can automatically load your data, go to a particular location, set some display options and take a snapshot. This can be useful when you want to inspect many variant calls.

Batch scripts are described on the IGV website:
[batch file requirements](http://software.broadinstitute.org/software/igv/batch)
commands recognized in a [batch script](https://www.broadinstitute.org/software/igv/PortCommands)

We also need to provide sample attribute file as described [here](http://software.broadinstitute.org/software/igv/?q=SampleInformation)

Download the batch script and the attribute file for our dataset:
* batch script: Run_batch_IGV_snapshots_example.txt [here](https://raw.githubusercontent.com/bioinformaticsdotca/HT-Biology_2017/master/HtSeq/Run_batch_IGV_snapshots_example.txt)
* attribute file: igv_HCC1143_attributes.txt [here](https://raw.githubusercontent.com/bioinformaticsdotca/HT-Biology_2017/master/HtSeq/Igv_HCC1143_attributes.txt)

After downloading those two files, **please update the paths for the bam file and the output directory** (indicated as \*\*\*\* in the file) in the batch script to set your "local paths", with a text editor. 

Now run the file from the Tools menu:

Tools -> Run Batch Script

The igv screenshots are in the screenshots output directory  you set! Have a look!

**You're done!** We hope that you enjoyed the lab and that you continue to enjoy IGV.
