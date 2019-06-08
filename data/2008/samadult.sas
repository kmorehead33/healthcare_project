*********************************************************************
 JUNE 16, 2009  9:57 AM
 
 This is an example of a SAS program that creates a SAS
 file from the 2008 NHIS Public Use SAMADULT.DAT ASCII file
 
 This is stored in SAMADULT.SAS
*********************************************************************;

* USER NOTE: PLACE NEXT STATEMENT IN SUBSEQUENT PROGRAMS;
LIBNAME  NHIS     "C:\NHIS2008";

* USER NOTE: PLACE NEXT STATEMENT IN SUBSEQUENT PROGRAMS
             IF YOU ALLOW PROGRAM TO PERMANENTLY STORE FORMATS;
LIBNAME  LIBRARY  "C:\NHIS2008";

FILENAME ASCIIDAT 'C:\NHIS2008\SAMADULT.dat';

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
      30                 = "30 Sample Adult"
      31                 = "31 Sample Adult Cancer"
      40                 = "40 Sample Child"
      60                 = "60 Family"
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
      01                 = "01 Week 1"
      02                 = "02 Week 2"
      03                 = "03 Week 3"
      04                 = "04 Week 4"
      05                 = "05 Week 5"
      06                 = "06 Week 6"
      07                 = "07 Week 7"
      08                 = "08 Week 8"
      09                 = "09 Week 9"
      10                 = "10 Week 10"
      11                 = "11 Week 11"
      12                 = "12 Week 12"
      13                 = "13 Week 13"
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
   VALUE SAP024X
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
   VALUE SAP025X
      1                  = "1 Yes"
      2                  = "2 No"
      7                  = "7 Refused"
      8                  = "8 Not ascertained"
      9                  = "9 Don't know"
   ;
   VALUE SAP026X
      .                   = '.'
      OTHER              = "See NAICS Industry Recode Appendix in file layout"
   ;
   VALUE SAP028X
      .                   = '.'
      OTHER              = 
"See 2000 SOC Occupation Recode Appendix in file layout"
   ;
   VALUE SAP030X
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
   VALUE SAP032X
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
   VALUE SAP033X
      00                 = "00 Less than 1 year"
      35                 = "35 35 or more years"
      97                 = "97 Refused"
      98                 = "98 Not ascertained"
      99                 = "99 Don't know"
   ;
   VALUE SAP041X
      00                 = "00 Never"
      95                 = "95 95 or more"
      97                 = "97 Refused"
      98                 = "98 Not ascertained"
      99                 = "99 Don't know"
   ;
   VALUE SAP042X
      1                  = "1 Day(s)"
      2                  = "2 Week(s)"
      3                  = "3 Month(s)"
      4                  = "4 Year(s)"
      7                  = "7 Refused"
      8                  = "8 Not ascertained"
      9                  = "9 Don't know"
   ;
   VALUE SAP043X
      1                  = "1 Not told"
      2                  = "2 High"
      3                  = "3 Normal"
      4                  = "4 Low"
      5                  = "5 Borderline"
      7                  = "7 Refused"
      8                  = "8 Not ascertained"
      9                  = "9 Don't know"
   ;
   VALUE SAP058X
      1                  = "1 Advise them to drive to the hospital"
      2                  = "2 Advise them to call their physician"
      3                  = "3 Call 9-1-1 (or another emergency number)"
      4                  = "4 Call spouse or family member"
      5                  = "5 Other"
      7                  = "7 Refused"
      8                  = "8 Not ascertained"
      9                  = "9 Don't know"
   ;
   VALUE SAP060X
      1                  = "1 1 year or less"
      2                  = "2 More than 1 year, but no more than 2 years"
      3                  = "3 More than 2 years, but no more than 5 years"
      4                  = "4 More than 5 years"
      7                  = "7 Refused"
      8                  = "8 Not ascertained"
      9                  = "9 Don't know"
   ;
   VALUE SAP066X
      1                  = "1 Yes"
      2                  = "2 No"
      3                  = "3 Still in the hospital"
      7                  = "7 Refused"
      8                  = "8 Not ascertained"
      9                  = "9 Don't know"
   ;
   VALUE SAP067X
      996                = "996 Unable to do this activity"
      997                = "997 Refused"
      998                = "998 Not ascertained"
      999                = "999 Don't know"
   ;
   VALUE SAP079X
      1                  = "1 Yes"
      2                  = "2 No"
      3                  = "3 Was told no changes needed"
      7                  = "7 Refused"
      8                  = "8 Not ascertained"
      9                  = "9 Don't know"
   ;
   VALUE SAP080X
      0                  = "0 None"
      1                  = "1 A little"
      2                  = "2 Some"
      3                  = "3 Most"
      4                  = "4 All"
      7                  = "7 Refused"
      8                  = "8 Not ascertained"
      9                  = "9 Don't know"
   ;
   VALUE SAP096X
      1                  = "1 Mentioned"
      2                  = "2 Not mentioned"
      7                  = "7 Refused"
      8                  = "8 Not ascertained"
      9                  = "9 Don't know"
   ;
   VALUE SAP127X
      85                 = "85 85+ years"
      97                 = "97 Refused"
      98                 = "98 Not ascertained"
      99                 = "99 Don't know"
   ;
   VALUE SAP157X
      1                  = "1 Yes"
      2                  = "2 No"
      3                  = "3 Borderline"
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
   VALUE SAP206X
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
   VALUE SAP208X
      1                  = "1 The right ear"
      2                  = "2 The left ear"
      7                  = "7 Refused"
      8                  = "8 Not ascertained"
      9                  = "9 Don't know"
   ;
   VALUE SAP212X
      01                 = "01 Less than 3 months"
      02                 = "02 3 to 11 months"
      03                 = "03 1 to 2 years"
      04                 = "04 3 to 4 years"
      05                 = "05 5 to 9 years"
      06                 = "06 10 to 14 years"
      07                 = "07 15 years or more"
      97                 = "97 Refused"
      98                 = "98 Not ascertained"
      99                 = "99 Don't know"
   ;
   VALUE SAP213X
      1                  = "1 Almost always"
      2                  = "2 At least once a day"
      3                  = "3 At least once a week"
      4                  = "4 At least once a month"
      5                  = "5 Less frequently than once a month"
      7                  = "7 Refused"
      8                  = "8 Not ascertained"
      9                  = "9 Don't know"
   ;
   VALUE SAP216X
      1                  = "1 No problem"
      2                  = "2 A small problem"
      3                  = "3 A moderate problem"
      4                  = "4 A big problem"
      5                  = "5 A very big problem"
      7                  = "7 Refused"
      8                  = "8 Not ascertained"
      9                  = "9 Don't know"
   ;
   VALUE SAP233X
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
   VALUE SAP239X
      1                  = "1 Less than one month"
      2                  = "2 1-12 months"
      3                  = "3 13-24 months"
      4                  = "4 More than 2 years"
      5                  = "5 Never"
      7                  = "7 Refused"
      8                  = "8 Not ascertained"
      9                  = "9 Don't know"
   ;
   VALUE SAP241X
      1                  = "1 Always"
      2                  = "2 Most of the time"
      3                  = "3 Some of the time"
      4                  = "4 None of the time"
      7                  = "7 Refused"
      8                  = "8 Not ascertained"
      9                  = "9 Don't know"
   ;
   VALUE SAP243X
      1                  = "1 ALL of the time"
      2                  = "2 MOST of the time"
      3                  = "3 SOME of the time"
      4                  = "4 A LITTLE of the time"
      5                  = "5 NONE of the time"
      7                  = "7 Refused"
      8                  = "8 Not ascertained"
      9                  = "9 Don't know"
   ;
   VALUE SAP249X
      1                  = "1 A lot"
      2                  = "2 Some"
      3                  = "3 A little"
      4                  = "4 Not at all"
      7                  = "7 Refused"
      8                  = "8 Not ascertained"
      9                  = "9 Don't know"
   ;
   VALUE SAP253X
      0                  = "0 Had job last week"
      1                  = "1 No job last week, had job past 12 m"
      2                  = "2 No job last week, no job past 12 m"
      3                  = "3 Never worked"
      7                  = "7 Refused"
      8                  = "8 Not ascertained"
      9                  = "9 Don't know"
   ;
   VALUE SAP254X
      000                = "000 None"
      997                = "997 Refused"
      998                = "998 Not ascertained"
      999                = "999 Don't know"
   ;
   VALUE SAP256X
      1                  = "1 Better"
      2                  = "2 Worse"
      3                  = "3 About the same"
      7                  = "7 Refused"
      8                  = "8 Not ascertained"
      9                  = "9 Don't know"
   ;
   VALUE SAP258X
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
   VALUE SAP270X
      1                  = "1 Limited in any way"
      2                  = "2 Not limited in any way"
      3                  = "3 Unknown if limited"
   ;
   VALUE SAP307X
      95                 = "95 95+"
      96                 = "96 Since birth"
      97                 = "97 Refused"
      98                 = "98 Not ascertained"
      99                 = "99 Don't know"
   ;
   VALUE SAP308X
      1                  = "1 Day(s)"
      2                  = "2 Week(s)"
      3                  = "3 Month(s)"
      4                  = "4 Year(s)"
      6                  = "6 Since birth"
      7                  = "7 Refused"
      8                  = "8 Not ascertained"
      9                  = "9 Don't know"
   ;
   VALUE SAP309X
      00                 = "00 Less than 1 year"
      85                 = "85 85+ years"
      96                 = "96 Unknown number of years"
      97                 = "97 Refused"
      98                 = "98 Not ascertained"
      99                 = "99 Don't know"
   ;
   VALUE SAP310X
      1                  = "1 Less than 3 months"
      2                  = "2 3-5 months"
      3                  = "3 6-12 months"
      4                  = "4 More than 1 year"
      7                  = "7 Refused"
      8                  = "8 Not ascertained"
      9                  = "9 Don't know"
   ;
   VALUE SAP311X
      1                  = "1 Chronic"
      2                  = "2 Not chronic"
      9                  = "9 Unknown if chronic"
   ;
   VALUE SAP487X
      1                  = 
"1 At least one chronic condition causes functional limitation"
      2                  = "2 No chronic condition causes functional limitation"
      9                  = 
"9 Unknown if any chronic condition causes functional limitation"
   ;
   VALUE SAP488X
      0                  = 
"0 Not limited in any way (including unknown if limited)"
      1                  = "1 Limited; caused by at least one chronic condition"
      2                  = "2 Limited; not caused by chronic condition"
      3                  = "3 Limited; unknown if condition is chronic"
   ;
   VALUE SAP490X
      85                 = "85 85 years or older"
      96                 = "96 Never smoked regularly"
      97                 = "97 Refused"
      98                 = "98 Not ascertained"
      99                 = "99 Don't know"
   ;
   VALUE SAP491X
      1                  = "1 Every day"
      2                  = "2 Some days"
      3                  = "3 Not at all"
      7                  = "7 Refused"
      8                  = "8 Not ascertained"
      9                  = "9 Don't know"
   ;
   VALUE SAP492X
      1                  = "1 Current every day smoker"
      2                  = "2 Current some day smoker"
      3                  = "3 Former smoker"
      4                  = "4 Never smoker"
      5                  = "5 Smoker, current status unknown"
      9                  = "9 Unknown if ever smoked"
   ;
   VALUE SAP493X
      95                 = "95 95+"
      97                 = "97 Refused"
      98                 = "98 Not ascertained"
      99                 = "99 Don't know"
   ;
   VALUE SAP495X
      00                 = "00 Less than 1 year"
      70                 = "70 70+ years"
      97                 = "97 Refused"
      98                 = "98 Not ascertained"
      99                 = "99 Don't know"
   ;
   VALUE SAP496X
      95                 = "95 95+ cigarettes"
      97                 = "97 Refused"
      98                 = "98 Not ascertained"
      99                 = "99 Don't know"
   ;
   VALUE SAP497X
      00                 = "00 None"
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
   VALUE SAP527X
      96                 = "96 Not available"
      97                 = "97 Refused"
      98                 = "98 Not ascertained"
      99                 = "99 Don't know"
   ;
   VALUE SAP528X
      996                = "996 Not available"
      997                = "997 Refused"
      998                = "998 Not ascertained"
      999                = "999 Don't know"
   ;
   VALUE SAP529X
      99.95              = "99.95 99.95+"
      99.99              = "99.99 Unknown"
   ;
   VALUE SAP530X
      97                 = "97 Refused"
      98                 = "98 Not ascertained"
      99                 = "99 Don't know"
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
   VALUE SAP546X
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
   VALUE SAP557X
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
   VALUE SAP560X
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
   VALUE SAP563X
      95                 = "95 95+ times"
      97                 = "97 Refused"
      98                 = "98 Not ascertained"
      99                 = "99 Don't know"
   ;
   VALUE SAP566X
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
   VALUE SAP567X
      .                   = '.'
      OTHER              = "Year"
      9997               = "9997 Refused"
      9998               = "9998 Not ascertained"
      9999               = "9999 Don't know"
   ;
   VALUE SAP577X
      1                  = "1 Received at least 3 doses"
      2                  = "2 Received less than 3 doses"
      7                  = "7 Refused"
      8                  = "8 Not ascertained"
      9                  = "9 Don't know"
   ;
   VALUE SAP579X
      96                 = "96 Received all shots"
      97                 = "97 Refused"
      98                 = "98 Not ascertained"
      99                 = "99 Don't know"
   ;
   VALUE SAP583X
      1                  = "1 Yes-included pertussis"
      2                  = "2 No-did not include pertussis"
      3                  = "3 Doctor did not say"
      7                  = "7 Refused"
      8                  = "8 Not ascertained"
      9                  = "9 Don't know"
   ;
   VALUE SAP586X
      1                  = "1 Very good"
      2                  = "2 Good"
      3                  = "3 Fair"
      4                  = "4 Poor"
      7                  = "7 Refused"
      8                  = "8 Not ascertained"
      9                  = "9 Don't know"
   ;
   VALUE SAP587X
      1                  = "1 Better"
      2                  = "2 Same"
      3                  = "3 Not as good"
      7                  = "7 Refused"
      8                  = "8 Not ascertained"
      9                  = "9 Don't know"
   ;
   VALUE SAP588X
      1                  = "1 Often"
      2                  = "2 Sometimes"
      3                  = "3 Rarely"
      4                  = "4 Never"
      7                  = "7 Refused"
      8                  = "8 Not ascertained"
      9                  = "9 Don't know"
   ;
   VALUE SAP589X
      01                 = "01 None or less than 1 hour"
      02                 = "02 1 hour, less than 3 hours"
      03                 = "03 3 hours, less than 5 hours"
      04                 = "04 5 hours, less than 7 hours"
      05                 = "05 7 or more hours"
      06                 = "06 Doesn't go to work or school"
      07                 = "07 Did not have this type of dental care"
      97                 = "97 Refused"
      98                 = "98 Not ascertained"
      99                 = "99 Don't know"
   ;
   VALUE SAP591X
      01                 = "01 None to less than 1 hour"
      02                 = "02 1 hour, less than 3 hours"
      03                 = "03 3 hours, less than 5 hours"
      04                 = "04 5 hours, less than 7 hours"
      05                 = "05 7 or more hours"
      06                 = "06 Doesn't go to work or school"
      07                 = "07 Did not have this type of dental care"
      97                 = "97 Refused"
      98                 = "98 Not ascertained"
      99                 = "99 Don't know"
   ;
   VALUE SAP606X
      1                  = "1 Dentist"
      2                  = "2 Doctor"
      3                  = "3 Both"
      7                  = "7 Refused"
      8                  = "8 Not ascertained"
      9                  = "9 Don't know"
   ;
   VALUE SAP614X
      1                  = "1 Yes"
      2                  = "2 No"
      3                  = "3 Doesn't go to work or school"
      7                  = "7 Refused"
      8                  = "8 Not ascertained"
      9                  = "9 Don't know"
   ;
   VALUE SAP621X
      1                  = "1 Within past year"
      2                  = "2 Between 1 and 3 years ago"
      3                  = "3 Over 3 years ago"
      7                  = "7 Refused"
      8                  = "8 Not ascertained"
      9                  = "9 Don't know"
   ;
   VALUE SAP622X
      1                  = "1 Part of routine check-up"
      2                  = "2 For a specific problem"
      7                  = "7 Refused"
      8                  = "8 Not ascertained"
      9                  = "9 Don't know"
   ;
   VALUE SAP623X
      1                  = "1 Doctor/Physician"
      2                  = "2 Nurse/nurse practitioner"
      3                  = "3 Dentists (include oral surgeons orthodontists)"
      4                  = "4 Dental hygienist"
      5                  = "5 Other"
      7                  = "7 Refused"
      8                  = "8 Not ascertained"
      9                  = "9 Don't know"
   ;
   VALUE SAP627X
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
   VALUE SAP628X
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
      96                 = "96 Time period format"
      97                 = "97 Refused"
      98                 = "98 Not ascertained"
      99                 = "99 Don't know"
   ;
   VALUE SAP629X
      9996               = "9996 Time period format"
      9997               = "9997 Refused"
      9998               = "9998 Not ascertained"
      9999               = "9999 Don't know"
   ;
   VALUE SAP630X
      1                  = "1 6 months or less"
      2                  = "2 More than 6 months but not more than 1 year ago"
      3                  = "3 More than 1 year, but not more than 2 years ago"
      4                  = "4 More than 2 years, but not more than 5 years ago"
      5                  = "5 More than 5 years ago"
      7                  = "7 Refused"
      8                  = "8 Not ascertained"
      9                  = "9 Don't know"
   ;
   VALUE SAP631X
      01                 = "01 Someone suggested you should be tested"
      02                 = 
"02 You might have been exposed through sex or drug use"
      03                 = 
"03 You might have been exposed through your work or at work"
      04                 = 
"04 You just wanted to find out if you were infected or not"
      05                 = 
"05 For part of a routine medical check-up, or for hospitalization or surgical p
rocedure"
      06                 = "06 You were sick or had a medical problem"
      07                 = "07 You were pregnant or delivered a baby"
      08                 = "08 For health or life insurance coverage"
      09                 = 
"09 For military induction, separation, or military service"
      10                 = "10 For immigration"
      11                 = "11 For marriage license or to get married"
      12                 = "12 You were concerned you could give HIV to someone"
      13                 = 
"13 You wanted medical care or new treatments if you tested positive"
      14                 = "14 Some other reason"
      15                 = "15 No particular reason"
      97                 = "97 Refused"
      98                 = "98 Not ascertained"
      99                 = "99 Don't know"
   ;
   VALUE SAP632X
      1                  = "1 Doctor, nurse or other health care professional"
      2                  = "2 Sex partner"
      3                  = "3 Someone at health department"
      4                  = "4 Family member or friend"
      5                  = "5 Other"
      7                  = "7 Refused"
      8                  = "8 Not ascertained"
      9                  = "9 Don't know"
   ;
   VALUE SAP633X
      01                 = "01 Private doctor/HMO"
      02                 = "02 AIDS clinic/counseling/testing site"
      03                 = "03 Hospital, emergency room, outpatient clinic"
      04                 = "04 Other type of clinic"
      05                 = "05 Public health department"
      06                 = "06 At home"
      07                 = "07 Drug treatment facility"
      08                 = "08 Military induction or military service site"
      09                 = "09 Immigration site"
      10                 = "10 In a correctional facility (jail or prison)"
      11                 = "11 Other location"
      97                 = "97 Refused"
      98                 = "98 Not ascertained"
      99                 = "99 Don't know"
   ;
   VALUE SAP634X
      01                 = "01 Family planning clinic"
      02                 = "02 Prenatal clinic"
      03                 = "03 Tuberculosis clinic"
      04                 = "04 STD clinic"
      05                 = "05 Community health clinic"
      06                 = "06 Clinic run by employer or insurance company"
      07                 = "07 Other"
      97                 = "97 Refused"
      98                 = "98 Not ascertained"
      99                 = "99 Don't know"
   ;
   VALUE SAP635X
      1                  = "1 Nurse or health worker"
      2                  = "2 Self-sampling kit"
      7                  = "7 Refused"
      8                  = "8 Not ascertained"
      9                  = "9 Don't know"
   ;
   VALUE SAP638X
      1                  = "1 High/Already have HIV/AIDS"
      2                  = "2 Medium"
      3                  = "3 Low"
      4                  = "4 None"
      7                  = "7 Refused"
      8                  = "8 Not ascertained"
      9                  = "9 Don't know"
   ;
   VALUE SAP639X
      1                  = "1 Yes, at least one statement is true"
      2                  = "2 No, none of these statements are true"
      7                  = "7 Refused"
      8                  = "8 Not ascertained"
      9                  = "9 Don't know"
   ;
   VALUE SAP642X
      1                  = "1 Private doctor"
      2                  = "2 Family planning clinic"
      3                  = "3 STD clinic"
      4                  = "4 Emergency room"
      5                  = "5 Health department"
      6                  = "6 Some other place"
      7                  = "7 Refused"
      8                  = "8 Not ascertained"
      9                  = "9 Don't know"
   ;
   VALUE SAP645X
      1                  = "1 A lot"
      2                  = "2 Some"
      3                  = "3 A little"
      4                  = "4 Nothing"
      7                  = "7 Refused"
      8                  = "8 Not ascertained"
      9                  = "9 Don't know"
   ;
   VALUE SAP653X
      1                  = "1 High"
      2                  = "2 Medium"
      3                  = "3 Low"
      4                  = "4 None"
      5                  = "5 Already have TB"
      7                  = "7 Refused"
      8                  = "8 Not ascertained"
      9                  = "9 Don't know"
   ;
   VALUE SAP656X
      1                  = "1 Always"
      2                  = "2 Most of the time"
      3                  = "3 Sometimes"
      4                  = "4 Rarely"
      5                  = "5 Never"
      6                  = "6 Don't go out in the sun"
      7                  = "7 Refused"
      8                  = "8 Not ascertained"
      9                  = "9 Don't know"
   ;
   VALUE SAP662X
      96                 = "96 More than one, different ones, other"
      97                 = "97 Refused"
      98                 = "98 Not ascertained"
      99                 = "99 Don't know"
   ;
   VALUE SAP663X
      1                  = "1-14"
      2                  = "2 15-50"
      7                  = "7 Refused"
      8                  = "8 Not ascertained"
      9                  = "9 Don't know"
   ;
   VALUE SAP666X
      00                 = "00 None"
      95                 = "95 95+ times"
      97                 = "97 Refused"
      98                 = "98 Not ascertained"
      99                 = "99 Don't know"
   ;
   VALUE SAP670X
      1                  = "1 Days ago"
      2                  = "2 Weeks ago"
      3                  = "3 Months ago"
      4                  = "4 Years ago"
      7                  = "7 Refused"
      8                  = "8 Not ascertained"
      9                  = "9 Don't know"
   ;
   VALUE SAP671X
      1                  = "1 A year ago or less"
      2                  = "2 More than 1 year but not more than 2 years"
      3                  = "3 More than 2 years but not more than 3 years"
      4                  = "4 More than 3 years but not more than 5 years"
      5                  = "5 Over 5 years ago"
      7                  = "7 Refused"
      8                  = "8 Not ascertained"
      9                  = "9 Don't know"
   ;
   VALUE SAP672X
      1                  = "1 Part of a routine exam"
      2                  = "2 Because of a problem"
      3                  = "3 Other reason"
      7                  = "7 Refused"
      8                  = "8 Not ascertained"
      9                  = "9 Don't know"
   ;
   VALUE SAP674X
      01                 = "01 No reason/never thought about it"
      02                 = 
