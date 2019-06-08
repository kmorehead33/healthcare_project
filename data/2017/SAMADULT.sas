*********************************************************************
 JUNE 15, 2018 10:51 AM
 
 This is an example of a SAS program that creates a SAS
 file from the 2017 NHIS Public Use SAMADULT.DAT ASCII file
 
 This is stored in SAMADULT.SAS
*********************************************************************;

* USER NOTE: PLACE NEXT STATEMENT IN SUBSEQUENT PROGRAMS;
LIBNAME  NHIS     "C:\NHIS2017";

* USER NOTE: PLACE NEXT STATEMENT IN SUBSEQUENT PROGRAMS
             IF YOU ALLOW PROGRAM TO PERMANENTLY STORE FORMATS;
LIBNAME  LIBRARY  "C:\NHIS2017";

FILENAME ASCIIDAT 'C:\NHIS2017\SAMADULT.dat';

* DEFINE VARIABLE VALUES FOR REPORTS;

*  USE THE STATEMENT "PROC FORMAT LIBRARY=LIBRARY"
     TO PERMANENTLY STORE THE FORMAT DEFINITIONS;

*  USE THE STATEMENT "PROC FORMAT" IF YOU DO NOT WISH
      TO PERMANENTLY STORE THE FORMATS;

PROC FORMAT LIBRARY=LIBRARY;
*PROC FORMAT;

   VALUE $GROUPC
      ' '< - HIGH   = "Range of Values"
   ;
   VALUE GROUPN
      LOW - HIGH   = "Range of Values"
   ;
   VALUE $VERBAT
      ' '< - HIGH   = "Verbatim Response"
   ;
   VALUE SAP001X
      10                 = "10 Household"
      20                 = "20 Person"
      25                 = "25 Income Imputation"
      30                 = "30 Sample Adult"
      38                 = "38 Functioning and Disability"
      40                 = "40 Sample Child"
      60                 = "60 Family"
      63                 = "63 Family Disability Questions"
      65                 = "65 Paradata"
      70                 = "70 Injury/Poisoning Episode"
      75                 = "75 Injury/Poisoning Verbatim"
   ;
   VALUE SAP002X
      .                   = '.'
      OTHER              = "Survey Year"
   ;
   VALUE SAP004X
      1                  = "1 Quarter 1"
      2                  = "2 Quarter 2"
      3                  = "3 Quarter 3"
      4                  = "4 Quarter 4"
   ;
   VALUE SAP005X
      01                 = "01 January"
      02                 = "02 February"
      03                 = "03 March"
      04                 = "04 April"
      05                 = "05 May"
      06                 = "06 June"
      07                 = "07 July"
      08                 = "08 August"
      09                 = "09 September"
      10                 = "10 October"
      11                 = "11 November"
      12                 = "12 December"
   ;
   VALUE SAP010X
      1                  = "1 Northeast"
      2                  = "2 Midwest"
      3                  = "3 South"
      4                  = "4 West"
   ;
   VALUE SAP013X
      1                  = "1 Male"
      2                  = "2 Female"
   ;
   VALUE SAP014X
      00                 = "00 Multiple Hispanic"
      01                 = "01 Puerto Rico"
      02                 = "02 Mexican"
      03                 = "03 Mexican-American"
      04                 = "04 Cuban/Cuban American"
      05                 = "05 Dominican (Republic)"
      06                 = "06 Central or South American"
      07                 = "07 Other Latin American, type not specified"
      08                 = "08 Other Spanish"
      09                 = "09 Hispanic/Latino/Spanish, non-specific type"
      10                 = "10 Hispanic/Latino/Spanish, type refused"
      11                 = "11 Hispanic/Latino/Spanish, type not ascertained"
      12                 = "12 Not Hispanic/Spanish origin"
   ;
   VALUE SAP015X
      01                 = "01 White only"
      02                 = "02 Black/African American only"
      03                 = "03 AIAN only"
      04                 = "04 Asian only"
      05                 = "05 Race group not releasable (See file layout)"
      06                 = "06 Multiple race"
   ;
   VALUE SAP016X
      01                 = "01 White"
      02                 = "02 Black/African American"
      03                 = "03 Indian (American), Alaska Native"
      09                 = "09 Asian Indian"
      10                 = "10 Chinese"
      11                 = "11 Filipino"
      15                 = "15 Other Asian (See file layout)"
      16                 = "16 Primary race not releasable (See file layout)"
      17                 = "17 Multiple race, no primary race selected"
   ;
   VALUE SAP017X
      01                 = "01 White"
      02                 = "02 Black/African American"
      03                 = "03 Indian (American) (includes Eskimo, Aleut)"
      06                 = "06 Chinese"
      07                 = "07 Filipino"
      12                 = "12 Asian Indian"
      16                 = "16 Other race (See file layout)"
      17                 = "17 Multiple race, no primary race selected"
   ;
   VALUE SAP018X
      00                 = "00 Under 1 year"
      85                 = "85 85+ years"
   ;
   VALUE SAP019X
      0                  = "0 Under 14 years"
      1                  = "1 Married - spouse in household"
      2                  = "2 Married - spouse not in household"
      3                  = "3 Married - spouse in household unknown"
      4                  = "4 Widowed"
      5                  = "5 Divorced"
      6                  = "6 Separated"
      7                  = "7 Never married"
      8                  = "8 Living with partner"
      9                  = "9 Unknown marital status"
   ;
   VALUE SAP020X
      1                  = 
"1 Yes, the Sample Adult is a parent of a child residing in the family"
      2                  = 
"2 There are minor children residing in the family but the Sample Adult is not t
heir parent"
      3                  = "3 There are no minor children residing in the family
"
      9                  = "9 Unknown"
   ;
   VALUE SAP021X
      1                  = "1 Physical or mental condition prohibits responding"
      2                  = "2 Sample adult is able to respond"
      3                  = "3 Unknown"
   ;
   VALUE SAP022X
      1                  = "1 Yes"
      2                  = "2 No"
   ;
   VALUE SAP023X
      1                  = "1 Relative who lives in household"
      2                  = "2 Relative who doesn't live in household"
      3                  = "3 Other caregiver"
      4                  = "4 Other"
      7                  = "7 Refused"
      8                  = "8 Not ascertained"
      9                  = "9 Don't know"
   ;
   VALUE SAP024X
      1                  = 
"1 Started Sample Adult Core 2+ weeks after the initial interview"
      2                  = 
"2 Started Sample Adult Core less than 2 weeks after the initial interview"
   ;
   VALUE SAP025X
      1                  = 
"1 Families selected to receive AFD (sample adults) section"
      2                  = 
"2 Families selected to receive FDB (all persons 1 year and older) section"
   ;
   VALUE SAP026X
      1                  = "1 Working for pay at a job or business"
      2                  = "2 With a job or business but not at work"
      3                  = "3 Looking for work"
      4                  = 
"4 Working, but not for pay, at a family-owned job or business"
      5                  = 
"5 Not working at a job or business and not looking for work"
      7                  = "7 Refused"
      8                  = "8 Not ascertained"
      9                  = "9 Don't know"
   ;
   VALUE SAP027X
      01                 = "01 Taking care of house or family"
      02                 = "02 Going to school"
      03                 = "03 Retired"
      04                 = "04 On a planned vacation from work"
      05                 = "05 On family or maternity leave"
      06                 = "06 Temporarily unable to work for health reasons"
      07                 = "07 Have job or contract and off-season"
      08                 = "08 On layoff"
      09                 = "09 Disabled"
      10                 = "10 Other"
      97                 = "97 Refused"
      98                 = "98 Not ascertained"
      99                 = "99 Don't know"
   ;
   VALUE SAP028X
      1                  = "1 Yes"
      2                  = "2 No"
      7                  = "7 Refused"
      8                  = "8 Not ascertained"
      9                  = "9 Don't know"
   ;
   VALUE SAP029X
      .                   = '.'
      OTHER              = 
"See Industry Appendix in file layout at the end of the Sample Adult Documentati
on"
   ;
   VALUE SAP031X
      .                   = '.'
      OTHER              = 
"See Occupation Appendix in file layout at the end of the Sample Adult documenta
tion"
   ;
   VALUE SAP034X
      1                  = "1 Employee of a PRIVATE company for wages"
      2                  = "2 A FEDERAL government employee"
      3                  = "3 A STATE government employee"
      4                  = "4 A LOCAL government employee"
      5                  = 
"5 Self-employed in OWN business, professional practice or farm"
      6                  = 
"6 Working WITHOUT PAY in a family-owned business or farm"
      7                  = "7 Refused"
      8                  = "8 Not ascertained"
      9                  = "9 Don't know"
   ;
   VALUE SAP036X
      01                 = "01 1 employee"
      02                 = "02 2-9 employees"
      03                 = "03 10-24 employees"
      04                 = "04 25-49 employees"
      05                 = "05 50-99 employees"
      06                 = "06 100-249 employees"
      07                 = "07 250-499 employees"
      08                 = "08 500-999 employees"
      09                 = "09 1000 employees or more"
      97                 = "97 Refused"
      98                 = "98 Not ascertained"
      99                 = "99 Don't know"
   ;
   VALUE SAP037X
      00                 = "00 Less than 1 year"
      35                 = "35 35 or more years"
      97                 = "97 Refused"
      98                 = "98 Not ascertained"
      99                 = "99 Don't know"
   ;
   VALUE SAP042X
      0                  = "0 Had job last week"
      1                  = "1 No job last week, had job past 12 months"
      2                  = "2 No job last week, no job past 12 months"
      3                  = "3 Never worked"
      7                  = "7 Refused"
      8                  = "8 Not ascertained"
      9                  = "9 Don't know"
   ;
   VALUE SAP046X
      00                 = "00 Never"
      95                 = "95 95 or more"
      97                 = "97 Refused"
      98                 = "98 Not ascertained"
      99                 = "99 Don't know"
   ;
   VALUE SAP047X
      0                  = "0 Never"
      1                  = "1 Day(s)"
      2                  = "2 Week(s)"
      3                  = "3 Month(s)"
      4                  = "4 Year(s)"
      7                  = "7 Refused"
      8                  = "8 Not ascertained"
      9                  = "9 Don't know"
   ;
   VALUE SAP048X
      1                  = "1 Not told"
      2                  = "2 High"
      3                  = "3 Normal"
      4                  = "4 Low"
      5                  = "5 Borderline"
      7                  = "7 Refused"
      8                  = "8 Not ascertained"
      9                  = "9 Don't know"
   ;
   VALUE SAP068X
      1                  = "1 Advise them to drive to the hospital"
      2                  = "2 Advise them to call their physician"
      3                  = "3 Call 9-1-1 (or another emergency number)"
      4                  = "4 Call spouse or family member"
      5                  = "5 Other"
      7                  = "7 Refused"
      8                  = "8 Not ascertained"
      9                  = "9 Don't know"
   ;
   VALUE SAP087X
      1                  = "1 Mentioned"
      2                  = "2 Not mentioned"
      7                  = "7 Refused"
      8                  = "8 Not ascertained"
      9                  = "9 Don't know"
   ;
   VALUE SAP118X
      85                 = "85 85+ years"
      97                 = "97 Refused"
      98                 = "98 Not ascertained"
      99                 = "99 Don't know"
   ;
   VALUE SAP156X
      1                  = "1 Yes"
      2                  = "2 No"
      3                  = "3 Borderline or prediabetes"
      7                  = "7 Refused"
      8                  = "8 Not ascertained"
      9                  = "9 Don't know"
   ;
   VALUE SAP158X
      1                  = "1 year ago or less"
      2                  = "2 More than 1 year, but not more than 2 years ago"
      3                  = "3 More than 2 years, but not more than 3 years ago"
      4                  = "4 More than 3 years ago"
      5                  = "5 Never"
      7                  = "7 Refused"
      8                  = "8 Not ascertained"
      9                  = "9 Don't know"
   ;
   VALUE SAP160X
      00                 = "00 Within past year"
      85                 = "85 85+ years"
      96                 = "96 1+ year(s) with diabetes and age is 85+"
      97                 = "97 Refused"
      98                 = "98 Not ascertained"
      99                 = "99 Don't know"
   ;
   VALUE SAP161X
      1                  = "1 Type 1"
      2                  = "2 Type 2"
      3                  = "3 Other"
      7                  = "7 Refused"
      8                  = "8 Not ascertained"
      9                  = "9 Don't know"
   ;
   VALUE SAP164X
      1                  = "1 Less than 1 month"
      2                  = "2 1 month to less than 6 months"
      3                  = "3 6 months to less than 1 year"
      4                  = "4 1 year or more"
      7                  = "7 Refused"
      8                  = "8 Not ascertained"
      9                  = "9 Don't know"
   ;
   VALUE SAP171X
      1                  = "1 Very interested"
      2                  = "2 Somewhat interested"
      3                  = "3 Not interested"
      7                  = "7 Refused"
      8                  = "8 Not ascertained"
      9                  = "9 Don't know"
   ;
   VALUE SAP174X
      0                  = "0 None"
      1                  = "1 One"
      2                  = "2 Two or three"
      3                  = "3 Between four and ten"
      4                  = "4 More than 10"
      7                  = "7 Refused"
      8                  = "8 Not ascertained"
      9                  = "9 Don't know"
   ;
   VALUE SAP176X
      1                  = "1 Not at all"
      2                  = "2 Slightly"
      3                  = "3 Moderately"
      4                  = "4 Quite a bit"
      5                  = "5 Extremely"
      7                  = "7 Refused"
      8                  = "8 Not ascertained"
      9                  = "9 Don't know"
   ;
   VALUE SAP215X
      1                  = "1 Excellent"
      2                  = "2 Good"
      3                  = "3 A little trouble hearing"
      4                  = "4 Moderate trouble"
      5                  = "5 A lot of trouble"
      6                  = "6 Deaf"
      7                  = "7 Refused"
      8                  = "8 Not ascertained"
      9                  = "9 Don't know"
   ;
   VALUE SAP232X
      0                  = "0 Not at all difficult"
      1                  = "1 Only a little difficult"
      2                  = "2 Somewhat difficult"
      3                  = "3 Very difficult"
      4                  = "4 Can't do at all because of eyesight"
      6                  = "6 Do not do this activity for other reasons"
      7                  = "7 Refused"
      8                  = "8 Not ascertained"
      9                  = "9 Don't know"
   ;
   VALUE SAP238X
      1                  = "1 Less than one month"
      2                  = "2 1-12 months"
      3                  = "3 13-24 months"
      4                  = "4 More than 2 years"
      5                  = "5 Never"
      7                  = "7 Refused"
      8                  = "8 Not ascertained"
      9                  = "9 Don't know"
   ;
   VALUE SAP240X
      1                  = "1 Always"
      2                  = "2 Most of the time"
      3                  = "3 Some of the time"
      4                  = "4 None of the time"
      7                  = "7 Refused"
      8                  = "8 Not ascertained"
      9                  = "9 Don't know"
   ;
   VALUE SAP242X
      1                  = "1 Never"
      2                  = "2 Some days"
      3                  = "3 Most days"
      4                  = "4 Every day"
      7                  = "7 Refused"
      8                  = "8 Not ascertained"
      9                  = "9 Don't know"
   ;
   VALUE SAP244X
      000                = "000 None"
      997                = "997 Refused"
      998                = "998 Not ascertained"
      999                = "999 Don't know"
   ;
   VALUE SAP246X
      1                  = "1 Better"
      2                  = "2 Worse"
      3                  = "3 About the same"
      7                  = "7 Refused"
      8                  = "8 Not ascertained"
      9                  = "9 Don't know"
   ;
   VALUE SAP248X
      0                  = "0 Not at all difficult"
      1                  = "1 Only a little difficult"
      2                  = "2 Somewhat difficult"
      3                  = "3 Very difficult"
      4                  = "4 Can't do at all"
      6                  = "6 Do not do this activity"
      7                  = "7 Refused"
      8                  = "8 Not ascertained"
      9                  = "9 Don't know"
   ;
   VALUE SAP260X
      1                  = "1 Limited in any way"
      2                  = "2 Not limited in any way"
      3                  = "3 Unknown if limited"
   ;
   VALUE SAP297X
      95                 = "95 95+"
      96                 = "96 Since birth"
      97                 = "97 Refused"
      98                 = "98 Not ascertained"
      99                 = "99 Don't know"
   ;
   VALUE SAP298X
      1                  = "1 Day(s)"
      2                  = "2 Week(s)"
      3                  = "3 Month(s)"
      4                  = "4 Year(s)"
      6                  = "6 Since birth"
      7                  = "7 Refused"
      8                  = "8 Not ascertained"
      9                  = "9 Don't know"
   ;
   VALUE SAP299X
      00                 = "00 Less than 1 year"
      85                 = "85 85+ years"
      96                 = "96 Unknown number of years"
      97                 = "97 Refused"
      98                 = "98 Not ascertained"
      99                 = "99 Don't know"
   ;
   VALUE SAP300X
      1                  = "1 Less than 3 months"
      2                  = "2 3-5 months"
      3                  = "3 6-12 months"
      4                  = "4 More than 1 year"
      7                  = "7 Refused"
      8                  = "8 Not ascertained"
      9                  = "9 Don't know"
   ;
   VALUE SAP301X
      1                  = "1 Chronic"
      2                  = "2 Not chronic"
      9                  = "9 Unknown if chronic"
   ;
   VALUE SAP477X
      1                  = 
"1 At least one condition causing functional limitation is chronic"
      2                  = "2 No condition causing functional limitation"
      9                  = 
"9 Unknown if any condition causing functional limitation is chronic"
   ;
   VALUE SAP478X
      0                  = 
