*********************************************************************
 JUNE 8, 2010  4:24 PM
 
 This is an example of a SAS program that creates a SAS
 file from the 2009 NHIS Public Use SAMADULT.DAT ASCII file
 
 This is stored in SAMADULT.SAS
*********************************************************************;

* USER NOTE: PLACE NEXT STATEMENT IN SUBSEQUENT PROGRAMS;
LIBNAME  NHIS     "C:\NHIS2009";

* USER NOTE: PLACE NEXT STATEMENT IN SUBSEQUENT PROGRAMS
             IF YOU ALLOW PROGRAM TO PERMANENTLY STORE FORMATS;
LIBNAME  LIBRARY  "C:\NHIS2009";

FILENAME ASCIIDAT 'C:\NHIS2009\SAMADULT.dat';

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
      40                 = "40 Sample Child"
      60                 = "60 Family"
      63                 = "63 Disability Questions Tests 2008/2009"
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
      OTHER              = 
"See Industry Appendix in file layout at the end of the Sample Adult Documentati
on.  ."
   ;
   VALUE SAP027X
      .                   = '.'
      OTHER              = 
"See Industry Appendix in file layout at the end of the Sample Adult Documentati
on"
   ;
   VALUE SAP028X
      .                   = '.'
      OTHER              = 
"See Occupation Appendix in file layout at the end of the Sample Adult documenta
tion"
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
   VALUE SAP051X
      1                  = "1 Advise them to drive to the hospital"
      2                  = "2 Advise them to call their physician"
      3                  = "3 Call 9-1-1 (or another emergency number)"
      4                  = "4 Call spouse or family member"
      5                  = "5 Other"
      7                  = "7 Refused"
      8                  = "8 Not ascertained"
      9                  = "9 Don't know"
   ;
   VALUE SAP059X
      1                  = "1 Mentioned"
      2                  = "2 Not mentioned"
      7                  = "7 Refused"
      8                  = "8 Not ascertained"
      9                  = "9 Don't know"
   ;
   VALUE SAP090X
      85                 = "85 85+ years"
      97                 = "97 Refused"
      98                 = "98 Not ascertained"
      99                 = "99 Don't know"
   ;
   VALUE SAP120X
      1                  = "1 Yes"
      2                  = "2 No"
      3                  = "3 Borderline"
      7                  = "7 Refused"
      8                  = "8 Not ascertained"
      9                  = "9 Don't know"
   ;
   VALUE SAP123X
      00                 = "00 Within past year"
      85                 = "85 85+ years"
      96                 = "96 1+ year(s) with diabetes and age is 85+"
      97                 = "97 Refused"
      98                 = "98 Not ascertained"
      99                 = "99 Don't know"
   ;
   VALUE SAP149X
      97                 = "97 Refused"
      98                 = "98 Not ascertained"
      99                 = "99 Don't know"
   ;
   VALUE SAP155X
      1                  = "1 Yes"
      2                  = "2 No"
      7                  = "7 Refused"
      8                  = "8 Not asc0ertained"
      9                  = "9 Don't know"
   ;
   VALUE SAP168X
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
   VALUE SAP172X
      1                  = "1 ALL of the time"
      2                  = "2 MOST of the time"
      3                  = "3 SOME of the time"
      4                  = "4 A LITTLE of the time"
      5                  = "5 NONE of the time"
      7                  = "7 Refused"
      8                  = "8 Not ascertained"
      9                  = "9 Don't know"
   ;
   VALUE SAP178X
      1                  = "1 A lot"
      2                  = "2 Some"
      3                  = "3 A little"
      4                  = "4 Not at all"
      7                  = "7 Refused"
      8                  = "8 Not ascertained"
      9                  = "9 Don't know"
   ;
   VALUE SAP179X
      0                  = "0 Had job last week"
      1                  = "1 No job last week, had job past 12 months"
      2                  = "2 No job last week, no job past 12 months"
      3                  = "3 Never worked"
      7                  = "7 Refused"
      8                  = "8 Not ascertained"
      9                  = "9 Don't know"
   ;
   VALUE SAP180X
      000                = "000 None"
      997                = "997 Refused"
      998                = "998 Not ascertained"
      999                = "999 Don't know"
   ;
   VALUE SAP182X
      1                  = "1 Better"
      2                  = "2 Worse"
      3                  = "3 About the same"
      7                  = "7 Refused"
      8                  = "8 Not ascertained"
      9                  = "9 Don't know"
   ;
   VALUE SAP184X
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
   VALUE SAP196X
      1                  = "1 Limited in any way"
      2                  = "2 Not limited in any way"
      3                  = "3 Unknown if limited"
   ;
   VALUE SAP233X
      95                 = "95 95+"
      96                 = "96 Since birth"
      97                 = "97 Refused"
      98                 = "98 Not ascertained"
      99                 = "99 Don't know"
   ;
   VALUE SAP234X
      1                  = "1 Day(s)"
      2                  = "2 Week(s)"
      3                  = "3 Month(s)"
      4                  = "4 Year(s)"
      6                  = "6 Since birth"
      7                  = "7 Refused"
      8                  = "8 Not ascertained"
      9                  = "9 Don't know"
   ;
   VALUE SAP235X
      00                 = "00 Less than 1 year"
      85                 = "85 85+ years"
      96                 = "96 Unknown number of years"
      97                 = "97 Refused"
      98                 = "98 Not ascertained"
      99                 = "99 Don't know"
   ;
   VALUE SAP236X
      1                  = "1 Less than 3 months"
      2                  = "2 3-5 months"
      3                  = "3 6-12 months"
      4                  = "4 More than 1 year"
      7                  = "7 Refused"
      8                  = "8 Not ascertained"
      9                  = "9 Don't know"
   ;
   VALUE SAP237X
      1                  = "1 Chronic"
      2                  = "2 Not chronic"
      9                  = "9 Unknown if chronic"
   ;
   VALUE SAP413X
      1                  = 
"1 At least one chronic condition causes functional limitation"
      2                  = "2 No chronic condition causes functional limitation"
      9                  = 
"9 Unknown if any chronic condition causes functional limitation"
   ;
   VALUE SAP414X
      0                  = 
"0 Not limited in any way (including unknown if limited)"
      1                  = "1 Limited; caused by at least one chronic condition"
      2                  = "2 Limited; not caused by chronic condition"
      3                  = "3 Limited; unknown if condition is chronic"
   ;
   VALUE SAP416X
      85                 = "85 85 years or older"
      96                 = "96 Never smoked regularly"
      97                 = "97 Refused"
      98                 = "98 Not ascertained"
      99                 = "99 Don't know"
   ;
   VALUE SAP417X
      1                  = "1 Every day"
      2                  = "2 Some days"
      3                  = "3 Not at all"
      7                  = "7 Refused"
      8                  = "8 Not ascertained"
      9                  = "9 Don't know"
   ;
   VALUE SAP418X
      1                  = "1 Current every day smoker"
      2                  = "2 Current some day smoker"
      3                  = "3 Former smoker"
      4                  = "4 Never smoker"
      5                  = "5 Smoker, current status unknown"
      9                  = "9 Unknown if ever smoked"
   ;
   VALUE SAP419X
      95                 = "95 95+"
      97                 = "97 Refused"
      98                 = "98 Not ascertained"
      99                 = "99 Don't know"
   ;
   VALUE SAP420X
      1                  = "1 Day(s)"
      2                  = "2 Week(s)"
      3                  = "3 Month(s)"
      4                  = "4 Year(s)"
      7                  = "7 Refused"
      8                  = "8 Not ascertained"
      9                  = "9 Don't know"
   ;
   VALUE SAP421X
      00                 = "00 Less than 1 year"
      70                 = "70 70+ years"
      97                 = "97 Refused"
      98                 = "98 Not ascertained"
      99                 = "99 Don't know"
   ;
   VALUE SAP422X
      95                 = "95 95+ cigarettes"
      97                 = "97 Refused"
      98                 = "98 Not ascertained"
      99                 = "99 Don't know"
   ;
   VALUE SAP423X
      00                 = "00 None"
      97                 = "97 Refused"
      98                 = "98 Not ascertained"
      99                 = "99 Don't know"
   ;
   VALUE SAP427X
      000                = "000 Never"
      996                = "996 Unable to do this type activity"
      997                = "997 Refused"
      998                = "998 Not ascertained"
      999                = "999 Don't know"
   ;
   VALUE SAP428X
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
   VALUE SAP429X
      00                 = "00 Less than once per week"
      95                 = "95 Never"
      96                 = "96 Unable to do vigorous activity"
      97                 = "97 Refused"
      98                 = "98 Not ascertained"
      99                 = "99 Don't know"
   ;
   VALUE SAP430X
      997                = "997 Refused"
      998                = "998 Not ascertained"
      999                = "999 Don't know"
   ;
   VALUE SAP431X
      1                  = "1 Minutes"
      2                  = "2 Hours"
      7                  = "7 Refused"
      8                  = "8 Not ascertained"
      9                  = "9 Don't know"
   ;
   VALUE SAP435X
      00                 = "00 Less than once per week"
      95                 = "95 Never"
      96                 = "96 Unable to do light or moderate activity"
      97                 = "97 Refused"
      98                 = "98 Not ascertained"
      99                 = "99 Don't know"
   ;
   VALUE SAP441X
      00                 = "00 Less than once per week"
      95                 = "95 Never"
      96                 = "96 Unable to do strength activity"
      97                 = "97 Refused"
      98                 = "98 Not ascertained"
      99                 = "99 Don't know"
   ;
   VALUE SAP444X
      000                = "000 Never"
      997                = "997 Refused"
      998                = "998 Not ascertained"
      999                = "999 Don't know"
   ;
   VALUE SAP445X
      0                  = "0 Never/None"
      1                  = "1 Week"
      2                  = "2 Month"
      3                  = "3 Year"
      7                  = "7 Refused"
      8                  = "8 Not ascertained"
      9                  = "9 Don't know"
   ;
   VALUE SAP446X
      00                 = "00 Less than one day per week"
      95                 = "95 Did not drink in past year"
      97                 = "97 Refused"
      98                 = "98 Not ascertained"
      99                 = "99 Don't know"
   ;
   VALUE SAP447X
      000                = "000 Never/none"
      997                = "997 Refused"
      998                = "998 Not ascertained"
      999                = "999 Don't know"
   ;
   VALUE SAP448X
      95                 = "95 95+ drinks"
      97                 = "97 Refused"
      98                 = "98 Not ascertained"
      99                 = "99 Don't know"
   ;
   VALUE SAP449X
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
   VALUE SAP451X
      0                  = "0 Never/None"
      1                  = "1 Per week"
      2                  = "2 Per month"
      3                  = "3 Per year"
      7                  = "7 Refused"
      8                  = "8 Not ascertained"
      9                  = "9 Don't know"
   ;
   VALUE SAP453X
      96                 = "96 Not available"
      97                 = "97 Refused"
      98                 = "98 Not ascertained"
      99                 = "99 Don't know"
   ;
   VALUE SAP454X
      996                = "996 Not available"
      997                = "997 Refused"
      998                = "998 Not ascertained"
      999                = "999 Don't know"
   ;
   VALUE SAP455X
      99.95              = "99.95 99.95+"
      99.99              = "99.99 Unknown"
   ;
   VALUE SAP457X
      1                  = "1 Yes"
      2                  = "2 There is NO place"
      3                  = "3 There is MORE THAN ONE place"
      7                  = "7 Refused"
      8                  = "8 Not ascertained"
      9                  = "9 Don't know"
   ;
   VALUE SAP458X
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
   VALUE SAP460X
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
   VALUE SAP472X
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
   VALUE SAP483X
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
   VALUE SAP486X
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
   VALUE SAP489X
      95                 = "95 95+ times"
      97                 = "97 Refused"
      98                 = "98 Not ascertained"
      99                 = "99 Don't know"
   ;
   VALUE SAP502X
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
   VALUE SAP503X
      .                   = '.'
      OTHER              = "Year"
      9997               = "9997 Refused"
      9998               = "9998 Not ascertained"
      9999               = "9999 Don't know"
   ;
   VALUE SAP513X
      1                  = "1 Received at least 3 doses"
      2                  = "2 Received less than 3 doses"
      7                  = "7 Refused"
      8                  = "8 Not ascertained"
      9                  = "9 Don't know"
   ;
   VALUE SAP515X
      96                 = "96 Received all shots"
      97                 = "97 Refused"
      98                 = "98 Not ascertained"
      99                 = "99 Don't know"
   ;
   VALUE SAP519X
      1                  = "1 Yes-included pertussis"
      2                  = "2 No-did not include pertussis"
      3                  = "3 Doctor did not say"
      7                  = "7 Refused"
      8                  = "8 Not ascertained"
      9                  = "9 Don't know"
   ;
   VALUE SAP522X
      1                  = "1 Yes"
      2                  = "2 No"
      3                  = "3 Doctor refused when asked"
      7                  = "7 Refused"
      8                  = "8 Not ascertained"
      9                  = "9 Don't know"
   ;
   VALUE SAP523X
      96                 = "96 All shots"
      97                 = "97 Refused"
      98                 = "98 Not ascertained"
      99                 = "99 Don't know"
   ;
   VALUE SAP531X
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
   VALUE SAP532X
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
   VALUE SAP533X
      9996               = "9996 Time period format"
      9997               = "9997 Refused"
      9998               = "9998 Not ascertained"
      9999               = "9999 Don't know"
   ;
   VALUE SAP534X
      1                  = "1 6 months or less"
      2                  = "2 More than 6 months but not more than 1 year ago"
      3                  = "3 More than 1 year, but not more than 2 years ago"
      4                  = "4 More than 2 years, but not more than 5 years ago"
      5                  = "5 More than 5 years ago"
      7                  = "7 Refused"
      8                  = "8 Not ascertained"
      9                  = "9 Don't know"
   ;
   VALUE SAP535X
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
   VALUE SAP536X
      1                  = "1 Doctor, nurse or other health care professional"
      2                  = "2 Sex partner"
      3                  = "3 Someone at health department"
      4                  = "4 Family member or friend"
      5                  = "5 Other"
      7                  = "7 Refused"
      8                  = "8 Not ascertained"
      9                  = "9 Don't know"
   ;
   VALUE SAP537X
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
   VALUE SAP538X
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
   VALUE SAP539X
      1                  = "1 Nurse or health worker"
      2                  = "2 Self-sampling kit"
      7                  = "7 Refused"
      8                  = "8 Not ascertained"
      9                  = "9 Don't know"
   ;
   VALUE SAP542X
      1                  = "1 High/Already have HIV/AIDS"
      2                  = "2 Medium"
      3                  = "3 Low"
      4                  = "4 None"
      7                  = "7 Refused"
      8                  = "8 Not ascertained"
      9                  = "9 Don't know"
   ;
   VALUE SAP543X
      1                  = "1 Yes, at least one statement is true"
      2                  = "2 No, none of these statements are true"
      7                  = "7 Refused"
      8                  = "8 Not ascertained"
      9                  = "9 Don't know"
   ;
   VALUE SAP546X
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
   VALUE SAP549X
      1                  = "1 A lot"
      2                  = "2 Some"
      3                  = "3 A little"
      4                  = "4 Nothing"
      7                  = "7 Refused"
      8                  = "8 Not ascertained"
      9                  = "9 Don't know"
   ;
   VALUE SAP557X
      1                  = "1 High"
      2                  = "2 Medium"
      3                  = "3 Low"
      4                  = "4 None"
      5                  = "5 Already have TB"
      7                  = "7 Refused"
      8                  = "8 Not ascertained"
      9                  = "9 Don't know"
   ;

DATA NHIS.SAMADULT;
   * CREATE A SAS DATA SET;
   INFILE ASCIIDAT PAD LRECL=801;

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

      HYPEV      3   HYPDIFV    3   CHDEV      3   ANGEV      3
      MIEV       3   HRTEV      3   STREV      3   EPHEV      3
      FACE       3   SPEAKING   3   EYE        3   WALKING    3
      HEADACHE   3   ASTDO      3   AASMEV     3   AASSTILL   3
      AASMYR     3   AASMERYR   3   ULCEV      3   ULCYR      3
      CANEV      3   CNKIND1    3   CNKIND2    3   CNKIND3    3
      CNKIND4    3   CNKIND5    3   CNKIND6    3   CNKIND7    3
      CNKIND8    3   CNKIND9    3   CNKIND10   3   CNKIND11   3
      CNKIND12   3   CNKIND13   3   CNKIND14   3   CNKIND15   3
      CNKIND16   3   CNKIND17   3   CNKIND18   3   CNKIND19   3
      CNKIND20   3   CNKIND21   3   CNKIND22   3   CNKIND23   3
      CNKIND24   3   CNKIND25   3   CNKIND26   3   CNKIND27   3
      CNKIND28   3   CNKIND29   3   CNKIND30   3   CNKIND31   3
      CANAGE1    4   CANAGE2    4   CANAGE3    4   CANAGE4    4
      CANAGE5    4   CANAGE6    4   CANAGE7    4   CANAGE8    4
      CANAGE9    4   CANAGE10   4   CANAGE11   4   CANAGE12   4
      CANAGE13   4   CANAGE14   4   CANAGE15   4   CANAGE16   4
      CANAGE17   4   CANAGE18   4   CANAGE19   4   CANAGE20   4
      CANAGE21   4   CANAGE22   4   CANAGE23   4   CANAGE24   4
      CANAGE25   4   CANAGE26   4   CANAGE27   4   CANAGE28   4
      CANAGE29   4   CANAGE30   4   DIBEV      3   DIBPRE1    3
      DIBAGE     3   DIFAGE2    3   INSLN      3   DIBPILL    3
      AHAYFYR    3   SINYR      3   CBRCHYR    3   KIDWKYR    3
      LIVYR      3   JNTSYMP    3   JMTHP1     3   JMTHP2     3
      JMTHP3     3   JMTHP4     3   JMTHP5     3   JMTHP6     3
      JMTHP7     3   JMTHP8     3   JMTHP9     3   JMTHP10    3
      JMTHP11    3   JMTHP12    3   JMTHP13    3   JMTHP14    3
      JMTHP15    3   JMTHP16    3   JMTHP17    3   JNTPN      3
      JNTCHR     3   JNTHP      3   ARTH1      3   ARTHWT     3
      ARTHPH     3   ARTHCLS    3   ARTHLMT    3   ARTHWRK    3
      PAINECK    3   PAINLB     3   PAINLEG    3   PAINFACE   3
      AMIGR      3   ACOLD2W    3   AINTIL2W   3   PREGNOW    3
      HRAIDNOW   3   HRAIDEV    3   AHEARST1   3   AVISION    3
      ABLIND     3   LUPPRT     3   SAD        3   NERVOUS    3
      RESTLESS   3   HOPELESS   3   EFFORT     3   WORTHLS    3
      MHAMTMO    3

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
      ASRGNOYR   3   AMDLONGR   3   HIT1       3   HIT2       3
      HIT3       3   HIT4       3   HIT5       3   HIT6       3
      HIT7       3   HIT8       3   HIT9       3   HIT10      3
      SHTFLUYR   3   ASHFLU_M   3   ASHFLU_Y   4   SPRFLUYR   3
      ASPFLU_M   3   ASPFLU_Y   4   SHTPNUYR   3   APOX       3
      APOX12MO   3   AHEP       3   AHEPLIV    3   SHTHEPB    3
      SHEPDOS    3   SHTHEPA    3   SHEPANUM   3   SHINGLES   3
      SHTTD      3   SHTTD05    3   SHTTDAP    3   HPVHRD     3
      SHHPVHRD   3   SHTHPV     3   SHHPVDOS   3   LIVEV      3
      TRAVEL     3   WRKHLTH    3   WRKDIR     3

      /* ADS LENGTHS */

      BLDGV      3   BLDG12M    3   HIVTST     3   WHYTST_R   3
      TST12M_M   3   TST12M_Y   4   TIMETST    3   REATST_C   3
      REASWHOR   3   LASTST_C   3   CLNTYP_C   3   WHOADM     3
      GIVNAM     3   EXTST12M   3   CHNSADSP   3   STMTRU     3
      STD        3   STDDOC     3   STDWHER    3   TBHRD      3
      TBKNOW     3   TB         3   TBSPRD1    3   TBSPRD2    3
      TBSPRD3    3   TBSPRD4    3   TBSPRD5    3   TBSPRD6    3
      TBCURED    3   TBCHANC    3   TBSHAME    3   HOMELESS   3 ;

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
      CHDEV        78 -  78    ANGEV        79 -  79
      MIEV         80 -  80    HRTEV        81 -  81
      STREV        82 -  82    EPHEV        83 -  83
      FACE         84 -  84    SPEAKING     85 -  85
      EYE          86 -  86    WALKING      87 -  87
      HEADACHE     88 -  88    ASTDO        89 -  89
      AASMEV       90 -  90    AASSTILL     91 -  91
      AASMYR       92 -  92    AASMERYR     93 -  93
      ULCEV        94 -  94    ULCYR        95 -  95
      CANEV        96 -  96    CNKIND1      97 -  97
      CNKIND2      98 -  98    CNKIND3      99 -  99
      CNKIND4     100 - 100    CNKIND5     101 - 101
      CNKIND6     102 - 102    CNKIND7     103 - 103
      CNKIND8     104 - 104    CNKIND9     105 - 105
      CNKIND10    106 - 106    CNKIND11    107 - 107
      CNKIND12    108 - 108    CNKIND13    109 - 109
      CNKIND14    110 - 110    CNKIND15    111 - 111
      CNKIND16    112 - 112    CNKIND17    113 - 113
      CNKIND18    114 - 114    CNKIND19    115 - 115
      CNKIND20    116 - 116    CNKIND21    117 - 117
      CNKIND22    118 - 118    CNKIND23    119 - 119
      CNKIND24    120 - 120    CNKIND25    121 - 121
      CNKIND26    122 - 122    CNKIND27    123 - 123
      CNKIND28    124 - 124    CNKIND29    125 - 125
      CNKIND30    126 - 126    CNKIND31    127 - 127
      CANAGE1     128 - 130    CANAGE2     131 - 133
      CANAGE3     134 - 136    CANAGE4     137 - 139
      CANAGE5     140 - 142    CANAGE6     143 - 145
      CANAGE7     146 - 148    CANAGE8     149 - 151
      CANAGE9     152 - 154    CANAGE10    155 - 157
      CANAGE11    158 - 160    CANAGE12    161 - 163
      CANAGE13    164 - 166    CANAGE14    167 - 169
      CANAGE15    170 - 172    CANAGE16    173 - 175
      CANAGE17    176 - 178    CANAGE18    179 - 181
      CANAGE19    182 - 184    CANAGE20    185 - 187
      CANAGE21    188 - 190    CANAGE22    191 - 193
      CANAGE23    194 - 196    CANAGE24    197 - 199
      CANAGE25    200 - 202    CANAGE26    203 - 205
      CANAGE27    206 - 208    CANAGE28    209 - 211
      CANAGE29    212 - 214    CANAGE30    215 - 217
      DIBEV       218 - 218    DIBPRE1     219 - 219
      DIBAGE      220 - 221    DIFAGE2     222 - 223
      INSLN       224 - 224    DIBPILL     225 - 225
      AHAYFYR     226 - 226    SINYR       227 - 227
      CBRCHYR     228 - 228    KIDWKYR     229 - 229
      LIVYR       230 - 230    JNTSYMP     231 - 231
      JMTHP1      232 - 232    JMTHP2      233 - 233
      JMTHP3      234 - 234    JMTHP4      235 - 235
      JMTHP5      236 - 236    JMTHP6      237 - 237
      JMTHP7      238 - 238    JMTHP8      239 - 239
      JMTHP9      240 - 240    JMTHP10     241 - 241
      JMTHP11     242 - 242    JMTHP12     243 - 243
      JMTHP13     244 - 244    JMTHP14     245 - 245
      JMTHP15     246 - 246    JMTHP16     247 - 247
      JMTHP17     248 - 248    JNTPN       249 - 250
      JNTCHR      251 - 251    JNTHP       252 - 252
      ARTH1       253 - 253    ARTHWT      254 - 254
      ARTHPH      255 - 255    ARTHCLS     256 - 256
      ARTHLMT     257 - 257    ARTHWRK     258 - 258
      PAINECK     259 - 259    PAINLB      260 - 260
      PAINLEG     261 - 261    PAINFACE    262 - 262
      AMIGR       263 - 263    ACOLD2W     264 - 264
      AINTIL2W    265 - 265    PREGNOW     266 - 266
      HRAIDNOW    267 - 267    HRAIDEV     268 - 268
      AHEARST1    269 - 269    AVISION     270 - 270
      ABLIND      271 - 271    LUPPRT      272 - 272
      SAD         273 - 273    NERVOUS     274 - 274
      RESTLESS    275 - 275    HOPELESS    276 - 276
      EFFORT      277 - 277    WORTHLS     278 - 278
      MHAMTMO     279 - 279

      /* AHS LOCATIONS */

      WRKLYR3     280 - 280    WKDAYR      281 - 283
      BEDDAYR     284 - 286    AHSTATYR    287 - 287
      SPECEQ      288 - 288    FLWALK      289 - 289
      FLCLIMB     290 - 290    FLSTAND     291 - 291
      FLSIT       292 - 292    FLSTOOP     293 - 293
      FLREACH     294 - 294    FLGRASP     295 - 295
      FLCARRY     296 - 296    FLPUSH      297 - 297
      FLSHOP      298 - 298    FLSOCL      299 - 299
      FLRELAX     300 - 300    FLA1AR      301 - 301
      AFLHCA1     302 - 302    AFLHCA2     303 - 303
      AFLHCA3     304 - 304    AFLHCA4     305 - 305
      AFLHCA5     306 - 306    AFLHCA6     307 - 307
      AFLHCA7     308 - 308    AFLHCA8     309 - 309
      AFLHCA9     310 - 310    AFLHCA10    311 - 311
      AFLHCA11    312 - 312    AFLHCA12    313 - 313
      AFLHCA13    314 - 314    AFLHCA14    315 - 315
      AFLHCA15    316 - 316    AFLHCA16    317 - 317
      AFLHCA17    318 - 318    AFLHCA18    319 - 319
      AFLHC19_    320 - 320    AFLHC20_    321 - 321
      AFLHC21_    322 - 322    AFLHC22_    323 - 323
      AFLHC23_    324 - 324    AFLHC24_    325 - 325
      AFLHC25_    326 - 326    AFLHC26_    327 - 327
      AFLHC27_    328 - 328    AFLHC28_    329 - 329
      AFLHC29_    330 - 330    AFLHC30_    331 - 331
      AFLHC31_    332 - 332    AFLHC32_    333 - 333
      AFLHC33_    334 - 334    AFLHC34_    335 - 335
      AFLHCA90    336 - 336    AFLHCA91    337 - 337
      ALTIME1     338 - 339    ALUNIT1     340 - 340
      ALDURA1     341 - 342    ALDURB1     343 - 343
      ALCHRC1     344 - 344    ALTIME2     345 - 346
      ALUNIT2     347 - 347    ALDURA2     348 - 349
      ALDURB2     350 - 350    ALCHRC2     351 - 351
      ALTIME3     352 - 353    ALUNIT3     354 - 354
      ALDURA3     355 - 356    ALDURB3     357 - 357
      ALCHRC3     358 - 358    ALTIME4     359 - 360
      ALUNIT4     361 - 361    ALDURA4     362 - 363
      ALDURB4     364 - 364    ALCHRC4     365 - 365
      ALTIME5     366 - 367    ALUNIT5     368 - 368
      ALDURA5     369 - 370    ALDURB5     371 - 371
      ALCHRC5     372 - 372    ALTIME6     373 - 374
      ALUNIT6     375 - 375    ALDURA6     376 - 377
      ALDURB6     378 - 378    ALCHRC6     379 - 379
      ALTIME7     380 - 381    ALUNIT7     382 - 382
      ALDURA7     383 - 384    ALDURB7     385 - 385
      ALCHRC7     386 - 386    ALTIME8     387 - 388
      ALUNIT8     389 - 389    ALDURA8     390 - 391
      ALDURB8     392 - 392    ALCHRC8     393 - 393
      ALTIME9     394 - 395    ALUNIT9     396 - 396
      ALDURA9     397 - 398    ALDURB9     399 - 399
      ALCHRC9     400 - 400    ALTIME10    401 - 402
      ALUNIT10    403 - 403    ALDURA10    404 - 405
      ALDURB10    406 - 406    ALCHRC10    407 - 407
      ALTIME11    408 - 409    ALUNIT11    410 - 410
      ALDURA11    411 - 412    ALDURB11    413 - 413
      ALCHRC11    414 - 414    ALTIME12    415 - 416
      ALUNIT12    417 - 417    ALDURA12    418 - 419
      ALDURB12    420 - 420    ALCHRC12    421 - 421
      ALTIME13    422 - 423    ALUNIT13    424 - 424
      ALDURA13    425 - 426    ALDURB13    427 - 427
      ALCHRC13    428 - 428    ALTIME14    429 - 430
      ALUNIT14    431 - 431    ALDURA14    432 - 433
      ALDURB14    434 - 434    ALCHRC14    435 - 435
      ALTIME15    436 - 437    ALUNIT15    438 - 438
      ALDURA15    439 - 440    ALDURB15    441 - 441
      ALCHRC15    442 - 442    ALTIME16    443 - 444
      ALUNIT16    445 - 445    ALDURA16    446 - 447
      ALDURB16    448 - 448    ALCHRC16    449 - 449
      ALTIME17    450 - 451    ALUNIT17    452 - 452
      ALDURA17    453 - 454    ALDURB17    455 - 455
      ALCHRC17    456 - 456    ALTIME18    457 - 458
      ALUNIT18    459 - 459    ALDURA18    460 - 461
      ALDURB18    462 - 462    ALCHRC18    463 - 463
      ALTIME19    464 - 465    ALUNIT19    466 - 466
      ALDURA19    467 - 468    ALDURB19    469 - 469
      ALCHRC19    470 - 470    ALTIME20    471 - 472
      ALUNIT20    473 - 473    ALDURA20    474 - 475
      ALDURB20    476 - 476    ALCHRC20    477 - 477
      ALTIME21    478 - 479    ALUNIT21    480 - 480
      ALDURA21    481 - 482    ALDURB21    483 - 483
      ALCHRC21    484 - 484    ALTIME22    485 - 486
      ALUNIT22    487 - 487    ALDURA22    488 - 489
      ALDURB22    490 - 490    ALCHRC22    491 - 491
      ALTIME23    492 - 493    ALUNIT23    494 - 494
      ALDURA23    495 - 496    ALDURB23    497 - 497
      ALCHRC23    498 - 498    ALTIME24    499 - 500
      ALUNIT24    501 - 501    ALDURA24    502 - 503
      ALDURB24    504 - 504    ALCHRC24    505 - 505
      ALTIME25    506 - 507    ALUNIT25    508 - 508
      ALDURA25    509 - 510    ALDURB25    511 - 511
      ALCHRC25    512 - 512    ALTIME26    513 - 514
      ALUNIT26    515 - 515    ALDURA26    516 - 517
      ALDURB26    518 - 518    ALCHRC26    519 - 519
      ALTIME27    520 - 521    ALUNIT27    522 - 522
      ALDURA27    523 - 524    ALDURB27    525 - 525
      ALCHRC27    526 - 526    ALTIME28    527 - 528
      ALUNIT28    529 - 529    ALDURA28    530 - 531
      ALDURB28    532 - 532    ALCHRC28    533 - 533
      ALTIME29    534 - 535    ALUNIT29    536 - 536
      ALDURA29    537 - 538    ALDURB29    539 - 539
      ALCHRC29    540 - 540    ALTIME30    541 - 542
      ALUNIT30    543 - 543    ALDURA30    544 - 545
      ALDURB30    546 - 546    ALCHRC30    547 - 547
      ALTIME31    548 - 549    ALUNIT31    550 - 550
      ALDURA31    551 - 552    ALDURB31    553 - 553
      ALCHRC31    554 - 554    ALTIME32    555 - 556
      ALUNIT32    557 - 557    ALDURA32    558 - 559
      ALDURB32    560 - 560    ALCHRC32    561 - 561
      ALTIME33    562 - 563    ALUNIT33    564 - 564
      ALDURA33    565 - 566    ALDURB33    567 - 567
      ALCHRC33    568 - 568    ALTIME34    569 - 570
      ALUNIT34    571 - 571    ALDURA34    572 - 573
      ALDURB34    574 - 574    ALCHRC34    575 - 575
      ALTIME90    576 - 577    ALUNIT90    578 - 578
      ALDURA90    579 - 580    ALDURB90    581 - 581
      ALCHRC90    582 - 582    ALTIME91    583 - 584
      ALUNIT91    585 - 585    ALDURA91    586 - 587
      ALDURB91    588 - 588    ALCHRC91    589 - 589
      ALCNDRT     590 - 590    ALCHRONR    591 - 591


      /* AHB LOCATIONS */

      SMKEV       592 - 592    SMKREG      593 - 594
      SMKNOW      595 - 595    SMKSTAT2    596 - 596
      SMKQTNO     597 - 598    SMKQTTP     599 - 599
      SMKQTY      600 - 601    CIGSDA1     602 - 603
      CIGDAMO     604 - 605    CIGSDA2     606 - 607
      CIGSDAY     608 - 609    CIGQTYR     610 - 610
      VIGNO       611 - 613    VIGTP       614 - 614
      VIGFREQW    615 - 616    VIGLNGNO    617 - 619
      VIGLNGTP    620 - 620    VIGMIN      621 - 623
      MODNO       624 - 626    MODTP       627 - 627
      MODFREQW    628 - 629    MODLNGNO    630 - 632
      MODLNGTP    633 - 633    MODMIN      634 - 636
      STRNGNO     637 - 639    STRNGTP     640 - 640
      STRFREQW    641 - 642    ALC1YR      643 - 643
      ALCLIFE     644 - 644    ALC12MNO    645 - 647
      ALC12MTP    648 - 648    ALC12MWK    649 - 650
      ALC12MYR    651 - 653    ALCAMT      654 - 655
      ALCSTAT     656 - 657    ALC5UPNO    658 - 660
      ALC5UPTP    661 - 661    ALC5UPYR    662 - 664
      AHEIGHT     665 - 666    AWEIGHTP    667 - 669
      BMI         670 - 673 .2 SLEEP       674 - 675


      /* AAU LOCATIONS */

      AUSUALPL    676 - 676    APLKIND     677 - 677
      AHCPLROU    678 - 678    AHCPLKND    679 - 679
      AHCCHGYR    680 - 680    AHCCHGHI    681 - 681
      AHCDLYR1    682 - 682    AHCDLYR2    683 - 683
      AHCDLYR3    684 - 684    AHCDLYR4    685 - 685
      AHCDLYR5    686 - 686    AHCAFYR1    687 - 687
      AHCAFYR2    688 - 688    AHCAFYR3    689 - 689
      AHCAFYR4    690 - 690    ADNLONG2    691 - 691
      AHCSYR1     692 - 692    AHCSYR2     693 - 693
      AHCSYR3     694 - 694    AHCSYR4     695 - 695
      AHCSYR5     696 - 696    AHCSYR6     697 - 697
      AHCSYR7     698 - 698    AHCSYR8     699 - 699
      AHCSYR9     700 - 700    AHCSYR10    701 - 701
      AHERNOY2    702 - 703    AHCHYR      704 - 704
      AHCHMOYR    705 - 706    AHCHNOY2    707 - 708
      AHCNOYR2    709 - 710    ASRGYR      711 - 711
      ASRGNOYR    712 - 713    AMDLONGR    714 - 714
      HIT1        715 - 715    HIT2        716 - 716
      HIT3        717 - 717    HIT4        718 - 718
      HIT5        719 - 719    HIT6        720 - 720
      HIT7        721 - 721    HIT8        722 - 722
      HIT9        723 - 723    HIT10       724 - 724
      SHTFLUYR    725 - 725    ASHFLU_M    726 - 727
      ASHFLU_Y    728 - 731    SPRFLUYR    732 - 732
      ASPFLU_M    733 - 734    ASPFLU_Y    735 - 738
      SHTPNUYR    739 - 739    APOX        740 - 740
      APOX12MO    741 - 741    AHEP        742 - 742
      AHEPLIV     743 - 743    SHTHEPB     744 - 744
      SHEPDOS     745 - 745    SHTHEPA     746 - 746
      SHEPANUM    747 - 748    SHINGLES    749 - 749
      SHTTD       750 - 750    SHTTD05     751 - 751
      SHTTDAP     752 - 752    HPVHRD      753 - 753
      SHHPVHRD    754 - 754    SHTHPV      755 - 755
      SHHPVDOS    756 - 757    LIVEV       758 - 758
      TRAVEL      759 - 759    WRKHLTH     760 - 760
      WRKDIR      761 - 761

      /* ADS LOCATIONS */

      BLDGV       762 - 762    BLDG12M     763 - 763
      HIVTST      764 - 764    WHYTST_R    765 - 766
      TST12M_M    767 - 768    TST12M_Y    769 - 772
      TIMETST     773 - 773    REATST_C    774 - 775
      REASWHOR    776 - 776    LASTST_C    777 - 778
      CLNTYP_C    779 - 780    WHOADM      781 - 781
      GIVNAM      782 - 782    EXTST12M    783 - 783
      CHNSADSP    784 - 784    STMTRU      785 - 785
      STD         786 - 786    STDDOC      787 - 787
      STDWHER     788 - 788    TBHRD       789 - 789
      TBKNOW      790 - 790    TB          791 - 791
      TBSPRD1     792 - 792    TBSPRD2     793 - 793
      TBSPRD3     794 - 794    TBSPRD4     795 - 795
      TBSPRD5     796 - 796    TBSPRD6     797 - 797
      TBCURED     798 - 798    TBCHANC     799 - 799
      TBSHAME     800 - 800    HOMELESS    801 - 801
