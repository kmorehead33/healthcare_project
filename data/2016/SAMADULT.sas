*********************************************************************
 JUNE 6, 2017 10:22 AM
 
 This is an example of a SAS program that creates a SAS
 file from the 2016 NHIS Public Use SAMADULT.DAT ASCII file
 
 This is stored in SAMADULT.SAS
*********************************************************************;

* USER NOTE: PLACE NEXT STATEMENT IN SUBSEQUENT PROGRAMS;
LIBNAME  NHIS     "C:\NHIS2016";

* USER NOTE: PLACE NEXT STATEMENT IN SUBSEQUENT PROGRAMS
             IF YOU ALLOW PROGRAM TO PERMANENTLY STORE FORMATS;
LIBNAME  LIBRARY  "C:\NHIS2016";

FILENAME ASCIIDAT 'C:\NHIS2016\SAMADULT.dat';

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
   VALUE SAP071X
      1                  = "1 Mentioned"
      2                  = "2 Not mentioned"
      7                  = "7 Refused"
      8                  = "8 Not ascertained"
      9                  = "9 Don't know"
   ;
   VALUE SAP102X
      85                 = "85 85+ years"
      97                 = "97 Refused"
      98                 = "98 Not ascertained"
      99                 = "99 Don't know"
   ;
   VALUE SAP140X
      1                  = "1 Yes"
      2                  = "2 No"
      3                  = "3 Borderline or prediabetes"
      7                  = "7 Refused"
      8                  = "8 Not ascertained"
      9                  = "9 Don't know"
   ;
   VALUE SAP142X
      1                  = "1 year ago or less"
      2                  = "2 	More than 1 year, but not more than 2 years ago"
      3                  = "3 More than 2 years, but not more than 3 years ago"
      4                  = "4 	More than 3 years ago"
      5                  = "5 	Never"
      7                  = "7 Refused"
      8                  = "8 Not ascertained"
      9                  = "9 Don't know"
   ;
   VALUE SAP144X
      00                 = "00 Within past year"
      85                 = "85 85+ years"
      96                 = "96 1+ year(s) with diabetes and age is 85+"
      97                 = "97 Refused"
      98                 = "98 Not ascertained"
      99                 = "99 Don't know"
   ;
   VALUE SAP145X
      1                  = "1 Type 1"
      2                  = "2 Type 2"
      3                  = "3 Other"
      7                  = "7 Refused"
      8                  = "8 Not ascertained"
      9                  = "9 Don't know"
   ;
   VALUE SAP148X
      1                  = "1 Less than 1 month"
      2                  = "2 1 month to less than 6 months"
      3                  = "3 	6 months to less than 1 year"
      4                  = "4 1 year or more"
      7                  = "7 Refused"
      8                  = "8 Not ascertained"
      9                  = "9 Don't know"
   ;
   VALUE SAP155X
      1                  = "1 	Very interested"
      2                  = "2 	Somewhat interested"
      3                  = "3 Not interested"
      7                  = "7 Refused"
      8                  = "8 Not ascertained"
      9                  = "9 Don't know"
   ;
   VALUE SAP194X
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
   VALUE SAP211X
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
   VALUE SAP217X
      1                  = "1 Less than one month"
      2                  = "2 1-12 months"
      3                  = "3 13-24 months"
      4                  = "4 More than 2 years"
      5                  = "5 Never"
      7                  = "7 Refused"
      8                  = "8 Not ascertained"
      9                  = "9 Don't know"
   ;
   VALUE SAP219X
      1                  = "1 Always"
      2                  = "2 Most of the time"
      3                  = "3 Some of the time"
      4                  = "4 None of the time"
      7                  = "7 Refused"
      8                  = "8 Not ascertained"
      9                  = "9 Don't know"
   ;
   VALUE SAP221X
      1                  = "1 Never"
      2                  = "2 Some days"
      3                  = "3 Most days"
      4                  = "4 Every day"
      7                  = "7 Refused"
      8                  = "8 Not ascertained"
      9                  = "9 Don't know"
   ;
   VALUE SAP223X
      000                = "000 None"
      997                = "997 Refused"
      998                = "998 Not ascertained"
      999                = "999 Don't know"
   ;
   VALUE SAP225X
      1                  = "1 Better"
      2                  = "2 Worse"
      3                  = "3 About the same"
      7                  = "7 Refused"
      8                  = "8 Not ascertained"
      9                  = "9 Don't know"
   ;
   VALUE SAP227X
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
   VALUE SAP239X
      1                  = "1 Limited in any way"
      2                  = "2 Not limited in any way"
      3                  = "3 Unknown if limited"
   ;
   VALUE SAP276X
      95                 = "95 95+"
      96                 = "96 Since birth"
      97                 = "97 Refused"
      98                 = "98 Not ascertained"
      99                 = "99 Don't know"
   ;
   VALUE SAP277X
      1                  = "1 Day(s)"
      2                  = "2 Week(s)"
      3                  = "3 Month(s)"
      4                  = "4 Year(s)"
      6                  = "6 Since birth"
      7                  = "7 Refused"
      8                  = "8 Not ascertained"
      9                  = "9 Don't know"
   ;
   VALUE SAP278X
      00                 = "00 Less than 1 year"
      85                 = "85 85+ years"
      96                 = "96 Unknown number of years"
      97                 = "97 Refused"
      98                 = "98 Not ascertained"
      99                 = "99 Don't know"
   ;
   VALUE SAP279X
      1                  = "1 Less than 3 months"
      2                  = "2 3-5 months"
      3                  = "3 6-12 months"
      4                  = "4 More than 1 year"
      7                  = "7 Refused"
      8                  = "8 Not ascertained"
      9                  = "9 Don't know"
   ;
   VALUE SAP280X
      1                  = "1 Chronic"
      2                  = "2 Not chronic"
      9                  = "9 Unknown if chronic"
   ;
   VALUE SAP456X
      1                  = 
"1 At least one condition causing functional limitation is chronic"
      2                  = "2 No condition causing functional limitation"
      9                  = 
"9 Unknown if any condition causing functional limitation is chronic"
   ;
   VALUE SAP457X
      0                  = 
"0 Not limited in any way (including unknown if limited)"
      1                  = "1 Limited; caused by at least one chronic condition"
      2                  = "2 Limited; not caused by chronic condition"
      3                  = "3 Limited; unknown if condition is chronic"
   ;
   VALUE SAP459X
      85                 = "85 85 years or older"
      96                 = "96 Never smoked regularly"
      97                 = "97 Refused"
      98                 = "98 Not ascertained"
      99                 = "99 Don't know"
   ;
   VALUE SAP460X
      1                  = "1 Every day"
      2                  = "2 Some days"
      3                  = "3 Not at all"
      7                  = "7 Refused"
      8                  = "8 Not ascertained"
      9                  = "9 Don't know"
   ;
   VALUE SAP461X
      1                  = "1 Current every day smoker"
      2                  = "2 Current some day smoker"
      3                  = "3 Former smoker"
      4                  = "4 Never smoker"
      5                  = "5 Smoker, current status unknown"
      9                  = "9 Unknown if ever smoked"
   ;
   VALUE SAP462X
      95                 = "95 95+"
      97                 = "97 Refused"
      98                 = "98 Not ascertained"
      99                 = "99 Don't know"
   ;
   VALUE SAP463X
      1                  = "1 Day(s)"
      2                  = "2 Week(s)"
      3                  = "3 Month(s)"
      4                  = "4 Year(s)"
      7                  = "7 Refused"
      8                  = "8 Not ascertained"
      9                  = "9 Don't know"
   ;
   VALUE SAP464X
      00                 = "00 Less than 1 year"
      70                 = "70 70+ years"
      97                 = "97 Refused"
      98                 = "98 Not ascertained"
      99                 = "99 Don't know"
   ;
   VALUE SAP465X
      95                 = "95 95+ cigarettes"
      97                 = "97 Refused"
      98                 = "98 Not ascertained"
      99                 = "99 Don't know"
   ;
   VALUE SAP466X
      00                 = "00 None"
      97                 = "97 Refused"
      98                 = "98 Not ascertained"
      99                 = "99 Don't know"
   ;
   VALUE SAP472X
      97                 = "97 Refused"
      98                 = "98 Not ascertained"
      99                 = "99 Don't know"
   ;
   VALUE SAP480X
      000                = "000 Never"
      996                = "996 Unable to do this type activity"
      997                = "997 Refused"
      998                = "998 Not ascertained"
      999                = "999 Don't know"
   ;
   VALUE SAP481X
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
   VALUE SAP482X
      00                 = "00 Less than once per week"
      95                 = "95 Never"
      96                 = "96 Unable to do vigorous activity"
      97                 = "97 Refused"
      98                 = "98 Not ascertained"
      99                 = "99 Don't know"
   ;
   VALUE SAP483X
      997                = "997 Refused"
      998                = "998 Not ascertained"
      999                = "999 Don't know"
   ;
   VALUE SAP484X
      1                  = "1 Minutes"
      2                  = "2 Hours"
      7                  = "7 Refused"
      8                  = "8 Not ascertained"
      9                  = "9 Don't know"
   ;
   VALUE SAP488X
      00                 = "00 Less than once per week"
      95                 = "95 Never"
      96                 = "96 Unable to do light or moderate activity"
      97                 = "97 Refused"
      98                 = "98 Not ascertained"
      99                 = "99 Don't know"
   ;
   VALUE SAP494X
      00                 = "00 Less than once per week"
      95                 = "95 Never"
      96                 = "96 Unable to do strength activity"
      97                 = "97 Refused"
      98                 = "98 Not ascertained"
      99                 = "99 Don't know"
   ;
   VALUE SAP497X
      000                = "000 Never"
      997                = "997 Refused"
      998                = "998 Not ascertained"
      999                = "999 Don't know"
   ;
   VALUE SAP498X
      0                  = "0 Never/None"
      1                  = "1 Week"
      2                  = "2 Month"
      3                  = "3 Year"
      7                  = "7 Refused"
      8                  = "8 Not ascertained"
      9                  = "9 Don't know"
   ;
   VALUE SAP499X
      00                 = "00 Less than one day per week"
      95                 = "95 Did not drink in past year"
      97                 = "97 Refused"
      98                 = "98 Not ascertained"
      99                 = "99 Don't know"
   ;
   VALUE SAP500X
      000                = "000 Never/none"
      997                = "997 Refused"
      998                = "998 Not ascertained"
      999                = "999 Don't know"
   ;
   VALUE SAP501X
      95                 = "95 95+ drinks"
      97                 = "97 Refused"
      98                 = "98 Not ascertained"
      99                 = "99 Don't know"
   ;
   VALUE SAP502X
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
   VALUE SAP504X
      0                  = "0 Never/None"
      1                  = "1 Per week"
      2                  = "2 Per month"
      3                  = "3 Per year"
      7                  = "7 Refused"
      8                  = "8 Not ascertained"
      9                  = "9 Don't know"
   ;
   VALUE SAP507X
      96                 = "96 Not available"
      97                 = "97 Refused"
      98                 = "98 Not ascertained"
      99                 = "99 Don't know"
   ;
   VALUE SAP508X
      996                = "996 Not available"
      997                = "997 Refused"
      998                = "998 Not ascertained"
      999                = "999 Don't know"
   ;
   VALUE SAP509X
      99.95              = "99.95 99.95+"
      99.99              = "99.99 Unknown"
   ;
   VALUE SAP510X
      1                  = "1 Yes"
      2                  = "2 There is NO place"
      3                  = "3 There is MORE THAN ONE place"
      7                  = "7 Refused"
      8                  = "8 Not ascertained"
      9                  = "9 Don't know"
   ;
   VALUE SAP511X
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
   VALUE SAP513X
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
   VALUE SAP517X
      1                  = "1 Yes"
      2                  = "2 No"
      7                  = "7 Refused"
      8                  = "8 Not ascertained"
      9                  = "9 Don’t know"
   ;
   VALUE SAP531X
      1                  = "1 Very worried"
      2                  = "2 Somewhat worried"
      3                  = "3 Not at all worried"
      7                  = "7 Refused"
      8                  = "8 Not ascertained"
      9                  = "9 Don't know"
   ;
   VALUE SAP540X
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
   VALUE SAP551X
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
   VALUE SAP564X
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
   VALUE SAP567X
      07                 = "07 7+ times"
      97                 = "97 Refused"
      98                 = "98 Not ascertained"
      99                 = "99 Don't know"
   ;
   VALUE SAP575X
      1                  = "1 Flu shot"
      2                  = "2 Flu nasal spray (spray, mist or drop in nose)"
      7                  = "7 Refused"
      8                  = "8 Not ascertained"
      9                  = "9 Don't know"
   ;
   VALUE SAP576X
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
   VALUE SAP577X
      .                   = '.'
      OTHER              = "Year"
      9997               = "9997 Refused"
      9998               = "9998 Not ascertained"
      9999               = "9999 Don't know"
   ;
   VALUE SAP578X
      1                  = "1 Before this pregnancy"
      2                  = "2 During this pregnancy"
      7                  = "7 Refused"
      8                  = "8 Not ascertained"
      9                  = "9 Don't know"
   ;
   VALUE SAP579X
      1                  = "1 Before this pregnancy"
      2                  = "2 During this pregnancy"
      3                  = "3 After this pregnancy"
      7                  = "7 Refused"
      8                  = "8 Not ascertained"
      9                  = "9 Don't know"
   ;
   VALUE SAP587X
      1                  = "1 Received at least 3 doses"
      2                  = "2 Received less than 3 doses"
      7                  = "7 Refused"
      8                  = "8 Not ascertained"
      9                  = "9 Don't know"
   ;
   VALUE SAP589X
      96                 = "96 Received all shots"
      97                 = "97 Refused"
      98                 = "98 Not ascertained"
      99                 = "99 Don't know"
   ;
   VALUE SAP591X
      1                  = 
