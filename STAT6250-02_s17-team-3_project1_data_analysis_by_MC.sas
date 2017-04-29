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
Research Question: How do the players with the most hits compare in salary to those with the most walks?

Rationale: Typically, hits are considered to be of greater value to baseall teams than walks.  However, due to the moneyball argument (a walk is as good as a hit) it would be interesting to see the salary comparison between the two stat categories.

Methodology: Use PROC SORT to sort the ten highest numbers from the two categories in the dataset and then PROC PRINT to display the top ten in each.  Then compare the salaries for both categories.

Limitations: This methodology wouldn't necessarily be able to analyze the data by simply sorting it, so additional tests would need to be made.

Possible Follow-up Steps:  Perhaps using PROC MEANS to compute the averqage salary among the top ten in the hits and walks categories.
;
proc sort data=Baseball_Salaries_analytic_file_temp;
    by descending Hits;
run;

proc print noobs data=Baseball_Salaries_analytic_file_temp(obs=10);
    id Player ID;
    var Hits;
run;

proc sort data=Baseball_Salaries_analytic_file_temp;
    by descending Walks;
run;

proc print noobs data=Baseball_Salaries_analytic_file_temp(obs=10);
    id Player ID;
    var Walks;
run;

*
Research Question: How does the salary for the top five free agents compare to the overall average salary?

Rationale:  The highest paid players make more money than the average by a lot, so comparing the top salaries to the average would indicate how much more.

Methodology: Use PROC SORT to rank the highest paid players, then use PROC MEANS calculate the overall average salary among the free agents.  Finally, compare the overall average salary with the salary of the top five highest paid players.

Limitations: Using PROC MEANS for the top five free agents would be needed to properly answer this question.

Possible Follow-up Steps:  Comparing the overall stats of the highest paid players to the average overall stats by PROC MEANS.
;
proc sort data=Baseball_Salaries_analytic_file_temp;
    by descending Salary;
run;

proc means data=Baseball_Salaries_analytic_file_temp;
    var Salary;
run;

*
Research Question: How many of the top 30 highest paid players are among the 30 players with the most runs scored?

Rationale: Though home runs and RBIs are considered the most important baseball stats for a hitter to have, runs scored can be just as important for many reasons (i.e. getting on base, base running).  It will be interesting to test how much a team values runs scored in its salary.

Methodology: Use PROC SORT to list top 30 players under Salary and also under Runs.  Then, note how many players make both lists.

Limitations: Only the top 30 players of each category are selected for data.  Therefore, there is missing data.

Possible Follow-up Steps:  Use PROC SORT to compare the highest salary players with runs scored against top salary players with home runs/RBIs.
;
proc sort data=Baseball_Salaries_analytic_file_temp;
    by descending Runs;
run;

proc print noobs data=Baseball_Salaries_analytic_file_temp(obs=30);
    id Player ID;
    var Runs;
run;

proc sort data=Baseball_Salaries_analytic_file_temp;
    by descending Salary;
run;

proc print noobs data=Baseball_Salaries_analytic_file_temp(obs=30);
    id Player ID;
    var Salary;
run;
