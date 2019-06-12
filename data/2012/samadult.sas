*********************************************************************
 MAY 16, 2013  2:00 PM
 
 This is an example of a SAS program that creates a SAS
 file from the 2012 NHIS Public Use SAMADULT.DAT ASCII file
 
 This is stored in SAMADULT.SAS
*********************************************************************;

* USER NOTE: PLACE NEXT STATEMENT IN SUBSEQUENT PROGRAMS;
LIBNAME  NHIS     "C:\NHIS2012";

* USER NOTE: PLACE NEXT STATEMENT IN SUBSEQUENT PROGRAMS
             IF YOU ALLOW PROGRAM TO PERMANENTLY STORE FORMATS;
LIBNAME  LIBRARY  "C:\NHIS2012";

FILENAME ASCIIDAT 'C:\NHIS2012\SAMADULT.dat';

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
      34                 = "34 Adult Alternative Medicine"
      38                 = "38 Functioning and Disability"
      39                 = "39 Adult Disability Questions Test"
      40                 = "40 Sample Child"
      44                 = "44 Child Alternative Medicine"
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
      1                  = "1 Sample Adult selected to receive AFD section"
      2                  = "2 Sample Adult not selected to receive AFD section"
   ;
   VALUE SAP020X
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
"1 Families selected to receive ADB (sample adults) and CDB (sample children 1-1
7 years) sections"
      2                  = 
"2 Families selected to receive FDB (all persons 1 year and older) sections"
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
   VALUE SAP033X
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
   VALUE SAP035X
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
   VALUE SAP036X
      00                 = "00 Less than 1 year"
      35                 = "35 35 or more years"
      97                 = "97 Refused"
      98                 = "98 Not ascertained"
      99                 = "99 Don't know"
   ;
   VALUE SAP041X
      0                  = "0 Had job last week"
      1                  = "1 No job last week, had job past 12 months"
      2                  = "2 No job last week, no job past 12 months"
      3                  = "3 Never worked"
      7                  = "7 Refused"
      8                  = "8 Not ascertained"
      9                  = "9 Don't know"
   ;
   VALUE SAP111X
      1                  = "1 Mentioned"
      2                  = "2 Not mentioned"
      7                  = "7 Refused"
      8                  = "8 Not ascertained"
      9                  = "9 Don't know"
   ;
   VALUE SAP142X
      85                 = "85 85+ years"
      97                 = "97 Refused"
      98                 = "98 Not ascertained"
      99                 = "99 Don't know"
   ;
   VALUE SAP172X
      1                  = "1 Yes"
      2                  = "2 No"
      3                  = "3 Borderline"
      7                  = "7 Refused"
      8                  = "8 Not ascertained"
      9                  = "9 Don't know"
   ;
   VALUE SAP175X
      00                 = "00 Within past year"
      85                 = "85 85+ years"
      96                 = "96 1+ year(s) with diabetes and age is 85+"
      97                 = "97 Refused"
      98                 = "98 Not ascertained"
      99                 = "99 Don't know"
   ;
   VALUE SAP226X
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
   VALUE SAP230X
      1                  = "1 ALL of the time"
      2                  = "2 MOST of the time"
      3                  = "3 SOME of the time"
      4                  = "4 A LITTLE of the time"
      5                  = "5 NONE of the time"
      7                  = "7 Refused"
      8                  = "8 Not ascertained"
      9                  = "9 Don't know"
   ;
   VALUE SAP236X
      1                  = "1 A lot"
      2                  = "2 Some"
      3                  = "3 A little"
      4                  = "4 Not at all"
      7                  = "7 Refused"
      8                  = "8 Not ascertained"
      9                  = "9 Don't know"
   ;
   VALUE SAP290X
      997                = "997 Refused"
      998                = "998 Not ascertained"
      999                = "999 Don't know"
   ;
   VALUE SAP299X
      1                  = "1 Mild"
      2                  = "2 Moderate"
      3                  = "3 Severe"
      7                  = "7 Refused"
      8                  = "8 Not ascertained"
      9                  = "9 Don't know"
   ;
   VALUE SAP300X
      1                  = "1 Yes"
      2                  = "2 No"
      7                  = "7 Refused"
      8                  = "8 Not ascertained"
      9                  = "9 Don’t know"
   ;
   VALUE SAP305X
      1                  = "1 No problem"
      2                  = "2 A small problem"
      3                  = "3 A moderate problem"
      4                  = "4 A big problem"
      5                  = "5 A very big problem"
      7                  = "7 Refused"
      8                  = "8 Not ascertained"
      9                  = "9 Don't know"
   ;
   VALUE SAP373X
      1                  = "1 Better"
      2                  = "2 Worse"
      3                  = "3 About the same"
      7                  = "7 Refused"
      8                  = "8 Not ascertained"
      9                  = "9 Don't know"
   ;
   VALUE SAP380X
      1                  = "1 Very helpful"
      2                  = "2 Somewhat helpful"
      3                  = "3 Not helpful"
      7                  = "7 Refused"
      8                  = "8 Not ascertained"
      9                  = "9 Don’t know"
   ;
   VALUE SAP381X
      000                = "000 None"
      997                = "997 Refused"
      998                = "998 Not ascertained"
      999                = "999 Don't know"
   ;
   VALUE SAP385X
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
   VALUE SAP397X
      1                  = "1 Limited in any way"
      2                  = "2 Not limited in any way"
      3                  = "3 Unknown if limited"
   ;
   VALUE SAP434X
      95                 = "95 95+"
      96                 = "96 Since birth"
      97                 = "97 Refused"
      98                 = "98 Not ascertained"
      99                 = "99 Don't know"
   ;
   VALUE SAP435X
      1                  = "1 Day(s)"
      2                  = "2 Week(s)"
      3                  = "3 Month(s)"
      4                  = "4 Year(s)"
      6                  = "6 Since birth"
      7                  = "7 Refused"
      8                  = "8 Not ascertained"
      9                  = "9 Don't know"
   ;
   VALUE SAP436X
      00                 = "00 Less than 1 year"
      85                 = "85 85+ years"
      96                 = "96 Unknown number of years"
      97                 = "97 Refused"
      98                 = "98 Not ascertained"
      99                 = "99 Don't know"
   ;
   VALUE SAP437X
      1                  = "1 Less than 3 months"
      2                  = "2 3-5 months"
      3                  = "3 6-12 months"
      4                  = "4 More than 1 year"
      7                  = "7 Refused"
      8                  = "8 Not ascertained"
      9                  = "9 Don't know"
   ;
   VALUE SAP438X
      1                  = "1 Chronic"
      2                  = "2 Not chronic"
      9                  = "9 Unknown if chronic"
   ;
   VALUE SAP614X
      1                  = 
"1 At least one condition causing functional limitation is chronic"
      2                  = "2 No condition causing functional limitation"
      9                  = 
"9 Unknown if any condition causing functional limitation is chronic"
   ;
   VALUE SAP615X
      0                  = 
"0 Not limited in any way (including unknown if limited)"
      1                  = "1 Limited; caused by at least one chronic condition"
      2                  = "2 Limited; not caused by chronic condition"
      3                  = "3 Limited; unknown if condition is chronic"
   ;
   VALUE SAP617X
      85                 = "85 85 years or older"
      96                 = "96 Never smoked regularly"
      97                 = "97 Refused"
      98                 = "98 Not ascertained"
      99                 = "99 Don't know"
   ;
   VALUE SAP618X
      1                  = "1 Every day"
      2                  = "2 Some days"
      3                  = "3 Not at all"
      7                  = "7 Refused"
      8                  = "8 Not ascertained"
      9                  = "9 Don't know"
   ;
   VALUE SAP619X
      1                  = "1 Current every day smoker"
      2                  = "2 Current some day smoker"
      3                  = "3 Former smoker"
      4                  = "4 Never smoker"
      5                  = "5 Smoker, current status unknown"
      9                  = "9 Unknown if ever smoked"
   ;
   VALUE SAP620X
      95                 = "95 95+"
      97                 = "97 Refused"
      98                 = "98 Not ascertained"
      99                 = "99 Don't know"
   ;
   VALUE SAP621X
      1                  = "1 Day(s)"
      2                  = "2 Week(s)"
      3                  = "3 Month(s)"
      4                  = "4 Year(s)"
      7                  = "7 Refused"
      8                  = "8 Not ascertained"
      9                  = "9 Don't know"
   ;
   VALUE SAP622X
      00                 = "00 Less than 1 year"
      70                 = "70 70+ years"
      97                 = "97 Refused"
      98                 = "98 Not ascertained"
      99                 = "99 Don't know"
   ;
   VALUE SAP623X
      95                 = "95 95+ cigarettes"
      97                 = "97 Refused"
      98                 = "98 Not ascertained"
      99                 = "99 Don't know"
   ;
   VALUE SAP624X
      00                 = "00 None"
      97                 = "97 Refused"
      98                 = "98 Not ascertained"
      99                 = "99 Don't know"
   ;
   VALUE SAP629X
      1                  = "1 Every day"
      2                  = "2 Some days"
      3                  = "3 Rarely"
      4                  = "4 Not at all"
      7                  = "7 Refused"
      8                  = "8 Not ascertained"
      9                  = "9 Don't know"
   ;
   VALUE SAP634X
      000                = "000 Never"
      996                = "996 Unable to do this type activity"
      997                = "997 Refused"
      998                = "998 Not ascertained"
      999                = "999 Don't know"
   ;
   VALUE SAP635X
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
   VALUE SAP636X
      00                 = "00 Less than once per week"
      95                 = "95 Never"
      96                 = "96 Unable to do vigorous activity"
      97                 = "97 Refused"
      98                 = "98 Not ascertained"
      99                 = "99 Don't know"
   ;
   VALUE SAP638X
      1                  = "1 Minutes"
      2                  = "2 Hours"
      7                  = "7 Refused"
      8                  = "8 Not ascertained"
      9                  = "9 Don't know"
   ;
   VALUE SAP642X
      00                 = "00 Less than once per week"
      95                 = "95 Never"
      96                 = "96 Unable to do light or moderate activity"
      97                 = "97 Refused"
      98                 = "98 Not ascertained"
      99                 = "99 Don't know"
   ;
   VALUE SAP648X
      00                 = "00 Less than once per week"
      95                 = "95 Never"
      96                 = "96 Unable to do strength activity"
      97                 = "97 Refused"
      98                 = "98 Not ascertained"
      99                 = "99 Don't know"
   ;
   VALUE SAP651X
      000                = "000 Never"
      997                = "997 Refused"
      998                = "998 Not ascertained"
      999                = "999 Don't know"
   ;
   VALUE SAP652X
      0                  = "0 Never/None"
      1                  = "1 Week"
      2                  = "2 Month"
      3                  = "3 Year"
      7                  = "7 Refused"
      8                  = "8 Not ascertained"
      9                  = "9 Don't know"
   ;
   VALUE SAP653X
      00                 = "00 Less than one day per week"
      95                 = "95 Did not drink in past year"
      97                 = "97 Refused"
      98                 = "98 Not ascertained"
      99                 = "99 Don't know"
   ;
   VALUE SAP654X
      000                = "000 Never/none"
      997                = "997 Refused"
      998                = "998 Not ascertained"
      999                = "999 Don't know"
   ;
   VALUE SAP655X
      95                 = "95 95+ drinks"
      97                 = "97 Refused"
      98                 = "98 Not ascertained"
      99                 = "99 Don't know"
   ;
   VALUE SAP656X
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
   VALUE SAP658X
      0                  = "0 Never/None"
      1                  = "1 Per week"
      2                  = "2 Per month"
      3                  = "3 Per year"
      7                  = "7 Refused"
      8                  = "8 Not ascertained"
      9                  = "9 Don't know"
   ;
   VALUE SAP660X
      96                 = "96 Not available"
      97                 = "97 Refused"
      98                 = "98 Not ascertained"
      99                 = "99 Don't know"
   ;
   VALUE SAP661X
      996                = "996 Not available"
      997                = "997 Refused"
      998                = "998 Not ascertained"
      999                = "999 Don't know"
   ;
   VALUE SAP662X
      99.95              = "99.95 99.95+"
      99.99              = "99.99 Unknown"
   ;
   VALUE SAP663X
      97                 = "97 Refused"
      98                 = "98 Not ascertained"
      99                 = "99 Don't know"
   ;
   VALUE SAP664X
      1                  = "1 Yes"
      2                  = "2 There is NO place"
      3                  = "3 There is MORE THAN ONE place"
      7                  = "7 Refused"
      8                  = "8 Not ascertained"
      9                  = "9 Don't know"
   ;
   VALUE SAP665X
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
   VALUE SAP667X
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
   VALUE SAP670X
      1                  = "1 Mentioned"
      2                  = "2 Not mentioned"
      7                  = "7 Refused"
      8                  = "8 Not ascertained"
      9                  = "9 Don’t know"
   ;
   VALUE SAP682X
      1                  = "1 Yes"
      2                  = "2 No"
      7                  = "7 Refused"
      8                  = "8 Not ascertained"
      9                  = "9 Don’t' know"
   ;
   VALUE SAP694X
      1                  = "1 Very worried"
      2                  = "2 Somewhat worried"
      3                  = "3 Not at all worried"
      7                  = "7 Refused"
      8                  = "8 Not ascertained"
      9                  = "9 Don't know"
   ;
   VALUE SAP702X
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
   VALUE SAP713X
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
   VALUE SAP734X
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
   VALUE SAP737X
      95                 = "95 95+ times"
      97                 = "97 Refused"
      98                 = "98 Not ascertained"
      99                 = "99 Don't know"
   ;
   VALUE SAP739X
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
   VALUE $SAP744X
      OTHER              = "Verbatim response"
      ' '                 = ' '
   ;
   VALUE SAP745X
      00                 = "00 Same day/walk-in appt/no appt made"
      96                 = 
