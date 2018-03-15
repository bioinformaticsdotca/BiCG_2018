---
layout: tutorial_page
permalink: /day4_integrative_assignment
title: BiCG
header1: Bioinformatics for Cancer Genomics 2018
header2: Day 4 - Integrative Assignment
image: /site_images/CBW_cancerDNA_icon-16.jpg
home: https://bioinformaticsdotca.github.io//bicg_2018
---

# Day 4 - Integrative Assignment


# Continuing with SNV calls


Make directory to work in


Move there

```
mkdir ~/workspace/IA_thursday
cd ~/workspace/IA_thursday
```

### ANNOVAR Annotations


What does ANNOVAR do?


This is what we ran:
```
$ANNOVAR_DIR/table_annovar.pl results/mutect/mutect_passed.vcf $ANNOVAR_DIR/humandb/ -buildver hg19 -out results/annotated/mutect -remove -protocol refGene,cytoBand,genomicSuperDups,1000g2015aug_all,avsnp147,dbnsfp30a -operation g,r,r,f,f,f -nastring . --vcfinput
```
Note that we would need to redefine our environmental variable $ANNOVAR_DIR for this command to work.


Make environmental variables to refer to out input and output files:
```
SNV_MODULE_DIR="/home/ubuntu/workspace/Module7_snv"
in_file=$SNV_MODULE_DIR/results/mutect/mutect_passed.vcf
out_file=$SNV_MODULE_DIR/results/annotated/mutect.hg19_multianno.vcf
```


What is the difference between these headers?
```
grep "INFO=" $in_file
grep "INFO=" $out_file
```

To see the lines corresponding to (most of) our selected annotations
```
grep "INFO=" $out_file | grep -E "refGene|cytoBand|genomicSuperDups|1000g2015aug_all|avsnp147|dbnsfp30a"
```

Note that:


"annotation provided by ANNOVAR" is not a terribly helpful descriptor


The ANNOVAR user-guide provides more info
```
http://annovar.openbioinformatics.org/en/latest/user-guide/download/
http://annovar.openbioinformatics.org/en/latest/user-guide/filter/
```

Certain annotations provide a single piece of information:


cytoBand = Position along chromosome based on Giemsa-stained chromosomes


While others provide a pile of information:


dbnsfp30a = "SIFT, PolyPhen2 HDIV, PolyPhen2 HVAR, LRT, MutationTaster, MutationAssessor, FATHMM, MetaSVM, MetaLR, VEST, CADD, GERP++, DANN, fitCons, PhyloP and SiPhy scores, but ONLY on coding variants"


[SIFT](http://sift.jcvi.org/) predicts whether an amino acid substitution affects protein function. 


[PolyPhen-2](http://genetics.bwh.harvard.edu/pph2/)  (Polymorphism Phenotyping v2) is a tool which predicts possible impact of an amino acid substitution on the structure and function of a human protein using straightforward physical and comparative considerations.


[SiPhy](http://portals.broadinstitute.org/genome_bio/siphy/index.html) implements rigorous statistical tests to detect bases under selection from a multiple alignment data. 


DO NOT run the following step today...

but in the future, you can download new annotations for use within annovar using:
```
annotate_variation.pl -buildver hg19 -downdb -webfrom annovar <Table Name>
```
We are skipping this today as the downloads can be very large and slow.


### Analysing SNV output


We already looked at .bam files to verify SNP calls from reads.


Can we visualize our specific SNPs in the context of other known SNPs?


Use these commands to view very reduced summaries of our generated data.
```
cat $SNV_MODULE_DIR/results/annotated/mutect.hg19_multianno.txt | cut -f1-3,7,9
cat $SNV_MODULE_DIR/results/annotated/strelka.hg19_multianno.csv | cut -d , -f1-3,7,9
```

How closely do the two SNV callers agree? What might explain the differences?


Looking at the annotated exonic functions, which SNV(s) might be expected to have functional consequences for the protein?


### Interactive exploration of SNVs
To further investigate this, use a web browser to navigate to St. Jude ProteinPaint
```
https://proteinpaint.stjude.org/
```

Enter SOX15 for the gene name of interest.


Turn on the "COSMIC" track.


"The Catalogue Of Somatic Mutations In Cancer, is the world's largest and most comprehensive resource for exploring the impact of somatic mutations in human cancer."


Hide "silent" at bottom.


Zoom in by dragging alone top edge "protein length"
Aim near Orange 2 Nonsense at right.
Adjust zoom with In / Out near top

Hover along bottom legend, just beneath the orange line. 
What is the genomic location? How does that compare with our SNP calls?
Hover beneath the Orange 2 to make a 3 appear. Click 3.
Look at the shaded circle that appears. Which cancer types exhibit this mutation?

Within the shaded circle, click "List".
Scroll right to see the full details. 
Are any of the tumor samples familiar?


Explore TP53 on your own.
Can you find our SNV call?
Does it appear to be more or less common than the mutation in SOX15?
Is it particularly associated with breast cancer?







# If we have time
# For additional commandline practice
# Try an additional subset of the data, following the Module7 lab from yesterday

# Subset the reads
# b = output bam
# h = include header

# These regions for verified CNVs
samtools view -bh \
/home/ubuntu/CourseData/CG_data/sample_data/2017_datasets/Module5/HCC1395/HCC1395_exome_normal.ordered.bam \
12:48000000-50000000 \
-o /home/ubuntu/CourseData/CG_data/sample_data/HCC1395_subset/HCC1395_exome_normal.12.48MB-50MB.bam

samtools view -bh \
/home/ubuntu/CourseData/CG_data/sample_data/2017_datasets/Module5/HCC1395/HCC1395_exome_tumour.ordered.bam \
12:48000000-50000000 \
-o /home/ubuntu/CourseData/CG_data/sample_data/HCC1395_subset/HCC1395_exome_tumour.12.48MB-50MB.bam