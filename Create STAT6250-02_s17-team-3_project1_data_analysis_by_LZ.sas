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
Research Question: Do less errors correspond to a higher salary? 
Rationale: The number of errors was a statistic used to quantify the skill of a fielder, so will the less number of errors increase the salary?
Methodology: 
Limitations: 
Possible Follow-up Steps:

*
Research Question: Do higher number of stolen bases correspond to a higher salary? 
Rationale: Successful base stealers are not only fast but have good base running instincts and timing, so will this performance increase the salary?
Methodology: 
Limitations: 
Possible Follow-up Steps:

*
Research Question: Do higher On-base Percentage (OBP) correspond to a higher salary?
Rationale: OBP is a measure of how often a batter reaches base. OBP above.400 is excellent, so will excellent OPB increase the salary? 
Methodology: 
Limitations: 
Possible Follow-up Steps:

