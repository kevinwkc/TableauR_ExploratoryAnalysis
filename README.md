# Exploratory analysis tool using Tableau and R  

This is the Github repository for my article on how to build an exploratory analysis tool with Tableau and R. The article has been compiled with knitr. You can preview the html output here:  
* English version TBD  
* [French version](http://htmlpreview.github.com/?https://github.com/simonkth/TableauR_ExploratoryAnalysis/blob/master/TableauR_ExploratoryAnalysis_FR.html)  
<br />
This repository contains:  
* the raw _.Rmd_ file containing the R code chunks, the _.md_ and _.html_ files compiled with knitr  
	+ English version TBD  
* the Rserve folder containing a _Rserve.cmd_ batch file that can be used for a quick setup of Rserve  
	+ see notes below  
* _TableauR_ExploratoryAnalysis_FR_, the french version for the Tableau workbook (english version TBD)  
* the dataset in the _data_ folder  
<br />
Notes on the _Rserve_ directory:  
* _Rserve.cmd_: double-clicking on this file will start a R session and run the code in _Rserve_run.R_  
* _Rserve_run.R_: this file contains the R script that will start Rserve  
	+ since Rserve is started using the R Rserve() function, so the path to R.dll is automatically sent to Rserve.exe  
	+ we also pass _Rserve.conf_ as an argument  
* _Rserve.conf_: this simply tells Rserve to source _Rserve_preload.R_ at startup  
* _Rserve_preload.R_: this R script will be sourced when starting Rserve  

In _Rserve_preload.R_, you can set a list of packages to load in the Rserve session. This is more efficient than loading packages in Tableau's calculated fields.  