"96 Routine appt/appt arranged on previous visit/rec'd appt reminder card"
      97                 = "97 Refused"
      98                 = "98 Not ascertained"
      99                 = "99 Don't know"
   ;
   VALUE SAP746X
      1                  = "1 Days"
      2                  = "2 Weeks"
      3                  = "3 Months"
      7                  = "7 Refused"
      8                  = "8 Not ascertained"
      9                  = "9 Don’t know"
   ;
   VALUE SAP747X
      00                 = "00 No time"
      97                 = "97 Refused"
      98                 = "98 Not ascertained"
      99                 = "99 Don’t know"
   ;
   VALUE SAP748X
      1                  = "1 Minutes"
      2                  = "2 Hours"
      7                  = "7 Refused"
      8                  = "8 Not ascertained"
      9                  = "9 Don’t know"
   ;
   VALUE SAP755X
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
   VALUE SAP756X
      .                   = '.'
      OTHER              = "Year"
      9997               = "9997 Refused"
      9998               = "9998 Not ascertained"
      9999               = "9999 Don't know"
   ;
   VALUE SAP757X
      1                  = "1 Before this pregnancy"
      2                  = "2 During this pregnancy"
      7                  = "7 Refused"
      8                  = "8 Not ascertained"
      9                  = "9 Don't know"
   ;
   VALUE SAP758X
      1                  = "1 Before this pregnancy"
      2                  = "2 During this pregnancy"
      3                  = "3 After this pregnancy"
      7                  = "7 Refused"
      8                  = "8 Not ascertained"
      9                  = "9 Don't know"
   ;
   VALUE SAP768X
      1                  = "1 Received at least 3 doses"
      2                  = "2 Received less than 3 doses"
      7                  = "7 Refused"
      8                  = "8 Not ascertained"
      9                  = "9 Don't know"
   ;
   VALUE SAP770X
      96                 = "96 Received all shots"
      97                 = "97 Refused"
      98                 = "98 Not ascertained"
      99                 = "99 Don't know"
   ;
   VALUE SAP774X
      1                  = "1 Yes-included pertussis"
      2                  = "2 No-did not include pertussis"
      3                  = "3 Doctor did not say"
      7                  = "7 Refused"
      8                  = "8 Not ascertained"
      9                  = "9 Don't know"
   ;
   VALUE SAP777X
      1                  = "1 Yes"
      2                  = "2 No"
      3                  = "3 Doctor refused when asked"
      7                  = "7 Refused"
      8                  = "8 Not Ascertained"
      9                  = "9 Don't know"
   ;
   VALUE SAP778X
      96                 = "96 All shots"
      97                 = "97 Refused"
      98                 = "98 Not Ascertained"
      99                 = "99 Don't know"
   ;
   VALUE SAP792X
      1                  = "1 Very likely"
      2                  = "2 Somewhat likely"
      3                  = "3 Somewhat unlikely"
      4                  = "4 Very unlikely"
      7                  = "7 Refused"
      8                  = "8 Not ascertained"
      9                  = "9 Don't know"
   ;
   VALUE SAP800X
      1                  = "1 Self"
      2                  = "2 Someone else in family"
      3                  = "3 Both"
      7                  = "7 Refused"
      8                  = "8 Not ascertained"
      9                  = "9 Don’t know"
   ;
   VALUE SAP801X
      1                  = "1 Very difficult"
      2                  = "2 Somewhat difficult"
      3                  = "3 Not at all difficult"
      7                  = "7 Refused"
      8                  = "8 Not ascertained"
      9                  = "9 Don’t know"
   ;
   VALUE SAP802X
      1                  = "1 Very difficult"
      2                  = "2 Somewhat difficult"
      3                  = "3 Not at all difficult"
      7                  = "7 Refused"
      8                  = "8 Not ascertained"
      9                  = "9 Don't know"
   ;
   VALUE SAP814X
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
   INFILE ASCIIDAT PAD LRECL=1086;

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

      /* FRT LENGTHS */

      AFD_FLG    3

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
      SCHOOLYR   3

      /* ACN LENGTHS */

      HYPEV      3   HYPDIFV    3   HYPYR      3   CHDEV      3
      CHDYR      3   ANGEV      3   MIEV       3   HRTEV      3
      HRTYR      3   STREV      3   EPHEV      3   COPDEV     3
      ASPMEDEV   3   ASPMEDAD   3   ASPMDMED   3   ASPONOWN   3
      AASMEV     3   AASSTILL   3   AASMYR     3   AASERYR1   3
      ULCEV      3   ULCYR      3   CHLEV      3   CHLYR      3
      AFLUPNEV   3   AFLUPNYR   3   ASTREPEV   3   ASTREPYR   3
      PRCIREV    3   PRCIRYR    3   UREV       3   URYR       3
      PHOBIAEV   3   PHOBIAYR   3   ADDHYP1    3   BIPDIS     3
      ADEPRSEV   3   ADEPRSYR   3   MHDOTHEV   3   MHDOTHYR   3
      RESPALYR   3   DGSTALYR   3   SKNALYR    3   OTHALYR    3
      ACIDRYR    3   AFEVRYR    3   ACOLDYR    3   ANAUSYR    3
      ATHOTHYR   3   IMMOTHYR   3   AHEADYR    3   MEMLOSYR   3
      NEUROYR    3   AABDOMYR   3   SPNYR      3   DENYR      3
      AMUSCLYR   3   APNOTHYR   3   ALCTOBYR   3   SUBABYR    3
      AOVRWTYR   3   SKNYR1     3   FATIGYR    3   FATYR      3
      INSYR      3   ANXNWYR    3   ASTRESYR   3   CANEV      3
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
      CANAGE30   4   DIBEV      3   DIBPRE1    3   DIBAGE     3
      DIFAGE2    3   INSLN      3   DIBPILL    3   AHAYFYR    3
      SINYR      3   CBRCHYR    3   KIDWKYR    3   LIVYR      3
      JNTSYMP    3   JMTHP1     3   JMTHP2     3   JMTHP3     3
      JMTHP4     3   JMTHP5     3   JMTHP6     3   JMTHP7     3
      JMTHP8     3   JMTHP9     3   JMTHP10    3   JMTHP11    3
      JMTHP12    3   JMTHP13    3   JMTHP14    3   JMTHP15    3
      JMTHP16    3   JMTHP17    3   JNTCHR     3   JNTHP      3
      ARTH1      3   ARTHLMT    3   ARTHTYP1   3   ARTHTYP2   3
      ARTHTYP3   3   ARTHTYP4   3   ARTHTYP5   3   ARTHTYP6   3
      PAINECK    3   PAINLB     3   PAINLEG    3   PAINFACE   3
      AMIGR      3   ACOLD2W    3   AINTIL2W   3   PREGNOW    3
      PREGFLYR   3   MENSYR     3   MENOYR     3   GYNYR      3
      PROSTYR    3   HRAIDNOW   3   HRAIDEV    3   AHEARST1   3
      AVISION    3   ABLIND     3   LUPPRT     3   SAD        3
      NERVOUS    3   RESTLESS   3   HOPELESS   3   EFFORT     3
      WORTHLS    3   MHAMTMO    3

      /* ACD LENGTHS */

      VSLVYR     3   VSLSWYR    3   VSLSPYR    3   VSLLGYR    3
      VSLSPEC    3   VSLEVER    3   VSLHPD     3   VSLDGTP1   3
      VSLDGTP2   3   VSLDGTP3   3   VSLDGTP4   3   VSLVDG01   3
      VSLVDG02   3   VSLVDG03   3   VSLVDG04   3   VSLVDG05   3
      VSLVDG06   3   VSLVDG07   3   VSLVDG08   3   VSLVDG09   3
      VSLVDG10   3   VSLVDG11   3   VSLSWD01   3   VSLSWD02   3
      VSLSWD03   3   VSLSWD04   3   VSLSWD05   3   VSLSWD06   3
      VSLSWD07   3   VSLSWD08   3   VSLSWD09   3   VSLSWD10   3
      VSLSPD01   3   VSLSPD02   3   VSLSPD03   3   VSLSPD04   3
      VSLSPD05   3   VSLSPD06   3   VSLSPD07   3   VSLSPD08   3
      VSLSPD09   3   VSLSPD10   3   VSLLGD01   3   VSLLGD02   3
      VSLLGD03   3   VSLLGD04   3   VSLLGD05   3   VSLLGD06   3
      VSLLGD07   3   VSLLGD08   3   VSLLGD09   3   VSLLGD10   3
      VSLLGD11   3   VSLVDYS    4   VSLSWDYS   4   VSLSPDYS   4
      VSLLGDYS   4   VSLV1WK    3   VSLSW1WK   3   VSLSP1WK   3
      VSLLG1WK   3   VSLSTUTT   3   VSLSTDEG   3   VSLLGFAM   3
      VSLVAGE    4   VSLSWAGE   4   VSLSPAGE   4   VSLLGAGE   4
      VSLVPRB    3   VSLSWPRB   3   VSLSPPRB   3   VSLLGPRB   3
      VSLVSLP    3   VSLVPEV    3   VSLSWSLP   3   VSLSWPEV   3
      VSLSPSLP   3   VSLSPPEV   3   VSLLGSLP   3   VSLLGPEV   3
      VSLVTRT    3   VSLVTR01   3   VSLVTR02   3   VSLVTR03   3
      VSLVTR04   3   VSLVTR05   3   VSLVTR06   3   VSLVTR07   3
      VSLVTR08   3   VSLVTR09   3   VSLVTR10   3   VSLVTR11   3
      VSLSWTRT   3   VSLSWT01   3   VSLSWT02   3   VSLSWT03   3
      VSLSWT04   3   VSLSWT05   3   VSLSWT06   3   VSLSWT07   3
      VSLSWT08   3   VSLSWT09   3   VSLSWT10   3   VSLSWT11   3
      VSLSPTRT   3   VSLSPT01   3   VSLSPT02   3   VSLSPT03   3
      VSLSPT04   3   VSLSPT05   3   VSLSPT06   3   VSLSPT07   3
      VSLSPT08   3   VSLSPT09   3   VSLSPT10   3   VSLSPT11   3
      VSLLGTRT   3   VSLLGT01   3   VSLLGT02   3   VSLLGT03   3
      VSLLGT04   3   VSLLGT05   3   VSLLGT06   3   VSLLGT07   3
      VSLLGT08   3   VSLLGT09   3   VSLLGT10   3   VSLLGT11   3
      VSLVSOC    3   VSLSWSOC   3   VSLSPSOC   3   VSLLGSOC   3
      VSLVSW     3   VSLSWSW    3   VSLSPSW    3   VSLLGSW    3
      VSLVCOM    3   VSLSWCOM   3   VSLSPCOM   3   VSLLGCOM   3
      VSLINTYR   3   VSLINTCN   3   VSLINTPR   3   VSLINTHP   3

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
      OTHCIGEV   3   OTHCIGED   3   SMKLESEV   3   SMKLESED   3
      TOBLASYR   3   TOBQTYR    3   VIGNO      4   VIGTP      3
      VIGFREQW   3   VIGLNGNO   4   VIGLNGTP   3   VIGMIN     4
      MODNO      4   MODTP      3   MODFREQW   3   MODLNGNO   4
      MODLNGTP   3   MODMIN     4   STRNGNO    4   STRNGTP    3
      STRFREQW   3   ALC1YR     3   ALCLIFE    3   ALC12MNO   4
      ALC12MTP   3   ALC12MWK   3   ALC12MYR   4   ALCAMT     3
      ALCSTAT    3   ALC5UPNO   4   ALC5UPTP   3   ALC5UPYR   4
      AHEIGHT    3   AWEIGHTP   4   BMI        8   SLEEP      3

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
      AERREA1R   3   AERREA2R   3   AERREA3R   3   AERREA4R   3
      AERREA5R   3   AERREA6R   3   AERREA7R   3   AERREA8R   3
      AHCHYR     3   AHCHMOYR   3   AHCHNOY2   3   AHCNOYR2   3
      ASRGYR     3   ASRGNOYR   3   AMDLONGR   3   AVISLAST   3
      ALASTYP1   3   ALASTYP2   3   ALASTYP3   3   ALASTYP4   3
      ALASTVRB $ 15  AVISAPN2   3   AVISAPT2   3   AWAITRMN   3
      AWAITRMT   3   HIT1A      3   HIT2A      3   HIT3A      3
      HIT4A      3   HIT5A      3   SHTFLU2    3   ASHFLUM2   3
      ASHFLUY2   4   FLUSHPG1   3   FLUSHPG2   3   SPRFLU2    3
      ASPFLUM2   3   ASPFLUY2   4   SHTPNUYR   3   APOX       3
      APOX12MO   3   AHEP       3   AHEPLIV    3   SHTHEPB    3
      SHEPDOS    3   SHTHEPA    3   SHEPANUM   3   SHINGLES   3
      SHTTD      3   SHTTD05    3   SHTTDAP2   3   HPVHRD     3
      SHHPVHD1   3   SHTHPV1    3   SHHPVDOS   3   LIVEV      3
      TRAVEL     3   WRKHLTH2   3   WRKDIR     3   APSBPCHK   3
      APSCHCHK   3   APSBSCHK   3   APSPAP     3   APSMAM     3
      APSCOL     3   APSDIET    3   APSSMKC    3   LTCFAM     3
      LTCHELP    3   LTCWHO1    3   LTCWHO2    3   LTCWHO3    3
      LTCWHO4    3   LTCWHO5    3   AINDINS    3   AINDPRCH   3
      AINDWHO    3   AINDDIF1   3   AINDDIF2   3   AINDENY1   3
      AINDENY2   3   AINDENY3   3   AINDNOT1   3   AINDNOT2   3
      AINDNOT3   3   AINDNOT4   3   AINDNOT5   3   HIVTST1    3

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

      REGION       33 -  33    STRAT_P      34 -  36
      PSU_P        37 -  38

      /* HHC LOCATIONS */

      SEX          39 -  39    HISPAN_I     40 -  41
      RACERPI2     42 -  43    MRACRPI2     44 -  45
      MRACBPI2     46 -  47    AGE_P        48 -  49


      /* FRT LOCATIONS */

      AFD_FLG      50 -  50

      /* FID LOCATIONS */

      R_MARITL     51 -  51

      /* AID LOCATIONS */

      PROXYSA      52 -  52    PROX1        53 -  53
      PROX2        54 -  54    LATEINTA     55 -  55


      /* FDB LOCATIONS */

      FDRN_FLG     56 -  56

      /* ASD LOCATIONS */

      DOINGLWA     57 -  57    WHYNOWKA     58 -  59
      EVERWRK      60 -  60    INDSTRN1     61 -  62
      INDSTRN2     63 -  64    OCCUPN1      65 -  66
      OCCUPN2      67 -  68    WRKCATA      69 -  69
      BUSINC1A     70 -  70    LOCALL1A     71 -  72
      YRSWRKPA     73 -  74    WRKLONGH     75 -  75
      HOURPDA      76 -  76    PDSICKA      77 -  77
      ONEJOB       78 -  78    WRKLYR4      79 -  79
      SCHOOLYR     80 -  80

      /* ACN LOCATIONS */

      HYPEV        81 -  81    HYPDIFV      82 -  82
      HYPYR        83 -  83    CHDEV        84 -  84
      CHDYR        85 -  85    ANGEV        86 -  86
      MIEV         87 -  87    HRTEV        88 -  88
      HRTYR        89 -  89    STREV        90 -  90
      EPHEV        91 -  91    COPDEV       92 -  92
      ASPMEDEV     93 -  93    ASPMEDAD     94 -  94
      ASPMDMED     95 -  95    ASPONOWN     96 -  96
      AASMEV       97 -  97    AASSTILL     98 -  98
      AASMYR       99 -  99    AASERYR1    100 - 100
      ULCEV       101 - 101    ULCYR       102 - 102
      CHLEV       103 - 103    CHLYR       104 - 104
      AFLUPNEV    105 - 105    AFLUPNYR    106 - 106
      ASTREPEV    107 - 107    ASTREPYR    108 - 108
      PRCIREV     109 - 109    PRCIRYR     110 - 110
      UREV        111 - 111    URYR        112 - 112
      PHOBIAEV    113 - 113    PHOBIAYR    114 - 114
      ADDHYP1     115 - 115    BIPDIS      116 - 116
      ADEPRSEV    117 - 117    ADEPRSYR    118 - 118
      MHDOTHEV    119 - 119    MHDOTHYR    120 - 120
      RESPALYR    121 - 121    DGSTALYR    122 - 122
      SKNALYR     123 - 123    OTHALYR     124 - 124
      ACIDRYR     125 - 125    AFEVRYR     126 - 126
      ACOLDYR     127 - 127    ANAUSYR     128 - 128
      ATHOTHYR    129 - 129    IMMOTHYR    130 - 130
      AHEADYR     131 - 131    MEMLOSYR    132 - 132
      NEUROYR     133 - 133    AABDOMYR    134 - 134
      SPNYR       135 - 135    DENYR       136 - 136
      AMUSCLYR    137 - 137    APNOTHYR    138 - 138
      ALCTOBYR    139 - 139    SUBABYR     140 - 140
      AOVRWTYR    141 - 141    SKNYR1      142 - 142
      FATIGYR     143 - 143    FATYR       144 - 144
      INSYR       145 - 145    ANXNWYR     146 - 146
      ASTRESYR    147 - 147    CANEV       148 - 148
      CNKIND1     149 - 149    CNKIND2     150 - 150
      CNKIND3     151 - 151    CNKIND4     152 - 152
      CNKIND5     153 - 153    CNKIND6     154 - 154
      CNKIND7     155 - 155    CNKIND8     156 - 156
      CNKIND9     157 - 157    CNKIND10    158 - 158
      CNKIND11    159 - 159    CNKIND12    160 - 160
      CNKIND13    161 - 161    CNKIND14    162 - 162
      CNKIND15    163 - 163    CNKIND16    164 - 164
      CNKIND17    165 - 165    CNKIND18    166 - 166
      CNKIND19    167 - 167    CNKIND20    168 - 168
      CNKIND21    169 - 169    CNKIND22    170 - 170
      CNKIND23    171 - 171    CNKIND24    172 - 172
      CNKIND25    173 - 173    CNKIND26    174 - 174
      CNKIND27    175 - 175    CNKIND28    176 - 176
      CNKIND29    177 - 177    CNKIND30    178 - 178
      CNKIND31    179 - 179    CANAGE1     180 - 182
      CANAGE2     183 - 185    CANAGE3     186 - 188
      CANAGE4     189 - 191    CANAGE5     192 - 194
      CANAGE6     195 - 197    CANAGE7     198 - 200
      CANAGE8     201 - 203    CANAGE9     204 - 206
      CANAGE10    207 - 209    CANAGE11    210 - 212
      CANAGE12    213 - 215    CANAGE13    216 - 218
      CANAGE14    219 - 221    CANAGE15    222 - 224
      CANAGE16    225 - 227    CANAGE17    228 - 230
      CANAGE18    231 - 233    CANAGE19    234 - 236
      CANAGE20    237 - 239    CANAGE21    240 - 242
      CANAGE22    243 - 245    CANAGE23    246 - 248
      CANAGE24    249 - 251    CANAGE25    252 - 254
      CANAGE26    255 - 257    CANAGE27    258 - 260
      CANAGE28    261 - 263    CANAGE29    264 - 266
      CANAGE30    267 - 269    DIBEV       270 - 270
      DIBPRE1     271 - 271    DIBAGE      272 - 273
      DIFAGE2     274 - 275    INSLN       276 - 276
      DIBPILL     277 - 277    AHAYFYR     278 - 278
      SINYR       279 - 279    CBRCHYR     280 - 280
      KIDWKYR     281 - 281    LIVYR       282 - 282
      JNTSYMP     283 - 283    JMTHP1      284 - 284
      JMTHP2      285 - 285    JMTHP3      286 - 286
      JMTHP4      287 - 287    JMTHP5      288 - 288
      JMTHP6      289 - 289    JMTHP7      290 - 290
      JMTHP8      291 - 291    JMTHP9      292 - 292
      JMTHP10     293 - 293    JMTHP11     294 - 294
      JMTHP12     295 - 295    JMTHP13     296 - 296
      JMTHP14     297 - 297    JMTHP15     298 - 298
      JMTHP16     299 - 299    JMTHP17     300 - 300
      JNTCHR      301 - 301    JNTHP       302 - 302
      ARTH1       303 - 303    ARTHLMT     304 - 304
      ARTHTYP1    305 - 305    ARTHTYP2    306 - 306
      ARTHTYP3    307 - 307    ARTHTYP4    308 - 308
      ARTHTYP5    309 - 309    ARTHTYP6    310 - 310
      PAINECK     311 - 311    PAINLB      312 - 312
      PAINLEG     313 - 313    PAINFACE    314 - 314
      AMIGR       315 - 315    ACOLD2W     316 - 316
      AINTIL2W    317 - 317    PREGNOW     318 - 318
      PREGFLYR    319 - 319    MENSYR      320 - 320
      MENOYR      321 - 321    GYNYR       322 - 322
      PROSTYR     323 - 323    HRAIDNOW    324 - 324
      HRAIDEV     325 - 325    AHEARST1    326 - 326
      AVISION     327 - 327    ABLIND      328 - 328
      LUPPRT      329 - 329    SAD         330 - 330
      NERVOUS     331 - 331    RESTLESS    332 - 332
      HOPELESS    333 - 333    EFFORT      334 - 334
      WORTHLS     335 - 335    MHAMTMO     336 - 336


      /* ACD LOCATIONS */

      VSLVYR      337 - 337    VSLSWYR     338 - 338
      VSLSPYR     339 - 339    VSLLGYR     340 - 340
      VSLSPEC     341 - 341    VSLEVER     342 - 342
      VSLHPD      343 - 343    VSLDGTP1    344 - 344
      VSLDGTP2    345 - 345    VSLDGTP3    346 - 346
      VSLDGTP4    347 - 347    VSLVDG01    348 - 348
      VSLVDG02    349 - 349    VSLVDG03    350 - 350
      VSLVDG04    351 - 351    VSLVDG05    352 - 352
      VSLVDG06    353 - 353    VSLVDG07    354 - 354
      VSLVDG08    355 - 355    VSLVDG09    356 - 356
      VSLVDG10    357 - 357    VSLVDG11    358 - 358
      VSLSWD01    359 - 359    VSLSWD02    360 - 360
      VSLSWD03    361 - 361    VSLSWD04    362 - 362
      VSLSWD05    363 - 363    VSLSWD06    364 - 364
      VSLSWD07    365 - 365    VSLSWD08    366 - 366
      VSLSWD09    367 - 367    VSLSWD10    368 - 368
      VSLSPD01    369 - 369    VSLSPD02    370 - 370
      VSLSPD03    371 - 371    VSLSPD04    372 - 372
      VSLSPD05    373 - 373    VSLSPD06    374 - 374
      VSLSPD07    375 - 375    VSLSPD08    376 - 376
      VSLSPD09    377 - 377    VSLSPD10    378 - 378
      VSLLGD01    379 - 379    VSLLGD02    380 - 380
      VSLLGD03    381 - 381    VSLLGD04    382 - 382
      VSLLGD05    383 - 383    VSLLGD06    384 - 384
      VSLLGD07    385 - 385    VSLLGD08    386 - 386
      VSLLGD09    387 - 387    VSLLGD10    388 - 388
      VSLLGD11    389 - 389    VSLVDYS     390 - 392
      VSLSWDYS    393 - 395    VSLSPDYS    396 - 398
      VSLLGDYS    399 - 401    VSLV1WK     402 - 402
      VSLSW1WK    403 - 403    VSLSP1WK    404 - 404
      VSLLG1WK    405 - 405    VSLSTUTT    406 - 406
      VSLSTDEG    407 - 407    VSLLGFAM    408 - 408
      VSLVAGE     409 - 411    VSLSWAGE    412 - 414
      VSLSPAGE    415 - 417    VSLLGAGE    418 - 420
      VSLVPRB     421 - 421    VSLSWPRB    422 - 422
      VSLSPPRB    423 - 423    VSLLGPRB    424 - 424
      VSLVSLP     425 - 425    VSLVPEV     426 - 426
      VSLSWSLP    427 - 427    VSLSWPEV    428 - 428
      VSLSPSLP    429 - 429    VSLSPPEV    430 - 430
      VSLLGSLP    431 - 431    VSLLGPEV    432 - 432
      VSLVTRT     433 - 433    VSLVTR01    434 - 434
      VSLVTR02    435 - 435    VSLVTR03    436 - 436
      VSLVTR04    437 - 437    VSLVTR05    438 - 438
      VSLVTR06    439 - 439    VSLVTR07    440 - 440
      VSLVTR08    441 - 441    VSLVTR09    442 - 442
      VSLVTR10    443 - 443    VSLVTR11    444 - 444
      VSLSWTRT    445 - 445    VSLSWT01    446 - 446
      VSLSWT02    447 - 447    VSLSWT03    448 - 448
      VSLSWT04    449 - 449    VSLSWT05    450 - 450
      VSLSWT06    451 - 451    VSLSWT07    452 - 452
      VSLSWT08    453 - 453    VSLSWT09    454 - 454
      VSLSWT10    455 - 455    VSLSWT11    456 - 456
      VSLSPTRT    457 - 457    VSLSPT01    458 - 458
      VSLSPT02    459 - 459    VSLSPT03    460 - 460
      VSLSPT04    461 - 461    VSLSPT05    462 - 462
      VSLSPT06    463 - 463    VSLSPT07    464 - 464
      VSLSPT08    465 - 465    VSLSPT09    466 - 466
      VSLSPT10    467 - 467    VSLSPT11    468 - 468
      VSLLGTRT    469 - 469    VSLLGT01    470 - 470
      VSLLGT02    471 - 471    VSLLGT03    472 - 472
      VSLLGT04    473 - 473    VSLLGT05    474 - 474
      VSLLGT06    475 - 475    VSLLGT07    476 - 476
      VSLLGT08    477 - 477    VSLLGT09    478 - 478
      VSLLGT10    479 - 479    VSLLGT11    480 - 480
      VSLVSOC     481 - 481    VSLSWSOC    482 - 482
      VSLSPSOC    483 - 483    VSLLGSOC    484 - 484
      VSLVSW      485 - 485    VSLSWSW     486 - 486
      VSLSPSW     487 - 487    VSLLGSW     488 - 488
      VSLVCOM     489 - 489    VSLSWCOM    490 - 490
      VSLSPCOM    491 - 491    VSLLGCOM    492 - 492
      VSLINTYR    493 - 493    VSLINTCN    494 - 494
      VSLINTPR    495 - 495    VSLINTHP    496 - 496


      /* AHS LOCATIONS */

      WKDAYR      497 - 499    BEDDAYR     500 - 502
      AHSTATYR    503 - 503    SPECEQ      504 - 504
      FLWALK      505 - 505    FLCLIMB     506 - 506
      FLSTAND     507 - 507    FLSIT       508 - 508
      FLSTOOP     509 - 509    FLREACH     510 - 510
      FLGRASP     511 - 511    FLCARRY     512 - 512
      FLPUSH      513 - 513    FLSHOP      514 - 514
      FLSOCL      515 - 515    FLRELAX     516 - 516
      FLA1AR      517 - 517    AFLHCA1     518 - 518
      AFLHCA2     519 - 519    AFLHCA3     520 - 520
      AFLHCA4     521 - 521    AFLHCA5     522 - 522
      AFLHCA6     523 - 523    AFLHCA7     524 - 524
      AFLHCA8     525 - 525    AFLHCA9     526 - 526
      AFLHCA10    527 - 527    AFLHCA11    528 - 528
      AFLHCA12    529 - 529    AFLHCA13    530 - 530
      ALHCA14A    531 - 531    AFLHCA15    532 - 532
      AFLHCA16    533 - 533    AFLHCA17    534 - 534
      AFLHCA18    535 - 535    AFLHC19_    536 - 536
      AFLHC20_    537 - 537    AFLHC21_    538 - 538
      AFLHC22_    539 - 539    AFLHC23_    540 - 540
      AFLHC24_    541 - 541    AFLHC25_    542 - 542
      AFLHC26_    543 - 543    AFLHC27_    544 - 544
      AFLHC28_    545 - 545    AFLHC29_    546 - 546
      AFLHC30_    547 - 547    AFLHC31_    548 - 548
      AFLHC32_    549 - 549    AFLHC33_    550 - 550
      AFLHC34_    551 - 551    AFLHCA90    552 - 552
      AFLHCA91    553 - 553    ALTIME1     554 - 555
      ALUNIT1     556 - 556    ALDURA1     557 - 558
      ALDURB1     559 - 559    ALCHRC1     560 - 560
      ALTIME2     561 - 562    ALUNIT2     563 - 563
      ALDURA2     564 - 565    ALDURB2     566 - 566
      ALCHRC2     567 - 567    ALTIME3     568 - 569
      ALUNIT3     570 - 570    ALDURA3     571 - 572
      ALDURB3     573 - 573    ALCHRC3     574 - 574
      ALTIME4     575 - 576    ALUNIT4     577 - 577
      ALDURA4     578 - 579    ALDURB4     580 - 580
      ALCHRC4     581 - 581    ALTIME5     582 - 583
      ALUNIT5     584 - 584    ALDURA5     585 - 586
      ALDURB5     587 - 587    ALCHRC5     588 - 588
      ALTIME6     589 - 590    ALUNIT6     591 - 591
      ALDURA6     592 - 593    ALDURB6     594 - 594
      ALCHRC6     595 - 595    ALTIME7     596 - 597
      ALUNIT7     598 - 598    ALDURA7     599 - 600
      ALDURB7     601 - 601    ALCHRC7     602 - 602
      ALTIME8     603 - 604    ALUNIT8     605 - 605
      ALDURA8     606 - 607    ALDURB8     608 - 608
      ALCHRC8     609 - 609    ALTIME9     610 - 611
      ALUNIT9     612 - 612    ALDURA9     613 - 614
      ALDURB9     615 - 615    ALCHRC9     616 - 616
      ALTIME10    617 - 618    ALUNIT10    619 - 619
      ALDURA10    620 - 621    ALDURB10    622 - 622
      ALCHRC10    623 - 623    ALTIME11    624 - 625
      ALUNIT11    626 - 626    ALDURA11    627 - 628
      ALDURB11    629 - 629    ALCHRC11    630 - 630
      ALTIME12    631 - 632    ALUNIT12    633 - 633
      ALDURA12    634 - 635    ALDURB12    636 - 636
      ALCHRC12    637 - 637    ALTIME13    638 - 639
      ALUNIT13    640 - 640    ALDURA13    641 - 642
      ALDURB13    643 - 643    ALCHRC13    644 - 644
      ATIME14A    645 - 646    AUNIT14A    647 - 647
      ADURA14A    648 - 649    ADURB14A    650 - 650
      ACHRC14A    651 - 651    ALTIME15    652 - 653
      ALUNIT15    654 - 654    ALDURA15    655 - 656
      ALDURB15    657 - 657    ALCHRC15    658 - 658
      ALTIME16    659 - 660    ALUNIT16    661 - 661
      ALDURA16    662 - 663    ALDURB16    664 - 664
      ALCHRC16    665 - 665    ALTIME17    666 - 667
      ALUNIT17    668 - 668    ALDURA17    669 - 670
      ALDURB17    671 - 671    ALCHRC17    672 - 672
      ALTIME18    673 - 674    ALUNIT18    675 - 675
      ALDURA18    676 - 677    ALDURB18    678 - 678
      ALCHRC18    679 - 679    ALTIME19    680 - 681
      ALUNIT19    682 - 682    ALDURA19    683 - 684
      ALDURB19    685 - 685    ALCHRC19    686 - 686
      ALTIME20    687 - 688    ALUNIT20    689 - 689
      ALDURA20    690 - 691    ALDURB20    692 - 692
      ALCHRC20    693 - 693    ALTIME21    694 - 695
      ALUNIT21    696 - 696    ALDURA21    697 - 698
      ALDURB21    699 - 699    ALCHRC21    700 - 700
      ALTIME22    701 - 702    ALUNIT22    703 - 703
      ALDURA22    704 - 705    ALDURB22    706 - 706
      ALCHRC22    707 - 707    ALTIME23    708 - 709
      ALUNIT23    710 - 710    ALDURA23    711 - 712
      ALDURB23    713 - 713    ALCHRC23    714 - 714
      ALTIME24    715 - 716    ALUNIT24    717 - 717
      ALDURA24    718 - 719    ALDURB24    720 - 720
      ALCHRC24    721 - 721    ALTIME25    722 - 723
      ALUNIT25    724 - 724    ALDURA25    725 - 726
      ALDURB25    727 - 727    ALCHRC25    728 - 728
      ALTIME26    729 - 730    ALUNIT26    731 - 731
      ALDURA26    732 - 733    ALDURB26    734 - 734
      ALCHRC26    735 - 735    ALTIME27    736 - 737
      ALUNIT27    738 - 738    ALDURA27    739 - 740
      ALDURB27    741 - 741    ALCHRC27    742 - 742
      ALTIME28    743 - 744    ALUNIT28    745 - 745
      ALDURA28    746 - 747    ALDURB28    748 - 748
      ALCHRC28    749 - 749    ALTIME29    750 - 751
      ALUNIT29    752 - 752    ALDURA29    753 - 754
      ALDURB29    755 - 755    ALCHRC29    756 - 756
      ALTIME30    757 - 758    ALUNIT30    759 - 759
      ALDURA30    760 - 761    ALDURB30    762 - 762
      ALCHRC30    763 - 763    ALTIME31    764 - 765
      ALUNIT31    766 - 766    ALDURA31    767 - 768
      ALDURB31    769 - 769    ALCHRC31    770 - 770
      ALTIME32    771 - 772    ALUNIT32    773 - 773
      ALDURA32    774 - 775    ALDURB32    776 - 776
      ALCHRC32    777 - 777    ALTIME33    778 - 779
      ALUNIT33    780 - 780    ALDURA33    781 - 782
      ALDURB33    783 - 783    ALCHRC33    784 - 784
      ALTIME34    785 - 786    ALUNIT34    787 - 787
      ALDURA34    788 - 789    ALDURB34    790 - 790
      ALCHRC34    791 - 791    ALTIME90    792 - 793
      ALUNIT90    794 - 794    ALDURA90    795 - 796
      ALDURB90    797 - 797    ALCHRC90    798 - 798
      ALTIME91    799 - 800    ALUNIT91    801 - 801
      ALDURA91    802 - 803    ALDURB91    804 - 804
      ALCHRC91    805 - 805    ALCNDRT     806 - 806
      ALCHRONR    807 - 807

      /* AHB LOCATIONS */

      SMKEV       808 - 808    SMKREG      809 - 810
      SMKNOW      811 - 811    SMKSTAT2    812 - 812
      SMKQTNO     813 - 814    SMKQTTP     815 - 815
      SMKQTY      816 - 817    CIGSDA1     818 - 819
      CIGDAMO     820 - 821    CIGSDA2     822 - 823
      CIGSDAY     824 - 825    CIGQTYR     826 - 826
      OTHCIGEV    827 - 827    OTHCIGED    828 - 828
      SMKLESEV    829 - 829    SMKLESED    830 - 830
      TOBLASYR    831 - 831    TOBQTYR     832 - 832
      VIGNO       833 - 835    VIGTP       836 - 836
      VIGFREQW    837 - 838    VIGLNGNO    839 - 841
      VIGLNGTP    842 - 842    VIGMIN      843 - 845
      MODNO       846 - 848    MODTP       849 - 849
      MODFREQW    850 - 851    MODLNGNO    852 - 854
      MODLNGTP    855 - 855    MODMIN      856 - 858
      STRNGNO     859 - 861    STRNGTP     862 - 862
      STRFREQW    863 - 864    ALC1YR      865 - 865
      ALCLIFE     866 - 866    ALC12MNO    867 - 869
      ALC12MTP    870 - 870    ALC12MWK    871 - 872
      ALC12MYR    873 - 875    ALCAMT      876 - 877
      ALCSTAT     878 - 879    ALC5UPNO    880 - 882
      ALC5UPTP    883 - 883    ALC5UPYR    884 - 886
      AHEIGHT     887 - 888    AWEIGHTP    889 - 891
      BMI         892 - 895 .2 SLEEP       896 - 897


      /* AAU LOCATIONS */

      AUSUALPL    898 - 898    APLKIND     899 - 899
      AHCPLROU    900 - 900    AHCPLKND    901 - 901
      AHCCHGYR    902 - 902    AHCCHGHI    903 - 903
      ANOUSPL1    904 - 904    ANOUSPL2    905 - 905
      ANOUSPL3    906 - 906    ANOUSPL4    907 - 907
      ANOUSPL5    908 - 908    ANOUSPL6    909 - 909
      ANOUSPL7    910 - 910    ANOUSPL8    911 - 911
      ANOUSPL9    912 - 912    APRVTRYR    913 - 913
      APRVTRFD    914 - 914    ADRNANP     915 - 915
      ADRNAI      916 - 916    AHCDLYR1    917 - 917
      AHCDLYR2    918 - 918    AHCDLYR3    919 - 919
      AHCDLYR4    920 - 920    AHCDLYR5    921 - 921
      AHCAFYR1    922 - 922    AHCAFYR2    923 - 923
      AHCAFYR3    924 - 924    AHCAFYR4    925 - 925
      AHCAFYR5    926 - 926    AHCAFYR6    927 - 927
      AWORPAY     928 - 928    AHICOMP     929 - 929
      ARXPR_1     930 - 930    ARXPR_2     931 - 931
      ARXPR_3     932 - 932    ARXPR_4     933 - 933
      ARXPR_5     934 - 934    ARXPR_6     935 - 935
      ADNLONG2    936 - 936    AHCSYR1     937 - 937
      AHCSYR2     938 - 938    AHCSYR3     939 - 939
      AHCSYR4     940 - 940    AHCSYR5     941 - 941
      AHCSYR6     942 - 942    AHCSYR7     943 - 943
      AHCSYR8     944 - 944    AHCSYR9     945 - 945
      AHCSYR10    946 - 946    AHERNOY2    947 - 948
      AERVISND    949 - 949    AERHOS      950 - 950
      AERREAS1    951 - 951    AERREAS2    952 - 952
      AERREAS3    953 - 953    AERREAS4    954 - 954
      AERREAS5    955 - 955    AERREAS6    956 - 956
      AERREAS7    957 - 957    AERREAS8    958 - 958
      AERREA1R    959 - 959    AERREA2R    960 - 960
      AERREA3R    961 - 961    AERREA4R    962 - 962
      AERREA5R    963 - 963    AERREA6R    964 - 964
      AERREA7R    965 - 965    AERREA8R    966 - 966
      AHCHYR      967 - 967    AHCHMOYR    968 - 969
      AHCHNOY2    970 - 971    AHCNOYR2    972 - 973
      ASRGYR      974 - 974    ASRGNOYR    975 - 976
      AMDLONGR    977 - 977    AVISLAST    978 - 978
      ALASTYP1    979 - 979    ALASTYP2    980 - 980
      ALASTYP3    981 - 981    ALASTYP4    982 - 982
      ALASTVRB $  983 - 997    AVISAPN2    998 - 999
      AVISAPT2   1000 -1000    AWAITRMN   1001 -1002
      AWAITRMT   1003 -1003    HIT1A      1004 -1004
      HIT2A      1005 -1005    HIT3A      1006 -1006
      HIT4A      1007 -1007    HIT5A      1008 -1008
      SHTFLU2    1009 -1009    ASHFLUM2   1010 -1011
      ASHFLUY2   1012 -1015    FLUSHPG1   1016 -1016
      FLUSHPG2   1017 -1017    SPRFLU2    1018 -1018
      ASPFLUM2   1019 -1020    ASPFLUY2   1021 -1024
      SHTPNUYR   1025 -1025    APOX       1026 -1026
      APOX12MO   1027 -1027    AHEP       1028 -1028
      AHEPLIV    1029 -1029    SHTHEPB    1030 -1030
      SHEPDOS    1031 -1031    SHTHEPA    1032 -1032
      SHEPANUM   1033 -1034    SHINGLES   1035 -1035
      SHTTD      1036 -1036    SHTTD05    1037 -1037
      SHTTDAP2   1038 -1038    HPVHRD     1039 -1039
      SHHPVHD1   1040 -1040    SHTHPV1    1041 -1041
      SHHPVDOS   1042 -1043    LIVEV      1044 -1044
      TRAVEL     1045 -1045    WRKHLTH2   1046 -1046
      WRKDIR     1047 -1047    APSBPCHK   1048 -1048
      APSCHCHK   1049 -1049    APSBSCHK   1050 -1050
      APSPAP     1051 -1051    APSMAM     1052 -1052
      APSCOL     1053 -1053    APSDIET    1054 -1054
      APSSMKC    1055 -1055    LTCFAM     1056 -1056
      LTCHELP    1057 -1057    LTCWHO1    1058 -1058
      LTCWHO2    1059 -1059    LTCWHO3    1060 -1060
      LTCWHO4    1061 -1061    LTCWHO5    1062 -1062
      AINDINS    1063 -1063    AINDPRCH   1064 -1064
      AINDWHO    1065 -1065    AINDDIF1   1066 -1066
      AINDDIF2   1067 -1067    AINDENY1   1068 -1068
      AINDENY2   1069 -1069    AINDENY3   1070 -1070
      AINDNOT1   1071 -1071    AINDNOT2   1072 -1072
      AINDNOT3   1073 -1073    AINDNOT4   1074 -1074
      AINDNOT5   1075 -1075    HIVTST1    1076 -1076


      /* AWB LOCATIONS */

      AWEBUSE    1077 -1077    AWEBOFNO   1078 -1080
      AWEBOFTP   1081 -1081    AWEBEML    1082 -1082
      AWEBMNO    1083 -1085    AWEBMTP    1086 -1086
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
      STRAT_P    ="Pseudo-stratum for public use file variance estimation"
      PSU_P      ="Pseudo-PSU for public use file variance estimation"

      /* HHC LABELS */

      SEX        ="Sex"
      HISPAN_I   ="Hispanic subgroup detail"
      RACERPI2   ="OMB groups w/multiple race"
      MRACRPI2   ="Race coded to single/multiple race group"
      MRACBPI2   ="Race coded to single/multiple race group"
      AGE_P      ="Age"

      /* FRT LABELS */

      AFD_FLG    ="Adult Functioning and Disability flag"

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
      HOURPDA    ="Paid by the hour at current or most recent job"
      PDSICKA    ="Paid sick leave at current or most recent job"
      ONEJOB     ="Have more than one job"
      WRKLYR4    ="Work status: last week, past 12 months"
      SCHOOLYR   ="Attended any kind of school, past 12 months"

      /* ACN LABELS */

      HYPEV      ="Ever been told you have hypertension"
      HYPDIFV    ="Ever had hypertension on 2+ visits"
      HYPYR      ="Had hypertension, past 12 months"
      CHDEV      ="Ever been told you had coronary heart disease"
      CHDYR      ="Had coronary heart disease, past 12 months"
      ANGEV      ="Ever been told you had angina pectoris"
      MIEV       ="Ever been told you had a heart attack"
      HRTEV      ="Ever been told you had a heart condition/disease"
      HRTYR      ="Had other heart condition, past 12 months"
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
      CHLEV      ="Ever told you had high cholesterol"
      CHLYR      ="Had high cholesterol, past 12 months"
      AFLUPNEV   ="Ever told you had influenza/pneumonia"
      AFLUPNYR   ="Had influenza/pneumonia, past 12 months"
      ASTREPEV   ="Ever told you had strep throat/tonsillitis"
      ASTREPYR   ="Had strep throat/tonsillitis, past 12 months"
      PRCIREV    ="Ever told you had poor circulation"
      PRCIRYR    ="Had poor circulation, past 12 months"
      UREV       ="Ever told you had urinary problems"
      URYR       ="Had urinary problems, past 12 months"
      PHOBIAEV   ="Ever told you had phobia or fears"
      PHOBIAYR   ="Had phobia or fears, past 12 months"
      ADDHYP1    ="Ever told you had ADD/ADHD"
      BIPDIS     ="Ever told you had Bipolar Disorder"
      ADEPRSEV   ="Ever told you had depression"
      ADEPRSYR   ="Had depression, past 12 months"
      MHDOTHEV   ="Ever told you had other mental health disorders"
      MHDOTHYR   ="Had mental health disorders, past 12 months"
      RESPALYR   ="Had respiratory allergy, past 12 months"
      DGSTALYR   ="Had digestive allergy, past 12 months"
      SKNALYR    ="Had eczema/skin allergy, past 12 months"
      OTHALYR    ="Had other allergy, past 12 months"
      ACIDRYR    ="Had acid reflux/heartburn, past 12 months"
      AFEVRYR    ="Had fever more than one day, past 12 months"
      ACOLDYR    ="Had head/chest cold, past 12 months"
      ANAUSYR    ="Had nausea/vomiting, past 12 months"
      ATHOTHYR   ="Had sore throat, past 12 months"
      IMMOTHYR   ="Had infectious diseases, past 12 months"
      AHEADYR    ="Had recurring headache, past 12 months"
      MEMLOSYR   ="Had memory loss, past 12 months"
      NEUROYR    ="Had neurological problems, past 12 months"
      AABDOMYR   ="Had abdominal pain, past 12 months"
      SPNYR      ="Had sprains/strains, past 12 months"
      DENYR      ="Had dental pain, past 12 months"
      AMUSCLYR   ="Had muscle/bone pain, past 12 months"
      APNOTHYR   ="Had other chronic pain, past 12 months"
      ALCTOBYR   ="Excessive alcohol/tobacco, past 12 months"
      SUBABYR    ="Substance abuse, past 12 months"
      AOVRWTYR   ="Had problems being overweight, past 12 months"
      SKNYR1     ="Skin problems, past 12 months"
      FATIGYR    ="Had fatigue/lack of energy, past 12 months"
      FATYR      ="Excessive sleepiness, past 12 months"
      INSYR      ="Insomnia, past 12 months"
      ANXNWYR    ="Frequently anxious, past 12 months"
      ASTRESYR   ="Frequently stressed, past 12 months"
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
      ARTHTYP1   ="Ever told you had arthritis"
      ARTHTYP2   ="Ever told you had rheumatoid arthritis"
      ARTHTYP3   ="Ever told you had gout"
      ARTHTYP4   ="Ever told you had lupus"
      ARTHTYP5   ="Ever told you had fibromyalgia"
      ARTHTYP6   ="Ever told you had other joint condition"
      PAINECK    ="Had neck pain, past 3 months"
      PAINLB     ="Had low back pain, past 3 months"
      PAINLEG    ="Pain spread down leg/below knees"
      PAINFACE   ="Had pain in jaw/front of ear, past 3 months"
      AMIGR      ="Had severe headache/migraine, past 3 m"
      ACOLD2W    ="Had a head/chest cold past 2 w"
      AINTIL2W   ="Had stomach prob w/vomit/diarrhea, 2 w"
      PREGNOW    ="Currently pregnant"
      PREGFLYR   ="Recently pregnant"
      MENSYR     ="Menstrual problems, past 12 months"
      MENOYR     ="Menopausal problems, past 12 months"
      GYNYR      ="Gynecological problems, past 12 months"
      PROSTYR    ="Prostate problems, past 12 months"
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

      /* ACD LABELS */

      VSLVYR     ="Voice problem past 12 months"
      VSLSWYR    ="Swallowing problem past 12 months"
      VSLSPYR    ="Speech problem past 12 months"
      VSLLGYR    ="Language problem past 12 months"
      VSLSPEC    ="Special services or instruction for problem(s)"
      VSLEVER    =
