*********************************************************************
 JUNE 14, 2011 11:36 AM
 
 This is an example of a SAS program that creates a SAS
 file from the 2010 NHIS Public Use SAMADULT.DAT ASCII file
 
 This is stored in SAMADULT.SAS
*********************************************************************;

* USER NOTE: PLACE NEXT STATEMENT IN SUBSEQUENT PROGRAMS;
LIBNAME  NHIS     "C:\NHIS2010";

* USER NOTE: PLACE NEXT STATEMENT IN SUBSEQUENT PROGRAMS
             IF YOU ALLOW PROGRAM TO PERMANENTLY STORE FORMATS;
LIBNAME  LIBRARY  "C:\NHIS2010";

FILENAME ASCIIDAT 'C:\NHIS2010\SAMADULT.dat';

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
      38                 = "38 Quality of Life"
      40                 = "40 Sample Child"
      60                 = "60 Family"
      63                 = "63 Disability Questions Tests 2010"
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
      1                  = "1 Selected to receive QOL section"
      2                  = "2 Not selected to receive QOL section"
   ;
   VALUE SAP024X
      1                  = "1 Not selected to receive FDB section"
      2                  = "2 Selected to receive FDB section"
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
   VALUE SAP046X
      1                  = 
"1 An employee of a PRIVATE company, business, or individual for wages, salary, 
or commission"
      2                  = "2 A FEDERAL government employee"
      3                  = "3 A STATE government employee"
      4                  = "4 A LOCAL government employee"
      5                  = 
"5 Self-employed in OWN business, professional practice or farm"
      6                  = 
"6 Working WITHOUT PAY in family-owned business or farm"
      7                  = "7 Refused"
      8                  = "8 Not ascertained"
      9                  = "9 Don't know"
   ;
   VALUE SAP054X
      1                  = 
"1 You [work/worked] as an independent contractor, independent consultant, or fr
eelance worker"
      2                  = 
"2 You [are/were] on-call, and [work/worked] only when called to work"
      3                  = "3 You [are/were] paid by a temporary agency"
      4                  = 
"4 You [work/worked] for a contractor who provides workers and services to other
s under contract"
      5                  = 
"5 You [are/were] a regular, permanent employee (standard work arrangement)"
      6                  = "6 Other"
      7                  = "7 Refused"
      8                  = "8 Not ascertained"
      9                  = "9 Don't know"
   ;
   VALUE SAP055X
      1                  = "1 Yes"
      2                  = "2 No"
      7                  = "7 Refused"
      9                  = "9 Don't know"
   ;
   VALUE SAP056X
      1                  = "1 A regular daytime schedule"
      2                  = "2 A regular evening shift"
      3                  = "3 A regular night shift"
      4                  = "4 A rotating shift"
      5                  = "5 Some other schedule"
      7                  = "7 Refused"
      8                  = "8 Not ascertained"
      9                  = "9 Don't know"
   ;
   VALUE SAP057X
      1                  = "1 Strongly agree"
      2                  = "2 Agree"
      3                  = "3 Disagree"
      4                  = "4 Strongly disagree"
      7                  = "7 Refused"
      8                  = "8 Not ascertained"
      9                  = "9 Don't know"
   ;
   VALUE SAP064X
      1                  = "1 Yes"
   ;
   VALUE SAP065X
      1                  = "1 Yes"
      2                  = "2 No"
      3                  = "3 No injuries/poisonings on the job"
      7                  = "7 Refused"
      8                  = "8 Not ascertained"
      9                  = "9 Don't know"
   ;
   VALUE SAP066X
      1                  = "1 Yes"
      2                  = "2 No"
      3                  = "3 Claim(s) in process"
      7                  = "7 Refused"
      8                  = "8 Not ascertained"
      9                  = "9 Don't know"
   ;
   VALUE SAP079X
      85                 = "85 85+ years"
      97                 = "97 Refused"
      98                 = "98 Not ascertained"
      99                 = "99 Don't know"
   ;
   VALUE SAP080X
      1                  = "1 Less than 16"
      2                  = "2 16 or older"
      7                  = "7 Refused"
      8                  = "8 Not ascertained"
      9                  = "9 Don't know"
   ;
   VALUE SAP081X
      1                  = "1 Better"
      2                  = "2 Worse"
      3                  = "3 About the same"
      7                  = "7 Refused"
      8                  = "8 Not ascertained"
      9                  = "9 Don't know"
   ;
   VALUE SAP085X
      .                   = '.'
      OTHER              = 
"See Industry Appendix in file layout at the end of the Sample Adult Documentati
on.  ."
   ;
   VALUE SAP093X
      000                = "000 None"
      997                = "997 Refused"
      998                = "998 Not ascertained"
      999                = "999 Don't know"
   ;
   VALUE SAP098X
      1                  = "1 Mentioned"
      2                  = "2 Not mentioned"
      7                  = "7 Refused"
      8                  = "8 Not ascertained"
      9                  = "9 Don't know"
   ;
   VALUE SAP159X
      1                  = "1 Yes"
      2                  = "2 No"
      3                  = "3 Borderline"
      7                  = "7 Refused"
      8                  = "8 Not ascertained"
      9                  = "9 Don't know"
   ;
   VALUE SAP162X
      00                 = "00 Within past year"
      85                 = "85 85+ years"
      96                 = "96 1+ year(s) with diabetes and age is 85+"
      97                 = "97 Refused"
      98                 = "98 Not ascertained"
      99                 = "99 Don't know"
   ;
   VALUE SAP167X
      0                  = "0 None"
      1                  = "1 One"
      2                  = "2 Two or three"
      3                  = "3 Between four and ten"
      4                  = "4 More than 10"
      7                  = "7 Refused"
      8                  = "8 Not ascertained"
      9                  = "9 Don't know"
   ;
   VALUE SAP169X
      1                  = "1 Not at all"
      2                  = "2 Slightly"
      3                  = "3 Moderately"
      4                  = "4 Quite a bit"
      5                  = "5 Extremely"
      7                  = "7 Refused"
      8                  = "8 Not ascertained"
      9                  = "9 Don't know"
   ;
   VALUE SAP238X
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
   VALUE SAP242X
      1                  = "1 ALL of the time"
      2                  = "2 MOST of the time"
      3                  = "3 SOME of the time"
      4                  = "4 A LITTLE of the time"
      5                  = "5 NONE of the time"
      7                  = "7 Refused"
      8                  = "8 Not ascertained"
      9                  = "9 Don't know"
   ;
   VALUE SAP248X
      1                  = "1 A lot"
      2                  = "2 Some"
      3                  = "3 A little"
      4                  = "4 Not at all"
      7                  = "7 Refused"
      8                  = "8 Not ascertained"
      9                  = "9 Don't know"
   ;
   VALUE SAP253X
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
   VALUE SAP265X
      1                  = "1 Limited in any way"
      2                  = "2 Not limited in any way"
      3                  = "3 Unknown if limited"
   ;
   VALUE SAP302X
      95                 = "95 95+"
      96                 = "96 Since birth"
      97                 = "97 Refused"
      98                 = "98 Not ascertained"
      99                 = "99 Don't know"
   ;
   VALUE SAP303X
      1                  = "1 Day(s)"
      2                  = "2 Week(s)"
      3                  = "3 Month(s)"
      4                  = "4 Year(s)"
      6                  = "6 Since birth"
      7                  = "7 Refused"
      8                  = "8 Not ascertained"
      9                  = "9 Don't know"
   ;
   VALUE SAP304X
      00                 = "00 Less than 1 year"
      85                 = "85 85+ years"
      96                 = "96 Unknown number of years"
      97                 = "97 Refused"
      98                 = "98 Not ascertained"
      99                 = "99 Don't know"
   ;
   VALUE SAP305X
      1                  = "1 Less than 3 months"
      2                  = "2 3-5 months"
      3                  = "3 6-12 months"
      4                  = "4 More than 1 year"
      7                  = "7 Refused"
      8                  = "8 Not ascertained"
      9                  = "9 Don't know"
   ;
   VALUE SAP306X
      1                  = "1 Chronic"
      2                  = "2 Not chronic"
      9                  = "9 Unknown if chronic"
   ;
   VALUE SAP482X
      1                  = 
"1 At least one condition causing functional limitation is chronic"
      2                  = "2 No condition causing functional limitation"
      9                  = 
"9 Unknown if any condition causing functional limitation is chronic"
   ;
   VALUE SAP483X
      0                  = 
