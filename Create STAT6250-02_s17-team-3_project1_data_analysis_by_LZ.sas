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
title1
'Research Question: Do less errors correspond to a higher salary? '
;

title2
'Rationale: The number of errors was a statistic used to quantify the skill of a fielder, so will the less number of errors increase the salary?'
;

footnote1
'Most High salary players having an average number of errors.'
;

footnote2
'Most players who makes o error having a below-average salary.'
;

Methodology: Use PROC PRINT to print first 50 observations then compare with errors. 

Limitations: None

Possible Follow-up Steps: Perhaps can use PROC MEANS to get the average number of errors. Then use PROC SORT by descending to find the players with highest salary.

proc print 
        noobs 
        data= data=Baseball_Salaries_analytic_file_temp(obs=50)
;
    id 
        Player_ID
    ;
    var 
        Salary
    ;
run;
title;
footnote;


*
title1
'Research Question: Do higher number of stolen bases correspond to a higher salary? '
;

title2
'Rationale: Successful base stealers are not only fast but have good base running instincts and timing, so will this performance increase the salary?'
;

footnote1
'Most players who have higher salaries does not have higher number of stolen bases.'
;

footnote2
'Seems that stolen bases is not a significant element in determining salaries. '
;

Methodology: Use PROC PRINT to print first 30 obeservations then compare with salaries.  

Limitations: None

Possible Follow-up Steps: Perhaps can use PROC MEANS to get the average number of salary, then use PROC SORT by descending to find the players with most stolen bases.

proc print 
        noobs 
        data= data=Baseball_Salaries_analytic_file_temp(obs=30)
    ;
    id 
        Player_ID
    ;
    var 
        Stolen Bases
    ;
run;
title;
footnote;


*
title1
'Research Question: Do higher On-base Percentage (OBP) correspond to a higher salary?'
;

title2
'Rationale: OBP is a measure of how often a batter reaches base. OBP above.400 is excellent, so will excellent OPB increase the salary? '
;

footnote1
'Top 5 players who have highest OBP having a below-average salary.'
;

footnote2
'Approximately half of the excellent OBP players have high salaries.'
;

footnote3
'Seems that higher OBP is not in the correspondence with the higher salary.'
;

Methodology: Use PROC PRINT to print first 30 observations then compare with salaries.

Limitations: None

Possible Follow-up Steps: Perhaps can use PROC MEANS to get the average number of salary, then use PROC SORT by descending to find the players with highest OPB.

proc print 
        noobs 
        data= data=Baseball_Salaries_analytic_file_temp(obs=30)
    ;
    id 
        Player_ID
    ;
    var 
        On-Base Percentage
    ;
run;
title;
footnote;