;

   * DEFINE VARIABLE LABELS;

   LABEL

      /* IDN LABELS */

      RECTYPE    ="File type identifier"
      SRVY_YR    ="Year of National Health Interview Survey"
      HHX        ="HH identifier"
      INTV_QRT   ="Interview Quarter"
      ASSIGNWK   ="Assignment Week"
      FMX        ="Family Serial Number"
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
      CHDEV      ="Ever been told you had coronary heart disease"
      ANGEV      ="Ever been told you had angina pectoris"
      MIEV       ="Ever been told you had a heart attack"
      HRTEV      ="Ever been told you had a heart condition/disease"
      STREV      ="Ever been told you had a stroke"
      EPHEV      ="Ever been told you had emphysema"
      FACE       ="Stroke symptom knowledge: numbness of face, arm, leg, side?"
      SPEAKING   ="Stroke symptom knowledge: confusion, trouble speaking?"
      EYE        ="Stroke symptom knowledge: sudden trouble seeing?"
      WALKING    ="Stroke symptom knowledge: trouble walking, dizziness?"
      HEADACHE   ="Stroke Symptom knowledge: sudden severe headache?"
      ASTDO      ="Stroke Symptom knowledge: best thing to do for victim?"
      AASMEV     ="Ever been told you had asthma"
      AASSTILL   ="Still have asthma"
      AASMYR     ="Had an asthma episode/attack past 12 m"
      AASMERYR   ="Had visit to ER due to asthma past 12 m"
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
      JNTPN      ="Rate your joint pain, past 30 days"
      JNTCHR     ="Joint symptoms begin more than 3 months ago"
      JNTHP      ="Ever seen doctor or health professional for joint symptoms"
      ARTH1      ="Ever been told you had arthritis"
      ARTHWT     ="Ever been told to lose weight to help your arthritis?"
      ARTHPH     ="Ever been told to exercise to help your arthritis?"
      ARTHCLS    ="Ever taken a class to help your arthritis?"
      ARTHLMT    ="Limited due to arthritis or joint symptoms"
      ARTHWRK    ="Limited in work due to arthritis?"
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
      FLSOCL     =