"0 Not limited in any way (including unknown if limited)"
      1                  = "1 Limited; caused by at least one chronic condition"
      2                  = "2 Limited; not caused by chronic condition"
      3                  = "3 Limited; unknown if condition is chronic"
   ;
   VALUE SAP485X
      85                 = "85 85 years or older"
      96                 = "96 Never smoked regularly"
      97                 = "97 Refused"
      98                 = "98 Not ascertained"
      99                 = "99 Don't know"
   ;
   VALUE SAP486X
      1                  = "1 Every day"
      2                  = "2 Some days"
      3                  = "3 Not at all"
      7                  = "7 Refused"
      8                  = "8 Not ascertained"
      9                  = "9 Don't know"
   ;
   VALUE SAP487X
      1                  = "1 Current every day smoker"
      2                  = "2 Current some day smoker"
      3                  = "3 Former smoker"
      4                  = "4 Never smoker"
      5                  = "5 Smoker, current status unknown"
      9                  = "9 Unknown if ever smoked"
   ;
   VALUE SAP488X
      95                 = "95 95+"
      97                 = "97 Refused"
      98                 = "98 Not ascertained"
      99                 = "99 Don't know"
   ;
   VALUE SAP489X
      1                  = "1 Day(s)"
      2                  = "2 Week(s)"
      3                  = "3 Month(s)"
      4                  = "4 Year(s)"
      7                  = "7 Refused"
      8                  = "8 Not ascertained"
      9                  = "9 Don't know"
   ;
   VALUE SAP490X
      00                 = "00 Less than 1 year"
      70                 = "70 70+ years"
      97                 = "97 Refused"
      98                 = "98 Not ascertained"
      99                 = "99 Don't know"
   ;
   VALUE SAP491X
      95                 = "95 95+ cigarettes"
      97                 = "97 Refused"
      98                 = "98 Not ascertained"
      99                 = "99 Don't know"
   ;
   VALUE SAP492X
      00                 = "00 None"
      97                 = "97 Refused"
      98                 = "98 Not ascertained"
      99                 = "99 Don't know"
   ;
   VALUE SAP496X
      000                = "000 Never"
      996                = "996 Unable to do this type activity"
      997                = "997 Refused"
      998                = "998 Not ascertained"
      999                = "999 Don't know"
   ;
   VALUE SAP497X
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
   VALUE SAP498X
      00                 = "00 Less than once per week"
      95                 = "95 Never"
      96                 = "96 Unable to do vigorous activity"
      97                 = "97 Refused"
      98                 = "98 Not ascertained"
      99                 = "99 Don't know"
   ;
   VALUE SAP499X
      997                = "997 Refused"
      998                = "998 Not ascertained"
      999                = "999 Don't know"
   ;
   VALUE SAP500X
      1                  = "1 Minutes"
      2                  = "2 Hours"
      7                  = "7 Refused"
      8                  = "8 Not ascertained"
      9                  = "9 Don't know"
   ;
   VALUE SAP504X
      00                 = "00 Less than once per week"
      95                 = "95 Never"
      96                 = "96 Unable to do light or moderate activity"
      97                 = "97 Refused"
      98                 = "98 Not ascertained"
      99                 = "99 Don't know"
   ;
   VALUE SAP510X
      00                 = "00 Less than once per week"
      95                 = "95 Never"
      96                 = "96 Unable to do strength activity"
      97                 = "97 Refused"
      98                 = "98 Not ascertained"
      99                 = "99 Don't know"
   ;
   VALUE SAP513X
      000                = "000 Never"
      997                = "997 Refused"
      998                = "998 Not ascertained"
      999                = "999 Don't know"
   ;
   VALUE SAP514X
      0                  = "0 Never/None"
      1                  = "1 Week"
      2                  = "2 Month"
      3                  = "3 Year"
      7                  = "7 Refused"
      8                  = "8 Not ascertained"
      9                  = "9 Don't know"
   ;
   VALUE SAP515X
      00                 = "00 Less than one day per week"
      95                 = "95 Did not drink in past year"
      97                 = "97 Refused"
      98                 = "98 Not ascertained"
      99                 = "99 Don't know"
   ;
   VALUE SAP516X
      000                = "000 Never/none"
      997                = "997 Refused"
      998                = "998 Not ascertained"
      999                = "999 Don't know"
   ;
   VALUE SAP517X
      95                 = "95 95+ drinks"
      97                 = "97 Refused"
      98                 = "98 Not ascertained"
      99                 = "99 Don't know"
   ;
   VALUE SAP518X
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
   VALUE SAP520X
      0                  = "0 Never/None"
      1                  = "1 Per week"
      2                  = "2 Per month"
      3                  = "3 Per year"
      7                  = "7 Refused"
      8                  = "8 Not ascertained"
      9                  = "9 Don't know"
   ;
   VALUE SAP522X
      96                 = "96 Not available"
      97                 = "97 Refused"
      98                 = "98 Not ascertained"
      99                 = "99 Don't know"
   ;
   VALUE SAP523X
      996                = "996 Not available"
      997                = "997 Refused"
      998                = "998 Not ascertained"
      999                = "999 Don't know"
   ;
   VALUE SAP524X
      99.95              = "99.95 99.95+"
      99.99              = "99.99 Unknown"
   ;
   VALUE SAP525X
      97                 = "97 Refused"
      98                 = "98 Not ascertained"
      99                 = "99 Don't know"
   ;
   VALUE SAP526X
      1                  = "1 Yes"
      2                  = "2 There is NO place"
      3                  = "3 There is MORE THAN ONE place"
      7                  = "7 Refused"
      8                  = "8 Not ascertained"
      9                  = "9 Don't know"
   ;
   VALUE SAP527X
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
   VALUE SAP529X
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
   VALUE SAP541X
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
   VALUE SAP552X
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
   VALUE SAP555X
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
   VALUE SAP558X
      95                 = "95 95+ times"
      97                 = "97 Refused"
      98                 = "98 Not ascertained"
      99                 = "99 Don't know"
   ;
   VALUE SAP561X
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
   VALUE SAP562X
      .                   = '.'
      OTHER              = "Year"
      9997               = "9997 Refused"
      9998               = "9998 Not ascertained"
      9999               = "9999 Don't know"
   ;
   VALUE SAP563X
      1                  = "1 Flu shot"
      2                  = "2 Flu nasal spray (spray, mist or drop in nose)"
      7                  = "7 Refused"
      8                  = "8 Not ascertained"
      9                  = "9 Don't know"
   ;
   VALUE SAP582X
      1                  = "1 Received at least 3 doses"
      2                  = "2 Received less than 3 doses"
      7                  = "7 Refused"
      8                  = "8 Not ascertained"
      9                  = "9 Don't know"
   ;
   VALUE SAP584X
      96                 = "96 Received all shots"
      97                 = "97 Refused"
      98                 = "98 Not ascertained"
      99                 = "99 Don't know"
   ;
   VALUE SAP588X
      1                  = "1 Yes-included pertussis"
      2                  = "2 No-did not include pertussis"
      3                  = "3 Doctor did not say"
      7                  = "7 Refused"
      8                  = "8 Not ascertained"
      9                  = "9 Don't know"
   ;
   VALUE SAP596X
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
      96                 = "96 Time period format"
      97                 = "97 Refused"
      98                 = "98 Not ascertained"
      99                 = "99 Don't know"
   ;
   VALUE SAP598X
      9996               = "9996 Time period format"
      9997               = "9997 Refused"
      9998               = "9998 Not ascertained"
      9999               = "9999 Don't know"
   ;
   VALUE SAP599X
      1                  = "1 6 months or less"
      2                  = "2 More than 6 months but not more than 1 year ago"
      3                  = "3 More than 1 year, but not more than 2 years ago"
      4                  = "4 More than 2 years, but not more than 5 years ago"
      5                  = "5 More than 5 years ago"
      7                  = "7 Refused"
      8                  = "8 Not ascertained"
      9                  = "9 Don't know"
   ;
   VALUE SAP600X
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
   VALUE SAP601X
      1                  = "1 Doctor, nurse or other health care professional"
      2                  = "2 Sex partner"
      3                  = "3 Someone at health department"
      4                  = "4 Family member or friend"
      5                  = "5 Other"
      7                  = "7 Refused"
      8                  = "8 Not ascertained"
      9                  = "9 Don't know"
   ;
   VALUE SAP602X
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
   VALUE SAP603X
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
   VALUE SAP604X
      1                  = "1 Nurse or health worker"
      2                  = "2 Self-sampling kit"
      7                  = "7 Refused"
      8                  = "8 Not ascertained"
      9                  = "9 Don't know"
   ;
   VALUE SAP607X
      1                  = "1 High/Already have HIV/AIDS"
      2                  = "2 Medium"
      3                  = "3 Low"
      4                  = "4 None"
      7                  = "7 Refused"
      8                  = "8 Not ascertained"
      9                  = "9 Don't know"
   ;
   VALUE SAP608X
      1                  = "1 Yes, at least one statement is true"
      2                  = "2 No, none of these statements are true"
      7                  = "7 Refused"
      8                  = "8 Not ascertained"
      9                  = "9 Don't know"
   ;
   VALUE SAP611X
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
   VALUE SAP614X
      1                  = "1 A lot"
      2                  = "2 Some"
      3                  = "3 A little"
      4                  = "4 Nothing"
      7                  = "7 Refused"
      8                  = "8 Not ascertained"
      9                  = "9 Don't know"
   ;
   VALUE SAP622X
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
   INFILE ASCIIDAT PAD LRECL=906;

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

      /* QOL LENGTHS */

      QOL_FLG    3

      /* FDB LENGTHS */

      FDRN_FLG   3

      /* ASD LENGTHS */

      DOINGLWA   3   WHYNOWKA   3   EVERWRK    3   INDSTRN1   3
      INDSTRN2   3   OCCUPN1    3   OCCUPN2    3   WRKCATA    3
      BUSINC1A   3   LOCALL1A   3   YRSWRKPA   3   WRKLONGH   3
      HOURPDA    3   PDSICKA    3   ONEJOB     3   WRKLYR4    3
      MRECLONG   3   INDSPY1    3   INDSPY2    3   OCCUPPY1   3
      OCCUPPY2   3   WRKCATPY   3   YRSWRKPY   3   INDSLH1    3
      INDSLH2    3   OCCUPLH1   3   OCCUPLH2   3   WRKCATLH   3
      YRSWRKLH   3   WRKARRNG   3   WRKTEMP    3   WRKSCHED   3
      WORUNEMP   3   WORKWFAM   3   HARASSED   3   CHEMEXP    3
      SMOKEXP    3   WRKOUTDR   3   VAPOREXP   3   IPWHATR    3
      INJWCCLM   3   INJWCBEN   3

      /* ACN LENGTHS */

      HYPEV      3   HYPDIFV    3   CHDEV      3   ANGEV      3
      MIEV       3   HRTEV      3   STREV      3   EPHEV      3
      AASMEV     3   AASSTILL   3   AASMYR     3   AASERYR1   3
      AASAGE_P   3   AASAGE16   3   AASSTAT    3   AASEMP     3
      AASCJOB    3   AASLHJOB   3   INDSTAS1   3   INDSTAS2   3
      OCCUPAS1   3   OCCUPAS2   3   AASWKREL   3   AASDWKRL   3
      AASWCCLM   3   AASWCBEN   3   AASWKDAY   4   AASCHJOB   3
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
      INSLN      3   DIBPILL    3   EPILEP1    3   EPILEP2    3
      EPILEP3    3   EPILEP4    3   EPILEP5    3   AHAYFYR    3
      SINYR      3   CBRCHYR    3   KIDWKYR    3   LIVYR      3
      DRMYR      3   DRMBODY1   3   DRMBODY2   3   DRMBODY3   3
      DRMBODY4   3   DRMTRET    3   DRMWKREL   3   DRMCJOB    3
      DRMLHJOB   3   INDSDR1    3   INDSDR2    3   OCCUPDR1   3
      OCCUPDR2   3   DRMWCCLM   3   DRMWCBEN   3   DRMWKDAY   4
      DRMCHJOB   3   JNTSYMP    3   JMTHP1     3   JMTHP2     3
      JMTHP3     3   JMTHP4     3   JMTHP5     3   JMTHP6     3
      JMTHP7     3   JMTHP8     3   JMTHP9     3   JMTHP10    3
      JMTHP11    3   JMTHP12    3   JMTHP13    3   JMTHP14    3
      JMTHP15    3   JMTHP16    3   JMTHP17    3   JNTCHR     3
      JNTHP      3   ARTH1      3   ARTHLMT    3   CTSEVER    3
      CTSYR      3   CTSAGE_P   3   CTSWKREL   3   CTSCJOB    3
      CTSLHJOB   3   INDSTCT1   3   INDSTCT2   3   OCCUPCT1   3
      OCCUPCT2   3   CTSWCCLM   3   CTSWCBEN   3   CTSWKDAY   4
      CTSCHJOB   3   PAINECK    3   PAINLB     3   PAINLEG    3
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
      AFLHCA12   3   AFLHCA13   3   AFLHCA14   3   AFLHCA15   3
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
      ALDURB13   3   ALCHRC13   3   ALTIME14   3   ALUNIT14   3
      ALDURA14   3   ALDURB14   3   ALCHRC14   3   ALTIME15   3
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
      ASRGNOYR   3   AMDLONGR   3   AH1N1_1    3   AH1N1_3M   3
      AH1N1_4Y   4   AH1N1_5    3   SHTFLUYR   3   ASHFLU_M   3
      ASHFLU_Y   4   SPRFLUYR   3   ASPFLU_M   3   ASPFLU_Y   4
      SHTFLU2    3   ASHFLUM2   3   ASHFLUY2   4   SPRFLU2    3
      ASPFLUM2   3   ASPFLUY2   4   SHTPNUYR   3   APOX       3
      APOX12MO   3   AHEP       3   AHEPLIV    3   SHTHEPB    3
      SHEPDOS    3   SHTHEPA    3   SHEPANUM   3   SHINGLES   3
      SHTTD      3   SHTTD05    3   SHTTDAP    3   LIVEV      3
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

      /* QOL LOCATIONS */

      QOL_FLG      54 -  54

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
      MRECLONG     79 -  79    INDSPY1      80 -  81
      INDSPY2      82 -  83    OCCUPPY1     84 -  85
      OCCUPPY2     86 -  87    WRKCATPY     88 -  88
      YRSWRKPY     89 -  90    INDSLH1      91 -  92
      INDSLH2      93 -  94    OCCUPLH1     95 -  96
      OCCUPLH2     97 -  98    WRKCATLH     99 -  99
      YRSWRKLH    100 - 101    WRKARRNG    102 - 102
      WRKTEMP     103 - 103    WRKSCHED    104 - 104
      WORUNEMP    105 - 105    WORKWFAM    106 - 106
      HARASSED    107 - 107    CHEMEXP     108 - 108
      SMOKEXP     109 - 109    WRKOUTDR    110 - 110
      VAPOREXP    111 - 111    IPWHATR     112 - 112
      INJWCCLM    113 - 113    INJWCBEN    114 - 114


      /* ACN LOCATIONS */

      HYPEV       115 - 115    HYPDIFV     116 - 116
      CHDEV       117 - 117    ANGEV       118 - 118
      MIEV        119 - 119    HRTEV       120 - 120
      STREV       121 - 121    EPHEV       122 - 122
      AASMEV      123 - 123    AASSTILL    124 - 124
      AASMYR      125 - 125    AASERYR1    126 - 126
      AASAGE_P    127 - 128    AASAGE16    129 - 129
      AASSTAT     130 - 130    AASEMP      131 - 131
      AASCJOB     132 - 132    AASLHJOB    133 - 133
      INDSTAS1    134 - 135    INDSTAS2    136 - 137
      OCCUPAS1    138 - 139    OCCUPAS2    140 - 141
      AASWKREL    142 - 142    AASDWKRL    143 - 143
      AASWCCLM    144 - 144    AASWCBEN    145 - 145
      AASWKDAY    146 - 148    AASCHJOB    149 - 149
      ULCEV       150 - 150    ULCYR       151 - 151
      CANEV       152 - 152    CNKIND1     153 - 153
      CNKIND2     154 - 154    CNKIND3     155 - 155
      CNKIND4     156 - 156    CNKIND5     157 - 157
      CNKIND6     158 - 158    CNKIND7     159 - 159
      CNKIND8     160 - 160    CNKIND9     161 - 161
      CNKIND10    162 - 162    CNKIND11    163 - 163
      CNKIND12    164 - 164    CNKIND13    165 - 165
      CNKIND14    166 - 166    CNKIND15    167 - 167
      CNKIND16    168 - 168    CNKIND17    169 - 169
      CNKIND18    170 - 170    CNKIND19    171 - 171
      CNKIND20    172 - 172    CNKIND21    173 - 173
      CNKIND22    174 - 174    CNKIND23    175 - 175
      CNKIND24    176 - 176    CNKIND25    177 - 177
      CNKIND26    178 - 178    CNKIND27    179 - 179
      CNKIND28    180 - 180    CNKIND29    181 - 181
      CNKIND30    182 - 182    CNKIND31    183 - 183
      CANAGE1     184 - 186    CANAGE2     187 - 189
      CANAGE3     190 - 192    CANAGE4     193 - 195
      CANAGE5     196 - 198    CANAGE6     199 - 201
      CANAGE7     202 - 204    CANAGE8     205 - 207
      CANAGE9     208 - 210    CANAGE10    211 - 213
      CANAGE11    214 - 216    CANAGE12    217 - 219
      CANAGE13    220 - 222    CANAGE14    223 - 225
      CANAGE15    226 - 228    CANAGE16    229 - 231
      CANAGE17    232 - 234    CANAGE18    235 - 237
      CANAGE19    238 - 240    CANAGE20    241 - 243
      CANAGE21    244 - 246    CANAGE22    247 - 249
      CANAGE23    250 - 252    CANAGE24    253 - 255
      CANAGE25    256 - 258    CANAGE26    259 - 261
      CANAGE27    262 - 264    CANAGE28    265 - 267
      CANAGE29    268 - 270    CANAGE30    271 - 273
      DIBEV       274 - 274    DIBPRE1     275 - 275
      DIBAGE      276 - 277    DIFAGE2     278 - 279
      INSLN       280 - 280    DIBPILL     281 - 281
      EPILEP1     282 - 282    EPILEP2     283 - 283
      EPILEP3     284 - 284    EPILEP4     285 - 285
      EPILEP5     286 - 286    AHAYFYR     287 - 287
      SINYR       288 - 288    CBRCHYR     289 - 289
      KIDWKYR     290 - 290    LIVYR       291 - 291
      DRMYR       292 - 292    DRMBODY1    293 - 293
      DRMBODY2    294 - 294    DRMBODY3    295 - 295
      DRMBODY4    296 - 296    DRMTRET     297 - 297
      DRMWKREL    298 - 298    DRMCJOB     299 - 299
      DRMLHJOB    300 - 300    INDSDR1     301 - 302
      INDSDR2     303 - 304    OCCUPDR1    305 - 306
      OCCUPDR2    307 - 308    DRMWCCLM    309 - 309
      DRMWCBEN    310 - 310    DRMWKDAY    311 - 313
      DRMCHJOB    314 - 314    JNTSYMP     315 - 315
      JMTHP1      316 - 316    JMTHP2      317 - 317
      JMTHP3      318 - 318    JMTHP4      319 - 319
      JMTHP5      320 - 320    JMTHP6      321 - 321
      JMTHP7      322 - 322    JMTHP8      323 - 323
      JMTHP9      324 - 324    JMTHP10     325 - 325
      JMTHP11     326 - 326    JMTHP12     327 - 327
      JMTHP13     328 - 328    JMTHP14     329 - 329
      JMTHP15     330 - 330    JMTHP16     331 - 331
      JMTHP17     332 - 332    JNTCHR      333 - 333
      JNTHP       334 - 334    ARTH1       335 - 335
      ARTHLMT     336 - 336    CTSEVER     337 - 337
      CTSYR       338 - 338    CTSAGE_P    339 - 340
      CTSWKREL    341 - 341    CTSCJOB     342 - 342
      CTSLHJOB    343 - 343    INDSTCT1    344 - 345
      INDSTCT2    346 - 347    OCCUPCT1    348 - 349
      OCCUPCT2    350 - 351    CTSWCCLM    352 - 352
      CTSWCBEN    353 - 353    CTSWKDAY    354 - 356
      CTSCHJOB    357 - 357    PAINECK     358 - 358
      PAINLB      359 - 359    PAINLEG     360 - 360
      PAINFACE    361 - 361    AMIGR       362 - 362
      ACOLD2W     363 - 363    AINTIL2W    364 - 364
      PREGNOW     365 - 365    HRAIDNOW    366 - 366
      HRAIDEV     367 - 367    AHEARST1    368 - 368
      AVISION     369 - 369    ABLIND      370 - 370
      LUPPRT      371 - 371    SAD         372 - 372
      NERVOUS     373 - 373    RESTLESS    374 - 374
      HOPELESS    375 - 375    EFFORT      376 - 376
      WORTHLS     377 - 377    MHAMTMO     378 - 378


      /* AHS LOCATIONS */

      WKDAYR      379 - 381    BEDDAYR     382 - 384
      AHSTATYR    385 - 385    SPECEQ      386 - 386
      FLWALK      387 - 387    FLCLIMB     388 - 388
      FLSTAND     389 - 389    FLSIT       390 - 390
      FLSTOOP     391 - 391    FLREACH     392 - 392
      FLGRASP     393 - 393    FLCARRY     394 - 394
      FLPUSH      395 - 395    FLSHOP      396 - 396
      FLSOCL      397 - 397    FLRELAX     398 - 398
      FLA1AR      399 - 399    AFLHCA1     400 - 400
      AFLHCA2     401 - 401    AFLHCA3     402 - 402
      AFLHCA4     403 - 403    AFLHCA5     404 - 404
      AFLHCA6     405 - 405    AFLHCA7     406 - 406
      AFLHCA8     407 - 407    AFLHCA9     408 - 408
      AFLHCA10    409 - 409    AFLHCA11    410 - 410
      AFLHCA12    411 - 411    AFLHCA13    412 - 412
      AFLHCA14    413 - 413    AFLHCA15    414 - 414
      AFLHCA16    415 - 415    AFLHCA17    416 - 416
      AFLHCA18    417 - 417    AFLHC19_    418 - 418
      AFLHC20_    419 - 419    AFLHC21_    420 - 420
      AFLHC22_    421 - 421    AFLHC23_    422 - 422
      AFLHC24_    423 - 423    AFLHC25_    424 - 424
      AFLHC26_    425 - 425    AFLHC27_    426 - 426
      AFLHC28_    427 - 427    AFLHC29_    428 - 428
      AFLHC30_    429 - 429    AFLHC31_    430 - 430
      AFLHC32_    431 - 431    AFLHC33_    432 - 432
      AFLHC34_    433 - 433    AFLHCA90    434 - 434
      AFLHCA91    435 - 435    ALTIME1     436 - 437
      ALUNIT1     438 - 438    ALDURA1     439 - 440
      ALDURB1     441 - 441    ALCHRC1     442 - 442
      ALTIME2     443 - 444    ALUNIT2     445 - 445
      ALDURA2     446 - 447    ALDURB2     448 - 448
      ALCHRC2     449 - 449    ALTIME3     450 - 451
      ALUNIT3     452 - 452    ALDURA3     453 - 454
      ALDURB3     455 - 455    ALCHRC3     456 - 456
      ALTIME4     457 - 458    ALUNIT4     459 - 459
      ALDURA4     460 - 461    ALDURB4     462 - 462
      ALCHRC4     463 - 463    ALTIME5     464 - 465
      ALUNIT5     466 - 466    ALDURA5     467 - 468
      ALDURB5     469 - 469    ALCHRC5     470 - 470
      ALTIME6     471 - 472    ALUNIT6     473 - 473
      ALDURA6     474 - 475    ALDURB6     476 - 476
      ALCHRC6     477 - 477    ALTIME7     478 - 479
      ALUNIT7     480 - 480    ALDURA7     481 - 482
      ALDURB7     483 - 483    ALCHRC7     484 - 484
      ALTIME8     485 - 486    ALUNIT8     487 - 487
      ALDURA8     488 - 489    ALDURB8     490 - 490
      ALCHRC8     491 - 491    ALTIME9     492 - 493
      ALUNIT9     494 - 494    ALDURA9     495 - 496
      ALDURB9     497 - 497    ALCHRC9     498 - 498
      ALTIME10    499 - 500    ALUNIT10    501 - 501
      ALDURA10    502 - 503    ALDURB10    504 - 504
      ALCHRC10    505 - 505    ALTIME11    506 - 507
      ALUNIT11    508 - 508    ALDURA11    509 - 510
      ALDURB11    511 - 511    ALCHRC11    512 - 512
      ALTIME12    513 - 514    ALUNIT12    515 - 515
      ALDURA12    516 - 517    ALDURB12    518 - 518
      ALCHRC12    519 - 519    ALTIME13    520 - 521
      ALUNIT13    522 - 522    ALDURA13    523 - 524
      ALDURB13    525 - 525    ALCHRC13    526 - 526
      ALTIME14    527 - 528    ALUNIT14    529 - 529
      ALDURA14    530 - 531    ALDURB14    532 - 532
      ALCHRC14    533 - 533    ALTIME15    534 - 535
      ALUNIT15    536 - 536    ALDURA15    537 - 538
      ALDURB15    539 - 539    ALCHRC15    540 - 540
      ALTIME16    541 - 542    ALUNIT16    543 - 543
      ALDURA16    544 - 545    ALDURB16    546 - 546
      ALCHRC16    547 - 547    ALTIME17    548 - 549
      ALUNIT17    550 - 550    ALDURA17    551 - 552
      ALDURB17    553 - 553    ALCHRC17    554 - 554
      ALTIME18    555 - 556    ALUNIT18    557 - 557
      ALDURA18    558 - 559    ALDURB18    560 - 560
      ALCHRC18    561 - 561    ALTIME19    562 - 563
      ALUNIT19    564 - 564    ALDURA19    565 - 566
      ALDURB19    567 - 567    ALCHRC19    568 - 568
      ALTIME20    569 - 570    ALUNIT20    571 - 571
      ALDURA20    572 - 573    ALDURB20    574 - 574
      ALCHRC20    575 - 575    ALTIME21    576 - 577
      ALUNIT21    578 - 578    ALDURA21    579 - 580
      ALDURB21    581 - 581    ALCHRC21    582 - 582
      ALTIME22    583 - 584    ALUNIT22    585 - 585
      ALDURA22    586 - 587    ALDURB22    588 - 588
      ALCHRC22    589 - 589    ALTIME23    590 - 591
      ALUNIT23    592 - 592    ALDURA23    593 - 594
      ALDURB23    595 - 595    ALCHRC23    596 - 596
      ALTIME24    597 - 598    ALUNIT24    599 - 599
      ALDURA24    600 - 601    ALDURB24    602 - 602
      ALCHRC24    603 - 603    ALTIME25    604 - 605
      ALUNIT25    606 - 606    ALDURA25    607 - 608
      ALDURB25    609 - 609    ALCHRC25    610 - 610
      ALTIME26    611 - 612    ALUNIT26    613 - 613
      ALDURA26    614 - 615    ALDURB26    616 - 616
      ALCHRC26    617 - 617    ALTIME27    618 - 619
      ALUNIT27    620 - 620    ALDURA27    621 - 622
      ALDURB27    623 - 623    ALCHRC27    624 - 624
      ALTIME28    625 - 626    ALUNIT28    627 - 627
      ALDURA28    628 - 629    ALDURB28    630 - 630
      ALCHRC28    631 - 631    ALTIME29    632 - 633
      ALUNIT29    634 - 634    ALDURA29    635 - 636
      ALDURB29    637 - 637    ALCHRC29    638 - 638
      ALTIME30    639 - 640    ALUNIT30    641 - 641
      ALDURA30    642 - 643    ALDURB30    644 - 644
      ALCHRC30    645 - 645    ALTIME31    646 - 647
      ALUNIT31    648 - 648    ALDURA31    649 - 650
      ALDURB31    651 - 651    ALCHRC31    652 - 652
      ALTIME32    653 - 654    ALUNIT32    655 - 655
      ALDURA32    656 - 657    ALDURB32    658 - 658
      ALCHRC32    659 - 659    ALTIME33    660 - 661
      ALUNIT33    662 - 662    ALDURA33    663 - 664
      ALDURB33    665 - 665    ALCHRC33    666 - 666
      ALTIME34    667 - 668    ALUNIT34    669 - 669
      ALDURA34    670 - 671    ALDURB34    672 - 672
      ALCHRC34    673 - 673    ALTIME90    674 - 675
      ALUNIT90    676 - 676    ALDURA90    677 - 678
      ALDURB90    679 - 679    ALCHRC90    680 - 680
      ALTIME91    681 - 682    ALUNIT91    683 - 683
      ALDURA91    684 - 685    ALDURB91    686 - 686
      ALCHRC91    687 - 687    ALCNDRT     688 - 688
      ALCHRONR    689 - 689

      /* AHB LOCATIONS */

      SMKEV       690 - 690    SMKREG      691 - 692
      SMKNOW      693 - 693    SMKSTAT2    694 - 694
      SMKQTNO     695 - 696    SMKQTTP     697 - 697
      SMKQTY      698 - 699    CIGSDA1     700 - 701
      CIGDAMO     702 - 703    CIGSDA2     704 - 705
      CIGSDAY     706 - 707    CIGQTYR     708 - 708
      VIGNO       709 - 711    VIGTP       712 - 712
      VIGFREQW    713 - 714    VIGLNGNO    715 - 717
      VIGLNGTP    718 - 718    VIGMIN      719 - 721
      MODNO       722 - 724    MODTP       725 - 725
      MODFREQW    726 - 727    MODLNGNO    728 - 730
      MODLNGTP    731 - 731    MODMIN      732 - 734
      STRNGNO     735 - 737    STRNGTP     738 - 738
      STRFREQW    739 - 740    ALC1YR      741 - 741
      ALCLIFE     742 - 742    ALC12MNO    743 - 745
      ALC12MTP    746 - 746    ALC12MWK    747 - 748
      ALC12MYR    749 - 751    ALCAMT      752 - 753
      ALCSTAT     754 - 755    ALC5UPNO    756 - 758
      ALC5UPTP    759 - 759    ALC5UPYR    760 - 762
      AHEIGHT     763 - 764    AWEIGHTP    765 - 767
      BMI         768 - 771 .2 SLEEP       772 - 773


      /* AAU LOCATIONS */

      AUSUALPL    774 - 774    APLKIND     775 - 775
      AHCPLROU    776 - 776    AHCPLKND    777 - 777
      AHCCHGYR    778 - 778    AHCCHGHI    779 - 779
      AHCDLYR1    780 - 780    AHCDLYR2    781 - 781
      AHCDLYR3    782 - 782    AHCDLYR4    783 - 783
      AHCDLYR5    784 - 784    AHCAFYR1    785 - 785
      AHCAFYR2    786 - 786    AHCAFYR3    787 - 787
      AHCAFYR4    788 - 788    ADNLONG2    789 - 789
      AHCSYR1     790 - 790    AHCSYR2     791 - 791
      AHCSYR3     792 - 792    AHCSYR4     793 - 793
      AHCSYR5     794 - 794    AHCSYR6     795 - 795
      AHCSYR7     796 - 796    AHCSYR8     797 - 797
      AHCSYR9     798 - 798    AHCSYR10    799 - 799
      AHERNOY2    800 - 801    AHCHYR      802 - 802
      AHCHMOYR    803 - 804    AHCHNOY2    805 - 806
      AHCNOYR2    807 - 808    ASRGYR      809 - 809
      ASRGNOYR    810 - 811    AMDLONGR    812 - 812
      AH1N1_1     813 - 813    AH1N1_3M    814 - 815
      AH1N1_4Y    816 - 819    AH1N1_5     820 - 820
      SHTFLUYR    821 - 821    ASHFLU_M    822 - 823
      ASHFLU_Y    824 - 827    SPRFLUYR    828 - 828
      ASPFLU_M    829 - 830    ASPFLU_Y    831 - 834
      SHTFLU2     835 - 835    ASHFLUM2    836 - 837
      ASHFLUY2    838 - 841    SPRFLU2     842 - 842
      ASPFLUM2    843 - 844    ASPFLUY2    845 - 848
      SHTPNUYR    849 - 849    APOX        850 - 850
      APOX12MO    851 - 851    AHEP        852 - 852
      AHEPLIV     853 - 853    SHTHEPB     854 - 854
      SHEPDOS     855 - 855    SHTHEPA     856 - 856
      SHEPANUM    857 - 858    SHINGLES    859 - 859
      SHTTD       860 - 860    SHTTD05     861 - 861
      SHTTDAP     862 - 862    LIVEV       863 - 863
      TRAVEL      864 - 864    WRKHLTH     865 - 865
      WRKDIR      866 - 866

      /* ADS LOCATIONS */

      BLDGV       867 - 867    BLDG12M     868 - 868
      HIVTST      869 - 869    WHYTST_R    870 - 871
      TST12M_M    872 - 873    TST12M_Y    874 - 877
      TIMETST     878 - 878    REATST_C    879 - 880
      REASWHOR    881 - 881    LASTST_C    882 - 883
      CLNTYP_C    884 - 885    WHOADM      886 - 886
      GIVNAM      887 - 887    EXTST12M    888 - 888
      CHNSADSP    889 - 889    STMTRU      890 - 890
      STD         891 - 891    STDDOC      892 - 892
      STDWHER     893 - 893    TBHRD       894 - 894
      TBKNOW      895 - 895    TB          896 - 896
      TBSPRD1     897 - 897    TBSPRD2     898 - 898
      TBSPRD3     899 - 899    TBSPRD4     900 - 900
      TBSPRD5     901 - 901    TBSPRD6     902 - 902
      TBCURED     903 - 903    TBCHANC     904 - 904
      TBSHAME     905 - 905    HOMELESS    906 - 906