"1 You or your doctor thought you were at risk of having hepatitis C because a b
lood test or symptoms like fatigue, nausea, stomach pain, yellowing of the eyes 
or skin indicated you might have liver disease"
      2                  = "2 You were born from 1945 through 1965"
      3                  = 
"3 You were at risk of hepatitis C infection due to exposure to blood on your jo
b, injection drug use or receipt of transfusion before 1992"
      4                  = "4 Some other reason"
      7                  = "7 Refused"
      8                  = "8 Not ascertained"
      9                  = "9 Don’t know"
   ;
   VALUE SAP595X
      1                  = "1 Yes-included pertussis"
      2                  = "2 No-did not include pertussis"
      3                  = "3 Doctor did not say"
      7                  = "7 Refused"
      8                  = "8 Not ascertained"
      9                  = "9 Don't know"
   ;
   VALUE SAP596X
      1                  = "1 Yes"
      2                  = "2 No"
      3                  = "3 Doctor refused when asked"
      7                  = "7 Refused"
      8                  = "8 Not ascertained"
      9                  = "9 Don't know"
   ;
   VALUE SAP597X
      50                 = "50 50+ shots"
      96                 = "96 All shots"
      97                 = "97 Refused"
      98                 = "98 Not ascertained"
      99                 = "99 Don't know"
   ;
   VALUE SAP613X
      1                  = "1 Self"
      2                  = "2 Someone else in family"
      3                  = "3 Both"
      7                  = "7 Refused"
      8                  = "8 Not ascertained"
      9                  = "9 Don’t know"
   ;
   VALUE SAP614X
      1                  = "1 Very difficult"
      2                  = "2 Somewhat difficult"
      3                  = "3 Not at all difficult"
      7                  = "7 Refused"
      8                  = "8 Not ascertained"
      9                  = "9 Don’t know"
   ;
   VALUE SAP615X
      1                  = "1 Very difficult"
      2                  = "2 Somewhat difficult"
      3                  = "3 Not at all difficult"
      7                  = "7 Refused"
      8                  = "8 Not ascertained"
      9                  = "9 Don't know"
   ;
   VALUE SAP617X
      1                  = "1 Never or almost never"
      2                  = "2 Some days"
      3                  = "3 Most days"
      4                  = "4 Every day"
      7                  = "7 Refused"
      8                  = "8 Not ascertained"
      9                  = "9 Don't know"
   ;
   VALUE SAP618X
      1                  = "1 Very satisfied"
      2                  = "2 Somewhat satisfied"
      3                  = "3 Somewhat dissatisfied"
      4                  = "4 Very dissatisfied"
      5                  = "5 You haven't had health care in the past 12 months"
      7                  = "7 Refused"
      8                  = "8 Not ascertained"
      9                  = "9 Don't know"
   ;
   VALUE SAP619X
      1                  = "1 Less than 1 year"
      2                  = "2 1-3 years"
      3                  = "3 4-10 years"
      4                  = "4 11-20 years"
      5                  = "5 More than 20 years"
      7                  = "7 Refused"
      8                  = "8 Not ascertained"
      9                  = "9 Don't know"
   ;
   VALUE SAP620X
      1                  = "1 Definitely agree"
      2                  = "2 Somewhat agree"
      3                  = "3 Somewhat disagree"
      4                  = "4 Definitely disagree"
      7                  = "7 Refused"
      8                  = "8 Not ascertained"
      9                  = "9 Don't know"
   ;
   VALUE SAP624X
      1                  = "1 Gay"
      2                  = "2 Straight, that is, not gay"
      3                  = "3 Bisexual"
      4                  = "4 Something else"
      5                  = "5 I don't know the answer"
      7                  = "7 Refused"
      8                  = "8 Not ascertained"
   ;
   VALUE SAP625X
      1                  = "1 Lesbian or gay"
      2                  = "2 Straight, that is, not lesbian or gay"
      3                  = "3 Bisexual"
      4                  = "4 Something else"
      5                  = "5 I don't know the answer"
      7                  = "7 Refused"
      8                  = "8 Not ascertained"
   ;
   VALUE SAP626X
      1                  = "1 Very worried"
      2                  = "2 Moderately worried"
      3                  = "3 Not too worried"
      4                  = "4 Not worried at all"
      7                  = "7 Refused"
      8                  = "8 Not ascertained"
      9                  = "9 Don't know"
   ;
   VALUE SAP630X
      1                  = "1 Very worried"
      2                  = "2 Moderately worried"
      3                  = "3 Not too worried"
      4                  = "4 Not worried at all"
      5                  = "5 This does not apply to me"
      7                  = "7 Refused"
      8                  = "8 Not ascertained"
      9                  = "9 Don't know"
   ;
   VALUE SAP633X
      1                  = "1 Very worried"
      2                  = "2 Moderately worried"
      3                  = "3 Not too worried"
      4                  = "4 Not worried at all"
      5                  = "5 I don't have credit cards"
      7                  = "7 Refused"
      8                  = "8 Not ascertained"
      9                  = "9 Don't know"
   ;
   VALUE SAP635X
      00                 = 
"00 Did not have trouble falling asleep in the past week"
      07                 = "07 7 or more times"
      97                 = "97 Refused"
      98                 = "98 Not ascertained"
      99                 = "99 Don't know"
   ;
   VALUE SAP636X
      00                 = 
"00 Did not have trouble staying asleep in the past week"
      07                 = "07 7 or more times"
      97                 = "97 Refused"
      98                 = "98 Not ascertained"
      99                 = "99 Don't know"
   ;
   VALUE SAP637X
      00                 = 
"00 Did not take medication to help sleep in the past week"
      07                 = "07 7 or more times"
      97                 = "97 Refused"
      98                 = "98 Not ascertained"
      99                 = "99 Don't know"
   ;
   VALUE SAP638X
      00                 = "00 Never felt rested in the past week"
      97                 = "97 Refused"
      98                 = "98 Not ascertained"
      99                 = "99 Don't know"
   ;
   VALUE SAP639X
      1                  = "1 ALL of the time"
      2                  = "2 MOST of the time"
      3                  = "3 SOME of the time"
      4                  = "4 A LITTLE of the time"
      5                  = "5 NONE of the time"
      7                  = "7 Refused"
      8                  = "8 Not ascertained"
      9                  = "9 Don't know"
   ;
   VALUE SAP645X
      1                  = "1 A lot"
      2                  = "2 Some"
      3                  = "3 A little"
      4                  = "4 Not at all"
      7                  = "7 Refused"
      8                  = "8 Not ascertained"
      9                  = "9 Don't know"
   ;
   VALUE SAP648X
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
   VALUE SAP650X
      85                 = "85 85+ years"
      96                 = "96 Since birth"
      97                 = "97 Refused"
      98                 = "98 Not ascertained"
      99                 = "99 Don't know"
   ;
   VALUE SAP668X
      01                 = "01 the spinning, vertigo, or motion sensation"
      02                 = "02 the floating, spacey, or disconnected feeling"
      03                 = "03 the feeling of lightheadedness"
      04                 = "04 the feeling like you are about to pass out"
      05                 = "05 Blurred vision"
      06                 = "06 Unsteadiness"
      07                 = "07 Other dizziness or balance problem"
      97                 = "97 Refused"
      98                 = "98 Not ascertained"
      99                 = "99 Don't know"
   ;
   VALUE SAP670X
      996                = "996 Constantly or almost always"
      997                = "997 Refused"
      998                = "998 Not ascertained"
      999                = "999 Don't know"
   ;
   VALUE SAP671X
      1                  = "1 Day(s)"
      2                  = "2 Week(s)"
      3                  = "3 Month(s)"
      4                  = "4 Year"
      6                  = "6 Constantly or almost always"
      7                  = "7 Refused"
      8                  = "8 Not ascertained"
      9                  = "9 Don't know"
   ;
   VALUE SAP672X
      01                 = "01 Momentary, or less than two minutes"
      02                 = "02 Two minutes to less than 20 minutes"
      03                 = "03 20 minutes to less than 8 hours"
      04                 = "04 8 hours to less than 24 hours"
      05                 = "05 1 day to less than 14 days"
      06                 = "06 2 weeks to less than 3 months"
      07                 = "07 3 months or longer"
      97                 = "97 Refused"
      98                 = "98 Not ascertained"
      99                 = "99 Don't know"
   ;
   VALUE SAP690X
      1                  = "1 Only"
      2                  = "2 Regardless"
      7                  = "7 Refused"
      8                  = "8 Not ascertained"
      9                  = "9 Don't know"
   ;
   VALUE SAP698X
      0                  = "0 None"
      1                  = "1 1 time"
      2                  = "2 2 times"
      3                  = "3 3-4 times"
      4                  = "4 5-9 times"
      5                  = "5 10-14 times"
      6                  = "6 15 or more times"
      7                  = "7 Refused"
      8                  = "8 Not ascertained"
      9                  = "9 Don't know"
   ;
   VALUE SAP716X
      1                  = "1 Less than 12 months"
      2                  = "2 12 months to less than 3 years"
      3                  = "3 years to less than 5 years"
      4                  = "4 5 years to less than 10 years"
      5                  = "5 10 years to less than 15 years"
      6                  = "6 15 years or more"
      7                  = "7 Refused"
      8                  = "8 Not ascertained"
      9                  = "9 Don't know"
   ;
   VALUE SAP717X
      1                  = "1 No help at all"
      2                  = "2 A little help"
      3                  = "3 Moderate help"
      4                  = "4 A lot of help"
      5                  = "5 Problem was cured or no longer exists"
      7                  = "7 Refused"
      8                  = "8 Not ascertained"
      9                  = "9 Don't know"
   ;
   VALUE SAP751X
      1                  = "1 Gotten worse"
      2                  = "2 Stayed the same"
      3                  = "3 Improved somewhat"
      4                  = "4 Improved greatly"
      7                  = "7 Refused"
      8                  = "8 Not ascertained"
      9                  = "9 Don't know"
   ;
   VALUE SAP763X
      1                  = "1 No problem"
      2                  = "2 A small problem"
      3                  = "3 A moderate problem"
      4                  = "4 A big problem"
      5                  = "5 A very big problem"
      7                  = "7 Refused"
      8                  = "8 Not ascertained"
      9                  = "9 Don't know"
   ;
   VALUE SAP780X
      1                  = "1 Day(s)"
      2                  = "2 Week(s)"
      3                  = "3 Month(s)"
      7                  = "7 Refused"
      8                  = "8 Not ascertained"
      9                  = "9 Don't know"
   ;
   VALUE SAP781X
      0                  = "0 None"
      1                  = "1 1 time"
      2                  = "2 2 times"
      3                  = "3 3-4 times"
      4                  = "4 5-7 times"
      5                  = "5 8 or more times"
      7                  = "7 Refused"
      8                  = "8 Not ascertained"
      9                  = "9 Don't know"
   ;
   VALUE SAP783X
      996                = "996 Doesn't work or go to school"
      997                = "997 Refused"
      998                = "998 Not ascertained"
      999                = "999 Don't know"
   ;
   VALUE SAP796X
      0                  = "0 None"
      1                  = "1 1 time"
      2                  = "2 2 times"
      3                  = "3 3 to 4 times"
      4                  = "4 5 to 7 times"
      5                  = "5 8 or more times"
      7                  = "7 Refused"
      8                  = "8 Not ascertained"
      9                  = "9 Don't know"
   ;
   VALUE SAP802X
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
   INFILE ASCIIDAT PAD LRECL=1065;

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

      HYPEV      3   HYPDIFV    3   HYPYR1     3   HYPMDEV2   3
      HYPMED2    3   CHLEV      3   CHLYR      3   CHLMDEV2   3
      CHLMDNW2   3   CHDEV      3   ANGEV      3   MIEV       3
      HRTEV      3   STREV      3   EPHEV      3   COPDEV     3
      ASPMEDEV   3   ASPMEDAD   3   ASPMDMED   3   ASPONOWN   3
      AASMEV     3   AASSTILL   3   AASMYR     3   AASERYR1   3
      ULCEV      3   ULCYR      3   ULCCOLEV   3   CANEV      3
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
      DIBBEGIN   3   AHAYFYR    3   SINYR      3   CBRCHYR    3
      KIDWKYR    3   LIVYR      3   JNTSYMP    3   JMTHP1     3
      JMTHP2     3   JMTHP3     3   JMTHP4     3   JMTHP5     3
      JMTHP6     3   JMTHP7     3   JMTHP8     3   JMTHP9     3
      JMTHP10    3   JMTHP11    3   JMTHP12    3   JMTHP13    3
      JMTHP14    3   JMTHP15    3   JMTHP16    3   JMTHP17    3
      JNTCHR     3   JNTHP      3   ARTH1      3   ARTHLMT    3
      PAINECK    3   PAINLB     3   PAINLEG    3   PAINFACE   3
      AMIGR      3   ACOLD2W    3   AINTIL2W   3   PREGNOW    3
      PREGFLYR   3   HRAIDNOW   3   HRAIDEV    3   AHEARST1   3
      AVISION    3   ABLIND     3   VIM_DREV   3   VIMLS_DR   3
      VIM_CAEV   3   VIMLS_CA   3   VIMCSURG   3   VIM_GLEV   3
      VIMLS_GL   3   VIM_MDEV   3   VIMLS_MD   3   VIMGLASS   3
      VIMREAD    3   VIMDRIVE   3   AVISREH    3   AVISDEV    3
      AVDF_NWS   3   AVDF_CLS   3   AVDF_NIT   3   AVDF_DRV   3
      AVDF_PER   3   AVDF_CRD   3   AVISEXAM   3   AVISACT    3
      AVISPROT   3   LUPPRT     3   CHPAIN6M   3   PAINLMT    3

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
      SHTTD05    3   SHTTDAP2   3   SHTHPV2    3   SHHPVDOS   3
      AHPVAGE    4   LIVEV      3   TRAVEL     3   WRKHLTH2   3
      WRKDIR     3   APSBPCHK   3   APSCHCHK   3   APSBSCHK   3
      APSPAP     3   APSMAM     3   APSCOL     3   APSDIET    3
      APSSMKC    3   AINDINS2   3   AINDPRCH   3   AINDWHO    3
      AINDDIF1   3   AINDDIF2   3   AEXCHNG    3

      /* ASI LENGTHS */

      ASICPUSE   3   ASISATHC   3   ASITENUR   3   ASINHELP   3
      ASINCNTO   3   ASINTRU    3   ASINKNT    3   ASISIM     3
      ASISIF     3   ASIRETR    3   ASIMEDC    3   ASISTLV    3
      ASICNHC    3   ASICCOLL   3   ASINBILL   3   ASIHCST    3
      ASICCMP    3   ASISLEEP   3   ASISLPFL   3   ASISLPST   3
      ASISLPMD   3   ASIREST    3   ASISAD     3   ASINERV    3
      ASIRSTLS   3   ASIHOPLS   3   ASIEFFRT   3   ASIWTHLS   3
      ASIMUCH    3   ACIBLD12   3   ASIHIVT    3   ASIHIVWN   3

      /* BAL LENGTHS */

      BALEV      3   BALAGE_P   3   BDIZZ1     3   BRPROB1    3
      BRPROB2    3   BRPROB3    3   BRPROB4    3   BRPROB5    3
      BRPROB6    3   BRPROB7    3   BPROB_CT   3   BTYPE_1    3
      BTYPE_2    3   BTYPE_3    3   BTYPE_4    3   BTYPE_5    3
      BTYPE_6    3   BTYPE_7    3   BTYPE_CT   3   BBOTH1     3
      BAGE1_P    3   BOFTN      4   BOFTT      3   BLAST1     3
      BTRG_01    3   BTRG_02    3   BTRG_03    3   BTRG_04    3
      BTRG_05    3   BTRG_06    3   BTRG_07    3   BTRG_08    3
      BTRG_09    3   BTRG_10    3   BSAME_1    3   BSAME_2    3
      BSAME_3    3   BSAME_4    3   BSAME_5    3   BSAME_6    3
      BSAME_7    3   BONLY_1    3   BONLY_2    3   BONLY_3    3
      BONLY_4    3   BONLY_5    3   BONLY_6    3   BONLY_7    3
      BHOSP2     3   BHOSPNO1   3   BHP1       3   BHP1_01    3
      BHP1_02    3   BHP1_03    3   BHP1_04    3   BHP1_05    3
      BHP1_06    3   BHP1_07    3   BHP1_08    3   BHP1_09    3
      BHP1_10    3   BHP1_11    3   BHP1_12    3   BHP1_13    3
      BHP1_14    3   BHP1_15    3   B5YRS1     3   BFIRST1    3
      BHELP1     3   BTHLP_N    4   BTHLP_T    3   BDIAG1     3
      BCAUS101   3   BCAUS102   3   BCAUS103   3   BCAUS104   3
      BCAUS105   3   BCAUS106   3   BCAUS107   3   BCAUS108   3
      BCAUS109   3   BCAUS110   3   BCAUS111   3   BCAUS112   3
      BCAUS113   3   BCAUS114   3   BTRET1     3   BTRT1_01   3
      BTRT1_02   3   BTRT1_03   3   BTRT1_04   3   BTRT1_06   3
      BTRT1_07   3   BTRT1_08   3   BTRT1_09   3   BTRT1_10   3
      BTRT1_11   3   BTRT1_12   3   BTRT1_13   3   BTRT1_14   3
      BTRT1_15   3   BTRT1_16   3   BSTAT1     3   BMEDIC1    3
      BCHNG1     3   BCHG1_01   3   BCHG1_02   3   BCHG1_03   3
      BCHG1_04   3   BCHG1_05   3   BCHG1_06   3   BCHG1_07   3
      BM12WS     4   BM12RA     4   BPROB1     3   BMED_1     3
      BMED_2     3   BMED_3     3   BMED_4     3   BBIO1      3
      BFALL12M   3   BFALL5Y    3   BFL1_01    3   BFL1_02    3
      BFL1_03    3   BFL1_04    3   BFL1_05    3   BFL1_06    3
      BFL1_07    3   BFALL12A   3   BF12M_NO   4   BF12M_TP   3
      BFTIME1    3   BINJ1      3   BINJWS     4   BINJHP     3
      BINJHPN    3   BFWH_01    3   BFWH_02    3   BFWH_03    3
      BFWH_04    3   BFWH_05    3   BFWH_06    3   BFWH_07    3
      BFWH_08    3   BFWH_09    3   BFWH_10    3   BNRFALL    3
      BINTHI     3   BINTTR     3   BINTRS     3

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
      HYPYR1       84 -  84    HYPMDEV2     85 -  85
      HYPMED2      86 -  86    CHLEV        87 -  87
      CHLYR        88 -  88    CHLMDEV2     89 -  89
      CHLMDNW2     90 -  90    CHDEV        91 -  91
      ANGEV        92 -  92    MIEV         93 -  93
      HRTEV        94 -  94    STREV        95 -  95
      EPHEV        96 -  96    COPDEV       97 -  97
      ASPMEDEV     98 -  98    ASPMEDAD     99 -  99
      ASPMDMED    100 - 100    ASPONOWN    101 - 101
      AASMEV      102 - 102    AASSTILL    103 - 103
      AASMYR      104 - 104    AASERYR1    105 - 105
      ULCEV       106 - 106    ULCYR       107 - 107
      ULCCOLEV    108 - 108    CANEV       109 - 109
      CNKIND1     110 - 110    CNKIND2     111 - 111
      CNKIND3     112 - 112    CNKIND4     113 - 113
      CNKIND5     114 - 114    CNKIND6     115 - 115
      CNKIND7     116 - 116    CNKIND8     117 - 117
      CNKIND9     118 - 118    CNKIND10    119 - 119
      CNKIND11    120 - 120    CNKIND12    121 - 121
      CNKIND13    122 - 122    CNKIND14    123 - 123
      CNKIND15    124 - 124    CNKIND16    125 - 125
      CNKIND17    126 - 126    CNKIND18    127 - 127
      CNKIND19    128 - 128    CNKIND20    129 - 129
      CNKIND21    130 - 130    CNKIND22    131 - 131
      CNKIND23    132 - 132    CNKIND24    133 - 133
      CNKIND25    134 - 134    CNKIND26    135 - 135
      CNKIND27    136 - 136    CNKIND28    137 - 137
      CNKIND29    138 - 138    CNKIND30    139 - 139
      CNKIND31    140 - 140    CANAGE1     141 - 143
      CANAGE2     144 - 146    CANAGE3     147 - 149
      CANAGE4     150 - 152    CANAGE5     153 - 155
      CANAGE6     156 - 158    CANAGE7     159 - 161
      CANAGE8     162 - 164    CANAGE9     165 - 167
      CANAGE10    168 - 170    CANAGE11    171 - 173
      CANAGE12    174 - 176    CANAGE13    177 - 179
      CANAGE14    180 - 182    CANAGE15    183 - 185
      CANAGE16    186 - 188    CANAGE17    189 - 191
      CANAGE18    192 - 194    CANAGE19    195 - 197
      CANAGE20    198 - 200    CANAGE21    201 - 203
      CANAGE22    204 - 206    CANAGE23    207 - 209
      CANAGE24    210 - 212    CANAGE25    213 - 215
      CANAGE26    216 - 218    CANAGE27    219 - 221
      CANAGE28    222 - 224    CANAGE29    225 - 227
      CANAGE30    228 - 230    PREGEVER    231 - 231
      DBHVPAY     232 - 232    DBHVCLY     233 - 233
      DBHVWLY     234 - 234    DBHVPAN     235 - 235
      DBHVCLN     236 - 236    DBHVWLN     237 - 237
      DIBREL      238 - 238    DIBEV1      239 - 239
      DIBPRE2     240 - 240    DIBTEST     241 - 241
      DIBAGE1     242 - 243    DIFAGE2     244 - 245
      DIBTYPE     246 - 246    DIBPILL1    247 - 247
      INSLN1      248 - 248    DIBINS2     249 - 249
      DIBINS3     250 - 250    DIBINS4     251 - 251
      DIBGDM      252 - 252    DIBBABY     253 - 253
      DIBPRGM     254 - 254    DIBREFER    255 - 255
      DIBBEGIN    256 - 256    AHAYFYR     257 - 257
      SINYR       258 - 258    CBRCHYR     259 - 259
      KIDWKYR     260 - 260    LIVYR       261 - 261
      JNTSYMP     262 - 262    JMTHP1      263 - 263
      JMTHP2      264 - 264    JMTHP3      265 - 265
      JMTHP4      266 - 266    JMTHP5      267 - 267
      JMTHP6      268 - 268    JMTHP7      269 - 269
      JMTHP8      270 - 270    JMTHP9      271 - 271
      JMTHP10     272 - 272    JMTHP11     273 - 273
      JMTHP12     274 - 274    JMTHP13     275 - 275
      JMTHP14     276 - 276    JMTHP15     277 - 277
      JMTHP16     278 - 278    JMTHP17     279 - 279
      JNTCHR      280 - 280    JNTHP       281 - 281
      ARTH1       282 - 282    ARTHLMT     283 - 283
      PAINECK     284 - 284    PAINLB      285 - 285
      PAINLEG     286 - 286    PAINFACE    287 - 287
      AMIGR       288 - 288    ACOLD2W     289 - 289
      AINTIL2W    290 - 290    PREGNOW     291 - 291
      PREGFLYR    292 - 292    HRAIDNOW    293 - 293
      HRAIDEV     294 - 294    AHEARST1    295 - 295
      AVISION     296 - 296    ABLIND      297 - 297
      VIM_DREV    298 - 298    VIMLS_DR    299 - 299
      VIM_CAEV    300 - 300    VIMLS_CA    301 - 301
      VIMCSURG    302 - 302    VIM_GLEV    303 - 303
      VIMLS_GL    304 - 304    VIM_MDEV    305 - 305
      VIMLS_MD    306 - 306    VIMGLASS    307 - 307
      VIMREAD     308 - 308    VIMDRIVE    309 - 309
      AVISREH     310 - 310    AVISDEV     311 - 311
      AVDF_NWS    312 - 312    AVDF_CLS    313 - 313
      AVDF_NIT    314 - 314    AVDF_DRV    315 - 315
      AVDF_PER    316 - 316    AVDF_CRD    317 - 317
      AVISEXAM    318 - 318    AVISACT     319 - 319
      AVISPROT    320 - 320    LUPPRT      321 - 321
      CHPAIN6M    322 - 322    PAINLMT     323 - 323


      /* AHS LOCATIONS */

      WKDAYR      324 - 326    BEDDAYR     327 - 329
      AHSTATYR    330 - 330    SPECEQ      331 - 331
      FLWALK      332 - 332    FLCLIMB     333 - 333
      FLSTAND     334 - 334    FLSIT       335 - 335
      FLSTOOP     336 - 336    FLREACH     337 - 337
      FLGRASP     338 - 338    FLCARRY     339 - 339
      FLPUSH      340 - 340    FLSHOP      341 - 341
      FLSOCL      342 - 342    FLRELAX     343 - 343
      FLA1AR      344 - 344    AFLHCA1     345 - 345
      AFLHCA2     346 - 346    AFLHCA3     347 - 347
      AFLHCA4     348 - 348    AFLHCA5     349 - 349
      AFLHCA6     350 - 350    AFLHCA7     351 - 351
      AFLHCA8     352 - 352    AFLHCA9     353 - 353
      AFLHCA10    354 - 354    AFLHCA11    355 - 355
      AFLHCA12    356 - 356    AFLHCA13    357 - 357
      ALHCA14A    358 - 358    AFLHCA15    359 - 359
      AFLHCA16    360 - 360    AFLHCA17    361 - 361
      AFLHCA18    362 - 362    AFLHC19_    363 - 363
      AFLHC20_    364 - 364    AFLHC21_    365 - 365
      AFLHC22_    366 - 366    AFLHC23_    367 - 367
      AFLHC24_    368 - 368    AFLHC25_    369 - 369
      AFLHC26_    370 - 370    AFLHC27_    371 - 371
      AFLHC28_    372 - 372    AFLHC29_    373 - 373
      AFLHC30_    374 - 374    AFLHC31_    375 - 375
      AFLHC32_    376 - 376    AFLHC33_    377 - 377
      AFLHC34_    378 - 378    AFLHCA90    379 - 379
      AFLHCA91    380 - 380    ALTIME1     381 - 382
      ALUNIT1     383 - 383    ALDURA1     384 - 385
      ALDURB1     386 - 386    ALCHRC1     387 - 387
      ALTIME2     388 - 389    ALUNIT2     390 - 390
      ALDURA2     391 - 392    ALDURB2     393 - 393
      ALCHRC2     394 - 394    ALTIME3     395 - 396
      ALUNIT3     397 - 397    ALDURA3     398 - 399
      ALDURB3     400 - 400    ALCHRC3     401 - 401
      ALTIME4     402 - 403    ALUNIT4     404 - 404
      ALDURA4     405 - 406    ALDURB4     407 - 407
      ALCHRC4     408 - 408    ALTIME5     409 - 410
      ALUNIT5     411 - 411    ALDURA5     412 - 413
      ALDURB5     414 - 414    ALCHRC5     415 - 415
      ALTIME6     416 - 417    ALUNIT6     418 - 418
      ALDURA6     419 - 420    ALDURB6     421 - 421
      ALCHRC6     422 - 422    ALTIME7     423 - 424
      ALUNIT7     425 - 425    ALDURA7     426 - 427
      ALDURB7     428 - 428    ALCHRC7     429 - 429
      ALTIME8     430 - 431    ALUNIT8     432 - 432
      ALDURA8     433 - 434    ALDURB8     435 - 435
      ALCHRC8     436 - 436    ALTIME9     437 - 438
      ALUNIT9     439 - 439    ALDURA9     440 - 441
      ALDURB9     442 - 442    ALCHRC9     443 - 443
      ALTIME10    444 - 445    ALUNIT10    446 - 446
      ALDURA10    447 - 448    ALDURB10    449 - 449
      ALCHRC10    450 - 450    ALTIME11    451 - 452
      ALUNIT11    453 - 453    ALDURA11    454 - 455
      ALDURB11    456 - 456    ALCHRC11    457 - 457
      ALTIME12    458 - 459    ALUNIT12    460 - 460
      ALDURA12    461 - 462    ALDURB12    463 - 463
      ALCHRC12    464 - 464    ALTIME13    465 - 466
      ALUNIT13    467 - 467    ALDURA13    468 - 469
      ALDURB13    470 - 470    ALCHRC13    471 - 471
      ATIME14A    472 - 473    AUNIT14A    474 - 474
      ADURA14A    475 - 476    ADURB14A    477 - 477
      ACHRC14A    478 - 478    ALTIME15    479 - 480
      ALUNIT15    481 - 481    ALDURA15    482 - 483
      ALDURB15    484 - 484    ALCHRC15    485 - 485
      ALTIME16    486 - 487    ALUNIT16    488 - 488
      ALDURA16    489 - 490    ALDURB16    491 - 491
      ALCHRC16    492 - 492    ALTIME17    493 - 494
      ALUNIT17    495 - 495    ALDURA17    496 - 497
      ALDURB17    498 - 498    ALCHRC17    499 - 499
      ALTIME18    500 - 501    ALUNIT18    502 - 502
      ALDURA18    503 - 504    ALDURB18    505 - 505
      ALCHRC18    506 - 506    ALTIME19    507 - 508
      ALUNIT19    509 - 509    ALDURA19    510 - 511
      ALDURB19    512 - 512    ALCHRC19    513 - 513
      ALTIME20    514 - 515    ALUNIT20    516 - 516
      ALDURA20    517 - 518    ALDURB20    519 - 519
      ALCHRC20    520 - 520    ALTIME21    521 - 522
      ALUNIT21    523 - 523    ALDURA21    524 - 525
      ALDURB21    526 - 526    ALCHRC21    527 - 527
      ALTIME22    528 - 529    ALUNIT22    530 - 530
      ALDURA22    531 - 532    ALDURB22    533 - 533
      ALCHRC22    534 - 534    ALTIME23    535 - 536
      ALUNIT23    537 - 537    ALDURA23    538 - 539
      ALDURB23    540 - 540    ALCHRC23    541 - 541
      ALTIME24    542 - 543    ALUNIT24    544 - 544
      ALDURA24    545 - 546    ALDURB24    547 - 547
      ALCHRC24    548 - 548    ALTIME25    549 - 550
      ALUNIT25    551 - 551    ALDURA25    552 - 553
      ALDURB25    554 - 554    ALCHRC25    555 - 555
      ALTIME26    556 - 557    ALUNIT26    558 - 558
      ALDURA26    559 - 560    ALDURB26    561 - 561
      ALCHRC26    562 - 562    ALTIME27    563 - 564
      ALUNIT27    565 - 565    ALDURA27    566 - 567
      ALDURB27    568 - 568    ALCHRC27    569 - 569
      ALTIME28    570 - 571    ALUNIT28    572 - 572
      ALDURA28    573 - 574    ALDURB28    575 - 575
      ALCHRC28    576 - 576    ALTIME29    577 - 578
      ALUNIT29    579 - 579    ALDURA29    580 - 581
      ALDURB29    582 - 582    ALCHRC29    583 - 583
      ALTIME30    584 - 585    ALUNIT30    586 - 586
      ALDURA30    587 - 588    ALDURB30    589 - 589
      ALCHRC30    590 - 590    ALTIME31    591 - 592
      ALUNIT31    593 - 593    ALDURA31    594 - 595
      ALDURB31    596 - 596    ALCHRC31    597 - 597
      ALTIME32    598 - 599    ALUNIT32    600 - 600
      ALDURA32    601 - 602    ALDURB32    603 - 603
      ALCHRC32    604 - 604    ALTIME33    605 - 606
      ALUNIT33    607 - 607    ALDURA33    608 - 609
      ALDURB33    610 - 610    ALCHRC33    611 - 611
      ALTIME34    612 - 613    ALUNIT34    614 - 614
      ALDURA34    615 - 616    ALDURB34    617 - 617
      ALCHRC34    618 - 618    ALTIME90    619 - 620
      ALUNIT90    621 - 621    ALDURA90    622 - 623
      ALDURB90    624 - 624    ALCHRC90    625 - 625
      ALTIME91    626 - 627    ALUNIT91    628 - 628
      ALDURA91    629 - 630    ALDURB91    631 - 631
      ALCHRC91    632 - 632    ALCNDRT     633 - 633
      ALCHRONR    634 - 634

      /* AHB LOCATIONS */

      SMKEV       635 - 635    SMKREG      636 - 637
      SMKNOW      638 - 638    SMKSTAT2    639 - 639
      SMKQTNO     640 - 641    SMKQTTP     642 - 642
      SMKQTY      643 - 644    CIGSDA1     645 - 646
      CIGDAMO     647 - 648    CIGSDA2     649 - 650
      CIGSDAY     651 - 652    CIGQTYR     653 - 653
      ECIGEV2     654 - 654    ECIGCUR2    655 - 655
      ECIG30D2    656 - 657    CIGAREV2    658 - 658
      CIGCUR2     659 - 659    CIG30D2     660 - 661
      PIPEV2      662 - 662    PIPECUR2    663 - 663
      SMKLSTB1    664 - 664    SMKLSCR2    665 - 665
      VIGNO       666 - 668    VIGTP       669 - 669
      VIGFREQW    670 - 671    VIGLNGNO    672 - 674
      VIGLNGTP    675 - 675    VIGMIN      676 - 678
      MODNO       679 - 681    MODTP       682 - 682
      MODFREQW    683 - 684    MODLNGNO    685 - 687
      MODLNGTP    688 - 688    MODMIN      689 - 691
      STRNGNO     692 - 694    STRNGTP     695 - 695
      STRFREQW    696 - 697    ALC1YR      698 - 698
      ALCLIFE     699 - 699    ALC12MNO    700 - 702
      ALC12MTP    703 - 703    ALC12MWK    704 - 705
      ALC12MYR    706 - 708    ALCAMT      709 - 710
      ALCSTAT     711 - 712    ALC5UPN1    713 - 715
      ALC5UPT1    716 - 716    ALC5UPY1    717 - 719
      BINGE1      720 - 721    AHEIGHT     722 - 723
      AWEIGHTP    724 - 726    BMI         727 - 730 .2


      /* AAU LOCATIONS */

      AUSUALPL    731 - 731    APLKIND     732 - 732
      AHCPLROU    733 - 733    AHCPLKND    734 - 734
      AHCCHGYR    735 - 735    AHCCHGHI    736 - 736
      APRVTRYR    737 - 737    APRVTRFD    738 - 738
      ADRNANP     739 - 739    ADRNAI      740 - 740
      AHCDLYR1    741 - 741    AHCDLYR2    742 - 742
      AHCDLYR3    743 - 743    AHCDLYR4    744 - 744
      AHCDLYR5    745 - 745    AHCAFYR1    746 - 746
      AHCAFYR2    747 - 747    AHCAFYR3    748 - 748
      AHCAFYR4    749 - 749    AHCAFYR5    750 - 750
      AHCAFYR6    751 - 751    AWORPAY     752 - 752
      AHICOMP     753 - 753    ARX12MO     754 - 754
      ARX12_1     755 - 755    ARX12_2     756 - 756
      ARX12_3     757 - 757    ARX12_4     758 - 758
      ARX12_5     759 - 759    ARX12_6     760 - 760
      ADNLONG2    761 - 761    AHCSYR1     762 - 762
      AHCSYR2     763 - 763    AHCSYR3     764 - 764
      AHCSYR4     765 - 765    AHCSYR5     766 - 766
      AHCSYR6     767 - 767    AHCSYR7     768 - 768
      AHCSYR8     769 - 769    AHCSYR9     770 - 770
      AHCSYR10    771 - 771    AHERNOY2    772 - 773
      AERVISND    774 - 774    AERHOS      775 - 775
      AERREA1R    776 - 776    AERREA2R    777 - 777
      AERREA3R    778 - 778    AERREA4R    779 - 779
      AERREA5R    780 - 780    AERREA6R    781 - 781
      AERREA7R    782 - 782    AERREA8R    783 - 783
      AHCHYR      784 - 784    AHCHMOYR    785 - 786
      AHCHNOY2    787 - 788    AHCNOYR2    789 - 790
      ASRGYR      791 - 791    ASRGNOYP    792 - 793
      AMDLONGR    794 - 794    HIT1A       795 - 795
      HIT2A       796 - 796    HIT3A       797 - 797
      HIT4A       798 - 798    HIT5A       799 - 799
      FLUVACYR    800 - 800    FLUVACTP    801 - 801
      FLUVAC_M    802 - 803    FLUVAC_Y    804 - 807
      FLUSHPG1    808 - 808    FLUSHPG2    809 - 809
      SHTPNUYR    810 - 810    APOX        811 - 811
      APOX12MO    812 - 812    AHEP        813 - 813
      AHEPLIV     814 - 814    AHEPBTST    815 - 815
      SHTHEPB     816 - 816    SHEPDOS     817 - 817
      SHTHEPA     818 - 818    SHEPANUM    819 - 820
      AHEPCTST    821 - 821    AHEPCRES    822 - 822
      SHINGLES    823 - 823    SHTTD       824 - 824
      SHTTD05     825 - 825    SHTTDAP2    826 - 826
      SHTHPV2     827 - 827    SHHPVDOS    828 - 829
      AHPVAGE     830 - 832    LIVEV       833 - 833
      TRAVEL      834 - 834    WRKHLTH2    835 - 835
      WRKDIR      836 - 836    APSBPCHK    837 - 837
      APSCHCHK    838 - 838    APSBSCHK    839 - 839
      APSPAP      840 - 840    APSMAM      841 - 841
      APSCOL      842 - 842    APSDIET     843 - 843
      APSSMKC     844 - 844    AINDINS2    845 - 845
      AINDPRCH    846 - 846    AINDWHO     847 - 847
      AINDDIF1    848 - 848    AINDDIF2    849 - 849
      AEXCHNG     850 - 850

      /* ASI LOCATIONS */

      ASICPUSE    851 - 851    ASISATHC    852 - 852
      ASITENUR    853 - 853    ASINHELP    854 - 854
      ASINCNTO    855 - 855    ASINTRU     856 - 856
      ASINKNT     857 - 857    ASISIM      858 - 858
      ASISIF      859 - 859    ASIRETR     860 - 860
      ASIMEDC     861 - 861    ASISTLV     862 - 862
      ASICNHC     863 - 863    ASICCOLL    864 - 864
      ASINBILL    865 - 865    ASIHCST     866 - 866
      ASICCMP     867 - 867    ASISLEEP    868 - 869
      ASISLPFL    870 - 871    ASISLPST    872 - 873
      ASISLPMD    874 - 875    ASIREST     876 - 877
      ASISAD      878 - 878    ASINERV     879 - 879
      ASIRSTLS    880 - 880    ASIHOPLS    881 - 881
      ASIEFFRT    882 - 882    ASIWTHLS    883 - 883
      ASIMUCH     884 - 884    ACIBLD12    885 - 885
      ASIHIVT     886 - 886    ASIHIVWN    887 - 888


      /* BAL LOCATIONS */

      BALEV       889 - 889    BALAGE_P    890 - 891
      BDIZZ1      892 - 892    BRPROB1     893 - 893
      BRPROB2     894 - 894    BRPROB3     895 - 895
      BRPROB4     896 - 896    BRPROB5     897 - 897
      BRPROB6     898 - 898    BRPROB7     899 - 899
      BPROB_CT    900 - 900    BTYPE_1     901 - 901
      BTYPE_2     902 - 902    BTYPE_3     903 - 903
      BTYPE_4     904 - 904    BTYPE_5     905 - 905
      BTYPE_6     906 - 906    BTYPE_7     907 - 907
      BTYPE_CT    908 - 908    BBOTH1      909 - 910
      BAGE1_P     911 - 912    BOFTN       913 - 915
      BOFTT       916 - 916    BLAST1      917 - 918
      BTRG_01     919 - 919    BTRG_02     920 - 920
      BTRG_03     921 - 921    BTRG_04     922 - 922
      BTRG_05     923 - 923    BTRG_06     924 - 924
      BTRG_07     925 - 925    BTRG_08     926 - 926
      BTRG_09     927 - 927    BTRG_10     928 - 928
      BSAME_1     929 - 929    BSAME_2     930 - 930
      BSAME_3     931 - 931    BSAME_4     932 - 932
      BSAME_5     933 - 933    BSAME_6     934 - 934
      BSAME_7     935 - 935    BONLY_1     936 - 936
      BONLY_2     937 - 937    BONLY_3     938 - 938
      BONLY_4     939 - 939    BONLY_5     940 - 940
      BONLY_6     941 - 941    BONLY_7     942 - 942
      BHOSP2      943 - 943    BHOSPNO1    944 - 944
      BHP1        945 - 945    BHP1_01     946 - 946
      BHP1_02     947 - 947    BHP1_03     948 - 948
      BHP1_04     949 - 949    BHP1_05     950 - 950
      BHP1_06     951 - 951    BHP1_07     952 - 952
      BHP1_08     953 - 953    BHP1_09     954 - 954
      BHP1_10     955 - 955    BHP1_11     956 - 956
      BHP1_12     957 - 957    BHP1_13     958 - 958
      BHP1_14     959 - 959    BHP1_15     960 - 960
      B5YRS1      961 - 961    BFIRST1     962 - 962
      BHELP1      963 - 963    BTHLP_N     964 - 966
      BTHLP_T     967 - 967    BDIAG1      968 - 968
      BCAUS101    969 - 969    BCAUS102    970 - 970
      BCAUS103    971 - 971    BCAUS104    972 - 972
      BCAUS105    973 - 973    BCAUS106    974 - 974
      BCAUS107    975 - 975    BCAUS108    976 - 976
      BCAUS109    977 - 977    BCAUS110    978 - 978
      BCAUS111    979 - 979    BCAUS112    980 - 980
      BCAUS113    981 - 981    BCAUS114    982 - 982
      BTRET1      983 - 983    BTRT1_01    984 - 984
      BTRT1_02    985 - 985    BTRT1_03    986 - 986
      BTRT1_04    987 - 987    BTRT1_06    988 - 988
      BTRT1_07    989 - 989    BTRT1_08    990 - 990
      BTRT1_09    991 - 991    BTRT1_10    992 - 992
      BTRT1_11    993 - 993    BTRT1_12    994 - 994
      BTRT1_13    995 - 995    BTRT1_14    996 - 996
      BTRT1_15    997 - 997    BTRT1_16    998 - 998
      BSTAT1      999 - 999    BMEDIC1    1000 -1000
      BCHNG1     1001 -1001    BCHG1_01   1002 -1002
      BCHG1_02   1003 -1003    BCHG1_03   1004 -1004
      BCHG1_04   1005 -1005    BCHG1_05   1006 -1006
      BCHG1_06   1007 -1007    BCHG1_07   1008 -1008
      BM12WS     1009 -1011    BM12RA     1012 -1014
      BPROB1     1015 -1015    BMED_1     1016 -1016
      BMED_2     1017 -1017    BMED_3     1018 -1018
      BMED_4     1019 -1019    BBIO1      1020 -1020
      BFALL12M   1021 -1021    BFALL5Y    1022 -1022
      BFL1_01    1023 -1023    BFL1_02    1024 -1024
      BFL1_03    1025 -1025    BFL1_04    1026 -1026
      BFL1_05    1027 -1027    BFL1_06    1028 -1028
      BFL1_07    1029 -1029    BFALL12A   1030 -1030
      BF12M_NO   1031 -1033    BF12M_TP   1034 -1034
      BFTIME1    1035 -1035    BINJ1      1036 -1036
      BINJWS     1037 -1039    BINJHP     1040 -1040
      BINJHPN    1041 -1041    BFWH_01    1042 -1042
      BFWH_02    1043 -1043    BFWH_03    1044 -1044
      BFWH_04    1045 -1045    BFWH_05    1046 -1046
      BFWH_06    1047 -1047    BFWH_07    1048 -1048
      BFWH_08    1049 -1049    BFWH_09    1050 -1050
      BFWH_10    1051 -1051    BNRFALL    1052 -1052
      BINTHI     1053 -1053    BINTTR     1054 -1054
      BINTRS     1055 -1055

      /* AWB LOCATIONS */

      AWEBUSE    1056 -1056    AWEBOFNO   1057 -1059
      AWEBOFTP   1060 -1060    AWEBEML    1061 -1061
      AWEBMNO    1062 -1064    AWEBMTP    1065 -1065
;

   * DEFINE VARIABLE LABELS;

   LABEL

      /* IDN LABELS */

      RECTYPE    ="File type identifier"
      SRVY_YR    ="Year of National Health Interview Survey"
      HHX        ="Household Number"
      INTV_QRT   ="Interview Quarter"
      INTV_MON   ="Interview Month"
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
      HYPMDEV2   ="Ever prescribed medicine for high blood pressure"
      HYPMED2    ="Now taking prescribed medicine for high blood pressure"
      CHLEV      ="Ever told you had high cholesterol"
      CHLYR      ="Had high cholesterol, past 12 months"
      CHLMDEV2   ="Ever prescribed medicine to lower cholesterol"
      CHLMDNW2   ="Now taking prescribed medicine to lower cholesterol"
      CHDEV      ="Ever been told you had coronary heart disease"
      ANGEV      ="Ever been told you had angina pectoris"
      MIEV       ="Ever been told you had a heart attack"
      HRTEV      ="Ever been told you had a heart condition/disease"
      STREV      ="Ever been told you had a stroke"
      EPHEV      ="Ever been told you had emphysema"
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
      ULCCOLEV   ="Ever been told you had Crohn's disease/ulcerative colitis"
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
"Flu shot before/during current pregnancy, interviewed Jan-Mar or Aug-Dec, 2016"
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
      SHTTD05    ="Tetanus shot given in 2005 or later"
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
      ACIBLD12   ="Donated blood, past 12 months"
      ASIHIVT    ="Ever been tested for HIV"
      ASIHIVWN   ="Main reason not tested for HIV"

      /* BAL LABELS */

      BALEV      =