"Ever had voice, swallowing, speech, or language problem lasting 1+ weeks"
      VSLHPD     =
"Given diagnosis for voice, swallowing, speech, language problem"
      VSLDGTP1   ="Given diagnosis for voice problem"
      VSLDGTP2   ="Given diagnosis for swallowing problem"
      VSLDGTP3   ="Given diagnosis for speech problem"
      VSLDGTP4   ="Given diagnosis for language problem"
      VSLVDG01   =
"Laryngitis caused by voice misuse, abuse, overuse caused voice problem"
      VSLVDG02   ="Laryngitis caused by colds/strep caused voice problem"
      VSLVDG03   ="Vocal nodules or polyps caused voice problem"
      VSLVDG04   ="Gastro-esophageal reflux disease (GERD) caused voice problem"
      VSLVDG05   ="Allergies caused voice problem"
      VSLVDG06   =
"Airborne irritants or environmental pollutants caused voice problem"
      VSLVDG07   ="Head/neck injury caused voice problem"
      VSLVDG08   =
"Cancer anywhere in the head, neck, or throat caused voice problem"
      VSLVDG09   =
"Neurological cause (Alzheimer's, Parkinson's, dementia, etc.) caused voice prob
lem"
      VSLVDG10   ="Prescription medication or drugs caused voice problem"
      VSLVDG11   ="Something else caused voice problem"
      VSLSWD01   ="Stroke caused swallowing problem"
      VSLSWD02   =