"0 Not limited in any way (including unknown if limited)"
      1                  = "1 Limited; caused by at least one chronic condition"
      2                  = "2 Limited; not caused by chronic condition"
      3                  = "3 Limited; unknown if condition is chronic"
   ;
   VALUE SAP480X
      85                 = "85 85 years or older"
      96                 = "96 Never smoked regularly"
      97                 = "97 Refused"
      98                 = "98 Not ascertained"
      99                 = "99 Don't know"
   ;
   VALUE SAP481X
      1                  = "1 Every day"
      2                  = "2 Some days"
      3                  = "3 Not at all"
      7                  = "7 Refused"
      8                  = "8 Not ascertained"
      9                  = "9 Don't know"
   ;
   VALUE SAP482X
      1                  = "1 Current every day smoker"
      2                  = "2 Current some day smoker"
      3                  = "3 Former smoker"
      4                  = "4 Never smoker"
      5                  = "5 Smoker, current status unknown"
      9                  = "9 Unknown if ever smoked"
   ;
   VALUE SAP483X
      95                 = "95 95+"
      97                 = "97 Refused"
      98                 = "98 Not ascertained"
      99                 = "99 Don't know"
   ;
   VALUE SAP484X
      1                  = "1 Day(s)"
      2                  = "2 Week(s)"
      3                  = "3 Month(s)"
      4                  = "4 Year(s)"
      7                  = "7 Refused"
      8                  = "8 Not ascertained"
      9                  = "9 Don't know"
   ;
   VALUE SAP485X
      00                 = "00 Less than 1 year"
      70                 = "70 70+ years"
      97                 = "97 Refused"
      98                 = "98 Not ascertained"
      99                 = "99 Don't know"
   ;
   VALUE SAP486X
      95                 = "95 95+ cigarettes"
      97                 = "97 Refused"
      98                 = "98 Not ascertained"
      99                 = "99 Don't know"
   ;
   VALUE SAP487X
      00                 = "00 None"
      97                 = "97 Refused"
      98                 = "98 Not ascertained"
      99                 = "99 Don't know"
   ;
   VALUE SAP493X
      97                 = "97 Refused"
      98                 = "98 Not ascertained"
      99                 = "99 Don't know"
   ;
   VALUE SAP501X
      000                = "000 Never"
      996                = "996 Unable to do this type activity"
      997                = "997 Refused"
      998                = "998 Not ascertained"
      999                = "999 Don't know"
   ;
   VALUE SAP502X
      0                  = "0 Never"
      1                  = "1 Per day"
      2                  = "2 Per week"
      3                  = "3 Per month"
      4                  = "4 Per year"
      6                  = "6 Unable to do this activity"
      7                  = "7 Refused"
      8                  = "8 Not ascertained"
      9                  = "9 Don't know"
   ;
   VALUE SAP503X
      00                 = "00 Less than once per week"
      95                 = "95 Never"
      96                 = "96 Unable to do vigorous activity"
      97                 = "97 Refused"
      98                 = "98 Not ascertained"
      99                 = "99 Don't know"
   ;
   VALUE SAP504X
      997                = "997 Refused"
      998                = "998 Not ascertained"
      999                = "999 Don't know"
   ;
   VALUE SAP505X
      1                  = "1 Minutes"
      2                  = "2 Hours"
      7                  = "7 Refused"
      8                  = "8 Not ascertained"
      9                  = "9 Don't know"
   ;
   VALUE SAP509X
      00                 = "00 Less than once per week"
      95                 = "95 Never"
      96                 = "96 Unable to do light or moderate activity"
      97                 = "97 Refused"
      98                 = "98 Not ascertained"
      99                 = "99 Don't know"
   ;
   VALUE SAP515X
      00                 = "00 Less than once per week"
      95                 = "95 Never"
      96                 = "96 Unable to do strength activity"
      97                 = "97 Refused"
      98                 = "98 Not ascertained"
      99                 = "99 Don't know"
   ;
   VALUE SAP518X
      000                = "000 Never"
      997                = "997 Refused"
      998                = "998 Not ascertained"
      999                = "999 Don't know"
   ;
   VALUE SAP519X
      0                  = "0 Never/None"
      1                  = "1 Week"
      2                  = "2 Month"
      3                  = "3 Year"
      7                  = "7 Refused"
      8                  = "8 Not ascertained"
      9                  = "9 Don't know"
   ;
   VALUE SAP520X
      00                 = "00 Less than one day per week"
      95                 = "95 Did not drink in past year"
      97                 = "97 Refused"
      98                 = "98 Not ascertained"
      99                 = "99 Don't know"
   ;
   VALUE SAP521X
      000                = "000 Never/none"
      997                = "997 Refused"
      998                = "998 Not ascertained"
      999                = "999 Don't know"
   ;
   VALUE SAP522X
      95                 = "95 95+ drinks"
      97                 = "97 Refused"
      98                 = "98 Not ascertained"
      99                 = "99 Don't know"
   ;
   VALUE SAP523X
      01                 = "01 Lifetime abstainer"
      02                 = "02 Former infrequent"
      03                 = "03 Former regular"
      04                 = "04 Former, unknown frequency"
      05                 = "05 Current infrequent"
      06                 = "06 Current light"
      07                 = "07 Current moderate"
      08                 = "08 Current heavier"
      09                 = "09 Current drinker, frequency/level unknown"
      10                 = "10 Drinking status unknown"
   ;
   VALUE SAP525X
      0                  = "0 Never/None"
      1                  = "1 Per week"
      2                  = "2 Per month"
      3                  = "3 Per year"
      7                  = "7 Refused"
      8                  = "8 Not ascertained"
      9                  = "9 Don't know"
   ;
   VALUE SAP528X
      96                 = "96 Not available"
      97                 = "97 Refused"
      98                 = "98 Not ascertained"
      99                 = "99 Don't know"
   ;
   VALUE SAP529X
      996                = "996 Not available"
      997                = "997 Refused"
      998                = "998 Not ascertained"
      999                = "999 Don't know"
   ;
   VALUE SAP530X
      99.95              = "99.95 99.95+"
      99.99              = "99.99 Unknown"
   ;
   VALUE SAP531X
      1                  = "1 Yes"
      2                  = "2 There is NO place"
      3                  = "3 There is MORE THAN ONE place"
      7                  = "7 Refused"
      8                  = "8 Not ascertained"
      9                  = "9 Don't know"
   ;
   VALUE SAP532X
      1                  = "1 Clinic or health center"
      2                  = "2 Doctor's office or HMO"
      3                  = "3 Hospital emergency room"
      4                  = "4 Hospital outpatient department"
      5                  = "5 Some other place"
      6                  = "6 Doesn't go to one place most often"
      7                  = "7 Refused"
      8                  = "8 Not ascertained"
      9                  = "9 Don't know"
   ;
   VALUE SAP534X
      0                  = "0 Doesn't get preventive care anywhere"
      1                  = "1 Clinic or health center"
      2                  = "2 Doctor's office or HMO"
      3                  = "3 Hospital emergency room"
      4                  = "4 Hospital outpatient department"
      5                  = "5 Some other place"
      6                  = "6 Doesn't go to one place most often"
      7                  = "7 Refused"
      8                  = "8 Not ascertained"
      9                  = "9 Don't know"
   ;
   VALUE SAP538X
      1                  = "1 Yes"
      2                  = "2 No"
      7                  = "7 Refused"
      8                  = "8 Not ascertained"
      9                  = "9 Don’t know"
   ;
   VALUE SAP552X
      1                  = "1 Very worried"
      2                  = "2 Somewhat worried"
      3                  = "3 Not at all worried"
      7                  = "7 Refused"
      8                  = "8 Not ascertained"
      9                  = "9 Don't know"
   ;
   VALUE SAP561X
      0                  = "0 Never"
      1                  = "1 6 months or less"
      2                  = "2 More than 6 mos, but not more than 1 yr ago"
      3                  = "3 More than 1 yr, but not more than 2 yrs ago"
      4                  = "4 More than 2 yrs, but not more than 5 yrs ago"
      5                  = "5 More than 5 years ago"
      7                  = "7 Refused"
      8                  = "8 Not ascertained"
      9                  = "9 Don't know"
   ;
   VALUE SAP572X
      00                 = "00 None"
      01                 = "01 1"
      02                 = "02 2-3"
      03                 = "03 4-5"
      04                 = "04 6-7"
      05                 = "05 8-9"
      06                 = "06 10-12"
      07                 = "07 13-15"
      08                 = "08 16 or more"
      97                 = "97 Refused"
      98                 = "98 Not ascertained"
      99                 = "99 Don't know"
   ;
   VALUE SAP585X
      01                 = "01 1"
      02                 = "02 2-3"
      03                 = "03 4-5"
      04                 = "04 6-7"
      05                 = "05 8-9"
      06                 = "06 10-12"
      07                 = "07 13-15"
      08                 = "08 16 or more"
      97                 = "97 Refused"
      98                 = "98 Not ascertained"
      99                 = "99 Don't know"
   ;
   VALUE SAP588X
      07                 = "07 7+ times"
      97                 = "97 Refused"
      98                 = "98 Not ascertained"
      99                 = "99 Don't know"
   ;
   VALUE SAP596X
      1                  = "1 Flu shot"
      2                  = "2 Flu nasal spray (spray, mist or drop in nose)"
      7                  = "7 Refused"
      8                  = "8 Not ascertained"
      9                  = "9 Don't know"
   ;
   VALUE SAP597X
      01                 = "01 January"
      02                 = "02 February"
      03                 = "03 March"
      04                 = "04 April"
      05                 = "05 May"
      06                 = "06 June"
      07                 = "07 July"
      08                 = "08 August"
      09                 = "09 September"
      10                 = "10 October"
      11                 = "11 November"
      12                 = "12 December"
      97                 = "97 Refused"
      98                 = "98 Not ascertained"
      99                 = "99 Don't know"
   ;
   VALUE SAP598X
      .                   = '.'
      OTHER              = "Year"
      9997               = "9997 Refused"
      9998               = "9998 Not ascertained"
      9999               = "9999 Don't know"
   ;
   VALUE SAP599X
      1                  = "1 Before this pregnancy"
      2                  = "2 During this pregnancy"
      7                  = "7 Refused"
      8                  = "8 Not ascertained"
      9                  = "9 Don't know"
   ;
   VALUE SAP600X
      1                  = "1 Before this pregnancy"
      2                  = "2 During this pregnancy"
      3                  = "3 After this pregnancy"
      7                  = "7 Refused"
      8                  = "8 Not ascertained"
      9                  = "9 Don't know"
   ;
   VALUE SAP608X
      1                  = "1 Received at least 3 doses"
      2                  = "2 Received less than 3 doses"
      7                  = "7 Refused"
      8                  = "8 Not ascertained"
      9                  = "9 Don't know"
   ;
   VALUE SAP610X
      96                 = "96 Received all shots"
      97                 = "97 Refused"
      98                 = "98 Not ascertained"
      99                 = "99 Don't know"
   ;
   VALUE SAP612X
      1                  = 
"1 A blood test or symptoms like fatigue, nausea, stomach pain, yellowing of eye
s/skin indicated risk for hepatitis C"
      2                  = "2 You were born from 1945 through 1965"
      3                  = 
"3 At risk of hepatitis C due to exposure to blood at work, injection drug use o
r receipt of transfusion before 1992"
      4                  = "4 Some other reason"
      7                  = "7 Refused"
      8                  = "8 Not ascertained"
      9                  = "9 Don't know"
   ;
   VALUE SAP615X
      1                  = "1 Yes-included pertussis"
      2                  = "2 No-did not include pertussis"
      3                  = "3 Doctor did not say"
      7                  = "7 Refused"
      8                  = "8 Not ascertained"
      9                  = "9 Don't know"
   ;
   VALUE SAP616X
      1                  = "1 Yes"
      2                  = "2 No"
      3                  = "3 Doctor refused when asked"
      7                  = "7 Refused"
      8                  = "8 Not ascertained"
      9                  = "9 Don't know"
   ;
   VALUE SAP617X
      50                 = "50 50+ shots"
      96                 = "96 All shots"
      97                 = "97 Refused"
      98                 = "98 Not ascertained"
      99                 = "99 Don't know"
   ;
   VALUE SAP633X
      1                  = "1 Self"
      2                  = "2 Someone else in family"
      3                  = "3 Both"
      7                  = "7 Refused"
      8                  = "8 Not ascertained"
      9                  = "9 Don’t know"
   ;
   VALUE SAP634X
      1                  = "1 Very difficult"
      2                  = "2 Somewhat difficult"
      3                  = "3 Not at all difficult"
      7                  = "7 Refused"
      8                  = "8 Not ascertained"
      9                  = "9 Don’t know"
   ;
   VALUE SAP635X
      1                  = "1 Very difficult"
      2                  = "2 Somewhat difficult"
      3                  = "3 Not at all difficult"
      7                  = "7 Refused"
      8                  = "8 Not ascertained"
      9                  = "9 Don't know"
   ;
   VALUE SAP637X
      1                  = "1 Very important"
      2                  = "2 Somewhat important"
      3                  = "3 Slightly important"
      4                  = "4 Not important at all"
      7                  = "7 Refused"
      8                  = "8 Not ascertained"
      9                  = "9 Don't know"
   ;
   VALUE SAP642X
      1                  = "1 Never or almost never"
      2                  = "2 Some days"
      3                  = "3 Most days"
      4                  = "4 Every day"
      7                  = "7 Refused"
      8                  = "8 Not ascertained"
      9                  = "9 Don't know"
   ;
   VALUE SAP643X
      1                  = "1 Very satisfied"
      2                  = "2 Somewhat satisfied"
      3                  = "3 Somewhat dissatisfied"
      4                  = "4 Very dissatisfied"
      5                  = "5 You haven't had health care in the past 12 months"
      7                  = "7 Refused"
      8                  = "8 Not ascertained"
      9                  = "9 Don't know"
   ;
   VALUE SAP644X
      1                  = "1 Less than 1 year"
      2                  = "2 1-3 years"
      3                  = "3 4-10 years"
      4                  = "4 11-20 years"
      5                  = "5 More than 20 years"
      7                  = "7 Refused"
      8                  = "8 Not ascertained"
      9                  = "9 Don't know"
   ;
   VALUE SAP645X
      1                  = "1 Definitely agree"
      2                  = "2 Somewhat agree"
      3                  = "3 Somewhat disagree"
      4                  = "4 Definitely disagree"
      7                  = "7 Refused"
      8                  = "8 Not ascertained"
      9                  = "9 Don't know"
   ;
   VALUE SAP649X
      1                  = "1 Gay"
      2                  = "2 Straight, that is, not gay"
      3                  = "3 Bisexual"
      4                  = "4 Something else"
      5                  = "5 I don't know the answer"
      7                  = "7 Refused"
      8                  = "8 Not ascertained"
   ;
   VALUE SAP650X
      1                  = "1 Lesbian or gay"
      2                  = "2 Straight, that is, not lesbian or gay"
      3                  = "3 Bisexual"
      4                  = "4 Something else"
      5                  = "5 I don't know the answer"
      7                  = "7 Refused"
      8                  = "8 Not ascertained"
   ;
   VALUE SAP651X
      1                  = "1 Very worried"
      2                  = "2 Moderately worried"
      3                  = "3 Not too worried"
      4                  = "4 Not worried at all"
      7                  = "7 Refused"
      8                  = "8 Not ascertained"
      9                  = "9 Don't know"
   ;
   VALUE SAP655X
      1                  = "1 Very worried"
      2                  = "2 Moderately worried"
      3                  = "3 Not too worried"
      4                  = "4 Not worried at all"
      5                  = "5 This does not apply to me"
      7                  = "7 Refused"
      8                  = "8 Not ascertained"
      9                  = "9 Don't know"
   ;
   VALUE SAP658X
      1                  = "1 Very worried"
      2                  = "2 Moderately worried"
      3                  = "3 Not too worried"
      4                  = "4 Not worried at all"
      5                  = "5 I don't have credit cards"
      7                  = "7 Refused"
      8                  = "8 Not ascertained"
      9                  = "9 Don't know"
   ;
   VALUE SAP660X
      00                 = 
"00 Did not have trouble falling asleep in the past week"
      07                 = "07 7 or more times"
      97                 = "97 Refused"
      98                 = "98 Not ascertained"
      99                 = "99 Don't know"
   ;
   VALUE SAP661X
      00                 = 
"00 Did not have trouble staying asleep in the past week"
      07                 = "07 7 or more times"
      97                 = "97 Refused"
      98                 = "98 Not ascertained"
      99                 = "99 Don't know"
   ;
   VALUE SAP662X
      00                 = 
"00 Did not take medication to help sleep in the past week"
      07                 = "07 7 or more times"
      97                 = "97 Refused"
      98                 = "98 Not ascertained"
      99                 = "99 Don't know"
   ;
   VALUE SAP663X
      00                 = "00 Never felt rested in the past week"
      97                 = "97 Refused"
      98                 = "98 Not ascertained"
      99                 = "99 Don't know"
   ;
   VALUE SAP664X
      1                  = "1 ALL of the time"
      2                  = "2 MOST of the time"
      3                  = "3 SOME of the time"
      4                  = "4 A LITTLE of the time"
      5                  = "5 NONE of the time"
      7                  = "7 Refused"
      8                  = "8 Not ascertained"
      9                  = "9 Don't know"
   ;
   VALUE SAP670X
      1                  = "1 A lot"
      2                  = "2 Some"
      3                  = "3 A little"
      4                  = "4 Not at all"
      7                  = "7 Refused"
      8                  = "8 Not ascertained"
      9                  = "9 Don't know"
   ;
   VALUE SAP672X
      01                 = "01 It's unlikely you've been exposed to HIV"
      02                 = 
"02 You were afraid to find out if you were HIV positive (that you had HIV)"
      03                 = 
"03 You didn't want to think about HIV or about being HIV positive"
      04                 = 
"04 You were worried your name would be reported to the government if you tested
 positive"
      05                 = "05 You didn't know where to get tested"
      06                 = "06 You don't like needles"
      07                 = 
"07 You were afraid of losing job, insurance, housing, friends, family, if peopl
e knew you were positive for AIDS infection"
      08                 = "08 Some other reason"
      09                 = "09 No particular reason"
      97                 = "97 Refused"
      98                 = "98 Not ascertained"
      99                 = "99 Don't know"
   ;
   VALUE SAP699X
      1                  = "1 Per day"
      2                  = "2 Per week"
      3                  = "3 Per month"
      4                  = "4 Per year"
      7                  = "7 Refused"
      8                  = "8 Not ascertained"
      9                  = "9 Don't know"
   ;