"02 Didn't need/Didn't know I needed this type of test"
      03                 = "03 Doctor didn't order it/didn't say I needed it"
      04                 = "04 Haven't had any problems"
      05                 = "05 Put if off/Didn't get around to it"
      06                 = "06 Too expensive/No insurance/Cost"
      07                 = "07 Too painful, unpleasant, or embarrassing"
      08                 = "08 Had hysterectomy"
      09                 = "09 Don't have doctor"
      10                 = "10 Had an HPV DNA test"
      11                 = "11 Other"
      97                 = "97 Refused"
      98                 = "98 Not ascertained"
      99                 = "99 Don't know"
   ;
   VALUE SAP675X
      1                  = "1 Yes"
      2                  = "2 No"
      3                  = "3 Did not see a doctor in the past 12 months"
      7                  = "7 Refused"
      8                  = "8 Not ascertained"
      9                  = "9 Don't know"
   ;
   VALUE SAP676X
      01                 = "01 A year or less from now"
      02                 = "02 1-3 years from now"
      03                 = "03 3-5 years from now"
      04                 = "04 More than 5 years from now"
      05                 = "05 When doctor recommends it"
      06                 = "06 Never, had HPV DNA test"
      07                 = "07 Never, had HPV vaccine"
      08                 = "08 Never, other reason"
      97                 = "97 Refused"
      98                 = "98 Not ascertained"
      99                 = "99 Don't know"
   ;
   VALUE SAP684X
      1                  = "1 Yes"
      2                  = "2 No"
      3                  = "3 Doctor refused when asked"
      7                  = "7 Refused"
      8                  = "8 Not ascertained"
      9                  = "9 Don't know"
   ;
   VALUE SAP685X
      96                 = "96 All shots"
      97                 = "97 Refused"
      98                 = "98 Not ascertained"
      99                 = "99 Don't know"
   ;
   VALUE SAP687X
      01                 = "01 Does not need vaccine"
      02                 = "02 Not sexually active"
      03                 = "03 Too expensive"
      04                 = "04 Too old for vaccine"
      05                 = "05 Doctor didn't recommend it"
      06                 = "06 Worried about safety of vaccine"
      07                 = "07 Don't know where to get vaccine"
      08                 = "08 My spouse/family member is against it"
      09                 = "09 Don't know enough about vaccine"
      10                 = "10 Already have HPV"
      11                 = "11 Other"
      97                 = "97 Refused"
      98                 = "98 Not ascertained"
      99                 = "99 Don't know"
   ;
   VALUE SAP691X
      00                 = "00 None"
      95                 = "95 95+"
      97                 = "97 Refused"
      98                 = "98 Not ascertained"
      99                 = "99 Don't know"
   ;
   VALUE SAP693X
      9996               = "9996 Time period format"
      9997               = "9997 Refused"
      9998               = "9998 Not ascertained"
      9999               = "9999 Don’t know"
   ;
   VALUE SAP703X
      1                  = "1 A year or less"
      2                  = "2 More than 1 up to 2 years"
      3                  = "3 More than 2 up to 4 years"
      4                  = "4 More than 4 up to 8 years"
      5                  = "5 More than 8 years"
      7                  = "7 Refused"
      8                  = "8 Not ascertained"
      9                  = "9 Don't know"
   ;
   VALUE SAP717X
      1                  = "1 A year ago or less"
      2                  = "2 More than 1 year but not more than 2 years"
      3                  = "3 More than 2 years but not more than 3 years"
      4                  = "4 More than 3 years but not more than 5 years"
      5                  = "5 More than 5 years but not more than 10 years"
      6                  = "6 Over 10 years ago"
      7                  = "7 Refused"
      8                  = "8 Not ascertained"
      9                  = "9 Don't know"
   ;
   VALUE SAP718X
      1                  = "1 Sigmoidoscopy"
      2                  = "2 Colonoscopy"
      3                  = "3 Proctoscopy"
      4                  = "4 Something else"
      7                  = "7 Refused"
      8                  = "8 Not ascertained"
      9                  = "9 Don't know"
   ;
   VALUE SAP749X
      1                  = "1 Yes"
      2                  = "2 No"
      7                  = "7 Refused"
      8                  = "8 Not ascertained"
      9                  = "9 Don’t Know"
   ;
   VALUE SAP787X
      7                  = "7 Refused"
      8                  = "8 Not ascertained"
      9                  = "9 Don't know"
   ;
   VALUE SAP788X
      1                  = "1 Feeling a sense of spinning"
      2                  = "2 A floating or spacey feeling"
      3                  = "3 Feeling lightheaded"
      4                  = "4 Feeling like you are about to pass out"
      5                  = "5 Blurred vision"
      6                  = "6 Unsteadiness"
      7                  = "7 Refused"
      8                  = "8 Not ascertained"
      9                  = "9 Don't know"
   ;
   VALUE SAP789X
      996                = "996 Since birth"
      997                = "997 Refused"
      998                = "998 Not ascertained"
      999                = "999 Don't know"
   ;
   VALUE SAP790X
      01                 = "01 Less then 3 months"
      02                 = "02 3 months to less than 12 months"
      03                 = "03 12 months to less than 3 years"
      04                 = "04 3 years to less than 5 years"
      05                 = "05 5 years to less than 10 years"
      06                 = "06 10 years to less than 15 years"
      07                 = "07 15 years or more"
      97                 = "97 Refused"
      98                 = "98 Not ascertained"
      99                 = "99 Don't know"
   ;
   VALUE SAP791X
      01                 = "01 Almost always"
      02                 = "02 3 or more times a day"
      03                 = "03 Once or twice a day"
      04                 = "04 Several times a week"
      05                 = "05 Once a week"
      06                 = "06 Several times a month"
      07                 = "07 Once a month"
      08                 = "08 Less than once a month"
      97                 = "97 Refused"
      98                 = "98 Not ascertained"
      99                 = "99 Don't know"
   ;
   VALUE SAP792X
      01                 = "01 Momentary, or less than one minute"
      02                 = "02 One minute to less than 20 minutes"
      03                 = "03 20 minutes to less than 4 hours"
      04                 = "04 4 hours to less than 24 hours"
      05                 = "05 1 day to less than 14 days"
      06                 = "06 2 weeks to less than 3 months"
      07                 = "07 3 months or longer"
      97                 = "97 Refused"
      98                 = "98 Not ascertained"
      99                 = "99 Don't know"
   ;
   VALUE SAP828X
      1                  = "1 Only"
      2                  = "2 Regardless"
      7                  = "7 Refused"
      8                  = "8 Not ascertained"
      9                  = "9 Don't know"
   ;
   VALUE SAP851X
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
   VALUE SAP870X
      1                  = "1 Less than 12 months"
      2                  = "2 12 months to less than 3 years"
      3                  = "3 3 years to less than 5 years"
      4                  = "4 5 years to less than 10 years"
      5                  = "5 10 years to less than 15 years"
      6                  = "6 15 years or more"
      7                  = "7 Refused"
      8                  = "8 Not ascertained"
      9                  = "9 Don't know"
   ;
   VALUE SAP871X
      1                  = "1 1"
      2                  = "2 2"
      3                  = "3 3 to 4"
      4                  = "4 5 to 9"
      5                  = "5 10 to 14"
      6                  = "6 15 or more"
      7                  = "7 Refused"
      8                  = "8 Not ascertained"
      9                  = "9 Don't know"
   ;
   VALUE SAP874X
      1                  = "1 Days"
      2                  = "2 Weeks"
      3                  = "3 Months"
      4                  = "4 Years"
      7                  = "7 Refused"
      8                  = "8 Not ascertained"
      9                  = "9 Don't know"
   ;
   VALUE SAP916X
      1                  = "1 Gotten worse"
      2                  = "2 Stayed the same"
      3                  = "3 Improved somewhat"
      4                  = "4 Improved greatly"
      7                  = "7 Refused"
      8                  = "8 Not ascertained"
      9                  = "9 Don't know"
   ;
   VALUE SAP920X
      1                  = "1 Yes"
      2                  = "2 No"
      3                  = "3 Doesn't Work or Go to School"
      7                  = "7 Refused"
      8                  = "8 Not ascertained"
      9                  = "9 Don't know"
   ;
   VALUE SAP934X
      1                  = "1 Days"
      2                  = "2 Weeks"
      3                  = "3 Months"
      7                  = "7 Refused"
      8                  = "8 Not ascertained"
      9                  = "9 Don't know"
   ;
   VALUE SAP954X
      1                  = "1 Day"
      2                  = "2 Week"
      3                  = "3 Month"
      7                  = "7 Refused"
      8                  = "8 Not ascertained"
      9                  = "9 Don't know"
   ;
   VALUE SAP955X
      0                  = "0 None"
      1                  = "1 1 time"
      2                  = "2 2 times"
      3                  = "3 3-4 times"
      4                  = "4 5-7 times"
      5                  = "5 8 or more times"
      7                  = "7 Refused"
      8                  = "8 Not Ascertained"
      9                  = "9 Don't know"
   ;
   VALUE SAP957X
      996                = "996 Doesn't work or go to school"
      997                = "997 Refused"
      998                = "998 Not ascertained"
      999                = "999 Don't know"
   ;

