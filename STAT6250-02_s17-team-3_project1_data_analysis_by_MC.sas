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

Research Question: How do the players career stat numbers compare with their most recent season?

Rationale: MLB players contracts are sometimes based off what the player did in their career as opposed to one season, so it is important to see how much longevity factors in the salaries.

Methodology: 

Limitations: 

Possible Follow-up Steps:



*

Research Question: What are the three baseball stats that factor into the highest paid players?

Rationale: This would determine what stats that teams look for when they pay the most money to their best players.

Methodology: 

Limitations: 

Possible Follow-up Steps:



*

Research Question: How do the players playoff stats for that season, if eligible, affect their salary?

Rationale: Players contracts can often depend on how they perform in the playoffs regardless of what they did throughout the season, so it would be interesting to see the playoffs afect their salary. 

Methodology: 

Limitations: 

Possible Follow-up Steps:
