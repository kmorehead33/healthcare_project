*********************************************************************
 MAY 29, 2012  3:26 PM
 
 This is an example of a SAS program that creates a SAS
 file from the 2011 NHIS Public Use SAMADULT.DAT ASCII file
 
 This is stored in SAMADULT.SAS
*********************************************************************;

* USER NOTE: PLACE NEXT STATEMENT IN SUBSEQUENT PROGRAMS;
LIBNAME  NHIS     "C:\NHIS2011";

* USER NOTE: PLACE NEXT STATEMENT IN SUBSEQUENT PROGRAMS
             IF YOU ALLOW PROGRAM TO PERMANENTLY STORE FORMATS;
LIBNAME  LIBRARY  "C:\NHIS2011";

FILENAME ASCIIDAT 'C:\NHIS2011\SAMADULT.dat';

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
      31                 = "31 Sample Adult Cancer"
      38                 = "38 Functioning and Disability"
      39                 = "39 Adult Disability Questions Test"
      40                 = "40 Sample Child"
      49                 = "49 Child Disability Questions Test"
      60                 = "60 Family"
      63                 = "63 Family Disability Questions Test"
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
      1                  = "1 Physical or mental condition prohibits responding"
      2                  = "2 Sample adult is able to respond"
      3                  = "3 Unknown"
   ;
   VALUE SAP021X
      1                  = "1 Yes"
      2                  = "2 No"
   ;
   VALUE SAP022X
      1                  = "1 Relative who lives in household"
      2                  = "2 Relative who doesn't live in household"
      3                  = "3 Other caregiver"
      4                  = "4 Other"
      7                  = "7 Refused"
      8                  = "8 Not ascertained"
      9                  = "9 Don't know"
   ;
   VALUE SAP023X
      1                  = 
"1 Started Sample Adult Core 2+ weeks after the initial interview"
      2                  = 
"2 Started Sample Adult Core less than 2 weeks after the initial interview"
   ;
   VALUE SAP024X
      1                  = 
"1 Families selected to receive ADB (sample adults) and CDB (sample children 1-1
7 years) sections"
      2                  = 
"2 Families selected to receive FDB (all persons 1 year and older) and AFD (samp
le adults) sections"
   ;
   VALUE SAP025X
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
   VALUE SAP026X
      01                 = "01 Taking care of house or family"
      02                 = "02 Going to school"
      03                 = "03 Retired"
      04                 = "04 On a planned vacation from work"
      05                 = "05 On family or maternity leave"
      06                 = "06 Temporarily unable to work for health reasons"
      07                 = "07 Have job/contract and off-season"
      08                 = "08 On layoff"
      09                 = "09 Disabled"
      10                 = "10 Other"
      97                 = "97 Refused"
      98                 = "98 Not ascertained"
      99                 = "99 Don't know"
   ;
   VALUE SAP027X
      1                  = "1 Yes"
      2                  = "2 No"
      7                  = "7 Refused"
      8                  = "8 Not ascertained"
      9                  = "9 Don't know"
   ;
   VALUE SAP028X
      .                   = '.'
      OTHER              = 
"See Industry Appendix in file layout at the end of the Sample Adult Documentati
on"
   ;
   VALUE SAP030X
      .                   = '.'
      OTHER              = 
"See Occupation Appendix in file layout at the end of the Sample Adult documenta
tion"
   ;
   VALUE SAP032X
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
   VALUE SAP034X
      01                 = "01 1-9 employees"
      02                 = "02 10-24 employees"
      03                 = "03 25-49 employees"
      04                 = "04 50-99 employees"
      05                 = "05 100-249 employees"
      06                 = "06 250-499 employees"
      07                 = "07 500-999 employees"
      08                 = "08 1000 employees or more"
      97                 = "97 Refused"
      98                 = "98 Not ascertained"
      99                 = "99 Don't know"
   ;
   VALUE SAP035X
      00                 = "00 Less than 1 year"
      35                 = "35 35 or more years"
      97                 = "97 Refused"
      98                 = "98 Not ascertained"
      99                 = "99 Don't know"
   ;
   VALUE SAP040X
      0                  = "0 Had job last week"
      1                  = "1 No job last week, had job past 12 months"
      2                  = "2 No job last week, no job past 12 months"
      3                  = "3 Never worked"
      7                  = "7 Refused"
      8                  = "8 Not ascertained"
      9                  = "9 Don't know"
   ;
   VALUE SAP056X
      1                  = "1 Mentioned"
      2                  = "2 Not mentioned"
      7                  = "7 Refused"
      8                  = "8 Not ascertained"
      9                  = "9 Don't know"
   ;
   VALUE SAP087X
      85                 = "85 85+ years"
      97                 = "97 Refused"
      98                 = "98 Not ascertained"
      99                 = "99 Don't know"
   ;
   VALUE SAP117X
      1                  = "1 Yes"
      2                  = "2 No"
      3                  = "3 Borderline"
      7                  = "7 Refused"
      8                  = "8 Not ascertained"
      9                  = "9 Don't know"
   ;
   VALUE SAP120X
      00                 = "00 Within past year"
      85                 = "85 85+ years"
      96                 = "96 1+ year(s) with diabetes and age is 85+"
      97                 = "97 Refused"
      98                 = "98 Not ascertained"
      99                 = "99 Don't know"
   ;
   VALUE SAP160X
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
   VALUE SAP164X
      1                  = "1 ALL of the time"
      2                  = "2 MOST of the time"
      3                  = "3 SOME of the time"
      4                  = "4 A LITTLE of the time"
      5                  = "5 NONE of the time"
      7                  = "7 Refused"
      8                  = "8 Not ascertained"
      9                  = "9 Don't know"
   ;
   VALUE SAP170X
      1                  = "1 A lot"
      2                  = "2 Some"
      3                  = "3 A little"
      4                  = "4 Not at all"
      7                  = "7 Refused"
      8                  = "8 Not ascertained"
      9                  = "9 Don't know"
   ;
   VALUE SAP171X
      000                = "000 None"
      997                = "997 Refused"
      998                = "998 Not ascertained"
      999                = "999 Don't know"
   ;
   VALUE SAP173X
      1                  = "1 Better"
      2                  = "2 Worse"
      3                  = "3 About the same"
      7                  = "7 Refused"
      8                  = "8 Not ascertained"
      9                  = "9 Don't know"
   ;
   VALUE SAP175X
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
   VALUE SAP187X
      1                  = "1 Limited in any way"
      2                  = "2 Not limited in any way"
      3                  = "3 Unknown if limited"
   ;
   VALUE SAP224X
      95                 = "95 95+"
      96                 = "96 Since birth"
      97                 = "97 Refused"
      98                 = "98 Not ascertained"
      99                 = "99 Don't know"
   ;
   VALUE SAP225X
      1                  = "1 Day(s)"
      2                  = "2 Week(s)"
      3                  = "3 Month(s)"
      4                  = "4 Year(s)"
      6                  = "6 Since birth"
      7                  = "7 Refused"
      8                  = "8 Not ascertained"
      9                  = "9 Don't know"
   ;
   VALUE SAP226X
      00                 = "00 Less than 1 year"
      85                 = "85 85+ years"
      96                 = "96 Unknown number of years"
      97                 = "97 Refused"
      98                 = "98 Not ascertained"
      99                 = "99 Don't know"
   ;
   VALUE SAP227X
      1                  = "1 Less than 3 months"
      2                  = "2 3-5 months"
      3                  = "3 6-12 months"
      4                  = "4 More than 1 year"
      7                  = "7 Refused"
      8                  = "8 Not ascertained"
      9                  = "9 Don't know"
   ;
   VALUE SAP228X
      1                  = "1 Chronic"
      2                  = "2 Not chronic"
      9                  = "9 Unknown if chronic"
   ;
   VALUE SAP404X
      1                  = 
"1 At least one condition causing functional limitation is chronic"
      2                  = "2 No condition causing functional limitation"
      9                  = 
"9 Unknown if any condition causing functional limitation is chronic"
   ;
   VALUE SAP405X
      0                  = 
"0 Not limited in any way (including unknown if limited)"
      1                  = "1 Limited; caused by at least one chronic condition"
      2                  = "2 Limited; not caused by chronic condition"
      3                  = "3 Limited; unknown if condition is chronic"
   ;
   VALUE SAP407X
      85                 = "85 85 years or older"
      96                 = "96 Never smoked regularly"
      97                 = "97 Refused"
      98                 = "98 Not ascertained"
      99                 = "99 Don't know"
   ;
   VALUE SAP408X
      1                  = "1 Every day"
      2                  = "2 Some days"
      3                  = "3 Not at all"
      7                  = "7 Refused"
      8                  = "8 Not ascertained"
      9                  = "9 Don't know"
   ;
   VALUE SAP409X
      1                  = "1 Current every day smoker"
      2                  = "2 Current some day smoker"
      3                  = "3 Former smoker"
      4                  = "4 Never smoker"
      5                  = "5 Smoker, current status unknown"
      9                  = "9 Unknown if ever smoked"
   ;
   VALUE SAP410X
      95                 = "95 95+"
      97                 = "97 Refused"
      98                 = "98 Not ascertained"
      99                 = "99 Don't know"
   ;
   VALUE SAP411X
      1                  = "1 Day(s)"
      2                  = "2 Week(s)"
      3                  = "3 Month(s)"
      4                  = "4 Year(s)"
      7                  = "7 Refused"
      8                  = "8 Not ascertained"
      9                  = "9 Don't know"
   ;
   VALUE SAP412X
      00                 = "00 Less than 1 year"
      70                 = "70 70+ years"
      97                 = "97 Refused"
      98                 = "98 Not ascertained"
      99                 = "99 Don't know"
   ;
   VALUE SAP413X
      95                 = "95 95+ cigarettes"
      97                 = "97 Refused"
      98                 = "98 Not ascertained"
      99                 = "99 Don't know"
   ;
   VALUE SAP414X
      00                 = "00 None"
      97                 = "97 Refused"
      98                 = "98 Not ascertained"
      99                 = "99 Don't know"
   ;
   VALUE SAP418X
      000                = "000 Never"
      996                = "996 Unable to do this type activity"
      997                = "997 Refused"
      998                = "998 Not ascertained"
      999                = "999 Don't know"
   ;
   VALUE SAP419X
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
   VALUE SAP420X
      00                 = "00 Less than once per week"
      95                 = "95 Never"
      96                 = "96 Unable to do vigorous activity"
      97                 = "97 Refused"
      98                 = "98 Not ascertained"
      99                 = "99 Don't know"
   ;
   VALUE SAP421X
      997                = "997 Refused"
      998                = "998 Not ascertained"
      999                = "999 Don't know"
   ;
   VALUE SAP422X
      1                  = "1 Minutes"
      2                  = "2 Hours"
      7                  = "7 Refused"
      8                  = "8 Not ascertained"
      9                  = "9 Don't know"
   ;
   VALUE SAP426X
      00                 = "00 Less than once per week"
      95                 = "95 Never"
      96                 = "96 Unable to do light or moderate activity"
      97                 = "97 Refused"
      98                 = "98 Not ascertained"
      99                 = "99 Don't know"
   ;
   VALUE SAP432X
      00                 = "00 Less than once per week"
      95                 = "95 Never"
      96                 = "96 Unable to do strength activity"
      97                 = "97 Refused"
      98                 = "98 Not ascertained"
      99                 = "99 Don't know"
   ;
   VALUE SAP442X
      000                = "000 Never"
      997                = "997 Refused"
      998                = "998 Not ascertained"
      999                = "999 Don't know"
   ;
   VALUE SAP443X
      0                  = "0 Never/None"
      1                  = "1 Week"
      2                  = "2 Month"
      3                  = "3 Year"
      7                  = "7 Refused"
      8                  = "8 Not ascertained"
      9                  = "9 Don't know"
   ;
   VALUE SAP444X
      00                 = "00 Less than one day per week"
      95                 = "95 Did not drink in past year"
      97                 = "97 Refused"
      98                 = "98 Not ascertained"
      99                 = "99 Don't know"
   ;
   VALUE SAP445X
      000                = "000 Never/none"
      997                = "997 Refused"
      998                = "998 Not ascertained"
      999                = "999 Don't know"
   ;
   VALUE SAP446X
      95                 = "95 95+ drinks"
      97                 = "97 Refused"
      98                 = "98 Not ascertained"
      99                 = "99 Don't know"
   ;
   VALUE SAP447X
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
   VALUE SAP449X
      0                  = "0 Never/None"
      1                  = "1 Per week"
      2                  = "2 Per month"
      3                  = "3 Per year"
      7                  = "7 Refused"
      8                  = "8 Not ascertained"
      9                  = "9 Don't know"
   ;
   VALUE SAP451X
      96                 = "96 Not available"
      97                 = "97 Refused"
      98                 = "98 Not ascertained"
      99                 = "99 Don't know"
   ;
   VALUE SAP452X
      996                = "996 Not available"
      997                = "997 Refused"
      998                = "998 Not ascertained"
      999                = "999 Don't know"
   ;
   VALUE SAP453X
      99.95              = "99.95 99.95+"
      99.99              = "99.99 Unknown"
   ;
   VALUE SAP454X
      97                 = "97 Refused"
      98                 = "98 Not ascertained"
      99                 = "99 Don't know"
   ;
   VALUE SAP455X
      1                  = "1 Yes"
      2                  = "2 There is NO place"
      3                  = "3 There is MORE THAN ONE place"
      7                  = "7 Refused"
      8                  = "8 Not ascertained"
      9                  = "9 Don't know"
   ;
   VALUE SAP456X
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
   VALUE SAP458X
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
   VALUE SAP461X
      1                  = "1 Mentioned"
      2                  = "2 Not mentioned"
      7                  = "7 Refused"
      8                  = "8 Not ascertained"
      9                  = "9 Don’t know"
   ;
   VALUE SAP471X
      1                  = "1 Yes"
      2                  = "2 No"
      7                  = "7 Refused"
      8                  = "8 Not ascertained"
      9                  = "9 Don’t know"
   ;
   VALUE SAP473X
      1                  = "1 Yes"
      2                  = "2 No"
      7                  = "7 Refused"
      8                  = "8 Not ascertained"
      9                  = "9 Don’t' know"
   ;
   VALUE SAP485X
      1                  = "1 Very worried"
      2                  = "2 Somewhat worried"
      3                  = "3 Not at all worried"
      7                  = "7 Refused"
      8                  = "8 Not ascertained"
      9                  = "9 Don't know"
   ;
   VALUE SAP493X
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
   VALUE SAP504X
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
   VALUE SAP517X
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
   VALUE SAP520X
      95                 = "95 95+ times"
      97                 = "97 Refused"
      98                 = "98 Not ascertained"
      99                 = "99 Don't know"
   ;
   VALUE SAP522X
      1                  = "1 Clinic or health center"
      2                  = "2 Doctor's office or HMO"
      3                  = "3 Hospital emergency room"
      4                  = "4 Hospital outpatient department"
      5                  = "5 Urgent care center"
      6                  = "6 Some other place"
      7                  = "7 Refused"
      8                  = "8 Not ascertained"
      9                  = "9 Don't know"
   ;
   VALUE SAP523X
      1                  = "1 General doctor"
      2                  = "2 Specialist"
      3                  = "3 Someone else"
      7                  = "7 Refused"
      8                  = "8 Not ascertained"
      9                  = "9 Don’t know"
   ;
   VALUE SAP524X
      00                 = "00 Same day"
      97                 = "97 Refused"
      98                 = "98 Not ascertained"
      99                 = "99 Don’t know"
   ;
   VALUE SAP525X
      1                  = "1 Days"
      2                  = "2 Weeks"
      3                  = "3 Months"
      7                  = "7 Refused"
      8                  = "8 Not ascertained"
      9                  = "9 Don’t know"
   ;
   VALUE SAP526X
      00                 = "00 No time"
      97                 = "97 Refused"
      98                 = "98 Not ascertained"
      99                 = "99 Don’t know"
   ;
   VALUE SAP527X
      1                  = "1 Minutes"
      2                  = "2 Hours"
      7                  = "7 Refused"
      8                  = "8 Not ascertained"
      9                  = "9 Don’t know"
   ;
   VALUE SAP534X
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
   VALUE SAP535X
      .                   = '.'
      OTHER              = "Year"
      9997               = "9997 Refused"
      9998               = "9998 Not ascertained"
      9999               = "9999 Don't know"
   ;
   VALUE SAP545X
      1                  = "1 Received at least 3 doses"
      2                  = "2 Received less than 3 doses"
      7                  = "7 Refused"
      8                  = "8 Not ascertained"
      9                  = "9 Don't know"
   ;
   VALUE SAP547X
      96                 = "96 Received all shots"
      97                 = "97 Refused"
      98                 = "98 Not ascertained"
      99                 = "99 Don't know"
   ;
   VALUE SAP551X
      1                  = "1 Yes-included pertussis"
      2                  = "2 No-did not include pertussis"
      3                  = "3 Doctor did not say"
      7                  = "7 Refused"
      8                  = "8 Not ascertained"
      9                  = "9 Don't know"
   ;
   VALUE SAP554X
      1                  = "1 Yes"
      2                  = "2 No"
      3                  = "3 Doctor refused when asked"
      7                  = "7 Refused"
      8                  = "8 Not Ascertained"
      9                  = "9 Don't know"
   ;
   VALUE SAP555X
      50                 = "50 50+ shots"
      96                 = "96 All shots"
      97                 = "97 Refused"
      98                 = "98 Not Ascertained"
      99                 = "99 Don't know"
   ;
   VALUE SAP569X
      1                  = "1 Very likely"
      2                  = "2 Somewhat likely"
      3                  = "3 Somewhat unlikely"
      4                  = "4 Very unlikely"
      7                  = "7 Refused"
      8                  = "8 Not ascertained"
      9                  = "9 Don't know"
   ;
   VALUE SAP576X
      01                 = "01 $1-$24 per month"
      02                 = "02 $25-$49 per month"
      03                 = "03 $50-$74 per month"
      04                 = "04 $75-$99 per month"
      05                 = "05 $100-$124 per month"
      06                 = "06 $125 per month or more"
      07                 = "07 Nothing/Not interested in the program"
      97                 = "97 Refused"
      98                 = "98 Not ascertained"
      99                 = "99 Don’t know"
   ;
   VALUE SAP580X
      1                  = "1 Self"
      2                  = "2 Someone else in family"
      3                  = "3 Both"
      7                  = "7 Refused"
      8                  = "8 Not ascertained"
      9                  = "9 Don’t know"
   ;
   VALUE SAP581X
      1                  = "1 Very difficult"
      2                  = "2 Somewhat difficult"
      3                  = "3 Not at all difficult"
      7                  = "7 Refused"
      8                  = "8 Not ascertained"
      9                  = "9 Don’t know"
   ;

