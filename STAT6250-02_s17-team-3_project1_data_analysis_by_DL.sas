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


* load external file that generates analytic dataset Baseball_Salaries_analytic_file;
%include '.\STAT6250-02_s17-team-3_project1_data_preparation.sas';

title1
'Average Salary for Baseball Players for the 1991-1992 Baseball Season'
;

footnote1
'This number will be used to help answer the following three research questions regarding important baseball stats and salary amount.'
;

proc means
		mean
		data=Baseball_Salaries_analytic_file
	;
	var
		Salary
	;
run;
title;
footnote;



title1
'Research Question: Who are the top 20 baseball players with the highest number of home runs?'
;

title2
'Rationale: A home run is the flashiest and most impressive thing one can do in baseball, so more of these should increase your salary.'
;

footnote1
'The average salary for this dataset is 1248.53. While there are a couple outliers, most of the salaries are above 2000 with some even reaching 4000 and 5000. The top twenty players by home run numbers definitely have larger salaries. '
;

footnote2
'This shows that if a baseball player can be skilled enough to hit many home runs, he has a great chance of increasing his salary.'
;

*
Methodology: Use PROC PRINT to print out the first twenty observations
from the sorted home runs temporary dataset created in the data prep file. 
Then compare the salaries.

Limitations: None

Possible Follow-up Steps: Use PROC MEANS to compute the home run average
for the data set and see just how far above this average the best players
are.
;

proc print 
        noobs 
        data=Home_Runs_temp(obs=20)
    ;
    id 
        Player_ID
    ;
    var 
        Player_Name Salary Home_Runs
    ;
run;
title;
footnote;





title1
'Research Question: Who are the top 20 baseball players with the highest batting average?'
;

title2
'Rationale: Batting average is generally considered the premier stat for hitters, so the batters with the highest averages should have higher salaries.'
;

footnote1
'Surprisingly, there are a good amount of players with Salaries under 1000 with high batting averages.'
;

footnote2
'However, I think that these are outliers and do not represent the best hitters since all but one of the players shown with salaries above 1000 are significantly above 1000.'
;

footnote3
'I would say that the players shown with low salaries did not get many at bats which means less chances to lower their averages. Further analysis, such as removing players below a certain total base number might be necessary.'
;

footnote4
'Overall, I think there is a correlation between batting average and salary, but it is not as strong as the relationship with home runs'
;

*
Methodolody: Use PROC PRINT to print out the first twenty observations
from the batting average temporary dataset created in the data prep
file. Then compare the salaries.

Limitations: None

Possible Follow-up Steps: Possibly find a correlation between batting average
and slugging percentage by comparing the top twenty players for each
category using PROC SORT.
;

proc print 
        noobs 
        data=Batting_Average_temp(obs=20)
    ;
    id 
        Player_ID
    ;
    var 
        Player_Name Salary Batting_Average
    ;
run;
title;
footnote;




title1
'Research Question: Who are the top 20 baseball players with the most RBIs?'
;

title2
'Rationale: RBIs are how you score in baseball, so the players with more of these should have high salaries.'
;

footnote1
'Sorting by this statistic shows a better correlation than between salary and batting average.'
;

footnote2
'Very few players among the top 20 players by RBI numbers have salaries below 2000. On the contrary, a lot of them have salaries above 4000 and even one reaching 6000.'
;

footnote3
'Home Runs and RBI numbers have a better correlation to higher salaries than batting average.'
;

*
Methodology: Use PROC PRINT to print out the first twenty observations
from the RBI temporary dataset created in the data prep file. 
Then compare the salaries.

Limitations: None

Possible Follow-up Steps: Compare the top twenty players by home runs to the top 
twenty players by RBIs to see if there is a correlation between home runs 
and RBIs.
;

proc print 
        noobs 
        data=RBIs_temp(obs=20)
    ;
    id 
        Player_ID
    ;
    var 
        Player_Name Salary RBIs
    ;
run;
title;
footnote;