"Neurological cause (Alzheimer's, Parkinson's, post-polio syndrome, dementia, et
c.) caused swallowing problem"
      VSLSWD03   =
"Cancer anywhere in the head, neck, or throat caused swallowing problem"
      VSLSWD04   =
"Chronic obstructive pulmonary disease (COPD) caused swallowing problem"
      VSLSWD05   ="Congestive heart failure (CHF) caused swallowing problem"
      VSLSWD06   ="Head/neck injury caused swallowing problem"
      VSLSWD07   =
"Arthritic changes in the neck (arthritis, cervical osteophyte) caused swallowin
g problem"
      VSLSWD08   =
"Advancing age (deterioration of muscle function with age…sarcopenia) caused swa
llowing problem"
      VSLSWD09   ="Prescription medication or drugs caused swallowing problem"
      VSLSWD10   ="Something else caused swallowing problem"
      VSLSPD01   ="Hearing loss or deafness caused speech problem"
      VSLSPD02   =
"Developmental speech sound disorder (phonological, articulatory, dyspraxia) cau
sed speech problem"
      VSLSPD03   ="Cerebral palsy caused speech problem"
      VSLSPD04   =
"Cleft lip/palate, cranial-facial anomaly (structural cause) caused speech probl
em"
      VSLSPD05   ="Head/neck injury caused speech problem"
      VSLSPD06   ="Stuttering caused speech problem"
      VSLSPD07   =