"Ever had problem with dizziness, lighteheadedness, passing out, feel faint"
      BALAGE_P   =
"Age first had problem with dizziness, lightheadedness, passing out, etc."
      BDIZZ1     ="Had dizziness or balance problem, past 12 months"
      BRPROB1    ="Had severe fatigue, past 12 months"
      BRPROB2    =
"Had problem with drifting to side when trying to walk straight, past 12 months"
      BRPROB3    =
"Had prob bumping into one side or other when walking thru doorway, past 12 mos"
      BRPROB4    =
"Had difficulty walking in the dark without using support, past 12 months"
      BRPROB5    =
"Had difficulty walking on uneven ground or surfaces, past 12 months"
      BRPROB6    ="Had a problem with fear of heights, past 12 months"
      BRPROB7    =
"Had difficulty riding an escalator or moving walkway, past 12 months"
      BPROB_CT   ="Counter for the number of balance problems"
      BTYPE_1    =
"Symptom: spinning/ vertigo sensation/ other illusion of motion, past 12 mos"
      BTYPE_2    =
"Symptom: a floating, spacey, or disconnected sensation, past 12 months"
      BTYPE_3    =
"Symptom: felt lightheaded without a sense of motion, past 12 months"
      BTYPE_4    ="Symptom: felt would pass out or faint, past 12 months"
      BTYPE_5    ="Symptom: blurring of vision when moving head, past 12 months"
      BTYPE_6    ="Symptom: feeling off-balance or unsteady, past 12 months"
      BTYPE_7    ="Symptom: other dizziness or balance problem, past 12 months"
      BTYPE_CT   ="Counter for the number of balance symptoms"
      BBOTH1     ="Which one of these bothered the most, past 12 months"
      BAGE1_P    ="How old when most bothersome thing first happened?"
      BOFTN      ="How often had most bothersome thing, past 12 months"
      BOFTT      ="Time period of most bothersome thing"
      BLAST1     =
"How long does each episode of most bothersome thing usually last?"
      BTRG_01    =
"Does looking up or down lean forward or back trigger balance/dizz problem?"
      BTRG_02    ="Does rolling over in bed trigger balance/dizz problem?"
      BTRG_03    =
"Does getting up after sitting  or lying down trigger balance/dizz problem?"
      BTRG_04    =
"Does headache, including migraine, trigger balance/dizz problem?"
      BTRG_05    =
"Does a visual problem such as double vision trigger balance/dizz problem?"
      BTRG_06    =
"Does riding in a car/bus/airplane/boat/train trigger balance/dizz problem?"
      BTRG_07    =
"Does walking down a grocery store aisle trigger balance/dizz problem?"
      BTRG_08    ="Does hearing loud sounds trigger balance/dizz problem?"
      BTRG_09    ="Does blowing nose trigger balance/dizz problem?"
      BTRG_10    =
"Does taking prescription or OTC meds trigger balance/dizz problems?"
      BSAME_1    =
"Does nausea or vomiting happen at the same time as balance/dizz problem?"
      BSAME_2    =
"Does hearing loss in only one ear happen same time as balance/dizz problem?"
      BSAME_3    =
"Does ringing/buzzing/roaring in one ear happen same time as balance/dizz prob?"
      BSAME_4    =
"Does fullness/pressure/stuffiness in ear happen same time as balance/dizz prob?
"
      BSAME_5    =
"Does sinus congestion happen same time as balance/dizz problem?"
      BSAME_6    ="Does anxiety happen same time as balance/dizz problem?"
      BSAME_7    ="Does depression happen same time as balance/dizz problem?"
      BONLY_1    ="Have nausea or vomiting only with balance/dizz problem?"
      BONLY_2    ="Have hearing loss only with balance/dizz problem?"
      BONLY_3    ="Have ringing in ear/tinnitus only with balance/dizz problem?"
      BONLY_4    =
