---
layout: tutorial_page
permalink: /BiCG_2017_prework
title: BiCG PreWork
header1: Workshop Pages for Students
header2: Bioinformatics for Cancer Genomics 2017 Pre-Work
image: /site_images/CBW_cancerDNA_icon-16.jpg
home: https://bioinformaticsdotca.github.io/bicg_2017
---

# Install These Tools Before the Workshop:

1) A robust text editor.   

* For Windows/PC - [notepad++](http://notepad-plus-plus.org/)  
* For Linux - [gEdit](http://projects.gnome.org/gedit/)  
* For Mac – [TextWrangler](http://www.barebones.com/products/textwrangler/download.html)

2) A file decompression tool.  

* For Windows/PC – [7zip](http://www.7-zip.org/).  
* For Linux – [gzip](http://www.gzip.org).   
* For Mac – already there.

3) A robust internet browser such as Firefox or Safari (Internet Explorer and Chrome are not recommended because of Java issues).

4) Java -The visualization program that we will be using (IGV) requires Java. Check if you have Java installed: https://www.java.com/verify/ and download Java if you do not have it installed (Java 8).  

5) Integrative Genomics Viewer 2.3 (IGV) - Once java is installed, go to http://www.broadinstitute.org/igv/ and register in order to get access to the downloads page. Once you have gained access to the download page, click on the appropriate launch button that matches the amount of memory available on your laptop (if you have space, 1.2GB is good, more is better).   

**Note** Chrome does not launch "java webstart" files by default. Instead, the launch buttons below will download a "jnlp" file. This should appear in the lower left corner of the browser. Double-click the downloaded file to run.   

**Windows users:** To run with more than 1.2 GB you must install 64-bit Java. This is often not installed by default even with the latest Windows 7 machines with many GB of memory. In general trying to launch with more memory than your OS/Java combination supports will result in the obscure error "could not create virtual machine".  

6) SSH client - Mac and Linux users already have a command line ssh program that can be run from the terminal. For Windows users, please download [PuTTY](http://www.chiark.greenend.org.uk/~sgtatham/putty/download.html).  

7) SCP/SFTP client - We will be moving data from the servers to the student laptops for visualization. Mac and Linux users already have a command line scp and sftp program. For Windows users, please install [WinSCP](http://winscp.net/eng/download.php).  

8) A PDF viewer (Adobe Acrobat or equivalent).  

9) Install Cytoscape 3.5.1: http://www.cytoscape.org  

10) Within the Cytoscape program, install the following Cytoscape plugins:

From the menu bar, Apps > Manage Apps  

Within all apps, Search for the following and install:    
• jActiveModules (should already be installed. Install if not)  
• GeneMania (should already be installed. Install if not).  
• EnrichmentMap  
• BiNGO  
• Reactome FI Plugin  

Select GeneMania from Apps Manager → Choose Another Data Set.  
From the list of available data sets, select the most recent and under Include only these networks:  

select All → Download.  

An Install Window will pop-up. Select H.Sapiens Human (2384 MB) → Install  

This requires time and a good network connection to download completely, so be patient.  

11) A PDF viewer (Adobe Acrobat or equivalent).

12) Sign up for a GenePattern account at [Broad](http://www.broadinstitute.org/cancer/software/genepattern/). When you go to this homepage, there is under the "Getting Started" section an icon for "Run analyses on the Broad public server". Click here and sign up for an account so that in class we can use the tool on the web.


# Do These Tutorials Before the Workshop:

1) **R Preparation tutorials**: You are expected to have completed the following tutorials in **R** beforehand. The tutorial should be very accessible even if you have never used **R** before.

* The [CBW R tutorial](http://bioinformatics-ca.github.io/CBW_R_Tutorial/) or [R Tutorial](http://www.cyclismo.org/tutorial/R/) 
* The [R command cheat sheet](https://github.com/bioinformaticsdotca/bioinformaticsdotca.github.io/blob/master/resources/R_Short-refcard.pdf)
* [R Plotting Reference](https://github.com/bioinformatics-ca/bioinformatics-ca.github.io/blob/master/resources/Plotting.Reference.ipynb)

2) **Cytoscape 3.x Preparation tutorials**: Complete the [introductory tutorial to Cytoscape 3.x](http://opentutorials.cgl.ucsf.edu/index.php/Portal:Cytoscape3): 

* Introduction to Cytoscape3 - User Interface
* Introduction to Cytoscape3 - Welcome Screen
* Introduction to Cytoscape 3.1 - Networks, Data, Styles, Layouts and App Manager

3) **UNIX Preparation tutorials**:  

* [UNIX Bootcamp](http://rik.smith-unna.com/command_line_bootcamp/?id=9xnbkx6eaof)

* [Unix Cheat sheet](http://www.rain.org/~mkummel/unix.html) 

4) [Sequencing Terminology](http://www.ncbi.nlm.nih.gov/projects/genome/glossary.shtml)

# Read These Before the Workshop:
  
[Database resources of the National Center for Biotechnology Information](http://www.ncbi.nlm.nih.gov/pubmed/26615191)

[COSMIC: mining complete cancer genomes in the Catalogue of Somatic Mutations in Cancer](http://www.ncbi.nlm.nih.gov/pubmed/20952405/)

[Integrative genomic profiling of human prostate cancer](http://www.ncbi.nlm.nih.gov/pubmed/20579941)

[Predicting the functional impact of protein mutations: application to cancer genomics](http://www.ncbi.nlm.nih.gov/pubmed/21727090)

[Cancer genome sequencing study design](http://www.ncbi.nlm.nih.gov/pubmed/23594910)

[Using cloud computing infrastructure with CloudBioLinux, CloudMan, and Galaxy](http://www.ncbi.nlm.nih.gov/pubmed/22700313)

[The UCSC Genome Browser database: extensions and updates 2013](http://www.ncbi.nlm.nih.gov/pubmed/23155063)

[Integrative Genomics Viewer (IGV): high-performance genomics data visualization and exploration](http://www.ncbi.nlm.nih.gov/pubmed/22517427)

[Feature-based classifiers for somatic mutation detection in tumour–normal paired sequencing data](http://www.ncbi.nlm.nih.gov/pubmed/22084253)

[Expression Data Analysis with Reactome](http://www.ncbi.nlm.nih.gov/pubmed/25754994)