DATA NHIS.SAMADULT;
   * CREATE A SAS DATA SET;
   INFILE ASCIIDAT PAD LRECL=827;

   * DEFINE LENGTH OF ALL VARIABLES;

   LENGTH

      /* IDN LENGTHS */

      RECTYPE    3   SRVY_YR    4   HHX      $ 6   INTV_QRT   3
      INTV_MON   3   FMX      $ 2   FPX      $ 2   WTIA_SA    8
      WTFA_SA    8

      /* UCF LENGTHS */

      REGION     3   STRAT_P    4   PSU_P      3

      /* HHC LENGTHS */

      SEX        3   HISPAN_I   3   RACERPI2   3   MRACRPI2   3
      MRACBPI2   3   AGE_P      3

      /* FID LENGTHS */

      R_MARITL   3

      /* AID LENGTHS */

      PROXYSA    3   PROX1      3   PROX2      3   LATEINTA   3

      /* FDB LENGTHS */

      FDRN_FLG   3

      /* ASD LENGTHS */

      DOINGLWA   3   WHYNOWKA   3   EVERWRK    3   INDSTRN1   3
      INDSTRN2   3   OCCUPN1    3   OCCUPN2    3   WRKCATA    3
      BUSINC1A   3   LOCALL1A   3   YRSWRKPA   3   WRKLONGH   3
      HOURPDA    3   PDSICKA    3   ONEJOB     3   WRKLYR4    3

      /* ACN LENGTHS */

      HYPEV      3   HYPDIFV    3   CHDEV      3   ANGEV      3
      MIEV       3   HRTEV      3   STREV      3   EPHEV      3
      AASMEV     3   AASSTILL   3   AASMYR     3   AASERYR1   3
      ULCEV      3   ULCYR      3   CANEV      3   CNKIND1    3
      CNKIND2    3   CNKIND3    3   CNKIND4    3   CNKIND5    3
      CNKIND6    3   CNKIND7    3   CNKIND8    3   CNKIND9    3
      CNKIND10   3   CNKIND11   3   CNKIND12   3   CNKIND13   3
      CNKIND14   3   CNKIND15   3   CNKIND16   3   CNKIND17   3
      CNKIND18   3   CNKIND19   3   CNKIND20   3   CNKIND21   3
      CNKIND22   3   CNKIND23   3   CNKIND24   3   CNKIND25   3
      CNKIND26   3   CNKIND27   3   CNKIND28   3   CNKIND29   3
      CNKIND30   3   CNKIND31   3   CANAGE1    4   CANAGE2    4
      CANAGE3    4   CANAGE4    4   CANAGE5    4   CANAGE6    4
      CANAGE7    4   CANAGE8    4   CANAGE9    4   CANAGE10   4
      CANAGE11   4   CANAGE12   4   CANAGE13   4   CANAGE14   4
      CANAGE15   4   CANAGE16   4   CANAGE17   4   CANAGE18   4
      CANAGE19   4   CANAGE20   4   CANAGE21   4   CANAGE22   4
      CANAGE23   4   CANAGE24   4   CANAGE25   4   CANAGE26   4
      CANAGE27   4   CANAGE28   4   CANAGE29   4   CANAGE30   4
      DIBEV      3   DIBPRE1    3   DIBAGE     3   DIFAGE2    3
      INSLN      3   DIBPILL    3   AHAYFYR    3   SINYR      3
      CBRCHYR    3   KIDWKYR    3   LIVYR      3   JNTSYMP    3
      JMTHP1     3   JMTHP2     3   JMTHP3     3   JMTHP4     3
      JMTHP5     3   JMTHP6     3   JMTHP7     3   JMTHP8     3
      JMTHP9     3   JMTHP10    3   JMTHP11    3   JMTHP12    3
      JMTHP13    3   JMTHP14    3   JMTHP15    3   JMTHP16    3
      JMTHP17    3   JNTCHR     3   JNTHP      3   ARTH1      3
      ARTHLMT    3   PAINECK    3   PAINLB     3   PAINLEG    3
      PAINFACE   3   AMIGR      3   ACOLD2W    3   AINTIL2W   3
      PREGNOW    3   HRAIDNOW   3   HRAIDEV    3   AHEARST1   3
      AVISION    3   ABLIND     3   LUPPRT     3   SAD        3
      NERVOUS    3   RESTLESS   3   HOPELESS   3   EFFORT     3
      WORTHLS    3   MHAMTMO    3

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
      VIGNO      4   VIGTP      3   VIGFREQW   3   VIGLNGNO   4
      VIGLNGTP   3   VIGMIN     4   MODNO      4   MODTP      3
      MODFREQW   3   MODLNGNO   4   MODLNGTP   3   MODMIN     4
      STRNGNO    4   STRNGTP    3   STRFREQW   3   DISHFAC    3
      DISHFL02   3   DISHFL03   3   DISHFL04   3   DISHFL05   3
      DISHFL06   3   DISHFL07   3   ALC1YR     3   ALCLIFE    3
      ALC12MNO   4   ALC12MTP   3   ALC12MWK   3   ALC12MYR   4
      ALCAMT     3   ALCSTAT    3   ALC5UPNO   4   ALC5UPTP   3
      ALC5UPYR   4   AHEIGHT    3   AWEIGHTP   4   BMI        8
      SLEEP      3

      /* AAU LENGTHS */

      AUSUALPL   3   APLKIND    3   AHCPLROU   3   AHCPLKND   3
      AHCCHGYR   3   AHCCHGHI   3   ANOUSPL1   3   ANOUSPL2   3
      ANOUSPL3   3   ANOUSPL4   3   ANOUSPL5   3   ANOUSPL6   3
      ANOUSPL7   3   ANOUSPL8   3   ANOUSPL9   3   APRVTRYR   3
      APRVTRFD   3   ADRNANP    3   ADRNAI     3   AHCDLYR1   3
      AHCDLYR2   3   AHCDLYR3   3   AHCDLYR4   3   AHCDLYR5   3
      AHCAFYR1   3   AHCAFYR2   3   AHCAFYR3   3   AHCAFYR4   3
      AHCAFYR5   3   AHCAFYR6   3   AWORPAY    3   AHICOMP    3
      ARXPR_1    3   ARXPR_2    3   ARXPR_3    3   ARXPR_4    3
      ARXPR_5    3   ARXPR_6    3   ADNLONG2   3   AHCSYR1    3
      AHCSYR2    3   AHCSYR3    3   AHCSYR4    3   AHCSYR5    3
      AHCSYR6    3   AHCSYR7    3   AHCSYR8    3   AHCSYR9    3
      AHCSYR10   3   AHERNOY2   3   AERVISND   3   AERHOS     3
      AERREAS1   3   AERREAS2   3   AERREAS3   3   AERREAS4   3
      AERREAS5   3   AERREAS6   3   AERREAS7   3   AERREAS8   3
      AHCHYR     3   AHCHMOYR   3   AHCHNOY2   3   AHCNOYR2   3
      ASRGYR     3   ASRGNOYR   3   AMDLONGR   3   AVISLAST   3
      ALASTTYP   3   AVISAPTN   3   AVISAPTT   3   AWAITRMN   3
      AWAITRMT   3   HIT1A      3   HIT2A      3   HIT3A      3
      HIT4A      3   HIT5A      3   SHTFLU2    3   ASHFLUM2   3
      ASHFLUY2   4   SPRFLU2    3   ASPFLUM2   3   ASPFLUY2   4
      SHTPNUYR   3   APOX       3   APOX12MO   3   AHEP       3
      AHEPLIV    3   SHTHEPB    3   SHEPDOS    3   SHTHEPA    3
      SHEPANUM   3   SHINGLES   3   SHTTD      3   SHTTD05    3
      SHTTDAP    3   HPVHRD     3   SHHPVHD1   3   SHTHPV1    3
      SHHPVDOS   3   LIVEV      3   TRAVEL     3   WRKHLTH    3
      WRKDIR     3   APSBPCHK   3   APSCHCHK   3   APSBSCHK   3
      APSPAP     3   APSMAM     3   APSCOL     3   APSDIET    3
      APSSMKC    3   LTCFAM     3   LTCHELP    3   LTCWHO1    3
      LTCWHO2    3   LTCWHO3    3   LTCWHO4    3   LTCWHO5    3
      LTCPRCH    3   LTCPAY     3   LTC100M    3   AINDINS    3
      AINDPRCH   3   AINDWHO    3   AINDDIF1   3   AINDDIF2   3
      AINDENY1   3   AINDENY2   3   AINDENY3   3   AINDNOT1   3
      AINDNOT2   3   AINDNOT3   3   AINDNOT4   3   AINDNOT5   3
      HIVTST1    3 ;

   * INPUT ALL VARIABLES;

   INPUT

      /* IDN LOCATIONS */

      RECTYPE       1 -   2    SRVY_YR       3 -   6
      HHX      $    7 -  12    INTV_QRT     13 -  13
      INTV_MON     14 -  15    FMX      $   16 -  17
      FPX      $   18 -  19    WTIA_SA      20 -  26 .1
      WTFA_SA      27 -  32

      /* UCF LOCATIONS */

      REGION       33 -  33    STRAT_P      34 -  36
      PSU_P        37 -  38

      /* HHC LOCATIONS */

      SEX          39 -  39    HISPAN_I     40 -  41
      RACERPI2     42 -  43    MRACRPI2     44 -  45
      MRACBPI2     46 -  47    AGE_P        48 -  49


      /* FID LOCATIONS */

      R_MARITL     50 -  50

      /* AID LOCATIONS */

      PROXYSA      51 -  51    PROX1        52 -  52
      PROX2        53 -  53    LATEINTA     54 -  54


      /* FDB LOCATIONS */

      FDRN_FLG     55 -  55

      /* ASD LOCATIONS */

      DOINGLWA     56 -  56    WHYNOWKA     57 -  58
      EVERWRK      59 -  59    INDSTRN1     60 -  61
      INDSTRN2     62 -  63    OCCUPN1      64 -  65
      OCCUPN2      66 -  67    WRKCATA      68 -  68
      BUSINC1A     69 -  69    LOCALL1A     70 -  71
      YRSWRKPA     72 -  73    WRKLONGH     74 -  74
      HOURPDA      75 -  75    PDSICKA      76 -  76
      ONEJOB       77 -  77    WRKLYR4      78 -  78


      /* ACN LOCATIONS */

      HYPEV        79 -  79    HYPDIFV      80 -  80
      CHDEV        81 -  81    ANGEV        82 -  82
      MIEV         83 -  83    HRTEV        84 -  84
      STREV        85 -  85    EPHEV        86 -  86
      AASMEV       87 -  87    AASSTILL     88 -  88
      AASMYR       89 -  89    AASERYR1     90 -  90
      ULCEV        91 -  91    ULCYR        92 -  92
      CANEV        93 -  93    CNKIND1      94 -  94
      CNKIND2      95 -  95    CNKIND3      96 -  96
      CNKIND4      97 -  97    CNKIND5      98 -  98
      CNKIND6      99 -  99    CNKIND7     100 - 100
      CNKIND8     101 - 101    CNKIND9     102 - 102
      CNKIND10    103 - 103    CNKIND11    104 - 104
      CNKIND12    105 - 105    CNKIND13    106 - 106
      CNKIND14    107 - 107    CNKIND15    108 - 108
      CNKIND16    109 - 109    CNKIND17    110 - 110
      CNKIND18    111 - 111    CNKIND19    112 - 112
      CNKIND20    113 - 113    CNKIND21    114 - 114
      CNKIND22    115 - 115    CNKIND23    116 - 116
      CNKIND24    117 - 117    CNKIND25    118 - 118
      CNKIND26    119 - 119    CNKIND27    120 - 120
      CNKIND28    121 - 121    CNKIND29    122 - 122
      CNKIND30    123 - 123    CNKIND31    124 - 124
      CANAGE1     125 - 127    CANAGE2     128 - 130
      CANAGE3     131 - 133    CANAGE4     134 - 136
      CANAGE5     137 - 139    CANAGE6     140 - 142
      CANAGE7     143 - 145    CANAGE8     146 - 148
      CANAGE9     149 - 151    CANAGE10    152 - 154
      CANAGE11    155 - 157    CANAGE12    158 - 160
      CANAGE13    161 - 163    CANAGE14    164 - 166
      CANAGE15    167 - 169    CANAGE16    170 - 172
      CANAGE17    173 - 175    CANAGE18    176 - 178
      CANAGE19    179 - 181    CANAGE20    182 - 184
      CANAGE21    185 - 187    CANAGE22    188 - 190
      CANAGE23    191 - 193    CANAGE24    194 - 196
      CANAGE25    197 - 199    CANAGE26    200 - 202
      CANAGE27    203 - 205    CANAGE28    206 - 208
      CANAGE29    209 - 211    CANAGE30    212 - 214
      DIBEV       215 - 215    DIBPRE1     216 - 216
      DIBAGE      217 - 218    DIFAGE2     219 - 220
      INSLN       221 - 221    DIBPILL     222 - 222
      AHAYFYR     223 - 223    SINYR       224 - 224
      CBRCHYR     225 - 225    KIDWKYR     226 - 226
      LIVYR       227 - 227    JNTSYMP     228 - 228
      JMTHP1      229 - 229    JMTHP2      230 - 230
      JMTHP3      231 - 231    JMTHP4      232 - 232
      JMTHP5      233 - 233    JMTHP6      234 - 234
      JMTHP7      235 - 235    JMTHP8      236 - 236
      JMTHP9      237 - 237    JMTHP10     238 - 238
      JMTHP11     239 - 239    JMTHP12     240 - 240
      JMTHP13     241 - 241    JMTHP14     242 - 242
      JMTHP15     243 - 243    JMTHP16     244 - 244
      JMTHP17     245 - 245    JNTCHR      246 - 246
      JNTHP       247 - 247    ARTH1       248 - 248
      ARTHLMT     249 - 249    PAINECK     250 - 250
      PAINLB      251 - 251    PAINLEG     252 - 252
      PAINFACE    253 - 253    AMIGR       254 - 254
      ACOLD2W     255 - 255    AINTIL2W    256 - 256
      PREGNOW     257 - 257    HRAIDNOW    258 - 258
      HRAIDEV     259 - 259    AHEARST1    260 - 260
      AVISION     261 - 261    ABLIND      262 - 262
      LUPPRT      263 - 263    SAD         264 - 264
      NERVOUS     265 - 265    RESTLESS    266 - 266
      HOPELESS    267 - 267    EFFORT      268 - 268
      WORTHLS     269 - 269    MHAMTMO     270 - 270


      /* AHS LOCATIONS */

      WKDAYR      271 - 273    BEDDAYR     274 - 276
      AHSTATYR    277 - 277    SPECEQ      278 - 278
      FLWALK      279 - 279    FLCLIMB     280 - 280
      FLSTAND     281 - 281    FLSIT       282 - 282
      FLSTOOP     283 - 283    FLREACH     284 - 284
      FLGRASP     285 - 285    FLCARRY     286 - 286
      FLPUSH      287 - 287    FLSHOP      288 - 288
      FLSOCL      289 - 289    FLRELAX     290 - 290
      FLA1AR      291 - 291    AFLHCA1     292 - 292
      AFLHCA2     293 - 293    AFLHCA3     294 - 294
      AFLHCA4     295 - 295    AFLHCA5     296 - 296
      AFLHCA6     297 - 297    AFLHCA7     298 - 298
      AFLHCA8     299 - 299    AFLHCA9     300 - 300
      AFLHCA10    301 - 301    AFLHCA11    302 - 302
      AFLHCA12    303 - 303    AFLHCA13    304 - 304
      ALHCA14A    305 - 305    AFLHCA15    306 - 306
      AFLHCA16    307 - 307    AFLHCA17    308 - 308
      AFLHCA18    309 - 309    AFLHC19_    310 - 310
      AFLHC20_    311 - 311    AFLHC21_    312 - 312
      AFLHC22_    313 - 313    AFLHC23_    314 - 314
      AFLHC24_    315 - 315    AFLHC25_    316 - 316
      AFLHC26_    317 - 317    AFLHC27_    318 - 318
      AFLHC28_    319 - 319    AFLHC29_    320 - 320
      AFLHC30_    321 - 321    AFLHC31_    322 - 322
      AFLHC32_    323 - 323    AFLHC33_    324 - 324
      AFLHC34_    325 - 325    AFLHCA90    326 - 326
      AFLHCA91    327 - 327    ALTIME1     328 - 329
      ALUNIT1     330 - 330    ALDURA1     331 - 332
      ALDURB1     333 - 333    ALCHRC1     334 - 334
      ALTIME2     335 - 336    ALUNIT2     337 - 337
      ALDURA2     338 - 339    ALDURB2     340 - 340
      ALCHRC2     341 - 341    ALTIME3     342 - 343
      ALUNIT3     344 - 344    ALDURA3     345 - 346
      ALDURB3     347 - 347    ALCHRC3     348 - 348
      ALTIME4     349 - 350    ALUNIT4     351 - 351
      ALDURA4     352 - 353    ALDURB4     354 - 354
      ALCHRC4     355 - 355    ALTIME5     356 - 357
      ALUNIT5     358 - 358    ALDURA5     359 - 360
      ALDURB5     361 - 361    ALCHRC5     362 - 362
      ALTIME6     363 - 364    ALUNIT6     365 - 365
      ALDURA6     366 - 367    ALDURB6     368 - 368
      ALCHRC6     369 - 369    ALTIME7     370 - 371
      ALUNIT7     372 - 372    ALDURA7     373 - 374
      ALDURB7     375 - 375    ALCHRC7     376 - 376
      ALTIME8     377 - 378    ALUNIT8     379 - 379
      ALDURA8     380 - 381    ALDURB8     382 - 382
      ALCHRC8     383 - 383    ALTIME9     384 - 385
      ALUNIT9     386 - 386    ALDURA9     387 - 388
      ALDURB9     389 - 389    ALCHRC9     390 - 390
      ALTIME10    391 - 392    ALUNIT10    393 - 393
      ALDURA10    394 - 395    ALDURB10    396 - 396
      ALCHRC10    397 - 397    ALTIME11    398 - 399
      ALUNIT11    400 - 400    ALDURA11    401 - 402
      ALDURB11    403 - 403    ALCHRC11    404 - 404
      ALTIME12    405 - 406    ALUNIT12    407 - 407
      ALDURA12    408 - 409    ALDURB12    410 - 410
      ALCHRC12    411 - 411    ALTIME13    412 - 413
      ALUNIT13    414 - 414    ALDURA13    415 - 416
      ALDURB13    417 - 417    ALCHRC13    418 - 418
      ATIME14A    419 - 420    AUNIT14A    421 - 421
      ADURA14A    422 - 423    ADURB14A    424 - 424
      ACHRC14A    425 - 425    ALTIME15    426 - 427
      ALUNIT15    428 - 428    ALDURA15    429 - 430
      ALDURB15    431 - 431    ALCHRC15    432 - 432
      ALTIME16    433 - 434    ALUNIT16    435 - 435
      ALDURA16    436 - 437    ALDURB16    438 - 438
      ALCHRC16    439 - 439    ALTIME17    440 - 441
      ALUNIT17    442 - 442    ALDURA17    443 - 444
      ALDURB17    445 - 445    ALCHRC17    446 - 446
      ALTIME18    447 - 448    ALUNIT18    449 - 449
      ALDURA18    450 - 451    ALDURB18    452 - 452
      ALCHRC18    453 - 453    ALTIME19    454 - 455
      ALUNIT19    456 - 456    ALDURA19    457 - 458
      ALDURB19    459 - 459    ALCHRC19    460 - 460
      ALTIME20    461 - 462    ALUNIT20    463 - 463
      ALDURA20    464 - 465    ALDURB20    466 - 466
      ALCHRC20    467 - 467    ALTIME21    468 - 469
      ALUNIT21    470 - 470    ALDURA21    471 - 472
      ALDURB21    473 - 473    ALCHRC21    474 - 474
      ALTIME22    475 - 476    ALUNIT22    477 - 477
      ALDURA22    478 - 479    ALDURB22    480 - 480
      ALCHRC22    481 - 481    ALTIME23    482 - 483
      ALUNIT23    484 - 484    ALDURA23    485 - 486
      ALDURB23    487 - 487    ALCHRC23    488 - 488
      ALTIME24    489 - 490    ALUNIT24    491 - 491
      ALDURA24    492 - 493    ALDURB24    494 - 494
      ALCHRC24    495 - 495    ALTIME25    496 - 497
      ALUNIT25    498 - 498    ALDURA25    499 - 500
      ALDURB25    501 - 501    ALCHRC25    502 - 502
      ALTIME26    503 - 504    ALUNIT26    505 - 505
      ALDURA26    506 - 507    ALDURB26    508 - 508
      ALCHRC26    509 - 509    ALTIME27    510 - 511
      ALUNIT27    512 - 512    ALDURA27    513 - 514
      ALDURB27    515 - 515    ALCHRC27    516 - 516
      ALTIME28    517 - 518    ALUNIT28    519 - 519
      ALDURA28    520 - 521    ALDURB28    522 - 522
      ALCHRC28    523 - 523    ALTIME29    524 - 525
      ALUNIT29    526 - 526    ALDURA29    527 - 528
      ALDURB29    529 - 529    ALCHRC29    530 - 530
      ALTIME30    531 - 532    ALUNIT30    533 - 533
      ALDURA30    534 - 535    ALDURB30    536 - 536
      ALCHRC30    537 - 537    ALTIME31    538 - 539
      ALUNIT31    540 - 540    ALDURA31    541 - 542
      ALDURB31    543 - 543    ALCHRC31    544 - 544
      ALTIME32    545 - 546    ALUNIT32    547 - 547
      ALDURA32    548 - 549    ALDURB32    550 - 550
      ALCHRC32    551 - 551    ALTIME33    552 - 553
      ALUNIT33    554 - 554    ALDURA33    555 - 556
      ALDURB33    557 - 557    ALCHRC33    558 - 558
      ALTIME34    559 - 560    ALUNIT34    561 - 561
      ALDURA34    562 - 563    ALDURB34    564 - 564
      ALCHRC34    565 - 565    ALTIME90    566 - 567
      ALUNIT90    568 - 568    ALDURA90    569 - 570
      ALDURB90    571 - 571    ALCHRC90    572 - 572
      ALTIME91    573 - 574    ALUNIT91    575 - 575
      ALDURA91    576 - 577    ALDURB91    578 - 578
      ALCHRC91    579 - 579    ALCNDRT     580 - 580
      ALCHRONR    581 - 581

      /* AHB LOCATIONS */

      SMKEV       582 - 582    SMKREG      583 - 584
      SMKNOW      585 - 585    SMKSTAT2    586 - 586
      SMKQTNO     587 - 588    SMKQTTP     589 - 589
      SMKQTY      590 - 591    CIGSDA1     592 - 593
      CIGDAMO     594 - 595    CIGSDA2     596 - 597
      CIGSDAY     598 - 599    CIGQTYR     600 - 600
      VIGNO       601 - 603    VIGTP       604 - 604
      VIGFREQW    605 - 606    VIGLNGNO    607 - 609
      VIGLNGTP    610 - 610    VIGMIN      611 - 613
      MODNO       614 - 616    MODTP       617 - 617
      MODFREQW    618 - 619    MODLNGNO    620 - 622
      MODLNGTP    623 - 623    MODMIN      624 - 626
      STRNGNO     627 - 629    STRNGTP     630 - 630
      STRFREQW    631 - 632    DISHFAC     633 - 633
      DISHFL02    634 - 634    DISHFL03    635 - 635
      DISHFL04    636 - 636    DISHFL05    637 - 637
      DISHFL06    638 - 638    DISHFL07    639 - 639
      ALC1YR      640 - 640    ALCLIFE     641 - 641
      ALC12MNO    642 - 644    ALC12MTP    645 - 645
      ALC12MWK    646 - 647    ALC12MYR    648 - 650
      ALCAMT      651 - 652    ALCSTAT     653 - 654
      ALC5UPNO    655 - 657    ALC5UPTP    658 - 658
      ALC5UPYR    659 - 661    AHEIGHT     662 - 663
      AWEIGHTP    664 - 666    BMI         667 - 670 .2
      SLEEP       671 - 672

      /* AAU LOCATIONS */

      AUSUALPL    673 - 673    APLKIND     674 - 674
      AHCPLROU    675 - 675    AHCPLKND    676 - 676
      AHCCHGYR    677 - 677    AHCCHGHI    678 - 678
      ANOUSPL1    679 - 679    ANOUSPL2    680 - 680
      ANOUSPL3    681 - 681    ANOUSPL4    682 - 682
      ANOUSPL5    683 - 683    ANOUSPL6    684 - 684
      ANOUSPL7    685 - 685    ANOUSPL8    686 - 686
      ANOUSPL9    687 - 687    APRVTRYR    688 - 688
      APRVTRFD    689 - 689    ADRNANP     690 - 690
      ADRNAI      691 - 691    AHCDLYR1    692 - 692
      AHCDLYR2    693 - 693    AHCDLYR3    694 - 694
      AHCDLYR4    695 - 695    AHCDLYR5    696 - 696
      AHCAFYR1    697 - 697    AHCAFYR2    698 - 698
      AHCAFYR3    699 - 699    AHCAFYR4    700 - 700
      AHCAFYR5    701 - 701    AHCAFYR6    702 - 702
      AWORPAY     703 - 703    AHICOMP     704 - 704
      ARXPR_1     705 - 705    ARXPR_2     706 - 706
      ARXPR_3     707 - 707    ARXPR_4     708 - 708
      ARXPR_5     709 - 709    ARXPR_6     710 - 710
      ADNLONG2    711 - 711    AHCSYR1     712 - 712
      AHCSYR2     713 - 713    AHCSYR3     714 - 714
      AHCSYR4     715 - 715    AHCSYR5     716 - 716
      AHCSYR6     717 - 717    AHCSYR7     718 - 718
      AHCSYR8     719 - 719    AHCSYR9     720 - 720
      AHCSYR10    721 - 721    AHERNOY2    722 - 723
      AERVISND    724 - 724    AERHOS      725 - 725
      AERREAS1    726 - 726    AERREAS2    727 - 727
      AERREAS3    728 - 728    AERREAS4    729 - 729
      AERREAS5    730 - 730    AERREAS6    731 - 731
      AERREAS7    732 - 732    AERREAS8    733 - 733
      AHCHYR      734 - 734    AHCHMOYR    735 - 736
      AHCHNOY2    737 - 738    AHCNOYR2    739 - 740
      ASRGYR      741 - 741    ASRGNOYR    742 - 743
      AMDLONGR    744 - 744    AVISLAST    745 - 745
      ALASTTYP    746 - 746    AVISAPTN    747 - 748
      AVISAPTT    749 - 749    AWAITRMN    750 - 751
      AWAITRMT    752 - 752    HIT1A       753 - 753
      HIT2A       754 - 754    HIT3A       755 - 755
      HIT4A       756 - 756    HIT5A       757 - 757
      SHTFLU2     758 - 758    ASHFLUM2    759 - 760
      ASHFLUY2    761 - 764    SPRFLU2     765 - 765
      ASPFLUM2    766 - 767    ASPFLUY2    768 - 771
      SHTPNUYR    772 - 772    APOX        773 - 773
      APOX12MO    774 - 774    AHEP        775 - 775
      AHEPLIV     776 - 776    SHTHEPB     777 - 777
      SHEPDOS     778 - 778    SHTHEPA     779 - 779
      SHEPANUM    780 - 781    SHINGLES    782 - 782
      SHTTD       783 - 783    SHTTD05     784 - 784
      SHTTDAP     785 - 785    HPVHRD      786 - 786
      SHHPVHD1    787 - 787    SHTHPV1     788 - 788
      SHHPVDOS    789 - 790    LIVEV       791 - 791
      TRAVEL      792 - 792    WRKHLTH     793 - 793
      WRKDIR      794 - 794    APSBPCHK    795 - 795
      APSCHCHK    796 - 796    APSBSCHK    797 - 797
      APSPAP      798 - 798    APSMAM      799 - 799
      APSCOL      800 - 800    APSDIET     801 - 801
      APSSMKC     802 - 802    LTCFAM      803 - 803
      LTCHELP     804 - 804    LTCWHO1     805 - 805
      LTCWHO2     806 - 806    LTCWHO3     807 - 807
      LTCWHO4     808 - 808    LTCWHO5     809 - 809
      LTCPRCH     810 - 810    LTCPAY      811 - 812
      LTC100M     813 - 813    AINDINS     814 - 814
      AINDPRCH    815 - 815    AINDWHO     816 - 816
      AINDDIF1    817 - 817    AINDDIF2    818 - 818
      AINDENY1    819 - 819    AINDENY2    820 - 820
      AINDENY3    821 - 821    AINDNOT1    822 - 822
      AINDNOT2    823 - 823    AINDNOT3    824 - 824
      AINDNOT4    825 - 825    AINDNOT5    826 - 826
      HIVTST1     827 - 827;

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
      STRAT_P    ="Pseudo-stratum for public use file variance estimation"
      PSU_P      ="Pseudo-PSU for public use file variance estimation"

      /* HHC LABELS */

      SEX        ="Sex"
      HISPAN_I   ="Hispanic subgroup detail"
      RACERPI2   ="OMB groups w/multiple race"
      MRACRPI2   ="Race coded to single/multiple race group"
      MRACBPI2   ="Race coded to single/multiple race group"
      AGE_P      ="Age"

      /* FID LABELS */

      R_MARITL   ="Marital Status"

      /* AID LABELS */

      PROXYSA    ="Sample adult status"
      PROX1      ="Knowledgeable proxy for Sample Adult available"
      PROX2      ="Relationship of SA proxy to SA"
      LATEINTA   ="Late Sample Adult interviews"

      /* FDB LABELS */

      FDRN_FLG   ="Disability Questions Test flag"

      /* ASD LABELS */

      DOINGLWA   ="Corrected employment status last week"
      WHYNOWKA   ="Main reason for not working last week"
      EVERWRK    ="Ever worked"
      INDSTRN1   =