"Cancer anywhere in the head, neck, or throat caused speech problem"
      VSLSPD08   =
"Neurological cause/dysarthria (Alzheimer's, Parkinson's, ALS, multiple sclerosi
s, dementia, etc.) caused speech problem"
      VSLSPD09   ="Prescription medication or drugs caused speech problem"
      VSLSPD10   ="Something else caused speech problem"
      VSLLGD01   =
"Hearing loss or deafness caused problems using or understanding words or senten
ces"
      VSLLGD02   =
"Genetic syndrome: Down Syndrome, Fragile X Syndrome, etc. cause problems using 
or understanding words or sentences"
      VSLLGD03   =
"Intellectual disability, also known as mental retardation caused problem using 
or understanding words or sentences"
      VSLLGD04   =
"Autism spectrum disorder caused problem using or understanding words or sentenc
es"
      VSLLGD05   =
"Developmental Language-Learning Disorder (e.g. Specific Language Impairment (SL
I), learning disability, or dyslexia) cause problem using or understanding words
 or sentences"
      VSLLGD06   =
"Other developmental delay caused problem using or understanding words or senten
ces"
      VSLLGD07   =
"Head injury, traumatic brain injury (TBI) caused problem using or understanding
 words or sentences"
      VSLLGD08   =
"Stroke/aphasia caused problem using or understanding words or sentences"
      VSLLGD09   =
"Dementia or other neurological cause (Alzheimer's, Parkinson's, etc.) caused pr
oblem using or understanding words or sentences"
      VSLLGD10   =
"Prescription medication or drugs caused problem using or understanding words or
 sentences"
      VSLLGD11   =
"Something else caused problem using or understanding words or sentences"
      VSLVDYS    ="Number of days had voice problems in past year"
      VSLSWDYS   ="Number of days had swallowing problems in past year"
      VSLSPDYS   ="Number of days had speech problems in past year"
      VSLLGDYS   =
"Number of days had problems using or understanding words or sentences"
      VSLV1WK    ="Voice problems last 1+ weeks"
      VSLSW1WK   ="Swallowing problems last 1+ weeks"
      VSLSP1WK   ="Speech problems last 1+ weeks"
      VSLLG1WK   =
"Problems using or understanding words or sentences last 1+ weeks"
      VSLSTUTT   ="Stammering or stuttering problem in past 12 months"
      VSLSTDEG   ="Degree of stammering or stuttering problem"
      VSLLGFAM   =
"Family, friends, associates had trouble understanding what you say in past 12 m
onths"
      VSLVAGE    ="Age first had voice problems"
      VSLSWAGE   ="Age first had swallowing problems"
      VSLSPAGE   ="Age first had speech problems"
      VSLLGAGE   =
"Age first had problems using or understanding words or sentences"
      VSLVPRB    ="How much of a problem with your voice in past 12 months"
      VSLSWPRB   ="How much of a problem with swallowing in past 12 months"
      VSLSPPRB   ="How much of a problem with speech in the past 12 months"
      VSLLGPRB   =
"How much of a problem using or understanding words or sentences in the past 12 
months"
      VSLVSLP    =
"Seen speech-language pathologist (SLP) or other health care professional for vo
ice problem in past 12 months"
      VSLVPEV    =
"Ever seen speech-language pathologist (SLP) or other health care professional a
bout voice problem?"
      VSLSWSLP   =
"Seen speech-language pathologist (SLP) or other health care professional for sw
allowing problem in past 12 months"
      VSLSWPEV   =
"Ever seen speech-language pathologist (SLP) or other health care professional a
bout swallowing  problem?"
      VSLSPSLP   =
"Seen speech-language pathologist (SLP) or other health professional for speech 
problem in past 12 months"
      VSLSPPEV   =
"Ever seen speech-language pathologist (SLP) or other health care professional a
bout speech problem in past 12 months"
      VSLLGSLP   =