DATA NHIS.SAMADULT;
   * CREATE A SAS DATA SET;
   INFILE ASCIIDAT PAD LRECL=1279;

   * DEFINE LENGTH OF ALL VARIABLES;

   LENGTH

      /* IDN LENGTHS */

      RECTYPE    3   SRVY_YR    4   HHX      $ 6   INTV_QRT   3
      ASSIGNWK   3   FMX      $ 2   FPX      $ 2   WTIA_SA    8
      WTFA_SA    8

      /* UCF LENGTHS */

      REGION     3   STRAT_P    4   PSU_P      3

      /* HHC LENGTHS */

      SEX        3   HISPAN_I   3   RACERPI2   3   MRACRPI2   3
      MRACBPI2   3   AGE_P      3

      /* FID LENGTHS */

      R_MARITL   3

      /* AID LENGTHS */

      PROXYSA    3   PROX1      3   PROX2      3

      /* ASD LENGTHS */

      DOINGLWA   3   WHYNOWKA   3   EVERWRK    3   INDSTRN1   3
      INDSTRN2   3   OCCUPN1    3   OCCUPN2    3   WRKCATA    3
      BUSINC1A   3   LOCALL1A   3   YRSWRKPA   3   WRKLONGH   3
      HOURPDA    3   PDSICKA    3   ONEJOB     3

      /* ACN LENGTHS */

      HYPEV      3   HYPDIFV    3   HYPLOW     3   HYBPCKNO   3
      HYBPCKTP   3   HYBPLEV    3   CLCKNO     3   CLCKTP     3
      CLHI       3   CHDEV      3   ANGEV      3   MIEV       3
      HRTEV      3   STREV      3   EPHEV      3   JAWP       3
      WEA        3   CHE        3   ARM        3   BRTH       3
      AHADO      3   ACPR       3   ACPRLO     3   AASMEV     3
      AASSTILL   3   AASMYR     3   AASMERYR   3   AASMHSP    3
      AASMMC     3   AWZMSWK    4   AWZPIN     3   AASMINST   3
      AASMPMED   3   AASMCAN    3   AASMED     3   AASMDTP    3
      AASWMP     3   AASCLASS   3   AAS_REC    3   AAS_RES    3
      AAS_MON    3   AAPENVLN   3   AAPENVDO   3   CHRFATIG   3
      THYLOW     3   CHRINFCT   3   MULDYST    3   EPILEPSY   3
      CEREBRLP   3   SPINEINJ   3   HEADINJ    3   MOVEDIS    3
      MIGRAINE   3   RHDACHE    3   MULSCLER   3   ULCEV      3
      ULCYR      3   CANEV      3   CNKIND1    3   CNKIND2    3
      CNKIND3    3   CNKIND4    3   CNKIND5    3   CNKIND6    3
      CNKIND7    3   CNKIND8    3   CNKIND9    3   CNKIND10   3
      CNKIND11   3   CNKIND12   3   CNKIND13   3   CNKIND14   3
      CNKIND15   3   CNKIND16   3   CNKIND17   3   CNKIND18   3
      CNKIND19   3   CNKIND20   3   CNKIND21   3   CNKIND22   3
      CNKIND23   3   CNKIND24   3   CNKIND25   3   CNKIND26   3
      CNKIND27   3   CNKIND28   3   CNKIND29   3   CNKIND30   3
      CNKIND31   3   CANAGE1    4   CANAGE2    4   CANAGE3    4
      CANAGE4    4   CANAGE5    4   CANAGE6    4   CANAGE7    4
      CANAGE8    4   CANAGE9    4   CANAGE10   4   CANAGE11   4
      CANAGE12   4   CANAGE13   4   CANAGE14   4   CANAGE15   4
      CANAGE16   4   CANAGE17   4   CANAGE18   4   CANAGE19   4
      CANAGE20   4   CANAGE21   4   CANAGE22   4   CANAGE23   4
      CANAGE24   4   CANAGE25   4   CANAGE26   4   CANAGE27   4
      CANAGE28   4   CANAGE29   4   CANAGE30   4   DIBEV      3
      DIBPRE1    3   DIBAGE     3   DIFAGE2    3   INSLN      3
      DIBPILL    3   AHAYFYR    3   SINYR      3   CBRCHYR    3
      KIDWKYR    3   LIVYR      3   JNTSYMP    3   JMTHP1     3
      JMTHP2     3   JMTHP3     3   JMTHP4     3   JMTHP5     3
      JMTHP6     3   JMTHP7     3   JMTHP8     3   JMTHP9     3
      JMTHP10    3   JMTHP11    3   JMTHP12    3   JMTHP13    3
      JMTHP14    3   JMTHP15    3   JMTHP16    3   JMTHP17    3
      JNTCHR     3   JNTHP      3   ARTH1      3   ARTHLMT    3
      ARTHTYP1   3   ARTHTYP2   3   ARTHTYP3   3   ARTHTYP4   3
      ARTHTYP5   3   ARTHTYP6   3   PAINECK    3   PAINLB     3
      PAINLEG    3   PAINFACE   3   AMIGR      3   ACOLD2W    3
      AINTIL2W   3   PREGNOW    3   HRAIDNOW   3   HRAIDEV    3
      AHEARST1   3   HRWORS     3   HRWHICH    3   HRRIGHT    3
      HRLEFT     3   HRTIN      3   HRTINLNG   3   HRTINOFT   3
      HRTINMUS   3   HRTINSLP   3   HRTNPROB   3   AVISION    3
      ABLIND     3   VIM_DREV   3   VIMLS_DR   3   VIM_CAEV   3
      VIMLS_CA   3   VIMCSURG   3   VIM_GLEV   3   VIMLS_GL   3
      VIM_MDEV   3   VIMLS_MD   3   VIMGLASS   3   VIMREAD    3
      VIMDRIVE   3   AVISREH    3   AVISDEV    3   AVDF_NWS   3
      AVDF_CLS   3   AVDF_NIT   3   AVDF_DRV   3   AVDF_PER   3
      AVDF_CRD   3   AVISEXAM   3   AVISACT    3   AVISPROT   3
      LUPPRT     3   SAD        3   NERVOUS    3   RESTLESS   3
      HOPELESS   3   EFFORT     3   WORTHLS    3   MHAMTMO    3
      DEPRESS    3   GANXIETY   3   PANICD     3

      /* AHS LENGTHS */

      WRKLYR3    3   WKDAYR     4   BEDDAYR    4   AHSTATYR   3
      SPECEQ     3   FLWALK     3   FLCLIMB    3   FLSTAND    3
      FLSIT      3   FLSTOOP    3   FLREACH    3   FLGRASP    3
      FLCARRY    3   FLPUSH     3   FLSHOP     3   FLSOCL     3
      FLRELAX    3   FLA1AR     3   AFLHCA1    3   AFLHCA2    3
      AFLHCA3    3   AFLHCA4    3   AFLHCA5    3   AFLHCA6    3
      AFLHCA7    3   AFLHCA8    3   AFLHCA9    3   AFLHCA10   3
      AFLHCA11   3   AFLHCA12   3   AFLHCA13   3   AFLHCA14   3
      AFLHCA15   3   AFLHCA16   3   AFLHCA17   3   AFLHCA18   3
      AFLHC19_   3   AFLHC20_   3   AFLHC21_   3   AFLHC22_   3
      AFLHC23_   3   AFLHC24_   3   AFLHC25_   3   AFLHC26_   3
      AFLHC27_   3   AFLHC28_   3   AFLHC29_   3   AFLHC30_   3
      AFLHC31_   3   AFLHC32_   3   AFLHC33_   3   AFLHC34_   3
      AFLHCA90   3   AFLHCA91   3   ALTIME1    3   ALUNIT1    3
      ALDURA1    3   ALDURB1    3   ALCHRC1    3   ALTIME2    3
      ALUNIT2    3   ALDURA2    3   ALDURB2    3   ALCHRC2    3
      ALTIME3    3   ALUNIT3    3   ALDURA3    3   ALDURB3    3
      ALCHRC3    3   ALTIME4    3   ALUNIT4    3   ALDURA4    3
      ALDURB4    3   ALCHRC4    3   ALTIME5    3   ALUNIT5    3
      ALDURA5    3   ALDURB5    3   ALCHRC5    3   ALTIME6    3
      ALUNIT6    3   ALDURA6    3   ALDURB6    3   ALCHRC6    3
      ALTIME7    3   ALUNIT7    3   ALDURA7    3   ALDURB7    3
      ALCHRC7    3   ALTIME8    3   ALUNIT8    3   ALDURA8    3
      ALDURB8    3   ALCHRC8    3   ALTIME9    3   ALUNIT9    3
      ALDURA9    3   ALDURB9    3   ALCHRC9    3   ALTIME10   3
      ALUNIT10   3   ALDURA10   3   ALDURB10   3   ALCHRC10   3
      ALTIME11   3   ALUNIT11   3   ALDURA11   3   ALDURB11   3
      ALCHRC11   3   ALTIME12   3   ALUNIT12   3   ALDURA12   3
      ALDURB12   3   ALCHRC12   3   ALTIME13   3   ALUNIT13   3
      ALDURA13   3   ALDURB13   3   ALCHRC13   3   ALTIME14   3
      ALUNIT14   3   ALDURA14   3   ALDURB14   3   ALCHRC14   3
      ALTIME15   3   ALUNIT15   3   ALDURA15   3   ALDURB15   3
      ALCHRC15   3   ALTIME16   3   ALUNIT16   3   ALDURA16   3
      ALDURB16   3   ALCHRC16   3   ALTIME17   3   ALUNIT17   3
      ALDURA17   3   ALDURB17   3   ALCHRC17   3   ALTIME18   3
      ALUNIT18   3   ALDURA18   3   ALDURB18   3   ALCHRC18   3
      ALTIME19   3   ALUNIT19   3   ALDURA19   3   ALDURB19   3
      ALCHRC19   3   ALTIME20   3   ALUNIT20   3   ALDURA20   3
      ALDURB20   3   ALCHRC20   3   ALTIME21   3   ALUNIT21   3
      ALDURA21   3   ALDURB21   3   ALCHRC21   3   ALTIME22   3
      ALUNIT22   3   ALDURA22   3   ALDURB22   3   ALCHRC22   3
      ALTIME23   3   ALUNIT23   3   ALDURA23   3   ALDURB23   3
      ALCHRC23   3   ALTIME24   3   ALUNIT24   3   ALDURA24   3
      ALDURB24   3   ALCHRC24   3   ALTIME25   3   ALUNIT25   3
      ALDURA25   3   ALDURB25   3   ALCHRC25   3   ALTIME26   3
      ALUNIT26   3   ALDURA26   3   ALDURB26   3   ALCHRC26   3
      ALTIME27   3   ALUNIT27   3   ALDURA27   3   ALDURB27   3
      ALCHRC27   3   ALTIME28   3   ALUNIT28   3   ALDURA28   3
      ALDURB28   3   ALCHRC28   3   ALTIME29   3   ALUNIT29   3
      ALDURA29   3   ALDURB29   3   ALCHRC29   3   ALTIME30   3
      ALUNIT30   3   ALDURA30   3   ALDURB30   3   ALCHRC30   3
      ALTIME31   3   ALUNIT31   3   ALDURA31   3   ALDURB31   3
      ALCHRC31   3   ALTIME32   3   ALUNIT32   3   ALDURA32   3
      ALDURB32   3   ALCHRC32   3   ALTIME33   3   ALUNIT33   3
      ALDURA33   3   ALDURB33   3   ALCHRC33   3   ALTIME34   3
      ALUNIT34   3   ALDURA34   3   ALDURB34   3   ALCHRC34   3
      ALTIME90   3   ALUNIT90   3   ALDURA90   3   ALDURB90   3
      ALCHRC90   3   ALTIME91   3   ALUNIT91   3   ALDURA91   3
      ALDURB91   3   ALCHRC91   3   ALCNDRT    3   ALCHRONR   3

      /* AHB LENGTHS */

      SMKEV      3   SMKREG     3   SMKNOW     3   SMKSTAT2   3
      SMKQTNO    3   SMKQTTP    3   SMKQTY     3   CIGSDA1    3
      CIGDAMO    3   CIGSDA2    3   CIGSDAY    3   CIGQTYR    3
      VIGNO      4   VIGTP      3   VIGFREQW   3   VIGLNGNO   4
      VIGLNGTP   3   VIGMIN     4   MODNO      4   MODTP      3
      MODFREQW   3   MODLNGNO   4   MODLNGTP   3   MODMIN     4
      STRNGNO    4   STRNGTP    3   STRFREQW   3   ALC1YR     3
      ALCLIFE    3   ALC12MNO   4   ALC12MTP   3   ALC12MWK   3
      ALC12MYR   4   ALCAMT     3   ALCSTAT    3   ALC5UPNO   4
      ALC5UPTP   3   ALC5UPYR   4   AHEIGHT    3   AWEIGHTP   4
      BMI        8   SLEEP      3

      /* AAU LENGTHS */

      AUSUALPL   3   APLKIND    3   AHCPLROU   3   AHCPLKND   3
      AHCCHGYR   3   AHCCHGHI   3   AHCDLYR1   3   AHCDLYR2   3
      AHCDLYR3   3   AHCDLYR4   3   AHCDLYR5   3   AHCAFYR1   3
      AHCAFYR2   3   AHCAFYR3   3   AHCAFYR4   3   ADNLONG2   3
      AHCSYR1    3   AHCSYR2    3   AHCSYR3    3   AHCSYR4    3
      AHCSYR5    3   AHCSYR6    3   AHCSYR7    3   AHCSYR8    3
      AHCSYR9    3   AHCSYR10   3   AHERNOY2   3   AHCHYR     3
      AHCHMOYR   3   AHCHNOY2   3   AHCNOYR2   3   ASRGYR     3
      ASRGNOYR   3   AMDLONGR   3   SHTFLUYR   3   ASHFLU_M   3
      ASHFLU_Y   4   SPRFLUYR   3   ASPFLU_M   3   ASPFLU_Y   4
      SHTPNUYR   3   APOX       3   APOX12MO   3   AHEP       3
      AHEPLIV    3   SHTHEPB    3   SHEPDOS    3   SHTHEPA    3
      SHEPANUM   3   SHINGLES   3   SHTTD      3   SHTTD05    3
      SHTTDAP    3   LIVEV      3   TRAVEL     3

      /* AOH LENGTHS */

      OCOND      3   OBTWS      3   OEMB       3   OREAS_1    3
      OREAS_2    3   OREAS_3    3   OREAS_4    3   OPROB_01   3
      OPROB_02   3   OPROB_03   3   OPROB_04   3   OPROB_05   3
      OPROB_06   3   OPROB_07   3   OPROB_08   3   OPROB_09   3
      OPROB_10   3   OPROB_11   3   OPROB_12   3   ODENT1     3
      ODENT2     3   ONODEN_1   3   ONODEN_2   3   ONODEN_3   3
      ONODEN_4   3   ONODEN_5   3   ONODEN_6   3   ONODEN_7   3
      OINT_1     3   OINT_2     3   OINT_3     3   OINT_4     3
      OCEXAM     3   OCTONG     3   OCNECK     3   OCEXWHEN   3
      OEXCHECK   3   OCEXPROF   3

      /* ADS LENGTHS */

      BLDGV      3   BLDG12M    3   HIVTST     3   WHYTST_R   3
      TST12M_M   3   TST12M_Y   4   TIMETST    3   REATST_C   3
      REASWHOR   3   LASTST_C   3   CLNTYP_C   3   WHOADM     3
      GIVNAM     3   EXTST12M   3   CHNSADSP   3   STMTRU     3
      STD        3   STDDOC     3   STDWHER    3   TBHRD      3
      TBKNOW     3   TB         3   TBSPRD1    3   TBSPRD2    3
      TBSPRD3    3   TBSPRD4    3   TBSPRD5    3   TBSPRD6    3
      TBCURED    3   TBCHANC    3   TBSHAME    3   HOMELESS   3

      /* NAF LENGTHS */

      SUN1_SHA   3   SUN1_CAP   3   SUN1_HAT   3   SUN2_LGS   3
      SUN2_LGP   3   SUN2_SCR   3   SPF        3   SPFSCALE   3
      SNNUM      4   PAPHAD     3   PAP6YR     3   RPAP1_MT   3
      RPAP1_YR   4   RPAP1N     3   RPAP1T     3   RPAP2CA    3
      PAPREAS    3   PAPABN     3   PAPNOT     3   MDRECPAP   3
      PAPWHEN    3   HYST       3   HPVHRD     3   HPVCAUS    3
      HPVSEXCN   3   HPVTRET    3   HPVHAD     3   SHHPVHRD   3
      SHTHPV     3   SHHPVDOS   3   HPVINT     3   HPVNOT     3
      HPVCOST    3   HPVLOCST   3   MAMHAD     3   MAM6YR     3
      RMAM1_MT   3   RMAM1_YR   4   RMAM1N     3   RMAM1T     3
      RMAM2CA    3   MAMREAS    3   MDRECMAM   3   MAMINFO    3
      MAMDELAY   3   HRTEVER    3   HRTNOW     3   HRTLONG    3
      PSAHAD     3   RPSA1_MT   3   RPSA1_YR   4   RPSA1N     3
      RPSA1T     3   RPSA2      3   PSAREAS    3   MDRECPSA   3
      CREHAD     3   RCRE1_MT   3   RCRE1_YR   4   RCRE1N     3
      RCRE1T     3   RCRE2      3   CRENAM     3   CREREAS    3
      CREREC     3   HFOBHAD    3   RHFO1_MT   3   RHFO1_YR   4
      RHFO1N     3   RHFO1T     3   RHFO2      3   MDHFOB     3

      /* PAF LENGTHS */

      HYPPREG    3   HLOSWGT    3   WGTADEV    3   WGTADNOW   3
      LOWSLT     3   LOWSLTEV   3   LOWSLTNW   3   EXERC      3
      EXERCEV    3   EXERCNW    3   HBPALC     3   HBPALCEV   3
      HBPALCNW   3   HYPMEDEV   3   HYPMED     3   HYMDMED    3

      /* BAL LENGTHS */

      BAID_01    3   BAID_02    3   BAID_03    3   BAID_04    3
      BAID_05    3   BAID_06    3   BAID_07    3   BAID_08    3
      BBRAC1     3   BBRAC2     3   BBRAC3     3   BBRAC4     3
      BBRAC5     3   BBRAC6     3   BBRAC7     3   BART1      3
      BART2      3   BART3      3   BART4      3   BART5      3
      BDIZZ      3   BBAL_01    3   BBAL_02    3   BBAL_03    3
      BBAL_04    3   BBAL_05    3   BBAL_06    3   BBAL_07    3
      BBAL_08    3   BBAL_09    3   BBAL_10    3   BBAL_11    3
      BBAL_12    3   BBAL_13    3   BBAL_14    3   BBAL_15    3
      BBALCT     3   BTYPE_01   3   BTYPE_02   3   BTYPE_03   3
      BTYPE_04   3   BTYPE_05   3   BTYPE_06   3   BTYPECT    3
      BBOTH      3   BAGE       4   BLONG      3   BOFTEN     3
      BLAST      3   BTRIG_01   3   BTRIG_02   3   BTRIG_03   3
      BTRIG_04   3   BTRIG_05   3   BTRIG_06   3   BTRIG_07   3
      BTRIG_08   3   BTRIG_09   3   BTRIG_10   3   BTRIG_11   3
      BTRIG_12   3   BTRIG_13   3   BSAME_01   3   BSAME_02   3
      BSAME_03   3   BSAME_04   3   BSAME_05   3   BSAME_06   3
      BSAME_07   3   BSAME_08   3   BSAME_09   3   BSAME_10   3
      BSAME_11   3   BSAME_12   3   BSAME_13   3   BSAME_14   3
      BSAME_15   3   BSAME_16   3   BSAME_17   3   BSAME_18   3
      BSAME_19   3   BSAME_20   3   BSAME_21   3   BSAME_22   3
      BONLY_01   3   BONLY_02   3   BONLY_03   3   BONLY_04   3
      BONLY_05   3   BONLY_06   3   BONLY_07   3   BONLY_08   3
      BONLY_09   3   BONLY_10   3   BONLY_11   3   BONLY_12   3
      BONLY_13   3   BONLY_14   3   BONLY_15   3   BONLY_16   3
      BONLY_17   3   BONLY_18   3   BONLY_19   3   BONLY_20   3
      BONLY_21   3   BONLY_22   3   BHOSP      3   BHOSPNO    3
      BHP        3   BHP_01     3   BHP_02     3   BHP_03     3
      BHP_04     3   BHP_05     3   BHP_06     3   BHP_07     3
      BHP_08     3   BHP_09     3   BHP_10     3   BHP_11     3
      BHP_12     3   BHP_13     3   BHP_14     3   BHP_15     3
      BHP_16     3   B5YRS      3   BFIRST     3   BDIFF      3
      BHELP      3   BTHLP_NO   4   BTHLP_TP   3   BDIAG      3
      BCAUS_01   3   BCAUS_02   3   BCAUS_03   3   BCAUS_04   3
      BCAUS_05   3   BCAUS_06   3   BCAUS_07   3   BCAUS_08   3
      BCAUS_09   3   BCAUS_10   3   BCAUS_11   3   BCAUS_12   3
      BCAUS_13   3   BCAUS_14   3   BCAUS_15   3   BCAUS_16   3
      BTRET      3   BTRET_01   3   BTRET_02   3   BTRET_03   3
      BTRET_04   3   BTRET_05   3   BTRET_06   3   BTRET_07   3
      BTRET_08   3   BTRET_09   3   BTRET_10   3   BTRET_11   3
      BTRET_12   3   BTRET_13   3   BTRET_14   3   BTRET_15   3
      BTRET_16   3   BTRET_17   3   BTRET_18   3   BTRET_19   3
      BTRET_20   3   BTRET_21   3   BTRET_22   3   BTRET_23   3
      BSTAT      3   BMEDIC     3   BBETT      3   BCHNG      3
      BCHNG_01   3   BCHNG_02   3   BCHNG_03   3   BCHNG_04   3
      BCHNG_05   3   BCHNG_06   3   BCHNG_07   3   BCHNG_08   3
      BCHNG_09   3   BCHNG_10   3   BMISSWK    3   BLMS_NO    4
      BLMS_TP    3   BM12_NO    4   BM12_TP    3   BPROB      3
      BMED_01    3   BMED_02    3   BMED_03    3   BMED_04    3
      BMED_05    3   BMED_06    3   BMED_07    3   BMED_08    3
      BBIO       3   BFALL5     3   BFL_01     3   BFL_02     3
      BFL_03     3   BFL_04     3   BFL_05     3   BFL_06     3
      BFALL12    3   BF12_NO    4   BF12_TP    3   BFTIME     3
      BINJ       3   BIJMS_NO   4   BIJMS_TP   3   BFWHY_01   3
      BFWHY_02   3   BFWHY_03   3   BFWHY_04   3   BFWHY_05   3
      BFWHY_06   3   BFWHY_07   3   BFWHY_08   3   BFWHY_09   3
      BFWHY_10   3   BFWHY_11   3   BFWHY_12   3   BFWHY_13   3
      BFWHY_14   3   BFWHY_15   3   BFWHY_16   3   BFWHY_17   3
      BFWHY_18   3   BFWHY_19   3   BFWHY_20   3   BFWHY_21   3
      BFWHY_22   3 ;

   * INPUT ALL VARIABLES;

   INPUT

      /* IDN LOCATIONS */

      RECTYPE       1 -   2    SRVY_YR       3 -   6
      HHX      $    7 -  12    INTV_QRT     13 -  13
      ASSIGNWK     14 -  15    FMX      $   16 -  17
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
      PROX2        53 -  53

      /* ASD LOCATIONS */

      DOINGLWA     54 -  54    WHYNOWKA     55 -  56
      EVERWRK      57 -  57    INDSTRN1     58 -  59
      INDSTRN2     60 -  61    OCCUPN1      62 -  63
      OCCUPN2      64 -  65    WRKCATA      66 -  66
      BUSINC1A     67 -  67    LOCALL1A     68 -  69
      YRSWRKPA     70 -  71    WRKLONGH     72 -  72
      HOURPDA      73 -  73    PDSICKA      74 -  74
      ONEJOB       75 -  75

      /* ACN LOCATIONS */

      HYPEV        76 -  76    HYPDIFV      77 -  77
      HYPLOW       78 -  78    HYBPCKNO     79 -  80
      HYBPCKTP     81 -  81    HYBPLEV      82 -  82
      CLCKNO       83 -  84    CLCKTP       85 -  85
      CLHI         86 -  86    CHDEV        87 -  87
      ANGEV        88 -  88    MIEV         89 -  89
      HRTEV        90 -  90    STREV        91 -  91
      EPHEV        92 -  92    JAWP         93 -  93
      WEA          94 -  94    CHE          95 -  95
      ARM          96 -  96    BRTH         97 -  97
      AHADO        98 -  98    ACPR         99 -  99
      ACPRLO      100 - 100    AASMEV      101 - 101
      AASSTILL    102 - 102    AASMYR      103 - 103
      AASMERYR    104 - 104    AASMHSP     105 - 105
      AASMMC      106 - 106    AWZMSWK     107 - 109
      AWZPIN      110 - 110    AASMINST    111 - 111
      AASMPMED    112 - 112    AASMCAN     113 - 113
      AASMED      114 - 114    AASMDTP     115 - 115
      AASWMP      116 - 116    AASCLASS    117 - 117
      AAS_REC     118 - 118    AAS_RES     119 - 119
      AAS_MON     120 - 120    AAPENVLN    121 - 121
      AAPENVDO    122 - 122    CHRFATIG    123 - 123
      THYLOW      124 - 124    CHRINFCT    125 - 125
      MULDYST     126 - 126    EPILEPSY    127 - 127
      CEREBRLP    128 - 128    SPINEINJ    129 - 129
      HEADINJ     130 - 130    MOVEDIS     131 - 131
      MIGRAINE    132 - 132    RHDACHE     133 - 133
      MULSCLER    134 - 134    ULCEV       135 - 135
      ULCYR       136 - 136    CANEV       137 - 137
      CNKIND1     138 - 138    CNKIND2     139 - 139
      CNKIND3     140 - 140    CNKIND4     141 - 141
      CNKIND5     142 - 142    CNKIND6     143 - 143
      CNKIND7     144 - 144    CNKIND8     145 - 145
      CNKIND9     146 - 146    CNKIND10    147 - 147
      CNKIND11    148 - 148    CNKIND12    149 - 149
      CNKIND13    150 - 150    CNKIND14    151 - 151
      CNKIND15    152 - 152    CNKIND16    153 - 153
      CNKIND17    154 - 154    CNKIND18    155 - 155
      CNKIND19    156 - 156    CNKIND20    157 - 157
      CNKIND21    158 - 158    CNKIND22    159 - 159
      CNKIND23    160 - 160    CNKIND24    161 - 161
      CNKIND25    162 - 162    CNKIND26    163 - 163
      CNKIND27    164 - 164    CNKIND28    165 - 165
      CNKIND29    166 - 166    CNKIND30    167 - 167
      CNKIND31    168 - 168    CANAGE1     169 - 171
      CANAGE2     172 - 174    CANAGE3     175 - 177
      CANAGE4     178 - 180    CANAGE5     181 - 183
      CANAGE6     184 - 186    CANAGE7     187 - 189
      CANAGE8     190 - 192    CANAGE9     193 - 195
      CANAGE10    196 - 198    CANAGE11    199 - 201
      CANAGE12    202 - 204    CANAGE13    205 - 207
      CANAGE14    208 - 210    CANAGE15    211 - 213
      CANAGE16    214 - 216    CANAGE17    217 - 219
      CANAGE18    220 - 222    CANAGE19    223 - 225
      CANAGE20    226 - 228    CANAGE21    229 - 231
      CANAGE22    232 - 234    CANAGE23    235 - 237
      CANAGE24    238 - 240    CANAGE25    241 - 243
      CANAGE26    244 - 246    CANAGE27    247 - 249
      CANAGE28    250 - 252    CANAGE29    253 - 255
      CANAGE30    256 - 258    DIBEV       259 - 259
      DIBPRE1     260 - 260    DIBAGE      261 - 262
      DIFAGE2     263 - 264    INSLN       265 - 265
      DIBPILL     266 - 266    AHAYFYR     267 - 267
      SINYR       268 - 268    CBRCHYR     269 - 269
      KIDWKYR     270 - 270    LIVYR       271 - 271
      JNTSYMP     272 - 272    JMTHP1      273 - 273
      JMTHP2      274 - 274    JMTHP3      275 - 275
      JMTHP4      276 - 276    JMTHP5      277 - 277
      JMTHP6      278 - 278    JMTHP7      279 - 279
      JMTHP8      280 - 280    JMTHP9      281 - 281
      JMTHP10     282 - 282    JMTHP11     283 - 283
      JMTHP12     284 - 284    JMTHP13     285 - 285
      JMTHP14     286 - 286    JMTHP15     287 - 287
      JMTHP16     288 - 288    JMTHP17     289 - 289
      JNTCHR      290 - 290    JNTHP       291 - 291
      ARTH1       292 - 292    ARTHLMT     293 - 293
      ARTHTYP1    294 - 294    ARTHTYP2    295 - 295
      ARTHTYP3    296 - 296    ARTHTYP4    297 - 297
      ARTHTYP5    298 - 298    ARTHTYP6    299 - 299
      PAINECK     300 - 300    PAINLB      301 - 301
      PAINLEG     302 - 302    PAINFACE    303 - 303
      AMIGR       304 - 304    ACOLD2W     305 - 305
      AINTIL2W    306 - 306    PREGNOW     307 - 307
      HRAIDNOW    308 - 308    HRAIDEV     309 - 309
      AHEARST1    310 - 310    HRWORS      311 - 311
      HRWHICH     312 - 312    HRRIGHT     313 - 313
      HRLEFT      314 - 314    HRTIN       315 - 315
      HRTINLNG    316 - 317    HRTINOFT    318 - 318
      HRTINMUS    319 - 319    HRTINSLP    320 - 320
      HRTNPROB    321 - 321    AVISION     322 - 322
      ABLIND      323 - 323    VIM_DREV    324 - 324
      VIMLS_DR    325 - 325    VIM_CAEV    326 - 326
      VIMLS_CA    327 - 327    VIMCSURG    328 - 328
      VIM_GLEV    329 - 329    VIMLS_GL    330 - 330
      VIM_MDEV    331 - 331    VIMLS_MD    332 - 332
      VIMGLASS    333 - 333    VIMREAD     334 - 334
      VIMDRIVE    335 - 335    AVISREH     336 - 336
      AVISDEV     337 - 337    AVDF_NWS    338 - 338
      AVDF_CLS    339 - 339    AVDF_NIT    340 - 340
      AVDF_DRV    341 - 341    AVDF_PER    342 - 342
      AVDF_CRD    343 - 343    AVISEXAM    344 - 344
      AVISACT     345 - 345    AVISPROT    346 - 346
      LUPPRT      347 - 347    SAD         348 - 348
      NERVOUS     349 - 349    RESTLESS    350 - 350
      HOPELESS    351 - 351    EFFORT      352 - 352
      WORTHLS     353 - 353    MHAMTMO     354 - 354
      DEPRESS     355 - 355    GANXIETY    356 - 356
      PANICD      357 - 357

      /* AHS LOCATIONS */

      WRKLYR3     358 - 358    WKDAYR      359 - 361
      BEDDAYR     362 - 364    AHSTATYR    365 - 365
      SPECEQ      366 - 366    FLWALK      367 - 367
      FLCLIMB     368 - 368    FLSTAND     369 - 369
      FLSIT       370 - 370    FLSTOOP     371 - 371
      FLREACH     372 - 372    FLGRASP     373 - 373
      FLCARRY     374 - 374    FLPUSH      375 - 375
      FLSHOP      376 - 376    FLSOCL      377 - 377
      FLRELAX     378 - 378    FLA1AR      379 - 379
      AFLHCA1     380 - 380    AFLHCA2     381 - 381
      AFLHCA3     382 - 382    AFLHCA4     383 - 383
      AFLHCA5     384 - 384    AFLHCA6     385 - 385
      AFLHCA7     386 - 386    AFLHCA8     387 - 387
      AFLHCA9     388 - 388    AFLHCA10    389 - 389
      AFLHCA11    390 - 390    AFLHCA12    391 - 391
      AFLHCA13    392 - 392    AFLHCA14    393 - 393
      AFLHCA15    394 - 394    AFLHCA16    395 - 395
      AFLHCA17    396 - 396    AFLHCA18    397 - 397
      AFLHC19_    398 - 398    AFLHC20_    399 - 399
      AFLHC21_    400 - 400    AFLHC22_    401 - 401
      AFLHC23_    402 - 402    AFLHC24_    403 - 403
      AFLHC25_    404 - 404    AFLHC26_    405 - 405
      AFLHC27_    406 - 406    AFLHC28_    407 - 407
      AFLHC29_    408 - 408    AFLHC30_    409 - 409
      AFLHC31_    410 - 410    AFLHC32_    411 - 411
      AFLHC33_    412 - 412    AFLHC34_    413 - 413
      AFLHCA90    414 - 414    AFLHCA91    415 - 415
      ALTIME1     416 - 417    ALUNIT1     418 - 418
      ALDURA1     419 - 420    ALDURB1     421 - 421
      ALCHRC1     422 - 422    ALTIME2     423 - 424
      ALUNIT2     425 - 425    ALDURA2     426 - 427
      ALDURB2     428 - 428    ALCHRC2     429 - 429
      ALTIME3     430 - 431    ALUNIT3     432 - 432
      ALDURA3     433 - 434    ALDURB3     435 - 435
      ALCHRC3     436 - 436    ALTIME4     437 - 438
      ALUNIT4     439 - 439    ALDURA4     440 - 441
      ALDURB4     442 - 442    ALCHRC4     443 - 443
      ALTIME5     444 - 445    ALUNIT5     446 - 446
      ALDURA5     447 - 448    ALDURB5     449 - 449
      ALCHRC5     450 - 450    ALTIME6     451 - 452
      ALUNIT6     453 - 453    ALDURA6     454 - 455
      ALDURB6     456 - 456    ALCHRC6     457 - 457
      ALTIME7     458 - 459    ALUNIT7     460 - 460
      ALDURA7     461 - 462    ALDURB7     463 - 463
      ALCHRC7     464 - 464    ALTIME8     465 - 466
      ALUNIT8     467 - 467    ALDURA8     468 - 469
      ALDURB8     470 - 470    ALCHRC8     471 - 471
      ALTIME9     472 - 473    ALUNIT9     474 - 474
      ALDURA9     475 - 476    ALDURB9     477 - 477
      ALCHRC9     478 - 478    ALTIME10    479 - 480
      ALUNIT10    481 - 481    ALDURA10    482 - 483
      ALDURB10    484 - 484    ALCHRC10    485 - 485
      ALTIME11    486 - 487    ALUNIT11    488 - 488
      ALDURA11    489 - 490    ALDURB11    491 - 491
      ALCHRC11    492 - 492    ALTIME12    493 - 494
      ALUNIT12    495 - 495    ALDURA12    496 - 497
      ALDURB12    498 - 498    ALCHRC12    499 - 499
      ALTIME13    500 - 501    ALUNIT13    502 - 502
      ALDURA13    503 - 504    ALDURB13    505 - 505
      ALCHRC13    506 - 506    ALTIME14    507 - 508
      ALUNIT14    509 - 509    ALDURA14    510 - 511
      ALDURB14    512 - 512    ALCHRC14    513 - 513
      ALTIME15    514 - 515    ALUNIT15    516 - 516
      ALDURA15    517 - 518    ALDURB15    519 - 519
      ALCHRC15    520 - 520    ALTIME16    521 - 522
      ALUNIT16    523 - 523    ALDURA16    524 - 525
      ALDURB16    526 - 526    ALCHRC16    527 - 527
      ALTIME17    528 - 529    ALUNIT17    530 - 530
      ALDURA17    531 - 532    ALDURB17    533 - 533
      ALCHRC17    534 - 534    ALTIME18    535 - 536
      ALUNIT18    537 - 537    ALDURA18    538 - 539
      ALDURB18    540 - 540    ALCHRC18    541 - 541
      ALTIME19    542 - 543    ALUNIT19    544 - 544
      ALDURA19    545 - 546    ALDURB19    547 - 547
      ALCHRC19    548 - 548    ALTIME20    549 - 550
      ALUNIT20    551 - 551    ALDURA20    552 - 553
      ALDURB20    554 - 554    ALCHRC20    555 - 555
      ALTIME21    556 - 557    ALUNIT21    558 - 558
      ALDURA21    559 - 560    ALDURB21    561 - 561
      ALCHRC21    562 - 562    ALTIME22    563 - 564
      ALUNIT22    565 - 565    ALDURA22    566 - 567
      ALDURB22    568 - 568    ALCHRC22    569 - 569
      ALTIME23    570 - 571    ALUNIT23    572 - 572
      ALDURA23    573 - 574    ALDURB23    575 - 575
      ALCHRC23    576 - 576    ALTIME24    577 - 578
      ALUNIT24    579 - 579    ALDURA24    580 - 581
      ALDURB24    582 - 582    ALCHRC24    583 - 583
      ALTIME25    584 - 585    ALUNIT25    586 - 586
      ALDURA25    587 - 588    ALDURB25    589 - 589
      ALCHRC25    590 - 590    ALTIME26    591 - 592
      ALUNIT26    593 - 593    ALDURA26    594 - 595
      ALDURB26    596 - 596    ALCHRC26    597 - 597
      ALTIME27    598 - 599    ALUNIT27    600 - 600
      ALDURA27    601 - 602    ALDURB27    603 - 603
      ALCHRC27    604 - 604    ALTIME28    605 - 606
      ALUNIT28    607 - 607    ALDURA28    608 - 609
      ALDURB28    610 - 610    ALCHRC28    611 - 611
      ALTIME29    612 - 613    ALUNIT29    614 - 614
      ALDURA29    615 - 616    ALDURB29    617 - 617
      ALCHRC29    618 - 618    ALTIME30    619 - 620
      ALUNIT30    621 - 621    ALDURA30    622 - 623
      ALDURB30    624 - 624    ALCHRC30    625 - 625
      ALTIME31    626 - 627    ALUNIT31    628 - 628
      ALDURA31    629 - 630    ALDURB31    631 - 631
      ALCHRC31    632 - 632    ALTIME32    633 - 634
      ALUNIT32    635 - 635    ALDURA32    636 - 637
      ALDURB32    638 - 638    ALCHRC32    639 - 639
      ALTIME33    640 - 641    ALUNIT33    642 - 642
      ALDURA33    643 - 644    ALDURB33    645 - 645
      ALCHRC33    646 - 646    ALTIME34    647 - 648
      ALUNIT34    649 - 649    ALDURA34    650 - 651
      ALDURB34    652 - 652    ALCHRC34    653 - 653
      ALTIME90    654 - 655    ALUNIT90    656 - 656
      ALDURA90    657 - 658    ALDURB90    659 - 659
      ALCHRC90    660 - 660    ALTIME91    661 - 662
      ALUNIT91    663 - 663    ALDURA91    664 - 665
      ALDURB91    666 - 666    ALCHRC91    667 - 667
      ALCNDRT     668 - 668    ALCHRONR    669 - 669


      /* AHB LOCATIONS */

      SMKEV       670 - 670    SMKREG      671 - 672
      SMKNOW      673 - 673    SMKSTAT2    674 - 674
      SMKQTNO     675 - 676    SMKQTTP     677 - 677
      SMKQTY      678 - 679    CIGSDA1     680 - 681
      CIGDAMO     682 - 683    CIGSDA2     684 - 685
      CIGSDAY     686 - 687    CIGQTYR     688 - 688
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
      ALCSTAT     734 - 735    ALC5UPNO    736 - 738
      ALC5UPTP    739 - 739    ALC5UPYR    740 - 742
      AHEIGHT     743 - 744    AWEIGHTP    745 - 747
      BMI         748 - 751 .2 SLEEP       752 - 753


      /* AAU LOCATIONS */

      AUSUALPL    754 - 754    APLKIND     755 - 755
      AHCPLROU    756 - 756    AHCPLKND    757 - 757
      AHCCHGYR    758 - 758    AHCCHGHI    759 - 759
      AHCDLYR1    760 - 760    AHCDLYR2    761 - 761
      AHCDLYR3    762 - 762    AHCDLYR4    763 - 763
      AHCDLYR5    764 - 764    AHCAFYR1    765 - 765
      AHCAFYR2    766 - 766    AHCAFYR3    767 - 767
      AHCAFYR4    768 - 768    ADNLONG2    769 - 769
      AHCSYR1     770 - 770    AHCSYR2     771 - 771
      AHCSYR3     772 - 772    AHCSYR4     773 - 773
      AHCSYR5     774 - 774    AHCSYR6     775 - 775
      AHCSYR7     776 - 776    AHCSYR8     777 - 777
      AHCSYR9     778 - 778    AHCSYR10    779 - 779
      AHERNOY2    780 - 781    AHCHYR      782 - 782
      AHCHMOYR    783 - 784    AHCHNOY2    785 - 786
      AHCNOYR2    787 - 788    ASRGYR      789 - 789
      ASRGNOYR    790 - 791    AMDLONGR    792 - 792
      SHTFLUYR    793 - 793    ASHFLU_M    794 - 795
      ASHFLU_Y    796 - 799    SPRFLUYR    800 - 800
      ASPFLU_M    801 - 802    ASPFLU_Y    803 - 806
      SHTPNUYR    807 - 807    APOX        808 - 808
      APOX12MO    809 - 809    AHEP        810 - 810
      AHEPLIV     811 - 811    SHTHEPB     812 - 812
      SHEPDOS     813 - 813    SHTHEPA     814 - 814
      SHEPANUM    815 - 816    SHINGLES    817 - 817
      SHTTD       818 - 818    SHTTD05     819 - 819
      SHTTDAP     820 - 820    LIVEV       821 - 821
      TRAVEL      822 - 822

      /* AOH LOCATIONS */

      OCOND       823 - 823    OBTWS       824 - 824
      OEMB        825 - 825    OREAS_1     826 - 827
      OREAS_2     828 - 829    OREAS_3     830 - 831
      OREAS_4     832 - 833    OPROB_01    834 - 834
      OPROB_02    835 - 835    OPROB_03    836 - 836
      OPROB_04    837 - 837    OPROB_05    838 - 838
      OPROB_06    839 - 839    OPROB_07    840 - 840
      OPROB_08    841 - 841    OPROB_09    842 - 842
      OPROB_10    843 - 843    OPROB_11    844 - 844
      OPROB_12    845 - 845    ODENT1      846 - 846
      ODENT2      847 - 847    ONODEN_1    848 - 848
      ONODEN_2    849 - 849    ONODEN_3    850 - 850
      ONODEN_4    851 - 851    ONODEN_5    852 - 852
      ONODEN_6    853 - 853    ONODEN_7    854 - 854
      OINT_1      855 - 855    OINT_2      856 - 856
      OINT_3      857 - 857    OINT_4      858 - 858
      OCEXAM      859 - 859    OCTONG      860 - 860
      OCNECK      861 - 861    OCEXWHEN    862 - 862
      OEXCHECK    863 - 863    OCEXPROF    864 - 864


      /* ADS LOCATIONS */

      BLDGV       865 - 865    BLDG12M     866 - 866
      HIVTST      867 - 867    WHYTST_R    868 - 869
      TST12M_M    870 - 871    TST12M_Y    872 - 875
      TIMETST     876 - 876    REATST_C    877 - 878
      REASWHOR    879 - 879    LASTST_C    880 - 881
      CLNTYP_C    882 - 883    WHOADM      884 - 884
      GIVNAM      885 - 885    EXTST12M    886 - 886
      CHNSADSP    887 - 887    STMTRU      888 - 888
      STD         889 - 889    STDDOC      890 - 890
      STDWHER     891 - 891    TBHRD       892 - 892
      TBKNOW      893 - 893    TB          894 - 894
      TBSPRD1     895 - 895    TBSPRD2     896 - 896
      TBSPRD3     897 - 897    TBSPRD4     898 - 898
      TBSPRD5     899 - 899    TBSPRD6     900 - 900
      TBCURED     901 - 901    TBCHANC     902 - 902
      TBSHAME     903 - 903    HOMELESS    904 - 904


      /* NAF LOCATIONS */

      SUN1_SHA    905 - 905    SUN1_CAP    906 - 906
      SUN1_HAT    907 - 907    SUN2_LGS    908 - 908
      SUN2_LGP    909 - 909    SUN2_SCR    910 - 910
      SPF         911 - 912    SPFSCALE    913 - 913
      SNNUM       914 - 916    PAPHAD      917 - 917
      PAP6YR      918 - 919    RPAP1_MT    920 - 921
      RPAP1_YR    922 - 925    RPAP1N      926 - 927
      RPAP1T      928 - 928    RPAP2CA     929 - 929
      PAPREAS     930 - 930    PAPABN      931 - 931
      PAPNOT      932 - 933    MDRECPAP    934 - 934
      PAPWHEN     935 - 936    HYST        937 - 937
      HPVHRD      938 - 938    HPVCAUS     939 - 939
      HPVSEXCN    940 - 940    HPVTRET     941 - 941
      HPVHAD      942 - 942    SHHPVHRD    943 - 943
      SHTHPV      944 - 944    SHHPVDOS    945 - 946
      HPVINT      947 - 947    HPVNOT      948 - 949
      HPVCOST     950 - 950    HPVLOCST    951 - 951
      MAMHAD      952 - 952    MAM6YR      953 - 954
      RMAM1_MT    955 - 956    RMAM1_YR    957 - 960
      RMAM1N      961 - 962    RMAM1T      963 - 963
      RMAM2CA     964 - 964    MAMREAS     965 - 965
      MDRECMAM    966 - 966    MAMINFO     967 - 967
      MAMDELAY    968 - 968    HRTEVER     969 - 969
      HRTNOW      970 - 970    HRTLONG     971 - 971
      PSAHAD      972 - 972    RPSA1_MT    973 - 974
      RPSA1_YR    975 - 978    RPSA1N      979 - 980
      RPSA1T      981 - 981    RPSA2       982 - 982
      PSAREAS     983 - 983    MDRECPSA    984 - 984
      CREHAD      985 - 985    RCRE1_MT    986 - 987
      RCRE1_YR    988 - 991    RCRE1N      992 - 993
      RCRE1T      994 - 994    RCRE2       995 - 995
      CRENAM      996 - 996    CREREAS     997 - 997
      CREREC      998 - 998    HFOBHAD     999 - 999
      RHFO1_MT   1000 -1001    RHFO1_YR   1002 -1005
      RHFO1N     1006 -1007    RHFO1T     1008 -1008
      RHFO2      1009 -1009    MDHFOB     1010 -1010


      /* PAF LOCATIONS */

      HYPPREG    1011 -1011    HLOSWGT    1012 -1012
      WGTADEV    1013 -1013    WGTADNOW   1014 -1014
      LOWSLT     1015 -1015    LOWSLTEV   1016 -1016
      LOWSLTNW   1017 -1017    EXERC      1018 -1018
      EXERCEV    1019 -1019    EXERCNW    1020 -1020
      HBPALC     1021 -1021    HBPALCEV   1022 -1022
      HBPALCNW   1023 -1023    HYPMEDEV   1024 -1024
      HYPMED     1025 -1025    HYMDMED    1026 -1026


      /* BAL LOCATIONS */

      BAID_01    1027 -1027    BAID_02    1028 -1028
      BAID_03    1029 -1029    BAID_04    1030 -1030
      BAID_05    1031 -1031    BAID_06    1032 -1032
      BAID_07    1033 -1033    BAID_08    1034 -1034
      BBRAC1     1035 -1035    BBRAC2     1036 -1036
      BBRAC3     1037 -1037    BBRAC4     1038 -1038
      BBRAC5     1039 -1039    BBRAC6     1040 -1040
      BBRAC7     1041 -1041    BART1      1042 -1042
      BART2      1043 -1043    BART3      1044 -1044
      BART4      1045 -1045    BART5      1046 -1046
      BDIZZ      1047 -1047    BBAL_01    1048 -1048
      BBAL_02    1049 -1049    BBAL_03    1050 -1050
      BBAL_04    1051 -1051    BBAL_05    1052 -1052
      BBAL_06    1053 -1053    BBAL_07    1054 -1054
      BBAL_08    1055 -1055    BBAL_09    1056 -1056
      BBAL_10    1057 -1057    BBAL_11    1058 -1058
      BBAL_12    1059 -1059    BBAL_13    1060 -1060
      BBAL_14    1061 -1061    BBAL_15    1062 -1062
      BBALCT     1063 -1064    BTYPE_01   1065 -1065
      BTYPE_02   1066 -1066    BTYPE_03   1067 -1067
      BTYPE_04   1068 -1068    BTYPE_05   1069 -1069
      BTYPE_06   1070 -1070    BTYPECT    1071 -1071
      BBOTH      1072 -1072    BAGE       1073 -1075
      BLONG      1076 -1077    BOFTEN     1078 -1079
      BLAST      1080 -1081    BTRIG_01   1082 -1082
      BTRIG_02   1083 -1083    BTRIG_03   1084 -1084
      BTRIG_04   1085 -1085    BTRIG_05   1086 -1086
      BTRIG_06   1087 -1087    BTRIG_07   1088 -1088
      BTRIG_08   1089 -1089    BTRIG_09   1090 -1090
      BTRIG_10   1091 -1091    BTRIG_11   1092 -1092
      BTRIG_12   1093 -1093    BTRIG_13   1094 -1094
      BSAME_01   1095 -1095    BSAME_02   1096 -1096
      BSAME_03   1097 -1097    BSAME_04   1098 -1098
      BSAME_05   1099 -1099    BSAME_06   1100 -1100
      BSAME_07   1101 -1101    BSAME_08   1102 -1102
      BSAME_09   1103 -1103    BSAME_10   1104 -1104
      BSAME_11   1105 -1105    BSAME_12   1106 -1106
      BSAME_13   1107 -1107    BSAME_14   1108 -1108
      BSAME_15   1109 -1109    BSAME_16   1110 -1110
      BSAME_17   1111 -1111    BSAME_18   1112 -1112
      BSAME_19   1113 -1113    BSAME_20   1114 -1114
      BSAME_21   1115 -1115    BSAME_22   1116 -1116
      BONLY_01   1117 -1117    BONLY_02   1118 -1118
      BONLY_03   1119 -1119    BONLY_04   1120 -1120
      BONLY_05   1121 -1121    BONLY_06   1122 -1122
      BONLY_07   1123 -1123    BONLY_08   1124 -1124
      BONLY_09   1125 -1125    BONLY_10   1126 -1126
      BONLY_11   1127 -1127    BONLY_12   1128 -1128
      BONLY_13   1129 -1129    BONLY_14   1130 -1130
      BONLY_15   1131 -1131    BONLY_16   1132 -1132
      BONLY_17   1133 -1133    BONLY_18   1134 -1134
      BONLY_19   1135 -1135    BONLY_20   1136 -1136
      BONLY_21   1137 -1137    BONLY_22   1138 -1138
      BHOSP      1139 -1139    BHOSPNO    1140 -1140
      BHP        1141 -1141    BHP_01     1142 -1142
      BHP_02     1143 -1143    BHP_03     1144 -1144
      BHP_04     1145 -1145    BHP_05     1146 -1146
      BHP_06     1147 -1147    BHP_07     1148 -1148
      BHP_08     1149 -1149    BHP_09     1150 -1150
      BHP_10     1151 -1151    BHP_11     1152 -1152
      BHP_12     1153 -1153    BHP_13     1154 -1154
      BHP_14     1155 -1155    BHP_15     1156 -1156
      BHP_16     1157 -1157    B5YRS      1158 -1158
      BFIRST     1159 -1159    BDIFF      1160 -1160
      BHELP      1161 -1161    BTHLP_NO   1162 -1164
      BTHLP_TP   1165 -1165    BDIAG      1166 -1166
      BCAUS_01   1167 -1167    BCAUS_02   1168 -1168
      BCAUS_03   1169 -1169    BCAUS_04   1170 -1170
      BCAUS_05   1171 -1171    BCAUS_06   1172 -1172
      BCAUS_07   1173 -1173    BCAUS_08   1174 -1174
      BCAUS_09   1175 -1175    BCAUS_10   1176 -1176
      BCAUS_11   1177 -1177    BCAUS_12   1178 -1178
      BCAUS_13   1179 -1179    BCAUS_14   1180 -1180
      BCAUS_15   1181 -1181    BCAUS_16   1182 -1182
      BTRET      1183 -1183    BTRET_01   1184 -1184
      BTRET_02   1185 -1185    BTRET_03   1186 -1186
      BTRET_04   1187 -1187    BTRET_05   1188 -1188
      BTRET_06   1189 -1189    BTRET_07   1190 -1190
      BTRET_08   1191 -1191    BTRET_09   1192 -1192
      BTRET_10   1193 -1193    BTRET_11   1194 -1194
      BTRET_12   1195 -1195    BTRET_13   1196 -1196
      BTRET_14   1197 -1197    BTRET_15   1198 -1198
      BTRET_16   1199 -1199    BTRET_17   1200 -1200
      BTRET_18   1201 -1201    BTRET_19   1202 -1202
      BTRET_20   1203 -1203    BTRET_21   1204 -1204
      BTRET_22   1205 -1205    BTRET_23   1206 -1206
      BSTAT      1207 -1207    BMEDIC     1208 -1208
      BBETT      1209 -1209    BCHNG      1210 -1210
      BCHNG_01   1211 -1211    BCHNG_02   1212 -1212
      BCHNG_03   1213 -1213    BCHNG_04   1214 -1214
      BCHNG_05   1215 -1215    BCHNG_06   1216 -1216
      BCHNG_07   1217 -1217    BCHNG_08   1218 -1218
      BCHNG_09   1219 -1219    BCHNG_10   1220 -1220
      BMISSWK    1221 -1221    BLMS_NO    1222 -1224
      BLMS_TP    1225 -1225    BM12_NO    1226 -1228
      BM12_TP    1229 -1229    BPROB      1230 -1230
      BMED_01    1231 -1231    BMED_02    1232 -1232
      BMED_03    1233 -1233    BMED_04    1234 -1234
      BMED_05    1235 -1235    BMED_06    1236 -1236
      BMED_07    1237 -1237    BMED_08    1238 -1238
      BBIO       1239 -1239    BFALL5     1240 -1240
      BFL_01     1241 -1241    BFL_02     1242 -1242
      BFL_03     1243 -1243    BFL_04     1244 -1244
      BFL_05     1245 -1245    BFL_06     1246 -1246
      BFALL12    1247 -1247    BF12_NO    1248 -1250
      BF12_TP    1251 -1251    BFTIME     1252 -1252
      BINJ       1253 -1253    BIJMS_NO   1254 -1256
      BIJMS_TP   1257 -1257    BFWHY_01   1258 -1258
      BFWHY_02   1259 -1259    BFWHY_03   1260 -1260
      BFWHY_04   1261 -1261    BFWHY_05   1262 -1262
      BFWHY_06   1263 -1263    BFWHY_07   1264 -1264
      BFWHY_08   1265 -1265    BFWHY_09   1266 -1266
      BFWHY_10   1267 -1267    BFWHY_11   1268 -1268
      BFWHY_12   1269 -1269    BFWHY_13   1270 -1270
      BFWHY_14   1271 -1271    BFWHY_15   1272 -1272
      BFWHY_16   1273 -1273    BFWHY_17   1274 -1274
      BFWHY_18   1275 -1275    BFWHY_19   1276 -1276
      BFWHY_20   1277 -1277    BFWHY_21   1278 -1278
      BFWHY_22   1279 -1279;

   * DEFINE VARIABLE LABELS;

   LABEL

      /* IDN LABELS */

      RECTYPE    ="File type identifier"
      SRVY_YR    ="Year of National Health Interview Survey"
      HHX        ="HH identifier"
      INTV_QRT   ="Interview Quarter"
      ASSIGNWK   ="Assignment Week"
      FMX        ="Family Serial Number"
      FPX        ="Person Number (in family)"
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

      /* ASD LABELS */

      DOINGLWA   ="Corrected employment status last week"
      WHYNOWKA   ="Main reason for not working last week"
      EVERWRK    ="Ever worked"
      INDSTRN1   =
