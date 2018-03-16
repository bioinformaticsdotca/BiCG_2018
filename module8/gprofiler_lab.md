---
layout: tutorial_page
permalink: /bicg_2018_lab_8_gprofiler
title: BiCG Module 13
header1: Bioinformatics for Cancer Genomics 2018
header2: Lab Module 13 - gProfiler
image: /site_images/CBW_cancerDNA_icon-16.jpg
home: https://bioinformaticsdotca.github.io/bicg_2018
---

# Lab Module 13 - Pathway Over-representation Analysis

By Jüri Reimand

**This work is licensed under a [Creative Commons Attribution-ShareAlike 3.0 Unported License](http://creativecommons.org/licenses/by-sa/3.0/deed.en_US). This means that you are able to copy, share and modify the work, as long as the result is distributed under the same license.**

## Let’s get a few gene lists for analysis

<img src="https://github.com/bioinformaticsdotca/HT-Biology_2017/blob/master/Pathways/module13_lab/img/13_1.png?raw=true" alt="TCGA article" width="750" />
 
Highlights:  
* Using the integrated data sets, the authors identified 127 significantly mutated genes as candidate cancer driver genes  
* Genes under positive selection, either in individual or multiple tumour types, tend to display higher mutation frequencies above background.  
* The statistical analysis identified 127 such genes  
* The mutational significance in cancer (MuSiC) package was used to identify significant genes for both individual tumour types and the Pan-Cancer sample cohort. [Dees et al. MuSiC: Identifying mutational significance in cancer genomes. Genome Res. 2012](https://www.ncbi.nlm.nih.gov/pubmed/22759861)  
* These significantly mutated genes are involved in a wide range of cellular processes, including transcription factors/regulators, histone modifiers, genome integrity, receptor tyrosine kinase signalling, cell cycle, mitogen- activated protein kinases (MAPK) signalling, phosphatidylinositol-3-OH kinase (PI(3)K) signalling, Wnt/b-catenin signalling, histones, ubiquitin- mediated proteolysis, and splicing (Fig. 2).  

Supplementary Data, Table 4  
* globally significant, frequency >= 1% for glioblastoma multiforme (GBM): 46   

[GBM gene list](https://raw.githubusercontent.com/bioinformaticsdotca/BiCG_2017/master/module8/Genelist_GBM.txt)  

## Let’s use g:Profiler to obtain enrichment results

[g:Profiler](http://biit.cs.ut.ee/gprofiler/)  

First set the parameters and filter gene sets to be analysed:

<img src="https://github.com/bioinformaticsdotca/HT-Biology_2017/blob/master/Pathways/module13_lab/img/13_2.png?raw=true" alt="Parameters" width="750" /> 

Note that input genes are ordered according to p-value so the **Ordered Query** option is appropriate.  

Then paste the GBM gene list and press **g:Profile** to start the analysis.  

Scroll down to see significantly enriched pathways and processes. Scroll right to see gene annotations of GO processes (colored) and Reactome pathways (black; scroll further down).  
            
<img src="https://github.com/bioinformaticsdotca/HT-Biology_2017/blob/master/Pathways/module13_lab/img/13_3.png?raw=true" alt="Parameters" width="750" />  

 
### Browse results:

1.	Click on numbers in the column **n. of common genes to find genes** that are part of a given process.  
2.	Click graph icon to see how processes are related to each other.  
3.	Check checkbox **No electronic GO annotations** and run query again. Now you see the enrichment analysis that uses only high-confidence gene annotations.  
4.	Uncheck checkbox **Hierarchical sorting** to reveal ranking of results by corrected p-value.   

## g:Convert - gene ID conversion:

<img src="https://github.com/bioinformaticsdotca/HT-Biology_2017/blob/master/Pathways/module13_lab/img/13_5.png?raw=true" alt="g:Convert" width="750" /> 

1.	Paste gene list into the Query box.   
2.	In the Target Database list, select the desired type of gene/protein identifiers, for example UNIPROTSWISSPROT. Click Convert IDs to continue.  

## For Enrichment Map construction:

1.	Set **Output Type** to **Generic Enrichment Map (TAB)**.   
2.	Click on **g:Profile** to run analysis again.  
3.	Right-click on **Download data in Generic Enrichment Map (GEM) format** to save the file.  
4.	Browse the downloaded file in a text editor. Note lists of genes in the leftmost column. These genes are part of the input list and responsible for the given pathway enrichment.
5.	At the bottom of **Advanced Options**, find **Download g:Profiler data as GMT** and right-click the link **name** to save the zip file with gene-set annotations.  
6.	In the zip file, you will need the file **hsapiens.pathways.NAME.gmt**.   

## Building an Enrichment Map visualization in Cytoscape

1.	From the main menu, select Apps>Enrichment Map>Create Enrichment Map. If you don’t have this app, install version 2.2.1 using Cytoscape App Manager or [Cytoscape App Store](http://apps.cytoscape.org/apps/enrichmentmap).  
2.	First click on (+) to add a new analysis. Load all the files:  
* [GMT file](https://github.com/bioinformaticsdotca/BiCG_2017/raw/master/module8/hsapiens.pathways.NAME.gmt): has gene-set definitions  
* [Enrichment of data-set](https://raw.githubusercontent.com/bioinformaticsdotca/BiCG_2017/master/module8/GBM_gprofiler_results_1048466457480.txt): has enrichment statistics for GBM gene list   

<img src="https://github.com/bioinformaticsdotca/BiCG_2017/blob/master/module8/pic1.png?raw=true" alt="Cytoscape1" width="750" />  

3.	Set analysis parameters under Advanced Options.   
a.	FDR-corrected P-values are filtered in g:Profiler and no further filtering is needed in Enrichment map.  
b.	Jaccard coefficient + overlap combined defines the stringency edges between gene sets and the granularity of the map. Use this parameter to create denser or sparser networks. The value 0.66 provides relatively stringent similarity cutoffs and leads to sparser maps. 

<img src="https://github.com/bioinformaticsdotca/BiCG_2017/blob/master/module8/pic2.png?raw=true" alt="Cytoscape2" width="750" />

4.	Click ‘Build’. An enrichment map will be generated. 
5.	The resulting map  shows groups of enriched pathways. Pathways are connected by edges if they share a large fraction of related genes. That fraction is determined in point 3b above.   


<img src="https://github.com/bioinformaticsdotca/BiCG_2017/blob/master/module8/pic3.png?raw=true" alt="Cytoscape3" width="750" />
