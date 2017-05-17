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

* setup environmental parameters;
%let inputDatasetURL =
https://github.com/stat6250/team-3_project1/blob/master/Baseball_Salaries.xlsx?raw=true
;


* load raw FRPM dataset over the wire;
filename tempfile "%sysfunc(getoption(work))/tempfile.xlsx";
proc http
    method="get"
    url="&inputDatasetURL."
    out=tempfile
    ;
run;
proc import
    file=tempfile
    out=baseball_raw
    dbms=xlsx;
run;
filename tempfile clear;

title1
'Research Question: How do the players with the most hits compare in salary to those with the most walks?'
;

title2
'Rationale: Typically, hits are considered to be of greater value to baseall teams than walks.  However, due to the moneyball argument (a walk is as good as a hit) it would be interesting to see the salary comparison between the two stat categories.'
;

footnote1
'The top ten hit leaders made about $400,000 more than the top ten walk leaders.'
;

footnote2
'Although not by a large margin, the players with the most hits make more money than those who walk the most on average.'
;
*
Methodology: Use PROC PRINT to display the top ten in each.
Then compare the salaries for both categories.

Limitations: This methodology would not necessarily be able to analyze the data
by simply sorting it, so additional tests would need to be made.

Possible Follow-up Steps:  Perhaps using PROC MEANS to compute the average
salary among the top ten in the hits and walks categories.
;
proc sort data=Baseball_Salaries_analytic_file;
    by descending Hits;
run;

proc print noobs data=Baseball_Salaries_analytic_file(obs=10);
    id Player_ID;
    var Hits Salary;
run;
title;
footnote;

proc sort data=Baseball_Salaries_analytic_file;
    by descending Walks;
run;

proc print noobs data=Baseball_Salaries_analytic_file(obs=10);
    id Player_ID;
    var Walks Salary;
run;
title;
footnote;

title1
'Research Question: How does the salary for the top five free agents compare to the overall average salary?'
;

title2
'Rationale:  The highest paid players make more money than the average by a lot, so comparing the top salaries to the average would indicate how much more.'
;

footnote1
'The mean of the top five free agents by salary make an average of $5,210,000 while the overall average salary of the free agents is shown as $1,248,000.'
;

footnote2
'This shows that the top five free agents make over four times as much money as the average free agent.'
;
*
Methodology: 

Limitations: Using PROC MEANS for the top five free agents would be needed to
properly answer this question.

Possible Follow-up Steps: Comparing the overall stats of the highest paid
players to the average overall stats by PROC MEANS.
;
proc sort data=Baseball_Salaries_analytic_file;
    by descending Salary;
run;

proc means data=Baseball_Salaries_analytic_file;
    var Salary;
run;
title;
footnote;

title1
'Research Question: How many of the top 30 highest paid players are among the 30 players with the most runs scored?'
;

title2
'Rationale: Though home runs and RBIs are considered the most important baseball stats for a hitter to have, runs scored can be just as important for manyreasons (i.e. getting on base, base running).  It will be interesting to test how much a team values runs scored in its salary.'
;

footnote1
'11 of the top 30 highest paid free agents are on the top 30 hits leaders.'
;

footnote2
'This indicates roughly a third of the top hits leaders are paid among the highest.'
;
*
Methodology: Use PROC PRINT to display the top 30 in both categories.  Then, make
comparisons and draw conclusions.

Limitations: Only the top 30 players of each category are selected for data.
Therefore, there is missing data.

Possible Follow-up Steps:  Use PROC SORT to compare the highest salary players
with runs scored against top salary players with home runs/RBIs.
;

proc print noobs data=Baseball_Salaries_analytic_file(obs=30);
    id Player_ID;
    var Runs;
run;
title;
footnote;

proc print noobs data=Baseball_Salaries_analytic_file(obs=30);
    id Player_ID;
    var Salary;
run;
title;
footnote;