"Have fullness, pressure, stuffiness only with balance/dizz problem?"
      BONLY_5    ="Have sinus congestion only with balance/dizz problem?"
      BONLY_6    ="Have anxiety only with balance/dizz problem?"
      BONLY_7    ="Have depression only with balance/dizz problem?"
      BHOSP2     ="Ever gone to hospital/ER for dizz/balance problem?"
      BHOSPNO1   =
"Number of times gone to hospital/ER for dizz/balance problem, past 5 years"
      BHP1       =
"Ever seen doctor/health professional about dizz/balance problem?"
      BHP1_01    =
"Seen fam MD/internal medicine MD/family practitioner about dizz/balance prob?"
      BHP1_02    =
"Seen cardiologist or heart specialist about dizz/balance problem?"
      BHP1_03    ="Seen ear, nose, throat doctor about dizz/balance problem?"
      BHP1_04    ="Seen neurologist about dizz/balance problem?"
      BHP1_05    =
"Seen eye doctor, optometrist, ophthalmologist about dizz/balance problem?"
      BHP1_06    =
"Seen dentist, orthodontist, or oral surgeon about dizz/balance problem?"
      BHP1_07    ="Seen gynecologist, OB/GYN about dizz/balance problem?"
      BHP1_08    =
"See psychiatrist, psychologist, or social worker about dizz/balance problem?"
      BHP1_09    =
"Seen osteopath, doctor of osteopathy about dizz/balance problem?"
      BHP1_10    =
"Seen occup/physical therapist, rehab specialist/MD about dizz/balance prob?"
      BHP1_11    =
"Seen physician asst or nurse practitioner about dizz/balance problem?"
      BHP1_12    ="See nutritionist or dietician about dizz/balance problem?"
      BHP1_13    ="Seen audiologist about dizz/balance problem?"
      BHP1_14    ="Seen foot doctor about dizz/balance problem?"
      BHP1_15    =
"Seen some other health professional about dizz/balance problem?"
      B5YRS1     =
"How many times seen MD/oth health prof about dizz/balance prob, past 5 years?"
      BFIRST1    =
"How long ago first saw MD/ other health professional about dizz/balance problem
?"
      BHELP1     =
"How much did these doctors/other health professionals help dizz/balance prob?"
      BTHLP_N    =
"# of days/wks/yrs btwn 1st time saw MD for dizz/bal prob & helped by treatment"
      BTHLP_T    =
"Time period btwn 1st time saw MD for dizz/balance prob & helped by treatment"
      BDIAG1     =
"Did doctor/health professionals give diagnosis for dizz/balance problem?"
      BCAUS101   ="Allergies cause of dizz/balance problem?"
      BCAUS102   ="Anxiety or depression cause of dizz/balance problem?"
      BCAUS103   =
"Benign positional vertigo (BPV) cause of dizz/balance problem?"
      BCAUS104   =
"Crystals-loose or dislodged  in ear cause of dizz/balance problem?"
      BCAUS105   ="Diabetes cause of balance problem?"
      BCAUS106   ="Headache or migraine cause of dizz/balance problem?"
      BCAUS107   ="Head or neck trauma/concussion cause of dizz/balance problem?
"
      BCAUS108   ="Heart disease cause of dizz/balance problem?"
      BCAUS109   =
"Inner ear infection/viral labrynthitis cause of dizz/balance problem?"
      BCAUS110   ="Meniere's (Men-e-AIRZ) disease cause of dizz/balance problem?
"
      BCAUS111   =
"Neurological-multiple sclerosis (MS), seizures, etc. cause of dizz/balance prob
?"
      BCAUS112   ="Side effects from medications cause of dizz/balance problem?"
      BCAUS113   ="Stroke cause of dizz/balance problem?"
      BCAUS114   ="Other health problem(s) cause of dizz/balance problem?"
      BTRET1     ="Ever tried anything to treat dizz/balance problem?"
      BTRT1_01   =
"Ever tried exercises or physical therapy to treat dizz/balance problem?"
      BTRT1_02   =
"Ever tried bed rest for several hours/days to treat dizz/balance problem?"
      BTRT1_03   =
"Ever tried head rolling/Epley maneuver by MD/therapist to treat dizz/bal prob?"
      BTRT1_04   =
"Ever tried steroid injections to the ear to treat dizz/balance problem?"
      BTRT1_06   ="Ever tried surgery to treat dizz/balance problem?"
      BTRT1_07   ="Ever tried low salt diet to treat dizz/balance problem?"
      BTRT1_08   =
"Ever cut back/avoided certain food or drinks to treat dizz/balance problem?"
      BTRT1_09   =
"Ever tried quit/reduce use of tobacco/cigarettes to treat dizz/balance problem?
"
      BTRT1_10   =
"Ever tried prescription medicine/drugs to treat dizz/balance problem?"
      BTRT1_11   =
"Ever tried OTC meds (allergy meds, sleep aids) to treat dizz/balance problem?"
      BTRT1_12   ="Ever tried psychiatric treatment?"
      BTRT1_13   =
"Ever tried massage therapy or chiropractic treatment or manipulation"
      BTRT1_14   ="Ever tried acupuncture?"
      BTRT1_15   =
"Ever tried herbal remedies such as feverfew tea, ginger, or ginkgo biloba?"
      BTRT1_16   ="Ever tried wearing magnets or acupressure wristband?"
      BSTAT1     =
"In past 12 mos, are dizz/bal probs worse, same, imprv some, or imprv greatly?"
      BMEDIC1    =
"Do you regularly take any medicine that makes your dizz/bal prob(s) worse?"
      BCHNG1     =
"Do dizziness or balance probs prevent from doing things you otherwise could do?
"
      BCHG1_01   =
"Have dizz/bal probs caused changes or cut back on driving a motor vehicle?"
      BCHG1_02   =
"Dizz/bal probs caused changes/cut back on riding in car/bus/plane/boat/train?"
      BCHG1_03   =
"Dizz/bal probs caused changes or cut back on exercising or taking walks?"
      BCHG1_04   =
"Dizz/bal probs caused changes or cut back on walking down a flight of stairs?"
      BCHG1_05   =
"Dizz/bal probs caused changes/cut back on social activities outside home?"
      BCHG1_06   =
"Dizz/bal probs caused changes/cut back on chores, like cleaning or laundry?"
      BCHG1_07   =
"Dizz/bal probs caused changes or cut back on going to the toilet?"
      BM12WS     =
"In past 12 mos, how many days of work/school missed because of dizz/bal problem
?"
      BM12RA     =
"In past 12 mos how many days of oth activities missed bec of dizz/bal problem?"
      BPROB1     =
"In the past 12 mos, how much of a problem was your dizziness/balance condition?
"
      BMED_1     =
"Ever taken or had Meclizine or Antivert for dizziness, nausea, or vomiting?"
      BMED_2     =
"Ever taken/had other medicine or patches for motion sickness/nausea/vomiting?"
      BMED_3     =
"Have you ever taken or had medicines for anxiety or depression?"
      BMED_4     ="Have you ever taken or had chemotherapy?"
      BBIO1      =
"Any of your bio relatives had prob with dizz/bal/falling, not related to aging?
"
      BFALL12M   ="In the past year, have you fallen at least one time?"
      BFALL5Y    ="In the past 5 years, have you fallen at least one time?"
      BFL1_01    =
"In past 5 yrs, any falls just before a sense of spinning/oth movement sensation
?"
      BFL1_02    =
"In past 5 yrs, any falls occur before a floating/spacey/disconnected feeling?"
      BFL1_03    =
"In past 5 yrs, did any of your falls occur just before you felt lightheaded?"
      BFL1_04    =
"In past 5 yrs, any falls occur just before felt like passing out?"
      BFL1_05    =
"In past 5 yrs, did any falls occur just before you were having blurred vision?"
      BFL1_06    =
"In past 5 yrs, did any falls occur just before you felt unsteady or off-balance
?"
      BFL1_07    =
"In past 5 yrs, did any falls occur before other/general prob with dizz/imbal?"
      BFALL12A   =
"In the past 12 months, have you fallen at least once a month on average?"
      BF12M_NO   =
"In the past 12 months, about how many times per day/week/month have you fallen?
"
      BF12M_TP   ="Time period for time fallen"
      BFTIME1    ="In the past 12 months, how many times have you fallen?"
      BINJ1      =
"In the past 12 months, did you have an injury as a result of a fall?"
      BINJWS     =
"In past 12 mos, how many days of work/school missed bec of injury from falls?"
      BINJHP     =
"In past 12 mos, did you talk to/see MD/health prof about injuries from a fall?"
      BINJHPN    =
"In past 12 mos # times you talk to/saw medical prof about worst inj from a fall
?"
      BFWH_01    =
"Have you fallen in the past 12 months because you tripped, stumbled, or slipped
?"
      BFWH_02    =
"Have you fallen in the past 12 months because you blacked out or fainted?"
      BFWH_03    =
"Have you fallen in the past 12 mos because you were playing sports/exercising?"
      BFWH_04    =
"Have you fallen in the past 12 months because you had a problem with vision?"
      BFWH_05    =
"Have you fallen in past 12 mos bec you had weakness/numbness in one/both legs?"
      BFWH_06    =
"Have you fallen in the past 12 mos bec you hadn’t eaten/had low blood sugar?"
      BFWH_07    =
"Have you fallen in the past 12 months because you drank too much alcohol?"
      BFWH_08    =
"Have you fallen in past 12 mos bec you had a prob using a walker/cane/other aid
?"
      BFWH_09    =
"Have you fallen in past 12 mos because had a problem with shoes/sandals/socks?"
      BFWH_10    =
"Have you fallen in the past 12 months because of some other reason?"
      BNRFALL    =
"In past 12 mos # times you slipped/lost balance and caught self without falling
?"
      BINTHI     =
"In past 12 mos have you used the Internet to get health info on dizz/bal probs?
"
      BINTTR     =
"In past 12 mos use Internet to research medical/other dizz/bal prob treatments?
"
      BINTRS     =