DATA NHIS.SAMADULT;
   * CREATE A SAS DATA SET;
   INFILE ASCIIDAT PAD LRECL=948;

   * DEFINE LENGTH OF ALL VARIABLES;

   LENGTH

      /* IDN LENGTHS */

      RECTYPE    3   SRVY_YR    4   HHX      $ 6   INTV_QRT   3
      INTV_MON   3   FMX      $ 2   FPX      $ 2   WTIA_SA    8
      WTFA_SA    8

      /* UCF LENGTHS */

      REGION     3   PSTRAT     4   PPSU       4

      /* HHC LENGTHS */

      SEX        3   HISPAN_I   3   RACERPI2   3   MRACRPI2   3
      MRACBPI2   3   AGE_P      3

      /* FID LENGTHS */

      R_MARITL   3   PAR_STAT   3

      /* AID LENGTHS */

      PROXYSA    3   PROX1      3   PROX2      3   LATEINTA   3

      /* FDB LENGTHS */

      FDRN_FLG   3

      /* ASD LENGTHS */

      DOINGLWA   3   WHYNOWKA   3   EVERWRK    3   INDSTRN1   3
      INDSTRN2   3   OCCUPN1    3   OCCUPN2    3   SUPERVIS   3
      WRKCATA    3   BUSINC1A   3   LOCALL1B   3   YRSWRKPA   3
      WRKLONGH   3   HOURPDA    3   PDSICKA    3   ONEJOB     3
      WRKLYR4    3

      /* ACN LENGTHS */

      HYPEV      3   HYPDIFV    3   HYPYR1     3   HYBPCKNO   3
      HYBPCKTP   3   HYBPLEV    3   HYPMDEV2   3   HYPMED2    3
      CHLEV      3   CHLYR      3   CLCKNO     3   CLCKTP     3
      CHLMDEV2   3   CHLMDNW2   3   CHDEV      3   ANGEV      3
      MIEV       3   HRTEV      3   STREV      3   EPHEV      3
      JAWP       3   WEA        3   CHE        3   ARM        3
      BRTH       3   AHADO      3   FACE       3   SPEAKING   3
      EYE        3   WALKING    3   HEADACHE   3   ASTDO      3
      COPDEV     3   ASPMEDEV   3   ASPMEDAD   3   ASPMDMED   3
      ASPONOWN   3   AASMEV     3   AASSTILL   3   AASMYR     3
      AASERYR1   3   ULCEV      3   ULCYR      3   CANEV      3
      CNKIND1    3   CNKIND2    3   CNKIND3    3   CNKIND4    3
      CNKIND5    3   CNKIND6    3   CNKIND7    3   CNKIND8    3
      CNKIND9    3   CNKIND10   3   CNKIND11   3   CNKIND12   3
      CNKIND13   3   CNKIND14   3   CNKIND15   3   CNKIND16   3
      CNKIND17   3   CNKIND18   3   CNKIND19   3   CNKIND20   3
      CNKIND21   3   CNKIND22   3   CNKIND23   3   CNKIND24   3
      CNKIND25   3   CNKIND26   3   CNKIND27   3   CNKIND28   3
      CNKIND29   3   CNKIND30   3   CNKIND31   3   CANAGE1    4
      CANAGE2    4   CANAGE3    4   CANAGE4    4   CANAGE5    4
      CANAGE6    4   CANAGE7    4   CANAGE8    4   CANAGE9    4
      CANAGE10   4   CANAGE11   4   CANAGE12   4   CANAGE13   4
      CANAGE14   4   CANAGE15   4   CANAGE16   4   CANAGE17   4
      CANAGE18   4   CANAGE19   4   CANAGE20   4   CANAGE21   4
      CANAGE22   4   CANAGE23   4   CANAGE24   4   CANAGE25   4
      CANAGE26   4   CANAGE27   4   CANAGE28   4   CANAGE29   4
      CANAGE30   4   PREGEVER   3   DBHVPAY    3   DBHVCLY    3
      DBHVWLY    3   DBHVPAN    3   DBHVCLN    3   DBHVWLN    3
      DIBREL     3   DIBEV1     3   DIBPRE2    3   DIBTEST    3
      DIBAGE1    3   DIFAGE2    3   DIBTYPE    3   DIBPILL1   3
      INSLN1     3   DIBINS2    3   DIBINS3    3   DIBINS4    3
      DIBGDM     3   DIBBABY    3   DIBPRGM    3   DIBREFER   3
      DIBBEGIN   3   EPILEP1    3   EPILEP2    3   EPILEP3    3
      EPILEP4    3   EPILEP5    3   AHAYFYR    3   SINYR      3
      CBRCHYR    3   KIDWKYR    3   LIVYR      3   JNTSYMP    3
      JMTHP1     3   JMTHP2     3   JMTHP3     3   JMTHP4     3
      JMTHP5     3   JMTHP6     3   JMTHP7     3   JMTHP8     3
      JMTHP9     3   JMTHP10    3   JMTHP11    3   JMTHP12    3
      JMTHP13    3   JMTHP14    3   JMTHP15    3   JMTHP16    3
      JMTHP17    3   JNTCHR     3   JNTHP      3   ARTH1      3
      ARTHLMT    3   PAINECK    3   PAINLB     3   PAINLEG    3
      PAINFACE   3   AMIGR      3   ACOLD2W    3   AINTIL2W   3
      PREGNOW    3   PREGFLYR   3   HRAIDNOW   3   HRAIDEV    3
      AHEARST1   3   AVISION    3   ABLIND     3   VIM_DREV   3
      VIMLS_DR   3   VIM_CAEV   3   VIMLS_CA   3   VIMCSURG   3
      VIM_GLEV   3   VIMLS_GL   3   VIM_MDEV   3   VIMLS_MD   3
      VIMGLASS   3   VIMREAD    3   VIMDRIVE   3   AVISREH    3
      AVISDEV    3   AVDF_NWS   3   AVDF_CLS   3   AVDF_NIT   3
      AVDF_DRV   3   AVDF_PER   3   AVDF_CRD   3   AVISEXAM   3
      AVISACT    3   AVISPROT   3   LUPPRT     3   CHPAIN6M   3
      PAINLMT    3

      /* AHS LENGTHS */

      WKDAYR     4   BEDDAYR    4   AHSTATYR   3   SPECEQ     3
      FLWALK     3   FLCLIMB    3   FLSTAND    3   FLSIT      3
      FLSTOOP    3   FLREACH    3   FLGRASP    3   FLCARRY    3
      FLPUSH     3   FLSHOP     3   FLSOCL     3   FLRELAX    3
      FLA1AR     3   AFLHCA1    3   AFLHCA2    3   AFLHCA3    3
      AFLHCA4    3   AFLHCA5    3   AFLHCA6    3   AFLHCA7    3
      AFLHCA8    3   AFLHCA9    3   AFLHCA10   3   AFLHCA11   3
      AFLHCA12   3   AFLHCA13   3   ALHCA14A   3   AFLHCA15   3
      AFLHCA16   3   AFLHCA17   3   AFLHCA18   3   AFLHC19_   3
      AFLHC20_   3   AFLHC21_   3   AFLHC22_   3   AFLHC23_   3
      AFLHC24_   3   AFLHC25_   3   AFLHC26_   3   AFLHC27_   3
      AFLHC28_   3   AFLHC29_   3   AFLHC30_   3   AFLHC31_   3
      AFLHC32_   3   AFLHC33_   3   AFLHC34_   3   AFLHCA90   3
      AFLHCA91   3   ALTIME1    3   ALUNIT1    3   ALDURA1    3
      ALDURB1    3   ALCHRC1    3   ALTIME2    3   ALUNIT2    3
      ALDURA2    3   ALDURB2    3   ALCHRC2    3   ALTIME3    3
      ALUNIT3    3   ALDURA3    3   ALDURB3    3   ALCHRC3    3
      ALTIME4    3   ALUNIT4    3   ALDURA4    3   ALDURB4    3
      ALCHRC4    3   ALTIME5    3   ALUNIT5    3   ALDURA5    3
      ALDURB5    3   ALCHRC5    3   ALTIME6    3   ALUNIT6    3
      ALDURA6    3   ALDURB6    3   ALCHRC6    3   ALTIME7    3
      ALUNIT7    3   ALDURA7    3   ALDURB7    3   ALCHRC7    3
      ALTIME8    3   ALUNIT8    3   ALDURA8    3   ALDURB8    3
      ALCHRC8    3   ALTIME9    3   ALUNIT9    3   ALDURA9    3
      ALDURB9    3   ALCHRC9    3   ALTIME10   3   ALUNIT10   3
      ALDURA10   3   ALDURB10   3   ALCHRC10   3   ALTIME11   3
      ALUNIT11   3   ALDURA11   3   ALDURB11   3   ALCHRC11   3
      ALTIME12   3   ALUNIT12   3   ALDURA12   3   ALDURB12   3
      ALCHRC12   3   ALTIME13   3   ALUNIT13   3   ALDURA13   3
      ALDURB13   3   ALCHRC13   3   ATIME14A   3   AUNIT14A   3
      ADURA14A   3   ADURB14A   3   ACHRC14A   3   ALTIME15   3
      ALUNIT15   3   ALDURA15   3   ALDURB15   3   ALCHRC15   3
      ALTIME16   3   ALUNIT16   3   ALDURA16   3   ALDURB16   3
      ALCHRC16   3   ALTIME17   3   ALUNIT17   3   ALDURA17   3
      ALDURB17   3   ALCHRC17   3   ALTIME18   3   ALUNIT18   3
      ALDURA18   3   ALDURB18   3   ALCHRC18   3   ALTIME19   3
      ALUNIT19   3   ALDURA19   3   ALDURB19   3   ALCHRC19   3
      ALTIME20   3   ALUNIT20   3   ALDURA20   3   ALDURB20   3
      ALCHRC20   3   ALTIME21   3   ALUNIT21   3   ALDURA21   3
      ALDURB21   3   ALCHRC21   3   ALTIME22   3   ALUNIT22   3
      ALDURA22   3   ALDURB22   3   ALCHRC22   3   ALTIME23   3
      ALUNIT23   3   ALDURA23   3   ALDURB23   3   ALCHRC23   3
      ALTIME24   3   ALUNIT24   3   ALDURA24   3   ALDURB24   3
      ALCHRC24   3   ALTIME25   3   ALUNIT25   3   ALDURA25   3
      ALDURB25   3   ALCHRC25   3   ALTIME26   3   ALUNIT26   3
      ALDURA26   3   ALDURB26   3   ALCHRC26   3   ALTIME27   3
      ALUNIT27   3   ALDURA27   3   ALDURB27   3   ALCHRC27   3
      ALTIME28   3   ALUNIT28   3   ALDURA28   3   ALDURB28   3
      ALCHRC28   3   ALTIME29   3   ALUNIT29   3   ALDURA29   3
      ALDURB29   3   ALCHRC29   3   ALTIME30   3   ALUNIT30   3
      ALDURA30   3   ALDURB30   3   ALCHRC30   3   ALTIME31   3
      ALUNIT31   3   ALDURA31   3   ALDURB31   3   ALCHRC31   3
      ALTIME32   3   ALUNIT32   3   ALDURA32   3   ALDURB32   3
      ALCHRC32   3   ALTIME33   3   ALUNIT33   3   ALDURA33   3
      ALDURB33   3   ALCHRC33   3   ALTIME34   3   ALUNIT34   3
      ALDURA34   3   ALDURB34   3   ALCHRC34   3   ALTIME90   3
      ALUNIT90   3   ALDURA90   3   ALDURB90   3   ALCHRC90   3
      ALTIME91   3   ALUNIT91   3   ALDURA91   3   ALDURB91   3
      ALCHRC91   3   ALCNDRT    3   ALCHRONR   3

      /* AHB LENGTHS */

      SMKEV      3   SMKREG     3   SMKNOW     3   SMKSTAT2   3
      SMKQTNO    3   SMKQTTP    3   SMKQTY     3   CIGSDA1    3
      CIGDAMO    3   CIGSDA2    3   CIGSDAY    3   CIGQTYR    3
      ECIGEV2    3   ECIGCUR2   3   ECIG30D2   3   CIGAREV2   3
      CIGCUR2    3   CIG30D2    3   PIPEV2     3   PIPECUR2   3
      SMKLSTB1   3   SMKLSCR2   3   VIGNO      4   VIGTP      3
      VIGFREQW   3   VIGLNGNO   4   VIGLNGTP   3   VIGMIN     4
      MODNO      4   MODTP      3   MODFREQW   3   MODLNGNO   4
      MODLNGTP   3   MODMIN     4   STRNGNO    4   STRNGTP    3
      STRFREQW   3   ALC1YR     3   ALCLIFE    3   ALC12MNO   4
      ALC12MTP   3   ALC12MWK   3   ALC12MYR   4   ALCAMT     3
      ALCSTAT    3   ALC5UPN1   4   ALC5UPT1   3   ALC5UPY1   4
      BINGE1     3   AHEIGHT    3   AWEIGHTP   4   BMI        8

      /* AAU LENGTHS */

      AUSUALPL   3   APLKIND    3   AHCPLROU   3   AHCPLKND   3
      AHCCHGYR   3   AHCCHGHI   3   APRVTRYR   3   APRVTRFD   3
      ADRNANP    3   ADRNAI     3   AHCDLYR1   3   AHCDLYR2   3
      AHCDLYR3   3   AHCDLYR4   3   AHCDLYR5   3   AHCAFYR1   3
      AHCAFYR2   3   AHCAFYR3   3   AHCAFYR4   3   AHCAFYR5   3
      AHCAFYR6   3   AWORPAY    3   AHICOMP    3   ARX12MO    3
      ARX12_1    3   ARX12_2    3   ARX12_3    3   ARX12_4    3
      ARX12_5    3   ARX12_6    3   ADNLONG2   3   AHCSYR1    3
      AHCSYR2    3   AHCSYR3    3   AHCSYR4    3   AHCSYR5    3
      AHCSYR6    3   AHCSYR7    3   AHCSYR8    3   AHCSYR9    3
      AHCSYR10   3   AHERNOY2   3   AERVISND   3   AERHOS     3
      AERREA1R   3   AERREA2R   3   AERREA3R   3   AERREA4R   3
      AERREA5R   3   AERREA6R   3   AERREA7R   3   AERREA8R   3
      AHCHYR     3   AHCHMOYR   3   AHCHNOY2   3   AHCNOYR2   3
      ASRGYR     3   ASRGNOYP   3   AMDLONGR   3   HIT1A      3
      HIT2A      3   HIT3A      3   HIT4A      3   HIT5A      3
      FLUVACYR   3   FLUVACTP   3   FLUVAC_M   3   FLUVAC_Y   4
      FLUSHPG1   3   FLUSHPG2   3   SHTPNUYR   3   APOX       3
      APOX12MO   3   AHEP       3   AHEPLIV    3   AHEPBTST   3
      SHTHEPB    3   SHEPDOS    3   SHTHEPA    3   SHEPANUM   3
      AHEPCTST   3   AHEPCRES   3   SHINGLES   3   SHTTD      3
      SHTTDAP2   3   SHTHPV2    3   SHHPVDOS   3   AHPVAGE    4
      LIVEV      3   TRAVEL     3   WRKHLTH2   3   WRKDIR     3
      APSBPCHK   3   APSCHCHK   3   APSBSCHK   3   APSPAP     3
      APSMAM     3   APSCOL     3   APSDIET    3   APSSMKC    3
      AINDINS2   3   AINDPRCH   3   AINDWHO    3   AINDDIF1   3
      AINDDIF2   3   AEXCHNG    3   CLAS1      3   CLAS2      3
      CLAS3      3   CLAS4      3   CLAS5      3

      /* ASI LENGTHS */

      ASICPUSE   3   ASISATHC   3   ASITENUR   3   ASINHELP   3
      ASINCNTO   3   ASINTRU    3   ASINKNT    3   ASISIM     3
      ASISIF     3   ASIRETR    3   ASIMEDC    3   ASISTLV    3
      ASICNHC    3   ASICCOLL   3   ASINBILL   3   ASIHCST    3
      ASICCMP    3   ASISLEEP   3   ASISLPFL   3   ASISLPST   3
      ASISLPMD   3   ASIREST    3   ASISAD     3   ASINERV    3
      ASIRSTLS   3   ASIHOPLS   3   ASIEFFRT   3   ASIWTHLS   3
      ASIMUCH    3   ASIHIVT    3   ASIHIVWN   3

      /* ACH LENGTHS */

      NAT_USM1   3   CHE_USM1   3   TRD_USM1   3   TR_USM21   3
      TR_USM22   3   TR_USM23   3   TR_USM24   3   TR_USM25   3
      TR_USM26   3   HOM_USM1   3   MBO_MAN1   3   MBO_MND1   3
      MBO_SPR1   3   MBO_IMG1   3   MBO_PRO1   3   YTQU_YG1   3
      YTQ_BTY1   3   YTQ_MDY1   3   YTQU_TA1   3   YTQ_BTT1   3
      YTQ_MDT1   3   YTQU_QG1   3   YTQ_BTQ1   3   YTQ_MDQ1   3

      /* AWB LENGTHS */

      AWEBUSE    3   AWEBOFNO   4   AWEBOFTP   3   AWEBEML    3
      AWEBMNO    4   AWEBMTP    3 ;

   * INPUT ALL VARIABLES;

   INPUT

      /* IDN LOCATIONS */

      RECTYPE       1 -   2    SRVY_YR       3 -   6
      HHX      $    7 -  12    INTV_QRT     13 -  13
      INTV_MON     14 -  15    FMX      $   16 -  17
      FPX      $   18 -  19    WTIA_SA      20 -  26 .1
      WTFA_SA      27 -  32

      /* UCF LOCATIONS */

      REGION       33 -  33    PSTRAT       34 -  36
      PPSU         37 -  39

      /* HHC LOCATIONS */

      SEX          40 -  40    HISPAN_I     41 -  42
      RACERPI2     43 -  44    MRACRPI2     45 -  46
      MRACBPI2     47 -  48    AGE_P        49 -  50


      /* FID LOCATIONS */

      R_MARITL     51 -  51    PAR_STAT     52 -  52


      /* AID LOCATIONS */

      PROXYSA      53 -  53    PROX1        54 -  54
      PROX2        55 -  55    LATEINTA     56 -  56


      /* FDB LOCATIONS */

      FDRN_FLG     57 -  57

      /* ASD LOCATIONS */

      DOINGLWA     58 -  58    WHYNOWKA     59 -  60
      EVERWRK      61 -  61    INDSTRN1     62 -  63
      INDSTRN2     64 -  65    OCCUPN1      66 -  67
      OCCUPN2      68 -  69    SUPERVIS     70 -  70
      WRKCATA      71 -  71    BUSINC1A     72 -  72
      LOCALL1B     73 -  74    YRSWRKPA     75 -  76
      WRKLONGH     77 -  77    HOURPDA      78 -  78
      PDSICKA      79 -  79    ONEJOB       80 -  80
      WRKLYR4      81 -  81

      /* ACN LOCATIONS */

      HYPEV        82 -  82    HYPDIFV      83 -  83
      HYPYR1       84 -  84    HYBPCKNO     85 -  86
      HYBPCKTP     87 -  87    HYBPLEV      88 -  88
      HYPMDEV2     89 -  89    HYPMED2      90 -  90
      CHLEV        91 -  91    CHLYR        92 -  92
      CLCKNO       93 -  94    CLCKTP       95 -  95
      CHLMDEV2     96 -  96    CHLMDNW2     97 -  97
      CHDEV        98 -  98    ANGEV        99 -  99
      MIEV        100 - 100    HRTEV       101 - 101
      STREV       102 - 102    EPHEV       103 - 103
      JAWP        104 - 104    WEA         105 - 105
      CHE         106 - 106    ARM         107 - 107
      BRTH        108 - 108    AHADO       109 - 109
      FACE        110 - 110    SPEAKING    111 - 111
      EYE         112 - 112    WALKING     113 - 113
      HEADACHE    114 - 114    ASTDO       115 - 115
      COPDEV      116 - 116    ASPMEDEV    117 - 117
      ASPMEDAD    118 - 118    ASPMDMED    119 - 119
      ASPONOWN    120 - 120    AASMEV      121 - 121
      AASSTILL    122 - 122    AASMYR      123 - 123
      AASERYR1    124 - 124    ULCEV       125 - 125
      ULCYR       126 - 126    CANEV       127 - 127
      CNKIND1     128 - 128    CNKIND2     129 - 129
      CNKIND3     130 - 130    CNKIND4     131 - 131
      CNKIND5     132 - 132    CNKIND6     133 - 133
      CNKIND7     134 - 134    CNKIND8     135 - 135
      CNKIND9     136 - 136    CNKIND10    137 - 137
      CNKIND11    138 - 138    CNKIND12    139 - 139
      CNKIND13    140 - 140    CNKIND14    141 - 141
      CNKIND15    142 - 142    CNKIND16    143 - 143
      CNKIND17    144 - 144    CNKIND18    145 - 145
      CNKIND19    146 - 146    CNKIND20    147 - 147
      CNKIND21    148 - 148    CNKIND22    149 - 149
      CNKIND23    150 - 150    CNKIND24    151 - 151
      CNKIND25    152 - 152    CNKIND26    153 - 153
      CNKIND27    154 - 154    CNKIND28    155 - 155
      CNKIND29    156 - 156    CNKIND30    157 - 157
      CNKIND31    158 - 158    CANAGE1     159 - 161
      CANAGE2     162 - 164    CANAGE3     165 - 167
      CANAGE4     168 - 170    CANAGE5     171 - 173
      CANAGE6     174 - 176    CANAGE7     177 - 179
      CANAGE8     180 - 182    CANAGE9     183 - 185
      CANAGE10    186 - 188    CANAGE11    189 - 191
      CANAGE12    192 - 194    CANAGE13    195 - 197
      CANAGE14    198 - 200    CANAGE15    201 - 203
      CANAGE16    204 - 206    CANAGE17    207 - 209
      CANAGE18    210 - 212    CANAGE19    213 - 215
      CANAGE20    216 - 218    CANAGE21    219 - 221
      CANAGE22    222 - 224    CANAGE23    225 - 227
      CANAGE24    228 - 230    CANAGE25    231 - 233
      CANAGE26    234 - 236    CANAGE27    237 - 239
      CANAGE28    240 - 242    CANAGE29    243 - 245
      CANAGE30    246 - 248    PREGEVER    249 - 249
      DBHVPAY     250 - 250    DBHVCLY     251 - 251
      DBHVWLY     252 - 252    DBHVPAN     253 - 253
      DBHVCLN     254 - 254    DBHVWLN     255 - 255
      DIBREL      256 - 256    DIBEV1      257 - 257
      DIBPRE2     258 - 258    DIBTEST     259 - 259
      DIBAGE1     260 - 261    DIFAGE2     262 - 263
      DIBTYPE     264 - 264    DIBPILL1    265 - 265
      INSLN1      266 - 266    DIBINS2     267 - 267
      DIBINS3     268 - 268    DIBINS4     269 - 269
      DIBGDM      270 - 270    DIBBABY     271 - 271
      DIBPRGM     272 - 272    DIBREFER    273 - 273
      DIBBEGIN    274 - 274    EPILEP1     275 - 275
      EPILEP2     276 - 276    EPILEP3     277 - 277
      EPILEP4     278 - 278    EPILEP5     279 - 279
      AHAYFYR     280 - 280    SINYR       281 - 281
      CBRCHYR     282 - 282    KIDWKYR     283 - 283
      LIVYR       284 - 284    JNTSYMP     285 - 285
      JMTHP1      286 - 286    JMTHP2      287 - 287
      JMTHP3      288 - 288    JMTHP4      289 - 289
      JMTHP5      290 - 290    JMTHP6      291 - 291
      JMTHP7      292 - 292    JMTHP8      293 - 293
      JMTHP9      294 - 294    JMTHP10     295 - 295
      JMTHP11     296 - 296    JMTHP12     297 - 297
      JMTHP13     298 - 298    JMTHP14     299 - 299
      JMTHP15     300 - 300    JMTHP16     301 - 301
      JMTHP17     302 - 302    JNTCHR      303 - 303
      JNTHP       304 - 304    ARTH1       305 - 305
      ARTHLMT     306 - 306    PAINECK     307 - 307
      PAINLB      308 - 308    PAINLEG     309 - 309
      PAINFACE    310 - 310    AMIGR       311 - 311
      ACOLD2W     312 - 312    AINTIL2W    313 - 313
      PREGNOW     314 - 314    PREGFLYR    315 - 315
      HRAIDNOW    316 - 316    HRAIDEV     317 - 317
      AHEARST1    318 - 318    AVISION     319 - 319
      ABLIND      320 - 320    VIM_DREV    321 - 321
      VIMLS_DR    322 - 322    VIM_CAEV    323 - 323
      VIMLS_CA    324 - 324    VIMCSURG    325 - 325
      VIM_GLEV    326 - 326    VIMLS_GL    327 - 327
      VIM_MDEV    328 - 328    VIMLS_MD    329 - 329
      VIMGLASS    330 - 330    VIMREAD     331 - 331
      VIMDRIVE    332 - 332    AVISREH     333 - 333
      AVISDEV     334 - 334    AVDF_NWS    335 - 335
      AVDF_CLS    336 - 336    AVDF_NIT    337 - 337
      AVDF_DRV    338 - 338    AVDF_PER    339 - 339
      AVDF_CRD    340 - 340    AVISEXAM    341 - 341
      AVISACT     342 - 342    AVISPROT    343 - 343
      LUPPRT      344 - 344    CHPAIN6M    345 - 345
      PAINLMT     346 - 346

      /* AHS LOCATIONS */

      WKDAYR      347 - 349    BEDDAYR     350 - 352
      AHSTATYR    353 - 353    SPECEQ      354 - 354
      FLWALK      355 - 355    FLCLIMB     356 - 356
      FLSTAND     357 - 357    FLSIT       358 - 358
      FLSTOOP     359 - 359    FLREACH     360 - 360
      FLGRASP     361 - 361    FLCARRY     362 - 362
      FLPUSH      363 - 363    FLSHOP      364 - 364
      FLSOCL      365 - 365    FLRELAX     366 - 366
      FLA1AR      367 - 367    AFLHCA1     368 - 368
      AFLHCA2     369 - 369    AFLHCA3     370 - 370
      AFLHCA4     371 - 371    AFLHCA5     372 - 372
      AFLHCA6     373 - 373    AFLHCA7     374 - 374
      AFLHCA8     375 - 375    AFLHCA9     376 - 376
      AFLHCA10    377 - 377    AFLHCA11    378 - 378
      AFLHCA12    379 - 379    AFLHCA13    380 - 380
      ALHCA14A    381 - 381    AFLHCA15    382 - 382
      AFLHCA16    383 - 383    AFLHCA17    384 - 384
      AFLHCA18    385 - 385    AFLHC19_    386 - 386
      AFLHC20_    387 - 387    AFLHC21_    388 - 388
      AFLHC22_    389 - 389    AFLHC23_    390 - 390
      AFLHC24_    391 - 391    AFLHC25_    392 - 392
      AFLHC26_    393 - 393    AFLHC27_    394 - 394
      AFLHC28_    395 - 395    AFLHC29_    396 - 396
      AFLHC30_    397 - 397    AFLHC31_    398 - 398
      AFLHC32_    399 - 399    AFLHC33_    400 - 400
      AFLHC34_    401 - 401    AFLHCA90    402 - 402
      AFLHCA91    403 - 403    ALTIME1     404 - 405
      ALUNIT1     406 - 406    ALDURA1     407 - 408
      ALDURB1     409 - 409    ALCHRC1     410 - 410
      ALTIME2     411 - 412    ALUNIT2     413 - 413
      ALDURA2     414 - 415    ALDURB2     416 - 416
      ALCHRC2     417 - 417    ALTIME3     418 - 419
      ALUNIT3     420 - 420    ALDURA3     421 - 422
      ALDURB3     423 - 423    ALCHRC3     424 - 424
      ALTIME4     425 - 426    ALUNIT4     427 - 427
      ALDURA4     428 - 429    ALDURB4     430 - 430
      ALCHRC4     431 - 431    ALTIME5     432 - 433
      ALUNIT5     434 - 434    ALDURA5     435 - 436
      ALDURB5     437 - 437    ALCHRC5     438 - 438
      ALTIME6     439 - 440    ALUNIT6     441 - 441
      ALDURA6     442 - 443    ALDURB6     444 - 444
      ALCHRC6     445 - 445    ALTIME7     446 - 447
      ALUNIT7     448 - 448    ALDURA7     449 - 450
      ALDURB7     451 - 451    ALCHRC7     452 - 452
      ALTIME8     453 - 454    ALUNIT8     455 - 455
      ALDURA8     456 - 457    ALDURB8     458 - 458
      ALCHRC8     459 - 459    ALTIME9     460 - 461
      ALUNIT9     462 - 462    ALDURA9     463 - 464
      ALDURB9     465 - 465    ALCHRC9     466 - 466
      ALTIME10    467 - 468    ALUNIT10    469 - 469
      ALDURA10    470 - 471    ALDURB10    472 - 472
      ALCHRC10    473 - 473    ALTIME11    474 - 475
      ALUNIT11    476 - 476    ALDURA11    477 - 478
      ALDURB11    479 - 479    ALCHRC11    480 - 480
      ALTIME12    481 - 482    ALUNIT12    483 - 483
      ALDURA12    484 - 485    ALDURB12    486 - 486
      ALCHRC12    487 - 487    ALTIME13    488 - 489
      ALUNIT13    490 - 490    ALDURA13    491 - 492
      ALDURB13    493 - 493    ALCHRC13    494 - 494
      ATIME14A    495 - 496    AUNIT14A    497 - 497
      ADURA14A    498 - 499    ADURB14A    500 - 500
      ACHRC14A    501 - 501    ALTIME15    502 - 503
      ALUNIT15    504 - 504    ALDURA15    505 - 506
      ALDURB15    507 - 507    ALCHRC15    508 - 508
      ALTIME16    509 - 510    ALUNIT16    511 - 511
      ALDURA16    512 - 513    ALDURB16    514 - 514
      ALCHRC16    515 - 515    ALTIME17    516 - 517
      ALUNIT17    518 - 518    ALDURA17    519 - 520
      ALDURB17    521 - 521    ALCHRC17    522 - 522
      ALTIME18    523 - 524    ALUNIT18    525 - 525
      ALDURA18    526 - 527    ALDURB18    528 - 528
      ALCHRC18    529 - 529    ALTIME19    530 - 531
      ALUNIT19    532 - 532    ALDURA19    533 - 534
      ALDURB19    535 - 535    ALCHRC19    536 - 536
      ALTIME20    537 - 538    ALUNIT20    539 - 539
      ALDURA20    540 - 541    ALDURB20    542 - 542
      ALCHRC20    543 - 543    ALTIME21    544 - 545
      ALUNIT21    546 - 546    ALDURA21    547 - 548
      ALDURB21    549 - 549    ALCHRC21    550 - 550
      ALTIME22    551 - 552    ALUNIT22    553 - 553
      ALDURA22    554 - 555    ALDURB22    556 - 556
      ALCHRC22    557 - 557    ALTIME23    558 - 559
      ALUNIT23    560 - 560    ALDURA23    561 - 562
      ALDURB23    563 - 563    ALCHRC23    564 - 564
      ALTIME24    565 - 566    ALUNIT24    567 - 567
      ALDURA24    568 - 569    ALDURB24    570 - 570
      ALCHRC24    571 - 571    ALTIME25    572 - 573
      ALUNIT25    574 - 574    ALDURA25    575 - 576
      ALDURB25    577 - 577    ALCHRC25    578 - 578
      ALTIME26    579 - 580    ALUNIT26    581 - 581
      ALDURA26    582 - 583    ALDURB26    584 - 584
      ALCHRC26    585 - 585    ALTIME27    586 - 587
      ALUNIT27    588 - 588    ALDURA27    589 - 590
      ALDURB27    591 - 591    ALCHRC27    592 - 592
      ALTIME28    593 - 594    ALUNIT28    595 - 595
      ALDURA28    596 - 597    ALDURB28    598 - 598
      ALCHRC28    599 - 599    ALTIME29    600 - 601
      ALUNIT29    602 - 602    ALDURA29    603 - 604
      ALDURB29    605 - 605    ALCHRC29    606 - 606
      ALTIME30    607 - 608    ALUNIT30    609 - 609
      ALDURA30    610 - 611    ALDURB30    612 - 612
      ALCHRC30    613 - 613    ALTIME31    614 - 615
      ALUNIT31    616 - 616    ALDURA31    617 - 618
      ALDURB31    619 - 619    ALCHRC31    620 - 620
      ALTIME32    621 - 622    ALUNIT32    623 - 623
      ALDURA32    624 - 625    ALDURB32    626 - 626
      ALCHRC32    627 - 627    ALTIME33    628 - 629
      ALUNIT33    630 - 630    ALDURA33    631 - 632
      ALDURB33    633 - 633    ALCHRC33    634 - 634
      ALTIME34    635 - 636    ALUNIT34    637 - 637
      ALDURA34    638 - 639    ALDURB34    640 - 640
      ALCHRC34    641 - 641    ALTIME90    642 - 643
      ALUNIT90    644 - 644    ALDURA90    645 - 646
      ALDURB90    647 - 647    ALCHRC90    648 - 648
      ALTIME91    649 - 650    ALUNIT91    651 - 651
      ALDURA91    652 - 653    ALDURB91    654 - 654
      ALCHRC91    655 - 655    ALCNDRT     656 - 656
      ALCHRONR    657 - 657

      /* AHB LOCATIONS */

      SMKEV       658 - 658    SMKREG      659 - 660
      SMKNOW      661 - 661    SMKSTAT2    662 - 662
      SMKQTNO     663 - 664    SMKQTTP     665 - 665
      SMKQTY      666 - 667    CIGSDA1     668 - 669
      CIGDAMO     670 - 671    CIGSDA2     672 - 673
      CIGSDAY     674 - 675    CIGQTYR     676 - 676
      ECIGEV2     677 - 677    ECIGCUR2    678 - 678
      ECIG30D2    679 - 680    CIGAREV2    681 - 681
      CIGCUR2     682 - 682    CIG30D2     683 - 684
      PIPEV2      685 - 685    PIPECUR2    686 - 686
      SMKLSTB1    687 - 687    SMKLSCR2    688 - 688
      VIGNO       689 - 691    VIGTP       692 - 692
      VIGFREQW    693 - 694    VIGLNGNO    695 - 697
      VIGLNGTP    698 - 698    VIGMIN      699 - 701
      MODNO       702 - 704    MODTP       705 - 705
      MODFREQW    706 - 707    MODLNGNO    708 - 710
      MODLNGTP    711 - 711    MODMIN      712 - 714
      STRNGNO     715 - 717    STRNGTP     718 - 718
      STRFREQW    719 - 720    ALC1YR      721 - 721
      ALCLIFE     722 - 722    ALC12MNO    723 - 725
      ALC12MTP    726 - 726    ALC12MWK    727 - 728
      ALC12MYR    729 - 731    ALCAMT      732 - 733
      ALCSTAT     734 - 735    ALC5UPN1    736 - 738
      ALC5UPT1    739 - 739    ALC5UPY1    740 - 742
      BINGE1      743 - 744    AHEIGHT     745 - 746
      AWEIGHTP    747 - 749    BMI         750 - 753 .2


      /* AAU LOCATIONS */

      AUSUALPL    754 - 754    APLKIND     755 - 755
      AHCPLROU    756 - 756    AHCPLKND    757 - 757
      AHCCHGYR    758 - 758    AHCCHGHI    759 - 759
      APRVTRYR    760 - 760    APRVTRFD    761 - 761
      ADRNANP     762 - 762    ADRNAI      763 - 763
      AHCDLYR1    764 - 764    AHCDLYR2    765 - 765
      AHCDLYR3    766 - 766    AHCDLYR4    767 - 767
      AHCDLYR5    768 - 768    AHCAFYR1    769 - 769
      AHCAFYR2    770 - 770    AHCAFYR3    771 - 771
      AHCAFYR4    772 - 772    AHCAFYR5    773 - 773
      AHCAFYR6    774 - 774    AWORPAY     775 - 775
      AHICOMP     776 - 776    ARX12MO     777 - 777
      ARX12_1     778 - 778    ARX12_2     779 - 779
      ARX12_3     780 - 780    ARX12_4     781 - 781
      ARX12_5     782 - 782    ARX12_6     783 - 783
      ADNLONG2    784 - 784    AHCSYR1     785 - 785
      AHCSYR2     786 - 786    AHCSYR3     787 - 787
      AHCSYR4     788 - 788    AHCSYR5     789 - 789
      AHCSYR6     790 - 790    AHCSYR7     791 - 791
      AHCSYR8     792 - 792    AHCSYR9     793 - 793
      AHCSYR10    794 - 794    AHERNOY2    795 - 796
      AERVISND    797 - 797    AERHOS      798 - 798
      AERREA1R    799 - 799    AERREA2R    800 - 800
      AERREA3R    801 - 801    AERREA4R    802 - 802
      AERREA5R    803 - 803    AERREA6R    804 - 804
      AERREA7R    805 - 805    AERREA8R    806 - 806
      AHCHYR      807 - 807    AHCHMOYR    808 - 809
      AHCHNOY2    810 - 811    AHCNOYR2    812 - 813
      ASRGYR      814 - 814    ASRGNOYP    815 - 816
      AMDLONGR    817 - 817    HIT1A       818 - 818
      HIT2A       819 - 819    HIT3A       820 - 820
      HIT4A       821 - 821    HIT5A       822 - 822
      FLUVACYR    823 - 823    FLUVACTP    824 - 824
      FLUVAC_M    825 - 826    FLUVAC_Y    827 - 830
      FLUSHPG1    831 - 831    FLUSHPG2    832 - 832
      SHTPNUYR    833 - 833    APOX        834 - 834
      APOX12MO    835 - 835    AHEP        836 - 836
      AHEPLIV     837 - 837    AHEPBTST    838 - 838
      SHTHEPB     839 - 839    SHEPDOS     840 - 840
      SHTHEPA     841 - 841    SHEPANUM    842 - 843
      AHEPCTST    844 - 844    AHEPCRES    845 - 845
      SHINGLES    846 - 846    SHTTD       847 - 847
      SHTTDAP2    848 - 848    SHTHPV2     849 - 849
      SHHPVDOS    850 - 851    AHPVAGE     852 - 854
      LIVEV       855 - 855    TRAVEL      856 - 856
      WRKHLTH2    857 - 857    WRKDIR      858 - 858
      APSBPCHK    859 - 859    APSCHCHK    860 - 860
      APSBSCHK    861 - 861    APSPAP      862 - 862
      APSMAM      863 - 863    APSCOL      864 - 864
      APSDIET     865 - 865    APSSMKC     866 - 866
      AINDINS2    867 - 867    AINDPRCH    868 - 868
      AINDWHO     869 - 869    AINDDIF1    870 - 870
      AINDDIF2    871 - 871    AEXCHNG     872 - 872
      CLAS1       873 - 873    CLAS2       874 - 874
      CLAS3       875 - 875    CLAS4       876 - 876
      CLAS5       877 - 877

      /* ASI LOCATIONS */

      ASICPUSE    878 - 878    ASISATHC    879 - 879
      ASITENUR    880 - 880    ASINHELP    881 - 881
      ASINCNTO    882 - 882    ASINTRU     883 - 883
      ASINKNT     884 - 884    ASISIM      885 - 885
      ASISIF      886 - 886    ASIRETR     887 - 887
      ASIMEDC     888 - 888    ASISTLV     889 - 889
      ASICNHC     890 - 890    ASICCOLL    891 - 891
      ASINBILL    892 - 892    ASIHCST     893 - 893
      ASICCMP     894 - 894    ASISLEEP    895 - 896
      ASISLPFL    897 - 898    ASISLPST    899 - 900
      ASISLPMD    901 - 902    ASIREST     903 - 904
      ASISAD      905 - 905    ASINERV     906 - 906
      ASIRSTLS    907 - 907    ASIHOPLS    908 - 908
      ASIEFFRT    909 - 909    ASIWTHLS    910 - 910
      ASIMUCH     911 - 911    ASIHIVT     912 - 912
      ASIHIVWN    913 - 914

      /* ACH LOCATIONS */

      NAT_USM1    915 - 915    CHE_USM1    916 - 916
      TRD_USM1    917 - 917    TR_USM21    918 - 918
      TR_USM22    919 - 919    TR_USM23    920 - 920
      TR_USM24    921 - 921    TR_USM25    922 - 922
      TR_USM26    923 - 923    HOM_USM1    924 - 924
      MBO_MAN1    925 - 925    MBO_MND1    926 - 926
      MBO_SPR1    927 - 927    MBO_IMG1    928 - 928
      MBO_PRO1    929 - 929    YTQU_YG1    930 - 930
      YTQ_BTY1    931 - 931    YTQ_MDY1    932 - 932
      YTQU_TA1    933 - 933    YTQ_BTT1    934 - 934
      YTQ_MDT1    935 - 935    YTQU_QG1    936 - 936
      YTQ_BTQ1    937 - 937    YTQ_MDQ1    938 - 938


      /* AWB LOCATIONS */

      AWEBUSE     939 - 939    AWEBOFNO    940 - 942
      AWEBOFTP    943 - 943    AWEBEML     944 - 944
      AWEBMNO     945 - 947    AWEBMTP     948 - 948