"How difficult to participate in social activities w/o special equipment"
      FLRELAX    ="How difficult to relax at home w/o special equipment"
      FLA1AR     ="Any functional limitation, all conditions"
      AFLHCA1    ="Vision problem causes difficulty with activity"
      AFLHCA2    ="Hearing problem causes difficulty with activity"
      AFLHCA3    ="Arthritis/rheumatism causes difficulty with activity"
      AFLHCA4    ="Back/neck problem causes difficulty with activity"
      AFLHCA5    ="Fracture/bone/joint injury causes difficulty with activity"
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
      ALDURB32   ='Duration of "old age"- related problems recode 2'
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
      AHCAFYR1   ="Couldn't afford prescription medicine, past 12 m"
      AHCAFYR2   ="Couldn't afford mental health care/counseling, 12 m"
      AHCAFYR3   ="Couldn't afford dental care, past 12 m"
      AHCAFYR4   ="Couldn't afford eyeglasses, past 12 m"
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
      HIT1       ="Looked up health information on internet"
      HIT2       ="Looked up health information on internet, past 12 m"
      HIT3       ="Used chat groups to learn about healthy topics"
      HIT4       ="Used chat groups to learn about health topics, past 12 m"
      HIT5       ="Refilled prescription on internet"
      HIT6       ="Refilled prescription on internet, past 12 m"
      HIT7       ="Scheduled medical appointment on internet"
      HIT8       ="Scheduled medical appointment on internet, past 12 m"
      HIT9       ="Communicated with health care provider by e_mail"
      HIT10      ="Communicated with health care provider by e_mail, past 12 m"
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
      HPVHRD     ="Ever heard of HPV"
      SHHPVHRD   ="Ever heard about HPV vaccine or shot"
      SHTHPV     ="Ever received the HPV vaccine or shot"
      SHHPVDOS   ="Number of HPV shots received"
      LIVEV      =
"Ever told you had any kind of chronic/long-term liver condition"
      TRAVEL     =
"Ever traveled outside USA since 1995 (Excluding Europe, Japan, Australia, New Z
ealand, and Canada)"
      WRKHLTH    ="Work or volunteer in a health care setting"
      WRKDIR     ="Direct contact with patients"

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
      INDSTRN1  SAP026X.   INDSTRN2  SAP027X.   OCCUPN1   SAP028X.
      OCCUPN2   SAP028X.   WRKCATA   SAP030X.   BUSINC1A  SAP025X.
      LOCALL1A  SAP032X.   YRSWRKPA  SAP033X.   WRKLONGH  SAP025X.
      HOURPDA   SAP025X.   PDSICKA   SAP025X.   ONEJOB    SAP025X.

      /* ACN FORMAT ASSOCIATIONS */

      HYPEV     SAP025X.   HYPDIFV   SAP025X.   CHDEV     SAP025X.
      ANGEV     SAP025X.   MIEV      SAP025X.   HRTEV     SAP025X.
      STREV     SAP025X.   EPHEV     SAP025X.   FACE      SAP025X.
      SPEAKING  SAP025X.   EYE       SAP025X.   WALKING   SAP025X.
      HEADACHE  SAP025X.   ASTDO     SAP051X.   AASMEV    SAP025X.
      AASSTILL  SAP025X.   AASMYR    SAP025X.   AASMERYR  SAP025X.
      ULCEV     SAP025X.   ULCYR     SAP025X.   CANEV     SAP025X.
      CNKIND1   SAP059X.   CNKIND2   SAP059X.   CNKIND3   SAP059X.
      CNKIND4   SAP059X.   CNKIND5   SAP059X.   CNKIND6   SAP059X.
      CNKIND7   SAP059X.   CNKIND8   SAP059X.   CNKIND9   SAP059X.
      CNKIND10  SAP059X.   CNKIND11  SAP059X.   CNKIND12  SAP059X.
      CNKIND13  SAP059X.   CNKIND14  SAP059X.   CNKIND15  SAP059X.
      CNKIND16  SAP059X.   CNKIND17  SAP059X.   CNKIND18  SAP059X.
      CNKIND19  SAP059X.   CNKIND20  SAP059X.   CNKIND21  SAP059X.
      CNKIND22  SAP059X.   CNKIND23  SAP059X.   CNKIND24  SAP059X.
      CNKIND25  SAP059X.   CNKIND26  SAP059X.   CNKIND27  SAP059X.
      CNKIND28  SAP059X.   CNKIND29  SAP059X.   CNKIND30  SAP059X.
      CNKIND31  SAP059X.   CANAGE1   SAP090X.   CANAGE2   SAP090X.
      CANAGE3   SAP090X.   CANAGE4   SAP090X.   CANAGE5   SAP090X.
      CANAGE6   SAP090X.   CANAGE7   SAP090X.   CANAGE8   SAP090X.
      CANAGE9   SAP090X.   CANAGE10  SAP090X.   CANAGE11  SAP090X.
      CANAGE12  SAP090X.   CANAGE13  SAP090X.   CANAGE14  SAP090X.
      CANAGE15  SAP090X.   CANAGE16  SAP090X.   CANAGE17  SAP090X.
      CANAGE18  SAP090X.   CANAGE19  SAP090X.   CANAGE20  SAP090X.
      CANAGE21  SAP090X.   CANAGE22  SAP090X.   CANAGE23  SAP090X.
      CANAGE24  SAP090X.   CANAGE25  SAP090X.   CANAGE26  SAP090X.
      CANAGE27  SAP090X.   CANAGE28  SAP090X.   CANAGE29  SAP090X.
      CANAGE30  SAP090X.   DIBEV     SAP120X.   DIBPRE1   SAP025X.
      DIBAGE    SAP090X.   DIFAGE2   SAP123X.   INSLN     SAP025X.
      DIBPILL   SAP025X.   AHAYFYR   SAP025X.   SINYR     SAP025X.
      CBRCHYR   SAP025X.   KIDWKYR   SAP025X.   LIVYR     SAP025X.
      JNTSYMP   SAP025X.   JMTHP1    SAP059X.   JMTHP2    SAP059X.
      JMTHP3    SAP059X.   JMTHP4    SAP059X.   JMTHP5    SAP059X.
      JMTHP6    SAP059X.   JMTHP7    SAP059X.   JMTHP8    SAP059X.
      JMTHP9    SAP059X.   JMTHP10   SAP059X.   JMTHP11   SAP059X.
      JMTHP12   SAP059X.   JMTHP13   SAP059X.   JMTHP14   SAP059X.
      JMTHP15   SAP059X.   JMTHP16   SAP059X.   JMTHP17   SAP059X.
      JNTPN     SAP149X.   JNTCHR    SAP025X.   JNTHP     SAP025X.
      ARTH1     SAP025X.   ARTHWT    SAP025X.   ARTHPH    SAP025X.
      ARTHCLS   SAP155X.   ARTHLMT   SAP025X.   ARTHWRK   SAP025X.
      PAINECK   SAP025X.   PAINLB    SAP025X.   PAINLEG   SAP025X.
      PAINFACE  SAP025X.   AMIGR     SAP025X.   ACOLD2W   SAP025X.
      AINTIL2W  SAP025X.   PREGNOW   SAP025X.   HRAIDNOW  SAP025X.
      HRAIDEV   SAP025X.   AHEARST1  SAP168X.   AVISION   SAP025X.
      ABLIND    SAP025X.   LUPPRT    SAP025X.   SAD       SAP172X.
      NERVOUS   SAP172X.   RESTLESS  SAP172X.   HOPELESS  SAP172X.
      EFFORT    SAP172X.   WORTHLS   SAP172X.   MHAMTMO   SAP178X.

      /* AHS FORMAT ASSOCIATIONS */

      WRKLYR3   SAP179X.   WKDAYR    SAP180X.   BEDDAYR   SAP180X.
      AHSTATYR  SAP182X.   SPECEQ    SAP025X.   FLWALK    SAP184X.
      FLCLIMB   SAP184X.   FLSTAND   SAP184X.   FLSIT     SAP184X.
      FLSTOOP   SAP184X.   FLREACH   SAP184X.   FLGRASP   SAP184X.
      FLCARRY   SAP184X.   FLPUSH    SAP184X.   FLSHOP    SAP184X.
      FLSOCL    SAP184X.   FLRELAX   SAP184X.   FLA1AR    SAP196X.
      AFLHCA1   SAP059X.   AFLHCA2   SAP059X.   AFLHCA3   SAP059X.
      AFLHCA4   SAP059X.   AFLHCA5   SAP059X.   AFLHCA6   SAP059X.
      AFLHCA7   SAP059X.   AFLHCA8   SAP059X.   AFLHCA9   SAP059X.
      AFLHCA10  SAP059X.   AFLHCA11  SAP059X.   AFLHCA12  SAP059X.
      AFLHCA13  SAP059X.   AFLHCA14  SAP059X.   AFLHCA15  SAP059X.
      AFLHCA16  SAP059X.   AFLHCA17  SAP059X.   AFLHCA18  SAP059X.
      AFLHC19_  SAP059X.   AFLHC20_  SAP059X.   AFLHC21_  SAP059X.
      AFLHC22_  SAP059X.   AFLHC23_  SAP059X.   AFLHC24_  SAP059X.
      AFLHC25_  SAP059X.   AFLHC26_  SAP059X.   AFLHC27_  SAP059X.
      AFLHC28_  SAP059X.   AFLHC29_  SAP059X.   AFLHC30_  SAP059X.
      AFLHC31_  SAP059X.   AFLHC32_  SAP059X.   AFLHC33_  SAP059X.
      AFLHC34_  SAP059X.   AFLHCA90  SAP059X.   AFLHCA91  SAP059X.
      ALTIME1   SAP233X.   ALUNIT1   SAP234X.   ALDURA1   SAP235X.
      ALDURB1   SAP236X.   ALCHRC1   SAP237X.   ALTIME2   SAP233X.
      ALUNIT2   SAP234X.   ALDURA2   SAP235X.   ALDURB2   SAP236X.
      ALCHRC2   SAP237X.   ALTIME3   SAP233X.   ALUNIT3   SAP234X.
      ALDURA3   SAP235X.   ALDURB3   SAP236X.   ALCHRC3   SAP237X.
      ALTIME4   SAP233X.   ALUNIT4   SAP234X.   ALDURA4   SAP235X.
      ALDURB4   SAP236X.   ALCHRC4   SAP237X.   ALTIME5   SAP233X.
      ALUNIT5   SAP234X.   ALDURA5   SAP235X.   ALDURB5   SAP236X.
      ALCHRC5   SAP237X.   ALTIME6   SAP233X.   ALUNIT6   SAP234X.
      ALDURA6   SAP235X.   ALDURB6   SAP236X.   ALCHRC6   SAP237X.
      ALTIME7   SAP233X.   ALUNIT7   SAP234X.   ALDURA7   SAP235X.
      ALDURB7   SAP236X.   ALCHRC7   SAP237X.   ALTIME8   SAP233X.
      ALUNIT8   SAP234X.   ALDURA8   SAP235X.   ALDURB8   SAP236X.
      ALCHRC8   SAP237X.   ALTIME9   SAP233X.   ALUNIT9   SAP234X.
      ALDURA9   SAP235X.   ALDURB9   SAP236X.   ALCHRC9   SAP237X.
      ALTIME10  SAP233X.   ALUNIT10  SAP234X.   ALDURA10  SAP235X.
      ALDURB10  SAP236X.   ALCHRC10  SAP237X.   ALTIME11  SAP233X.
      ALUNIT11  SAP234X.   ALDURA11  SAP235X.   ALDURB11  SAP236X.
      ALCHRC11  SAP237X.   ALTIME12  SAP233X.   ALUNIT12  SAP234X.
      ALDURA12  SAP235X.   ALDURB12  SAP236X.   ALCHRC12  SAP237X.
      ALTIME13  SAP233X.   ALUNIT13  SAP234X.   ALDURA13  SAP235X.
      ALDURB13  SAP236X.   ALCHRC13  SAP237X.   ALTIME14  SAP233X.
      ALUNIT14  SAP234X.   ALDURA14  SAP235X.   ALDURB14  SAP236X.
      ALCHRC14  SAP237X.   ALTIME15  SAP233X.   ALUNIT15  SAP234X.
      ALDURA15  SAP235X.   ALDURB15  SAP236X.   ALCHRC15  SAP237X.
      ALTIME16  SAP233X.   ALUNIT16  SAP234X.   ALDURA16  SAP235X.
      ALDURB16  SAP236X.   ALCHRC16  SAP237X.   ALTIME17  SAP233X.
      ALUNIT17  SAP234X.   ALDURA17  SAP235X.   ALDURB17  SAP236X.
      ALCHRC17  SAP237X.   ALTIME18  SAP233X.   ALUNIT18  SAP234X.
      ALDURA18  SAP235X.   ALDURB18  SAP236X.   ALCHRC18  SAP237X.
      ALTIME19  SAP233X.   ALUNIT19  SAP234X.   ALDURA19  SAP235X.
      ALDURB19  SAP236X.   ALCHRC19  SAP237X.   ALTIME20  SAP233X.
      ALUNIT20  SAP234X.   ALDURA20  SAP235X.   ALDURB20  SAP236X.
      ALCHRC20  SAP237X.   ALTIME21  SAP233X.   ALUNIT21  SAP234X.
      ALDURA21  SAP235X.   ALDURB21  SAP236X.   ALCHRC21  SAP237X.
      ALTIME22  SAP233X.   ALUNIT22  SAP234X.   ALDURA22  SAP235X.
      ALDURB22  SAP236X.   ALCHRC22  SAP237X.   ALTIME23  SAP233X.
      ALUNIT23  SAP234X.   ALDURA23  SAP235X.   ALDURB23  SAP236X.
      ALCHRC23  SAP237X.   ALTIME24  SAP233X.   ALUNIT24  SAP234X.
      ALDURA24  SAP235X.   ALDURB24  SAP236X.   ALCHRC24  SAP237X.
      ALTIME25  SAP233X.   ALUNIT25  SAP234X.   ALDURA25  SAP235X.
      ALDURB25  SAP236X.   ALCHRC25  SAP237X.   ALTIME26  SAP233X.
      ALUNIT26  SAP234X.   ALDURA26  SAP235X.   ALDURB26  SAP236X.
      ALCHRC26  SAP237X.   ALTIME27  SAP233X.   ALUNIT27  SAP234X.
      ALDURA27  SAP235X.   ALDURB27  SAP236X.   ALCHRC27  SAP237X.
      ALTIME28  SAP233X.   ALUNIT28  SAP234X.   ALDURA28  SAP235X.
      ALDURB28  SAP236X.   ALCHRC28  SAP237X.   ALTIME29  SAP233X.
      ALUNIT29  SAP234X.   ALDURA29  SAP235X.   ALDURB29  SAP236X.
      ALCHRC29  SAP237X.   ALTIME30  SAP233X.   ALUNIT30  SAP234X.
      ALDURA30  SAP235X.   ALDURB30  SAP236X.   ALCHRC30  SAP237X.
      ALTIME31  SAP233X.   ALUNIT31  SAP234X.   ALDURA31  SAP235X.
      ALDURB31  SAP236X.   ALCHRC31  SAP237X.   ALTIME32  SAP233X.
      ALUNIT32  SAP234X.   ALDURA32  SAP235X.   ALDURB32  SAP236X.
      ALCHRC32  SAP237X.   ALTIME33  SAP233X.   ALUNIT33  SAP234X.
      ALDURA33  SAP235X.   ALDURB33  SAP236X.   ALCHRC33  SAP237X.
      ALTIME34  SAP233X.   ALUNIT34  SAP234X.   ALDURA34  SAP235X.
      ALDURB34  SAP236X.   ALCHRC34  SAP237X.   ALTIME90  SAP233X.
      ALUNIT90  SAP234X.   ALDURA90  SAP235X.   ALDURB90  SAP236X.
      ALCHRC90  SAP237X.   ALTIME91  SAP233X.   ALUNIT91  SAP234X.
      ALDURA91  SAP235X.   ALDURB91  SAP236X.   ALCHRC91  SAP237X.
      ALCNDRT   SAP413X.   ALCHRONR  SAP414X.

      /* AHB FORMAT ASSOCIATIONS */

      SMKEV     SAP025X.   SMKREG    SAP416X.   SMKNOW    SAP417X.
      SMKSTAT2  SAP418X.   SMKQTNO   SAP419X.   SMKQTTP   SAP420X.
      SMKQTY    SAP421X.   CIGSDA1   SAP422X.   CIGDAMO   SAP423X.
      CIGSDA2   SAP422X.   CIGSDAY   SAP422X.   CIGQTYR   SAP025X.
      VIGNO     SAP427X.   VIGTP     SAP428X.   VIGFREQW  SAP429X.
      VIGLNGNO  SAP430X.   VIGLNGTP  SAP431X.   VIGMIN    SAP430X.
      MODNO     SAP427X.   MODTP     SAP428X.   MODFREQW  SAP435X.
      MODLNGNO  SAP430X.   MODLNGTP  SAP431X.   MODMIN    SAP430X.
      STRNGNO   SAP427X.   STRNGTP   SAP428X.   STRFREQW  SAP441X.
      ALC1YR    SAP025X.   ALCLIFE   SAP025X.   ALC12MNO  SAP444X.
      ALC12MTP  SAP445X.   ALC12MWK  SAP446X.   ALC12MYR  SAP447X.
      ALCAMT    SAP448X.   ALCSTAT   SAP449X.   ALC5UPNO  SAP447X.
      ALC5UPTP  SAP451X.   ALC5UPYR  SAP447X.   AHEIGHT   SAP453X.
      AWEIGHTP  SAP454X.   BMI       SAP455X.   SLEEP     SAP149X.

      /* AAU FORMAT ASSOCIATIONS */

      AUSUALPL  SAP457X.   APLKIND   SAP458X.   AHCPLROU  SAP025X.
      AHCPLKND  SAP460X.   AHCCHGYR  SAP025X.   AHCCHGHI  SAP025X.
      AHCDLYR1  SAP025X.   AHCDLYR2  SAP025X.   AHCDLYR3  SAP025X.
      AHCDLYR4  SAP025X.   AHCDLYR5  SAP025X.   AHCAFYR1  SAP025X.
      AHCAFYR2  SAP025X.   AHCAFYR3  SAP025X.   AHCAFYR4  SAP025X.
      ADNLONG2  SAP472X.   AHCSYR1   SAP025X.   AHCSYR2   SAP025X.
      AHCSYR3   SAP025X.   AHCSYR4   SAP025X.   AHCSYR5   SAP025X.
      AHCSYR6   SAP025X.   AHCSYR7   SAP025X.   AHCSYR8   SAP025X.
      AHCSYR9   SAP025X.   AHCSYR10  SAP025X.   AHERNOY2  SAP483X.
      AHCHYR    SAP025X.   AHCHMOYR  SAP149X.   AHCHNOY2  SAP486X.
      AHCNOYR2  SAP483X.   ASRGYR    SAP025X.   ASRGNOYR  SAP489X.
      AMDLONGR  SAP472X.   HIT1      SAP025X.   HIT2      SAP025X.
      HIT3      SAP025X.   HIT4      SAP025X.   HIT5      SAP025X.
      HIT6      SAP025X.   HIT7      SAP025X.   HIT8      SAP025X.
      HIT9      SAP025X.   HIT10     SAP025X.   SHTFLUYR  SAP025X.
      ASHFLU_M  SAP502X.   ASHFLU_Y  SAP503X.   SPRFLUYR  SAP025X.
      ASPFLU_M  SAP502X.   ASPFLU_Y  SAP503X.   SHTPNUYR  SAP025X.
      APOX      SAP025X.   APOX12MO  SAP025X.   AHEP      SAP025X.
      AHEPLIV   SAP025X.   SHTHEPB   SAP025X.   SHEPDOS   SAP513X.
      SHTHEPA   SAP025X.   SHEPANUM  SAP515X.   SHINGLES  SAP025X.
      SHTTD     SAP025X.   SHTTD05   SAP025X.   SHTTDAP   SAP519X.
      HPVHRD    SAP025X.   SHHPVHRD  SAP025X.   SHTHPV    SAP522X.
      SHHPVDOS  SAP523X.   LIVEV     SAP025X.   TRAVEL    SAP025X.
      WRKHLTH   SAP025X.   WRKDIR    SAP025X.

      /* ADS FORMAT ASSOCIATIONS */

      BLDGV     SAP025X.   BLDG12M   SAP025X.   HIVTST    SAP025X.
      WHYTST_R  SAP531X.   TST12M_M  SAP532X.   TST12M_Y  SAP533X.
      TIMETST   SAP534X.   REATST_C  SAP535X.   REASWHOR  SAP536X.
      LASTST_C  SAP537X.   CLNTYP_C  SAP538X.   WHOADM    SAP539X.
      GIVNAM    SAP025X.   EXTST12M  SAP025X.   CHNSADSP  SAP542X.
      STMTRU    SAP543X.   STD       SAP025X.   STDDOC    SAP025X.
      STDWHER   SAP546X.   TBHRD     SAP025X.   TBKNOW    SAP025X.
      TB        SAP549X.   TBSPRD1   SAP059X.   TBSPRD2   SAP059X.
      TBSPRD3   SAP059X.   TBSPRD4   SAP059X.   TBSPRD5   SAP059X.
      TBSPRD6   SAP059X.   TBCURED   SAP025X.   TBCHANC   SAP557X.
      TBSHAME   SAP025X.   HOMELESS  SAP025X.;
RUN;

PROC CONTENTS DATA=NHIS.SAMADULT;
   TITLE1 'CONTENTS OF THE 2009 NHIS Sample Adult FILE';

PROC FREQ DATA=NHIS.SAMADULT NOTITLE;
   TABLES RECTYPE/LIST MISSING;
   TITLE1 'FREQUENCY REPORT FOR 2009 NHIS Sample Adult FILE';
   TITLE2 '(WEIGHTED)';
   WEIGHT WTFA_SA;

PROC FREQ DATA=NHIS.SAMADULT NOTITLE;
   TABLES RECTYPE/LIST MISSING;
   TITLE1 'FREQUENCY REPORT FOR 2009 NHIS Sample Adult FILE';
   TITLE2 '(UNWEIGHTED)';

* USER NOTE: TO SEE UNFORMATTED VALUES IN PROCEDURES, ADD THE
             STATEMENT: FORMAT _ALL_;
RUN;