;

   * DEFINE VARIABLE LABELS;

   LABEL

      /* IDN LABELS */

      RECTYPE    ="File type identifier"
      SRVY_YR    ="Year of National Health Interview Survey"
      HHX        ="Household Number"
      INTV_QRT   ="Interview Quarter"
      ASSIGNWK   ="Assignment Week"
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

      /* QOL LABELS */

      QOL_FLG    ="Quality of life flag"

      /* FDB LABELS */

      FDRN_FLG   ="Disability Questions Tests flag"

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
      MRECLONG   ="Job held in past 12 months was longest-held job"
      INDSPY1    =
"Detailed industry classification (retired or 65+; worked in past 12 months; not
 longest-held job)"
      INDSPY2    =
"Simple industry classification (retired or 65+; worked in past 12 months; not l
ongest-held job)"
      OCCUPPY1   =
"Detailed occupation classification (retired or 65+; worked in past 12 months; n
ot longest-held job)"
      OCCUPPY2   =
"Simple occupation classification (retired or 65+; worked in past 12 months; not
 longest-held job)"
      WRKCATPY   =
"Class of worker (retired or 65+; worked in past 12 months; not longest-held job
)"
      YRSWRKPY   =
"Number of years on the job (retired or 65+; worked in past 12 months; not longe
st-held job)"
      INDSLH1    =