;

   * DEFINE VARIABLE LABELS;

   LABEL

      /* IDN LABELS */

      RECTYPE    ="File type identifier"
      SRVY_YR    ="Year of National Health Interview Survey"
      HHX        ="Household Number"
      INTV_QRT   ="Interview Quarter"
      INTV_MON   ="Assignment/Interview Month"
      FMX        ="Family Number"
      FPX        ="Person Number (Within family)"
      WTIA_SA    ="Weight - Interim Annual"
      WTFA_SA    ="Weight - Final Annual"

      /* UCF LABELS */

      REGION     ="Region"
      PSTRAT     ="Pseudo-stratum for public-use file variance estimation"
      PPSU       ="Pseudo-PSU for public-use file variance estimation"

      /* HHC LABELS */

      SEX        ="Sex"
      HISPAN_I   ="Hispanic subgroup detail"
      RACERPI2   ="OMB groups w/multiple race"
      MRACRPI2   ="Race coded to single/multiple race group"
      MRACBPI2   ="Race coded to single/multiple race group"
      AGE_P      ="Age"

      /* FID LABELS */

      R_MARITL   ="Marital Status"
      PAR_STAT   ="Sample adult is parent to 1+ minor child(ren) in the family"

      /* AID LABELS */

      PROXYSA    ="Sample adult status"
      PROX1      ="Knowledgeable proxy for Sample Adult available"
      PROX2      ="Relationship of SA proxy to SA"
      LATEINTA   ="Late Sample Adult interviews"

      /* FDB LABELS */

      FDRN_FLG   ="Disability Questions flag"

      /* ASD LABELS */

      DOINGLWA   ="Corrected employment status last week"
      WHYNOWKA   ="Main reason for not working last week"
      EVERWRK    ="Ever worked"
      INDSTRN1   ="Detailed industry classification based on 2012 Census codes"
      INDSTRN2   ="Simple industry classification based on 2012 Census codes"
      OCCUPN1    ="Detailed occupation classification based on 2010 Census Codes