"Detailed industry classification (based on 2007 NAICS codes from Census)"
      INDSTRN2   =
"Simple industry classification (based on 2007 NAICS Codes from Census)"
      OCCUPN1    =
"Detailed occupation classification (based on 2010 SOC codes from Census)"
      OCCUPN2    =
"Simple occupation classification (based on 2010 SOC codes from Census)"
      WRKCATA    ="Class of worker"
      BUSINC1A   ="Current job an incorporated business"
      LOCALL1A   ="Number of employees at work"
      YRSWRKPA   ="Number of years on the job"
      WRKLONGH   ="Current/most recent job also longest held job"
      HOURPDA    ="Paid by the hour at current/most recent job"
      PDSICKA    ="Paid sick leave at current/most recent job"
      ONEJOB     ="Have more than one job"
      WRKLYR4    ="Work status: last week, past 12 months"

      /* ACN LABELS */

      HYPEV      ="Ever been told you have hypertension"
      HYPDIFV    ="Ever had hypertension on 2+ visits"
      CHDEV      ="Ever been told you had coronary heart disease"
      ANGEV      ="Ever been told you had angina pectoris"
      MIEV       ="Ever been told you had a heart attack"
      HRTEV      ="Ever been told you had a heart condition/disease"
      STREV      ="Ever been told you had a stroke"
      EPHEV      ="Ever been told you had emphysema"
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
      DIBEV      ="Ever been told that you have diabetes"
      DIBPRE1    ="Ever had prediabetes or other symptoms"
      DIBAGE     ="Age first diagnosed w/diabetes"
      DIFAGE2    ="Years since first diagnosed w/diabetes"
      INSLN      ="NOW taking insulin"
      DIBPILL    ="NOW taking diabetic pills"
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
      HRAIDNOW   ="Now use a hearing aid"
      HRAIDEV    ="Ever used a hearing aid if not now using"
      AHEARST1   ="Hearing w/o hearing aid"
      AVISION    ="Trouble seeing even w/glasses/lenses"
      ABLIND     ="Blind or unable to see at all"
      LUPPRT     ="Lost all upper & lower natural teeth"
      SAD        ="So sad nothing cheers you up, past 30 days"
      NERVOUS    ="How often felt nervous, past 30 days"
      RESTLESS   ="How often restless/fidgety, past 30 days"
      HOPELESS   ="How often felt hopeless, past 30 days"
      EFFORT     ="How often felt everything was an effort, past 30 days"
      WORTHLS    ="How often felt worthless, past 30 days"
      MHAMTMO    ="Feelings interfered w/life, past 30 days"

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
"Lung/breathing problem (e.g., asthma and emphysema)  causes difficulty with act
ivity"
      AFLHCA12   ="Cancer causes difficulty with activity"
      AFLHCA13   ="Birth defect causes difficulty with activity"
      ALHCA14A   =