"In past 12 mos use Internet to find rehab/intervention progs for dizz/bal probs
?"

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
      HYPMDEV2  SAP028X.   HYPMED2   SAP028X.   CHLEV     SAP028X.
      CHLYR     SAP028X.   CHLMDEV2  SAP028X.   CHLMDNW2  SAP028X.
      CHDEV     SAP028X.   ANGEV     SAP028X.   MIEV      SAP028X.
      HRTEV     SAP028X.   STREV     SAP028X.   EPHEV     SAP028X.
      COPDEV    SAP028X.   ASPMEDEV  SAP028X.   ASPMEDAD  SAP028X.
      ASPMDMED  SAP028X.   ASPONOWN  SAP028X.   AASMEV    SAP028X.
      AASSTILL  SAP028X.   AASMYR    SAP028X.   AASERYR1  SAP028X.
      ULCEV     SAP028X.   ULCYR     SAP028X.   ULCCOLEV  SAP028X.
      CANEV     SAP028X.   CNKIND1   SAP071X.   CNKIND2   SAP071X.
      CNKIND3   SAP071X.   CNKIND4   SAP071X.   CNKIND5   SAP071X.
      CNKIND6   SAP071X.   CNKIND7   SAP071X.   CNKIND8   SAP071X.
      CNKIND9   SAP071X.   CNKIND10  SAP071X.   CNKIND11  SAP071X.
      CNKIND12  SAP071X.   CNKIND13  SAP071X.   CNKIND14  SAP071X.
      CNKIND15  SAP071X.   CNKIND16  SAP071X.   CNKIND17  SAP071X.
      CNKIND18  SAP071X.   CNKIND19  SAP071X.   CNKIND20  SAP071X.
      CNKIND21  SAP071X.   CNKIND22  SAP071X.   CNKIND23  SAP071X.
      CNKIND24  SAP071X.   CNKIND25  SAP071X.   CNKIND26  SAP071X.
      CNKIND27  SAP071X.   CNKIND28  SAP071X.   CNKIND29  SAP071X.
      CNKIND30  SAP071X.   CNKIND31  SAP071X.   CANAGE1   SAP102X.
      CANAGE2   SAP102X.   CANAGE3   SAP102X.   CANAGE4   SAP102X.
      CANAGE5   SAP102X.   CANAGE6   SAP102X.   CANAGE7   SAP102X.
      CANAGE8   SAP102X.   CANAGE9   SAP102X.   CANAGE10  SAP102X.
      CANAGE11  SAP102X.   CANAGE12  SAP102X.   CANAGE13  SAP102X.
      CANAGE14  SAP102X.   CANAGE15  SAP102X.   CANAGE16  SAP102X.
      CANAGE17  SAP102X.   CANAGE18  SAP102X.   CANAGE19  SAP102X.
      CANAGE20  SAP102X.   CANAGE21  SAP102X.   CANAGE22  SAP102X.
      CANAGE23  SAP102X.   CANAGE24  SAP102X.   CANAGE25  SAP102X.
      CANAGE26  SAP102X.   CANAGE27  SAP102X.   CANAGE28  SAP102X.
      CANAGE29  SAP102X.   CANAGE30  SAP102X.   PREGEVER  SAP028X.
      DBHVPAY   SAP028X.   DBHVCLY   SAP028X.   DBHVWLY   SAP028X.
      DBHVPAN   SAP028X.   DBHVCLN   SAP028X.   DBHVWLN   SAP028X.
      DIBREL    SAP028X.   DIBEV1    SAP140X.   DIBPRE2   SAP028X.
      DIBTEST   SAP142X.   DIBAGE1   SAP102X.   DIFAGE2   SAP144X.
      DIBTYPE   SAP145X.   DIBPILL1  SAP028X.   INSLN1    SAP028X.
      DIBINS2   SAP148X.   DIBINS3   SAP028X.   DIBINS4   SAP028X.
      DIBGDM    SAP028X.   DIBBABY   SAP028X.   DIBPRGM   SAP028X.
      DIBREFER  SAP028X.   DIBBEGIN  SAP155X.   AHAYFYR   SAP028X.
      SINYR     SAP028X.   CBRCHYR   SAP028X.   KIDWKYR   SAP028X.
      LIVYR     SAP028X.   JNTSYMP   SAP028X.   JMTHP1    SAP071X.
      JMTHP2    SAP071X.   JMTHP3    SAP071X.   JMTHP4    SAP071X.
      JMTHP5    SAP071X.   JMTHP6    SAP071X.   JMTHP7    SAP071X.
      JMTHP8    SAP071X.   JMTHP9    SAP071X.   JMTHP10   SAP071X.
      JMTHP11   SAP071X.   JMTHP12   SAP071X.   JMTHP13   SAP071X.
      JMTHP14   SAP071X.   JMTHP15   SAP071X.   JMTHP16   SAP071X.
      JMTHP17   SAP071X.   JNTCHR    SAP028X.   JNTHP     SAP028X.
      ARTH1     SAP028X.   ARTHLMT   SAP028X.   PAINECK   SAP028X.
      PAINLB    SAP028X.   PAINLEG   SAP028X.   PAINFACE  SAP028X.
      AMIGR     SAP028X.   ACOLD2W   SAP028X.   AINTIL2W  SAP028X.
      PREGNOW   SAP028X.   PREGFLYR  SAP028X.   HRAIDNOW  SAP028X.
      HRAIDEV   SAP028X.   AHEARST1  SAP194X.   AVISION   SAP028X.
      ABLIND    SAP028X.   VIM_DREV  SAP028X.   VIMLS_DR  SAP028X.
      VIM_CAEV  SAP028X.   VIMLS_CA  SAP028X.   VIMCSURG  SAP028X.
      VIM_GLEV  SAP028X.   VIMLS_GL  SAP028X.   VIM_MDEV  SAP028X.
      VIMLS_MD  SAP028X.   VIMGLASS  SAP028X.   VIMREAD   SAP028X.
      VIMDRIVE  SAP028X.   AVISREH   SAP028X.   AVISDEV   SAP028X.
      AVDF_NWS  SAP211X.   AVDF_CLS  SAP211X.   AVDF_NIT  SAP211X.
      AVDF_DRV  SAP211X.   AVDF_PER  SAP211X.   AVDF_CRD  SAP211X.
      AVISEXAM  SAP217X.   AVISACT   SAP028X.   AVISPROT  SAP219X.
      LUPPRT    SAP028X.   CHPAIN6M  SAP221X.   PAINLMT   SAP221X.

      /* AHS FORMAT ASSOCIATIONS */

      WKDAYR    SAP223X.   BEDDAYR   SAP223X.   AHSTATYR  SAP225X.
      SPECEQ    SAP028X.   FLWALK    SAP227X.   FLCLIMB   SAP227X.
      FLSTAND   SAP227X.   FLSIT     SAP227X.   FLSTOOP   SAP227X.
      FLREACH   SAP227X.   FLGRASP   SAP227X.   FLCARRY   SAP227X.
      FLPUSH    SAP227X.   FLSHOP    SAP227X.   FLSOCL    SAP227X.
      FLRELAX   SAP227X.   FLA1AR    SAP239X.   AFLHCA1   SAP071X.
      AFLHCA2   SAP071X.   AFLHCA3   SAP071X.   AFLHCA4   SAP071X.
      AFLHCA5   SAP071X.   AFLHCA6   SAP071X.   AFLHCA7   SAP071X.
      AFLHCA8   SAP071X.   AFLHCA9   SAP071X.   AFLHCA10  SAP071X.
      AFLHCA11  SAP071X.   AFLHCA12  SAP071X.   AFLHCA13  SAP071X.
      ALHCA14A  SAP071X.   AFLHCA15  SAP071X.   AFLHCA16  SAP071X.
      AFLHCA17  SAP071X.   AFLHCA18  SAP071X.   AFLHC19_  SAP071X.
      AFLHC20_  SAP071X.   AFLHC21_  SAP071X.   AFLHC22_  SAP071X.
      AFLHC23_  SAP071X.   AFLHC24_  SAP071X.   AFLHC25_  SAP071X.
      AFLHC26_  SAP071X.   AFLHC27_  SAP071X.   AFLHC28_  SAP071X.
      AFLHC29_  SAP071X.   AFLHC30_  SAP071X.   AFLHC31_  SAP071X.
      AFLHC32_  SAP071X.   AFLHC33_  SAP071X.   AFLHC34_  SAP071X.
      AFLHCA90  SAP071X.   AFLHCA91  SAP071X.   ALTIME1   SAP276X.
      ALUNIT1   SAP277X.   ALDURA1   SAP278X.   ALDURB1   SAP279X.
      ALCHRC1   SAP280X.   ALTIME2   SAP276X.   ALUNIT2   SAP277X.
      ALDURA2   SAP278X.   ALDURB2   SAP279X.   ALCHRC2   SAP280X.
      ALTIME3   SAP276X.   ALUNIT3   SAP277X.   ALDURA3   SAP278X.
      ALDURB3   SAP279X.   ALCHRC3   SAP280X.   ALTIME4   SAP276X.
      ALUNIT4   SAP277X.   ALDURA4   SAP278X.   ALDURB4   SAP279X.
      ALCHRC4   SAP280X.   ALTIME5   SAP276X.   ALUNIT5   SAP277X.
      ALDURA5   SAP278X.   ALDURB5   SAP279X.   ALCHRC5   SAP280X.
      ALTIME6   SAP276X.   ALUNIT6   SAP277X.   ALDURA6   SAP278X.
      ALDURB6   SAP279X.   ALCHRC6   SAP280X.   ALTIME7   SAP276X.
      ALUNIT7   SAP277X.   ALDURA7   SAP278X.   ALDURB7   SAP279X.
      ALCHRC7   SAP280X.   ALTIME8   SAP276X.   ALUNIT8   SAP277X.
      ALDURA8   SAP278X.   ALDURB8   SAP279X.   ALCHRC8   SAP280X.
      ALTIME9   SAP276X.   ALUNIT9   SAP277X.   ALDURA9   SAP278X.
      ALDURB9   SAP279X.   ALCHRC9   SAP280X.   ALTIME10  SAP276X.
      ALUNIT10  SAP277X.   ALDURA10  SAP278X.   ALDURB10  SAP279X.
      ALCHRC10  SAP280X.   ALTIME11  SAP276X.   ALUNIT11  SAP277X.
      ALDURA11  SAP278X.   ALDURB11  SAP279X.   ALCHRC11  SAP280X.
      ALTIME12  SAP276X.   ALUNIT12  SAP277X.   ALDURA12  SAP278X.
      ALDURB12  SAP279X.   ALCHRC12  SAP280X.   ALTIME13  SAP276X.
      ALUNIT13  SAP277X.   ALDURA13  SAP278X.   ALDURB13  SAP279X.
      ALCHRC13  SAP280X.   ATIME14A  SAP276X.   AUNIT14A  SAP277X.
      ADURA14A  SAP278X.   ADURB14A  SAP279X.   ACHRC14A  SAP280X.
      ALTIME15  SAP276X.   ALUNIT15  SAP277X.   ALDURA15  SAP278X.
      ALDURB15  SAP279X.   ALCHRC15  SAP280X.   ALTIME16  SAP276X.
      ALUNIT16  SAP277X.   ALDURA16  SAP278X.   ALDURB16  SAP279X.
      ALCHRC16  SAP280X.   ALTIME17  SAP276X.   ALUNIT17  SAP277X.
      ALDURA17  SAP278X.   ALDURB17  SAP279X.   ALCHRC17  SAP280X.
      ALTIME18  SAP276X.   ALUNIT18  SAP277X.   ALDURA18  SAP278X.
      ALDURB18  SAP279X.   ALCHRC18  SAP280X.   ALTIME19  SAP276X.
      ALUNIT19  SAP277X.   ALDURA19  SAP278X.   ALDURB19  SAP279X.
      ALCHRC19  SAP280X.   ALTIME20  SAP276X.   ALUNIT20  SAP277X.
      ALDURA20  SAP278X.   ALDURB20  SAP279X.   ALCHRC20  SAP280X.
      ALTIME21  SAP276X.   ALUNIT21  SAP277X.   ALDURA21  SAP278X.
      ALDURB21  SAP279X.   ALCHRC21  SAP280X.   ALTIME22  SAP276X.
      ALUNIT22  SAP277X.   ALDURA22  SAP278X.   ALDURB22  SAP279X.
      ALCHRC22  SAP280X.   ALTIME23  SAP276X.   ALUNIT23  SAP277X.
      ALDURA23  SAP278X.   ALDURB23  SAP279X.   ALCHRC23  SAP280X.
      ALTIME24  SAP276X.   ALUNIT24  SAP277X.   ALDURA24  SAP278X.
      ALDURB24  SAP279X.   ALCHRC24  SAP280X.   ALTIME25  SAP276X.
      ALUNIT25  SAP277X.   ALDURA25  SAP278X.   ALDURB25  SAP279X.
      ALCHRC25  SAP280X.   ALTIME26  SAP276X.   ALUNIT26  SAP277X.
      ALDURA26  SAP278X.   ALDURB26  SAP279X.   ALCHRC26  SAP280X.
      ALTIME27  SAP276X.   ALUNIT27  SAP277X.   ALDURA27  SAP278X.
      ALDURB27  SAP279X.   ALCHRC27  SAP280X.   ALTIME28  SAP276X.
      ALUNIT28  SAP277X.   ALDURA28  SAP278X.   ALDURB28  SAP279X.
      ALCHRC28  SAP280X.   ALTIME29  SAP276X.   ALUNIT29  SAP277X.
      ALDURA29  SAP278X.   ALDURB29  SAP279X.   ALCHRC29  SAP280X.
      ALTIME30  SAP276X.   ALUNIT30  SAP277X.   ALDURA30  SAP278X.
      ALDURB30  SAP279X.   ALCHRC30  SAP280X.   ALTIME31  SAP276X.
      ALUNIT31  SAP277X.   ALDURA31  SAP278X.   ALDURB31  SAP279X.
      ALCHRC31  SAP280X.   ALTIME32  SAP276X.   ALUNIT32  SAP277X.
      ALDURA32  SAP278X.   ALDURB32  SAP279X.   ALCHRC32  SAP280X.
      ALTIME33  SAP276X.   ALUNIT33  SAP277X.   ALDURA33  SAP278X.
      ALDURB33  SAP279X.   ALCHRC33  SAP280X.   ALTIME34  SAP276X.
      ALUNIT34  SAP277X.   ALDURA34  SAP278X.   ALDURB34  SAP279X.
      ALCHRC34  SAP280X.   ALTIME90  SAP276X.   ALUNIT90  SAP277X.
      ALDURA90  SAP278X.   ALDURB90  SAP279X.   ALCHRC90  SAP280X.
      ALTIME91  SAP276X.   ALUNIT91  SAP277X.   ALDURA91  SAP278X.
      ALDURB91  SAP279X.   ALCHRC91  SAP280X.   ALCNDRT   SAP456X.
      ALCHRONR  SAP457X.

      /* AHB FORMAT ASSOCIATIONS */

      SMKEV     SAP028X.   SMKREG    SAP459X.   SMKNOW    SAP460X.
      SMKSTAT2  SAP461X.   SMKQTNO   SAP462X.   SMKQTTP   SAP463X.
      SMKQTY    SAP464X.   CIGSDA1   SAP465X.   CIGDAMO   SAP466X.
      CIGSDA2   SAP465X.   CIGSDAY   SAP465X.   CIGQTYR   SAP028X.
      ECIGEV2   SAP028X.   ECIGCUR2  SAP460X.   ECIG30D2  SAP472X.
      CIGAREV2  SAP028X.   CIGCUR2   SAP460X.   CIG30D2   SAP472X.
      PIPEV2    SAP028X.   PIPECUR2  SAP460X.   SMKLSTB1  SAP028X.
      SMKLSCR2  SAP460X.   VIGNO     SAP480X.   VIGTP     SAP481X.
      VIGFREQW  SAP482X.   VIGLNGNO  SAP483X.   VIGLNGTP  SAP484X.
      VIGMIN    SAP483X.   MODNO     SAP480X.   MODTP     SAP481X.
      MODFREQW  SAP488X.   MODLNGNO  SAP483X.   MODLNGTP  SAP484X.
      MODMIN    SAP483X.   STRNGNO   SAP480X.   STRNGTP   SAP481X.
      STRFREQW  SAP494X.   ALC1YR    SAP028X.   ALCLIFE   SAP028X.
      ALC12MNO  SAP497X.   ALC12MTP  SAP498X.   ALC12MWK  SAP499X.
      ALC12MYR  SAP500X.   ALCAMT    SAP501X.   ALCSTAT   SAP502X.
      ALC5UPN1  SAP500X.   ALC5UPT1  SAP504X.   ALC5UPY1  SAP500X.
      BINGE1    SAP472X.   AHEIGHT   SAP507X.   AWEIGHTP  SAP508X.
      BMI       SAP509X.

      /* AAU FORMAT ASSOCIATIONS */

      AUSUALPL  SAP510X.   APLKIND   SAP511X.   AHCPLROU  SAP028X.
      AHCPLKND  SAP513X.   AHCCHGYR  SAP028X.   AHCCHGHI  SAP028X.
      APRVTRYR  SAP028X.   APRVTRFD  SAP517X.   ADRNANP   SAP517X.
      ADRNAI    SAP517X.   AHCDLYR1  SAP028X.   AHCDLYR2  SAP028X.
      AHCDLYR3  SAP028X.   AHCDLYR4  SAP028X.   AHCDLYR5  SAP028X.
      AHCAFYR1  SAP028X.   AHCAFYR2  SAP028X.   AHCAFYR3  SAP028X.
      AHCAFYR4  SAP028X.   AHCAFYR5  SAP517X.   AHCAFYR6  SAP517X.
      AWORPAY   SAP531X.   AHICOMP   SAP225X.   ARX12MO   SAP028X.
      ARX12_1   SAP028X.   ARX12_2   SAP517X.   ARX12_3   SAP028X.
      ARX12_4   SAP028X.   ARX12_5   SAP028X.   ARX12_6   SAP028X.
      ADNLONG2  SAP540X.   AHCSYR1   SAP028X.   AHCSYR2   SAP028X.
      AHCSYR3   SAP028X.   AHCSYR4   SAP028X.   AHCSYR5   SAP028X.
      AHCSYR6   SAP028X.   AHCSYR7   SAP028X.   AHCSYR8   SAP028X.
      AHCSYR9   SAP028X.   AHCSYR10  SAP028X.   AHERNOY2  SAP551X.
      AERVISND  SAP028X.   AERHOS    SAP028X.   AERREA1R  SAP028X.
      AERREA2R  SAP028X.   AERREA3R  SAP028X.   AERREA4R  SAP028X.
      AERREA5R  SAP028X.   AERREA6R  SAP028X.   AERREA7R  SAP517X.
      AERREA8R  SAP517X.   AHCHYR    SAP028X.   AHCHMOYR  SAP472X.
      AHCHNOY2  SAP564X.   AHCNOYR2  SAP551X.   ASRGYR    SAP028X.
      ASRGNOYP  SAP567X.   AMDLONGR  SAP540X.   HIT1A     SAP517X.
      HIT2A     SAP028X.   HIT3A     SAP028X.   HIT4A     SAP517X.
      HIT5A     SAP517X.   FLUVACYR  SAP028X.   FLUVACTP  SAP575X.
      FLUVAC_M  SAP576X.   FLUVAC_Y  SAP577X.   FLUSHPG1  SAP578X.
      FLUSHPG2  SAP579X.   SHTPNUYR  SAP028X.   APOX      SAP028X.
      APOX12MO  SAP028X.   AHEP      SAP028X.   AHEPLIV   SAP028X.
      AHEPBTST  SAP517X.   SHTHEPB   SAP028X.   SHEPDOS   SAP587X.
      SHTHEPA   SAP028X.   SHEPANUM  SAP589X.   AHEPCTST  SAP517X.
      AHEPCRES  SAP591X.   SHINGLES  SAP028X.   SHTTD     SAP028X.
      SHTTD05   SAP028X.   SHTTDAP2  SAP595X.   SHTHPV2   SAP596X.
      SHHPVDOS  SAP597X.   AHPVAGE   SAP483X.   LIVEV     SAP028X.
      TRAVEL    SAP028X.   WRKHLTH2  SAP028X.   WRKDIR    SAP028X.
      APSBPCHK  SAP028X.   APSCHCHK  SAP028X.   APSBSCHK  SAP028X.
      APSPAP    SAP028X.   APSMAM    SAP028X.   APSCOL    SAP517X.
      APSDIET   SAP028X.   APSSMKC   SAP517X.   AINDINS2  SAP517X.
      AINDPRCH  SAP517X.   AINDWHO   SAP613X.   AINDDIF1  SAP614X.
      AINDDIF2  SAP615X.   AEXCHNG   SAP028X.

      /* ASI FORMAT ASSOCIATIONS */

      ASICPUSE  SAP617X.   ASISATHC  SAP618X.   ASITENUR  SAP619X.
      ASINHELP  SAP620X.   ASINCNTO  SAP620X.   ASINTRU   SAP620X.
      ASINKNT   SAP620X.   ASISIM    SAP624X.   ASISIF    SAP625X.
      ASIRETR   SAP626X.   ASIMEDC   SAP626X.   ASISTLV   SAP626X.
      ASICNHC   SAP626X.   ASICCOLL  SAP630X.   ASINBILL  SAP626X.
      ASIHCST   SAP626X.   ASICCMP   SAP633X.   ASISLEEP  SAP472X.
      ASISLPFL  SAP635X.   ASISLPST  SAP636X.   ASISLPMD  SAP637X.
      ASIREST   SAP638X.   ASISAD    SAP639X.   ASINERV   SAP639X.
      ASIRSTLS  SAP639X.   ASIHOPLS  SAP639X.   ASIEFFRT  SAP639X.
      ASIWTHLS  SAP639X.   ASIMUCH   SAP645X.   ACIBLD12  SAP028X.
      ASIHIVT   SAP028X.   ASIHIVWN  SAP648X.

      /* BAL FORMAT ASSOCIATIONS */

      BALEV     SAP028X.   BALAGE_P  SAP650X.   BDIZZ1    SAP028X.
      BRPROB1   SAP028X.   BRPROB2   SAP028X.   BRPROB3   SAP028X.
      BRPROB4   SAP028X.   BRPROB5   SAP028X.   BRPROB6   SAP028X.
      BRPROB7   SAP028X.   BTYPE_1   SAP028X.   BTYPE_2   SAP028X.
      BTYPE_3   SAP028X.   BTYPE_4   SAP028X.   BTYPE_5   SAP028X.
      BTYPE_6   SAP028X.   BTYPE_7   SAP028X.   BBOTH1    SAP668X.
      BAGE1_P   SAP650X.   BOFTN     SAP670X.   BOFTT     SAP671X.
      BLAST1    SAP672X.   BTRG_01   SAP028X.   BTRG_02   SAP028X.
      BTRG_03   SAP028X.   BTRG_04   SAP028X.   BTRG_05   SAP028X.
      BTRG_06   SAP028X.   BTRG_07   SAP028X.   BTRG_08   SAP028X.
      BTRG_09   SAP028X.   BTRG_10   SAP028X.   BSAME_1   SAP028X.
      BSAME_2   SAP028X.   BSAME_3   SAP028X.   BSAME_4   SAP028X.
      BSAME_5   SAP028X.   BSAME_6   SAP028X.   BSAME_7   SAP028X.
      BONLY_1   SAP690X.   BONLY_2   SAP690X.   BONLY_3   SAP690X.
      BONLY_4   SAP690X.   BONLY_5   SAP690X.   BONLY_6   SAP690X.
      BONLY_7   SAP690X.   BHOSP2    SAP028X.   BHOSPNO1  SAP698X.
      BHP1      SAP028X.   BHP1_01   SAP028X.   BHP1_02   SAP028X.
      BHP1_03   SAP028X.   BHP1_04   SAP028X.   BHP1_05   SAP028X.
      BHP1_06   SAP028X.   BHP1_07   SAP028X.   BHP1_08   SAP028X.
      BHP1_09   SAP028X.   BHP1_10   SAP028X.   BHP1_11   SAP028X.
      BHP1_12   SAP028X.   BHP1_13   SAP028X.   BHP1_14   SAP028X.
      BHP1_15   SAP028X.   B5YRS1    SAP698X.   BFIRST1   SAP716X.
      BHELP1    SAP717X.   BTHLP_N   SAP483X.   BTHLP_T   SAP463X.
      BDIAG1    SAP028X.   BCAUS101  SAP071X.   BCAUS102  SAP071X.
      BCAUS103  SAP071X.   BCAUS104  SAP071X.   BCAUS105  SAP071X.
      BCAUS106  SAP071X.   BCAUS107  SAP071X.   BCAUS108  SAP071X.
      BCAUS109  SAP071X.   BCAUS110  SAP071X.   BCAUS111  SAP071X.
      BCAUS112  SAP071X.   BCAUS113  SAP071X.   BCAUS114  SAP071X.
      BTRET1    SAP028X.   BTRT1_01  SAP028X.   BTRT1_02  SAP028X.
      BTRT1_03  SAP028X.   BTRT1_04  SAP028X.   BTRT1_06  SAP028X.
      BTRT1_07  SAP028X.   BTRT1_08  SAP028X.   BTRT1_09  SAP028X.
      BTRT1_10  SAP028X.   BTRT1_11  SAP028X.   BTRT1_12  SAP028X.
      BTRT1_13  SAP028X.   BTRT1_14  SAP028X.   BTRT1_15  SAP028X.
      BTRT1_16  SAP028X.   BSTAT1    SAP751X.   BMEDIC1   SAP028X.
      BCHNG1    SAP028X.   BCHG1_01  SAP028X.   BCHG1_02  SAP028X.
      BCHG1_03  SAP028X.   BCHG1_04  SAP028X.   BCHG1_05  SAP028X.
      BCHG1_06  SAP028X.   BCHG1_07  SAP028X.   BM12WS    SAP483X.
      BM12RA    SAP483X.   BPROB1    SAP763X.   BMED_1    SAP028X.
      BMED_2    SAP028X.   BMED_3    SAP028X.   BMED_4    SAP028X.
      BBIO1     SAP028X.   BFALL12M  SAP028X.   BFALL5Y   SAP028X.
      BFL1_01   SAP028X.   BFL1_02   SAP028X.   BFL1_03   SAP028X.
      BFL1_04   SAP028X.   BFL1_05   SAP028X.   BFL1_06   SAP028X.
      BFL1_07   SAP028X.   BFALL12A  SAP028X.   BF12M_NO  SAP483X.
      BF12M_TP  SAP780X.   BFTIME1   SAP781X.   BINJ1     SAP028X.
      BINJWS    SAP783X.   BINJHP    SAP028X.   BINJHPN   SAP698X.
      BFWH_01   SAP028X.   BFWH_02   SAP028X.   BFWH_03   SAP028X.
      BFWH_04   SAP028X.   BFWH_05   SAP028X.   BFWH_06   SAP028X.
      BFWH_07   SAP028X.   BFWH_08   SAP028X.   BFWH_09   SAP028X.
      BFWH_10   SAP028X.   BNRFALL   SAP796X.   BINTHI    SAP028X.
      BINTTR    SAP028X.   BINTRS    SAP028X.

      /* AWB FORMAT ASSOCIATIONS */

      AWEBUSE   SAP028X.   AWEBOFNO  SAP483X.   AWEBOFTP  SAP802X.
      AWEBEML   SAP028X.   AWEBMNO   SAP483X.   AWEBMTP   SAP802X.;
RUN;

PROC CONTENTS DATA=NHIS.SAMADULT;
   TITLE1 'CONTENTS OF THE 2016 NHIS Sample Adult FILE';

PROC FREQ DATA=NHIS.SAMADULT NOTITLE;
   TABLES RECTYPE/LIST MISSING;
   TITLE1 'FREQUENCY REPORT FOR 2016 NHIS Sample Adult FILE';
   TITLE2 '(WEIGHTED)';
   WEIGHT WTFA_SA;

PROC FREQ DATA=NHIS.SAMADULT NOTITLE;
   TABLES RECTYPE/LIST MISSING;
   TITLE1 'FREQUENCY REPORT FOR 2016 NHIS Sample Adult FILE';
   TITLE2 '(UNWEIGHTED)';

* USER NOTE: TO SEE UNFORMATTED VALUES IN PROCEDURES, ADD THE
             STATEMENT: FORMAT _ALL_;
RUN;