"Detailed industry classification (current or most recent job not longest-held j
ob)"
      INDSLH2    =
"Simple industry classification (current or most recent job not longest-held job
)"
      OCCUPLH1   =
"Detailed occupation classification (current or most recent job not longest-held
 job)"
      OCCUPLH2   =
"Simple occupation classification (current or most recent job not longest-held j
ob)"
      WRKCATLH   =
"Class of worker (current or most recent job not longest-held job)"
      YRSWRKLH   =
"Number of years on the job (current or most recent job not longest-held job)"
      WRKARRNG   ="Work arrangement"
      WRKTEMP    ="Temporary job"
      WRKSCHED   ="Work schedule"
      WORUNEMP   ="Worried about becoming unemployed"
      WORKWFAM   ="Compatibility of work and family responsibilities"
      HARASSED   ="Experienced harassment, bullying on the job, past 12 months"
      CHEMEXP    =
"Experienced regular skin contact with chemical substances on the job, past 12 m
onths"
      SMOKEXP    =
"Experienced regular exposure to tobacco smoke from other people at work, past 1
2 months"
      WRKOUTDR   =
"Regularly worked outdoors twice a week or more, past 12 months"
      VAPOREXP   =
"Regularly exposed to vapors, gas, dust, or fumes at work twice a week or more"
      IPWHATR    =