"Detailed industry classification (based on 2007 NAICS codes from Census)"
      INDSTRN2   =
"Simple industry classification (based on 2007 NAICS Codes from Census)"
      OCCUPN1    =
"Detailed occupation classification (based on 2000 SOC codes from Census)"
      OCCUPN2    =
"Simple occupation classification (based on 2000 SOC codes from Census)"
      WRKCATA    ="Class of worker"
      BUSINC1A   ="Current job an incorporated business"
      LOCALL1A   ="Number of employees at work"
      YRSWRKPA   ="Number of years on the job"
      WRKLONGH   ="Current/most recent job also longest held job"
      HOURPDA    ="Paid by the hour at current/most recent job"
      PDSICKA    ="Paid sick leave at current/most recent job"
      ONEJOB     ="Have more than one job"

      /* ACN LABELS */

      HYPEV      ="Ever been told you have hypertension"
      HYPDIFV    ="Ever had hypertension on 2+ visits"
      HYPLOW     ="Ever had low blood pressure"
      HYBPCKNO   ="Time since last BP check: # of units"
      HYBPCKTP   ="Time since last BP check: Time units"
      HYBPLEV    ="Told blood pressure was high, normal, or low"
      CLCKNO     ="Time since cholesterol checked: # units"
      CLCKTP     ="Time since cholesterol checked: Time units"
      CLHI       ="Told blood cholesterol level was high"
      CHDEV      ="Ever been told you had coronary heart disease"
      ANGEV      ="Ever been told you had angina pectoris"
      MIEV       ="Ever been told you had a heart attack"
      HRTEV      ="Ever been told you had a heart condition/disease"
      STREV      ="Ever been told you had a stroke"
      EPHEV      ="Ever been told you had emphysema"
      JAWP       =