"Intellectual disability, also known as mental retardation causes difficulty wit
h activity"
      AFLHCA15   =
"Other developmental problem (e.g., cerebral palsy) causes difficulty with activ
ity"
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
"Duration (in years) of lung/breathing problem (e.g., asthma and emphysema), rec
ode 1"
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
"Duration of intellectual disability, also known as mental retardation: Number o
f units"
      AUNIT14A   =
"Duration of intellectual disability, also know as mental retardation: Time unit
"
      ADURA14A   =
"Duration (in years) of intellectual disability, also known as mental retardatio
n, recode 1"
      ADURB14A   =
"Duration of intellectual disability, also known as mental retardation, recode 2
"
      ACHRC14A   =
"Intellectual disability, also known as mental retardation condition status reco
de"
      ALTIME15   =
"Duration of other developmental problem (e.g., cerebral palsy): Number of units
"
      ALUNIT15   =
"Duration of other developmental problem (e.g., cerebral palsy): Time unit"
      ALDURA15   =
"Duration (in years) of other developmental problem (e.g., cerebral palsy), reco
de 1"
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
"Duration of missing limbs (fingers, toes, or digits); amputation: Number of uni
ts"
      ALUNIT19   =
"Duration of missing limbs (fingers, toes, or digits); amputation: Time unit"
      ALDURA19   =