"
      OCCUPN2    ="Simple occupation classification based on 2010 Census codes"
      SUPERVIS   ="Supervise other employees as part of job"
      WRKCATA    ="Class of worker"
      BUSINC1A   ="Current job an incorporated business"
      LOCALL1B   ="Number of employees at work"
      YRSWRKPA   ="Number of years on the job"
      WRKLONGH   ="Current/most recent job also longest held job"
      HOURPDA    ="Paid by the hour at current or most recent job"
      PDSICKA    ="Paid sick leave at current or most recent job"
      ONEJOB     ="Have more than one job"
      WRKLYR4    ="Work status: last week, past 12 months"

      /* ACN LABELS */

      HYPEV      ="Ever been told you have hypertension"
      HYPDIFV    ="Ever had hypertension on 2+ visits"
      HYPYR1     ="Had hypertension, past 12 months"
      HYBPCKNO   =
"Last time blood pressure checked by health professional (# units)"
      HYBPCKTP   =
"Last time blood pressure checked by health professional (time units)"
      HYBPLEV    ="Results of last blood pressure check"
      HYPMDEV2   ="Ever prescribed medicine for high blood pressure"
      HYPMED2    ="Now taking prescribed medicine for high blood pressure"
      CHLEV      ="Ever told you had high cholesterol"
      CHLYR      ="Had high cholesterol, past 12 months"
      CLCKNO     =
"How long since blood cholesterol checked by health professional (# units)"
      CLCKTP     =
"How long since blood cholesterol checked by health professional (time units)"
      CHLMDEV2   ="Ever prescribed medicine to lower cholesterol"
      CHLMDNW2   ="Now taking prescribed medicine to lower cholesterol"
      CHDEV      ="Ever been told you had coronary heart disease"
      ANGEV      ="Ever been told you had angina pectoris"
      MIEV       ="Ever been told you had a heart attack"
      HRTEV      ="Ever been told you had a heart condition/disease"
      STREV      ="Ever been told you had a stroke"
      EPHEV      ="Ever been told you had emphysema"
      JAWP       ="Jaw, neck, or back pain a symptom of heart attack"
      WEA        ="Feeling weak, lightheaded, or faint a symptom of heart attack
"
      CHE        ="Chest pain or discomfort a symptom of heart attack"
      ARM        =
"Pain or discomfort in arms or shoulder a symptom of heart attack"
      BRTH       ="Shortness of breath a symptom of heart attack"
      AHADO      ="What is best thing to do if someone is having a heart attack"
      FACE       ="Sudden numbness of face/arm/leg a symptom of having stroke"
      SPEAKING   =
"Sudden confusion or trouble speaking a symptom of having stroke"
      EYE        =
"Sudden trouble seeing in one/both eyes a symptom of having stroke"
      WALKING    =
"Sudden trouble walking/dizziness/loss of balance  symptom of having stroke"
      HEADACHE   =
"Sudden severe headache with no known cause a symptom of having stroke"
      ASTDO      ="What is best thing to do if someone is having a stroke"
      COPDEV     ="Ever been told you had COPD"
      ASPMEDEV   ="Ever been told to take low-dose aspirin"
      ASPMEDAD   ="Following low-dose aspirin advice"
      ASPMDMED   ="Advised to stop taking low-dose aspirin"
      ASPONOWN   ="Taking low-dose aspirin on own"
      AASMEV     ="Ever been told you had asthma"
      AASSTILL   ="Still have asthma"
      AASMYR     ="Had an asthma episode/attack past 12 m"
      AASERYR1   ="Had visit to ER due to asthma past 12 m"
      ULCEV      ="Ever been told you have an ulcer"
      ULCYR      ="Had ulcer in past 12 m"
      CANEV      ="Ever told by a doctor you had cancer"
      CNKIND1    ="What kind of cancer ... Bladder"
      CNKIND2    ="What kind of cancer ... Blood"
      CNKIND3    ="What kind of cancer ... Bone"
      CNKIND4    ="What kind of cancer ... Brain"
      CNKIND5    ="What kind of cancer ... Breast"
      CNKIND6    ="What kind of cancer ... Cervix"
      CNKIND7    ="What kind of cancer ... Colon"
      CNKIND8    ="What kind of cancer ... Esophagus"
      CNKIND9    ="What kind of cancer ... Gallbladder"
      CNKIND10   ="What kind of cancer ... Kidney"
      CNKIND11   ="What kind of cancer ... larynx-windpipe"
      CNKIND12   ="What kind of cancer ... Leukemia"
      CNKIND13   ="What kind of cancer ... Liver"
      CNKIND14   ="What kind of cancer ... Lung"
      CNKIND15   ="What kind of cancer ... Lymphoma"
      CNKIND16   ="What kind of cancer ... Melanoma"
      CNKIND17   ="What kind of cancer ... mouth/tongue/lip"
      CNKIND18   ="What kind of cancer ... Ovary"
      CNKIND19   ="What kind of cancer ... Pancreas"
      CNKIND20   ="What kind of cancer ... Prostate"
      CNKIND21   ="What kind of cancer ... Rectum"
      CNKIND22   ="What kind of cancer ... skin (non-melanoma)"
      CNKIND23   ="What kind of cancer ... skin (DK kind)"
      CNKIND24   ="What kind of cancer ... soft tissue (muscle or fat)"
      CNKIND25   ="What kind of cancer ... Stomach"
      CNKIND26   ="What kind of cancer ... Testis"
      CNKIND27   ="What kind of cancer ... throat - pharynx"
      CNKIND28   ="What kind of cancer ... Thyroid"
      CNKIND29   ="What kind of cancer ... Uterus"
      CNKIND30   ="What kind of cancer ... Other"
      CNKIND31   ="What kind of cancer ... more than 3 kinds"
      CANAGE1    ="Age first diagnosed w/bladder cancer"
      CANAGE2    ="Age first diagnosed w/blood cancer"
      CANAGE3    ="Age first diagnosed w/bone cancer"
      CANAGE4    ="Age first diagnosed w/brain cancer"
      CANAGE5    ="Age first diagnosed w/breast cancer"
      CANAGE6    ="Age first diagnosed w/cervical cancer"
      CANAGE7    ="Age first diagnosed w/colon cancer"
      CANAGE8    ="Age first diagnosed w/esophageal cancer"
      CANAGE9    ="Age first diagnosed w/gallbladder cancer"
      CANAGE10   ="Age first diagnosed w/kidney cancer"
      CANAGE11   ="Age first diagnosed w/larynx-windpipe cancer"
      CANAGE12   ="Age first diagnosed w/leukemia"
      CANAGE13   ="Age first diagnosed w/liver cancer"
      CANAGE14   ="Age first diagnosed w/lung cancer"
      CANAGE15   ="Age first diagnosed w/lymphoma"
      CANAGE16   ="Age first diagnosed w/melanoma"
      CANAGE17   ="Age first diagnosed w/mouth/tongue/lip cancer"
      CANAGE18   ="Age first diagnosed w/ovarian cancer"
      CANAGE19   ="Age first diagnosed w/pancreatic cancer"
      CANAGE20   ="Age first diagnosed w/prostate cancer"
      CANAGE21   ="Age first diagnosed w/rectal cancer"
      CANAGE22   ="Age first diagnosed w/skin (non-melanoma) cancer"
      CANAGE23   ="Age first diagnosed w/skin (DK kind) cancer"
      CANAGE24   ="Age first diagnosed w/soft tissue cancer"
      CANAGE25   ="Age first diagnosed w/stomach cancer"
      CANAGE26   ="Age first diagnosed w/testicular cancer"
      CANAGE27   ="Age first diagnosed w/throat/pharynx cancer"
      CANAGE28   ="Age first diagnosed w/thyroid cancer"
      CANAGE29   ="Age first diagnosed w/uterine cancer"
      CANAGE30   ="Age first diagnosed w/other cancer"
      PREGEVER   ="Ever been pregnant"
      DBHVPAY    ="Told to increase physical activity, past 12 m"
      DBHVCLY    ="Told to reduce fat/calories in diet, past 12 m"
      DBHVWLY    ="Told to participate in weight loss program, past 12 m"
      DBHVPAN    ="Currently increasing physical activity"
      DBHVCLN    ="Currently reducing fat/calories in diet"
      DBHVWLN    ="Currently participating in weight loss program"
      DIBREL     ="Blood relative ever had diabetes"
      DIBEV1     ="Ever been told that you have diabetes"
      DIBPRE2    ="Ever had prediabetes or other symptoms"
      DIBTEST    ="Time since last had blood test for high blood sugar/diabetes"
      DIBAGE1    ="Age first diagnosed w/diabetes"
      DIFAGE2    ="Years since first diagnosed w/diabetes"
      DIBTYPE    ="Type of diabetes"
      DIBPILL1   ="NOW taking diabetic pills"
      INSLN1     ="NOW taking insulin"
      DIBINS2    =
"Length of time before started insulin after diagnosed w/ diabetes"
      DIBINS3    ="Ever stopped taking insulin for more than 6 m"
      DIBINS4    ="Stopped taking insulin first year after diagnosed w/ diabetes
"
      DIBGDM     ="First told you had diabetes during pregnancy"
      DIBBABY    ="Ever had a baby that weighed 9 lbs. or more"
      DIBPRGM    =
"Ever participated in year-long program to prevent Type 2 diabetes"
      DIBREFER   ="Ever referred to program to prevent Type 2 diabetes"
      DIBBEGIN   =
"Interested in beginning year-long program to prevent Type 2 diabetes"
      EPILEP1    ="Ever told that you have a seizure disorder or epilepsy"
      EPILEP2    =
"Currently taking  medicine to control your seizure disorder or epilepsy"
      EPILEP3    ="Number of seizures of any type in past year"
      EPILEP4    ="Seen a neurologist or epilepsy specialist  in past year"
      EPILEP5    =
"Did epilepsy or its treatment interfere with normal activities, past 30 days"
      AHAYFYR    ="Told that you had hay fever, past 12 m"
      SINYR      ="Told that you had sinusitis, past 12 m"
      CBRCHYR    ="Told you had chronic bronchitis, 12 m"
      KIDWKYR    ="Told you had weak/failing kidneys, 12 m"
      LIVYR      ="Told you had liver condition, past 12 m"
      JNTSYMP    ="Symptoms of joint pain/aching/stiffness past 30 d"
      JMTHP1     ="Which joint affected...shoulder-right"
      JMTHP2     ="Which joint affected...shoulder-left"
      JMTHP3     ="Which joint affected...elbow-right"
      JMTHP4     ="Which joint affected...elbow-left"
      JMTHP5     ="Which joint affected...hip-right"
      JMTHP6     ="Which joint affected...hip-left"
      JMTHP7     ="Which joint affected...wrist-right"
      JMTHP8     ="Which joint affected...wrist-left"
      JMTHP9     ="Which joint affected...knee-right"
      JMTHP10    ="Which joint affected...knee-left"
      JMTHP11    ="Which joint affected...ankle-right"
      JMTHP12    ="Which joint affected...ankle-left"
      JMTHP13    ="Which joint affected...toes-right"
      JMTHP14    ="Which joint affected...toes-left"
      JMTHP15    ="Which joint affected...fingers/thumb-right"
      JMTHP16    ="Which joint affected...fingers/thumb-left"
      JMTHP17    ="Which joint affected...other joint not listed"
      JNTCHR     ="Joint symptoms begin more than 3 months ago"
      JNTHP      ="Ever seen doctor or health professional for joint symptoms"
      ARTH1      ="Ever been told you had arthritis"
      ARTHLMT    ="Limited due to arthritis or joint symptoms"
      PAINECK    ="Had neck pain, past 3 months"
      PAINLB     ="Had low back pain, past 3 months"
      PAINLEG    ="Pain spread down leg/below knees"
      PAINFACE   ="Had pain in jaw/front of ear, past 3 months"
      AMIGR      ="Had severe headache/migraine, past 3 m"
      ACOLD2W    ="Had a head/chest cold past 2 w"
      AINTIL2W   ="Had stomach prob w/vomit/diarrhea, 2 w"
      PREGNOW    ="Currently pregnant"
      PREGFLYR   ="Recently pregnant"
      HRAIDNOW   ="Now use a hearing aid"
      HRAIDEV    ="Ever used a hearing aid if not now using"
      AHEARST1   ="Hearing w/o hearing aid"
      AVISION    ="Trouble seeing even w/glasses/lenses"
      ABLIND     ="Blind or unable to see at all"
      VIM_DREV   ="EVER been told you had diabetic retinopathy"
      VIMLS_DR   ="Lost vision because of diabetic retinopathy"
      VIM_CAEV   ="EVER been told you had cataracts"
      VIMLS_CA   ="Lost vision because of cataracts"
      VIMCSURG   ="Ever had cataract surgery"
      VIM_GLEV   ="EVER been told you had glaucoma"
      VIMLS_GL   ="Lost vision because of glaucoma"
      VIM_MDEV   ="EVER been told you had macular degeneration"
      VIMLS_MD   ="Lost vision because of macular degeneration"
      VIMGLASS   ="Currently wear eyeglasses or contact lenses?"
      VIMREAD    ="Wear eyeglasses or contact lenses to read/write/cook/sew?"
      VIMDRIVE   =
"Wear eyeglasses or contact lenses to drive/read signs/watch TV?"
      AVISREH    ="Use any vision rehabilitation services"
      AVISDEV    =
"Use any adaptive devices such as magnifiers, talking materials"
      AVDF_NWS   =
"Even when wearing glasses difficult for you to read newspapers"
      AVDF_CLS   =
"Even when wearing glasses difficult for you to see up close/cook/sew"
      AVDF_NIT   =
"Even when wearing glasses difficult for you to go down stairs in dim light"
      AVDF_DRV   =
"Even when wearing glasses difficult for you to drive during daytime"
      AVDF_PER   =
"Even when wearing glasses difficult for you to notice objects while walking"
      AVDF_CRD   =
"Even when wearing glasses difficult for you to find something on a crowded shel
f"
      AVISEXAM   ="Last time you had an eye exam (pupils dilated)"
      AVISACT    =
"Participate in sports/other activities that can cause eye injury"
      AVISPROT   =
"When doing these activities, on average, do you wear eye protection"
      LUPPRT     ="Lost all upper & lower natural teeth"
      CHPAIN6M   ="How often did you have pain, past 6 m"
      PAINLMT    ="How often did pain limit life/work activities, past 6 m"

      /* AHS LABELS */

      WKDAYR     ="Number of work loss days, past 12 months"
      BEDDAYR    ="Number of bed days, past 12 months"
      AHSTATYR   ="Health better/worse/same, compared w/ 12 months ago"
      SPECEQ     ="Have health problem that requires special equipment"
      FLWALK     ="How difficult to walk 1/4 mile without special equipment"
      FLCLIMB    ="How difficult to climb 10 steps without special equipment"
      FLSTAND    ="How difficult to stand 2 hours without special equipment"
      FLSIT      ="How difficult to sit 2 hours without special equipment"
      FLSTOOP    =
"How difficult to stoop, bend or kneel without special equipment"
      FLREACH    ="How difficult to reach over head without special equipment"
      FLGRASP    =
"How difficult to grasp small objects without special equipment"
      FLCARRY    ="How difficult to lift/carry 10 lbs without special equipment"
      FLPUSH     ="How difficult to push large objects without special equipment
"
      FLSHOP     ="How difficult to go out to events without special equipment"
      FLSOCL     =
"How difficult to participate in social activities without special equipment"
      FLRELAX    ="How difficult to relax at home without special equipment"
      FLA1AR     ="Any functional limitation, all conditions"
      AFLHCA1    ="Vision/problem seeing causes difficulty with activity"
      AFLHCA2    ="Hearing problem causes difficulty with activity"
      AFLHCA3    ="Arthritis/rheumatism causes difficulty with activity"
      AFLHCA4    ="Back or neck problem causes difficulty with activity"
      AFLHCA5    ="Fracture, bone/joint injury causes difficulty with activity"
      AFLHCA6    ="Other injury causes difficulty with activity"
      AFLHCA7    ="Heart problem causes difficulty with activity"
      AFLHCA8    ="Stroke problem causes difficulty with activity"
      AFLHCA9    =
"Hypertension/high blood pressure causes difficulty with activity"
      AFLHCA10   ="Diabetes causes difficulty with activity"
      AFLHCA11   =
"Lung/breathing problem (e.g., asthma) causes difficulty with activity"
      AFLHCA12   ="Cancer causes difficulty with activity"
      AFLHCA13   ="Birth defect causes difficulty with activity"
      ALHCA14A   =
"Intellectual disability, AKA mental retardation causes difficulty with activity
"
      AFLHCA15   =
"Other developmental problem (eg, cerebral palsy) causes difficulty with activit
y"
      AFLHCA16   ="Senility causes difficulty with activity"
      AFLHCA17   =
"Depression/anxiety/emotional problem causes difficulty with activity"
      AFLHCA18   ="Weight problem causes difficulty with activity"
      AFLHC19_   =
"Missing or amputated limb/finger/digit causes difficulty with activity"
      AFLHC20_   =
"Musculoskeletal/connective tissue problem causes difficulty with activity"
      AFLHC21_   =
"Circulation problems (including blood clots) cause difficulty with activity"
      AFLHC22_   =
"Endocrine/nutritional/metabolic problem causes difficulty with activity"
      AFLHC23_   =
"Nervous system/sensory organ condition causes difficulty with activity"
      AFLHC24_   ="Digestive system problem causes difficulty with activity"
      AFLHC25_   ="Genitourinary system problem causes difficulty with activity"
      AFLHC26_   =
