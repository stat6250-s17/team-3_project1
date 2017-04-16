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
Research Question: Do more home runs correspond to a higher salary?
Rationale: A Home Run is the flashiest and most impressive thing one can do in baseball, so will more of these increase your salary?
Methodology: 
Limitations: 
Possible Follow-up Steps:

*
Research Question: Does a higher batting average correspond to a higher salary?
Rationale: Batting average is generally considered the premier stat for hitters; the best hitters have the highest batting averages.
Methodolody: Compute five-number summaries by charter-school indicator variable
Limitations: 
Possible Follow-up Steps: 

*
Research Question: Which stat is more important when considering RBIs, Hits or Home Runs?
Rationale: RBIs are how you score in baseball, so is it better to have more home runs, whch are less common but automatic, or more hits?
Methodology: 
Limitations: 
Follow-up Steps: 