"Seen speech-language pathologist (SLP) or other health care professional for pr
oblem using or understanding words or sentences in past 12 months"
      VSLLGPEV   =
"Ever seen speech-language pathologist (SLP) or other health care professional a
bout problem using or understanding words or sentences in past 12 months"
      VSLVTRT    =
"Received treatments, therapy, or other rehabilitation services for voice proble
ms in past 12 months"
      VSLVTR01   ="Speech-language pathologist provided voice services"
      VSLVTR02   =
"Family physician, General Practitioner, or Osteopath provided voice services"
      VSLVTR03   =
"Rehabilitation Specialist (Occupational or Physical Therapist) provided voices 
services"
      VSLVTR04   =
"Ear, Nose, Throat Doctor (Otolaryngologist) provided voice services"
      VSLVTR05   =
"Audiologist, Hearing Specialist, or Hearing Aid Technician provided voice servi
ces"
      VSLVTR06   =
"Specialty doctor in Internal Medicine, Geriatrics, Neurology, etc. provided voi
ce services"
      VSLVTR07   ="Nutritionist or Dietician provided voice services"
      VSLVTR08   ="Psychiatrist or Psychologist provided voice services"
      VSLVTR09   ="Nurse or Nurse Practitioner provided voice services"
      VSLVTR10   =
"Dentist, Orthodontist, or Oral Surgeon provided voice services"
      VSLVTR11   ="Some other health professional provided voice services"
      VSLSWTRT   =
"Received treatments, therapy, or other rehabilitation services for swallowing p
roblems in past 12 months"
      VSLSWT01   ="Speech-language pathologist provided swallowing services"
      VSLSWT02   =
"Family physician, General Practitioner, or Osteopath provided swallowing servic
es"
      VSLSWT03   =
"Rehabilitation Specialist (Occupational or Physical Therapist) provided swallow
ing services"
      VSLSWT04   =
"Ear, Nose, Throat Doctor (Otolaryngologist) provided swallowing services"
      VSLSWT05   =
"Audiologist, Hearing Specialist, or Hearing Aid Technician provided swallowing 
services"
      VSLSWT06   =
"Specialty doctor in Internal Medicine, Geriatrics, Neurology, etc. provided swa
llowing services"
      VSLSWT07   ="Nutritionist or Dietician provided swallowing services"
      VSLSWT08   ="Psychiatrist or Psychologist provided swallowing services"
      VSLSWT09   ="Nurse or Nurse Practitioner provided swallowing services"
      VSLSWT10   =
"Dentist, Orthodontist, or Oral Surgeon provided swallowing services"
      VSLSWT11   ="Some other health professional provided swallowing services"
      VSLSPTRT   =
"Received treatments, therapy, or other rehabilitation services for speech probl
ems in past 12 months"
      VSLSPT01   ="Speech-language pathologist provided speech services"
      VSLSPT02   =
"Family physician, General Practitioner, or Osteopath provided speech services"
      VSLSPT03   =
"Rehabilitation Specialist (Occupational or Physical Therapist) provided speech 
services"
      VSLSPT04   =
"Ear, Nose, Throat Doctor (Otolaryngologist) provided speech services"
      VSLSPT05   =
"Audiologist, Hearing Specialist, or Hearing Aid Technician provided speech serv
ices"
      VSLSPT06   =
"Specialty doctor in Internal Medicine, Geriatrics, Neurology, etc. provided spe
ech services"
      VSLSPT07   ="Nutritionist or Dietician provided speech services"
      VSLSPT08   ="Psychiatrist or Psychologist provided speech services"
      VSLSPT09   ="Nurse or Nurse Practitioner provided speech services"
      VSLSPT10   =
"Dentist, Orthodontist, or Oral Surgeon provided speech services"
      VSLSPT11   ="Some other health professional provided speech services"
      VSLLGTRT   =
"Received treatments, therapy, or other rehabilitation services for problems usi
ng or understanding words or sentences in past 12 months"
      VSLLGT01   ="Speech-language pathologist provided  language services"
      VSLLGT02   =
"Family physician, General Practitioner, or Osteopath provided language services
"
      VSLLGT03   =
"Rehabilitation Specialist (Occupational or Physical Therapist) provided languag
e services"
      VSLLGT04   =
"Ear, Nose, Throat Doctor (Otolaryngologist) provided language services"
      VSLLGT05   =
"Audiologist, Hearing Specialist, or Hearing Aid Technician provided language se
rvices"
      VSLLGT06   =
"Specialty doctor in Internal Medicine, Geriatrics, Neurology, etc. provided lan
guage services"
      VSLLGT07   ="Nutritionist or Dietician provided language services"
      VSLLGT08   ="Psychiatrist or Psychologist provided language services"
      VSLLGT09   ="Nurse or Nurse Practitioner provided language services"
      VSLLGT10   =
"Dentist, Orthodontist, or Oral Surgeon provided language services"
      VSLLGT11   ="Some other health professional provided language services"
      VSLVSOC    =
"Did treatments or other rehabilitation services for voice problem make personal
 or social life better?"
      VSLSWSOC   =
"Did treatments or other rehabilitation services for swallowing problem make per
sonal or social life better?"
      VSLSPSOC   =
"Did treatments or other rehabilitation services for speech problem make persona
l or social life better?"
      VSLLGSOC   =
"Did treatments or other rehabilitation services for problem using or understand
ing words or sentences make personal or social life better?"
      VSLVSW     =
"Did treatments or other rehabilitation services for voice problem make school o
r work life better?"
      VSLSWSW    =
"Did treatments or other rehabilitation services for swallowing problem make sch
ool or work life better?"
      VSLSPSW    =
"Did treatments or other rehabilitation services for speech problem make school 
or work life better?"
      VSLLGSW    =
"Did treatments or other rehabilitation services for problems using or understan
ding words or sentences make school or work life better?"
      VSLVCOM    ="Voice problems better or worse compared to 12 months ago"
      VSLSWCOM   ="Swallowing problems better or worse compared to 12 months ago
"
      VSLSPCOM   ="Speech problems better or worse compared to 12 months ago"
      VSLLGCOM   =
"Problems using or understanding words or sentences better or worse compared to 
12 months ago"
      VSLINTYR   =
"Get information from Internet about health, medical treatments or rehabilitatio
n services in past 12 months"
      VSLINTCN   =
"Did you get information on (voice/swallowing/speech/problems using or understan
ding words or sentences problems in the past 12 months"
      VSLINTPR   =
"Was this information written by a doctor, other health professional, medical as
sociations, or other health-related organization?"
      VSLINTHP   ="How helpful was the information on the Internet?"

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
      OTHCIGEV   ="Ever smoked tobacco products, OTHER than cigarettes"
      OTHCIGED   =
"Smoke freq: everyday/some days/rarely/not at all (other than cigarettes)"
      SMKLESEV   ="Ever used smokeless tobacco products"
      SMKLESED   ="Smokeless tobacco freq: everyday/some days/rarely/not at all"
      TOBLASYR   ="Using any tobacco product, around this time last year"
      TOBQTYR    ="Tried quit all tobacco products 1+ days, past 12 m"
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
      AHCAFYR5   ="Couldn't afford to see a specialist, past 12 m"
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
      AERREAS1   ="ER visit because didn't have another place to go"
      AERREAS2   ="ER visit because doctors office or clinic was not open"
      AERREAS3   ="ER visit because advised by health provider to go"
      AERREAS4   =
"ER visit because problem too serious for doctor's office/clinic"
      AERREAS5   ="ER visit because only hospital could help"
      AERREAS6   ="ER visit because it is closest provider"
      AERREAS7   ="ER visit because it is usual place to get care"
      AERREAS8   ="Arrived at ER by ambulance/other emergency vehicle"
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
      ASRGNOYR   ="# of surgeries, past 12 m"
      AMDLONGR   ="Time since last seen/talked to health professional"
      AVISLAST   ="Place of last medical visit"
      ALASTYP1   ="General doctor seen on last visit"
      ALASTYP2   ="Specialist seen on last visit"
      ALASTYP3   ="Nurse practitioner/physician assistant seen on last visit"
      ALASTYP4   ="Other health provider seen on last visit"
      ALASTVRB   ="Other Health professional seen (verbatim)"
      AVISAPN2   ="Appointment wait time-number"
      AVISAPT2   ="Appointment wait time-time period"
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
      FLUSHPG1   =
"Flu shot before/during your current pregnancy, interviewed Jan-Mar or Aug-Dec, 
2012"
      FLUSHPG2   ="Flu shot before/during/after a pregnancy"
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
      SHTTDAP2   ="Vaccine included pertussis/whooping cough"
      HPVHRD     ="Ever heard of HPV"
      SHHPVHD1   ="Ever heard of HPV vaccines or shots"
      SHTHPV1    ="Ever received HPV shot/vaccine"
      SHHPVDOS   ="Number of HPV shots received"
      LIVEV      =
"Ever told you had any kind of chronic/long-term liver condition"
      TRAVEL     =
"Ever traveled outside USA since 1995 (Excluding Europe, Japan, Australia, New Z
ealand, and Canada)"
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
      LTCFAM     ="Have family member who needed ADL help for 1+ yrs"
      LTCHELP    ="How likely you will need ADL help"
      LTCWHO1    ="Family would provide ADL help"
      LTCWHO2    ="Hire someone to provide ADL help"
      LTCWHO3    ="Home health care organization would provide ADL help"
      LTCWHO4    ="Nursing home/assisted living would provide ADL help"
      LTCWHO5    ="Other would provide ADL help"
      AINDINS    ="Tried to purchase health insurance directly, past 3 yrs"
      AINDPRCH   ="Purchased health insurance directly, past 3 yrs"
      AINDWHO    ="For whom was health insurance purchased, past 3 yrs"
      AINDDIF1   =
"How difficult to find health insurance for coverage needed, past 3 yrs"
      AINDDIF2   ="How difficult to find affordable health insurance, past 3 yrs
"
      AINDENY1   ="Turned down for coverage, past 3 yrs"
      AINDENY2   =
"Charged higher price for coverage because of health, past 3 yrs"
      AINDENY3   ="Specific health problem excluded from coverage, past 3 yrs"
      AINDNOT1   ="Didn’t buy plan because turned down"
      AINDNOT2   ="Didn’t buy plan because of cost"
      AINDNOT3   ="Didn’t buy plan because of pre-existing condition"
      AINDNOT4   =