"Skin/subcutaneous system problem causes difficulty with activity"
      AFLHC27_   =
"Blood or blood-forming organ problem causes difficulty with activity"
      AFLHC28_   ="Benign tumor/cyst causes difficulty with activity"
      AFLHC29_   =
"Alcohol/drug/substance abuse problem causes difficulty with activity"
      AFLHC30_   =
"Other mental problem/ADD/Bipolar/Schizophrenia causes difficulty with activity"
      AFLHC31_   =
"Surgical after-effects/medical treatment causes difficulty with activity"
      AFLHC32_   =
'"Old age"/elderly/aging-related problem causes difficulty with activity'
      AFLHC33_   ="Fatigue/tiredness/weakness causes difficulty with activity"
      AFLHC34_   ="Pregnancy-related problem causes difficulty with activity"
      AFLHCA90   ="Other impairment/problem (1) causes difficulty with activity"
      AFLHCA91   ="Other impairment/problem (2) causes difficulty with activity"
      ALTIME1    ="Duration of vision problem: Number of units"
      ALUNIT1    ="Duration of vision problem: Time unit"
      ALDURA1    ="Duration (in years) of vision problem, recode 1"
      ALDURB1    ="Duration of vision problem, recode 2"
      ALCHRC1    ="Vision problem condition status recode"
      ALTIME2    ="Duration of hearing problem: Number of units"
      ALUNIT2    ="Duration of hearing problem: Time unit"
      ALDURA2    ="Duration (in years) of hearing problem, recode 1"
      ALDURB2    ="Duration of hearing problem, recode 2"
      ALCHRC2    ="Hearing problem condition status recode"
      ALTIME3    ="Duration of arthritis/rheumatism: Number of units"
      ALUNIT3    ="Duration of arthritis/rheumatism: Time unit"
      ALDURA3    ="Duration (in years) of arthritis/rheumatism, recode 1"
      ALDURB3    ="Duration of arthritis/rheumatism, recode 2"
      ALCHRC3    ="Arthritis/rheumatism condition status recode"
      ALTIME4    ="Duration of back or neck problem: Number of units"
      ALUNIT4    ="Duration of back or neck problem: Time unit"
      ALDURA4    ="Duration (in years) of back or neck problem, recode 1"
      ALDURB4    ="Duration of back or neck problem, recode 2"
      ALCHRC4    ="Back or neck problem condition status recode"
      ALTIME5    ="Duration of fracture, bone/joint injury: Number of units"
      ALUNIT5    ="Duration of fracture, bone/joint injury: Time unit"
      ALDURA5    ="Duration (in years) of fracture, bone/joint injury, recode 1"
      ALDURB5    ="Duration of fracture, bone/joint injury, recode 2"
      ALCHRC5    ="Fracture, bone/joint injury condition status recode"
      ALTIME6    ="Duration of other injury: Number of units"
      ALUNIT6    ="Duration of other injury: Time unit"
      ALDURA6    ="Duration (in years) of other injury, recode 1"
      ALDURB6    ="Duration of other injury, recode 2"
      ALCHRC6    ="Other injury condition status recode"
      ALTIME7    ="Duration of heart problem: Number of units"
      ALUNIT7    ="Duration of heart problem: Time unit"
      ALDURA7    ="Duration (in years) of heart problem, recode 1"
      ALDURB7    ="Duration of heart problem, recode 2"
      ALCHRC7    ="Heart problem condition status recode"
      ALTIME8    ="Duration of stroke problem: Number of units"
      ALUNIT8    ="Duration of stroke problem: Time unit"
      ALDURA8    ="Duration (in years) of stroke problem, recode 1"
      ALDURB8    ="Duration of stroke problem, recode 2"
      ALCHRC8    ="Stroke problem condition status recode"
      ALTIME9    =
"Duration of hypertension or high blood pressure: Number of units"
      ALUNIT9    ="Duration of hypertension or high blood pressure: Time unit"
      ALDURA9    =
"Duration (in years) of hypertension or high blood pressure: recode 1"
      ALDURB9    ="Duration of hypertension or high blood pressure: recode 2"
      ALCHRC9    ="Hypertension or high blood pressure condition status recode"
      ALTIME10   ="Duration of diabetes: Number of units"
      ALUNIT10   ="Duration of diabetes: Time unit"
      ALDURA10   ="Duration (in years) of diabetes, recode 1"
      ALDURB10   ="Duration of diabetes, recode 2"
      ALCHRC10   ="Diabetes condition status recode"
      ALTIME11   =
"Duration of lung/breathing problem (e.g., asthma and emphysema): Number of unit
s"
      ALUNIT11   =
"Duration of lung/breathing problem: (e.g., asthma and emphysema) Time unit"
      ALDURA11   =
"Duration (in years) of lung/breathing problem (e.g., asthma), recode 1"
      ALDURB11   =
"Duration of lung/breathing problem (e.g., asthma and emphysema), recode 2"
      ALCHRC11   =
"Lung/breathing problem (e.g., asthma and emphysema) condition status recode"
      ALTIME12   ="Duration of cancer: Number of units"
      ALUNIT12   ="Duration of cancer: Time unit"
      ALDURA12   ="Duration (in years) of cancer, recode 1"
      ALDURB12   ="Duration of cancer, recode 2"
      ALCHRC12   ="Cancer condition status recode"
      ALTIME13   ="Duration of birth defect: Number of units"
      ALUNIT13   ="Duration of birth defect: Time unit"
      ALDURA13   ="Duration (in years) of birth defect, recode 1"
      ALDURB13   ="Duration of birth defect, recode 2"
      ALCHRC13   ="Birth defect condition status recode"
      ATIME14A   =
"Duration of intellectual disability, AKA mental retardation: Number of units"
      AUNIT14A   =
"Duration of intellectual disability, also know as mental retardation: Time unit
"
      ADURA14A   =
"Duration (in years) of intellectual disability, AKA mental retardation, recode 
1"
      ADURB14A   =
"Duration of intellectual disability, also known as mental retardation, recode 2
"
      ACHRC14A   =
"Intellectual disability, AKA mental retardation condition status recode"
      ALTIME15   =
"Duration of other developmental problem (e.g., cerebral palsy): Number of units
"
      ALUNIT15   =
"Duration of other developmental problem (e.g., cerebral palsy): Time unit"
      ALDURA15   =
"Duration (in years) of other developmental problem (eg cerebral palsy), recode 
1"
      ALDURB15   =
"Duration of other developmental problem (e.g., cerebral palsy), recode 2"
      ALCHRC15   =
"Other developmental problem (e.g., cerebral palsy) condition status recode"
      ALTIME16   ="Duration of senility: Number of units"
      ALUNIT16   ="Duration of senility: Time unit"
      ALDURA16   ="Duration (in years) of senility, recode 1"
      ALDURB16   ="Duration of senility, recode 2"
      ALCHRC16   ="Senility condition status recode"
      ALTIME17   =
"Duration of depression/anxiety/emotional problem: Number of units"
      ALUNIT17   ="Duration of depression/anxiety/emotional problem: Time unit"
      ALDURA17   =
"Duration (in years) of depression/anxiety/emotional problem, recode 1"
      ALDURB17   ="Duration of depression/anxiety/emotional problem, recode 2"
      ALCHRC17   ="Depression/anxiety/emotional problem condition status recode"
      ALTIME18   ="Duration of weight problem: Number of units"
      ALUNIT18   ="Duration of weight problem: Time unit"
      ALDURA18   ="Duration (in years) of weight problem, recode 1"
      ALDURB18   ="Duration of weight problem, recode 2"
      ALCHRC18   ="Weight problem condition status recode"
      ALTIME19   =
"Duration of missing limbs (fingers, toes); amputation: Number of units"
      ALUNIT19   =
"Duration of missing limbs (fingers, toes, or digits); amputation: Time unit"
      ALDURA19   =
"Duration (in years) of missing limbs (fingers, toes); amputation, recode 1"
      ALDURB19   =
"Duration of missing limbs (fingers, toes, or digits); amputation, recode 2"
      ALCHRC19   =
"Missing limbs (fingers, toes, or digits); amputation condition status recode"
      ALTIME20   =
"Duration of musculoskeletal/connective tissue problem: Number of units"
      ALUNIT20   =
"Duration of musculoskeletal/connective tissue problem: Time unit"
      ALDURA20   =
"Duration (in years) of musculoskeletal/connective tissue problem, recode 1"
      ALDURB20   =
"Duration of musculoskeletal/connective tissue problem, recode 2"
      ALCHRC20   =
"Musculoskeletal/connective tissue problem condition status recode"
      ALTIME21   =
"Duration of circulation problems (including blood clots): Number of units"
      ALUNIT21   =
"Duration of circulation problems (including blood clots): Time unit"
      ALDURA21   =
"Duration (in years) of circulation problems (including blood clots), recode 1"
      ALDURB21   =
"Duration of circulation problems (including blood clots), recode 2"
      ALCHRC21   =
"Circulation problems (including blood clots) condition status recode"
      ALTIME22   =
"Duration of endocrine/nutritional/metabolic problem: Number of units"
      ALUNIT22   =
"Duration of endocrine/nutritional/metabolic problem: Time unit"
      ALDURA22   =
"Duration (in years) of endocrine/nutritional/metabolic problem, recode 1"
      ALDURB22   ="Duration of endocrine/nutritional/metabolic problem, recode 2
"
      ALCHRC22   =
"Endocrine/nutritional/metabolic problem condition status recode"
      ALTIME23   =
"Duration of nervous system/sensory organ condition: Number of units"
      ALUNIT23   ="Duration of nervous system/sensory organ condition: Time unit
"
      ALDURA23   =
"Duration (in years) of nervous system/sensory organ condition, recode 1"
      ALDURB23   ="Duration of nervous system/sensory organ condition, recode 2"
      ALCHRC23   ="Nervous system/sensory organ condition status recode"
      ALTIME24   ="Duration of digestive system problems: Number of units"
      ALUNIT24   ="Duration of digestive system problems: Time unit"
      ALDURA24   ="Duration (in years) of digestive system problems, recode 1"
      ALDURB24   ="Duration of digestive system problems, recode 2"
      ALCHRC24   ="Digestive system problems condition status recode"
      ALTIME25   ="Duration of genitourinary system problem: Number of units"
      ALUNIT25   ="Duration of genitourinary system problem: Time unit"
      ALDURA25   ="Duration (in years) of genitourinary system problem, recode 1
"
      ALDURB25   ="Duration of genitourinary system problem, recode 2"
      ALCHRC25   ="Genitourinary system problem condition status recode"
      ALTIME26   =
"Duration of skin/subcutaneous system problems: Number of units"
      ALUNIT26   ="Duration of skin/subcutaneous system problems: Time unit"
      ALDURA26   =
"Duration (in years) of skin/subcutaneous system problems, recode 1"
      ALDURB26   ="Duration of skin/subcutaneous system problems, recode 2"
      ALCHRC26   ="Skin/subcutaneous system problems condition status recode"
      ALTIME27   =
"Duration of blood or blood-forming organ problem: Number of units"
      ALUNIT27   ="Duration of blood or blood-forming organ problem: Time unit"
      ALDURA27   =
"Duration (in years) of blood or blood-forming organ problem, recode 1"
      ALDURB27   ="Duration of blood or blood-forming organ problem, recode 2"
      ALCHRC27   ="Blood or blood-forming organ problem condition status recode"
      ALTIME28   ="Duration of benign tumor/cyst: Number of units"
      ALUNIT28   ="Duration of benign tumor/cyst: Time unit"
      ALDURA28   ="Duration (in years) of benign tumor/cyst, recode 1"
      ALDURB28   ="Duration of benign tumor/cyst, recode 2"
      ALCHRC28   ="Benign tumor/cyst condition status recode"
      ALTIME29   =
"Duration of alcohol /drug/substance abuse problem: Number of units"
      ALUNIT29   ="Duration of alcohol/drug/substance abuse problem: Time unit"
      ALDURA29   =
"Duration (in years) of alcohol/drug/substance abuse problem, recode 1"
      ALDURB29   ="Duration of alcohol/drug/substance abuse problem, recode 2"
      ALCHRC29   ="Alcohol /drug/substance abuse problem condition status recode
"
      ALTIME30   =
"Duration of other mental problem/ADD/Bipolar/Schizophrenia: Number of units"
      ALUNIT30   =
"Duration of other mental problem/ADD/Bipolar/Schizophrenia: Time unit"
      ALDURA30   =
"Duration (in years) of other mental problem/ADD/Bipolar/Schizophrenia, recode 1
"
      ALDURB30   =
"Duration of other mental problem/ADD/Bipolar/Schizophrenia, recode 2"
      ALCHRC30   =
"Other mental problem/ADD/Bipolar/Schizophrenia condition status recode"
      ALTIME31   =
"Duration of surgical after-effects/medical treatment problems: Number of units"
      ALUNIT31   =
"Duration of surgical after-effects/medical treatment problems: Time unit"
      ALDURA31   =
"Duration (in years) of surgical after-effects/medical treatment prob, recode 1"
      ALDURB31   =
"Duration of surgical after-effects/medical treatment problems, recode 2"
      ALCHRC31   =
"Surgical after-effects/medical treatment problems condition status recode"
      ALTIME32   =
'Duration of "old age"/elderly/aging-related problems: Number of units'
      ALUNIT32   =
'Duration of "old age"/elderly/aging-related problems: Time unit'
      ALDURA32   =
'Duration (in years) of "old age"/elderly/aging-related problems, recode 1'
      ALDURB32   =
'Duration of "old age"/elderly/aging-related problems, recode 2'
      ALCHRC32   =
'"Old age"/elderly/aging-related problems condition status recode'
      ALTIME33   =
"Duration of fatigue/tiredness/weakness problem: Number of units"
      ALUNIT33   ="Duration of fatigue/tiredness/weakness problem: Time unit"
      ALDURA33   =
"Duration (in years) of fatigue/tiredness/weakness problem, recode 1"
      ALDURB33   ="Duration of fatigue/tiredness/weakness problem, recode 2"
      ALCHRC33   ="Fatigue/tiredness/weakness problem condition status recode"
      ALTIME34   ="Duration of pregnancy-related problem: Number of units"
      ALUNIT34   ="Duration of pregnancy-related problem: Time unit"
      ALDURA34   ="Duration (in years) of pregnancy-related problem, recode 1"
      ALDURB34   ="Duration of pregnancy-related problem, recode 2"
      ALCHRC34   ="Pregnancy-related condition status recode"
      ALTIME90   =
"Duration of other impairment/problem N.E.C. (1): Number of units"
      ALUNIT90   ="Duration of other impairment/problem N.E.C. (1): Time unit"
      ALDURA90   =
"Duration (in years) of other impairment/problem N.E.C. (1), recode 1"
      ALDURB90   ="Duration of other impairment/problem N.E.C. (1), recode 2"
      ALCHRC90   ="Other impairment/problem N.E.C. (1) condition status recode"
      ALTIME91   =
"Duration of other impairment/problem N.E.C. (2): Number of units"
      ALUNIT91   ="Duration of other impairment/problem N.E.C. (2): Time unit"
      ALDURA91   =
"Duration (in years) of other impairment/ problem N.E.C. (2), recode 1"
      ALDURB91   ="Duration of other impairment/problem N.E.C. (2), recode 2"
      ALCHRC91   ="Other impairment/problem N.E.C. (2) condition status recode"
      ALCNDRT    =
"Chronic condition recode for individual with functional limitation"
      ALCHRONR   ="Overall functional limitation recode by condition status"

      /* AHB LABELS */

      SMKEV      ="Ever smoked 100 cigarettes"
      SMKREG     ="Age first smoked fairly regularly"
      SMKNOW     ="Smoke freq: every day/some days/not at all"
      SMKSTAT2   ="Smoking Status: Recode"
      SMKQTNO    ="Time since quit: # of units"
      SMKQTTP    ="Time since quit: time period"
      SMKQTY     ="Time since quit smoking (in years)"
      CIGSDA1    ="Number cigs per day (daily smokers)"
      CIGDAMO    ="Number days smoked in past 30 days"
      CIGSDA2    ="Number cigs per day (some day smokers)"
      CIGSDAY    ="Number of cigarettes a day (all current smokers)"
      CIGQTYR    ="Tried quit smoking 1+ days, past 12 m"
      ECIGEV2    ="Ever used electronic cigarettes (e-cig), even once"
      ECIGCUR2   ="E-cig freq: every day/some days/not at all"
      ECIG30D2   ="Number of days used e-cigarettes, past 30 days"
      CIGAREV2   =
"Ever smoked a regular cigar, cigarillo, or little filtered cigar, even once"
      CIGCUR2    =
"Smoke freq:every day/some days/not at all-cigars,cigarillos,or lil' filtered ci
g"
      CIG30D2    =
"Number of days smoked cigar, cigarillo, or little filtered cigar, past 30 days"
      PIPEV2     =
"Ever smoked pipe filled w/tobacco - either pipe,water pipe,or hookah,even once"
      PIPECUR2   =
"Smoke freq: every day/some days/not at all - either pipes,water pipes,or hookah
s"
      SMKLSTB1   ="Ever used smokeless tobacco products, even once"
      SMKLSCR2   ="Smokeless tobacco freq: every day/some days/not at all"
      VIGNO      ="Freq vigorous activity: # of units"
      VIGTP      ="Freq vigorous activity: Time units"
      VIGFREQW   ="Freq vigorous activity (times per wk)"
      VIGLNGNO   ="Duration vigorous activity: # units"
      VIGLNGTP   ="Duration vigorous activity: Time unit"
      VIGMIN     ="Duration vigorous activity (in minutes)"
      MODNO      ="Freq moderate activity: # of units"
      MODTP      ="Freq moderate activity: Time units"
      MODFREQW   ="Freq light/moderate activity (times per wk)"
      MODLNGNO   ="Duration moderate activity: # of units"
      MODLNGTP   ="Duration moderate activity: Time unit"
      MODMIN     ="Duration light/moderate activity (in minutes)"
      STRNGNO    ="Strength activity freq: # of units"
      STRNGTP    ="Strength activity freq: Time units"
      STRFREQW   ="Freq strength activity (times per wk)"
      ALC1YR     ="Ever had 12+ drinks in any  one year"
      ALCLIFE    ="Had 12+ drinks in ENTIRE LIFE"
      ALC12MNO   ="Freq drank alcohol pst yr:  # of units"
      ALC12MTP   ="Freq drank alcohol pst yr:  Time unit"
      ALC12MWK   ="Freq drank alcohol: Days per week"
      ALC12MYR   ="Freq drank alcohol: Days in past year"
      ALCAMT     ="Average # drinks on days drank"
      ALCSTAT    ="Alcohol drinking status: Recode"
      ALC5UPN1   ="Days 5+/4+ drinks, past yr: # days"
      ALC5UPT1   ="Days 5+/4+ drinks, past yr: Time unit"
      ALC5UPY1   ="Number of days had 5+/4+ drinks past year"
      BINGE1     ="Number of times had 5+/4+ drinks on AN OCCASION, past 30 days
