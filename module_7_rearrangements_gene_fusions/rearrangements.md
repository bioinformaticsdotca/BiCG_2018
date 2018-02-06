---
layout: tutorial_page
permalink: /BiCG_2017_module4_rearrangements
title: Bioinformatics for Cancer Genomics 2017 Genome Rearrangement Tutorial
header1: Bioinformatics for Cancer Genomics 2017
header2: Genome Rearrangement Tutorial
image: /site_images/CBW_cancerDNA_icon-16.jpg
home: https://bioinformaticsdotca.github.io/bicg_2017
---

# General Setup

## Environment setup

All binaries used in this tutorial will be installed using [`conda`](https://www.continuum.io/downloads).  Modify the `PATH` environment variable to point to binaries in the anaconda installation.

~~~
export PATH=/home/ubuntu/CourseData/CG_data/Module7/anaconda/bin:$PATH
~~~

We will be using some internal lumpy scripts, located here:

```
LUMPYSCRIPTS=/home/ubuntu/CourseData/CG_data/Module7/anaconda/share/lumpy-sv-0.2.13-0/scripts/
```

## Create tutorial directory structure on the instance

Create a directory in the temporary workspace and change to that directory.

~~~ bash
mkdir /mnt/workspace/Module7/
cd /mnt/workspace/Module7/
~~~

Sample data has been prepared for you, link to your workspace.

~~~ bash
ln -s /media/cbwdata/CG_data/Module7/sampledata
~~~

# Predicting breakpoints using Lumpy

In this tutorial we will use [lumpy-sv](https://github.com/arq5x/lumpy-sv) to perform a breakpoint analysis
of the HCC1395 breast cancer cell line.

## Sample data

We will be working with a publically available HCC1395 breast cancer cell line
sequenced for teaching and benchmarking purposes.  The dataset is available 
from washington university servers, and can be accessed via the github page for the
[Genome Modeling System](https://github.com/genome/gms/wiki/HCC1395-WGS-Exome-RNA-Seq-Data).

> Special thanks to Malachi Griffith for providing access to the data.

We have created a small example dataset with reads mainly from `chr1:167000000-178000000`.  The alignment was done using `bwa mem` as required by lumpy.

The normal bam file is here:

`/home/ubuntu/CourseData/CG_data/Module7/sampledata/HCC1395/wgs/HCC1395BL_chr1_167000000_178000000.bam`

And the tumour bam file is here:

`/home/ubuntu/CourseData/CG_data/Module7/sampledata/HCC1395/wgs/HCC1395_chr1_167000000_178000000.bam`

## Viewing Bams in IGV

To view any of the following BAM alignment files in IGV, you must first ensure the BAMs are indexed using `samtools index`.  Optionally, you may use `igvtools count` to generate a TDF file that will show coverage in IGV.

You can then view the bam in IGV by selecting `Open From URL...` and providing an URL of the BAM file on your instance.  For instance, to view the normal reads in IGV, use the following URL, replacing `#` with your instance number:

`http://cbw#.dyndns.info/Module7/sampledata/HCC1395/wgs/HCC1395BL_chr1_167000000_178000000.bam`

## Preparing Input

We prepare the input for lumpy by making BAM files that only contain discordant read pairs and split reads.  Usually this process is handled by the `lumpyexpress` wrapper script, however we will reproduce the preprocessing steps to understand what is happening.

First, we will make a BAM containing discordant pairs. Remember, discordant read pairs are those that do not map in the expected orientation or are too close/too far apart.

> Note: We break the following commands into multiple lines using the `\` symbol. 

```
samtools view -b -F 1294 \
  sampledata/HCC1395/wgs/HCC1395_chr1_167000000_178000000.bam \
  > HCC1395.discordants.bam
```

Next, make a BAM containing split reads. Split reads are those for which the breakpoint interrupts the read sequence, and can be used for predicting nucleotide level breakpoint sequences.

```
samtools view -h sampledata/HCC1395/wgs/HCC1395_chr1_167000000_178000000.bam \
  | $LUMPYSCRIPTS/extractSplitReads_BwaMem -i stdin \
  | samtools view -Sb - > HCC1395.splitters.bam
```

Lumpy will require the read length, use `samtools` to check the read length.

> Hint: use the `stats` subcommand and check the `SN` output.

Determine the distribution of paired-end fragment sizes.  This tells lumpy how far apart paired-end reads should be in order to determine where breakpoints are in relation to discordant reads.

The following command will print the mean and standard deviation of the fragment distribution to the screen.  You will have to replace the read length value.

```
samtools view \
  sampledata/HCC1395/wgs/HCC1395_chr1_167000000_178000000.bam \
  | tail -n+100000 \
  | $LUMPYSCRIPTS/pairend_distro.py \
  -r 0 \
  -X 4 \
  -N 10000 \
  -o HCC1395.histogram
```

## Running Lumpy

Now we are ready to run lumpy.  You should still be able to copy-and-paste it into your terminal. We are passing the discordant read BAM file in with the `-pe` flag, and the split read BAM file in with the `-sr` flag.

You will need to insert the correct mean and stddev from the previous step.

```
lumpy \
    -mw 4 \
    -tt 0 \
    -pe id:HCC1395,bam_file:HCC1395.discordants.bam,histo_file:HCC1395.histogram,mean:0,stdev:0,read_length:0,min_non_overlap:101,discordant_z:5,back_distance:10,weight:1,min_mapping_threshold:20 \
    -sr id:tumour,bam_file:HCC1395.splitters.bam,back_distance:10,weight:1,min_mapping_threshold:20 \
    > HCC1395.vcf
```

The output is in [VCF format](https://samtools.github.io/hts-specs/VCFv4.2.pdf)

```
cat HCC1395.vcf
```

Lumpy found about 61 rearrangement events in the small sample of reads that we are using for the tutorial. The VCF file includes useful information about the variant calls.  The SVTYPE attribute tells us the rearrangement type.  Many of the events are deletions (SVTYPE=DEL).  The PE and SR tags in each line tell us how many paired-end and split-reads support each call.  The calls with many
 supporting reads are usually more likely to be true breakpoints.

## Running Lumpy with a Matched Normal

To filter for somatic breakpoints, you need to identify which breakpoints are germline by running lumpy on the normal sample.  One possibility would be to run lumpy independently on the normal.  A more optimal method would be to run lumpy on both the normal and tumour samples simultaneously.

> Discussion: why is it better to run lumpy simultaneously on the tumour and normal samples?

The normal sample is located at `sampledata/HCC1395/wgs/HCC1395_chr1_167000000_178000000.bam`.

Repeat the following steps on the normal sample:
1. extract discordant reads
2. extract split reads
3. calculate read length and fragment length stats

Run `lumpy` on the normal and tumour samples.  Instructions for doing so can be found on the [lumpy-sv github page](https://github.com/arq5x/lumpy-sv).

## Analysis of Lumpy Results

Open IGV and use `Open URL ...` to open both the tumour and normal bam files.

Navigate to `chr1:166,154,838-178,661,877`.  The coverage information will give an approximate idea for the copy number in this region.  There should be one event between 176 and 178MB that is particularly obvious and is unique to the tumour.

Questions:
- What kind of breakpoint could generate such an event?
- Find the corresponding event in the lumpy output?
- How many reads in normal and tumour support this event?

Navigate to `chr1:174,748,434-174,851,012`.  An event should be apparent from the coverage information.

Questions:
- What kind of breakpoint could generate this event?
- Find the corresponding event in the lumpy output?
- Is the event germline or somatic?

Navigate to `chr1:169,123,398-169,133,590`.  There is a clear somatic copy number change caused by a complex rearrangement.

Questions:
- Find all lumpy breakpoints associated with this event.
- Can you trace out the tumour chromosome?

