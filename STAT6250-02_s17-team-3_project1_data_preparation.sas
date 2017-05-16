*******************************************************************************;
**************** 80-character banner for column width reference ***************;
* (set window width to banner width to calibrate line length to 80 characters *;
*******************************************************************************;

* 
This file prepares the dataset described below for analysis.
[Dataset Name] Pay for Play: Are Baseball Salaries Based on Performance?

[Experimental Units] Baseball players who played at least one game between 
the 1991 and 1992 seasons, excluding pitchers.

[Number of Observations] 337

[Number of Features] 20

[Data Source] http://ww2.amstat.org/publications/jse/datasets/baseball.dat.txt

I followed the link for the Journal of Statistical Education Data archive and 
clicked on the baseball.dat.text. Because it is in a .txt format, I had to copy 
and paste into Excel. The data dictionary is found by clicking on the link 
baseball.txt. I created an extra column for player ID which is an integer from 
1 to 337 and an extra column for the stat slugging percentage.

[Data Dictionary] http://ww2.amstat.org/publications/jse/datasets/baseball.txt

[Unique ID] I created an extra column called Player ID to uniquely identify 
each player with a number from 1 to 337 for the primary key.
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


* check raw FRPM dataset for duplicates with respect to its composite key;
proc sort nodupkey data=Baseball_raw dupout=Baseball_raw_dups out=_null_;
    by Player_ID Player_Name;
run;


* build analytic dataset from FRPM dataset with the least number of columns and
minimal cleaning/transformation needed to address research questions in
corresponding data-analysis files;
data Baseball_Salaries_analytic_file;
    retain
        Player_ID
        Player_Name
        Salary
        Batting_Average
        OnBase_Percentage
        Slugging_Percentage
        Runs
        Hits
        Doubles
        Triples
        Home_Runs
        RBIs
		Walks
        Strike_Outs
        Stolen_Bases
        Errors
    ;
    keep
        Player_ID
        Player_Name
        Salary
        Batting_Average
        OnBase_Percentage
        Slugging_Percentage
        Runs
        Hits
        Doubles
        Triples
        Home_Runs
        RBIs
		Walks
        Strike_Outs
        Stolen_Bases
        Errors
    ;
    set Baseball_raw;
run;

* 
Use PROC SORT to extract and sort the home run numbers for each player 
from the original dataset, and output the results to a temporary 
dataset which will be used as part of data analysis by DL.
;
 
proc sort
        data=Baseball_Salaries_analytic_file
		out=Home_Runs_temp
    ;
    by
        descending Home_Runs
    ;
run;

* 
Use PROC SORT to extract and sort the batting averages for each player 
from the original dataset, and output the results to a temporary
dataset which will be used as part of data analysis by DL.
;

proc sort
        data=Baseball_Salaries_analytic_file
		out=Batting_Average_temp
    ;
    by
        descending Batting_Average
    ;
run;

* 
Use PROC SORT to extract and sort the RBI numbers for each player 
from the original dataset, and output the results to a temporary
dataset which will be used as part of data analysis by DL.
;

proc sort
        data=Baseball_Salaries_analytic_file
		out=RBIs_temp
    ;
    by
        descending RBIs
    ;
run;

*
Use PROC SORT to sort the ten highest numbers from the two
categories in the dataset
;

proc sort data=Baseball_Salaries_analytic_file;
    by descending Hits;
run;

proc sort data=Baseball_Salaries_analytic_file;
    by descending Walks;
run;

*
Use PROC SORT to rank the highest paid players, then use
PROC MEANS calculate the overall average salary among the free agents.
Finally, compare the overall average salary with the salary of the top five
highest paid players.
;

proc sort data=Baseball_Salaries_analytic_file;
    by descending Salary;
run;

*proc means data=Baseball_Salaries_analytic_file;
    *var Salary;
*run;

*
Use PROC SORT to list top 30 players under Salary and also under
Runs.  Then, note how many players make both lists.
;

proc sort data=Baseball_Salaries_analytic_file;
    by descending Runs;
run;


proc sort data=Baseball_Salaries_analytic_file;
    by descending Salary;
run;