"
      AHEIGHT    ="Total height in inches"
      AWEIGHTP   ="Weight without shoes (pounds)"
      BMI        ="Body Mass Index (BMI)"

      /* AAU LABELS */

      AUSUALPL   ="Place USUALLY go when sick"
      APLKIND    ="Place to go when sick (most often)"
      AHCPLROU   ="USUALLY go there for routine/preventive care"
      AHCPLKND   ="Place USUALLY go for routine/preventive care"
      AHCCHGYR   ="Change health care place, past 12 m"
      AHCCHGHI   ="Change related to health insurance"
      APRVTRYR   ="Trouble finding a doctor/provider, past 12 m"
      APRVTRFD   ="Able to find doctor/provider, past 12 m"
      ADRNANP    ="Doctor's office not accept you as new patient, past 12 m"
      ADRNAI     ="Doctor's office not accept your health insurance, past 12 m"
      AHCDLYR1   ="Couldn't get through on phone, past 12 m"
      AHCDLYR2   ="Couldn't get appointment soon enough, past 12 m"
      AHCDLYR3   ="Wait too long in doctor's office, past 12 m"
      AHCDLYR4   ="Not open when you could go, past 12 m"
      AHCDLYR5   ="No transportation, past 12 m"
      AHCAFYR1   ="Couldn't afford prescription medicine, past 12 m"
      AHCAFYR2   ="Couldn't afford mental health care/counseling, past 12 m"
      AHCAFYR3   ="Couldn't afford dental care, past 12 m"
      AHCAFYR4   ="Couldn't afford eyeglasses, past 12 m"
      AHCAFYR5   ="Couldn't afford to see a specialist, past 12 m"
      AHCAFYR6   ="Couldn't afford follow-up care, past 12 m"
      AWORPAY    ="Get sick or have accident, worried about paying medical bills
"
      AHICOMP    ="Health insurance coverage compared to a year ago"
      ARX12MO    =
"Prescribed medication by doctor/health professional, past 12 m"
      ARX12_1    ="Skipped medication doses to save money, past 12 m"
      ARX12_2    ="Took less medicine to save money, past 12 m"
      ARX12_3    ="Delayed filling a prescription to save money, past 12 m"
      ARX12_4    =
"Asked doctor for lower cost medication to save money, past 12 m"
      ARX12_5    =
"Bought prescription drugs from another country to save money, past 12 m"
      ARX12_6    ="Used alternative therapies to save money, past 12 m"
      ADNLONG2   ="Time since last saw a dentist"
      AHCSYR1    ="Seen/talked to mental health professional, past 12 m"
      AHCSYR2    ="Seen/talked to eye doctor, past 12 m"
      AHCSYR3    ="Seen/talked to foot doctor, past 12 m"
      AHCSYR4    ="Seen/talked to a chiropractor, past 12 m"
      AHCSYR5    ="Seen/talked to therapist (PT/OT/etc.), past 12 m"
      AHCSYR6    ="Seen/talked to a NP/PA/midwife, past 12 m"
      AHCSYR7    ="Seen/talked to OB/GYN, past 12 m"
      AHCSYR8    ="Seen/talked to a medical specialist, past 12 m"
      AHCSYR9    ="Seen/talked to a general doctor, past 12 m"
      AHCSYR10   ="Doctor treats both kids and adults"
      AHERNOY2   ="# times in ER/ED, past 12 m"
      AERVISND   ="ER visit at night or on weekend"
      AERHOS     ="ER visit resulted in hospital admission"
      AERREA1R   ="ER visit because didn't have another place to go"
      AERREA2R   ="ER visit because doctors office or clinic was not open"
      AERREA3R   ="ER visit because advised by health provider to go"
      AERREA4R   =
"ER visit because problem too serious for doctor's office/clinic"
      AERREA5R   ="ER visit because only hospital could help"
      AERREA6R   ="ER visit because it is closest provider"
      AERREA7R   ="ER visit because it is usual place to get care"
      AERREA8R   ="Arrived at ER by ambulance/other emergency vehicle"
      AHCHYR     ="Received home care from health professional, past 12 m"
      AHCHMOYR   ="# months of home care, past 12 m"
      AHCHNOY2   ="Total number of home visits"
      AHCNOYR2   ="Total number of office visits, past 12 m"
      ASRGYR     ="Surgery/surgical procedure, past 12 m"
      ASRGNOYP   ="# of surgeries, past 12 m"
      AMDLONGR   ="Time since last seen/talked to health professional"
      HIT1A      ="Looked up health information on Internet, past 12 m"
      HIT2A      ="Filled a prescription on Internet, past 12 m"
      HIT3A      ="Scheduled medical appointment on Internet, past 12 m"
      HIT4A      ="Communicated with health care provider by email, past 12 m"
      HIT5A      ="Used chat groups to learn about health topics, past 12 m"
      FLUVACYR   ="Flu vaccination, past 12 m"
      FLUVACTP   ="Administration method of most recent flu vaccine"
      FLUVAC_M   ="Month of most recent flu vaccine"
      FLUVAC_Y   ="Year of most recent flu vaccine"
      FLUSHPG1   =
"Flu shot before/during current pregnancy, interviewed Jan-Mar or Aug-Dec, 2017"
      FLUSHPG2   ="Flu shot before/during/after a pregnancy"
      SHTPNUYR   ="Pneumonia shot (EVER)"
      APOX       ="Ever had chickenpox"
      APOX12MO   ="Chickenpox, past 12 m"
      AHEP       ="Ever had hepatitis"
      AHEPLIV    ="Ever lived w/ someone w/ hepatitis"
      AHEPBTST   ="Ever had a blood test for hepatitis B"
      SHTHEPB    ="Hepatitis B vaccine (EVER)"
      SHEPDOS    ="# doses of hepatitis B vaccine received"
      SHTHEPA    ="Hepatitis A vaccine (EVER)"
      SHEPANUM   ="# shots of hepatitis A vaccine received"
      AHEPCTST   ="Ever had a blood test for hepatitis C"
      AHEPCRES   ="Main reason tested for Hepatitis C"
      SHINGLES   ="Ever had the Zoster or Shingles vaccine"
      SHTTD      ="Tetanus shot in the past 10 years"
      SHTTDAP2   ="Vaccine included pertussis/whooping cough"
      SHTHPV2    ="Ever received HPV shot/vaccine"
      SHHPVDOS   ="Number of HPV shots received"
      AHPVAGE    ="Age at first HPV shot"
      LIVEV      =
"Ever told you had any kind of chronic/long-term liver condition"
      TRAVEL     =
"Ever traveled outside USA since 1995 (Excluding EUR, JPN, AUS, NZL, and CAN)"
      WRKHLTH2   ="Work or volunteer in a health care setting"
      WRKDIR     ="Direct contact with patients"
      APSBPCHK   =
"Blood pressure checked by doctor/nurse/health professional, past 12 m"
      APSCHCHK   =
"Cholesterol checked by doctor/nurse/health professional, past 12 m"
      APSBSCHK   ="Fasting test for high blood sugar/diabetes, past 12 m"
      APSPAP     ="Pap smear/test, past 12 m"
      APSMAM     ="Mammogram, past 12 m"
      APSCOL     ="Test for colon cancer, past 12 m"
      APSDIET    =
"Doctor/health professional talked to you about diet, past 12 m"
      APSSMKC    =
"Doctor/health professional talked to you about smoking, past 12 m"
      AINDINS2   ="Tried to purchase health insurance directly, past 3 yrs"
      AINDPRCH   ="Purchased health insurance directly, past 3 yrs"
      AINDWHO    ="For whom was health insurance purchased, past 3 yrs"
      AINDDIF1   =
"How difficult to find health insurance for coverage needed, past 3 yrs"
      AINDDIF2   ="How difficult to find affordable health insurance, past 3 yrs
"
      AEXCHNG    =
