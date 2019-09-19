# Process Mining #MIMICIII

The two folders contains are collection of SQL queries to help researchers extract event logs from MIMIC-III tables. The first one is to be used if the MIMIC-III is already built on local machine. If it is not available on local machine then you can use the second one through onlone query builder of MIMIC-III available on: https://querybuilder-lcp.mit.edu/

Folder named "01 Data Extraction from Table" are available on both version. When using local machine it will create new tables. If online version is used, then data can be saved on .CSV format after query finishes. In these folders, there are queries numbered from (1 - 16) which designed to extract event logs for a particular disease (cardiovascular diseases) from MIMIC-III.
In local machine folder, three more folders are available:
"02 Joining Extracted Tables": which have three queries (17 - 19) to use already extracted tables from first folder to combine them and build comprehensive and more useful tables which can represent a good event logs.
"03 Proof of Concept": this have one query (20) which join two tables (admission + icustays) to create an event log which can be used to identify patients movement within hosptial.
"04 Cardiovascular Case Study": at this folder there is three queries(21 - 23) which was build to specifically answers research questions for a case study on carsiovascular diseases.

Note: 
Folder "01 Data Extraction from Table" has two extra files. First file (99) contains a set of queries to calaculate outputs after executing queries (1 - 16) if desired. Secone file is a short Python code to calculate missing value in table produced by queries (1 - 23) when extracted in .CSV format.