"Heart Attack Knowledge: Pain or discomfort in the jaw, neck or back"
      WEA        ="Heart Attack Knowledge: Feeling weak, lightheaded or faint"
      CHE        ="Heart Attack Knowledge: Chest pain or discomfort"
      ARM        =
"Heart Attack Knowledge: Pain or discomfort in the arms or shoulder"
      BRTH       ="Heart Attack Knowledge: Shortness of breath"
      AHADO      ="Best thing to do right away if having a heart attack"
      ACPR       =
"Ever received formal training or certification in CPR for Adults"
      ACPRLO     ="How long ago received formal CPR training"
      AASMEV     ="Ever been told you had asthma"
      AASSTILL   ="Still have asthma"
      AASMYR     ="Had an asthma episode/attack past 12 m"
      AASMERYR   ="Had visit to ER due to asthma past 12 m"
      AASMHSP    ="Had stayed overnight in hospital due to asthma, past 12 m"
      AASMMC     ="Talk with health professional about long term asthma care"
      AWZMSWK    ="# Work days missed due to asthma, past 12 mo."
      AWZPIN     ="Ever used prescription inhaler"
      AASMINST   ="Shown how to use inhaler"
      AASMPMED   ="Used oral inhaler, past 3 mo"
      AASMCAN    ="Used more than 3 canisters of mouth inhaler, past 3 mo"
      AASMED     ="Ever taken preventive asthma meds"
      AASMDTP    ="Now taking asthma meds"
      AASWMP     ="Given an asthma management plan"
      AASCLASS   ="Ever taken asthma mgmt. class"
      AAS_REC    ="Taught to recognize asthma episode"
      AAS_RES    ="Taught how to respond to asthma episode"
      AAS_MON    ="Taught how to monitor peak flow for daily therapy"
      AAPENVLN   ="Ever advised to change environment for asthma"
      AAPENVDO   ="Follow advice to change environment for asthma"
      CHRFATIG   ="Ever had chronic fatigue syndrome"
      THYLOW     ="Ever had low thyroid function or hypothyroidism"
      CHRINFCT   ="Ever had chronic infection"
      MULDYST    ="Ever had muscular dystrophy"
      EPILEPSY   ="Ever had epilepsy or seizures"
      CEREBRLP   ="Ever had cerebral palsy"
      SPINEINJ   ="Ever had a spinal cord or neck injury"
      HEADINJ    ="Ever had injury to head or brain"
      MOVEDIS    =
"Ever had movement disorders such as Parkinson's disease, ALS, or Lou Gehrig's d
isease"
      MIGRAINE   ="Ever had migraine headaches"
      RHDACHE    ="Ever had regular headaches, other than migraine"
      MULSCLER   ="Ever had multiple sclerosis"
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
      HRAIDNOW   ="Now use a hearing aid"
      HRAIDEV    ="Ever used a hearing aid if not now using"
      AHEARST1   ="Hearing w/o hearing aid"
      HRWORS     ="Hearing worse in one ear"
      HRWHICH    ="Which ear is worse"
      HRRIGHT    ="Hearing in right ear"
      HRLEFT     ="Hearing in left ear"
      HRTIN      ="Bothered by ringing/roaring/buzzing in ears, past 12 m"
      HRTINLNG   ="Duration of ringing/roaring/buzzing in ears"
      HRTINOFT   ="How often R had ringing/roaring/buzzing, past 12 m"
      HRTINMUS   ="Ringing/roaring/buzzing after hearing loud sounds/music"
      HRTINSLP   ="Ringing/roaring/buzzing when going to sleep"
      HRTNPROB   ="How much a problem is ringing/roaring/buzzing"
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
      VIMREAD    ="Wear eyeglasses or contact lenses to read/write/cook/sew"
      VIMDRIVE   =
"Wear eyeglasses or contact lenses to drive/read signs/watch TV"
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
"Even when wearing glasses difficult for you to find something on crowded shelf"
      AVISEXAM   ="Last time you had an eye exam (pupils dilated)"
      AVISACT    =
"Participate in sports/other activities that can cause eye injury"
      AVISPROT   =
"When doing these activities, on average, do you wear eye protection"
      LUPPRT     ="Lost all upper & lower natural teeth"
      SAD        ="So sad nothing cheers you up, past 30 days"
      NERVOUS    ="How often felt nervous, past 30 days"
      RESTLESS   ="How often restless/fidgety, past 30 days"
      HOPELESS   ="How often felt hopeless, past 30 days"
      EFFORT     ="How often felt everything was an effort, past 30 days"
      WORTHLS    ="How often felt worthless, past 30 days"
      MHAMTMO    ="Feelings interfered w/life, past 30 days"
      DEPRESS    ="Ever had depression"
      GANXIETY   ="Ever had generalized anxiety"
      PANICD     ="Ever had panic disorder"

      /* AHS LABELS */

      WRKLYR3    ="Work status: last week, past 12 months"
      WKDAYR     ="Number of work loss days, past 12 months"
      BEDDAYR    ="Number of bed days, past 12 months"
      AHSTATYR   ="Health better/worse/same, compared w/ 12 months ago"
      SPECEQ     ="Have health problem that requires special equipment"
      FLWALK     ="How difficult to walk 1/4 mile w/o special equipment"
      FLCLIMB    ="How difficult to climb 10 steps w/o special equipment"
      FLSTAND    ="How difficult to stand 2 hours w/o special equipment"
      FLSIT      ="How difficult to sit 2 hours w/o special equipment"
      FLSTOOP    ="How difficult to stoop, bend or kneel w/o special equipment"
      FLREACH    ="How difficult to reach over head w/o special equipment"
      FLGRASP    ="How difficult to grasp small objects w/o special equipment"
      FLCARRY    ="How difficult to lift/carry 10 lbs w/o special equipment"
      FLPUSH     ="How difficult to push large objects w/o special equipment"
      FLSHOP     ="How difficult to go out to events w/o special equipment"
      FLSOCL     ="How difficult to participate in social activities w/o sp eq"
      FLRELAX    ="How difficult to relax at home w/o special equipment"
      FLA1AR     ="Any functional limitation, all conditions"
      AFLHCA1    ="Vision problem causes difficulty with activity"
      AFLHCA2    ="Hearing problem causes difficulty with activity"
      AFLHCA3    ="Arthritis/rheumatism causes difficulty with activity"
      AFLHCA4    ="Back/neck problem causes difficulty with activity"
      AFLHCA5    ="Fract/bone/joint injury causes difficulty with activity"
      AFLHCA6    ="Other injury causes difficulty with activity"
      AFLHCA7    ="Heart problem causes difficulty with activity"
      AFLHCA8    ="Stroke causes difficulty with activity"
      AFLHCA9    ="Hypertension causes difficulty with activity"
      AFLHCA10   ="Diabetes causes difficulty with activity"
      AFLHCA11   ="Lung/breathing problem causes difficulty with activity"
      AFLHCA12   ="Cancer causes difficulty with activity"
      AFLHCA13   ="Birth defect causes difficulty with activity"
      AFLHCA14   ="Mental retardation causes difficulty with activity"
      AFLHCA15   ="Other developmental problem causes difficulty with activity"
      AFLHCA16   ="Senility/dementia/Alzheimer's causes difficulty with activity
"
      AFLHCA17   =
"Depression/anxiety/emotional problem causes difficulty with activity"
      AFLHCA18   ="Weight problem causes difficulty with activity"
      AFLHC19_   =
"Missing or amputated limb/finger/digit causes difficulty with activity"
      AFLHC20_   =
"Musculoskeletal/connective tissue problem causes difficulty with activity"
      AFLHC21_   ="Circulation problem causes difficulty with activity"
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
      ALDURA1    ="Duration of vision problem (in years)"
      ALDURB1    ="Duration of vision problem recode 2"
      ALCHRC1    ="Vision problem condition status"
      ALTIME2    ="Duration of hearing problem: Number of units"
      ALUNIT2    ="Duration of hearing problem: Time unit"
      ALDURA2    ="Duration of hearing problem (in years)"
      ALDURB2    ="Duration of hearing problem recode 2"
      ALCHRC2    ="Hearing problem condition status"
      ALTIME3    ="Duration of arthritis/rheumatism: Number of units"
      ALUNIT3    ="Duration of arthritis/rheumatism: Time unit"
      ALDURA3    ="Duration of arthritis or rheumatism problem (in years)"
      ALDURB3    ="Duration of arthritis or rheumatism problem recode 2"
      ALCHRC3    ="Arthritis or rheumatism problem condition status"
      ALTIME4    ="Duration of back or neck problem: Number of units"
      ALUNIT4    ="Duration of back or neck problem: Time unit"
      ALDURA4    ="Duration of back or neck problem (in years)"
      ALDURB4    ="Duration of back or neck problem recode 2"
      ALCHRC4    ="Back or neck condition status"
      ALTIME5    ="Duration of fracture, bone/joint injury: Number of units"
      ALUNIT5    ="Duration of fracture, bone/joint injury: Time unit"
      ALDURA5    ="Duration of fracture, bone/joint injury problem (in years)"
      ALDURB5    ="Duration of fracture, bone/joint injury problem recode 2"
      ALCHRC5    ="Fracture, bone/joint injury condition status"
      ALTIME6    ="Duration of other injury: Number of units"
      ALUNIT6    ="Duration of other injury: Time unit"
      ALDURA6    ="Duration of other injury problem (in years)"
      ALDURB6    ="Duration of other injury problem recode 2"
      ALCHRC6    ="Other injury condition status"
      ALTIME7    ="Duration of heart problem: Number of units"
      ALUNIT7    ="Duration of heart problem: Time unit"
      ALDURA7    ="Duration of heart problem (in years)"
      ALDURB7    ="Duration of heart problem recode 2"
      ALCHRC7    ="Heart problem condition status"
      ALTIME8    ="Duration of stroke problem: Number of units"
      ALUNIT8    ="Duration of stroke problem: Time unit"
      ALDURA8    ="Duration of stroke problem (in years)"
      ALDURB8    ="Duration of stroke problem recode 2"
      ALCHRC8    ="Stroke problem condition status"
      ALTIME9    =
"Duration of hypertension/high blood pressure problem: Number of units"
      ALUNIT9    =
"Duration of hypertension/high blood pressure problem: Time unit"
      ALDURA9    =
"Duration of hypertension/high blood pressure problem (in years)"
      ALDURB9    ="Duration of hypertension/high problem recode 2"
      ALCHRC9    ="Hypertension/high blood pressure problem condition status"
      ALTIME10   ="Duration of diabetes: Number of units"
      ALUNIT10   ="Duration of diabetes: Time unit"
      ALDURA10   ="Duration of diabetes (in years)"
      ALDURB10   ="Duration of diabetes problem recode 2"
      ALCHRC10   ="Diabetes problem condition status"
      ALTIME11   ="Duration of lung/breathing problem: Number of units"
      ALUNIT11   ="Duration of lung/breathing problem: Time unit"
      ALDURA11   ="Duration of lung/breathing problem (in years)"
      ALDURB11   ="Duration of lung/breathing problem recode 2"
      ALCHRC11   ="Lung/breathing problem condition status"
      ALTIME12   ="Duration of cancer: Number of units"
      ALUNIT12   ="Duration of cancer: Time unit"
      ALDURA12   ="Duration of cancer (in years)"
      ALDURB12   ="Duration of cancer recode 2"
      ALCHRC12   ="Cancer condition status"
      ALTIME13   ="Duration of birth defect: Number of units"
      ALUNIT13   ="Duration of birth defect: Time unit"
      ALDURA13   ="Duration of birth defect (in years)"
      ALDURB13   ="Duration of birth defect recode 2"
      ALCHRC13   ="Birth defect condition status"
      ALTIME14   ="Duration of mental retardation: Number of units"
      ALUNIT14   ="Duration of mental retardation: Time unit"
      ALDURA14   ="Duration of mental retardation (in years)"
      ALDURB14   ="Duration of mental retardation recode 2"
      ALCHRC14   ="Mental retardation condition status"
      ALTIME15   ="Duration of other developmental problem: Number of units"
      ALUNIT15   ="Duration of other developmental problem: Time unit"
      ALDURA15   ="Duration of other developmental problem (in years)"
      ALDURB15   ="Duration of other developmental problem  recode 2"
      ALCHRC15   ="Other developmental problem condition status"
      ALTIME16   ="Duration of senility: Number of units"
      ALUNIT16   ="Duration of senility: Time unit"
      ALDURA16   ="Duration of senility (in years)"
      ALDURB16   ="Duration of senility recode 2"
      ALCHRC16   ="Senility condition status"
      ALTIME17   =
"Duration of depression/anxiety/emotional problem: Number of units"
      ALUNIT17   ="Duration of depression/anxiety/emotional problem: Time unit"
      ALDURA17   ="Duration of depression/anxiety/emotional problem (in years)"
      ALDURB17   ="Duration of depression/anxiety/emotional problem recode 2"
      ALCHRC17   ="Depression/anxiety/emotional problem condition status"
      ALTIME18   ="Duration of weight problem: Number of units"
      ALUNIT18   ="Duration of weight problem: Time unit"
      ALDURA18   ="Duration of weight problem (in years)"
      ALDURB18   ="Duration of weight problem recode 2"
      ALCHRC18   ="Weight problem condition status"
      ALTIME19   ="Duration of missing limb: Number of units"
      ALUNIT19   ="Duration of missing limb: Time unit"
      ALDURA19   ="Duration of missing limb (in years)"
      ALDURB19   ="Duration of missing limb recode 2"
      ALCHRC19   ="Missing limb condition status"
      ALTIME20   ="Duration of musculoskeletal problem: Number of units"
      ALUNIT20   ="Duration of musculoskeletal problem: Time unit"
      ALDURA20   ="Duration of musculoskeletal problem (in years)"
      ALDURB20   ="Duration of musculoskeletal problem recode 2"
      ALCHRC20   ="Musculoskeletal problem condition status"
      ALTIME21   ="Duration of circulation problem: Number of units"
      ALUNIT21   ="Duration of circulation problem: Time unit"
      ALDURA21   ="Duration of circulation problem (in years)"
      ALDURB21   ="Duration of circulation problem recode 2"
      ALCHRC21   ="Circulation problem condition status"
      ALTIME22   ="Duration of endocrine problem: Number of units"
      ALUNIT22   ="Duration of endocrine problem: Time unit"
      ALDURA22   ="Duration of endocrine problem (in years)"
      ALDURB22   ="Duration of endocrine problem recode 2"
      ALCHRC22   ="Endocrine problem condition status"
      ALTIME23   ="Duration of nervous system condition: Number of units"
      ALUNIT23   ="Duration of nervous system condition: Time unit"
      ALDURA23   ="Duration of nervous system condition (in years)"
      ALDURB23   ="Duration of nervous system condition recode 2"
      ALCHRC23   ="Nervous system condition status"
      ALTIME24   ="Duration of digestive problems: Number of units"
      ALUNIT24   ="Duration of digestive problems: Number of units"
      ALDURA24   ="Duration of digestive problems (in years)"
      ALDURB24   ="Duration of digestive problems recode 2"
      ALCHRC24   ="Digestive problems condition status"
      ALTIME25   ="Duration of genitourinary problem: Number of units"
      ALUNIT25   ="Duration of genitourinary problem: Time unit"
      ALDURA25   ="Duration of genitourinary problem (in years)"
      ALDURB25   ="Duration of genitourinary problem recode 2"
      ALCHRC25   ="Genitourinary problem condition status"
      ALTIME26   ="Duration of skin problems: Number of units"
      ALUNIT26   ="Duration of skin problems: Time unit"
      ALDURA26   ="Duration of skin problems (in years)"
      ALDURB26   ="Duration of skin problems recode 2"
      ALCHRC26   ="Skin problems condition status"
      ALTIME27   ="Duration of blood problem: Number of units"
      ALUNIT27   ="Duration of blood problem: Time unit"
      ALDURA27   ="Duration of blood problem (in years)"
      ALDURB27   ="Duration of blood problem recode 2"
      ALCHRC27   ="Blood problem condition status"
      ALTIME28   ="Duration of benign tumor: Number of units"
      ALUNIT28   ="Duration of benign tumor: Time unit"
      ALDURA28   ="Duration of benign tumor (in years)"
      ALDURB28   ="Duration of benign tumor recode 2"
      ALCHRC28   ="Benign tumor condition status"
      ALTIME29   ="Duration of alcohol or drug problem: Number of units"
      ALUNIT29   ="Duration of alcohol or drug problem: Time unit"
      ALDURA29   ="Duration of alcohol or drug problem (in years)"
      ALDURB29   ="Duration of alcohol or drug problem recode 2"
      ALCHRC29   ="Alcohol or drug problem condition status"
      ALTIME30   ="Duration of other mental problem: Number of units"
      ALUNIT30   ="Duration of other mental problem: Time unit"
      ALDURA30   ="Duration of other mental problem (in years)"
      ALDURB30   ="Duration of other mental problem recode 2"
      ALCHRC30   ="Other mental problem condition status"
      ALTIME31   ="Duration of surgical after-effects: Number of units"
      ALUNIT31   ="Duration of surgical after-effects: Time unit"
      ALDURA31   ="Duration of surgical after-effects (in years)"
      ALDURB31   ="Duration of surgical after-effects recode 2"
      ALCHRC31   ="Surgical after-effects condition status"
      ALTIME32   ='Duration of "old age"-related problems: Number of units'
      ALUNIT32   ='Duration of "old age"-related problems: Number of units'
      ALDURA32   ='Duration of "old age"-related problems (in years)'
      ALDURB32   ='Duration of "old age"-related problems, recode 2'
      ALCHRC32   ='"Old age"-related problems condition status'
      ALTIME33   ="Duration of fatigue problem: Number of units"
      ALUNIT33   ="Duration of fatigue problem: Time unit"
      ALDURA33   ="Duration of fatigue problem (in years)"
      ALDURB33   ="Duration of fatigue problem recode 2"
      ALCHRC33   ="Fatigue problem condition status"
      ALTIME34   ="Duration of pregnancy-related problem: Number of units"
      ALUNIT34   ="Duration of pregnancy-related problem: Time unit"
      ALDURA34   ="Duration of pregnancy-related problem (in years)"
      ALDURB34   ="Duration of pregnancy-related problem recode 2"
      ALCHRC34   ="Pregnancy-related condition status"
      ALTIME90   ="Duration of other N.E.C. problem (1): Number of units"
      ALUNIT90   ="Duration of other N.E.C. problem (1): Time unit"
      ALDURA90   ="Duration of other N.E.C. problem (1) (in years)"
      ALDURB90   ="Duration of other N.E.C. problem (1) recode 2"
      ALCHRC90   ="Other N.E.C. problem (1) condition status"
      ALTIME91   ="Duration of other N.E.C. problem (2): Number of units"
      ALUNIT91   ="Duration of other N.E.C. problem (2): Time unit"
      ALDURA91   ="Duration of other N.E.C. problem (2) (in years)"
      ALDURB91   ="Duration of other N.E.C. problem (2) recode 2"
      ALCHRC91   ="Other N.E.C. problem (2) condition status"
      ALCNDRT    =
"Chronic condition recode for individual w/ functional limitation"
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
      AHCDLYR1   ="Couldn't get through on phone, past 12 m"
      AHCDLYR2   ="Couldn't get appt soon enough, past 12 m"
      AHCDLYR3   ="Wait too long in dr's office, past 12 m"
      AHCDLYR4   ="Not open when you could go, past 12 m"
      AHCDLYR5   ="No transportation, past 12 m"
      AHCAFYR1   ="Can't afford prescription medicine, past 12 m"
      AHCAFYR2   ="Can't afford mental health care/counseling, 12 m"
      AHCAFYR3   ="Can't afford dental care, past 12 m"
      AHCAFYR4   ="Can't afford eyeglasses, past 12 m"
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
      AHCHYR     ="Received home care from health professional, past 12 m"
      AHCHMOYR   ="# months of home care, past 12 m"
      AHCHNOY2   ="Total number of home visits"
      AHCNOYR2   ="Total number of office visits, past 12 m"
      ASRGYR     ="Surgery/surgical procedure, past 12 m"
      ASRGNOYR   ="# of surgeries, past 12 m"
      AMDLONGR   ="Time since last seen/talked to health professional"
      SHTFLUYR   ="Flu shot past 12 m"
      ASHFLU_M   ="Month of most recent flu shot"
      ASHFLU_Y   ="Year of most recent flu shot"
      SPRFLUYR   ="Flu spray past 12 m"
      ASPFLU_M   ="Month of most recent flu nasal vaccine"
      ASPFLU_Y   ="Year of most recent flu nasal vaccine"
      SHTPNUYR   ="Pneumonia shot (EVER)"
      APOX       ="Ever had chickenpox"
      APOX12MO   ="Chickenpox, past 12 m"
      AHEP       ="Ever had hepatitis"
      AHEPLIV    ="Ever lived w/ someone w/ hepatitis"
      SHTHEPB    ="Hepatitis B vaccine (EVER)"
      SHEPDOS    ="# doses of hepatitis B vaccine received"
      SHTHEPA    ="Hepatitis A vaccine (EVER)"
      SHEPANUM   ="# shots of hepatitis A vaccine received"
      SHINGLES   ="Ever had the Zoster or Shingles vaccine?"
      SHTTD      ="Tetanus shot in the past 10 years?"
      SHTTD05    ="Tetanus shot given in 2005 or later?"
      SHTTDAP    ="Vaccine included pertussis/whooping cough"
      LIVEV      ="Had any kind of chronic/long-term liver condition"
      TRAVEL     =
