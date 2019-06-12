# Project 1-- Exploring Family Factors that Influence Childhood Health Conditions

## Completed by Kyle Morehead and Maria Hudson
June 11, 2019


<b>Folder structure: </b>
<li> Data:  Contains a folder for each year we pulled data from the NHIS website
<li> Programs: Contains all programs run to clean and analyze data
<li> output_data: Contains CSV files created during data cleaning and analysis
<li> Images:  Contains graphs generated as part of data analysis
<br><br>
    
<b>Program Order and Notes: </b>

<i>Step 1:  Data Read-In and Cleaning</i>  
<li> This Jupyter Notebook processes the various data sets for a single survey year and combines them into one yearly file.  It calls two other python programs described below.
<li>ReadData.py reads in a fixed-width text data file as well as the SAS program intended to read it.  It pulls the variable names and locations on the text file from the SAS program and uses that information to read the flat file into a dataframe.
<li>OneYearData.py reads all of the flat files required for this analysis, creates basic analysis variables, aggregates to the family level, and combines results into one data frame for that year.  The resulting dataframe is output to CSV.

<br><br>
<i>Step 2:  Analyze Data All Years</i>  
<li> This Jupyter Notebook runs statistical analysis on each year studied.  It calls one other python program described below.
<li>OneYearAnalysis.py compares family factors to prevelance of childhood conditions and runs t-tests to see if the difference between means is significant.  All of the means and testing information is combined into a single dataframe for that year and output to a dataframe.
<li>We call the function to analyze a year for each of the years studied and append these results into one dataframe. This dataframe is output to CSV to be used in generating graphs.
    
<br><br>
<i>Step 3:  Develop Trendlines</i>  
<li> This Jupyter Notebook creates tailored graphs comparing selected family factors against childhood condition rates
<li> In looking at the graphs, it was clear there was a connection between smoking and poverty rates so we graphed them against each other to illustrate it.  Then we broke the data into smoking-by-poverty to see if the largest effects seen still held in the larger breakouts.