"Duration (in years) of missing limbs (fingers, toes, or digits); amputation, re
code 1"
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
"Duration (in years) of surgical after-effects/medical treatment problems, recod
e 1"
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
      SMKNOW     ="Smoke freq: everyday/some days/not at all"
      SMKSTAT2   ="Smoking Status: Recode"
      SMKQTNO    ="Time since quit: # of units"
      SMKQTTP    ="Time since quit: time period"
      SMKQTY     ="Time since quit smoking (in years)"
      CIGSDA1    ="Number cigs per day (daily smokers)"
      CIGDAMO    ="Number days smoked in past 30 days"
      CIGSDA2    ="Number cigs per day (some day smokers)"
      CIGSDAY    ="Number of cigarettes a day (all current smokers)"
      CIGQTYR    ="Tried quit smoking 1+ days, past 12 m"
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
      DISHFAC    ="Access to hlth club/fitness facility"
      DISHFL02   ="Cost too high"
      DISHFL03   ="Lack of staff who understand needs"
      DISHFL04   ="Lack of exercise equip that meets needs"
      DISHFL05   ="Access into/within the building"
      DISHFL06   ="Inadequate transportation"
      DISHFL07   ="Some other barrier"
      ALC1YR     ="Ever had 12+ drinks in any  one year"
      ALCLIFE    ="Had 12+ drinks in ENTIRE LIFE"
      ALC12MNO   ="Freq drank alcohol pst yr:  # of units"
      ALC12MTP   ="Freq drank alcohol pst yr:  Time unit"
      ALC12MWK   ="Freq drank alcohol: Days per week"
      ALC12MYR   ="Freq drank alcohol: Days in past year"
      ALCAMT     ="Average # drinks on days drank"
      ALCSTAT    ="Alcohol drinking status: Recode"
      ALC5UPNO   ="Days 5+ drinks, past yr: # days"
      ALC5UPTP   ="Days 5+ drinks, past yr: Time unit"
      ALC5UPYR   ="Number of days had 5+ drinks past year"
      AHEIGHT    ="Total height in inches"
      AWEIGHTP   ="Weight without shoes (pounds)"
      BMI        ="Body Mass Index (BMI)"
      SLEEP      ="Hours of sleep"

      /* AAU LABELS */

      AUSUALPL   ="Place USUALLY go when sick"
      APLKIND    ="Place to go when sick (most often)"
      AHCPLROU   ="USUALLY go there for routine/preventive care"
      AHCPLKND   ="Place USUALLY go for routine/preventive care"
      AHCCHGYR   ="Change health care place, past 12 m"
      AHCCHGHI   ="Change related to health insurance"
      ANOUSPL1   ="Doesn't need doctor/haven't had problems"
      ANOUSPL2   ="Doesn't like/trust/believe in doctors"
      ANOUSPL3   ="Doesn't know where to go"
      ANOUSPL4   ="Previous doctor is not available/moved"
      ANOUSPL5   ="Too expensive/no insurance/cost"
      ANOUSPL6   ="Speak a different language"
      ANOUSPL7   ="No care available/too far away/not convenient"
      ANOUSPL8   ="Put if off/didn't get around to it"
      ANOUSPL9   ="Other reason no usual place of care"
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
      AHCAFYR5   ="Couldn't afford a specialist, past 12 m"
      AHCAFYR6   ="Couldn't afford follow-up care, past 12 m"
      AWORPAY    ="Get sick or have accident, worried about paying medical bills
"
      AHICOMP    ="Health insurance coverage compared to a year ago"
      ARXPR_1    ="Skipped medication doses to save money, past 12 m"
      ARXPR_2    ="Took less medicine to save money, past 12 m"
      ARXPR_3    ="Delayed filling a prescription to save money, past 12 m"
      ARXPR_4    =
"Asked doctor for lower cost medication to save money, past 12 m"
      ARXPR_5    =
"Bought prescription drugs from another country to save money, past 12 m"
      ARXPR_6    ="Used alternative therapies to save money, past 12 m"
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
      AERREAS1   ="Didn't have another place to go"
      AERREAS2   ="Doctor's office or clinic not open"
      AERREAS3   ="Advised by health provider to go to ER"
      AERREAS4   ="Problem too serious for doctor's office/clinic"
      AERREAS5   ="Only hospital could help"
      AERREAS6   ="ER is closest provider"
      AERREAS7   ="ER is usual place to get care"
      AERREAS8   ="Arrived at ER by ambulance/other emergency vehicle"
      AHCHYR     ="Received home care from health professional, past 12 m"
      AHCHMOYR   ="# months of home care, past 12 m"
      AHCHNOY2   ="Total number of home visits"
      AHCNOYR2   ="Total number of office visits, past 12 m"
      ASRGYR     ="Surgery/surgical procedure, past 12 m"
      ASRGNOYR   ="# of surgeries, past 12 m"
      AMDLONGR   ="Time since last seen/talked to health professional"
      AVISLAST   ="Place of last medical visit"
      ALASTTYP   ="Doctor/specialist/someone else seen on last visit"
      AVISAPTN   ="Appointment wait time-number"
      AVISAPTT   ="Appointment wait time-time period"
      AWAITRMN   ="Time in waiting room-number"
      AWAITRMT   ="Time in waiting room-time period"
      HIT1A      ="Looked up health information on Internet, past 12 m"
      HIT2A      ="Filled a prescription on Internet, past 12 m"
      HIT3A      ="Scheduled medical appointment on Internet, past 12 m"
      HIT4A      ="Communicated with health care provider by email, past 12 m"
      HIT5A      ="Used chat groups to learn about health topics, past 12 m"
      SHTFLU2    ="Flu shot past 12 m"
      ASHFLUM2   ="Month of most recent flu shot"
      ASHFLUY2   ="Year of most recent flu shot"
      SPRFLU2    ="Flu nasal spray past 12 m"
      ASPFLUM2   ="Month of most recent flu nasal spray"
      ASPFLUY2   ="Year of most recent flu nasal spray"
      SHTPNUYR   ="Pneumonia shot (EVER)"
      APOX       ="Ever had chickenpox"
      APOX12MO   ="Chickenpox, past 12 m"
      AHEP       ="Ever had hepatitis"
      AHEPLIV    ="Ever lived w/ someone w/ hepatitis"
      SHTHEPB    ="Hepatitis B vaccine (EVER)"
      SHEPDOS    ="# doses of hepatitis B vaccine received"
      SHTHEPA    ="Hepatitis A vaccine (EVER)"
      SHEPANUM   ="# shots of hepatitis A vaccine received"
      SHINGLES   ="Ever had the Zoster or Shingles vaccine"
      SHTTD      ="Tetanus shot in the past 10 years"
      SHTTD05    ="Tetanus shot given in 2005 or later"
      SHTTDAP    ="Vaccine included pertussis/whooping cough"
      HPVHRD     ="Ever heard of HPV"
      SHHPVHD1   ="Ever heard of HPV vaccines or shots"
      SHTHPV1    ="Ever received HPV shot/vaccine"
      SHHPVDOS   ="Number of HPV shots received"
      LIVEV      =
"Ever told you had any kind of chronic/long-term liver condition"
      TRAVEL     =
"Ever traveled outside USA since 1995 (Excluding Europe, Japan, Australia, New Z
ealand, and Canada)"
      WRKHLTH    ="Work or volunteer in a health care setting"
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
      LTCFAM     ="Have family member who needed ADL help for 1+ yrs"
      LTCHELP    ="How likely you will need ADL help"
      LTCWHO1    ="Family would provide ADL help"
      LTCWHO2    ="Hire someone to provide ADL help"
      LTCWHO3    ="Home health care organization would provide ADL help"
      LTCWHO4    ="Nursing home/assisted living would provide ADL help"
      LTCWHO5    ="Other would provide ADL help"
      LTCPRCH    ="Interested in purchasing government insurance for ADL help"
      LTCPAY     ="Amount willing to pay for government insurance for ADL help"
      LTC100M    ="Willing to pay $100 mo for government insurance for ADL help"
      AINDINS    ="Tried to purchase health insurance directly, past 3 yrs"
      AINDPRCH   ="Purchased health insurance directly, past 3 yrs"
      AINDWHO    ="For whom was health insurance purchased, past 3 yrs"
      AINDDIF1   ="How difficult to find health insurance for coverage needed"
      AINDDIF2   ="How difficult to find affordable health insurance"
      AINDENY1   ="Turned down for coverage"
      AINDENY2   ="Charged higher price for coverage because of health"
      AINDENY3   ="Specific health problem excluded from coverage"
      AINDNOT1   ="Didn’t buy plan because turned down"
      AINDNOT2   ="Didn’t buy plan because of cost"
      AINDNOT3   ="Didn’t buy plan because of pre-existing condition"
      AINDNOT4   =
