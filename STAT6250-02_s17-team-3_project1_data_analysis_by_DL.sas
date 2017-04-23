*******************************************************************************;
**************** 80-character banner for column width reference ***************;
* (set window width to banner width to calibrate line length to 80 characters *;
*******************************************************************************;

*
This file uses the following analytic dataset to address several research
questions regarding
Dataset Name: Baseball_Salaries_analytic_file created in external file
STAT6250-02_s17-team-3_project1_data_preparation.sas, which is assumed to be
in the same directory as this file
See included file for dataset properties
;

* environmental setup;

* set relative file import path to current directory (using standard SAS trick;
X "cd ""%substr(%sysget(SAS_EXECFILEPATH),1,%eval(%length(%sysget(SAS_EXECFILEPATH))-%length(%sysget(SAS_EXECFILENAME))))""";


* load external file that generates analytic dataset FRPM1516_analytic_file;
%include '.\STAT6250-02_s17-team-3_project1_data_preparation.sas';


*
Research Question: Who are the top 20 baseball players with the highest number
of home runs?

Rationale: A home run is the flashiest and most impressive thing one can do 
in baseball, so more of these should increase your salary.

Methodology: Use PROC SORT to extract and sort the home run numbers from
the dataset and use PROC PRINT to print out the first twenty observations
from the temporary dataset. Then compare the salaries.

Limitations: None

Possible Follow-up Steps: Use PROC MEANS to compute the home run average
for the data set and see just how far above this average the best players
are.
;
proc sort data=Baseball_Salaries_analytic_file_temp;
    by descending Home Runs;
run;

proc print noobs data=Baseball_Salaries_analytic_file_temp(obs=20);
    id Player ID;
    var Home Runs;
run;

*
Research Question: Who are the top 20 baseball players with the highest
batting average?

Rationale: Batting average is generally considered the premier stat for hitters, 
so the batters with the highest averages should have higher salaries.

Methodolody: Use PROC SORT to extract and sort the batting average numbers from
the dataset and use PROC PRINT to print out the first twenty observations
from the temporary dataset. Then compare the salaries.

Limitations: None

Possible Follow-up Steps: Possibly find a correlation between batting average
and slugging percentage by comparing the top twenty players for each
category using PROC SORT.
;
proc sort data=Baseball_Salaries_analytic_file_temp;
    by descending Batting Average;
run;

proc print noobs data=Baseball_Salaries_analytic_file_temp(obs=20);
    id Player ID;
    var Batting Average;
run;

*
Research Question: Who are the top 20 baseball players with the most RBIs?

Rationale: RBIs are how you score in baseball, so the players with more
of these should have high salaries. 

Methodology: Use PROC SORT to extract and sort the RBI numbers from
the dataset and use PROC PRINT to print out the first twenty observations
from the temporary dataset. Then compare the salaries.

Limitations: None

Follow-up Steps: Compare the top twenty players by home runs to the top twenty
players by RBIs to see if there is a correlation between home runs and RBIs.
;
proc sort data=Baseball_Salaries_analytic_file_temp;
    by descending RBIs;
run;

proc print noobs data=Baseball_Salaries_analytic_file_temp(obs=20);
    id Player ID;
    var RBIs;
run;