"Ever traveled outside USA since 1995 (Excluding Europe, Japan, Australia, New Z
ealand, and Canada)"

      /* AOH LABELS */

      OCOND      ="Describe condition of your mouth"
      OBTWS      ="Condition of mouth compared to others your age"
      OEMB       ="Self-conscious or embarrassed by teeth, mouth, dentures"
      OREAS_1    ="Hours work/school missed for emergency dental care, past 6 m.
"
      OREAS_2    =
"Hours work/school missed for routine dental/orthodontic care, past 6 m."
      OREAS_3    =
"Hours work/school missed for tooth whitening/cosmetic procedures, past 6 m."
      OREAS_4    =
"Hours work/school missed for taking someone else for dental care, past 6 m."
      OPROB_01   ="Problem with toothache or sensitive teeth, past 6 m."
      OPROB_02   ="Problem with bleeding gums, past 6 m."
      OPROB_03   ="Problem with crooked teeth, past 6 m."
      OPROB_04   ="Problem with broken/missing teeth, past 6 m."
      OPROB_05   ="Problem with stained/discolored teeth, past 6 m."
      OPROB_06   ="Problem with loose teeth not injury related, past 6 m."
      OPROB_07   ="Problem with broken/missing fillings, past 6 m."
      OPROB_08   ="Problem with pain in your jaw joint, past 6 m."
      OPROB_09   ="Problem with sores in your mouth, past 6 m."
      OPROB_10   ="Problem with difficulty eating or chewing, past 6 m."
      OPROB_11   ="Problem with bad breath, past 6 m."
      OPROB_12   ="Problem with dry mouth, past 6 m."
      ODENT1     =
"Saw either dentist or medical doctor for dental problem, past 6 m."
      ODENT2     ="Which one seen, a dentist or a medical doctor, past 6 m."
      ONODEN_1   ="Not important to see dentist for problem, past 6 m."
      ONODEN_2   ="Dental problem went away, past 6 m."
      ONODEN_3   =
"Couldn't afford treatment/ no insurance for dental problem, past 6 m."
      ONODEN_4   ="No transportation to dentist, past 6 m."
      ONODEN_5   ="Afraid to see dentist for problems, past 6 m."
      ONODEN_6   ="Waiting for dental appointment, past 6 m."
      ONODEN_7   ="Didn't think dentist could fix problem, past 6 m."
      OINT_1     ="Dental problem interfere with work or school"
      OINT_2     ="Dental problem interfere with sleeping"
      OINT_3     ="Dental problem interfere with social activities"
      OINT_4     ="Dental problem interfere with usual activities at home"
      OCEXAM     ="Heard of exam for oral or mouth cancer"
      OCTONG     ="Had exam for oral cancer checking tongue/cheeks"
      OCNECK     ="Had exam for oral cancer checking neck"
      OCEXWHEN   ="Most recent oral cancer exam"
      OEXCHECK   ="Oral cancer exam routine or because of specific problem"
      OCEXPROF   =
"Type of health care professional performed most recent oral cancer exam"

      /* ADS LABELS */

      BLDGV      ="Donated blood since March 1985"
      BLDG12M    ="Donated blood past 12 months"
      HIVTST     ="Ever been tested for HIV"
      WHYTST_R   ="Reason why you have not been tested for HIV/AIDS"
      TST12M_M   ="Month of last test for HIV"
      TST12M_Y   ="Year of last test for HIV"
      TIMETST    ="Time period of most recent HIV test"
      REATST_C   ="Main reason for last HIV test"
      REASWHOR   ="Who suggested you should be tested"
      LASTST_C   ="Location of last HIV test"
      CLNTYP_C   ="Type of clinic for last HIV test"
      WHOADM     ="Who administered the test"
      GIVNAM     ="Gave your first and last names"
      EXTST12M   ="HIV test in the next 12 months"
      CHNSADSP   ="Chances of getting AIDS virus"
      STMTRU     ="Are any of these statements true"
      STD        ="Had STD other than HIV/AIDS, past 5 yrs"
      STDDOC     ="Saw a doctor or other health professional"
      STDWHER    ="Place where checked"
      TBHRD      ="Ever heard of tuberculosis"
      TBKNOW     ="Ever personally known anyone who had TB"
      TB         ="How much do you know about TB"
      TBSPRD1    ="Breathing air around person sick with TB"
      TBSPRD2    ="Sharing eating/drinking utensils"
      TBSPRD3    ="Through semen/vaginal secretions (sex)"
      TBSPRD4    ="From smoking"
      TBSPRD5    ="From mosquito or other insect bites"
      TBSPRD6    ="Other"
      TBCURED    ="Can TB be cured"
      TBCHANC    ="Chances of getting TB"
      TBSHAME    ="Ashamed if you/family diagnosed with TB"
      HOMELESS   ="Spent 24+ hrs living in street, shelter, jail/prison"

      /* NAF LABELS */

      SUN1_SHA   ="Stay in shade on warm sunny day"
      SUN1_CAP   ="Wear baseball cap/visor on warm sunny day"
      SUN1_HAT   ="Wear wide-brimmed hat on warm sunny day"
      SUN2_LGS   ="Wear long sleeved shirt on warm sunny day"
      SUN2_LGP   ="Wear long clothing to ankles on warm sunny day"
      SUN2_SCR   ="Use sunscreen on warm sunny day"
      SPF        ="SPF of sunscreen used most often"
      SPFSCALE   ="SPF number of usual sunscreen"
      SNNUM      ="Number of times used tanning device in past year"
      PAPHAD     ="Ever had Pap smear test"
      PAP6YR     ="Number of Pap smears, last 6 years"
      RPAP1_MT   ="Month of most recent Pap smear test"
      RPAP1_YR   ="Year of most recent Pap smear test"
      RPAP1N     ="Time ago date of Pap smear exam: # of units"
      RPAP1T     ="Time ago date of Pap smear:  Time unit"
      RPAP2CA    ="Most recent Pap smear, time categories"
      PAPREAS    ="Reason for most recent Pap smear"
      PAPABN     ="Ever had abnormal Pap smear results"
      PAPNOT     ="Reason why no Pap smear"
      MDRECPAP   ="MD recommended Pap smear in the last year"
      PAPWHEN    ="When next Pap smear/test will be done"
      HYST       ="Ever had a hysterectomy"
      HPVHRD     ="Ever heard of HPV"
      HPVCAUS    ="Can HPV cause cervical cancer"
      HPVSEXCN   ="Is HPV spread through sexual contact"
      HPVTRET    ="Does HPV go away without treatment"
      HPVHAD     ="Ever had HPV"
      SHHPVHRD   ="Heard about HPV vaccine or shot"
      SHTHPV     ="Ever received the HPV vaccine or shot"
      SHHPVDOS   ="Number of shots"
      HPVINT     ="Interested in HPV vaccine"
      HPVNOT     ="Main reason why no HPV vaccine"
      HPVCOST    ="Get HPV vaccine if cost was $360-$500"
      HPVLOCST   ="Get HPV vaccine if free/at a lower cost"
      MAMHAD     ="Ever had mammogram"
      MAM6YR     ="Number of mammograms, last 6 years"
      RMAM1_MT   ="Month of most recent mammogram"
      RMAM1_YR   ="Year of most recent mammogram"
      RMAM1N     ="Time ago date of mammogram: # of units"
      RMAM1T     ="Time ago date of mammogram: Time unit"
      RMAM2CA    ="Most recent mammogram, time categories"
      MAMREAS    ="Reason for most recent mammogram"
      MDRECMAM   ="MD recommended mammogram in past year"
      MAMINFO    ="Read conflicting information about mammograms"
      MAMDELAY   ="Conflicting information caused delay/no mammogram"
      HRTEVER    ="Ever took hormone replacement therapy"
      HRTNOW     ="Now taking hormone replacement therapy"
      HRTLONG    ="Length of time taking hormone replacement therapy"
      PSAHAD     ="Ever had PSA test"
      RPSA1_MT   ="Month of most recent PSA test"
      RPSA1_YR   ="Year of most recent PSA test"
      RPSA1N     ="Time ago date of PSA test: # of units"
      RPSA1T     ="Time ago date of PSA test: Time unit"
      RPSA2      ="Most recent PSA test, time categories"
      PSAREAS    ="Reason for most recent PSA"
      MDRECPSA   ="MD recommended PSA test in past year"
      CREHAD     ="Ever had colorectal screening exam"
      RCRE1_MT   ="Month of most recent colorectal exam"
      RCRE1_YR   ="Year of most recent colorectal exam"
      RCRE1N     ="Time ago date of colorectal exam: # of units"
      RCRE1T     ="Time ago date of colorectal exam: Time unit"
      RCRE2      ="Most recent colorectal exam, time categories"
      CRENAM     ="Type of recent colorectal exam"
      CREREAS    ="Reason for most recent colorectal exam"
      CREREC     ="MD recommended colorectal screening exam"
      HFOBHAD    ="Had blood stool test using home test kit"
      RHFO1_MT   ="Month of most recent home blood stool test"
      RHFO1_YR   ="Year of most recent home blood stool test"
      RHFO1N     ="Time ago date of home blood stool test: # of units"
      RHFO1T     ="Time ago date of home blood stool test: Time unit"
      RHFO2      ="Most recent home blood stool test, time categories"
      MDHFOB     ="MD recommended home blood stool test, past year"

      /* PAF LABELS */

      HYPPREG    ="Was your high blood pressure only during pregnancy"
      HLOSWGT    ="Ever advised to change diet to lower high blood pressure"
      WGTADEV    ="Ever follow advice to change diet for high blood pressure"
      WGTADNOW   ="Now following advice to change diet for high blood pressure"
      LOWSLT     ="Ever told to reduce salt for high blood pressure"
      LOWSLTEV   ="Ever follow advice to reduce salt for high blood pressure"
      LOWSLTNW   ="Now following advice to reduce salt for high blood pressure"
      EXERC      ="Ever told to exercise for high blood pressure"
      EXERCEV    ="Ever follow advice to exercise for high blood pressure"
      EXERCNW    ="Now following advice to exercise for high blood pressure"
      HBPALC     ="Ever told to reduce alcohol due to high blood pressure"
      HBPALCEV   =
"Ever follow advice to reduce alcohol use for high blood pressure"
      HBPALCNW   ="Now following advice to reduce alcohol"
      HYPMEDEV   ="Ever prescribed medicine for high blood pressure"
      HYPMED     ="NOW taking medicine prescribed for high blood pressure"
      HYMDMED    ="Advised to stop taking medicine for high blood pressure"

      /* BAL LABELS */

      BAID_01    ="Use a cane to help get around"
      BAID_02    ="Use crutches to help get around"
      BAID_03    ="Use a walker to help get around"
      BAID_04    ="Use a wheelchair to help get around"
      BAID_05    ="Use a scooter to help get around"
      BAID_06    ="Use a brace to help get around"
      BAID_07    =
"Use artificial or replacement limbs or joints to help get around"
      BAID_08    =
"Use medically prescribed shoes or orthotics to help get around"
      BBRAC1     ="Type of brace used: Ankle"
      BBRAC2     ="Type of brace used: Arm"
      BBRAC3     ="Type of brace used: Back"
      BBRAC4     ="Type of brace used: Knee"
      BBRAC5     ="Type of brace used: Leg"
      BBRAC6     ="Type of brace used: Neck"
      BBRAC7     ="Type of brace used: Wrist"
      BART1      ="Part that is artificial: Arm"
      BART2      ="Part that is artificial: Leg"
      BART3      ="Part that is artificial: Hip"
      BART4      ="Part that is artificial: Knee"
      BART5      ="Part that is artificial: Other"
      BDIZZ      ="Had problem with dizziness or balance, past 12 months"
      BBAL_01    ="Had muscle weakness that affects walking, past 12 months"
      BBAL_02    ="Had severe fatigue, past 12 months"
      BBAL_03    =
"Had problems with drifting to the side when trying to walk straight, past 12 mo
nths"
      BBAL_04    =
"Had problems walking through a doorway without bumping into one side, past 12 m
onths"
      BBAL_05    ="Had difficulty walking in the dark, past 12 months"
      BBAL_06    =
"Had difficulty walking on uneven ground or surfaces, past 12 months"
      BBAL_07    =
"Had difficulty walking with bi- or tri-focal or progressive lenses or contacts,
 past 12 months"
      BBAL_08    ="Had blurred or fuzzy vision when moving head, past 12 months"
      BBAL_09    ="Had fear of heights, past 12 months"
      BBAL_10    ="Had fear of large open spaces, past 12 months"
      BBAL_11    ="Had difficulty walking up a flight of stairs, past 12 months"
      BBAL_12    =
"Had difficulty walking down a flight of stairs, past 12 months"
      BBAL_13    =
"Had difficulty riding an escalator or moving walkway, past 12 months"
      BBAL_14    ="Had difficulty going through tunnels, past 12 months"
      BBAL_15    ="Had difficulty going over bridges, past 12 months"
      BBALCT     ="Count of balance problems"
      BTYPE_01   ="Had a spinning or vertigo sensation, past 12 months"
      BTYPE_02   ="Had a floating, spacey, or tilting sensation, past 12 months"
      BTYPE_03   ="Felt lightheaded, without a sense of motion, past 12 months"
      BTYPE_04   ="Had feeling as if passing out or fainting, past 12 months"
      BTYPE_05   ="Had blurring of vision when moved head, past 12 months"
      BTYPE_06   ="Felt off-balance or unsteady, past 12 months"
      BTYPECT    ="Count of symptoms of dizziness or balance problems"
      BBOTH      =
"Most bothersome feeling of dizziness or balance problem, past 12 months"
      BAGE       ="Age when feeling first happened"
      BLONG      ="Length of time had dizziness or balance problem"
      BOFTEN     ="How often had dizziness or balance problem, past 12 months"
      BLAST      =
"How long each spell or bout of dizziness or balance problem lasts"
      BTRIG_01   =
"Dizziness or balance problem triggered by turning head side to side"
      BTRIG_02   ="Dizziness or balance problem triggered by looking up or down"
      BTRIG_03   ="Dizziness or balance problem triggered by rolling over in bed
"
      BTRIG_04   =
"Dizziness or balance problem triggered by getting up after sitting or lying dow
n"
      BTRIG_05   =
"Dizziness or balance problem triggered by standing or being on your feet for a 
long time"
      BTRIG_06   =
"Dizziness or balance problem triggered by riding in a car, bus, airplane, boat,
 or train"
      BTRIG_07   =
"Dizziness or balance problem triggered by walking down a grocery store aisle"
      BTRIG_08   ="Dizziness or balance problem triggered by hearing loud sounds
"
      BTRIG_09   ="Dizziness or balance problem triggered by blowing nose"
      BTRIG_10   =
"Dizziness or balance problem triggered by prescription medicine or drugs"
      BTRIG_11   =
"Dizziness or balance problem triggered by over-the-counter medicine"
      BTRIG_12   =
"Dizziness or balance problem triggered by eating too much salt"
      BTRIG_13   =
"Dizziness or balance problem triggered by certain foods or drinks"
      BSAME_01   =
"Nausea or vomiting happens around same time as dizziness or balance problem"
      BSAME_02   =
"Motion sickness or discomfort happens around same time as dizziness or balance 
problem"
      BSAME_03   =
"Difficulty rolling over in bed happens around same time as dizziness or balance
 problem"
      BSAME_04   =
"Hearing loss in one or both ears happens around same time as dizziness or balan
ce problem"
      BSAME_05   =
"Tinnitus happens around same time as dizziness or balance problem"
      BSAME_06   =
"Earache or pain happens around same time as dizziness or balance problem"
      BSAME_07   =
"Fullness or pressure in ear without pain happens around same time as dizziness 
or balance problem"
      BSAME_08   =
"Sinus congestion happens around same time as dizziness or balance problem"
      BSAME_09   =
"Migraine headache happens around same time as dizziness or balance problem"
      BSAME_10   =
"Headache, other than migraine happens around same time as dizziness or balance 
problem"
      BSAME_11   =
"Neck pain happens around same time as dizziness or balance problem"
      BSAME_12   =
"Blurred or double vision happens around same time as dizziness or balance probl
em"
      BSAME_13   =
"Loss of vision or blacking out happens around same time as dizziness or balance
 problem"
      BSAME_14   =
"Sweats or sweating happens around same time as dizziness or balance problem"
      BSAME_15   =
"Shortness of breath or trouble breathing happens around same time as dizziness 
or balance problem"
      BSAME_16   =
"Difficulty speaking or slurred speech happens around same time as dizziness or 
balance problem"
      BSAME_17   =
"Difficulty swallowing happens around same time as dizziness or balance problem"
      BSAME_18   =
"Numbness in face, hands, or feet happens around same time as dizziness or balan
ce problem"
      BSAME_19   =
"Weak or clumsy arms or legs happens around same time as dizziness or balance pr
oblem"
      BSAME_20   =
"High level of stress happens around same time as dizziness or balance problem"
      BSAME_21   =
"Anxiety happens around same time as dizziness or balance problem"
      BSAME_22   =
"Depression happens around same time as dizziness or balance problem"
      BONLY_01   =
"Have nausea or vomiting only or regardless when having dizziness or balance pro
blem"
      BONLY_02   =
"Have motion sickness or discomfort only or regardless when having dizziness or 
balance problem"
      BONLY_03   =
"Have difficulty rolling over in bed only or regardless when having dizziness or
 balance problem"
      BONLY_04   =
"Have hearing loss in one or both ears only or regardless when having dizziness 
or balance problem"
      BONLY_05   =
"Have tinnitus only or regardless when having dizziness or balance problem"
      BONLY_06   =
"Have earache or pain only or regardless when having dizziness or balance proble
m"
      BONLY_07   =
"Have fullness or pressure in ear only or regardless when having dizziness or ba
lance problem"
      BONLY_08   =
"Have sinus congestion only or regardless when having dizziness or balance probl
em"
      BONLY_09   =
"Have migraine headache only or regardless when having dizziness or balance prob
lem"
      BONLY_10   =
"Have headache other than migraine only or regardless when having dizziness or b
alance problem"
      BONLY_11   =
"Have neck pain only or regardless when having dizziness or balance problem"
      BONLY_12   =
"Have blurred or double vision only or regardless when having dizziness or balan
ce problem"
      BONLY_13   =
"Have loss of vision or blacking out only or regardless when having dizziness or
 balance problem"
      BONLY_14   =
"Have sweats or sweating only or regardless when having dizziness or balance pro
blem"
      BONLY_15   =
"Have shortness of breath or trouble breathing only or regardless when having di
zziness or balance problem"
      BONLY_16   =
"Have difficulty speaking or slurred speech only or regardless when having dizzi
ness or balance problem"
      BONLY_17   =
"Have difficulty swallowing only or regardless when having dizziness or balance 
problem"
      BONLY_18   =
"Have numbness in face, hands, or feet only or regardless when having dizziness 
or balance problem"
      BONLY_19   =
"Have weak or clumsy arms or legs only or regardless when having dizziness or ba
lance problem"
      BONLY_20   =
"Have high level of stress only or regardless when having dizziness or balance p
roblem"
      BONLY_21   =
"Have anxiety only or regardless when having dizziness or balance problem"
      BONLY_22   =
"Have depression only or regardless when having dizziness or balance problem"
      BHOSP      =
"Ever gone to hospital or ER about dizziness or balance problem"
      BHOSPNO    =
"Number of times gone to ER about dizziness or balance problem, past 5 years"
      BHP        =
"Ever see a doctor or other health professional, except for in ER, about dizzine
ss or balance problem"
      BHP_01     =
"Saw a family doctor or general practitioner for dizziness or balance problem"
      BHP_02     =
"Saw a cardiologist or doctor of internal medicine about dizziness or balance pr
oblem"
      BHP_03     =
"Saw an ear, nose, and throat doctor about dizziness or balance problem"
      BHP_04     ="Saw a neurologist about dizziness or balance problem"
      BHP_05     =
"Saw an eye doctor, optometrist, or an ophthalmologist about dizziness or balanc
e problem"
      BHP_06     =
"Saw a dentist, orthodontist, or oral surgeon about dizziness or balance problem
"
      BHP_07     =
"Saw a gynecologist or OB/GYN about dizziness or balance problem"
      BHP_08     =
"Saw a psychiatrist, psychologist, or social worker about dizziness or balance p
roblem"
      BHP_09     ="Saw a chiropractor about dizziness or balance problem"
      BHP_10     =
"Saw an osteopath or doctor of osteopathy about dizziness or balance problem"
      BHP_11     =
"Saw an occupational therapist, physical therapist, or rehabilitation specialist
 about dizziness or balance problem"
      BHP_12     =
"Saw a nurse or nurse practitioner about dizziness or balance problem"
      BHP_13     =
"Saw a nutritionist or dietician about dizziness or balance problem"
      BHP_14     ="Saw a foot doctor about dizziness or balance problem"
      BHP_15     =
"Saw a radiologist or technician for MRI, CAT scan, or ultrasound about dizzines
s or balance problem"
      BHP_16     =
"Saw some other health professional about dizziness or balance problem"
      B5YRS      =
"Number of times seen a health professional about dizziness or balance problem, 
past 5 years"
      BFIRST     =
"Time since first saw health professional about dizziness or balance problem"
      BDIFF      =
"Total number of different health professionals seen about dizziness or balance 
problem"
      BHELP      ="Health professionals helped with dizziness or balance problem
"
      BTHLP_NO   =
"Time between first time saw health professional about dizziness or balance prob
lem and felt helped: #of units"
      BTHLP_TP   =
"Time between first time saw health professional about dizziness or balance prob
lem and felt helped: time period"
      BDIAG      =
"Health professional gave cause or diagnosis for dizziness or balance problem"
      BCAUS_01   ="Cause of dizziness or balance problem: Antibiotics given I.V.
"
      BCAUS_02   ="Cause of dizziness or balance problem: Arthritis"
      BCAUS_03   ="Cause of dizziness or balance problem: Brain tumor"
      BCAUS_04   =