"Didn’t buy plan because got health insurance from other source"
      AINDNOT5   ="Other reason didn't buy plan"
      HIVTST1    ="Ever been tested for HIV"
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

      R_MARITL  SAP019X.

      /* AID FORMAT ASSOCIATIONS */

      PROXYSA   SAP020X.   PROX1     SAP021X.   PROX2     SAP022X.
      LATEINTA  SAP023X.

      /* FDB FORMAT ASSOCIATIONS */

      FDRN_FLG  SAP024X.

      /* ASD FORMAT ASSOCIATIONS */

      DOINGLWA  SAP025X.   WHYNOWKA  SAP026X.   EVERWRK   SAP027X.
      INDSTRN1  SAP028X.   INDSTRN2  SAP028X.   OCCUPN1   SAP030X.
      OCCUPN2   SAP030X.   WRKCATA   SAP032X.   BUSINC1A  SAP027X.
      LOCALL1A  SAP034X.   YRSWRKPA  SAP035X.   WRKLONGH  SAP027X.
      HOURPDA   SAP027X.   PDSICKA   SAP027X.   ONEJOB    SAP027X.
      WRKLYR4   SAP040X.

      /* ACN FORMAT ASSOCIATIONS */

      HYPEV     SAP027X.   HYPDIFV   SAP027X.   CHDEV     SAP027X.
      ANGEV     SAP027X.   MIEV      SAP027X.   HRTEV     SAP027X.
      STREV     SAP027X.   EPHEV     SAP027X.   AASMEV    SAP027X.
      AASSTILL  SAP027X.   AASMYR    SAP027X.   AASERYR1  SAP027X.
      ULCEV     SAP027X.   ULCYR     SAP027X.   CANEV     SAP027X.
      CNKIND1   SAP056X.   CNKIND2   SAP056X.   CNKIND3   SAP056X.
      CNKIND4   SAP056X.   CNKIND5   SAP056X.   CNKIND6   SAP056X.
      CNKIND7   SAP056X.   CNKIND8   SAP056X.   CNKIND9   SAP056X.
      CNKIND10  SAP056X.   CNKIND11  SAP056X.   CNKIND12  SAP056X.
      CNKIND13  SAP056X.   CNKIND14  SAP056X.   CNKIND15  SAP056X.
      CNKIND16  SAP056X.   CNKIND17  SAP056X.   CNKIND18  SAP056X.
      CNKIND19  SAP056X.   CNKIND20  SAP056X.   CNKIND21  SAP056X.
      CNKIND22  SAP056X.   CNKIND23  SAP056X.   CNKIND24  SAP056X.
      CNKIND25  SAP056X.   CNKIND26  SAP056X.   CNKIND27  SAP056X.
      CNKIND28  SAP056X.   CNKIND29  SAP056X.   CNKIND30  SAP056X.
      CNKIND31  SAP056X.   CANAGE1   SAP087X.   CANAGE2   SAP087X.
      CANAGE3   SAP087X.   CANAGE4   SAP087X.   CANAGE5   SAP087X.
      CANAGE6   SAP087X.   CANAGE7   SAP087X.   CANAGE8   SAP087X.
      CANAGE9   SAP087X.   CANAGE10  SAP087X.   CANAGE11  SAP087X.
      CANAGE12  SAP087X.   CANAGE13  SAP087X.   CANAGE14  SAP087X.
      CANAGE15  SAP087X.   CANAGE16  SAP087X.   CANAGE17  SAP087X.
      CANAGE18  SAP087X.   CANAGE19  SAP087X.   CANAGE20  SAP087X.
      CANAGE21  SAP087X.   CANAGE22  SAP087X.   CANAGE23  SAP087X.
      CANAGE24  SAP087X.   CANAGE25  SAP087X.   CANAGE26  SAP087X.
      CANAGE27  SAP087X.   CANAGE28  SAP087X.   CANAGE29  SAP087X.
      CANAGE30  SAP087X.   DIBEV     SAP117X.   DIBPRE1   SAP027X.
      DIBAGE    SAP087X.   DIFAGE2   SAP120X.   INSLN     SAP027X.
      DIBPILL   SAP027X.   AHAYFYR   SAP027X.   SINYR     SAP027X.
      CBRCHYR   SAP027X.   KIDWKYR   SAP027X.   LIVYR     SAP027X.
      JNTSYMP   SAP027X.   JMTHP1    SAP056X.   JMTHP2    SAP056X.
      JMTHP3    SAP056X.   JMTHP4    SAP056X.   JMTHP5    SAP056X.
      JMTHP6    SAP056X.   JMTHP7    SAP056X.   JMTHP8    SAP056X.
      JMTHP9    SAP056X.   JMTHP10   SAP056X.   JMTHP11   SAP056X.
      JMTHP12   SAP056X.   JMTHP13   SAP056X.   JMTHP14   SAP056X.
      JMTHP15   SAP056X.   JMTHP16   SAP056X.   JMTHP17   SAP056X.
      JNTCHR    SAP027X.   JNTHP     SAP027X.   ARTH1     SAP027X.
      ARTHLMT   SAP027X.   PAINECK   SAP027X.   PAINLB    SAP027X.
      PAINLEG   SAP027X.   PAINFACE  SAP027X.   AMIGR     SAP027X.
      ACOLD2W   SAP027X.   AINTIL2W  SAP027X.   PREGNOW   SAP027X.
      HRAIDNOW  SAP027X.   HRAIDEV   SAP027X.   AHEARST1  SAP160X.
      AVISION   SAP027X.   ABLIND    SAP027X.   LUPPRT    SAP027X.
      SAD       SAP164X.   NERVOUS   SAP164X.   RESTLESS  SAP164X.
      HOPELESS  SAP164X.   EFFORT    SAP164X.   WORTHLS   SAP164X.
      MHAMTMO   SAP170X.

      /* AHS FORMAT ASSOCIATIONS */

      WKDAYR    SAP171X.   BEDDAYR   SAP171X.   AHSTATYR  SAP173X.
      SPECEQ    SAP027X.   FLWALK    SAP175X.   FLCLIMB   SAP175X.
      FLSTAND   SAP175X.   FLSIT     SAP175X.   FLSTOOP   SAP175X.
      FLREACH   SAP175X.   FLGRASP   SAP175X.   FLCARRY   SAP175X.
      FLPUSH    SAP175X.   FLSHOP    SAP175X.   FLSOCL    SAP175X.
      FLRELAX   SAP175X.   FLA1AR    SAP187X.   AFLHCA1   SAP056X.
      AFLHCA2   SAP056X.   AFLHCA3   SAP056X.   AFLHCA4   SAP056X.
      AFLHCA5   SAP056X.   AFLHCA6   SAP056X.   AFLHCA7   SAP056X.
      AFLHCA8   SAP056X.   AFLHCA9   SAP056X.   AFLHCA10  SAP056X.
      AFLHCA11  SAP056X.   AFLHCA12  SAP056X.   AFLHCA13  SAP056X.
      ALHCA14A  SAP056X.   AFLHCA15  SAP056X.   AFLHCA16  SAP056X.
      AFLHCA17  SAP056X.   AFLHCA18  SAP056X.   AFLHC19_  SAP056X.
      AFLHC20_  SAP056X.   AFLHC21_  SAP056X.   AFLHC22_  SAP056X.
      AFLHC23_  SAP056X.   AFLHC24_  SAP056X.   AFLHC25_  SAP056X.
      AFLHC26_  SAP056X.   AFLHC27_  SAP056X.   AFLHC28_  SAP056X.
      AFLHC29_  SAP056X.   AFLHC30_  SAP056X.   AFLHC31_  SAP056X.
      AFLHC32_  SAP056X.   AFLHC33_  SAP056X.   AFLHC34_  SAP056X.
      AFLHCA90  SAP056X.   AFLHCA91  SAP056X.   ALTIME1   SAP224X.
      ALUNIT1   SAP225X.   ALDURA1   SAP226X.   ALDURB1   SAP227X.
      ALCHRC1   SAP228X.   ALTIME2   SAP224X.   ALUNIT2   SAP225X.
      ALDURA2   SAP226X.   ALDURB2   SAP227X.   ALCHRC2   SAP228X.
      ALTIME3   SAP224X.   ALUNIT3   SAP225X.   ALDURA3   SAP226X.
      ALDURB3   SAP227X.   ALCHRC3   SAP228X.   ALTIME4   SAP224X.
      ALUNIT4   SAP225X.   ALDURA4   SAP226X.   ALDURB4   SAP227X.
      ALCHRC4   SAP228X.   ALTIME5   SAP224X.   ALUNIT5   SAP225X.
      ALDURA5   SAP226X.   ALDURB5   SAP227X.   ALCHRC5   SAP228X.
      ALTIME6   SAP224X.   ALUNIT6   SAP225X.   ALDURA6   SAP226X.
      ALDURB6   SAP227X.   ALCHRC6   SAP228X.   ALTIME7   SAP224X.
      ALUNIT7   SAP225X.   ALDURA7   SAP226X.   ALDURB7   SAP227X.
      ALCHRC7   SAP228X.   ALTIME8   SAP224X.   ALUNIT8   SAP225X.
      ALDURA8   SAP226X.   ALDURB8   SAP227X.   ALCHRC8   SAP228X.
      ALTIME9   SAP224X.   ALUNIT9   SAP225X.   ALDURA9   SAP226X.
      ALDURB9   SAP227X.   ALCHRC9   SAP228X.   ALTIME10  SAP224X.
      ALUNIT10  SAP225X.   ALDURA10  SAP226X.   ALDURB10  SAP227X.
      ALCHRC10  SAP228X.   ALTIME11  SAP224X.   ALUNIT11  SAP225X.
      ALDURA11  SAP226X.   ALDURB11  SAP227X.   ALCHRC11  SAP228X.
      ALTIME12  SAP224X.   ALUNIT12  SAP225X.   ALDURA12  SAP226X.
      ALDURB12  SAP227X.   ALCHRC12  SAP228X.   ALTIME13  SAP224X.
      ALUNIT13  SAP225X.   ALDURA13  SAP226X.   ALDURB13  SAP227X.
      ALCHRC13  SAP228X.   ATIME14A  SAP224X.   AUNIT14A  SAP225X.
      ADURA14A  SAP226X.   ADURB14A  SAP227X.   ACHRC14A  SAP228X.
      ALTIME15  SAP224X.   ALUNIT15  SAP225X.   ALDURA15  SAP226X.
      ALDURB15  SAP227X.   ALCHRC15  SAP228X.   ALTIME16  SAP224X.
      ALUNIT16  SAP225X.   ALDURA16  SAP226X.   ALDURB16  SAP227X.
      ALCHRC16  SAP228X.   ALTIME17  SAP224X.   ALUNIT17  SAP225X.
      ALDURA17  SAP226X.   ALDURB17  SAP227X.   ALCHRC17  SAP228X.
      ALTIME18  SAP224X.   ALUNIT18  SAP225X.   ALDURA18  SAP226X.
      ALDURB18  SAP227X.   ALCHRC18  SAP228X.   ALTIME19  SAP224X.
      ALUNIT19  SAP225X.   ALDURA19  SAP226X.   ALDURB19  SAP227X.
      ALCHRC19  SAP228X.   ALTIME20  SAP224X.   ALUNIT20  SAP225X.
      ALDURA20  SAP226X.   ALDURB20  SAP227X.   ALCHRC20  SAP228X.
      ALTIME21  SAP224X.   ALUNIT21  SAP225X.   ALDURA21  SAP226X.
      ALDURB21  SAP227X.   ALCHRC21  SAP228X.   ALTIME22  SAP224X.
      ALUNIT22  SAP225X.   ALDURA22  SAP226X.   ALDURB22  SAP227X.
      ALCHRC22  SAP228X.   ALTIME23  SAP224X.   ALUNIT23  SAP225X.
      ALDURA23  SAP226X.   ALDURB23  SAP227X.   ALCHRC23  SAP228X.
      ALTIME24  SAP224X.   ALUNIT24  SAP225X.   ALDURA24  SAP226X.
      ALDURB24  SAP227X.   ALCHRC24  SAP228X.   ALTIME25  SAP224X.
      ALUNIT25  SAP225X.   ALDURA25  SAP226X.   ALDURB25  SAP227X.
      ALCHRC25  SAP228X.   ALTIME26  SAP224X.   ALUNIT26  SAP225X.
      ALDURA26  SAP226X.   ALDURB26  SAP227X.   ALCHRC26  SAP228X.
      ALTIME27  SAP224X.   ALUNIT27  SAP225X.   ALDURA27  SAP226X.
      ALDURB27  SAP227X.   ALCHRC27  SAP228X.   ALTIME28  SAP224X.
      ALUNIT28  SAP225X.   ALDURA28  SAP226X.   ALDURB28  SAP227X.
      ALCHRC28  SAP228X.   ALTIME29  SAP224X.   ALUNIT29  SAP225X.
      ALDURA29  SAP226X.   ALDURB29  SAP227X.   ALCHRC29  SAP228X.
      ALTIME30  SAP224X.   ALUNIT30  SAP225X.   ALDURA30  SAP226X.
      ALDURB30  SAP227X.   ALCHRC30  SAP228X.   ALTIME31  SAP224X.
      ALUNIT31  SAP225X.   ALDURA31  SAP226X.   ALDURB31  SAP227X.
      ALCHRC31  SAP228X.   ALTIME32  SAP224X.   ALUNIT32  SAP225X.
      ALDURA32  SAP226X.   ALDURB32  SAP227X.   ALCHRC32  SAP228X.
      ALTIME33  SAP224X.   ALUNIT33  SAP225X.   ALDURA33  SAP226X.
      ALDURB33  SAP227X.   ALCHRC33  SAP228X.   ALTIME34  SAP224X.
      ALUNIT34  SAP225X.   ALDURA34  SAP226X.   ALDURB34  SAP227X.
      ALCHRC34  SAP228X.   ALTIME90  SAP224X.   ALUNIT90  SAP225X.
      ALDURA90  SAP226X.   ALDURB90  SAP227X.   ALCHRC90  SAP228X.
      ALTIME91  SAP224X.   ALUNIT91  SAP225X.   ALDURA91  SAP226X.
      ALDURB91  SAP227X.   ALCHRC91  SAP228X.   ALCNDRT   SAP404X.
      ALCHRONR  SAP405X.

      /* AHB FORMAT ASSOCIATIONS */

      SMKEV     SAP027X.   SMKREG    SAP407X.   SMKNOW    SAP408X.
      SMKSTAT2  SAP409X.   SMKQTNO   SAP410X.   SMKQTTP   SAP411X.
      SMKQTY    SAP412X.   CIGSDA1   SAP413X.   CIGDAMO   SAP414X.
      CIGSDA2   SAP413X.   CIGSDAY   SAP413X.   CIGQTYR   SAP027X.
      VIGNO     SAP418X.   VIGTP     SAP419X.   VIGFREQW  SAP420X.
      VIGLNGNO  SAP421X.   VIGLNGTP  SAP422X.   VIGMIN    SAP421X.
      MODNO     SAP418X.   MODTP     SAP419X.   MODFREQW  SAP426X.
      MODLNGNO  SAP421X.   MODLNGTP  SAP422X.   MODMIN    SAP421X.
      STRNGNO   SAP418X.   STRNGTP   SAP419X.   STRFREQW  SAP432X.
      DISHFAC   SAP027X.   DISHFL02  SAP027X.   DISHFL03  SAP027X.
      DISHFL04  SAP027X.   DISHFL05  SAP027X.   DISHFL06  SAP027X.
      DISHFL07  SAP027X.   ALC1YR    SAP027X.   ALCLIFE   SAP027X.
      ALC12MNO  SAP442X.   ALC12MTP  SAP443X.   ALC12MWK  SAP444X.
      ALC12MYR  SAP445X.   ALCAMT    SAP446X.   ALCSTAT   SAP447X.
      ALC5UPNO  SAP445X.   ALC5UPTP  SAP449X.   ALC5UPYR  SAP445X.
      AHEIGHT   SAP451X.   AWEIGHTP  SAP452X.   BMI       SAP453X.
      SLEEP     SAP454X.

      /* AAU FORMAT ASSOCIATIONS */

      AUSUALPL  SAP455X.   APLKIND   SAP456X.   AHCPLROU  SAP027X.
      AHCPLKND  SAP458X.   AHCCHGYR  SAP027X.   AHCCHGHI  SAP027X.
      ANOUSPL1  SAP461X.   ANOUSPL2  SAP461X.   ANOUSPL3  SAP461X.
      ANOUSPL4  SAP461X.   ANOUSPL5  SAP461X.   ANOUSPL6  SAP461X.
      ANOUSPL7  SAP461X.   ANOUSPL8  SAP461X.   ANOUSPL9  SAP461X.
      APRVTRYR  SAP027X.   APRVTRFD  SAP471X.   ADRNANP   SAP471X.
      ADRNAI    SAP473X.   AHCDLYR1  SAP027X.   AHCDLYR2  SAP027X.
      AHCDLYR3  SAP027X.   AHCDLYR4  SAP027X.   AHCDLYR5  SAP027X.
      AHCAFYR1  SAP027X.   AHCAFYR2  SAP027X.   AHCAFYR3  SAP027X.
      AHCAFYR4  SAP027X.   AHCAFYR5  SAP471X.   AHCAFYR6  SAP471X.
      AWORPAY   SAP485X.   AHICOMP   SAP173X.   ARXPR_1   SAP027X.
      ARXPR_2   SAP471X.   ARXPR_3   SAP027X.   ARXPR_4   SAP027X.
      ARXPR_5   SAP027X.   ARXPR_6   SAP027X.   ADNLONG2  SAP493X.
      AHCSYR1   SAP027X.   AHCSYR2   SAP027X.   AHCSYR3   SAP027X.
      AHCSYR4   SAP027X.   AHCSYR5   SAP027X.   AHCSYR6   SAP027X.
      AHCSYR7   SAP027X.   AHCSYR8   SAP027X.   AHCSYR9   SAP027X.
      AHCSYR10  SAP027X.   AHERNOY2  SAP504X.   AERVISND  SAP027X.
      AERHOS    SAP027X.   AERREAS1  SAP027X.   AERREAS2  SAP027X.
      AERREAS3  SAP027X.   AERREAS4  SAP027X.   AERREAS5  SAP027X.
      AERREAS6  SAP027X.   AERREAS7  SAP471X.   AERREAS8  SAP471X.
      AHCHYR    SAP027X.   AHCHMOYR  SAP454X.   AHCHNOY2  SAP517X.
      AHCNOYR2  SAP504X.   ASRGYR    SAP027X.   ASRGNOYR  SAP520X.
      AMDLONGR  SAP493X.   AVISLAST  SAP522X.   ALASTTYP  SAP523X.
      AVISAPTN  SAP524X.   AVISAPTT  SAP525X.   AWAITRMN  SAP526X.
      AWAITRMT  SAP527X.   HIT1A     SAP471X.   HIT2A     SAP027X.
      HIT3A     SAP027X.   HIT4A     SAP471X.   HIT5A     SAP471X.
      SHTFLU2   SAP027X.   ASHFLUM2  SAP534X.   ASHFLUY2  SAP535X.
      SPRFLU2   SAP027X.   ASPFLUM2  SAP534X.   ASPFLUY2  SAP535X.
      SHTPNUYR  SAP027X.   APOX      SAP027X.   APOX12MO  SAP027X.
      AHEP      SAP027X.   AHEPLIV   SAP027X.   SHTHEPB   SAP027X.
      SHEPDOS   SAP545X.   SHTHEPA   SAP027X.   SHEPANUM  SAP547X.
      SHINGLES  SAP027X.   SHTTD     SAP027X.   SHTTD05   SAP027X.
      SHTTDAP   SAP551X.   HPVHRD    SAP027X.   SHHPVHD1  SAP027X.
      SHTHPV1   SAP554X.   SHHPVDOS  SAP555X.   LIVEV     SAP027X.
      TRAVEL    SAP027X.   WRKHLTH   SAP027X.   WRKDIR    SAP027X.
      APSBPCHK  SAP027X.   APSCHCHK  SAP027X.   APSBSCHK  SAP027X.
      APSPAP    SAP027X.   APSMAM    SAP027X.   APSCOL    SAP471X.
      APSDIET   SAP027X.   APSSMKC   SAP471X.   LTCFAM    SAP471X.
      LTCHELP   SAP569X.   LTCWHO1   SAP461X.   LTCWHO2   SAP461X.
      LTCWHO3   SAP461X.   LTCWHO4   SAP461X.   LTCWHO5   SAP461X.
      LTCPRCH   SAP471X.   LTCPAY    SAP576X.   LTC100M   SAP569X.
      AINDINS   SAP471X.   AINDPRCH  SAP471X.   AINDWHO   SAP580X.
      AINDDIF1  SAP581X.   AINDDIF2  SAP581X.   AINDENY1  SAP471X.
      AINDENY2  SAP471X.   AINDENY3  SAP471X.   AINDNOT1  SAP461X.
      AINDNOT2  SAP461X.   AINDNOT3  SAP461X.   AINDNOT4  SAP461X.
      AINDNOT5  SAP461X.   HIVTST1   SAP027X.;
RUN;

PROC CONTENTS DATA=NHIS.SAMADULT;
   TITLE1 'CONTENTS OF THE 2011 NHIS Sample Adult FILE';

PROC FREQ DATA=NHIS.SAMADULT NOTITLE;
   TABLES RECTYPE/LIST MISSING;
   TITLE1 'FREQUENCY REPORT FOR 2011 NHIS Sample Adult FILE';
   TITLE2 '(WEIGHTED)';
   WEIGHT WTFA_SA;

PROC FREQ DATA=NHIS.SAMADULT NOTITLE;
   TABLES RECTYPE/LIST MISSING;
   TITLE1 'FREQUENCY REPORT FOR 2011 NHIS Sample Adult FILE';
   TITLE2 '(UNWEIGHTED)';

* USER NOTE: TO SEE UNFORMATTED VALUES IN PROCEDURES, ADD THE
             STATEMENT: FORMAT _ALL_;
RUN;