"Had injury/poisoning during the past 3 months while working at a paid job"
      INJWCCLM   =
"Filed workers' compensation form for on-the-job injury or poisoning"
      INJWCBEN   =
"Received workers' compensation benefits for on-the-job injury or poisoning"

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
      AASAGE_P   ="Age when first told had asthma"
      AASAGE16   ="Less than 16 first told had asthma"
      AASSTAT    ="Asthma better/worse/same"
      AASEMP     ="Employed when asthma developed/worsened"
      AASCJOB    ="Current/most recent job when asthma developed/worsened"
      AASLHJOB   ="Longest job held when asthma developed/worsened"
      INDSTAS1   ="Detailed industry classification"
      INDSTAS2   ="Simple industry classification"
      OCCUPAS1   ="Detailed occupation classification"
      OCCUPAS2   ="Simple occupation classification"
      AASWKREL   ="Ever told asthma work-related"
      AASDWKRL   ="Ever discuss if asthma work-related"
      AASWCCLM   ="Ever filed workers' comp for asthma"
      AASWCBEN   ="Ever received workers' comp for asthma"
      AASWKDAY   ="# Work days missed past 12 m"
      AASCHJOB   ="Change work activities past 12 m"
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
      EPILEP1    ="Ever been told you had seizure disorder/epilepsy"
      EPILEP2    ="Now taking epilepsy meds"
      EPILEP3    ="# Seizures past 12 m"
      EPILEP4    ="Seen neurologist/specialist past 12 m"
      EPILEP5    ="Epilepsy interfered w/activities past 30 d"
      AHAYFYR    ="Told that you had hay fever, past 12 m"
      SINYR      ="Told that you had sinusitis, past 12 m"
      CBRCHYR    ="Told you had chronic bronchitis, 12 m"
      KIDWKYR    ="Told you had weak/failing kidneys, 12 m"
      LIVYR      ="Told you had liver condition, past 12 m"
      DRMYR      ="Dermatitis/skin condition past 12 m"
      DRMBODY1   ="What body part affected…hands"
      DRMBODY2   ="What body part affected…arms"
      DRMBODY3   ="What body part affected…head/face/neck"
      DRMBODY4   ="What body part affected…other"
      DRMTRET    ="Ever seen doctor/health prof for skin condition"
      DRMWKREL   ="Ever been told skin condition work-related"
      DRMCJOB    ="Skin condition related to current/most recent job"
      DRMLHJOB   ="Skin condition related to longest-held job"
      INDSDR1    ="Detailed industry classification"
      INDSDR2    ="Simple industry classification"
      OCCUPDR1   ="Detailed occupation classification"
      OCCUPDR2   ="Simple occupation classification"
      DRMWCCLM   ="Ever filed workers' comp for skin condition"
      DRMWCBEN   ="Ever receive workers' comp for skin condition"
      DRMWKDAY   ="# Work days missed due to skin condition past 12 m"
      DRMCHJOB   ="Change in work activities past 12 m"
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
      CTSEVER    ="Ever been told you had carpal tunnel syndrome"
      CTSYR      ="Carpal tunnel synd past 12m"
      CTSAGE_P   ="Age first diagnosed w/ carpal tunnel synd"
      CTSWKREL   ="Told carpal tunnel synd work-related"
      CTSCJOB    ="Carpal tunnel synd related to current/most recent job"
      CTSLHJOB   ="Carpal tunnel synd related to longest-held job"
      INDSTCT1   ="Detailed industry classification"
      INDSTCT2   ="Simple industry classification"
      OCCUPCT1   ="Detailed occupation classification"
      OCCUPCT2   ="Simple occupation classification"
      CTSWCCLM   ="Ever filed workers' comp for carpal tunnel synd"
      CTSWCBEN   ="Ever receive workers' comp for carpal tunnel synd"
      CTSWKDAY   ="# Work days missed due to carpal tunnel synd past 12 m"
      CTSCHJOB   ="Change in work activities due to carpal tunnel synd past 12 m