"Didn’t buy plan because got health insurance from other source"
      AINDNOT5   ="Other reason didn't buy plan"
      HIVTST1    ="Ever been tested for HIV"

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

      /* FRT FORMAT ASSOCIATIONS */

      AFD_FLG   SAP019X.

      /* FID FORMAT ASSOCIATIONS */

      R_MARITL  SAP020X.

      /* AID FORMAT ASSOCIATIONS */

      PROXYSA   SAP021X.   PROX1     SAP022X.   PROX2     SAP023X.
      LATEINTA  SAP024X.

      /* FDB FORMAT ASSOCIATIONS */

      FDRN_FLG  SAP025X.

      /* ASD FORMAT ASSOCIATIONS */

      DOINGLWA  SAP026X.   WHYNOWKA  SAP027X.   EVERWRK   SAP028X.
      INDSTRN1  SAP029X.   INDSTRN2  SAP029X.   OCCUPN1   SAP031X.
      OCCUPN2   SAP031X.   WRKCATA   SAP033X.   BUSINC1A  SAP028X.
      LOCALL1A  SAP035X.   YRSWRKPA  SAP036X.   WRKLONGH  SAP028X.
      HOURPDA   SAP028X.   PDSICKA   SAP028X.   ONEJOB    SAP028X.
      WRKLYR4   SAP041X.   SCHOOLYR  SAP028X.

      /* ACN FORMAT ASSOCIATIONS */

      HYPEV     SAP028X.   HYPDIFV   SAP028X.   HYPYR     SAP028X.
      CHDEV     SAP028X.   CHDYR     SAP028X.   ANGEV     SAP028X.
      MIEV      SAP028X.   HRTEV     SAP028X.   HRTYR     SAP028X.
      STREV     SAP028X.   EPHEV     SAP028X.   COPDEV    SAP028X.
      ASPMEDEV  SAP028X.   ASPMEDAD  SAP028X.   ASPMDMED  SAP028X.
      ASPONOWN  SAP028X.   AASMEV    SAP028X.   AASSTILL  SAP028X.
      AASMYR    SAP028X.   AASERYR1  SAP028X.   ULCEV     SAP028X.
      ULCYR     SAP028X.   CHLEV     SAP028X.   CHLYR     SAP028X.
      AFLUPNEV  SAP028X.   AFLUPNYR  SAP028X.   ASTREPEV  SAP028X.
      ASTREPYR  SAP028X.   PRCIREV   SAP028X.   PRCIRYR   SAP028X.
      UREV      SAP028X.   URYR      SAP028X.   PHOBIAEV  SAP028X.
      PHOBIAYR  SAP028X.   ADDHYP1   SAP028X.   BIPDIS    SAP028X.
      ADEPRSEV  SAP028X.   ADEPRSYR  SAP028X.   MHDOTHEV  SAP028X.
      MHDOTHYR  SAP028X.   RESPALYR  SAP028X.   DGSTALYR  SAP028X.
      SKNALYR   SAP028X.   OTHALYR   SAP028X.   ACIDRYR   SAP028X.
      AFEVRYR   SAP028X.   ACOLDYR   SAP028X.   ANAUSYR   SAP028X.
      ATHOTHYR  SAP028X.   IMMOTHYR  SAP028X.   AHEADYR   SAP028X.
      MEMLOSYR  SAP028X.   NEUROYR   SAP028X.   AABDOMYR  SAP028X.
      SPNYR     SAP028X.   DENYR     SAP028X.   AMUSCLYR  SAP028X.
      APNOTHYR  SAP028X.   ALCTOBYR  SAP028X.   SUBABYR   SAP028X.
      AOVRWTYR  SAP028X.   SKNYR1    SAP028X.   FATIGYR   SAP028X.
      FATYR     SAP028X.   INSYR     SAP028X.   ANXNWYR   SAP028X.
      ASTRESYR  SAP028X.   CANEV     SAP028X.   CNKIND1   SAP111X.
      CNKIND2   SAP111X.   CNKIND3   SAP111X.   CNKIND4   SAP111X.
      CNKIND5   SAP111X.   CNKIND6   SAP111X.   CNKIND7   SAP111X.
      CNKIND8   SAP111X.   CNKIND9   SAP111X.   CNKIND10  SAP111X.
      CNKIND11  SAP111X.   CNKIND12  SAP111X.   CNKIND13  SAP111X.
      CNKIND14  SAP111X.   CNKIND15  SAP111X.   CNKIND16  SAP111X.
      CNKIND17  SAP111X.   CNKIND18  SAP111X.   CNKIND19  SAP111X.
      CNKIND20  SAP111X.   CNKIND21  SAP111X.   CNKIND22  SAP111X.
      CNKIND23  SAP111X.   CNKIND24  SAP111X.   CNKIND25  SAP111X.
      CNKIND26  SAP111X.   CNKIND27  SAP111X.   CNKIND28  SAP111X.
      CNKIND29  SAP111X.   CNKIND30  SAP111X.   CNKIND31  SAP111X.
      CANAGE1   SAP142X.   CANAGE2   SAP142X.   CANAGE3   SAP142X.
      CANAGE4   SAP142X.   CANAGE5   SAP142X.   CANAGE6   SAP142X.
      CANAGE7   SAP142X.   CANAGE8   SAP142X.   CANAGE9   SAP142X.
      CANAGE10  SAP142X.   CANAGE11  SAP142X.   CANAGE12  SAP142X.
      CANAGE13  SAP142X.   CANAGE14  SAP142X.   CANAGE15  SAP142X.
      CANAGE16  SAP142X.   CANAGE17  SAP142X.   CANAGE18  SAP142X.
      CANAGE19  SAP142X.   CANAGE20  SAP142X.   CANAGE21  SAP142X.
      CANAGE22  SAP142X.   CANAGE23  SAP142X.   CANAGE24  SAP142X.
      CANAGE25  SAP142X.   CANAGE26  SAP142X.   CANAGE27  SAP142X.
      CANAGE28  SAP142X.   CANAGE29  SAP142X.   CANAGE30  SAP142X.
      DIBEV     SAP172X.   DIBPRE1   SAP028X.   DIBAGE    SAP142X.
      DIFAGE2   SAP175X.   INSLN     SAP028X.   DIBPILL   SAP028X.
      AHAYFYR   SAP028X.   SINYR     SAP028X.   CBRCHYR   SAP028X.
      KIDWKYR   SAP028X.   LIVYR     SAP028X.   JNTSYMP   SAP028X.
      JMTHP1    SAP111X.   JMTHP2    SAP111X.   JMTHP3    SAP111X.
      JMTHP4    SAP111X.   JMTHP5    SAP111X.   JMTHP6    SAP111X.
      JMTHP7    SAP111X.   JMTHP8    SAP111X.   JMTHP9    SAP111X.
      JMTHP10   SAP111X.   JMTHP11   SAP111X.   JMTHP12   SAP111X.
      JMTHP13   SAP111X.   JMTHP14   SAP111X.   JMTHP15   SAP111X.
      JMTHP16   SAP111X.   JMTHP17   SAP111X.   JNTCHR    SAP028X.
      JNTHP     SAP028X.   ARTH1     SAP028X.   ARTHLMT   SAP028X.
      ARTHTYP1  SAP111X.   ARTHTYP2  SAP111X.   ARTHTYP3  SAP111X.
      ARTHTYP4  SAP111X.   ARTHTYP5  SAP111X.   ARTHTYP6  SAP111X.
      PAINECK   SAP028X.   PAINLB    SAP028X.   PAINLEG   SAP028X.
      PAINFACE  SAP028X.   AMIGR     SAP028X.   ACOLD2W   SAP028X.
      AINTIL2W  SAP028X.   PREGNOW   SAP028X.   PREGFLYR  SAP028X.
      MENSYR    SAP028X.   MENOYR    SAP028X.   GYNYR     SAP028X.
      PROSTYR   SAP028X.   HRAIDNOW  SAP028X.   HRAIDEV   SAP028X.
      AHEARST1  SAP226X.   AVISION   SAP028X.   ABLIND    SAP028X.
      LUPPRT    SAP028X.   SAD       SAP230X.   NERVOUS   SAP230X.
      RESTLESS  SAP230X.   HOPELESS  SAP230X.   EFFORT    SAP230X.
      WORTHLS   SAP230X.   MHAMTMO   SAP236X.

      /* ACD FORMAT ASSOCIATIONS */

      VSLVYR    SAP028X.   VSLSWYR   SAP028X.   VSLSPYR   SAP028X.
      VSLLGYR   SAP028X.   VSLSPEC   SAP028X.   VSLEVER   SAP028X.
      VSLHPD    SAP028X.   VSLDGTP1  SAP111X.   VSLDGTP2  SAP111X.
      VSLDGTP3  SAP111X.   VSLDGTP4  SAP111X.   VSLVDG01  SAP111X.
      VSLVDG02  SAP111X.   VSLVDG03  SAP111X.   VSLVDG04  SAP111X.
      VSLVDG05  SAP111X.   VSLVDG06  SAP111X.   VSLVDG07  SAP111X.
      VSLVDG08  SAP111X.   VSLVDG09  SAP111X.   VSLVDG10  SAP111X.
      VSLVDG11  SAP111X.   VSLSWD01  SAP111X.   VSLSWD02  SAP111X.
      VSLSWD03  SAP111X.   VSLSWD04  SAP111X.   VSLSWD05  SAP111X.
      VSLSWD06  SAP111X.   VSLSWD07  SAP111X.   VSLSWD08  SAP111X.
      VSLSWD09  SAP111X.   VSLSWD10  SAP111X.   VSLSPD01  SAP111X.
      VSLSPD02  SAP111X.   VSLSPD03  SAP111X.   VSLSPD04  SAP111X.
      VSLSPD05  SAP111X.   VSLSPD06  SAP111X.   VSLSPD07  SAP111X.
      VSLSPD08  SAP111X.   VSLSPD09  SAP111X.   VSLSPD10  SAP111X.
      VSLLGD01  SAP111X.   VSLLGD02  SAP111X.   VSLLGD03  SAP111X.
      VSLLGD04  SAP111X.   VSLLGD05  SAP111X.   VSLLGD06  SAP111X.
      VSLLGD07  SAP111X.   VSLLGD08  SAP111X.   VSLLGD09  SAP111X.
      VSLLGD10  SAP111X.   VSLLGD11  SAP111X.   VSLVDYS   SAP290X.
      VSLSWDYS  SAP290X.   VSLSPDYS  SAP290X.   VSLLGDYS  SAP290X.
      VSLV1WK   SAP028X.   VSLSW1WK  SAP028X.   VSLSP1WK  SAP028X.
      VSLLG1WK  SAP028X.   VSLSTUTT  SAP028X.   VSLSTDEG  SAP299X.
      VSLLGFAM  SAP300X.   VSLVAGE   SAP290X.   VSLSWAGE  SAP290X.
      VSLSPAGE  SAP290X.   VSLLGAGE  SAP290X.   VSLVPRB   SAP305X.
      VSLSWPRB  SAP305X.   VSLSPPRB  SAP305X.   VSLLGPRB  SAP305X.
      VSLVSLP   SAP028X.   VSLVPEV   SAP028X.   VSLSWSLP  SAP028X.
      VSLSWPEV  SAP028X.   VSLSPSLP  SAP028X.   VSLSPPEV  SAP028X.
      VSLLGSLP  SAP028X.   VSLLGPEV  SAP028X.   VSLVTRT   SAP028X.
      VSLVTR01  SAP111X.   VSLVTR02  SAP111X.   VSLVTR03  SAP111X.
      VSLVTR04  SAP111X.   VSLVTR05  SAP111X.   VSLVTR06  SAP111X.
      VSLVTR07  SAP111X.   VSLVTR08  SAP111X.   VSLVTR09  SAP111X.
      VSLVTR10  SAP111X.   VSLVTR11  SAP111X.   VSLSWTRT  SAP028X.
      VSLSWT01  SAP111X.   VSLSWT02  SAP111X.   VSLSWT03  SAP111X.
      VSLSWT04  SAP111X.   VSLSWT05  SAP111X.   VSLSWT06  SAP111X.
      VSLSWT07  SAP111X.   VSLSWT08  SAP111X.   VSLSWT09  SAP111X.
      VSLSWT10  SAP111X.   VSLSWT11  SAP111X.   VSLSPTRT  SAP028X.
      VSLSPT01  SAP111X.   VSLSPT02  SAP111X.   VSLSPT03  SAP111X.
      VSLSPT04  SAP111X.   VSLSPT05  SAP111X.   VSLSPT06  SAP111X.
      VSLSPT07  SAP111X.   VSLSPT08  SAP111X.   VSLSPT09  SAP111X.
      VSLSPT10  SAP111X.   VSLSPT11  SAP111X.   VSLLGTRT  SAP028X.
      VSLLGT01  SAP111X.   VSLLGT02  SAP111X.   VSLLGT03  SAP111X.
      VSLLGT04  SAP111X.   VSLLGT05  SAP111X.   VSLLGT06  SAP111X.
      VSLLGT07  SAP111X.   VSLLGT08  SAP111X.   VSLLGT09  SAP111X.
      VSLLGT10  SAP111X.   VSLLGT11  SAP111X.   VSLVSOC   SAP028X.
      VSLSWSOC  SAP028X.   VSLSPSOC  SAP028X.   VSLLGSOC  SAP028X.
      VSLVSW    SAP028X.   VSLSWSW   SAP028X.   VSLSPSW   SAP028X.
      VSLLGSW   SAP028X.   VSLVCOM   SAP373X.   VSLSWCOM  SAP373X.
      VSLSPCOM  SAP373X.   VSLLGCOM  SAP373X.   VSLINTYR  SAP300X.
      VSLINTCN  SAP300X.   VSLINTPR  SAP300X.   VSLINTHP  SAP380X.

      /* AHS FORMAT ASSOCIATIONS */

      WKDAYR    SAP381X.   BEDDAYR   SAP381X.   AHSTATYR  SAP373X.
      SPECEQ    SAP028X.   FLWALK    SAP385X.   FLCLIMB   SAP385X.
      FLSTAND   SAP385X.   FLSIT     SAP385X.   FLSTOOP   SAP385X.
      FLREACH   SAP385X.   FLGRASP   SAP385X.   FLCARRY   SAP385X.
      FLPUSH    SAP385X.   FLSHOP    SAP385X.   FLSOCL    SAP385X.
      FLRELAX   SAP385X.   FLA1AR    SAP397X.   AFLHCA1   SAP111X.
      AFLHCA2   SAP111X.   AFLHCA3   SAP111X.   AFLHCA4   SAP111X.
      AFLHCA5   SAP111X.   AFLHCA6   SAP111X.   AFLHCA7   SAP111X.
      AFLHCA8   SAP111X.   AFLHCA9   SAP111X.   AFLHCA10  SAP111X.
      AFLHCA11  SAP111X.   AFLHCA12  SAP111X.   AFLHCA13  SAP111X.
      ALHCA14A  SAP111X.   AFLHCA15  SAP111X.   AFLHCA16  SAP111X.
      AFLHCA17  SAP111X.   AFLHCA18  SAP111X.   AFLHC19_  SAP111X.
      AFLHC20_  SAP111X.   AFLHC21_  SAP111X.   AFLHC22_  SAP111X.
      AFLHC23_  SAP111X.   AFLHC24_  SAP111X.   AFLHC25_  SAP111X.
      AFLHC26_  SAP111X.   AFLHC27_  SAP111X.   AFLHC28_  SAP111X.
      AFLHC29_  SAP111X.   AFLHC30_  SAP111X.   AFLHC31_  SAP111X.
      AFLHC32_  SAP111X.   AFLHC33_  SAP111X.   AFLHC34_  SAP111X.
      AFLHCA90  SAP111X.   AFLHCA91  SAP111X.   ALTIME1   SAP434X.
      ALUNIT1   SAP435X.   ALDURA1   SAP436X.   ALDURB1   SAP437X.
      ALCHRC1   SAP438X.   ALTIME2   SAP434X.   ALUNIT2   SAP435X.
      ALDURA2   SAP436X.   ALDURB2   SAP437X.   ALCHRC2   SAP438X.
      ALTIME3   SAP434X.   ALUNIT3   SAP435X.   ALDURA3   SAP436X.
      ALDURB3   SAP437X.   ALCHRC3   SAP438X.   ALTIME4   SAP434X.
      ALUNIT4   SAP435X.   ALDURA4   SAP436X.   ALDURB4   SAP437X.
      ALCHRC4   SAP438X.   ALTIME5   SAP434X.   ALUNIT5   SAP435X.
      ALDURA5   SAP436X.   ALDURB5   SAP437X.   ALCHRC5   SAP438X.
      ALTIME6   SAP434X.   ALUNIT6   SAP435X.   ALDURA6   SAP436X.
      ALDURB6   SAP437X.   ALCHRC6   SAP438X.   ALTIME7   SAP434X.
      ALUNIT7   SAP435X.   ALDURA7   SAP436X.   ALDURB7   SAP437X.
      ALCHRC7   SAP438X.   ALTIME8   SAP434X.   ALUNIT8   SAP435X.
      ALDURA8   SAP436X.   ALDURB8   SAP437X.   ALCHRC8   SAP438X.
      ALTIME9   SAP434X.   ALUNIT9   SAP435X.   ALDURA9   SAP436X.
      ALDURB9   SAP437X.   ALCHRC9   SAP438X.   ALTIME10  SAP434X.
      ALUNIT10  SAP435X.   ALDURA10  SAP436X.   ALDURB10  SAP437X.
      ALCHRC10  SAP438X.   ALTIME11  SAP434X.   ALUNIT11  SAP435X.
      ALDURA11  SAP436X.   ALDURB11  SAP437X.   ALCHRC11  SAP438X.
      ALTIME12  SAP434X.   ALUNIT12  SAP435X.   ALDURA12  SAP436X.
      ALDURB12  SAP437X.   ALCHRC12  SAP438X.   ALTIME13  SAP434X.
      ALUNIT13  SAP435X.   ALDURA13  SAP436X.   ALDURB13  SAP437X.
      ALCHRC13  SAP438X.   ATIME14A  SAP434X.   AUNIT14A  SAP435X.
      ADURA14A  SAP436X.   ADURB14A  SAP437X.   ACHRC14A  SAP438X.
      ALTIME15  SAP434X.   ALUNIT15  SAP435X.   ALDURA15  SAP436X.
      ALDURB15  SAP437X.   ALCHRC15  SAP438X.   ALTIME16  SAP434X.
      ALUNIT16  SAP435X.   ALDURA16  SAP436X.   ALDURB16  SAP437X.
      ALCHRC16  SAP438X.   ALTIME17  SAP434X.   ALUNIT17  SAP435X.
      ALDURA17  SAP436X.   ALDURB17  SAP437X.   ALCHRC17  SAP438X.
      ALTIME18  SAP434X.   ALUNIT18  SAP435X.   ALDURA18  SAP436X.
      ALDURB18  SAP437X.   ALCHRC18  SAP438X.   ALTIME19  SAP434X.
      ALUNIT19  SAP435X.   ALDURA19  SAP436X.   ALDURB19  SAP437X.
      ALCHRC19  SAP438X.   ALTIME20  SAP434X.   ALUNIT20  SAP435X.
      ALDURA20  SAP436X.   ALDURB20  SAP437X.   ALCHRC20  SAP438X.
      ALTIME21  SAP434X.   ALUNIT21  SAP435X.   ALDURA21  SAP436X.
      ALDURB21  SAP437X.   ALCHRC21  SAP438X.   ALTIME22  SAP434X.
      ALUNIT22  SAP435X.   ALDURA22  SAP436X.   ALDURB22  SAP437X.
      ALCHRC22  SAP438X.   ALTIME23  SAP434X.   ALUNIT23  SAP435X.
      ALDURA23  SAP436X.   ALDURB23  SAP437X.   ALCHRC23  SAP438X.
      ALTIME24  SAP434X.   ALUNIT24  SAP435X.   ALDURA24  SAP436X.
      ALDURB24  SAP437X.   ALCHRC24  SAP438X.   ALTIME25  SAP434X.
      ALUNIT25  SAP435X.   ALDURA25  SAP436X.   ALDURB25  SAP437X.
      ALCHRC25  SAP438X.   ALTIME26  SAP434X.   ALUNIT26  SAP435X.
      ALDURA26  SAP436X.   ALDURB26  SAP437X.   ALCHRC26  SAP438X.
      ALTIME27  SAP434X.   ALUNIT27  SAP435X.   ALDURA27  SAP436X.
      ALDURB27  SAP437X.   ALCHRC27  SAP438X.   ALTIME28  SAP434X.
      ALUNIT28  SAP435X.   ALDURA28  SAP436X.   ALDURB28  SAP437X.
      ALCHRC28  SAP438X.   ALTIME29  SAP434X.   ALUNIT29  SAP435X.
      ALDURA29  SAP436X.   ALDURB29  SAP437X.   ALCHRC29  SAP438X.
      ALTIME30  SAP434X.   ALUNIT30  SAP435X.   ALDURA30  SAP436X.
      ALDURB30  SAP437X.   ALCHRC30  SAP438X.   ALTIME31  SAP434X.
      ALUNIT31  SAP435X.   ALDURA31  SAP436X.   ALDURB31  SAP437X.
      ALCHRC31  SAP438X.   ALTIME32  SAP434X.   ALUNIT32  SAP435X.
      ALDURA32  SAP436X.   ALDURB32  SAP437X.   ALCHRC32  SAP438X.
      ALTIME33  SAP434X.   ALUNIT33  SAP435X.   ALDURA33  SAP436X.
      ALDURB33  SAP437X.   ALCHRC33  SAP438X.   ALTIME34  SAP434X.
      ALUNIT34  SAP435X.   ALDURA34  SAP436X.   ALDURB34  SAP437X.
      ALCHRC34  SAP438X.   ALTIME90  SAP434X.   ALUNIT90  SAP435X.
      ALDURA90  SAP436X.   ALDURB90  SAP437X.   ALCHRC90  SAP438X.
      ALTIME91  SAP434X.   ALUNIT91  SAP435X.   ALDURA91  SAP436X.
      ALDURB91  SAP437X.   ALCHRC91  SAP438X.   ALCNDRT   SAP614X.
      ALCHRONR  SAP615X.

      /* AHB FORMAT ASSOCIATIONS */

      SMKEV     SAP028X.   SMKREG    SAP617X.   SMKNOW    SAP618X.
      SMKSTAT2  SAP619X.   SMKQTNO   SAP620X.   SMKQTTP   SAP621X.
      SMKQTY    SAP622X.   CIGSDA1   SAP623X.   CIGDAMO   SAP624X.
      CIGSDA2   SAP623X.   CIGSDAY   SAP623X.   CIGQTYR   SAP028X.
      OTHCIGEV  SAP028X.   OTHCIGED  SAP629X.   SMKLESEV  SAP028X.
      SMKLESED  SAP629X.   TOBLASYR  SAP028X.   TOBQTYR   SAP028X.
      VIGNO     SAP634X.   VIGTP     SAP635X.   VIGFREQW  SAP636X.
      VIGLNGNO  SAP290X.   VIGLNGTP  SAP638X.   VIGMIN    SAP290X.
      MODNO     SAP634X.   MODTP     SAP635X.   MODFREQW  SAP642X.
      MODLNGNO  SAP290X.   MODLNGTP  SAP638X.   MODMIN    SAP290X.
      STRNGNO   SAP634X.   STRNGTP   SAP635X.   STRFREQW  SAP648X.
      ALC1YR    SAP028X.   ALCLIFE   SAP028X.   ALC12MNO  SAP651X.
      ALC12MTP  SAP652X.   ALC12MWK  SAP653X.   ALC12MYR  SAP654X.
      ALCAMT    SAP655X.   ALCSTAT   SAP656X.   ALC5UPNO  SAP654X.
      ALC5UPTP  SAP658X.   ALC5UPYR  SAP654X.   AHEIGHT   SAP660X.
      AWEIGHTP  SAP661X.   BMI       SAP662X.   SLEEP     SAP663X.

      /* AAU FORMAT ASSOCIATIONS */

      AUSUALPL  SAP664X.   APLKIND   SAP665X.   AHCPLROU  SAP028X.
      AHCPLKND  SAP667X.   AHCCHGYR  SAP028X.   AHCCHGHI  SAP028X.
      ANOUSPL1  SAP670X.   ANOUSPL2  SAP670X.   ANOUSPL3  SAP670X.
      ANOUSPL4  SAP670X.   ANOUSPL5  SAP670X.   ANOUSPL6  SAP670X.
      ANOUSPL7  SAP670X.   ANOUSPL8  SAP670X.   ANOUSPL9  SAP670X.
      APRVTRYR  SAP028X.   APRVTRFD  SAP300X.   ADRNANP   SAP300X.
      ADRNAI    SAP682X.   AHCDLYR1  SAP028X.   AHCDLYR2  SAP028X.
      AHCDLYR3  SAP028X.   AHCDLYR4  SAP028X.   AHCDLYR5  SAP028X.
      AHCAFYR1  SAP028X.   AHCAFYR2  SAP028X.   AHCAFYR3  SAP028X.
      AHCAFYR4  SAP028X.   AHCAFYR5  SAP300X.   AHCAFYR6  SAP300X.
      AWORPAY   SAP694X.   AHICOMP   SAP373X.   ARXPR_1   SAP028X.
      ARXPR_2   SAP300X.   ARXPR_3   SAP028X.   ARXPR_4   SAP028X.
      ARXPR_5   SAP028X.   ARXPR_6   SAP028X.   ADNLONG2  SAP702X.
      AHCSYR1   SAP028X.   AHCSYR2   SAP028X.   AHCSYR3   SAP028X.
      AHCSYR4   SAP028X.   AHCSYR5   SAP028X.   AHCSYR6   SAP028X.
      AHCSYR7   SAP028X.   AHCSYR8   SAP028X.   AHCSYR9   SAP028X.
      AHCSYR10  SAP028X.   AHERNOY2  SAP713X.   AERVISND  SAP028X.
      AERHOS    SAP028X.   AERREAS1  SAP028X.   AERREAS2  SAP028X.
      AERREAS3  SAP028X.   AERREAS4  SAP028X.   AERREAS5  SAP028X.
      AERREAS6  SAP028X.   AERREAS7  SAP300X.   AERREAS8  SAP300X.
      AERREA1R  SAP028X.   AERREA2R  SAP028X.   AERREA3R  SAP028X.
      AERREA4R  SAP028X.   AERREA5R  SAP028X.   AERREA6R  SAP028X.
      AERREA7R  SAP300X.   AERREA8R  SAP300X.   AHCHYR    SAP028X.
      AHCHMOYR  SAP663X.   AHCHNOY2  SAP734X.   AHCNOYR2  SAP713X.
      ASRGYR    SAP028X.   ASRGNOYR  SAP737X.   AMDLONGR  SAP702X.
      AVISLAST  SAP739X.   ALASTYP1  SAP111X.   ALASTYP2  SAP111X.
      ALASTYP3  SAP111X.   ALASTYP4  SAP111X.   ALASTVRB  $SAP744X.
      AVISAPN2  SAP745X.   AVISAPT2  SAP746X.   AWAITRMN  SAP747X.
      AWAITRMT  SAP748X.   HIT1A     SAP300X.   HIT2A     SAP028X.
      HIT3A     SAP028X.   HIT4A     SAP300X.   HIT5A     SAP300X.
      SHTFLU2   SAP028X.   ASHFLUM2  SAP755X.   ASHFLUY2  SAP756X.
      FLUSHPG1  SAP757X.   FLUSHPG2  SAP758X.   SPRFLU2   SAP028X.
      ASPFLUM2  SAP755X.   ASPFLUY2  SAP756X.   SHTPNUYR  SAP028X.
      APOX      SAP028X.   APOX12MO  SAP028X.   AHEP      SAP028X.
      AHEPLIV   SAP028X.   SHTHEPB   SAP028X.   SHEPDOS   SAP768X.
      SHTHEPA   SAP028X.   SHEPANUM  SAP770X.   SHINGLES  SAP028X.
      SHTTD     SAP028X.   SHTTD05   SAP028X.   SHTTDAP2  SAP774X.
      HPVHRD    SAP028X.   SHHPVHD1  SAP028X.   SHTHPV1   SAP777X.
      SHHPVDOS  SAP778X.   LIVEV     SAP028X.   TRAVEL    SAP028X.
      WRKHLTH2  SAP028X.   WRKDIR    SAP028X.   APSBPCHK  SAP028X.
      APSCHCHK  SAP028X.   APSBSCHK  SAP028X.   APSPAP    SAP028X.
      APSMAM    SAP028X.   APSCOL    SAP300X.   APSDIET   SAP028X.
      APSSMKC   SAP300X.   LTCFAM    SAP300X.   LTCHELP   SAP792X.
      LTCWHO1   SAP670X.   LTCWHO2   SAP670X.   LTCWHO3   SAP670X.
      LTCWHO4   SAP670X.   LTCWHO5   SAP670X.   AINDINS   SAP300X.
      AINDPRCH  SAP300X.   AINDWHO   SAP800X.   AINDDIF1  SAP801X.
      AINDDIF2  SAP802X.   AINDENY1  SAP300X.   AINDENY2  SAP300X.
      AINDENY3  SAP300X.   AINDNOT1  SAP670X.   AINDNOT2  SAP670X.
      AINDNOT3  SAP670X.   AINDNOT4  SAP670X.   AINDNOT5  SAP670X.
      HIVTST1   SAP028X.

      /* AWB FORMAT ASSOCIATIONS */

      AWEBUSE   SAP028X.   AWEBOFNO  SAP290X.   AWEBOFTP  SAP814X.
      AWEBEML   SAP028X.   AWEBMNO   SAP290X.   AWEBMTP   SAP814X.;
RUN;

PROC CONTENTS DATA=NHIS.SAMADULT;
   TITLE1 'CONTENTS OF THE 2012 NHIS Sample Adult FILE';

PROC FREQ DATA=NHIS.SAMADULT NOTITLE;
   TABLES RECTYPE/LIST MISSING;
   TITLE1 'FREQUENCY REPORT FOR 2012 NHIS Sample Adult FILE';
   TITLE2 '(WEIGHTED)';
   WEIGHT WTFA_SA;

PROC FREQ DATA=NHIS.SAMADULT NOTITLE;
   TABLES RECTYPE/LIST MISSING;
   TITLE1 'FREQUENCY REPORT FOR 2012 NHIS Sample Adult FILE';
   TITLE2 '(UNWEIGHTED)';

* USER NOTE: TO SEE UNFORMATTED VALUES IN PROCEDURES, ADD THE
             STATEMENT: FORMAT _ALL_;
RUN;