"Looked into purchasing health insurance through Healthcare.gov or Marketplace"
      CLAS1      ="Important for providers to understand/share culture"
      CLAS2      ="How often able to see providers who share culture"
      CLAS3      ="How often treated w/ respect by providers"
      CLAS4      ="How often providers ask opinions/beliefs about care"
      CLAS5      ="How often providers give information easy to understand"

      /* ASI LABELS */

      ASICPUSE   ="How often do you use a computer"
      ASISATHC   ="How satisfied with health care, past 12 mo"
      ASITENUR   ="Length of time living in neighborhood"
      ASINHELP   ="Agree/disagree…people in neighborhood help each other"
      ASINCNTO   ="Agree/disagree…people I count on in neighborhood"
      ASINTRU    ="Agree/disagree…people in neighborhood can be trusted"
      ASINKNT    ="Agree/disagree…close-knit neighborhood"
      ASISIM     ="How you think of yourself (sexual orientation; male)"
      ASISIF     ="How do you think of yourself (sexual orientation; female)"
      ASIRETR    ="How worried are you about…money for retirement"
      ASIMEDC    ="How worried are you about…medical costs of illness/accident"
      ASISTLV    ="How worried are you about…maintaining standard of living"
      ASICNHC    ="How worried are you about…medical costs of healthcare"
      ASICCOLL   ="How worried are you about…paying for children's college"
      ASINBILL   ="How worried are you about…paying monthly bills"
      ASIHCST    ="How worried are you about…paying rent/mortgage/housing costs"
      ASICCMP    ="How worried are you about…credit card payments"
      ASISLEEP   ="Hours of sleep"
      ASISLPFL   ="# times having trouble falling asleep, past week"
      ASISLPST   ="# times having trouble staying asleep, past week"
      ASISLPMD   ="# times taking medication for sleep, past week"
      ASIREST    ="Days woke up feeling rested, past week"
      ASISAD     ="So sad nothing cheers you up, past 30 days"
      ASINERV    ="How often felt nervous, past 30 days"
      ASIRSTLS   ="How often restless/fidgety, past 30 days"
      ASIHOPLS   ="How often felt hopeless, past 30 days"
      ASIEFFRT   ="How often felt everything was an effort, past 30 days"
      ASIWTHLS   ="How often felt worthless, past 30 days"
      ASIMUCH    ="Feelings interfered w/ life, past 30 days"
      ASIHIVT    ="Ever been tested for HIV"
      ASIHIVWN   ="Main reason not tested for HIV"

      /* ACH LABELS */

      NAT_USM1   ="Saw a practitioner for naturopathy, past 12 months"
      CHE_USM1   ="Saw a practitioner for chelation therapy, past 12 months"
      TRD_USM1   ="Saw a practitioner for Traditional Medicine, past 12 months"
      TR_USM21   ="Saw a Shaman, past 12 months"
      TR_USM22   ="Saw a Curandero, Machi or Parchero, past 12 months"
      TR_USM23   ="Saw a Yerbero or Hierbista, past 12 months"
      TR_USM24   ="Saw a Sobador, past 12 months"
      TR_USM25   ="Saw a Native American Healer or Medicine Man, past 12 months"
      TR_USM26   ="Other Traditional Healer, past 12 months"
      HOM_USM1   ="Saw a practitioner for homeopathy, past 12 months"
      MBO_MAN1   ="Used mantra meditation, past 12 months"
      MBO_MND1   ="Used mindfulness meditation, past 12 months"
      MBO_SPR1   ="Used spiritual meditation, past 12 months"
      MBO_IMG1   ="Used guided imagery, past 12 months"
      MBO_PRO1   ="Used progressive relaxation, past 12 months"
      YTQU_YG1   ="Practiced yoga, past 12 months"
      YTQ_BTY1   ="Did breathing exercises as part of yoga"
      YTQ_MDY1   ="Did meditation as part of yoga"
      YTQU_TA1   ="Practiced tai chi, past 12 months"
      YTQ_BTT1   ="Did breathing exercises as part of tai chi"
      YTQ_MDT1   ="Did meditation as part of tai chi"
      YTQU_QG1   ="Practiced qi gong, past 12 months"
      YTQ_BTQ1   ="Did breathing exercises as part of qi gong"
      YTQ_MDQ1   ="Did meditation as part of qi gong"

      /* AWB LABELS */

      AWEBUSE    ="Internet use"
      AWEBOFNO   ="Frequency internet use: # of units"
      AWEBOFTP   ="Frequency internet use: Time units"
      AWEBEML    ="Email use"
      AWEBMNO    ="Frequency email use: # of units"
      AWEBMTP    ="Frequency email use: Time units"
   ;

   * ASSOCIATE VARIABLES WITH FORMAT VALUES;
   *    (PUT ASTERISK (*) BEFORE WORD "FORMAT"
        IN NEXT STATEMENT TO PREVENT FORMAT
        ASSOCIATIONS BEING STORED WITH DATA SET);
   FORMAT

      /* IDN FORMAT ASSOCIATIONS */

      RECTYPE   SAP001X.   SRVY_YR   SAP002X.   HHX       $GROUPC.
      INTV_QRT  SAP004X.   INTV_MON  SAP005X.   WTIA_SA   GROUPN.
      WTFA_SA   GROUPN.

      /* UCF FORMAT ASSOCIATIONS */

      REGION    SAP010X.

      /* HHC FORMAT ASSOCIATIONS */

      SEX       SAP013X.   HISPAN_I  SAP014X.   RACERPI2  SAP015X.
      MRACRPI2  SAP016X.   MRACBPI2  SAP017X.   AGE_P     SAP018X.

      /* FID FORMAT ASSOCIATIONS */

      R_MARITL  SAP019X.   PAR_STAT  SAP020X.

      /* AID FORMAT ASSOCIATIONS */

      PROXYSA   SAP021X.   PROX1     SAP022X.   PROX2     SAP023X.
      LATEINTA  SAP024X.

      /* FDB FORMAT ASSOCIATIONS */

      FDRN_FLG  SAP025X.

      /* ASD FORMAT ASSOCIATIONS */

      DOINGLWA  SAP026X.   WHYNOWKA  SAP027X.   EVERWRK   SAP028X.
      INDSTRN1  SAP029X.   INDSTRN2  SAP029X.   OCCUPN1   SAP031X.
      OCCUPN2   SAP031X.   SUPERVIS  SAP028X.   WRKCATA   SAP034X.
      BUSINC1A  SAP028X.   LOCALL1B  SAP036X.   YRSWRKPA  SAP037X.
      WRKLONGH  SAP028X.   HOURPDA   SAP028X.   PDSICKA   SAP028X.
      ONEJOB    SAP028X.   WRKLYR4   SAP042X.

      /* ACN FORMAT ASSOCIATIONS */

      HYPEV     SAP028X.   HYPDIFV   SAP028X.   HYPYR1    SAP028X.
      HYBPCKNO  SAP046X.   HYBPCKTP  SAP047X.   HYBPLEV   SAP048X.
      HYPMDEV2  SAP028X.   HYPMED2   SAP028X.   CHLEV     SAP028X.
      CHLYR     SAP028X.   CLCKNO    SAP046X.   CLCKTP    SAP047X.
      CHLMDEV2  SAP028X.   CHLMDNW2  SAP028X.   CHDEV     SAP028X.
      ANGEV     SAP028X.   MIEV      SAP028X.   HRTEV     SAP028X.
      STREV     SAP028X.   EPHEV     SAP028X.   JAWP      SAP028X.
      WEA       SAP028X.   CHE       SAP028X.   ARM       SAP028X.
      BRTH      SAP028X.   AHADO     SAP068X.   FACE      SAP028X.
      SPEAKING  SAP028X.   EYE       SAP028X.   WALKING   SAP028X.
      HEADACHE  SAP028X.   ASTDO     SAP068X.   COPDEV    SAP028X.
      ASPMEDEV  SAP028X.   ASPMEDAD  SAP028X.   ASPMDMED  SAP028X.
      ASPONOWN  SAP028X.   AASMEV    SAP028X.   AASSTILL  SAP028X.
      AASMYR    SAP028X.   AASERYR1  SAP028X.   ULCEV     SAP028X.
      ULCYR     SAP028X.   CANEV     SAP028X.   CNKIND1   SAP087X.
      CNKIND2   SAP087X.   CNKIND3   SAP087X.   CNKIND4   SAP087X.
      CNKIND5   SAP087X.   CNKIND6   SAP087X.   CNKIND7   SAP087X.
      CNKIND8   SAP087X.   CNKIND9   SAP087X.   CNKIND10  SAP087X.
      CNKIND11  SAP087X.   CNKIND12  SAP087X.   CNKIND13  SAP087X.
      CNKIND14  SAP087X.   CNKIND15  SAP087X.   CNKIND16  SAP087X.
      CNKIND17  SAP087X.   CNKIND18  SAP087X.   CNKIND19  SAP087X.
      CNKIND20  SAP087X.   CNKIND21  SAP087X.   CNKIND22  SAP087X.
      CNKIND23  SAP087X.   CNKIND24  SAP087X.   CNKIND25  SAP087X.
      CNKIND26  SAP087X.   CNKIND27  SAP087X.   CNKIND28  SAP087X.
      CNKIND29  SAP087X.   CNKIND30  SAP087X.   CNKIND31  SAP087X.
      CANAGE1   SAP118X.   CANAGE2   SAP118X.   CANAGE3   SAP118X.
      CANAGE4   SAP118X.   CANAGE5   SAP118X.   CANAGE6   SAP118X.
      CANAGE7   SAP118X.   CANAGE8   SAP118X.   CANAGE9   SAP118X.
      CANAGE10  SAP118X.   CANAGE11  SAP118X.   CANAGE12  SAP118X.
      CANAGE13  SAP118X.   CANAGE14  SAP118X.   CANAGE15  SAP118X.
      CANAGE16  SAP118X.   CANAGE17  SAP118X.   CANAGE18  SAP118X.
      CANAGE19  SAP118X.   CANAGE20  SAP118X.   CANAGE21  SAP118X.
      CANAGE22  SAP118X.   CANAGE23  SAP118X.   CANAGE24  SAP118X.
      CANAGE25  SAP118X.   CANAGE26  SAP118X.   CANAGE27  SAP118X.
      CANAGE28  SAP118X.   CANAGE29  SAP118X.   CANAGE30  SAP118X.
      PREGEVER  SAP028X.   DBHVPAY   SAP028X.   DBHVCLY   SAP028X.
      DBHVWLY   SAP028X.   DBHVPAN   SAP028X.   DBHVCLN   SAP028X.
      DBHVWLN   SAP028X.   DIBREL    SAP028X.   DIBEV1    SAP156X.
      DIBPRE2   SAP028X.   DIBTEST   SAP158X.   DIBAGE1   SAP118X.
      DIFAGE2   SAP160X.   DIBTYPE   SAP161X.   DIBPILL1  SAP028X.
      INSLN1    SAP028X.   DIBINS2   SAP164X.   DIBINS3   SAP028X.
      DIBINS4   SAP028X.   DIBGDM    SAP028X.   DIBBABY   SAP028X.
      DIBPRGM   SAP028X.   DIBREFER  SAP028X.   DIBBEGIN  SAP171X.
      EPILEP1   SAP028X.   EPILEP2   SAP028X.   EPILEP3   SAP174X.
      EPILEP4   SAP028X.   EPILEP5   SAP176X.   AHAYFYR   SAP028X.
      SINYR     SAP028X.   CBRCHYR   SAP028X.   KIDWKYR   SAP028X.
      LIVYR     SAP028X.   JNTSYMP   SAP028X.   JMTHP1    SAP087X.
      JMTHP2    SAP087X.   JMTHP3    SAP087X.   JMTHP4    SAP087X.
      JMTHP5    SAP087X.   JMTHP6    SAP087X.   JMTHP7    SAP087X.
      JMTHP8    SAP087X.   JMTHP9    SAP087X.   JMTHP10   SAP087X.
      JMTHP11   SAP087X.   JMTHP12   SAP087X.   JMTHP13   SAP087X.
      JMTHP14   SAP087X.   JMTHP15   SAP087X.   JMTHP16   SAP087X.
      JMTHP17   SAP087X.   JNTCHR    SAP028X.   JNTHP     SAP028X.
      ARTH1     SAP028X.   ARTHLMT   SAP028X.   PAINECK   SAP028X.
      PAINLB    SAP028X.   PAINLEG   SAP028X.   PAINFACE  SAP028X.
      AMIGR     SAP028X.   ACOLD2W   SAP028X.   AINTIL2W  SAP028X.
      PREGNOW   SAP028X.   PREGFLYR  SAP028X.   HRAIDNOW  SAP028X.
      HRAIDEV   SAP028X.   AHEARST1  SAP215X.   AVISION   SAP028X.
      ABLIND    SAP028X.   VIM_DREV  SAP028X.   VIMLS_DR  SAP028X.
      VIM_CAEV  SAP028X.   VIMLS_CA  SAP028X.   VIMCSURG  SAP028X.
      VIM_GLEV  SAP028X.   VIMLS_GL  SAP028X.   VIM_MDEV  SAP028X.
      VIMLS_MD  SAP028X.   VIMGLASS  SAP028X.   VIMREAD   SAP028X.
      VIMDRIVE  SAP028X.   AVISREH   SAP028X.   AVISDEV   SAP028X.
      AVDF_NWS  SAP232X.   AVDF_CLS  SAP232X.   AVDF_NIT  SAP232X.
      AVDF_DRV  SAP232X.   AVDF_PER  SAP232X.   AVDF_CRD  SAP232X.
      AVISEXAM  SAP238X.   AVISACT   SAP028X.   AVISPROT  SAP240X.
      LUPPRT    SAP028X.   CHPAIN6M  SAP242X.   PAINLMT   SAP242X.

      /* AHS FORMAT ASSOCIATIONS */

      WKDAYR    SAP244X.   BEDDAYR   SAP244X.   AHSTATYR  SAP246X.
      SPECEQ    SAP028X.   FLWALK    SAP248X.   FLCLIMB   SAP248X.
      FLSTAND   SAP248X.   FLSIT     SAP248X.   FLSTOOP   SAP248X.
      FLREACH   SAP248X.   FLGRASP   SAP248X.   FLCARRY   SAP248X.
      FLPUSH    SAP248X.   FLSHOP    SAP248X.   FLSOCL    SAP248X.
      FLRELAX   SAP248X.   FLA1AR    SAP260X.   AFLHCA1   SAP087X.
      AFLHCA2   SAP087X.   AFLHCA3   SAP087X.   AFLHCA4   SAP087X.
      AFLHCA5   SAP087X.   AFLHCA6   SAP087X.   AFLHCA7   SAP087X.
      AFLHCA8   SAP087X.   AFLHCA9   SAP087X.   AFLHCA10  SAP087X.
      AFLHCA11  SAP087X.   AFLHCA12  SAP087X.   AFLHCA13  SAP087X.
      ALHCA14A  SAP087X.   AFLHCA15  SAP087X.   AFLHCA16  SAP087X.
      AFLHCA17  SAP087X.   AFLHCA18  SAP087X.   AFLHC19_  SAP087X.
      AFLHC20_  SAP087X.   AFLHC21_  SAP087X.   AFLHC22_  SAP087X.
      AFLHC23_  SAP087X.   AFLHC24_  SAP087X.   AFLHC25_  SAP087X.
      AFLHC26_  SAP087X.   AFLHC27_  SAP087X.   AFLHC28_  SAP087X.
      AFLHC29_  SAP087X.   AFLHC30_  SAP087X.   AFLHC31_  SAP087X.
      AFLHC32_  SAP087X.   AFLHC33_  SAP087X.   AFLHC34_  SAP087X.
      AFLHCA90  SAP087X.   AFLHCA91  SAP087X.   ALTIME1   SAP297X.
      ALUNIT1   SAP298X.   ALDURA1   SAP299X.   ALDURB1   SAP300X.
      ALCHRC1   SAP301X.   ALTIME2   SAP297X.   ALUNIT2   SAP298X.
      ALDURA2   SAP299X.   ALDURB2   SAP300X.   ALCHRC2   SAP301X.
      ALTIME3   SAP297X.   ALUNIT3   SAP298X.   ALDURA3   SAP299X.
      ALDURB3   SAP300X.   ALCHRC3   SAP301X.   ALTIME4   SAP297X.
      ALUNIT4   SAP298X.   ALDURA4   SAP299X.   ALDURB4   SAP300X.
      ALCHRC4   SAP301X.   ALTIME5   SAP297X.   ALUNIT5   SAP298X.
      ALDURA5   SAP299X.   ALDURB5   SAP300X.   ALCHRC5   SAP301X.
      ALTIME6   SAP297X.   ALUNIT6   SAP298X.   ALDURA6   SAP299X.
      ALDURB6   SAP300X.   ALCHRC6   SAP301X.   ALTIME7   SAP297X.
      ALUNIT7   SAP298X.   ALDURA7   SAP299X.   ALDURB7   SAP300X.
      ALCHRC7   SAP301X.   ALTIME8   SAP297X.   ALUNIT8   SAP298X.
      ALDURA8   SAP299X.   ALDURB8   SAP300X.   ALCHRC8   SAP301X.
      ALTIME9   SAP297X.   ALUNIT9   SAP298X.   ALDURA9   SAP299X.
      ALDURB9   SAP300X.   ALCHRC9   SAP301X.   ALTIME10  SAP297X.
      ALUNIT10  SAP298X.   ALDURA10  SAP299X.   ALDURB10  SAP300X.
      ALCHRC10  SAP301X.   ALTIME11  SAP297X.   ALUNIT11  SAP298X.
      ALDURA11  SAP299X.   ALDURB11  SAP300X.   ALCHRC11  SAP301X.
      ALTIME12  SAP297X.   ALUNIT12  SAP298X.   ALDURA12  SAP299X.
      ALDURB12  SAP300X.   ALCHRC12  SAP301X.   ALTIME13  SAP297X.
      ALUNIT13  SAP298X.   ALDURA13  SAP299X.   ALDURB13  SAP300X.
      ALCHRC13  SAP301X.   ATIME14A  SAP297X.   AUNIT14A  SAP298X.
      ADURA14A  SAP299X.   ADURB14A  SAP300X.   ACHRC14A  SAP301X.
      ALTIME15  SAP297X.   ALUNIT15  SAP298X.   ALDURA15  SAP299X.
      ALDURB15  SAP300X.   ALCHRC15  SAP301X.   ALTIME16  SAP297X.
      ALUNIT16  SAP298X.   ALDURA16  SAP299X.   ALDURB16  SAP300X.
      ALCHRC16  SAP301X.   ALTIME17  SAP297X.   ALUNIT17  SAP298X.
      ALDURA17  SAP299X.   ALDURB17  SAP300X.   ALCHRC17  SAP301X.
      ALTIME18  SAP297X.   ALUNIT18  SAP298X.   ALDURA18  SAP299X.
      ALDURB18  SAP300X.   ALCHRC18  SAP301X.   ALTIME19  SAP297X.
      ALUNIT19  SAP298X.   ALDURA19  SAP299X.   ALDURB19  SAP300X.
      ALCHRC19  SAP301X.   ALTIME20  SAP297X.   ALUNIT20  SAP298X.
      ALDURA20  SAP299X.   ALDURB20  SAP300X.   ALCHRC20  SAP301X.
      ALTIME21  SAP297X.   ALUNIT21  SAP298X.   ALDURA21  SAP299X.
      ALDURB21  SAP300X.   ALCHRC21  SAP301X.   ALTIME22  SAP297X.
      ALUNIT22  SAP298X.   ALDURA22  SAP299X.   ALDURB22  SAP300X.
      ALCHRC22  SAP301X.   ALTIME23  SAP297X.   ALUNIT23  SAP298X.
      ALDURA23  SAP299X.   ALDURB23  SAP300X.   ALCHRC23  SAP301X.
      ALTIME24  SAP297X.   ALUNIT24  SAP298X.   ALDURA24  SAP299X.
      ALDURB24  SAP300X.   ALCHRC24  SAP301X.   ALTIME25  SAP297X.
      ALUNIT25  SAP298X.   ALDURA25  SAP299X.   ALDURB25  SAP300X.
      ALCHRC25  SAP301X.   ALTIME26  SAP297X.   ALUNIT26  SAP298X.
      ALDURA26  SAP299X.   ALDURB26  SAP300X.   ALCHRC26  SAP301X.
      ALTIME27  SAP297X.   ALUNIT27  SAP298X.   ALDURA27  SAP299X.
      ALDURB27  SAP300X.   ALCHRC27  SAP301X.   ALTIME28  SAP297X.
      ALUNIT28  SAP298X.   ALDURA28  SAP299X.   ALDURB28  SAP300X.
      ALCHRC28  SAP301X.   ALTIME29  SAP297X.   ALUNIT29  SAP298X.
      ALDURA29  SAP299X.   ALDURB29  SAP300X.   ALCHRC29  SAP301X.
      ALTIME30  SAP297X.   ALUNIT30  SAP298X.   ALDURA30  SAP299X.
      ALDURB30  SAP300X.   ALCHRC30  SAP301X.   ALTIME31  SAP297X.
      ALUNIT31  SAP298X.   ALDURA31  SAP299X.   ALDURB31  SAP300X.
      ALCHRC31  SAP301X.   ALTIME32  SAP297X.   ALUNIT32  SAP298X.
      ALDURA32  SAP299X.   ALDURB32  SAP300X.   ALCHRC32  SAP301X.
      ALTIME33  SAP297X.   ALUNIT33  SAP298X.   ALDURA33  SAP299X.
      ALDURB33  SAP300X.   ALCHRC33  SAP301X.   ALTIME34  SAP297X.
      ALUNIT34  SAP298X.   ALDURA34  SAP299X.   ALDURB34  SAP300X.
      ALCHRC34  SAP301X.   ALTIME90  SAP297X.   ALUNIT90  SAP298X.
      ALDURA90  SAP299X.   ALDURB90  SAP300X.   ALCHRC90  SAP301X.
      ALTIME91  SAP297X.   ALUNIT91  SAP298X.   ALDURA91  SAP299X.
      ALDURB91  SAP300X.   ALCHRC91  SAP301X.   ALCNDRT   SAP477X.
      ALCHRONR  SAP478X.

      /* AHB FORMAT ASSOCIATIONS */

      SMKEV     SAP028X.   SMKREG    SAP480X.   SMKNOW    SAP481X.
      SMKSTAT2  SAP482X.   SMKQTNO   SAP483X.   SMKQTTP   SAP484X.
      SMKQTY    SAP485X.   CIGSDA1   SAP486X.   CIGDAMO   SAP487X.
      CIGSDA2   SAP486X.   CIGSDAY   SAP486X.   CIGQTYR   SAP028X.
      ECIGEV2   SAP028X.   ECIGCUR2  SAP481X.   ECIG30D2  SAP493X.
      CIGAREV2  SAP028X.   CIGCUR2   SAP481X.   CIG30D2   SAP493X.
      PIPEV2    SAP028X.   PIPECUR2  SAP481X.   SMKLSTB1  SAP028X.
      SMKLSCR2  SAP481X.   VIGNO     SAP501X.   VIGTP     SAP502X.
      VIGFREQW  SAP503X.   VIGLNGNO  SAP504X.   VIGLNGTP  SAP505X.
      VIGMIN    SAP504X.   MODNO     SAP501X.   MODTP     SAP502X.
      MODFREQW  SAP509X.   MODLNGNO  SAP504X.   MODLNGTP  SAP505X.
      MODMIN    SAP504X.   STRNGNO   SAP501X.   STRNGTP   SAP502X.
      STRFREQW  SAP515X.   ALC1YR    SAP028X.   ALCLIFE   SAP028X.
      ALC12MNO  SAP518X.   ALC12MTP  SAP519X.   ALC12MWK  SAP520X.
      ALC12MYR  SAP521X.   ALCAMT    SAP522X.   ALCSTAT   SAP523X.
      ALC5UPN1  SAP521X.   ALC5UPT1  SAP525X.   ALC5UPY1  SAP521X.
      BINGE1    SAP493X.   AHEIGHT   SAP528X.   AWEIGHTP  SAP529X.
      BMI       SAP530X.

      /* AAU FORMAT ASSOCIATIONS */

      AUSUALPL  SAP531X.   APLKIND   SAP532X.   AHCPLROU  SAP028X.
      AHCPLKND  SAP534X.   AHCCHGYR  SAP028X.   AHCCHGHI  SAP028X.
      APRVTRYR  SAP028X.   APRVTRFD  SAP538X.   ADRNANP   SAP538X.
      ADRNAI    SAP538X.   AHCDLYR1  SAP028X.   AHCDLYR2  SAP028X.
      AHCDLYR3  SAP028X.   AHCDLYR4  SAP028X.   AHCDLYR5  SAP028X.
      AHCAFYR1  SAP028X.   AHCAFYR2  SAP028X.   AHCAFYR3  SAP028X.
      AHCAFYR4  SAP028X.   AHCAFYR5  SAP538X.   AHCAFYR6  SAP538X.
      AWORPAY   SAP552X.   AHICOMP   SAP246X.   ARX12MO   SAP028X.
      ARX12_1   SAP028X.   ARX12_2   SAP538X.   ARX12_3   SAP028X.
      ARX12_4   SAP028X.   ARX12_5   SAP028X.   ARX12_6   SAP028X.
      ADNLONG2  SAP561X.   AHCSYR1   SAP028X.   AHCSYR2   SAP028X.
      AHCSYR3   SAP028X.   AHCSYR4   SAP028X.   AHCSYR5   SAP028X.
      AHCSYR6   SAP028X.   AHCSYR7   SAP028X.   AHCSYR8   SAP028X.
      AHCSYR9   SAP028X.   AHCSYR10  SAP028X.   AHERNOY2  SAP572X.
      AERVISND  SAP028X.   AERHOS    SAP028X.   AERREA1R  SAP028X.
      AERREA2R  SAP028X.   AERREA3R  SAP028X.   AERREA4R  SAP028X.
      AERREA5R  SAP028X.   AERREA6R  SAP028X.   AERREA7R  SAP538X.
      AERREA8R  SAP538X.   AHCHYR    SAP028X.   AHCHMOYR  SAP493X.
      AHCHNOY2  SAP585X.   AHCNOYR2  SAP572X.   ASRGYR    SAP028X.
      ASRGNOYP  SAP588X.   AMDLONGR  SAP561X.   HIT1A     SAP538X.
      HIT2A     SAP028X.   HIT3A     SAP028X.   HIT4A     SAP538X.
      HIT5A     SAP538X.   FLUVACYR  SAP028X.   FLUVACTP  SAP596X.
      FLUVAC_M  SAP597X.   FLUVAC_Y  SAP598X.   FLUSHPG1  SAP599X.
      FLUSHPG2  SAP600X.   SHTPNUYR  SAP028X.   APOX      SAP028X.
      APOX12MO  SAP028X.   AHEP      SAP028X.   AHEPLIV   SAP028X.
      AHEPBTST  SAP538X.   SHTHEPB   SAP028X.   SHEPDOS   SAP608X.
      SHTHEPA   SAP028X.   SHEPANUM  SAP610X.   AHEPCTST  SAP538X.
      AHEPCRES  SAP612X.   SHINGLES  SAP028X.   SHTTD     SAP028X.
      SHTTDAP2  SAP615X.   SHTHPV2   SAP616X.   SHHPVDOS  SAP617X.
      AHPVAGE   SAP504X.   LIVEV     SAP028X.   TRAVEL    SAP028X.
      WRKHLTH2  SAP028X.   WRKDIR    SAP028X.   APSBPCHK  SAP028X.
      APSCHCHK  SAP028X.   APSBSCHK  SAP028X.   APSPAP    SAP028X.
      APSMAM    SAP028X.   APSCOL    SAP538X.   APSDIET   SAP028X.
      APSSMKC   SAP538X.   AINDINS2  SAP538X.   AINDPRCH  SAP538X.
      AINDWHO   SAP633X.   AINDDIF1  SAP634X.   AINDDIF2  SAP635X.
      AEXCHNG   SAP028X.   CLAS1     SAP637X.   CLAS2     SAP240X.
      CLAS3     SAP240X.   CLAS4     SAP240X.   CLAS5     SAP240X.

      /* ASI FORMAT ASSOCIATIONS */

      ASICPUSE  SAP642X.   ASISATHC  SAP643X.   ASITENUR  SAP644X.
      ASINHELP  SAP645X.   ASINCNTO  SAP645X.   ASINTRU   SAP645X.
      ASINKNT   SAP645X.   ASISIM    SAP649X.   ASISIF    SAP650X.
      ASIRETR   SAP651X.   ASIMEDC   SAP651X.   ASISTLV   SAP651X.
      ASICNHC   SAP651X.   ASICCOLL  SAP655X.   ASINBILL  SAP651X.
      ASIHCST   SAP651X.   ASICCMP   SAP658X.   ASISLEEP  SAP493X.
      ASISLPFL  SAP660X.   ASISLPST  SAP661X.   ASISLPMD  SAP662X.
      ASIREST   SAP663X.   ASISAD    SAP664X.   ASINERV   SAP664X.
      ASIRSTLS  SAP664X.   ASIHOPLS  SAP664X.   ASIEFFRT  SAP664X.
      ASIWTHLS  SAP664X.   ASIMUCH   SAP670X.   ASIHIVT   SAP028X.
      ASIHIVWN  SAP672X.

      /* ACH FORMAT ASSOCIATIONS */

      NAT_USM1  SAP028X.   CHE_USM1  SAP028X.   TRD_USM1  SAP028X.
      TR_USM21  SAP087X.   TR_USM22  SAP087X.   TR_USM23  SAP087X.
      TR_USM24  SAP087X.   TR_USM25  SAP087X.   TR_USM26  SAP087X.
      HOM_USM1  SAP028X.   MBO_MAN1  SAP028X.   MBO_MND1  SAP028X.
      MBO_SPR1  SAP028X.   MBO_IMG1  SAP028X.   MBO_PRO1  SAP028X.
      YTQU_YG1  SAP028X.   YTQ_BTY1  SAP028X.   YTQ_MDY1  SAP028X.
      YTQU_TA1  SAP028X.   YTQ_BTT1  SAP028X.   YTQ_MDT1  SAP028X.
      YTQU_QG1  SAP028X.   YTQ_BTQ1  SAP028X.   YTQ_MDQ1  SAP028X.

      /* AWB FORMAT ASSOCIATIONS */

      AWEBUSE   SAP028X.   AWEBOFNO  SAP504X.   AWEBOFTP  SAP699X.
      AWEBEML   SAP028X.   AWEBMNO   SAP504X.   AWEBMTP   SAP699X.;
RUN;

PROC CONTENTS DATA=NHIS.SAMADULT;
   TITLE1 'CONTENTS OF THE 2017 NHIS Sample Adult FILE';

PROC FREQ DATA=NHIS.SAMADULT NOTITLE;
   TABLES RECTYPE/LIST MISSING;
   TITLE1 'FREQUENCY REPORT FOR 2017 NHIS Sample Adult FILE';
   TITLE2 '(WEIGHTED)';
   WEIGHT WTFA_SA;

PROC FREQ DATA=NHIS.SAMADULT NOTITLE;
   TABLES RECTYPE/LIST MISSING;
   TITLE1 'FREQUENCY REPORT FOR 2017 NHIS Sample Adult FILE';
   TITLE2 '(UNWEIGHTED)';

* USER NOTE: TO SEE UNFORMATTED VALUES IN PROCEDURES, ADD THE
             STATEMENT: FORMAT _ALL_;
RUN;