"Cause of dizziness or balance problem: Cogan's syndrome or Sjogren's syndrome"
      BCAUS_05   =
"Cause of dizziness or balance problem: Loose or dislodged crystals in ear or BP
PV"
      BCAUS_06   ="Cause of dizziness or balance problem: Diabetes"
      BCAUS_07   =
"Cause of dizziness or balance problem: Head or neck trauma or concussion"
      BCAUS_08   ="Cause of dizziness or balance problem: Heart disease"
      BCAUS_09   ="Cause of dizziness or balance problem: Inner ear infection"
      BCAUS_10   ="Cause of dizziness or balance problem: Meniere's disease"
      BCAUS_11   ="Cause of dizziness or balance problem: Migraine headaches"
      BCAUS_12   =
"Cause of dizziness or balance problem: Neurological or muscular conditions"
      BCAUS_13   =
"Cause of dizziness or balance problem: Side effect of medicines or drugs"
      BCAUS_14   ="Cause of dizziness or balance problem: Stroke"
      BCAUS_15   ="Cause of dizziness or balance problem: TMJ"
      BCAUS_16   =
"Cause of dizziness or balance problem: Other health problem(s)"
      BTRET      ="Taken or tried anything to treat dizziness or balance problem
"
      BTRET_01   ="Treatments tried: Exercises or physical therapy"
      BTRET_02   =
"Treatments tried: Head rolling maneuver by a doctor or therapist"
      BTRET_03   ="Treatments tried: Steroid injections into ear"
      BTRET_04   ="Treatments tried: Gentamicin injection into ear"
      BTRET_05   ="Treatments tried: Ear surgery"
      BTRET_06   ="Treatments tried: Head or neck surgery"
      BTRET_07   ="Treatments tried: Bed rest for several hours or days"
      BTRET_08   ="Treatments tried: Psychiatric treatment"
      BTRET_09   ="Treatments tried: Chiropractic treatment or manipulation"
      BTRET_10   ="Treatments tried: Acupuncture"
      BTRET_11   ="Treatments tried: Massage therapy"
      BTRET_12   ="Treatments tried: Tai Chi, Yoga, or Qi Gong"
      BTRET_13   ="Treatments tried: Hypnosis"
      BTRET_14   ="Treatments tried: Low salt diet"
      BTRET_15   =
"Treatments tried: Avoiding or cutting back on certain foods or drinks"
      BTRET_16   =
"Treatments tried: Quitting or reducing use of tobacco or cigarettes"
      BTRET_17   ="Treatments tried: Prescription medicine or drugs"
      BTRET_18   ="Treatments tried: Over-the-counter medicine"
      BTRET_19   ="Treatments tried: Herbal remedy"
      BTRET_20   ="Treatments tried: Meniette device, air pressure pulses in ear
"
      BTRET_21   ="Treatments tried: Wearing acupressure wristband or Sea-Band"
      BTRET_22   ="Treatments tried: Wearing magnets"
      BTRET_23   ="Treatments tried: Mouth guard"
      BSTAT      =
"Dizziness or balance problem worse, same, or improved, past 12 months"
      BMEDIC     ="Take medicine on a regular basis for any health problem(s)"
      BBETT      ="Medicine causes dizziness or balance problem to get worse"
      BCHNG      ="Dizziness or balance problems prevent you from doing things"
      BCHNG_01   =
"Dizziness or balance problems caused change in activities: Work or school"
      BCHNG_02   =
"Dizziness or balance problems caused change in activities: Driving a motor vehi
cle"
      BCHNG_03   =
"Dizziness or balance problems caused change in activities: Riding in a car, bus
, airplane, boat, or train"
      BCHNG_04   =
"Dizziness or balance problems caused change in activities: Exercising or taking
 walks"
      BCHNG_05   =
"Dizziness or balance problems caused change in activities: Standing or being on
 feet for 30 minutes or longer"
      BCHNG_06   =
"Dizziness or balance problems caused change in activities: Walking down a fligh
t of stairs"
      BCHNG_07   =
"Dizziness or balance problems caused change in activities: Walking or climbing 
up 10 steps without resting"
      BCHNG_08   =
"Dizziness or balance problems caused change in activities: Going outside home f
or shopping, movies, sporting or other events"
      BCHNG_09   =
"Dizziness or balance problems caused change in activities: Participating in soc
ial activities"
      BCHNG_10   =
"Dizziness or balance problems caused change in activities: Bathing, dressing, f
eeding yourself, or going to the toilet"
      BMISSWK    =
"Ever missed work or school because of dizziness or balance problem"
      BLMS_NO    =
"Time missed from school or work during entire life because of dizziness or bala
nce problem: # of units"
      BLMS_TP    =
"Time missed from school or work during entire life because of dizziness or bala
nce problem: time period"
      BM12_NO    =
"Time missed from school or work, past 12 months because of dizziness or balance
 problem: # of units"
      BM12_TP    =
"Time missed from school or work, past 12 months because of dizziness or balance
 problem: time period"
      BPROB      =
"How much of a problem was dizziness or balance condition, past 12 months"
      BMED_01    =
"Taken or had any of the following for any health condition: Antibiotics given I
.V."
      BMED_02    =
"Taken or had any of the following for any health condition: Antibiotics injecte
d into ear"
      BMED_03    =
"Taken or had any of the following for any health condition: Diuretics"
      BMED_04    =
"Taken or had any of the following for any health condition: Antivert (Meclizine
)"
      BMED_05    =
"Taken or had any of the following for any health condition: Medicine or patches
 for motion sickness, nausea, or vomiting"
      BMED_06    =
"Taken or had any of the following for any health condition: Medicines for anxie
ty"
      BMED_07    =
"Taken or had any of the following for any health condition: Chemotherapy drugs"
      BMED_08    =
"Taken or had any of the following for any health condition: X-ray, MRI, or CAT 
scan of the head"
      BBIO       =
"Any biological relatives have trouble with dizziness, balance, or falling"
      BFALL5     ="Fell at least one time, past 5 years"
      BFL_01     =
"Fall occurred just before or around time felt sense of spinning, past 5 years"
      BFL_02     =
"Fall occurred just before or around time had floating or spacey feeling, past 5
 years"
      BFL_03     =
"Fall occurred just before or around time felt lightheaded, past 5 years"
      BFL_04     =
"Fall occurred just before or around time felt about to pass out, past 5 years"
      BFL_05     =
"Fall occurred just before or around time had blurred vision, past 5 years"
      BFL_06     =
"Fall occurred just before or around time had unsteadiness, past 5 years"
      BFALL12    ="Fell once a month on average, past 12 months"
      BF12_NO    ="Times fell, past 12 months: #of units"
      BF12_TP    ="Times fell, past 12 months: time period"
      BFTIME     ="Number of time fell, past 12 months"
      BINJ       ="Had an injury resulting from a fall, past 12 months"
      BIJMS_NO   =
"Time missed from work or school due to injury from fall, past 12 months: # of u
nits"
      BIJMS_TP   =
"Time missed from work or school due to injury from fall, past 12 months: time p
eriod"
      BFWHY_01   ="Reason fell, past 12 months: Tripped or stumbled"
      BFWHY_02   ="Reason fell, past 12 months: Slipped"
      BFWHY_03   ="Reason fell, past 12 months: Hurried too much"
      BFWHY_04   ="Reason fell, past 12 months: Not paying attention"
      BFWHY_05   ="Reason fell, past 12 months: Had nothing to hold onto"
      BFWHY_06   ="Reason fell, past 12 months: Blacked out or fainted"
      BFWHY_07   ="Reason fell, past 12 months: Lost balance"
      BFWHY_08   =
"Reason fell, past 12 months: Knocked over by someone or something"
      BFWHY_09   ="Reason fell, past 12 months: Playing sports or exercising"
      BFWHY_10   ="Reason fell, past 12 months: Had a problem with hearing"
      BFWHY_11   ="Reason fell, past 12 months: Had a problem with vision"
      BFWHY_12   =
"Reason fell, past 12 months: Getting up after sitting or lying down"
      BFWHY_13   ="Reason fell, past 12 months: Walking up or down stairs"
      BFWHY_14   ="Reason fell, past 12 months: Has slow reactions or reflexes"
      BFWHY_15   =
"Reason fell, past 12 months: Had weakness or numbness in one or both legs"
      BFWHY_16   =
"Reason fell, past 12 months: Had not eaten recently or had low blood sugar"
      BFWHY_17   ="Reason fell, past 12 months: Had a problem with medicine"
      BFWHY_18   ="Reason fell, past 12 months: Drank too much alcohol"
      BFWHY_19   =
"Reason fell, past 12 months: Had problem using a walker, cane, or other aid"
      BFWHY_20   =