"
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
      AFLHCA14   ="Mental retardation causes difficulty with activity"
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
      ALTIME9    ="Duration of hypertension/high blood pressure: Number of units
"
      ALUNIT9    ="Duration of hypertension/high blood pressure: Time unit"
      ALDURA9    =
"Duration (in years) of hypertension/high blood pressure, recode 1"
      ALDURB9    ="Duration of hypertension/high blood, pressure recode 2"
      ALCHRC9    ="Hypertension/high blood pressure condition status recode"
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
      ALTIME14   ="Duration of mental retardation: Number of units"
      ALUNIT14   ="Duration of mental retardation: Time unit"
      ALDURA14   ="Duration (in years) of mental retardation, recode 1"
      ALDURB14   ="Duration of mental retardation, recode 2"
      ALCHRC14   ="Mental retardation condition status recode"
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
"Duration (in years) of nervous system/sensory organ condition , recode 1"
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
      AHCAFYR2   ="Couldn't afford mental health care/counseling, past 12 m"
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
      AH1N1_1    ="Had an H1N1 flu vaccination since October 2009"
      AH1N1_3M   ="Month received H1N1 flu vaccine"
      AH1N1_4Y   ="Year received H1N1 flu vaccine"
      AH1N1_5    ="Shot or vaccine sprayed in the nose"
      SHTFLUYR   ="Seasonal flu shot past 12 m"
      ASHFLU_M   ="Month of most recent seasonal flu shot"
      ASHFLU_Y   ="Year of most recent seasonal flu shot"
      SPRFLUYR   ="Seasonal flu nasal spray past 12 m"
      ASPFLU_M   ="Month of most recent seasonal flu nasal spray vaccine"
      ASPFLU_Y   ="Year of most recent seasonal flu nasal spray vaccine"
      SHTFLU2    ="Flu shot past 12 m"
      ASHFLUM2   ="Month of most recent flu shot"
      ASHFLUY2   ="Year of most recent flu shot"
      SPRFLU2    ="Flu spray past 12 m"
      ASPFLUM2   ="Month of most recent flu spray"
      ASPFLUY2   ="Year of most recent flu spray"
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

      /* QOL FORMAT ASSOCIATIONS */

      QOL_FLG   SAP023X.

      /* FDB FORMAT ASSOCIATIONS */

      FDRN_FLG  SAP024X.

      /* ASD FORMAT ASSOCIATIONS */

      DOINGLWA  SAP025X.   WHYNOWKA  SAP026X.   EVERWRK   SAP027X.
      INDSTRN1  SAP028X.   INDSTRN2  SAP028X.   OCCUPN1   SAP030X.
      OCCUPN2   SAP030X.   WRKCATA   SAP032X.   BUSINC1A  SAP027X.
      LOCALL1A  SAP034X.   YRSWRKPA  SAP035X.   WRKLONGH  SAP027X.
      HOURPDA   SAP027X.   PDSICKA   SAP027X.   ONEJOB    SAP027X.
      WRKLYR4   SAP040X.   MRECLONG  SAP027X.   INDSPY1   SAP028X.
      INDSPY2   SAP028X.   OCCUPPY1  SAP030X.   OCCUPPY2  SAP030X.
      WRKCATPY  SAP046X.   YRSWRKPY  SAP035X.   INDSLH1   SAP028X.
      INDSLH2   SAP028X.   OCCUPLH1  SAP030X.   OCCUPLH2  SAP030X.
      WRKCATLH  SAP046X.   YRSWRKLH  SAP035X.   WRKARRNG  SAP054X.
      WRKTEMP   SAP055X.   WRKSCHED  SAP056X.   WORUNEMP  SAP057X.
      WORKWFAM  SAP057X.   HARASSED  SAP027X.   CHEMEXP   SAP027X.
      SMOKEXP   SAP027X.   WRKOUTDR  SAP027X.   VAPOREXP  SAP027X.
      IPWHATR   SAP064X.   INJWCCLM  SAP065X.   INJWCBEN  SAP066X.

      /* ACN FORMAT ASSOCIATIONS */

      HYPEV     SAP027X.   HYPDIFV   SAP027X.   CHDEV     SAP027X.
      ANGEV     SAP027X.   MIEV      SAP027X.   HRTEV     SAP027X.
      STREV     SAP027X.   EPHEV     SAP027X.   AASMEV    SAP027X.
      AASSTILL  SAP027X.   AASMYR    SAP027X.   AASERYR1  SAP027X.
      AASAGE_P  SAP079X.   AASAGE16  SAP080X.   AASSTAT   SAP081X.
      AASEMP    SAP027X.   AASCJOB   SAP027X.   AASLHJOB  SAP027X.
      INDSTAS1  SAP085X.   INDSTAS2  SAP085X.   OCCUPAS1  SAP030X.
      OCCUPAS2  SAP030X.   AASWKREL  SAP027X.   AASDWKRL  SAP027X.
      AASWCCLM  SAP027X.   AASWCBEN  SAP066X.   AASWKDAY  SAP093X.
      AASCHJOB  SAP027X.   ULCEV     SAP027X.   ULCYR     SAP027X.
      CANEV     SAP027X.   CNKIND1   SAP098X.   CNKIND2   SAP098X.
      CNKIND3   SAP098X.   CNKIND4   SAP098X.   CNKIND5   SAP098X.
      CNKIND6   SAP098X.   CNKIND7   SAP098X.   CNKIND8   SAP098X.
      CNKIND9   SAP098X.   CNKIND10  SAP098X.   CNKIND11  SAP098X.
      CNKIND12  SAP098X.   CNKIND13  SAP098X.   CNKIND14  SAP098X.
      CNKIND15  SAP098X.   CNKIND16  SAP098X.   CNKIND17  SAP098X.
      CNKIND18  SAP098X.   CNKIND19  SAP098X.   CNKIND20  SAP098X.
      CNKIND21  SAP098X.   CNKIND22  SAP098X.   CNKIND23  SAP098X.
      CNKIND24  SAP098X.   CNKIND25  SAP098X.   CNKIND26  SAP098X.
      CNKIND27  SAP098X.   CNKIND28  SAP098X.   CNKIND29  SAP098X.
      CNKIND30  SAP098X.   CNKIND31  SAP098X.   CANAGE1   SAP079X.
      CANAGE2   SAP079X.   CANAGE3   SAP079X.   CANAGE4   SAP079X.
      CANAGE5   SAP079X.   CANAGE6   SAP079X.   CANAGE7   SAP079X.
      CANAGE8   SAP079X.   CANAGE9   SAP079X.   CANAGE10  SAP079X.
      CANAGE11  SAP079X.   CANAGE12  SAP079X.   CANAGE13  SAP079X.
      CANAGE14  SAP079X.   CANAGE15  SAP079X.   CANAGE16  SAP079X.
      CANAGE17  SAP079X.   CANAGE18  SAP079X.   CANAGE19  SAP079X.
      CANAGE20  SAP079X.   CANAGE21  SAP079X.   CANAGE22  SAP079X.
      CANAGE23  SAP079X.   CANAGE24  SAP079X.   CANAGE25  SAP079X.
      CANAGE26  SAP079X.   CANAGE27  SAP079X.   CANAGE28  SAP079X.
      CANAGE29  SAP079X.   CANAGE30  SAP079X.   DIBEV     SAP159X.
      DIBPRE1   SAP027X.   DIBAGE    SAP079X.   DIFAGE2   SAP162X.
      INSLN     SAP027X.   DIBPILL   SAP027X.   EPILEP1   SAP027X.
      EPILEP2   SAP027X.   EPILEP3   SAP167X.   EPILEP4   SAP027X.
      EPILEP5   SAP169X.   AHAYFYR   SAP027X.   SINYR     SAP027X.
      CBRCHYR   SAP027X.   KIDWKYR   SAP027X.   LIVYR     SAP027X.
      DRMYR     SAP027X.   DRMBODY1  SAP098X.   DRMBODY2  SAP098X.
      DRMBODY3  SAP098X.   DRMBODY4  SAP098X.   DRMTRET   SAP027X.
      DRMWKREL  SAP027X.   DRMCJOB   SAP027X.   DRMLHJOB  SAP027X.
      INDSDR1   SAP028X.   INDSDR2   SAP028X.   OCCUPDR1  SAP030X.
      OCCUPDR2  SAP030X.   DRMWCCLM  SAP027X.   DRMWCBEN  SAP066X.
      DRMWKDAY  SAP093X.   DRMCHJOB  SAP027X.   JNTSYMP   SAP027X.
      JMTHP1    SAP098X.   JMTHP2    SAP098X.   JMTHP3    SAP098X.
      JMTHP4    SAP098X.   JMTHP5    SAP098X.   JMTHP6    SAP098X.
      JMTHP7    SAP098X.   JMTHP8    SAP098X.   JMTHP9    SAP098X.
      JMTHP10   SAP098X.   JMTHP11   SAP098X.   JMTHP12   SAP098X.
      JMTHP13   SAP098X.   JMTHP14   SAP098X.   JMTHP15   SAP098X.
      JMTHP16   SAP098X.   JMTHP17   SAP098X.   JNTCHR    SAP027X.
      JNTHP     SAP027X.   ARTH1     SAP027X.   ARTHLMT   SAP027X.
      CTSEVER   SAP027X.   CTSYR     SAP027X.   CTSAGE_P  SAP079X.
      CTSWKREL  SAP027X.   CTSCJOB   SAP027X.   CTSLHJOB  SAP027X.
      INDSTCT1  SAP028X.   INDSTCT2  SAP028X.   OCCUPCT1  SAP030X.
      OCCUPCT2  SAP030X.   CTSWCCLM  SAP027X.   CTSWCBEN  SAP066X.
      CTSWKDAY  SAP093X.   CTSCHJOB  SAP027X.   PAINECK   SAP027X.
      PAINLB    SAP027X.   PAINLEG   SAP027X.   PAINFACE  SAP027X.
      AMIGR     SAP027X.   ACOLD2W   SAP027X.   AINTIL2W  SAP027X.
      PREGNOW   SAP027X.   HRAIDNOW  SAP027X.   HRAIDEV   SAP027X.
      AHEARST1  SAP238X.   AVISION   SAP027X.   ABLIND    SAP027X.
      LUPPRT    SAP027X.   SAD       SAP242X.   NERVOUS   SAP242X.
      RESTLESS  SAP242X.   HOPELESS  SAP242X.   EFFORT    SAP242X.
      WORTHLS   SAP242X.   MHAMTMO   SAP248X.

      /* AHS FORMAT ASSOCIATIONS */

      WKDAYR    SAP093X.   BEDDAYR   SAP093X.   AHSTATYR  SAP081X.
      SPECEQ    SAP027X.   FLWALK    SAP253X.   FLCLIMB   SAP253X.
      FLSTAND   SAP253X.   FLSIT     SAP253X.   FLSTOOP   SAP253X.
      FLREACH   SAP253X.   FLGRASP   SAP253X.   FLCARRY   SAP253X.
      FLPUSH    SAP253X.   FLSHOP    SAP253X.   FLSOCL    SAP253X.
      FLRELAX   SAP253X.   FLA1AR    SAP265X.   AFLHCA1   SAP098X.
      AFLHCA2   SAP098X.   AFLHCA3   SAP098X.   AFLHCA4   SAP098X.
      AFLHCA5   SAP098X.   AFLHCA6   SAP098X.   AFLHCA7   SAP098X.
      AFLHCA8   SAP098X.   AFLHCA9   SAP098X.   AFLHCA10  SAP098X.
      AFLHCA11  SAP098X.   AFLHCA12  SAP098X.   AFLHCA13  SAP098X.
      AFLHCA14  SAP098X.   AFLHCA15  SAP098X.   AFLHCA16  SAP098X.
      AFLHCA17  SAP098X.   AFLHCA18  SAP098X.   AFLHC19_  SAP098X.
      AFLHC20_  SAP098X.   AFLHC21_  SAP098X.   AFLHC22_  SAP098X.
      AFLHC23_  SAP098X.   AFLHC24_  SAP098X.   AFLHC25_  SAP098X.
      AFLHC26_  SAP098X.   AFLHC27_  SAP098X.   AFLHC28_  SAP098X.
      AFLHC29_  SAP098X.   AFLHC30_  SAP098X.   AFLHC31_  SAP098X.
      AFLHC32_  SAP098X.   AFLHC33_  SAP098X.   AFLHC34_  SAP098X.
      AFLHCA90  SAP098X.   AFLHCA91  SAP098X.   ALTIME1   SAP302X.
      ALUNIT1   SAP303X.   ALDURA1   SAP304X.   ALDURB1   SAP305X.
      ALCHRC1   SAP306X.   ALTIME2   SAP302X.   ALUNIT2   SAP303X.
      ALDURA2   SAP304X.   ALDURB2   SAP305X.   ALCHRC2   SAP306X.
      ALTIME3   SAP302X.   ALUNIT3   SAP303X.   ALDURA3   SAP304X.
      ALDURB3   SAP305X.   ALCHRC3   SAP306X.   ALTIME4   SAP302X.
      ALUNIT4   SAP303X.   ALDURA4   SAP304X.   ALDURB4   SAP305X.
      ALCHRC4   SAP306X.   ALTIME5   SAP302X.   ALUNIT5   SAP303X.
      ALDURA5   SAP304X.   ALDURB5   SAP305X.   ALCHRC5   SAP306X.
      ALTIME6   SAP302X.   ALUNIT6   SAP303X.   ALDURA6   SAP304X.
      ALDURB6   SAP305X.   ALCHRC6   SAP306X.   ALTIME7   SAP302X.
      ALUNIT7   SAP303X.   ALDURA7   SAP304X.   ALDURB7   SAP305X.
      ALCHRC7   SAP306X.   ALTIME8   SAP302X.   ALUNIT8   SAP303X.
      ALDURA8   SAP304X.   ALDURB8   SAP305X.   ALCHRC8   SAP306X.
      ALTIME9   SAP302X.   ALUNIT9   SAP303X.   ALDURA9   SAP304X.
      ALDURB9   SAP305X.   ALCHRC9   SAP306X.   ALTIME10  SAP302X.
      ALUNIT10  SAP303X.   ALDURA10  SAP304X.   ALDURB10  SAP305X.
      ALCHRC10  SAP306X.   ALTIME11  SAP302X.   ALUNIT11  SAP303X.
      ALDURA11  SAP304X.   ALDURB11  SAP305X.   ALCHRC11  SAP306X.
      ALTIME12  SAP302X.   ALUNIT12  SAP303X.   ALDURA12  SAP304X.
      ALDURB12  SAP305X.   ALCHRC12  SAP306X.   ALTIME13  SAP302X.
      ALUNIT13  SAP303X.   ALDURA13  SAP304X.   ALDURB13  SAP305X.
      ALCHRC13  SAP306X.   ALTIME14  SAP302X.   ALUNIT14  SAP303X.
      ALDURA14  SAP304X.   ALDURB14  SAP305X.   ALCHRC14  SAP306X.
      ALTIME15  SAP302X.   ALUNIT15  SAP303X.   ALDURA15  SAP304X.
      ALDURB15  SAP305X.   ALCHRC15  SAP306X.   ALTIME16  SAP302X.
      ALUNIT16  SAP303X.   ALDURA16  SAP304X.   ALDURB16  SAP305X.
      ALCHRC16  SAP306X.   ALTIME17  SAP302X.   ALUNIT17  SAP303X.
      ALDURA17  SAP304X.   ALDURB17  SAP305X.   ALCHRC17  SAP306X.
      ALTIME18  SAP302X.   ALUNIT18  SAP303X.   ALDURA18  SAP304X.
      ALDURB18  SAP305X.   ALCHRC18  SAP306X.   ALTIME19  SAP302X.
      ALUNIT19  SAP303X.   ALDURA19  SAP304X.   ALDURB19  SAP305X.
      ALCHRC19  SAP306X.   ALTIME20  SAP302X.   ALUNIT20  SAP303X.
      ALDURA20  SAP304X.   ALDURB20  SAP305X.   ALCHRC20  SAP306X.
      ALTIME21  SAP302X.   ALUNIT21  SAP303X.   ALDURA21  SAP304X.
      ALDURB21  SAP305X.   ALCHRC21  SAP306X.   ALTIME22  SAP302X.
      ALUNIT22  SAP303X.   ALDURA22  SAP304X.   ALDURB22  SAP305X.
      ALCHRC22  SAP306X.   ALTIME23  SAP302X.   ALUNIT23  SAP303X.
      ALDURA23  SAP304X.   ALDURB23  SAP305X.   ALCHRC23  SAP306X.
      ALTIME24  SAP302X.   ALUNIT24  SAP303X.   ALDURA24  SAP304X.
      ALDURB24  SAP305X.   ALCHRC24  SAP306X.   ALTIME25  SAP302X.
      ALUNIT25  SAP303X.   ALDURA25  SAP304X.   ALDURB25  SAP305X.
      ALCHRC25  SAP306X.   ALTIME26  SAP302X.   ALUNIT26  SAP303X.
      ALDURA26  SAP304X.   ALDURB26  SAP305X.   ALCHRC26  SAP306X.
      ALTIME27  SAP302X.   ALUNIT27  SAP303X.   ALDURA27  SAP304X.
      ALDURB27  SAP305X.   ALCHRC27  SAP306X.   ALTIME28  SAP302X.
      ALUNIT28  SAP303X.   ALDURA28  SAP304X.   ALDURB28  SAP305X.
      ALCHRC28  SAP306X.   ALTIME29  SAP302X.   ALUNIT29  SAP303X.
      ALDURA29  SAP304X.   ALDURB29  SAP305X.   ALCHRC29  SAP306X.
      ALTIME30  SAP302X.   ALUNIT30  SAP303X.   ALDURA30  SAP304X.
      ALDURB30  SAP305X.   ALCHRC30  SAP306X.   ALTIME31  SAP302X.
      ALUNIT31  SAP303X.   ALDURA31  SAP304X.   ALDURB31  SAP305X.
      ALCHRC31  SAP306X.   ALTIME32  SAP302X.   ALUNIT32  SAP303X.
      ALDURA32  SAP304X.   ALDURB32  SAP305X.   ALCHRC32  SAP306X.
      ALTIME33  SAP302X.   ALUNIT33  SAP303X.   ALDURA33  SAP304X.
      ALDURB33  SAP305X.   ALCHRC33  SAP306X.   ALTIME34  SAP302X.
      ALUNIT34  SAP303X.   ALDURA34  SAP304X.   ALDURB34  SAP305X.
      ALCHRC34  SAP306X.   ALTIME90  SAP302X.   ALUNIT90  SAP303X.
      ALDURA90  SAP304X.   ALDURB90  SAP305X.   ALCHRC90  SAP306X.
      ALTIME91  SAP302X.   ALUNIT91  SAP303X.   ALDURA91  SAP304X.
      ALDURB91  SAP305X.   ALCHRC91  SAP306X.   ALCNDRT   SAP482X.
      ALCHRONR  SAP483X.

      /* AHB FORMAT ASSOCIATIONS */

      SMKEV     SAP027X.   SMKREG    SAP485X.   SMKNOW    SAP486X.
      SMKSTAT2  SAP487X.   SMKQTNO   SAP488X.   SMKQTTP   SAP489X.
      SMKQTY    SAP490X.   CIGSDA1   SAP491X.   CIGDAMO   SAP492X.
      CIGSDA2   SAP491X.   CIGSDAY   SAP491X.   CIGQTYR   SAP027X.
      VIGNO     SAP496X.   VIGTP     SAP497X.   VIGFREQW  SAP498X.
      VIGLNGNO  SAP499X.   VIGLNGTP  SAP500X.   VIGMIN    SAP499X.
      MODNO     SAP496X.   MODTP     SAP497X.   MODFREQW  SAP504X.
      MODLNGNO  SAP499X.   MODLNGTP  SAP500X.   MODMIN    SAP499X.
      STRNGNO   SAP496X.   STRNGTP   SAP497X.   STRFREQW  SAP510X.
      ALC1YR    SAP027X.   ALCLIFE   SAP027X.   ALC12MNO  SAP513X.
      ALC12MTP  SAP514X.   ALC12MWK  SAP515X.   ALC12MYR  SAP516X.
      ALCAMT    SAP517X.   ALCSTAT   SAP518X.   ALC5UPNO  SAP516X.
      ALC5UPTP  SAP520X.   ALC5UPYR  SAP516X.   AHEIGHT   SAP522X.
      AWEIGHTP  SAP523X.   BMI       SAP524X.   SLEEP     SAP525X.

      /* AAU FORMAT ASSOCIATIONS */

      AUSUALPL  SAP526X.   APLKIND   SAP527X.   AHCPLROU  SAP027X.
      AHCPLKND  SAP529X.   AHCCHGYR  SAP027X.   AHCCHGHI  SAP027X.
      AHCDLYR1  SAP027X.   AHCDLYR2  SAP027X.   AHCDLYR3  SAP027X.
      AHCDLYR4  SAP027X.   AHCDLYR5  SAP027X.   AHCAFYR1  SAP027X.
      AHCAFYR2  SAP027X.   AHCAFYR3  SAP027X.   AHCAFYR4  SAP027X.
      ADNLONG2  SAP541X.   AHCSYR1   SAP027X.   AHCSYR2   SAP027X.
      AHCSYR3   SAP027X.   AHCSYR4   SAP027X.   AHCSYR5   SAP027X.
      AHCSYR6   SAP027X.   AHCSYR7   SAP027X.   AHCSYR8   SAP027X.
      AHCSYR9   SAP027X.   AHCSYR10  SAP027X.   AHERNOY2  SAP552X.
      AHCHYR    SAP027X.   AHCHMOYR  SAP525X.   AHCHNOY2  SAP555X.
      AHCNOYR2  SAP552X.   ASRGYR    SAP027X.   ASRGNOYR  SAP558X.
      AMDLONGR  SAP541X.   AH1N1_1   SAP027X.   AH1N1_3M  SAP561X.
      AH1N1_4Y  SAP562X.   AH1N1_5   SAP563X.   SHTFLUYR  SAP027X.
      ASHFLU_M  SAP561X.   ASHFLU_Y  SAP562X.   SPRFLUYR  SAP027X.
      ASPFLU_M  SAP561X.   ASPFLU_Y  SAP562X.   SHTFLU2   SAP027X.
      ASHFLUM2  SAP561X.   ASHFLUY2  SAP562X.   SPRFLU2   SAP027X.
      ASPFLUM2  SAP561X.   ASPFLUY2  SAP562X.   SHTPNUYR  SAP027X.
      APOX      SAP027X.   APOX12MO  SAP027X.   AHEP      SAP027X.
      AHEPLIV   SAP027X.   SHTHEPB   SAP027X.   SHEPDOS   SAP582X.
      SHTHEPA   SAP027X.   SHEPANUM  SAP584X.   SHINGLES  SAP027X.
      SHTTD     SAP027X.   SHTTD05   SAP027X.   SHTTDAP   SAP588X.
      LIVEV     SAP027X.   TRAVEL    SAP027X.   WRKHLTH   SAP027X.
      WRKDIR    SAP027X.

      /* ADS FORMAT ASSOCIATIONS */

      BLDGV     SAP027X.   BLDG12M   SAP027X.   HIVTST    SAP027X.
      WHYTST_R  SAP596X.   TST12M_M  SAP597X.   TST12M_Y  SAP598X.
      TIMETST   SAP599X.   REATST_C  SAP600X.   REASWHOR  SAP601X.
      LASTST_C  SAP602X.   CLNTYP_C  SAP603X.   WHOADM    SAP604X.
      GIVNAM    SAP027X.   EXTST12M  SAP027X.   CHNSADSP  SAP607X.
      STMTRU    SAP608X.   STD       SAP027X.   STDDOC    SAP027X.
      STDWHER   SAP611X.   TBHRD     SAP027X.   TBKNOW    SAP027X.
      TB        SAP614X.   TBSPRD1   SAP098X.   TBSPRD2   SAP098X.
      TBSPRD3   SAP098X.   TBSPRD4   SAP098X.   TBSPRD5   SAP098X.
      TBSPRD6   SAP098X.   TBCURED   SAP027X.   TBCHANC   SAP622X.
      TBSHAME   SAP027X.   HOMELESS  SAP027X.;
RUN;

PROC CONTENTS DATA=NHIS.SAMADULT;
   TITLE1 'CONTENTS OF THE 2010 NHIS Sample Adult FILE';

PROC FREQ DATA=NHIS.SAMADULT NOTITLE;
   TABLES RECTYPE/LIST MISSING;
   TITLE1 'FREQUENCY REPORT FOR 2010 NHIS Sample Adult FILE';
   TITLE2 '(WEIGHTED)';
   WEIGHT WTFA_SA;

PROC FREQ DATA=NHIS.SAMADULT NOTITLE;
   TABLES RECTYPE/LIST MISSING;
   TITLE1 'FREQUENCY REPORT FOR 2010 NHIS Sample Adult FILE';
   TITLE2 '(UNWEIGHTED)';

* USER NOTE: TO SEE UNFORMATTED VALUES IN PROCEDURES, ADD THE
             STATEMENT: FORMAT _ALL_;
RUN;