"Reason fell, past 12 months: Had problem with shoes, sandals, or socks"
      BFWHY_21   ="Reason fell, past 12 months: Had a health condition"
      BFWHY_22   ="Reason fell, past 12 months: Some other reason"
   ;

   * ASSOCIATE VARIABLES WITH FORMAT VALUES;
   *    (PUT ASTERISK (*) BEFORE WORD "FORMAT"
        IN NEXT STATEMENT TO PREVENT FORMAT
        ASSOCIATIONS BEING STORED WITH DATA SET);
   FORMAT

      /* IDN FORMAT ASSOCIATIONS */

      RECTYPE   SAP001X.   SRVY_YR   SAP002X.   HHX       $GROUPC.
      INTV_QRT  SAP004X.   ASSIGNWK  SAP005X.   WTIA_SA   GROUPN.
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

      /* ASD FORMAT ASSOCIATIONS */

      DOINGLWA  SAP023X.   WHYNOWKA  SAP024X.   EVERWRK   SAP025X.
      INDSTRN1  SAP026X.   INDSTRN2  SAP026X.   OCCUPN1   SAP028X.
      OCCUPN2   SAP028X.   WRKCATA   SAP030X.   BUSINC1A  SAP025X.
      LOCALL1A  SAP032X.   YRSWRKPA  SAP033X.   WRKLONGH  SAP025X.
      HOURPDA   SAP025X.   PDSICKA   SAP025X.   ONEJOB    SAP025X.

      /* ACN FORMAT ASSOCIATIONS */

      HYPEV     SAP025X.   HYPDIFV   SAP025X.   HYPLOW    SAP025X.
      HYBPCKNO  SAP041X.   HYBPCKTP  SAP042X.   HYBPLEV   SAP043X.
      CLCKNO    SAP041X.   CLCKTP    SAP042X.   CLHI      SAP025X.
      CHDEV     SAP025X.   ANGEV     SAP025X.   MIEV      SAP025X.
      HRTEV     SAP025X.   STREV     SAP025X.   EPHEV     SAP025X.
      JAWP      SAP025X.   WEA       SAP025X.   CHE       SAP025X.
      ARM       SAP025X.   BRTH      SAP025X.   AHADO     SAP058X.
      ACPR      SAP025X.   ACPRLO    SAP060X.   AASMEV    SAP025X.
      AASSTILL  SAP025X.   AASMYR    SAP025X.   AASMERYR  SAP025X.
      AASMHSP   SAP025X.   AASMMC    SAP066X.   AWZMSWK   SAP067X.
      AWZPIN    SAP025X.   AASMINST  SAP025X.   AASMPMED  SAP025X.
      AASMCAN   SAP025X.   AASMED    SAP025X.   AASMDTP   SAP025X.
      AASWMP    SAP025X.   AASCLASS  SAP025X.   AAS_REC   SAP025X.
      AAS_RES   SAP025X.   AAS_MON   SAP025X.   AAPENVLN  SAP079X.
      AAPENVDO  SAP080X.   CHRFATIG  SAP025X.   THYLOW    SAP025X.
      CHRINFCT  SAP025X.   MULDYST   SAP025X.   EPILEPSY  SAP025X.
      CEREBRLP  SAP025X.   SPINEINJ  SAP025X.   HEADINJ   SAP025X.
      MOVEDIS   SAP025X.   MIGRAINE  SAP025X.   RHDACHE   SAP025X.
      MULSCLER  SAP025X.   ULCEV     SAP025X.   ULCYR     SAP025X.
      CANEV     SAP025X.   CNKIND1   SAP096X.   CNKIND2   SAP096X.
      CNKIND3   SAP096X.   CNKIND4   SAP096X.   CNKIND5   SAP096X.
      CNKIND6   SAP096X.   CNKIND7   SAP096X.   CNKIND8   SAP096X.
      CNKIND9   SAP096X.   CNKIND10  SAP096X.   CNKIND11  SAP096X.
      CNKIND12  SAP096X.   CNKIND13  SAP096X.   CNKIND14  SAP096X.
      CNKIND15  SAP096X.   CNKIND16  SAP096X.   CNKIND17  SAP096X.
      CNKIND18  SAP096X.   CNKIND19  SAP096X.   CNKIND20  SAP096X.
      CNKIND21  SAP096X.   CNKIND22  SAP096X.   CNKIND23  SAP096X.
      CNKIND24  SAP096X.   CNKIND25  SAP096X.   CNKIND26  SAP096X.
      CNKIND27  SAP096X.   CNKIND28  SAP096X.   CNKIND29  SAP096X.
      CNKIND30  SAP096X.   CNKIND31  SAP096X.   CANAGE1   SAP127X.
      CANAGE2   SAP127X.   CANAGE3   SAP127X.   CANAGE4   SAP127X.
      CANAGE5   SAP127X.   CANAGE6   SAP127X.   CANAGE7   SAP127X.
      CANAGE8   SAP127X.   CANAGE9   SAP127X.   CANAGE10  SAP127X.
      CANAGE11  SAP127X.   CANAGE12  SAP127X.   CANAGE13  SAP127X.
      CANAGE14  SAP127X.   CANAGE15  SAP127X.   CANAGE16  SAP127X.
      CANAGE17  SAP127X.   CANAGE18  SAP127X.   CANAGE19  SAP127X.
      CANAGE20  SAP127X.   CANAGE21  SAP127X.   CANAGE22  SAP127X.
      CANAGE23  SAP127X.   CANAGE24  SAP127X.   CANAGE25  SAP127X.
      CANAGE26  SAP127X.   CANAGE27  SAP127X.   CANAGE28  SAP127X.
      CANAGE29  SAP127X.   CANAGE30  SAP127X.   DIBEV     SAP157X.
      DIBPRE1   SAP025X.   DIBAGE    SAP127X.   DIFAGE2   SAP160X.
      INSLN     SAP025X.   DIBPILL   SAP025X.   AHAYFYR   SAP025X.
      SINYR     SAP025X.   CBRCHYR   SAP025X.   KIDWKYR   SAP025X.
      LIVYR     SAP025X.   JNTSYMP   SAP025X.   JMTHP1    SAP096X.
      JMTHP2    SAP096X.   JMTHP3    SAP096X.   JMTHP4    SAP096X.
      JMTHP5    SAP096X.   JMTHP6    SAP096X.   JMTHP7    SAP096X.
      JMTHP8    SAP096X.   JMTHP9    SAP096X.   JMTHP10   SAP096X.
      JMTHP11   SAP096X.   JMTHP12   SAP096X.   JMTHP13   SAP096X.
      JMTHP14   SAP096X.   JMTHP15   SAP096X.   JMTHP16   SAP096X.
      JMTHP17   SAP096X.   JNTCHR    SAP025X.   JNTHP     SAP025X.
      ARTH1     SAP025X.   ARTHLMT   SAP025X.   ARTHTYP1  SAP096X.
      ARTHTYP2  SAP096X.   ARTHTYP3  SAP096X.   ARTHTYP4  SAP096X.
      ARTHTYP5  SAP096X.   ARTHTYP6  SAP096X.   PAINECK   SAP025X.
      PAINLB    SAP025X.   PAINLEG   SAP025X.   PAINFACE  SAP025X.
      AMIGR     SAP025X.   ACOLD2W   SAP025X.   AINTIL2W  SAP025X.
      PREGNOW   SAP025X.   HRAIDNOW  SAP025X.   HRAIDEV   SAP025X.
      AHEARST1  SAP206X.   HRWORS    SAP025X.   HRWHICH   SAP208X.
      HRRIGHT   SAP206X.   HRLEFT    SAP206X.   HRTIN     SAP025X.
      HRTINLNG  SAP212X.   HRTINOFT  SAP213X.   HRTINMUS  SAP025X.
      HRTINSLP  SAP025X.   HRTNPROB  SAP216X.   AVISION   SAP025X.
      ABLIND    SAP025X.   VIM_DREV  SAP025X.   VIMLS_DR  SAP025X.
      VIM_CAEV  SAP025X.   VIMLS_CA  SAP025X.   VIMCSURG  SAP025X.
      VIM_GLEV  SAP025X.   VIMLS_GL  SAP025X.   VIM_MDEV  SAP025X.
      VIMLS_MD  SAP025X.   VIMGLASS  SAP025X.   VIMREAD   SAP025X.
      VIMDRIVE  SAP025X.   AVISREH   SAP025X.   AVISDEV   SAP025X.
      AVDF_NWS  SAP233X.   AVDF_CLS  SAP233X.   AVDF_NIT  SAP233X.
      AVDF_DRV  SAP233X.   AVDF_PER  SAP233X.   AVDF_CRD  SAP233X.
      AVISEXAM  SAP239X.   AVISACT   SAP025X.   AVISPROT  SAP241X.
      LUPPRT    SAP025X.   SAD       SAP243X.   NERVOUS   SAP243X.
      RESTLESS  SAP243X.   HOPELESS  SAP243X.   EFFORT    SAP243X.
      WORTHLS   SAP243X.   MHAMTMO   SAP249X.   DEPRESS   SAP025X.
      GANXIETY  SAP025X.   PANICD    SAP025X.

      /* AHS FORMAT ASSOCIATIONS */

      WRKLYR3   SAP253X.   WKDAYR    SAP254X.   BEDDAYR   SAP254X.
      AHSTATYR  SAP256X.   SPECEQ    SAP025X.   FLWALK    SAP258X.
      FLCLIMB   SAP258X.   FLSTAND   SAP258X.   FLSIT     SAP258X.
      FLSTOOP   SAP258X.   FLREACH   SAP258X.   FLGRASP   SAP258X.
      FLCARRY   SAP258X.   FLPUSH    SAP258X.   FLSHOP    SAP258X.
      FLSOCL    SAP258X.   FLRELAX   SAP258X.   FLA1AR    SAP270X.
      AFLHCA1   SAP096X.   AFLHCA2   SAP096X.   AFLHCA3   SAP096X.
      AFLHCA4   SAP096X.   AFLHCA5   SAP096X.   AFLHCA6   SAP096X.
      AFLHCA7   SAP096X.   AFLHCA8   SAP096X.   AFLHCA9   SAP096X.
      AFLHCA10  SAP096X.   AFLHCA11  SAP096X.   AFLHCA12  SAP096X.
      AFLHCA13  SAP096X.   AFLHCA14  SAP096X.   AFLHCA15  SAP096X.
      AFLHCA16  SAP096X.   AFLHCA17  SAP096X.   AFLHCA18  SAP096X.
      AFLHC19_  SAP096X.   AFLHC20_  SAP096X.   AFLHC21_  SAP096X.
      AFLHC22_  SAP096X.   AFLHC23_  SAP096X.   AFLHC24_  SAP096X.
      AFLHC25_  SAP096X.   AFLHC26_  SAP096X.   AFLHC27_  SAP096X.
      AFLHC28_  SAP096X.   AFLHC29_  SAP096X.   AFLHC30_  SAP096X.
      AFLHC31_  SAP096X.   AFLHC32_  SAP096X.   AFLHC33_  SAP096X.
      AFLHC34_  SAP096X.   AFLHCA90  SAP096X.   AFLHCA91  SAP096X.
      ALTIME1   SAP307X.   ALUNIT1   SAP308X.   ALDURA1   SAP309X.
      ALDURB1   SAP310X.   ALCHRC1   SAP311X.   ALTIME2   SAP307X.
      ALUNIT2   SAP308X.   ALDURA2   SAP309X.   ALDURB2   SAP310X.
      ALCHRC2   SAP311X.   ALTIME3   SAP307X.   ALUNIT3   SAP308X.
      ALDURA3   SAP309X.   ALDURB3   SAP310X.   ALCHRC3   SAP311X.
      ALTIME4   SAP307X.   ALUNIT4   SAP308X.   ALDURA4   SAP309X.
      ALDURB4   SAP310X.   ALCHRC4   SAP311X.   ALTIME5   SAP307X.
      ALUNIT5   SAP308X.   ALDURA5   SAP309X.   ALDURB5   SAP310X.
      ALCHRC5   SAP311X.   ALTIME6   SAP307X.   ALUNIT6   SAP308X.
      ALDURA6   SAP309X.   ALDURB6   SAP310X.   ALCHRC6   SAP311X.
      ALTIME7   SAP307X.   ALUNIT7   SAP308X.   ALDURA7   SAP309X.
      ALDURB7   SAP310X.   ALCHRC7   SAP311X.   ALTIME8   SAP307X.
      ALUNIT8   SAP308X.   ALDURA8   SAP309X.   ALDURB8   SAP310X.
      ALCHRC8   SAP311X.   ALTIME9   SAP307X.   ALUNIT9   SAP308X.
      ALDURA9   SAP309X.   ALDURB9   SAP310X.   ALCHRC9   SAP311X.
      ALTIME10  SAP307X.   ALUNIT10  SAP308X.   ALDURA10  SAP309X.
      ALDURB10  SAP310X.   ALCHRC10  SAP311X.   ALTIME11  SAP307X.
      ALUNIT11  SAP308X.   ALDURA11  SAP309X.   ALDURB11  SAP310X.
      ALCHRC11  SAP311X.   ALTIME12  SAP307X.   ALUNIT12  SAP308X.
      ALDURA12  SAP309X.   ALDURB12  SAP310X.   ALCHRC12  SAP311X.
      ALTIME13  SAP307X.   ALUNIT13  SAP308X.   ALDURA13  SAP309X.
      ALDURB13  SAP310X.   ALCHRC13  SAP311X.   ALTIME14  SAP307X.
      ALUNIT14  SAP308X.   ALDURA14  SAP309X.   ALDURB14  SAP310X.
      ALCHRC14  SAP311X.   ALTIME15  SAP307X.   ALUNIT15  SAP308X.
      ALDURA15  SAP309X.   ALDURB15  SAP310X.   ALCHRC15  SAP311X.
      ALTIME16  SAP307X.   ALUNIT16  SAP308X.   ALDURA16  SAP309X.
      ALDURB16  SAP310X.   ALCHRC16  SAP311X.   ALTIME17  SAP307X.
      ALUNIT17  SAP308X.   ALDURA17  SAP309X.   ALDURB17  SAP310X.
      ALCHRC17  SAP311X.   ALTIME18  SAP307X.   ALUNIT18  SAP308X.
      ALDURA18  SAP309X.   ALDURB18  SAP310X.   ALCHRC18  SAP311X.
      ALTIME19  SAP307X.   ALUNIT19  SAP308X.   ALDURA19  SAP309X.
      ALDURB19  SAP310X.   ALCHRC19  SAP311X.   ALTIME20  SAP307X.
      ALUNIT20  SAP308X.   ALDURA20  SAP309X.   ALDURB20  SAP310X.
      ALCHRC20  SAP311X.   ALTIME21  SAP307X.   ALUNIT21  SAP308X.
      ALDURA21  SAP309X.   ALDURB21  SAP310X.   ALCHRC21  SAP311X.
      ALTIME22  SAP307X.   ALUNIT22  SAP308X.   ALDURA22  SAP309X.
      ALDURB22  SAP310X.   ALCHRC22  SAP311X.   ALTIME23  SAP307X.
      ALUNIT23  SAP308X.   ALDURA23  SAP309X.   ALDURB23  SAP310X.
      ALCHRC23  SAP311X.   ALTIME24  SAP307X.   ALUNIT24  SAP308X.
      ALDURA24  SAP309X.   ALDURB24  SAP310X.   ALCHRC24  SAP311X.
      ALTIME25  SAP307X.   ALUNIT25  SAP308X.   ALDURA25  SAP309X.
      ALDURB25  SAP310X.   ALCHRC25  SAP311X.   ALTIME26  SAP307X.
      ALUNIT26  SAP308X.   ALDURA26  SAP309X.   ALDURB26  SAP310X.
      ALCHRC26  SAP311X.   ALTIME27  SAP307X.   ALUNIT27  SAP308X.
      ALDURA27  SAP309X.   ALDURB27  SAP310X.   ALCHRC27  SAP311X.
      ALTIME28  SAP307X.   ALUNIT28  SAP308X.   ALDURA28  SAP309X.
      ALDURB28  SAP310X.   ALCHRC28  SAP311X.   ALTIME29  SAP307X.
      ALUNIT29  SAP308X.   ALDURA29  SAP309X.   ALDURB29  SAP310X.
      ALCHRC29  SAP311X.   ALTIME30  SAP307X.   ALUNIT30  SAP308X.
      ALDURA30  SAP309X.   ALDURB30  SAP310X.   ALCHRC30  SAP311X.
      ALTIME31  SAP307X.   ALUNIT31  SAP308X.   ALDURA31  SAP309X.
      ALDURB31  SAP310X.   ALCHRC31  SAP311X.   ALTIME32  SAP307X.
      ALUNIT32  SAP308X.   ALDURA32  SAP309X.   ALDURB32  SAP310X.
      ALCHRC32  SAP311X.   ALTIME33  SAP307X.   ALUNIT33  SAP308X.
      ALDURA33  SAP309X.   ALDURB33  SAP310X.   ALCHRC33  SAP311X.
      ALTIME34  SAP307X.   ALUNIT34  SAP308X.   ALDURA34  SAP309X.
      ALDURB34  SAP310X.   ALCHRC34  SAP311X.   ALTIME90  SAP307X.
      ALUNIT90  SAP308X.   ALDURA90  SAP309X.   ALDURB90  SAP310X.
      ALCHRC90  SAP311X.   ALTIME91  SAP307X.   ALUNIT91  SAP308X.
      ALDURA91  SAP309X.   ALDURB91  SAP310X.   ALCHRC91  SAP311X.
      ALCNDRT   SAP487X.   ALCHRONR  SAP488X.

      /* AHB FORMAT ASSOCIATIONS */

      SMKEV     SAP025X.   SMKREG    SAP490X.   SMKNOW    SAP491X.
      SMKSTAT2  SAP492X.   SMKQTNO   SAP493X.   SMKQTTP   SAP042X.
      SMKQTY    SAP495X.   CIGSDA1   SAP496X.   CIGDAMO   SAP497X.
      CIGSDA2   SAP496X.   CIGSDAY   SAP496X.   CIGQTYR   SAP025X.
      VIGNO     SAP501X.   VIGTP     SAP502X.   VIGFREQW  SAP503X.
      VIGLNGNO  SAP504X.   VIGLNGTP  SAP505X.   VIGMIN    SAP504X.
      MODNO     SAP501X.   MODTP     SAP502X.   MODFREQW  SAP509X.
      MODLNGNO  SAP504X.   MODLNGTP  SAP505X.   MODMIN    SAP504X.
      STRNGNO   SAP501X.   STRNGTP   SAP502X.   STRFREQW  SAP515X.
      ALC1YR    SAP025X.   ALCLIFE   SAP025X.   ALC12MNO  SAP518X.
      ALC12MTP  SAP519X.   ALC12MWK  SAP520X.   ALC12MYR  SAP521X.
      ALCAMT    SAP522X.   ALCSTAT   SAP523X.   ALC5UPNO  SAP521X.
      ALC5UPTP  SAP525X.   ALC5UPYR  SAP521X.   AHEIGHT   SAP527X.
      AWEIGHTP  SAP528X.   BMI       SAP529X.   SLEEP     SAP530X.

      /* AAU FORMAT ASSOCIATIONS */

      AUSUALPL  SAP531X.   APLKIND   SAP532X.   AHCPLROU  SAP025X.
      AHCPLKND  SAP534X.   AHCCHGYR  SAP025X.   AHCCHGHI  SAP025X.
      AHCDLYR1  SAP025X.   AHCDLYR2  SAP025X.   AHCDLYR3  SAP025X.
      AHCDLYR4  SAP025X.   AHCDLYR5  SAP025X.   AHCAFYR1  SAP025X.
      AHCAFYR2  SAP025X.   AHCAFYR3  SAP025X.   AHCAFYR4  SAP025X.
      ADNLONG2  SAP546X.   AHCSYR1   SAP025X.   AHCSYR2   SAP025X.
      AHCSYR3   SAP025X.   AHCSYR4   SAP025X.   AHCSYR5   SAP025X.
      AHCSYR6   SAP025X.   AHCSYR7   SAP025X.   AHCSYR8   SAP025X.
      AHCSYR9   SAP025X.   AHCSYR10  SAP025X.   AHERNOY2  SAP557X.
      AHCHYR    SAP025X.   AHCHMOYR  SAP530X.   AHCHNOY2  SAP560X.
      AHCNOYR2  SAP557X.   ASRGYR    SAP025X.   ASRGNOYR  SAP563X.
      AMDLONGR  SAP546X.   SHTFLUYR  SAP025X.   ASHFLU_M  SAP566X.
      ASHFLU_Y  SAP567X.   SPRFLUYR  SAP025X.   ASPFLU_M  SAP566X.
      ASPFLU_Y  SAP567X.   SHTPNUYR  SAP025X.   APOX      SAP025X.
      APOX12MO  SAP025X.   AHEP      SAP025X.   AHEPLIV   SAP025X.
      SHTHEPB   SAP025X.   SHEPDOS   SAP577X.   SHTHEPA   SAP025X.
      SHEPANUM  SAP579X.   SHINGLES  SAP025X.   SHTTD     SAP025X.
      SHTTD05   SAP025X.   SHTTDAP   SAP583X.   LIVEV     SAP025X.
      TRAVEL    SAP025X.

      /* AOH FORMAT ASSOCIATIONS */

      OCOND     SAP586X.   OBTWS     SAP587X.   OEMB      SAP588X.
      OREAS_1   SAP589X.   OREAS_2   SAP589X.   OREAS_3   SAP591X.
      OREAS_4   SAP591X.   OPROB_01  SAP025X.   OPROB_02  SAP025X.
      OPROB_03  SAP025X.   OPROB_04  SAP025X.   OPROB_05  SAP025X.
      OPROB_06  SAP025X.   OPROB_07  SAP025X.   OPROB_08  SAP025X.
      OPROB_09  SAP025X.   OPROB_10  SAP025X.   OPROB_11  SAP025X.
      OPROB_12  SAP025X.   ODENT1    SAP025X.   ODENT2    SAP606X.
      ONODEN_1  SAP025X.   ONODEN_2  SAP025X.   ONODEN_3  SAP025X.
      ONODEN_4  SAP025X.   ONODEN_5  SAP025X.   ONODEN_6  SAP025X.
      ONODEN_7  SAP025X.   OINT_1    SAP614X.   OINT_2    SAP025X.
      OINT_3    SAP025X.   OINT_4    SAP025X.   OCEXAM    SAP025X.
      OCTONG    SAP025X.   OCNECK    SAP025X.   OCEXWHEN  SAP621X.
      OEXCHECK  SAP622X.   OCEXPROF  SAP623X.

      /* ADS FORMAT ASSOCIATIONS */

      BLDGV     SAP025X.   BLDG12M   SAP025X.   HIVTST    SAP025X.
      WHYTST_R  SAP627X.   TST12M_M  SAP628X.   TST12M_Y  SAP629X.
      TIMETST   SAP630X.   REATST_C  SAP631X.   REASWHOR  SAP632X.
      LASTST_C  SAP633X.   CLNTYP_C  SAP634X.   WHOADM    SAP635X.
      GIVNAM    SAP025X.   EXTST12M  SAP025X.   CHNSADSP  SAP638X.
      STMTRU    SAP639X.   STD       SAP025X.   STDDOC    SAP025X.
      STDWHER   SAP642X.   TBHRD     SAP025X.   TBKNOW    SAP025X.
      TB        SAP645X.   TBSPRD1   SAP096X.   TBSPRD2   SAP096X.
      TBSPRD3   SAP096X.   TBSPRD4   SAP096X.   TBSPRD5   SAP096X.
      TBSPRD6   SAP096X.   TBCURED   SAP025X.   TBCHANC   SAP653X.
      TBSHAME   SAP025X.   HOMELESS  SAP025X.

      /* NAF FORMAT ASSOCIATIONS */

      SUN1_SHA  SAP656X.   SUN1_CAP  SAP656X.   SUN1_HAT  SAP656X.
      SUN2_LGS  SAP656X.   SUN2_LGP  SAP656X.   SUN2_SCR  SAP656X.
      SPF       SAP662X.   SPFSCALE  SAP663X.   SNNUM     SAP254X.
      PAPHAD    SAP025X.   PAP6YR    SAP666X.   RPAP1_MT  SAP628X.
      RPAP1_YR  SAP629X.   RPAP1N    SAP493X.   RPAP1T    SAP670X.
      RPAP2CA   SAP671X.   PAPREAS   SAP672X.   PAPABN    SAP025X.
      PAPNOT    SAP674X.   MDRECPAP  SAP675X.   PAPWHEN   SAP676X.
      HYST      SAP025X.   HPVHRD    SAP025X.   HPVCAUS   SAP025X.
      HPVSEXCN  SAP025X.   HPVTRET   SAP025X.   HPVHAD    SAP025X.
      SHHPVHRD  SAP025X.   SHTHPV    SAP684X.   SHHPVDOS  SAP685X.
      HPVINT    SAP025X.   HPVNOT    SAP687X.   HPVCOST   SAP025X.
      HPVLOCST  SAP025X.   MAMHAD    SAP025X.   MAM6YR    SAP691X.
      RMAM1_MT  SAP628X.   RMAM1_YR  SAP693X.   RMAM1N    SAP493X.
      RMAM1T    SAP670X.   RMAM2CA   SAP671X.   MAMREAS   SAP672X.
      MDRECMAM  SAP675X.   MAMINFO   SAP025X.   MAMDELAY  SAP025X.
      HRTEVER   SAP025X.   HRTNOW    SAP025X.   HRTLONG   SAP703X.
      PSAHAD    SAP025X.   RPSA1_MT  SAP628X.   RPSA1_YR  SAP693X.
      RPSA1N    SAP493X.   RPSA1T    SAP670X.   RPSA2     SAP671X.
      PSAREAS   SAP672X.   MDRECPSA  SAP675X.   CREHAD    SAP025X.
      RCRE1_MT  SAP628X.   RCRE1_YR  SAP693X.   RCRE1N    SAP493X.
      RCRE1T    SAP670X.   RCRE2     SAP717X.   CRENAM    SAP718X.
      CREREAS   SAP672X.   CREREC    SAP675X.   HFOBHAD   SAP025X.
      RHFO1_MT  SAP628X.   RHFO1_YR  SAP693X.   RHFO1N    SAP493X.
      RHFO1T    SAP670X.   RHFO2     SAP717X.   MDHFOB    SAP675X.

      /* PAF FORMAT ASSOCIATIONS */

      HYPPREG   SAP025X.   HLOSWGT   SAP025X.   WGTADEV   SAP025X.
      WGTADNOW  SAP025X.   LOWSLT    SAP025X.   LOWSLTEV  SAP025X.
      LOWSLTNW  SAP025X.   EXERC     SAP025X.   EXERCEV   SAP025X.
      EXERCNW   SAP025X.   HBPALC    SAP025X.   HBPALCEV  SAP025X.
      HBPALCNW  SAP025X.   HYPMEDEV  SAP025X.   HYPMED    SAP025X.
      HYMDMED   SAP025X.

      /* BAL FORMAT ASSOCIATIONS */

      BAID_01   SAP025X.   BAID_02   SAP025X.   BAID_03   SAP025X.
      BAID_04   SAP025X.   BAID_05   SAP025X.   BAID_06   SAP749X.
      BAID_07   SAP025X.   BAID_08   SAP025X.   BBRAC1    SAP096X.
      BBRAC2    SAP096X.   BBRAC3    SAP096X.   BBRAC4    SAP096X.
      BBRAC5    SAP096X.   BBRAC6    SAP096X.   BBRAC7    SAP096X.
      BART1     SAP096X.   BART2     SAP096X.   BART3     SAP096X.
      BART4     SAP096X.   BART5     SAP096X.   BDIZZ     SAP025X.
      BBAL_01   SAP025X.   BBAL_02   SAP025X.   BBAL_03   SAP025X.
      BBAL_04   SAP025X.   BBAL_05   SAP025X.   BBAL_06   SAP025X.
      BBAL_07   SAP025X.   BBAL_08   SAP025X.   BBAL_09   SAP025X.
      BBAL_10   SAP025X.   BBAL_11   SAP025X.   BBAL_12   SAP025X.
      BBAL_13   SAP025X.   BBAL_14   SAP025X.   BBAL_15   SAP025X.
      BBALCT    SAP530X.   BTYPE_01  SAP025X.   BTYPE_02  SAP025X.
      BTYPE_03  SAP025X.   BTYPE_04  SAP025X.   BTYPE_05  SAP025X.
      BTYPE_06  SAP025X.   BTYPECT   SAP787X.   BBOTH     SAP788X.
      BAGE      SAP789X.   BLONG     SAP790X.   BOFTEN    SAP791X.
      BLAST     SAP792X.   BTRIG_01  SAP025X.   BTRIG_02  SAP025X.
      BTRIG_03  SAP025X.   BTRIG_04  SAP025X.   BTRIG_05  SAP025X.
      BTRIG_06  SAP025X.   BTRIG_07  SAP025X.   BTRIG_08  SAP025X.
      BTRIG_09  SAP025X.   BTRIG_10  SAP025X.   BTRIG_11  SAP025X.
      BTRIG_12  SAP025X.   BTRIG_13  SAP025X.   BSAME_01  SAP025X.
      BSAME_02  SAP025X.   BSAME_03  SAP025X.   BSAME_04  SAP025X.
      BSAME_05  SAP025X.   BSAME_06  SAP025X.   BSAME_07  SAP025X.
      BSAME_08  SAP025X.   BSAME_09  SAP025X.   BSAME_10  SAP025X.
      BSAME_11  SAP025X.   BSAME_12  SAP025X.   BSAME_13  SAP025X.
      BSAME_14  SAP025X.   BSAME_15  SAP025X.   BSAME_16  SAP025X.
      BSAME_17  SAP025X.   BSAME_18  SAP025X.   BSAME_19  SAP025X.
      BSAME_20  SAP025X.   BSAME_21  SAP025X.   BSAME_22  SAP025X.
      BONLY_01  SAP828X.   BONLY_02  SAP828X.   BONLY_03  SAP828X.
      BONLY_04  SAP828X.   BONLY_05  SAP828X.   BONLY_06  SAP828X.
      BONLY_07  SAP828X.   BONLY_08  SAP828X.   BONLY_09  SAP828X.
      BONLY_10  SAP828X.   BONLY_11  SAP828X.   BONLY_12  SAP828X.
      BONLY_13  SAP828X.   BONLY_14  SAP828X.   BONLY_15  SAP828X.
      BONLY_16  SAP828X.   BONLY_17  SAP828X.   BONLY_18  SAP828X.
      BONLY_19  SAP828X.   BONLY_20  SAP828X.   BONLY_21  SAP828X.
      BONLY_22  SAP828X.   BHOSP     SAP025X.   BHOSPNO   SAP851X.
      BHP       SAP025X.   BHP_01    SAP025X.   BHP_02    SAP025X.
      BHP_03    SAP025X.   BHP_04    SAP025X.   BHP_05    SAP025X.
      BHP_06    SAP025X.   BHP_07    SAP025X.   BHP_08    SAP025X.
      BHP_09    SAP025X.   BHP_10    SAP025X.   BHP_11    SAP025X.
      BHP_12    SAP025X.   BHP_13    SAP025X.   BHP_14    SAP025X.
      BHP_15    SAP025X.   BHP_16    SAP025X.   B5YRS     SAP851X.
      BFIRST    SAP870X.   BDIFF     SAP871X.   BHELP     SAP025X.
      BTHLP_NO  SAP504X.   BTHLP_TP  SAP874X.   BDIAG     SAP025X.
      BCAUS_01  SAP096X.   BCAUS_02  SAP096X.   BCAUS_03  SAP096X.
      BCAUS_04  SAP096X.   BCAUS_05  SAP096X.   BCAUS_06  SAP096X.
      BCAUS_07  SAP096X.   BCAUS_08  SAP096X.   BCAUS_09  SAP096X.
      BCAUS_10  SAP096X.   BCAUS_11  SAP096X.   BCAUS_12  SAP096X.
      BCAUS_13  SAP096X.   BCAUS_14  SAP096X.   BCAUS_15  SAP096X.
      BCAUS_16  SAP096X.   BTRET     SAP025X.   BTRET_01  SAP025X.
      BTRET_02  SAP025X.   BTRET_03  SAP025X.   BTRET_04  SAP025X.
      BTRET_05  SAP025X.   BTRET_06  SAP025X.   BTRET_07  SAP025X.
      BTRET_08  SAP025X.   BTRET_09  SAP025X.   BTRET_10  SAP025X.
      BTRET_11  SAP025X.   BTRET_12  SAP025X.   BTRET_13  SAP025X.
      BTRET_14  SAP025X.   BTRET_15  SAP025X.   BTRET_16  SAP025X.
      BTRET_17  SAP025X.   BTRET_18  SAP025X.   BTRET_19  SAP025X.
      BTRET_20  SAP025X.   BTRET_21  SAP025X.   BTRET_22  SAP025X.
      BTRET_23  SAP025X.   BSTAT     SAP916X.   BMEDIC    SAP025X.
      BBETT     SAP025X.   BCHNG     SAP025X.   BCHNG_01  SAP920X.
      BCHNG_02  SAP025X.   BCHNG_03  SAP025X.   BCHNG_04  SAP025X.
      BCHNG_05  SAP025X.   BCHNG_06  SAP025X.   BCHNG_07  SAP025X.
      BCHNG_08  SAP025X.   BCHNG_09  SAP025X.   BCHNG_10  SAP025X.
      BMISSWK   SAP920X.   BLMS_NO   SAP504X.   BLMS_TP   SAP874X.
      BM12_NO   SAP504X.   BM12_TP   SAP934X.   BPROB     SAP216X.
      BMED_01   SAP025X.   BMED_02   SAP025X.   BMED_03   SAP025X.
      BMED_04   SAP025X.   BMED_05   SAP025X.   BMED_06   SAP025X.
      BMED_07   SAP025X.   BMED_08   SAP025X.   BBIO      SAP025X.
      BFALL5    SAP025X.   BFL_01    SAP025X.   BFL_02    SAP025X.
      BFL_03    SAP025X.   BFL_04    SAP025X.   BFL_05    SAP025X.
      BFL_06    SAP025X.   BFALL12   SAP025X.   BF12_NO   SAP504X.
      BF12_TP   SAP954X.   BFTIME    SAP955X.   BINJ      SAP025X.
      BIJMS_NO  SAP957X.   BIJMS_TP  SAP934X.   BFWHY_01  SAP025X.
      BFWHY_02  SAP025X.   BFWHY_03  SAP025X.   BFWHY_04  SAP025X.
      BFWHY_05  SAP025X.   BFWHY_06  SAP025X.   BFWHY_07  SAP025X.
      BFWHY_08  SAP025X.   BFWHY_09  SAP025X.   BFWHY_10  SAP025X.
      BFWHY_11  SAP025X.   BFWHY_12  SAP025X.   BFWHY_13  SAP025X.
      BFWHY_14  SAP025X.   BFWHY_15  SAP025X.   BFWHY_16  SAP025X.
      BFWHY_17  SAP025X.   BFWHY_18  SAP025X.   BFWHY_19  SAP025X.
      BFWHY_20  SAP025X.   BFWHY_21  SAP025X.   BFWHY_22  SAP025X.;
RUN;

PROC CONTENTS DATA=NHIS.SAMADULT;
   TITLE1 'CONTENTS OF THE 2008 NHIS Sample Adult FILE';

PROC FREQ DATA=NHIS.SAMADULT NOTITLE;
   TABLES RECTYPE/LIST MISSING;
   TITLE1 'FREQUENCY REPORT FOR 2008 NHIS Sample Adult FILE';
   TITLE2 '(WEIGHTED)';
   WEIGHT WTFA_SA;

PROC FREQ DATA=NHIS.SAMADULT NOTITLE;
   TABLES RECTYPE/LIST MISSING;
   TITLE1 'FREQUENCY REPORT FOR 2008 NHIS Sample Adult FILE';
   TITLE2 '(UNWEIGHTED)';

* USER NOTE: TO SEE UNFORMATTED VALUES IN PROCEDURES, ADD THE
             STATEMENT: FORMAT _ALL_;
RUN;
