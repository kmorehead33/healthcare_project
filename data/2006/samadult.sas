*********************************************************************
 JUNE 22, 2007  8:27 AM
 
 This is an example of a SAS program that creates a SAS
 file from the 2006 NHIS Public Use SAMADULT.DAT ASCII file
 
 This is stored in SAMADULT.SAS
*********************************************************************;

* USER NOTE: PLACE NEXT STATEMENT IN SUBSEQUENT PROGRAMS;
LIBNAME  NHIS     "C:\NHIS2006";

* USER NOTE: PLACE NEXT STATEMENT IN SUBSEQUENT PROGRAMS
             IF YOU ALLOW PROGRAM TO PERMANENTLY STORE FORMATS;
LIBNAME  LIBRARY  "C:\NHIS2006";

FILENAME ASCIIDAT 'C:\NHIS2006\SAMADULT.dat';

* DEFINE VARIABLE VALUES FOR REPORTS;

*  USE THE STATEMENT "PROC FORMAT LIBRARY=LIBRARY"
     TO PERMANENTLY STORE THE FORMAT DEFINITIONS;

*  USE THE STATEMENT "PROC FORMAT" IF YOU DO NOT WISH
      TO PERMANENTLY STORE THE FORMATS;

PROC FORMAT LIBRARY=LIBRARY;
*PROC FORMAT;

   VALUE $GROUPC
      ' '< - HIGH   = "All Values"
   ;
   VALUE GROUPN
      LOW - HIGH   = "All Values"
   ;
   VALUE SAP001X
      10                 = "10 Household"
      20                 = "20 Person"
      30                 = "30 Sample Adult"
      31                 = "31 Sample Adult Cancer"
      40                 = "40 Sample Child"
      60                 = "60 Family"
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
      4                  = "4 Working, but not for pay, at a job or business"
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
   VALUE SAP046X
      1                  = "1 Advise them to drive to the hospital"
      2                  = "2 Advise them to call their physician"
      3                  = "3 Call 9-1-1 (or another emergency number)"
      4                  = "4 Call spouse or family member"
      5                  = "5 Other"
      7                  = "7 Refused"
      8                  = "8 Not ascertained"
      9                  = "9 Don't know"
   ;
   VALUE SAP054X
      1                  = "1 Mentioned"
      2                  = "2 Not mentioned"
      7                  = "7 Refused"
      8                  = "8 Not ascertained"
      9                  = "9 Don't know"
   ;
   VALUE SAP085X
      85                 = "85 85+ years"
      97                 = "97 Refused"
      98                 = "98 Not ascertained"
      99                 = "99 Don't know"
   ;
   VALUE SAP115X
      1                  = "1 Yes"
      2                  = "2 No"
      3                  = "3 Borderline"
      7                  = "7 Refused"
      8                  = "8 Not ascertained"
      9                  = "9 Don't know"
   ;
   VALUE SAP117X
      00                 = "00 Within past year"
      85                 = "85 85+ years"
      96                 = "96 1+ year(s) with diabetes and age is 85+"
      97                 = "97 Refused"
      98                 = "98 Not ascertained"
      99                 = "99 Don't know"
   ;
   VALUE SAP125X
      1                  = "1 Yes"
      2                  = "2 No"
      3                  = "3 Never been pregnant"
      7                  = "7 Refused"
      8                  = "8 Not ascertained"
      9                  = "9 Don't know"
   ;
   VALUE SAP126X
      997                = "997 Refused"
      998                = "998 Not ascertained"
      999                = "999 Don't know"
   ;
   VALUE SAP154X
      97                 = "97 Refused"
      98                 = "98 Not ascertained"
      99                 = "99 Don't know"
   ;
   VALUE SAP172X
      1                  = "1 Good"
      2                  = "2 A little trouble"
      3                  = "3 A lot of trouble"
      4                  = "4 Deaf"
      7                  = "7 Refused"
      8                  = "8 Not ascertained"
      9                  = "9 Don't know"
   ;
   VALUE SAP176X
      1                  = "1 ALL of the time"
      2                  = "2 MOST of the time"
      3                  = "3 SOME of the time"
      4                  = "4 A LITTLE of the time"
      5                  = "5 NONE of the time"
      7                  = "7 Refused"
      8                  = "8 Not ascertained"
      9                  = "9 Don't know"
   ;
   VALUE SAP182X
      1                  = "1 A lot"
      2                  = "2 Some"
      3                  = "3 A little"
      4                  = "4 Not at all"
      7                  = "7 Refused"
      8                  = "8 Not ascertained"
      9                  = "9 Don't know"
   ;
   VALUE SAP189X
      0                  = "0 Had job last week"
      1                  = "1 No job last week, had job past 12 m"
      2                  = "2 No job last week, no job past 12 m"
      3                  = "3 Never worked"
      7                  = "7 Refused"
      8                  = "8 Not ascertained"
      9                  = "9 Don't know"
   ;
   VALUE SAP190X
      000                = "000 None"
      997                = "997 Refused"
      998                = "998 Not ascertained"
      999                = "999 Don't know"
   ;
   VALUE SAP192X
      1                  = "1 Better"
      2                  = "2 Worse"
      3                  = "3 About the same"
      7                  = "7 Refused"
      8                  = "8 Not ascertained"
      9                  = "9 Don't know"
   ;
   VALUE SAP194X
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
   VALUE SAP206X
      1                  = "1 Limited in any way"
      2                  = "2 Not limited in any way"
      3                  = "3 Unknown if limited"
   ;
   VALUE SAP243X
      95                 = "95 95+"
      96                 = "96 Since birth"
      97                 = "97 Refused"
      98                 = "98 Not ascertained"
      99                 = "99 Don't know"
   ;
   VALUE SAP244X
      1                  = "1 Day(s)"
      2                  = "2 Week(s)"
      3                  = "3 Month(s)"
      4                  = "4 Year(s)"
      6                  = "6 Since birth"
      7                  = "7 Refused"
      8                  = "8 Not ascertained"
      9                  = "9 Don't know"
   ;
   VALUE SAP245X
      00                 = "00 Less than 1 year"
      85                 = "85 85+ years"
      96                 = "96 Unknown number of years"
      97                 = "97 Refused"
      98                 = "98 Not ascertained"
      99                 = "99 Don't know"
   ;
   VALUE SAP246X
      1                  = "1 Less than 3 months"
      2                  = "2 3-5 months"
      3                  = "3 6-12 months"
      4                  = "4 More than 1 year"
      7                  = "7 Refused"
      8                  = "8 Not ascertained"
      9                  = "9 Don't know"
   ;
   VALUE SAP247X
      1                  = "1 Chronic"
      2                  = "2 Not chronic"
      9                  = "9 Unknown if chronic"
   ;
   VALUE SAP423X
      1                  = "1 At least one chronic cond causes functl lim"
      2                  = "2 No chronic cond causes functl lim"
      9                  = "9 Unk if any chronic cond causes functl lim"
   ;
   VALUE SAP424X
      0                  = "0 Not limited in any way (incl unk if limited)"
      1                  = "1 Limited; caused by at least one chronic cond"
      2                  = "2 Limited; not caused by chronic cond"
      3                  = "3 Limited; unk if cond is chronic"
   ;
   VALUE SAP426X
      85                 = "85 85 years or older"
      96                 = "96 Never smoked regularly"
      97                 = "97 Refused"
      98                 = "98 Not ascertained"
      99                 = "99 Don't know"
   ;
   VALUE SAP427X
      1                  = "1 Every day"
      2                  = "2 Some days"
      3                  = "3 Not at all"
      7                  = "7 Refused"
      8                  = "8 Not ascertained"
      9                  = "9 Don't know"
   ;
   VALUE SAP428X
      1                  = "1 Current every day smoker"
      2                  = "2 Current some day smoker"
      3                  = "3 Former smoker"
      4                  = "4 Never smoker"
      5                  = "5 Smoker, current status unknown"
      9                  = "9 Unknown if ever smoked"
   ;
   VALUE SAP429X
      95                 = "95 95+"
      97                 = "97 Refused"
      98                 = "98 Not ascertained"
      99                 = "99 Don't know"
   ;
   VALUE SAP430X
      1                  = "1 Day(s)"
      2                  = "2 Week(s)"
      3                  = "3 Month(s)"
      4                  = "4 Year(s)"
      7                  = "7 Refused"
      8                  = "8 Not ascertained"
      9                  = "9 Don't know"
   ;
   VALUE SAP431X
      00                 = "00 Less than 1 year"
      70                 = "70 70+ years"
      97                 = "97 Refused"
      98                 = "98 Not ascertained"
      99                 = "99 Don't know"
   ;
   VALUE SAP432X
      95                 = "95 95+ cigarettes"
      97                 = "97 Refused"
      98                 = "98 Not ascertained"
      99                 = "99 Don't know"
   ;
   VALUE SAP433X
      00                 = "00 None"
      97                 = "97 Refused"
      98                 = "98 Not ascertained"
      99                 = "99 Don't know"
   ;
   VALUE SAP437X
      000                = "000 Never"
      996                = "996 Unable to do this type activity"
      997                = "997 Refused"
      998                = "998 Not ascertained"
      999                = "999 Don't know"
   ;
   VALUE SAP438X
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
   VALUE SAP439X
      00                 = "00 Less than once per week"
      95                 = "95 Never"
      96                 = "96 Unable to do vigorous activity"
      97                 = "97 Refused"
      98                 = "98 Not ascertained"
      99                 = "99 Don't know"
   ;
   VALUE SAP441X
      1                  = "1 Minutes"
      2                  = "2 Hours"
      7                  = "7 Refused"
      8                  = "8 Not ascertained"
      9                  = "9 Don't know"
   ;
   VALUE SAP445X
      00                 = "00 Less than once per week"
      95                 = "95 Never"
      96                 = "96 Unable to do light or moderate activity"
      97                 = "97 Refused"
      98                 = "98 Not ascertained"
      99                 = "99 Don't know"
   ;
   VALUE SAP451X
      00                 = "00 Less than once per week"
      95                 = "95 Never"
      96                 = "96 Unable to do strength activity"
      97                 = "97 Refused"
      98                 = "98 Not ascertained"
      99                 = "99 Don't know"
   ;
   VALUE SAP454X
      000                = "000 Never"
      997                = "997 Refused"
      998                = "998 Not ascertained"
      999                = "999 Don't know"
   ;
   VALUE SAP455X
      0                  = "0 Never/None"
      1                  = "1 Week"
      2                  = "2 Month"
      3                  = "3 Year"
      7                  = "7 Refused"
      8                  = "8 Not ascertained"
      9                  = "9 Don't know"
   ;
   VALUE SAP456X
      00                 = "00 Less than one day per week"
      95                 = "95 Did not drink in past year"
      97                 = "97 Refused"
      98                 = "98 Not ascertained"
      99                 = "99 Don't know"
   ;
   VALUE SAP457X
      000                = "000 Never/none"
      997                = "997 Refused"
      998                = "998 Not ascertained"
      999                = "999 Don't know"
   ;
   VALUE SAP458X
      95                 = "95 95+ drinks"
      97                 = "97 Refused"
      98                 = "98 Not ascertained"
      99                 = "99 Don't know"
   ;
   VALUE SAP459X
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
   VALUE SAP461X
      0                  = "0 Never/None"
      1                  = "1 Per week"
      2                  = "2 Per month"
      3                  = "3 Per year"
      7                  = "7 Refused"
      8                  = "8 Not ascertained"
      9                  = "9 Don't know"
   ;
   VALUE SAP463X
      96                 = "96 Not available"
      97                 = "97 Refused"
      98                 = "98 Not ascertained"
      99                 = "99 Don't know"
   ;
   VALUE SAP464X
      996                = "996 Not available"
      997                = "997 Refused"
      998                = "998 Not ascertained"
      999                = "999 Don't know"
   ;
   VALUE SAP465X
      99.95              = "99.95 99.95+"
      99.99              = "99.99 Unknown"
   ;
   VALUE SAP467X
      1                  = "1 Yes"
      2                  = "2 There is NO place"
      3                  = "3 There is MORE THAN ONE place"
      7                  = "7 Refused"
      8                  = "8 Not ascertained"
      9                  = "9 Don't know"
   ;
   VALUE SAP468X
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
   VALUE SAP470X
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
   VALUE SAP482X
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
   VALUE SAP493X
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
   VALUE SAP496X
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
   VALUE SAP499X
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
   VALUE SAP517X
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
   VALUE SAP518X
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
   VALUE SAP519X
      9996               = "9996 Time period format"
      9997               = "9997 Refused"
      9998               = "9998 Not ascertained"
      9999               = "9999 Don't know"
   ;
   VALUE SAP520X
      1                  = "1 6 months or less"
      2                  = "2 More than 6 months but not more than 1 year ago"
      3                  = "3 More than 1 year, but not more than 2 years ago"
      4                  = "4 More than 2 years, but not more than 5 years ago"
      5                  = "5 More than 5 years ago"
      7                  = "7 Refused"
      8                  = "8 Not ascertained"
      9                  = "9 Don't know"
   ;
   VALUE SAP521X
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
   VALUE SAP522X
      1                  = "1 Doctor, nurse or other health care professional"
      2                  = "2 Sex partner"
      3                  = "3 Someone at health department"
      4                  = "4 Family member or friend"
      5                  = "5 Other"
      7                  = "7 Refused"
      8                  = "8 Not ascertained"
      9                  = "9 Don't know"
   ;
   VALUE SAP523X
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
   VALUE SAP524X
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
   VALUE SAP525X
      1                  = "1 Nurse or health worker"
      2                  = "2 Self-sampling kit"
      7                  = "7 Refused"
      8                  = "8 Not ascertained"
      9                  = "9 Don't know"
   ;
   VALUE SAP528X
      1                  = "1 High/Already have HIV/AIDS"
      2                  = "2 Medium"
      3                  = "3 Low"
      4                  = "4 None"
      7                  = "7 Refused"
      8                  = "8 Not ascertained"
      9                  = "9 Don't know"
   ;
   VALUE SAP529X
      1                  = "1 Yes, at least one statement is true"
      2                  = "2 No, none of these statements are true"
      7                  = "7 Refused"
      8                  = "8 Not ascertained"
      9                  = "9 Don't know"
   ;
   VALUE SAP532X
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
   VALUE SAP535X
      1                  = "1 A lot"
      2                  = "2 Some"
      3                  = "3 A little"
      4                  = "4 Nothing"
      7                  = "7 Refused"
      8                  = "8 Not ascertained"
      9                  = "9 Don't know"
   ;
   VALUE SAP543X
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
   INFILE ASCIIDAT PAD LRECL=759;

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
      ASTDO      3   AASMEV     3   AASSTILL   3   AASMYR     3
      AASMERYR   3   ULCEV      3   ULCYR      3   CANEV      3
      CNKIND1    3   CNKIND2    3   CNKIND3    3   CNKIND4    3
      CNKIND5    3   CNKIND6    3   CNKIND7    3   CNKIND8    3
      CNKIND9    3   CNKIND10   3   CNKIND11   3   CNKIND12   3
      CNKIND13   3   CNKIND14   3   CNKIND15   3   CNKIND16   3
      CNKIND17   3   CNKIND18   3   CNKIND19   3   CNKIND20   3
      CNKIND21   3   CNKIND22   3   CNKIND23   3   CNKIND24   3
      CNKIND25   3   CNKIND26   3   CNKIND27   3   CNKIND28   3
      CNKIND29   3   CNKIND30   3   CNKIND31   3   CANAGE1    3
      CANAGE2    3   CANAGE3    3   CANAGE4    3   CANAGE5    3
      CANAGE6    3   CANAGE7    3   CANAGE8    3   CANAGE9    3
      CANAGE10   3   CANAGE11   3   CANAGE12   3   CANAGE13   3
      CANAGE14   3   CANAGE15   3   CANAGE16   3   CANAGE17   3
      CANAGE18   3   CANAGE19   3   CANAGE20   3   CANAGE21   3
      CANAGE22   3   CANAGE23   3   CANAGE24   3   CANAGE25   3
      CANAGE26   3   CANAGE27   3   CANAGE28   3   CANAGE29   3
      CANAGE30   3   DIBEV      3   DIBAGE     3   DIFAGE2    3
      DIBPRE     3   DIBIFG     3   DIBIGT     3   DIBBORD    3
      DIBHBS     3   INSLN      3   DIBPILL    3   GDM        3
      GDMAGE     4   GDM_O      3   GDM_OAGE   4   DIBBTST    3
      DIBRISK    3   AHAYFYR    3   SINYR      3   CBRCHYR    3
      KIDWKYR    3   LIVYR      3   JNTSYMP    3   JMTHP1     3
      JMTHP2     3   JMTHP3     3   JMTHP4     3   JMTHP5     3
      JMTHP6     3   JMTHP7     3   JMTHP8     3   JMTHP9     3
      JMTHP10    3   JMTHP11    3   JMTHP12    3   JMTHP13    3
      JMTHP14    3   JMTHP15    3   JMTHP16    3   JMTHP17    3
      JNTPN      3   JNTCHR     3   JNTHP      3   ARTH1      3
      ARTHWT     3   ARTHPH     3   ARTHCLS    3   ARTHLMT    3
      ARTHWRK    3   PAINECK    3   PAINLB     3   PAINLEG    3
      PAINFACE   3   AMIGR      3   ACOLD2W    3   AINTIL2W   3
      PREGNOW    3   HEARAID    3   AHEARST    3   AVISION    3
      ABLIND     3   LUPPRT     3   SAD        3   NERVOUS    3
      RESTLESS   3   HOPELESS   3   EFFORT     3   WORTHLS    3
      MHAMTMO    3   HPWTYR     3   HPPAYR     3   HPDIETYR   3
      SMWTYR     3   SMPAYR     3   SMDIETYR   3

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
      AHEPLIV    3   SHTHEPB    3   SHEPDOS    3

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
      ASTDO        84 -  84    AASMEV       85 -  85
      AASSTILL     86 -  86    AASMYR       87 -  87
      AASMERYR     88 -  88    ULCEV        89 -  89
      ULCYR        90 -  90    CANEV        91 -  91
      CNKIND1      92 -  92    CNKIND2      93 -  93
      CNKIND3      94 -  94    CNKIND4      95 -  95
      CNKIND5      96 -  96    CNKIND6      97 -  97
      CNKIND7      98 -  98    CNKIND8      99 -  99
      CNKIND9     100 - 100    CNKIND10    101 - 101
      CNKIND11    102 - 102    CNKIND12    103 - 103
      CNKIND13    104 - 104    CNKIND14    105 - 105
      CNKIND15    106 - 106    CNKIND16    107 - 107
      CNKIND17    108 - 108    CNKIND18    109 - 109
      CNKIND19    110 - 110    CNKIND20    111 - 111
      CNKIND21    112 - 112    CNKIND22    113 - 113
      CNKIND23    114 - 114    CNKIND24    115 - 115
      CNKIND25    116 - 116    CNKIND26    117 - 117
      CNKIND27    118 - 118    CNKIND28    119 - 119
      CNKIND29    120 - 120    CNKIND30    121 - 121
      CNKIND31    122 - 122    CANAGE1     123 - 124
      CANAGE2     125 - 126    CANAGE3     127 - 128
      CANAGE4     129 - 130    CANAGE5     131 - 132
      CANAGE6     133 - 134    CANAGE7     135 - 136
      CANAGE8     137 - 138    CANAGE9     139 - 140
      CANAGE10    141 - 142    CANAGE11    143 - 144
      CANAGE12    145 - 146    CANAGE13    147 - 148
      CANAGE14    149 - 150    CANAGE15    151 - 152
      CANAGE16    153 - 154    CANAGE17    155 - 156
      CANAGE18    157 - 158    CANAGE19    159 - 160
      CANAGE20    161 - 162    CANAGE21    163 - 164
      CANAGE22    165 - 166    CANAGE23    167 - 168
      CANAGE24    169 - 170    CANAGE25    171 - 172
      CANAGE26    173 - 174    CANAGE27    175 - 176
      CANAGE28    177 - 178    CANAGE29    179 - 180
      CANAGE30    181 - 182    DIBEV       183 - 183
      DIBAGE      184 - 185    DIFAGE2     186 - 187
      DIBPRE      188 - 188    DIBIFG      189 - 189
      DIBIGT      190 - 190    DIBBORD     191 - 191
      DIBHBS      192 - 192    INSLN       193 - 193
      DIBPILL     194 - 194    GDM         195 - 195
      GDMAGE      196 - 198    GDM_O       199 - 199
      GDM_OAGE    200 - 202    DIBBTST     203 - 203
      DIBRISK     204 - 204    AHAYFYR     205 - 205
      SINYR       206 - 206    CBRCHYR     207 - 207
      KIDWKYR     208 - 208    LIVYR       209 - 209
      JNTSYMP     210 - 210    JMTHP1      211 - 211
      JMTHP2      212 - 212    JMTHP3      213 - 213
      JMTHP4      214 - 214    JMTHP5      215 - 215
      JMTHP6      216 - 216    JMTHP7      217 - 217
      JMTHP8      218 - 218    JMTHP9      219 - 219
      JMTHP10     220 - 220    JMTHP11     221 - 221
      JMTHP12     222 - 222    JMTHP13     223 - 223
      JMTHP14     224 - 224    JMTHP15     225 - 225
      JMTHP16     226 - 226    JMTHP17     227 - 227
      JNTPN       228 - 229    JNTCHR      230 - 230
      JNTHP       231 - 231    ARTH1       232 - 232
      ARTHWT      233 - 233    ARTHPH      234 - 234
      ARTHCLS     235 - 235    ARTHLMT     236 - 236
      ARTHWRK     237 - 237    PAINECK     238 - 238
      PAINLB      239 - 239    PAINLEG     240 - 240
      PAINFACE    241 - 241    AMIGR       242 - 242
      ACOLD2W     243 - 243    AINTIL2W    244 - 244
      PREGNOW     245 - 245    HEARAID     246 - 246
      AHEARST     247 - 247    AVISION     248 - 248
      ABLIND      249 - 249    LUPPRT      250 - 250
      SAD         251 - 251    NERVOUS     252 - 252
      RESTLESS    253 - 253    HOPELESS    254 - 254
      EFFORT      255 - 255    WORTHLS     256 - 256
      MHAMTMO     257 - 257    HPWTYR      258 - 258
      HPPAYR      259 - 259    HPDIETYR    260 - 260
      SMWTYR      261 - 261    SMPAYR      262 - 262
      SMDIETYR    263 - 263

      /* AHS LOCATIONS */

      WRKLYR3     264 - 264    WKDAYR      265 - 267
      BEDDAYR     268 - 270    AHSTATYR    271 - 271
      SPECEQ      272 - 272    FLWALK      273 - 273
      FLCLIMB     274 - 274    FLSTAND     275 - 275
      FLSIT       276 - 276    FLSTOOP     277 - 277
      FLREACH     278 - 278    FLGRASP     279 - 279
      FLCARRY     280 - 280    FLPUSH      281 - 281
      FLSHOP      282 - 282    FLSOCL      283 - 283
      FLRELAX     284 - 284    FLA1AR      285 - 285
      AFLHCA1     286 - 286    AFLHCA2     287 - 287
      AFLHCA3     288 - 288    AFLHCA4     289 - 289
      AFLHCA5     290 - 290    AFLHCA6     291 - 291
      AFLHCA7     292 - 292    AFLHCA8     293 - 293
      AFLHCA9     294 - 294    AFLHCA10    295 - 295
      AFLHCA11    296 - 296    AFLHCA12    297 - 297
      AFLHCA13    298 - 298    AFLHCA14    299 - 299
      AFLHCA15    300 - 300    AFLHCA16    301 - 301
      AFLHCA17    302 - 302    AFLHCA18    303 - 303
      AFLHC19_    304 - 304    AFLHC20_    305 - 305
      AFLHC21_    306 - 306    AFLHC22_    307 - 307
      AFLHC23_    308 - 308    AFLHC24_    309 - 309
      AFLHC25_    310 - 310    AFLHC26_    311 - 311
      AFLHC27_    312 - 312    AFLHC28_    313 - 313
      AFLHC29_    314 - 314    AFLHC30_    315 - 315
      AFLHC31_    316 - 316    AFLHC32_    317 - 317
      AFLHC33_    318 - 318    AFLHC34_    319 - 319
      AFLHCA90    320 - 320    AFLHCA91    321 - 321
      ALTIME1     322 - 323    ALUNIT1     324 - 324
      ALDURA1     325 - 326    ALDURB1     327 - 327
      ALCHRC1     328 - 328    ALTIME2     329 - 330
      ALUNIT2     331 - 331    ALDURA2     332 - 333
      ALDURB2     334 - 334    ALCHRC2     335 - 335
      ALTIME3     336 - 337    ALUNIT3     338 - 338
      ALDURA3     339 - 340    ALDURB3     341 - 341
      ALCHRC3     342 - 342    ALTIME4     343 - 344
      ALUNIT4     345 - 345    ALDURA4     346 - 347
      ALDURB4     348 - 348    ALCHRC4     349 - 349
      ALTIME5     350 - 351    ALUNIT5     352 - 352
      ALDURA5     353 - 354    ALDURB5     355 - 355
      ALCHRC5     356 - 356    ALTIME6     357 - 358
      ALUNIT6     359 - 359    ALDURA6     360 - 361
      ALDURB6     362 - 362    ALCHRC6     363 - 363
      ALTIME7     364 - 365    ALUNIT7     366 - 366
      ALDURA7     367 - 368    ALDURB7     369 - 369
      ALCHRC7     370 - 370    ALTIME8     371 - 372
      ALUNIT8     373 - 373    ALDURA8     374 - 375
      ALDURB8     376 - 376    ALCHRC8     377 - 377
      ALTIME9     378 - 379    ALUNIT9     380 - 380
      ALDURA9     381 - 382    ALDURB9     383 - 383
      ALCHRC9     384 - 384    ALTIME10    385 - 386
      ALUNIT10    387 - 387    ALDURA10    388 - 389
      ALDURB10    390 - 390    ALCHRC10    391 - 391
      ALTIME11    392 - 393    ALUNIT11    394 - 394
      ALDURA11    395 - 396    ALDURB11    397 - 397
      ALCHRC11    398 - 398    ALTIME12    399 - 400
      ALUNIT12    401 - 401    ALDURA12    402 - 403
      ALDURB12    404 - 404    ALCHRC12    405 - 405
      ALTIME13    406 - 407    ALUNIT13    408 - 408
      ALDURA13    409 - 410    ALDURB13    411 - 411
      ALCHRC13    412 - 412    ALTIME14    413 - 414
      ALUNIT14    415 - 415    ALDURA14    416 - 417
      ALDURB14    418 - 418    ALCHRC14    419 - 419
      ALTIME15    420 - 421    ALUNIT15    422 - 422
      ALDURA15    423 - 424    ALDURB15    425 - 425
      ALCHRC15    426 - 426    ALTIME16    427 - 428
      ALUNIT16    429 - 429    ALDURA16    430 - 431
      ALDURB16    432 - 432    ALCHRC16    433 - 433
      ALTIME17    434 - 435    ALUNIT17    436 - 436
      ALDURA17    437 - 438    ALDURB17    439 - 439
      ALCHRC17    440 - 440    ALTIME18    441 - 442
      ALUNIT18    443 - 443    ALDURA18    444 - 445
      ALDURB18    446 - 446    ALCHRC18    447 - 447
      ALTIME19    448 - 449    ALUNIT19    450 - 450
      ALDURA19    451 - 452    ALDURB19    453 - 453
      ALCHRC19    454 - 454    ALTIME20    455 - 456
      ALUNIT20    457 - 457    ALDURA20    458 - 459
      ALDURB20    460 - 460    ALCHRC20    461 - 461
      ALTIME21    462 - 463    ALUNIT21    464 - 464
      ALDURA21    465 - 466    ALDURB21    467 - 467
      ALCHRC21    468 - 468    ALTIME22    469 - 470
      ALUNIT22    471 - 471    ALDURA22    472 - 473
      ALDURB22    474 - 474    ALCHRC22    475 - 475
      ALTIME23    476 - 477    ALUNIT23    478 - 478
      ALDURA23    479 - 480    ALDURB23    481 - 481
      ALCHRC23    482 - 482    ALTIME24    483 - 484
      ALUNIT24    485 - 485    ALDURA24    486 - 487
      ALDURB24    488 - 488    ALCHRC24    489 - 489
      ALTIME25    490 - 491    ALUNIT25    492 - 492
      ALDURA25    493 - 494    ALDURB25    495 - 495
      ALCHRC25    496 - 496    ALTIME26    497 - 498
      ALUNIT26    499 - 499    ALDURA26    500 - 501
      ALDURB26    502 - 502    ALCHRC26    503 - 503
      ALTIME27    504 - 505    ALUNIT27    506 - 506
      ALDURA27    507 - 508    ALDURB27    509 - 509
      ALCHRC27    510 - 510    ALTIME28    511 - 512
      ALUNIT28    513 - 513    ALDURA28    514 - 515
      ALDURB28    516 - 516    ALCHRC28    517 - 517
      ALTIME29    518 - 519    ALUNIT29    520 - 520
      ALDURA29    521 - 522    ALDURB29    523 - 523
      ALCHRC29    524 - 524    ALTIME30    525 - 526
      ALUNIT30    527 - 527    ALDURA30    528 - 529
      ALDURB30    530 - 530    ALCHRC30    531 - 531
      ALTIME31    532 - 533    ALUNIT31    534 - 534
      ALDURA31    535 - 536    ALDURB31    537 - 537
      ALCHRC31    538 - 538    ALTIME32    539 - 540
      ALUNIT32    541 - 541    ALDURA32    542 - 543
      ALDURB32    544 - 544    ALCHRC32    545 - 545
      ALTIME33    546 - 547    ALUNIT33    548 - 548
      ALDURA33    549 - 550    ALDURB33    551 - 551
      ALCHRC33    552 - 552    ALTIME34    553 - 554
      ALUNIT34    555 - 555    ALDURA34    556 - 557
      ALDURB34    558 - 558    ALCHRC34    559 - 559
      ALTIME90    560 - 561    ALUNIT90    562 - 562
      ALDURA90    563 - 564    ALDURB90    565 - 565
      ALCHRC90    566 - 566    ALTIME91    567 - 568
      ALUNIT91    569 - 569    ALDURA91    570 - 571
      ALDURB91    572 - 572    ALCHRC91    573 - 573
      ALCNDRT     574 - 574    ALCHRONR    575 - 575


      /* AHB LOCATIONS */

      SMKEV       576 - 576    SMKREG      577 - 578
      SMKNOW      579 - 579    SMKSTAT2    580 - 580
      SMKQTNO     581 - 582    SMKQTTP     583 - 583
      SMKQTY      584 - 585    CIGSDA1     586 - 587
      CIGDAMO     588 - 589    CIGSDA2     590 - 591
      CIGSDAY     592 - 593    CIGQTYR     594 - 594
      VIGNO       595 - 597    VIGTP       598 - 598
      VIGFREQW    599 - 600    VIGLNGNO    601 - 603
      VIGLNGTP    604 - 604    VIGMIN      605 - 607
      MODNO       608 - 610    MODTP       611 - 611
      MODFREQW    612 - 613    MODLNGNO    614 - 616
      MODLNGTP    617 - 617    MODMIN      618 - 620
      STRNGNO     621 - 623    STRNGTP     624 - 624
      STRFREQW    625 - 626    ALC1YR      627 - 627
      ALCLIFE     628 - 628    ALC12MNO    629 - 631
      ALC12MTP    632 - 632    ALC12MWK    633 - 634
      ALC12MYR    635 - 637    ALCAMT      638 - 639
      ALCSTAT     640 - 641    ALC5UPNO    642 - 644
      ALC5UPTP    645 - 645    ALC5UPYR    646 - 648
      AHEIGHT     649 - 650    AWEIGHTP    651 - 653
      BMI         654 - 657 .2 SLEEP       658 - 659


      /* AAU LOCATIONS */

      AUSUALPL    660 - 660    APLKIND     661 - 661
      AHCPLROU    662 - 662    AHCPLKND    663 - 663
      AHCCHGYR    664 - 664    AHCCHGHI    665 - 665
      AHCDLYR1    666 - 666    AHCDLYR2    667 - 667
      AHCDLYR3    668 - 668    AHCDLYR4    669 - 669
      AHCDLYR5    670 - 670    AHCAFYR1    671 - 671
      AHCAFYR2    672 - 672    AHCAFYR3    673 - 673
      AHCAFYR4    674 - 674    ADNLONG2    675 - 675
      AHCSYR1     676 - 676    AHCSYR2     677 - 677
      AHCSYR3     678 - 678    AHCSYR4     679 - 679
      AHCSYR5     680 - 680    AHCSYR6     681 - 681
      AHCSYR7     682 - 682    AHCSYR8     683 - 683
      AHCSYR9     684 - 684    AHCSYR10    685 - 685
      AHERNOY2    686 - 687    AHCHYR      688 - 688
      AHCHMOYR    689 - 690    AHCHNOY2    691 - 692
      AHCNOYR2    693 - 694    ASRGYR      695 - 695
      ASRGNOYR    696 - 697    AMDLONGR    698 - 698
      SHTFLUYR    699 - 699    ASHFLU_M    700 - 701
      ASHFLU_Y    702 - 705    SPRFLUYR    706 - 706
      ASPFLU_M    707 - 708    ASPFLU_Y    709 - 712
      SHTPNUYR    713 - 713    APOX        714 - 714
      APOX12MO    715 - 715    AHEP        716 - 716
      AHEPLIV     717 - 717    SHTHEPB     718 - 718
      SHEPDOS     719 - 719

      /* ADS LOCATIONS */

      BLDGV       720 - 720    BLDG12M     721 - 721
      HIVTST      722 - 722    WHYTST_R    723 - 724
      TST12M_M    725 - 726    TST12M_Y    727 - 730
      TIMETST     731 - 731    REATST_C    732 - 733
      REASWHOR    734 - 734    LASTST_C    735 - 736
      CLNTYP_C    737 - 738    WHOADM      739 - 739
      GIVNAM      740 - 740    EXTST12M    741 - 741
      CHNSADSP    742 - 742    STMTRU      743 - 743
      STD         744 - 744    STDDOC      745 - 745
      STDWHER     746 - 746    TBHRD       747 - 747
      TBKNOW      748 - 748    TB          749 - 749
      TBSPRD1     750 - 750    TBSPRD2     751 - 751
      TBSPRD3     752 - 752    TBSPRD4     753 - 753
      TBSPRD5     754 - 754    TBSPRD6     755 - 755
      TBCURED     756 - 756    TBCHANC     757 - 757
      TBSHAME     758 - 758    HOMELESS    759 - 759
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
      WHYNOWKA   =" Main reason for not working last week"
      EVERWRK    ="Ever worked"
      INDSTRN1   ="Detailed industry classification (2002 NAICS)"
      INDSTRN2   ="Simple industry classification (2002 NAICS)"
      OCCUPN1    ="Detailed occupation classification (2000 SOC)"
      OCCUPN2    ="Simple occupation classification (2000 SOC)"
      WRKCATA    ="Class of worker"
      BUSINC1A   ="Current job an incorporated business"
      LOCALL1A   ="Number of employees at work"
      YRSWRKPA   ="Years on the job"
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
      ASTDO      ="BEST thing to do for stroke victim"
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
      DIBAGE     ="Age first diagnosed w/diabetes"
      DIFAGE2    ="Years since first diagnosed w/diabetes"
      DIBPRE     ="Ever been told that you have prediabetes"
      DIBIFG     ="Ever been told that you have impaired fasting glucose"
      DIBIGT     ="Ever been told that you have impaired glucose tolerance"
      DIBBORD    ="Ever been told that you have borderline diabetes"
      DIBHBS     ="Ever been told that you have high blood sugar"
      INSLN      ="NOW taking insulin"
      DIBPILL    ="NOW taking diabetic pills"
      GDM        ="Ever been told that you had gestational diabetes"
      GDMAGE     ="Age first diagnosed w/gestational diabetes"
      GDM_O      ="Ever been told that you had gestational diabetes"
      GDM_OAGE   ="Age first diagnosed w/gestational diabetes"
      DIBBTST    ="Tested for high blood sugar/diabetes, past 3 years"
      DIBRISK    ="Ever been told that you have risk for diabetes"
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
      JNTCHR     ="Symptoms begin more than 3 m ago"
      JNTHP      ="Ever seen doctor or hlth prof for joint symptoms"
      ARTH1      ="Ever been told you had arthritis"
      ARTHWT     ="Ever told to lose weight to help arthritis"
      ARTHPH     ="Ever told to exercise to help arthritis"
      ARTHCLS    ="Ever taken a class to help arthritis"
      ARTHLMT    ="Limited due to arthritis or joint symptoms"
      ARTHWRK    ="Limited in work due to arthritis"
      PAINECK    ="Had neck pain, past 3 m"
      PAINLB     ="Had low back pain, past 3 m"
      PAINLEG    ="Pain spread down leg/below knees"
      PAINFACE   ="Had pain in jaw/front of ear, past 3 m"
      AMIGR      ="Had severe headache/migraine, past 3 m"
      ACOLD2W    ="Had a head/chest cold past 2 w"
      AINTIL2W   ="Had stomach prob w/vomit/diarrhea, 2 w"
      PREGNOW    ="Currently pregnant"
      HEARAID    ="Have ever worn a hearing aid"
      AHEARST    ="Description of hearing w/o hearing aid"
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
      HPWTYR     ="Advised to lose weight, past 12 m"
      HPPAYR     ="Advised to increase exercise, past 12 m"
      HPDIETYR   ="Advised to change diet, past 12 m"
      SMWTYR     ="Lost weight, past 12 m"
      SMPAYR     ="Increased exercise, past 12 m"
      SMDIETYR   ="Changed diet, past 12 m"

      /* AHS LABELS */

      WRKLYR3    ="Work status: last week, past 12 m"
      WKDAYR     ="Number of work loss days, past 12 m"
      BEDDAYR    ="Number of bed days, past 12 m"
      AHSTATYR   ="Health better/worse/same, compared w/ 12 m ago"
      SPECEQ     ="Have health problem that requires special equipment"
      FLWALK     ="How difficult to walk 1/4 mile w/o special equipment"
      FLCLIMB    ="How difficult to climb 10 steps w/o special equipment"
      FLSTAND    ="How difficult to stand 2 hours w/o special equipment"
      FLSIT      ="How difficult to sit 2 hours w/o special equipment"
      FLSTOOP    ="How difficult to stoop, bend or kneel w/o special equipment"
      FLREACH    ="How difficult to reach over head w/o special equipment"
      FLGRASP    ="How difficult to grasp small objects w/o special equipment"
      FLCARRY    ="How difficult lift/carry 10 lbs w/o special equipment"
      FLPUSH     ="How difficult to push large objects w/o special equipment"
      FLSHOP     ="How difficult to go out to events w/o special equipment"
      FLSOCL     ="How difficult to participate in social activities w/o sp eq"
      FLRELAX    ="How difficult to relax at home w/o special equipment"
      FLA1AR     ="Any functional limitation, all conds"
      AFLHCA1    ="Vision problem causes difficulty with activity"
      AFLHCA2    ="Hearing problem causes difficulty with activity"
      AFLHCA3    ="Arthritis/rheumatism causes difficulty with activity"
      AFLHCA4    ="Back/neck prob causes difficulty with activity"
      AFLHCA5    ="Fract/bone/joint inj causes difficulty with activity"
      AFLHCA6    ="Other injury causes difficulty with activity"
      AFLHCA7    ="Heart prob causes difficulty with activity"
      AFLHCA8    ="Stroke causes difficulty with activity"
      AFLHCA9    ="Hypertension causes difficulty with activity"
      AFLHCA10   ="Diabetes causes difficulty with activity"
      AFLHCA11   ="Lung/breath prob causes difficulty with activity"
      AFLHCA12   ="Cancer causes difficulty with activity"
      AFLHCA13   ="Birth defect causes difficulty with activity"
      AFLHCA14   ="Mental retardation causes difficulty with activity"
      AFLHCA15   ="Otr dev prob causes difficulty with activity"
      AFLHCA16   ="Senility/dementia/alzheimers causes difficulty with activity"
      AFLHCA17   ="Dep/anx/emot prob causes difficulty with activity"
      AFLHCA18   ="Weight prob causes difficulty with activity"
      AFLHC19_   ="Missing or amputated limb/finger/digit"
      AFLHC20_   ="Musculoskeletal/connective tissue prob"
      AFLHC21_   ="Circulation problem"
      AFLHC22_   ="Endocrine/nutritional/metabolic prob"
      AFLHC23_   ="Nervous system/sensory organ condition"
      AFLHC24_   ="Digestive system problem"
      AFLHC25_   ="Genitourinary system problem"
      AFLHC26_   ="Skin/subcutaneous system problem"
      AFLHC27_   ="Blood or blood-forming organ problem"
      AFLHC28_   ="Benign tumor/cyst"
      AFLHC29_   ="Alcohol/drug/substance abuse problem"
      AFLHC30_   ="Otr mental prob/ADD/Bipolar/Schizophrenic"
      AFLHC31_   ="Surgical after-effects/medical treatment"
      AFLHC32_   ='"Old age"/elderly/aging-related problem'
      AFLHC33_   ="Fatigue/tiredness/weakness"
      AFLHC34_   ="Pregnancy related problem"
      AFLHCA90   ="Other impair/prob(1) causes difficulty with activity"
      AFLHCA91   ="Other impair/prob(2) causes difficulty with activity"
      ALTIME1    ="Duration of vision prob: Number of units"
      ALUNIT1    ="Duration of vision prob: Time unit"
      ALDURA1    ="Duration of vision prob (in years)"
      ALDURB1    ="Duration of vision prob recode 2"
      ALCHRC1    ="Vision problem condition status"
      ALTIME2    ="Duration of hearing prob: Number of units"
      ALUNIT2    ="Duration of hearing prob: Time unit"
      ALDURA2    ="Duration of hearing prob (in years)"
      ALDURB2    ="Duration of hearing prob recode 2"
      ALCHRC2    ="Hearing problem condition status"
      ALTIME3    ="Duration of arthritis/rheumatism: Number of units"
      ALUNIT3    ="Duration of arthritis/rheumatism: Time unit"
      ALDURA3    ="Duration of arthritis or rheumatism prob (in years)"
      ALDURB3    ="Duration of arthritis or rheumatism prob recode 2"
      ALCHRC3    ="Arthritis or rheumatism problem condition status"
      ALTIME4    ="Duration of back or neck problem: Number of units"
      ALUNIT4    ="Duration of back or neck problem: Time unit"
      ALDURA4    ="Duration of back or neck prob (in years)"
      ALDURB4    ="Duration of back or neck prob recode 2"
      ALCHRC4    ="Back or neck condition status"
      ALTIME5    ="Duration of fracture, bone/joint injury: Number of units"
      ALUNIT5    ="Duration of fracture, bone/joint injury: Time unit"
      ALDURA5    ="Duration of fracture, bone/joint injury prob (in years)"
      ALDURB5    ="Duration of fracture, bone/joint injury prob recode 2"
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
      ALDURB10   ="Duration of diabetes prob recode 2"
      ALCHRC10   ="Diabetes problem condition status"
      ALTIME11   ="Duration of lung/breathing problem: Number of units"
      ALUNIT11   ="Duration of lung/breathing problem: Time unit"
      ALDURA11   ="Duration of lung/breathing problem (in years)"
      ALDURB11   ="Duration of lung/breathing problem recode 2"
      ALCHRC11   ="Lung/breathing problem condition status"
      ALTIME12   ="Duration of cancer: Number of units"
      ALUNIT12   ="Duration of cancer: Time unit"
      ALDURA12   ="Duration of cancer problem (in years)"
      ALDURB12   ="Duration of cancer problem recode 2"
      ALCHRC12   ="Cancer problem condition status"
      ALTIME13   ="Duration of birth defect: Number of units"
      ALUNIT13   ="Duration of birth defect: Time unit"
      ALDURA13   ="Duration of birth defect problem (in years)"
      ALDURB13   ="Duration of birth defect problem prob recode 2"
      ALCHRC13   ="Birth defect problem condition status"
      ALTIME14   ="Duration of mental retardation: Number of units"
      ALUNIT14   ="Duration of mental retardation: Time unit"
      ALDURA14   ="Duration of mental retardation problem (in years)"
      ALDURB14   ="Duration of mental retardation problem prob recode 2"
      ALCHRC14   ="Mental retardation problem condition status"
      ALTIME15   ="Duration of other developmental problem: Number of units"
      ALUNIT15   ="Duration of other developmental problem: Time unit"
      ALDURA15   ="Duration of other developmental problem (in years)"
      ALDURB15   ="Duration of other developmental problem  recode 2"
      ALCHRC15   ="Other developmental problem condition status"
      ALTIME16   ="Duration of senility: Number of units"
      ALUNIT16   ="Duration of senility: Time unit"
      ALDURA16   ="Duration of senility problem (in years)"
      ALDURB16   ="Duration of senility problem recode 2"
      ALCHRC16   ="Senility problem condition status"
      ALTIME17   =
"Duration of depression/anxiety/emotional prob: Number of units"
      ALUNIT17   ="Duration of depression/anxiety/emotional problem: Time unit"
      ALDURA17   ="Duration of depression/anxiety/emotional problem (in years)"
      ALDURB17   ="Duration of depression/anxiety/emotional problem recode 2"
      ALCHRC17   ="Depression/anxiety/emotional problem condition status"
      ALTIME18   ="Duration of weight problem: Number of units"
      ALUNIT18   ="Duration of weight problem: Time unit"
      ALDURA18   ="Duration of weight problem (in years)"
      ALDURB18   ="Duration of weight problem recode 2"
      ALCHRC18   ="Weight problem condition status"
      ALTIME19   ="Duration of missing limbs: Number of units"
      ALUNIT19   ="Duration of missing limbs: Time unit"
      ALDURA19   ="Duration of missing limbs problem (in years)"
      ALDURB19   ="Duration of missing limbs problem recode 2"
      ALCHRC19   ="Missing limbs problem condition status"
      ALTIME20   ="Duration of musculoskeletal problem: Number of units"
      ALUNIT20   ="Duration of musculoskeletal problem: Time unit"
      ALDURA20   ="Duration of musculoskeletal problem (in years)"
      ALDURB20   ="Duration of musculoskeletal problem recode 2"
      ALCHRC20   ="Musculoskeletal problem condition status"
      ALTIME21   ="Duration of circulatory problem: Number of units"
      ALUNIT21   ="Duration of circulatory problem: Time unit"
      ALDURA21   ="Duration of circulatory problem (in years)"
      ALDURB21   ="Duration of circulatory problem recode 2"
      ALCHRC21   ="Circulatory problem condition status"
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
      ALDURA24   ="Duration of digestive problem (in years)"
      ALDURB24   ="Duration of digestive problem recode 2"
      ALCHRC24   ="Digestive problem condition status"
      ALTIME25   ="Duration of genitourinary problem: Number of units"
      ALUNIT25   ="Duration of genitourinary problem: Time unit"
      ALDURA25   ="Duration of genitourinary problem (in years)"
      ALDURB25   ="Duration of genitourinary problem recode 2"
      ALCHRC25   ="Genitourinary problem condition status"
      ALTIME26   ="Duration of skin problems: Number of units"
      ALUNIT26   ="Duration of skin problems: Time unit"
      ALDURA26   ="Duration of skin problem (in years)"
      ALDURB26   ="Duration of skin problem recode 2"
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
      ALTIME32   ='Duration of "old age": Number of units'
      ALUNIT32   ='Duration of "old age": Number of units'
      ALDURA32   ='Duration of "old age" (in years)'
      ALDURB32   ='Duration of "old age", recode 2'
      ALCHRC32   ='"Old age" condition status'
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
      ALCNDRT    ="Chronic cond rec for ind w/functl lim"
      ALCHRONR   ="Overall functl lim recode by cond status"

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
      INDSTRN1  SAP026X.   INDSTRN2  SAP026X.   OCCUPN1   SAP028X.
      OCCUPN2   SAP028X.   WRKCATA   SAP030X.   BUSINC1A  SAP025X.
      LOCALL1A  SAP032X.   YRSWRKPA  SAP033X.   WRKLONGH  SAP025X.
      HOURPDA   SAP025X.   PDSICKA   SAP025X.   ONEJOB    SAP025X.

      /* ACN FORMAT ASSOCIATIONS */

      HYPEV     SAP025X.   HYPDIFV   SAP025X.   CHDEV     SAP025X.
      ANGEV     SAP025X.   MIEV      SAP025X.   HRTEV     SAP025X.
      STREV     SAP025X.   EPHEV     SAP025X.   ASTDO     SAP046X.
      AASMEV    SAP025X.   AASSTILL  SAP025X.   AASMYR    SAP025X.
      AASMERYR  SAP025X.   ULCEV     SAP025X.   ULCYR     SAP025X.
      CANEV     SAP025X.   CNKIND1   SAP054X.   CNKIND2   SAP054X.
      CNKIND3   SAP054X.   CNKIND4   SAP054X.   CNKIND5   SAP054X.
      CNKIND6   SAP054X.   CNKIND7   SAP054X.   CNKIND8   SAP054X.
      CNKIND9   SAP054X.   CNKIND10  SAP054X.   CNKIND11  SAP054X.
      CNKIND12  SAP054X.   CNKIND13  SAP054X.   CNKIND14  SAP054X.
      CNKIND15  SAP054X.   CNKIND16  SAP054X.   CNKIND17  SAP054X.
      CNKIND18  SAP054X.   CNKIND19  SAP054X.   CNKIND20  SAP054X.
      CNKIND21  SAP054X.   CNKIND22  SAP054X.   CNKIND23  SAP054X.
      CNKIND24  SAP054X.   CNKIND25  SAP054X.   CNKIND26  SAP054X.
      CNKIND27  SAP054X.   CNKIND28  SAP054X.   CNKIND29  SAP054X.
      CNKIND30  SAP054X.   CNKIND31  SAP054X.   CANAGE1   SAP085X.
      CANAGE2   SAP085X.   CANAGE3   SAP085X.   CANAGE4   SAP085X.
      CANAGE5   SAP085X.   CANAGE6   SAP085X.   CANAGE7   SAP085X.
      CANAGE8   SAP085X.   CANAGE9   SAP085X.   CANAGE10  SAP085X.
      CANAGE11  SAP085X.   CANAGE12  SAP085X.   CANAGE13  SAP085X.
      CANAGE14  SAP085X.   CANAGE15  SAP085X.   CANAGE16  SAP085X.
      CANAGE17  SAP085X.   CANAGE18  SAP085X.   CANAGE19  SAP085X.
      CANAGE20  SAP085X.   CANAGE21  SAP085X.   CANAGE22  SAP085X.
      CANAGE23  SAP085X.   CANAGE24  SAP085X.   CANAGE25  SAP085X.
      CANAGE26  SAP085X.   CANAGE27  SAP085X.   CANAGE28  SAP085X.
      CANAGE29  SAP085X.   CANAGE30  SAP085X.   DIBEV     SAP115X.
      DIBAGE    SAP085X.   DIFAGE2   SAP117X.   DIBPRE    SAP025X.
      DIBIFG    SAP025X.   DIBIGT    SAP025X.   DIBBORD   SAP025X.
      DIBHBS    SAP025X.   INSLN     SAP025X.   DIBPILL   SAP025X.
      GDM       SAP125X.   GDMAGE    SAP126X.   GDM_O     SAP125X.
      GDM_OAGE  SAP126X.   DIBBTST   SAP025X.   DIBRISK   SAP025X.
      AHAYFYR   SAP025X.   SINYR     SAP025X.   CBRCHYR   SAP025X.
      KIDWKYR   SAP025X.   LIVYR     SAP025X.   JNTSYMP   SAP025X.
      JMTHP1    SAP054X.   JMTHP2    SAP054X.   JMTHP3    SAP054X.
      JMTHP4    SAP054X.   JMTHP5    SAP054X.   JMTHP6    SAP054X.
      JMTHP7    SAP054X.   JMTHP8    SAP054X.   JMTHP9    SAP054X.
      JMTHP10   SAP054X.   JMTHP11   SAP054X.   JMTHP12   SAP054X.
      JMTHP13   SAP054X.   JMTHP14   SAP054X.   JMTHP15   SAP054X.
      JMTHP16   SAP054X.   JMTHP17   SAP054X.   JNTPN     SAP154X.
      JNTCHR    SAP025X.   JNTHP     SAP025X.   ARTH1     SAP025X.
      ARTHWT    SAP025X.   ARTHPH    SAP025X.   ARTHCLS   SAP025X.
      ARTHLMT   SAP025X.   ARTHWRK   SAP025X.   PAINECK   SAP025X.
      PAINLB    SAP025X.   PAINLEG   SAP025X.   PAINFACE  SAP025X.
      AMIGR     SAP025X.   ACOLD2W   SAP025X.   AINTIL2W  SAP025X.
      PREGNOW   SAP025X.   HEARAID   SAP025X.   AHEARST   SAP172X.
      AVISION   SAP025X.   ABLIND    SAP025X.   LUPPRT    SAP025X.
      SAD       SAP176X.   NERVOUS   SAP176X.   RESTLESS  SAP176X.
      HOPELESS  SAP176X.   EFFORT    SAP176X.   WORTHLS   SAP176X.
      MHAMTMO   SAP182X.   HPWTYR    SAP025X.   HPPAYR    SAP025X.
      HPDIETYR  SAP025X.   SMWTYR    SAP025X.   SMPAYR    SAP025X.
      SMDIETYR  SAP025X.

      /* AHS FORMAT ASSOCIATIONS */

      WRKLYR3   SAP189X.   WKDAYR    SAP190X.   BEDDAYR   SAP190X.
      AHSTATYR  SAP192X.   SPECEQ    SAP025X.   FLWALK    SAP194X.
      FLCLIMB   SAP194X.   FLSTAND   SAP194X.   FLSIT     SAP194X.
      FLSTOOP   SAP194X.   FLREACH   SAP194X.   FLGRASP   SAP194X.
      FLCARRY   SAP194X.   FLPUSH    SAP194X.   FLSHOP    SAP194X.
      FLSOCL    SAP194X.   FLRELAX   SAP194X.   FLA1AR    SAP206X.
      AFLHCA1   SAP054X.   AFLHCA2   SAP054X.   AFLHCA3   SAP054X.
      AFLHCA4   SAP054X.   AFLHCA5   SAP054X.   AFLHCA6   SAP054X.
      AFLHCA7   SAP054X.   AFLHCA8   SAP054X.   AFLHCA9   SAP054X.
      AFLHCA10  SAP054X.   AFLHCA11  SAP054X.   AFLHCA12  SAP054X.
      AFLHCA13  SAP054X.   AFLHCA14  SAP054X.   AFLHCA15  SAP054X.
      AFLHCA16  SAP054X.   AFLHCA17  SAP054X.   AFLHCA18  SAP054X.
      AFLHC19_  SAP054X.   AFLHC20_  SAP054X.   AFLHC21_  SAP054X.
      AFLHC22_  SAP054X.   AFLHC23_  SAP054X.   AFLHC24_  SAP054X.
      AFLHC25_  SAP054X.   AFLHC26_  SAP054X.   AFLHC27_  SAP054X.
      AFLHC28_  SAP054X.   AFLHC29_  SAP054X.   AFLHC30_  SAP054X.
      AFLHC31_  SAP054X.   AFLHC32_  SAP054X.   AFLHC33_  SAP054X.
      AFLHC34_  SAP054X.   AFLHCA90  SAP054X.   AFLHCA91  SAP054X.
      ALTIME1   SAP243X.   ALUNIT1   SAP244X.   ALDURA1   SAP245X.
      ALDURB1   SAP246X.   ALCHRC1   SAP247X.   ALTIME2   SAP243X.
      ALUNIT2   SAP244X.   ALDURA2   SAP245X.   ALDURB2   SAP246X.
      ALCHRC2   SAP247X.   ALTIME3   SAP243X.   ALUNIT3   SAP244X.
      ALDURA3   SAP245X.   ALDURB3   SAP246X.   ALCHRC3   SAP247X.
      ALTIME4   SAP243X.   ALUNIT4   SAP244X.   ALDURA4   SAP245X.
      ALDURB4   SAP246X.   ALCHRC4   SAP247X.   ALTIME5   SAP243X.
      ALUNIT5   SAP244X.   ALDURA5   SAP245X.   ALDURB5   SAP246X.
      ALCHRC5   SAP247X.   ALTIME6   SAP243X.   ALUNIT6   SAP244X.
      ALDURA6   SAP245X.   ALDURB6   SAP246X.   ALCHRC6   SAP247X.
      ALTIME7   SAP243X.   ALUNIT7   SAP244X.   ALDURA7   SAP245X.
      ALDURB7   SAP246X.   ALCHRC7   SAP247X.   ALTIME8   SAP243X.
      ALUNIT8   SAP244X.   ALDURA8   SAP245X.   ALDURB8   SAP246X.
      ALCHRC8   SAP247X.   ALTIME9   SAP243X.   ALUNIT9   SAP244X.
      ALDURA9   SAP245X.   ALDURB9   SAP246X.   ALCHRC9   SAP247X.
      ALTIME10  SAP243X.   ALUNIT10  SAP244X.   ALDURA10  SAP245X.
      ALDURB10  SAP246X.   ALCHRC10  SAP247X.   ALTIME11  SAP243X.
      ALUNIT11  SAP244X.   ALDURA11  SAP245X.   ALDURB11  SAP246X.
      ALCHRC11  SAP247X.   ALTIME12  SAP243X.   ALUNIT12  SAP244X.
      ALDURA12  SAP245X.   ALDURB12  SAP246X.   ALCHRC12  SAP247X.
      ALTIME13  SAP243X.   ALUNIT13  SAP244X.   ALDURA13  SAP245X.
      ALDURB13  SAP246X.   ALCHRC13  SAP247X.   ALTIME14  SAP243X.
      ALUNIT14  SAP244X.   ALDURA14  SAP245X.   ALDURB14  SAP246X.
      ALCHRC14  SAP247X.   ALTIME15  SAP243X.   ALUNIT15  SAP244X.
      ALDURA15  SAP245X.   ALDURB15  SAP246X.   ALCHRC15  SAP247X.
      ALTIME16  SAP243X.   ALUNIT16  SAP244X.   ALDURA16  SAP245X.
      ALDURB16  SAP246X.   ALCHRC16  SAP247X.   ALTIME17  SAP243X.
      ALUNIT17  SAP244X.   ALDURA17  SAP245X.   ALDURB17  SAP246X.
      ALCHRC17  SAP247X.   ALTIME18  SAP243X.   ALUNIT18  SAP244X.
      ALDURA18  SAP245X.   ALDURB18  SAP246X.   ALCHRC18  SAP247X.
      ALTIME19  SAP243X.   ALUNIT19  SAP244X.   ALDURA19  SAP245X.
      ALDURB19  SAP246X.   ALCHRC19  SAP247X.   ALTIME20  SAP243X.
      ALUNIT20  SAP244X.   ALDURA20  SAP245X.   ALDURB20  SAP246X.
      ALCHRC20  SAP247X.   ALTIME21  SAP243X.   ALUNIT21  SAP244X.
      ALDURA21  SAP245X.   ALDURB21  SAP246X.   ALCHRC21  SAP247X.
      ALTIME22  SAP243X.   ALUNIT22  SAP244X.   ALDURA22  SAP245X.
      ALDURB22  SAP246X.   ALCHRC22  SAP247X.   ALTIME23  SAP243X.
      ALUNIT23  SAP244X.   ALDURA23  SAP245X.   ALDURB23  SAP246X.
      ALCHRC23  SAP247X.   ALTIME24  SAP243X.   ALUNIT24  SAP244X.
      ALDURA24  SAP245X.   ALDURB24  SAP246X.   ALCHRC24  SAP247X.
      ALTIME25  SAP243X.   ALUNIT25  SAP244X.   ALDURA25  SAP245X.
      ALDURB25  SAP246X.   ALCHRC25  SAP247X.   ALTIME26  SAP243X.
      ALUNIT26  SAP244X.   ALDURA26  SAP245X.   ALDURB26  SAP246X.
      ALCHRC26  SAP247X.   ALTIME27  SAP243X.   ALUNIT27  SAP244X.
      ALDURA27  SAP245X.   ALDURB27  SAP246X.   ALCHRC27  SAP247X.
      ALTIME28  SAP243X.   ALUNIT28  SAP244X.   ALDURA28  SAP245X.
      ALDURB28  SAP246X.   ALCHRC28  SAP247X.   ALTIME29  SAP243X.
      ALUNIT29  SAP244X.   ALDURA29  SAP245X.   ALDURB29  SAP246X.
      ALCHRC29  SAP247X.   ALTIME30  SAP243X.   ALUNIT30  SAP244X.
      ALDURA30  SAP245X.   ALDURB30  SAP246X.   ALCHRC30  SAP247X.
      ALTIME31  SAP243X.   ALUNIT31  SAP244X.   ALDURA31  SAP245X.
      ALDURB31  SAP246X.   ALCHRC31  SAP247X.   ALTIME32  SAP243X.
      ALUNIT32  SAP244X.   ALDURA32  SAP245X.   ALDURB32  SAP246X.
      ALCHRC32  SAP247X.   ALTIME33  SAP243X.   ALUNIT33  SAP244X.
      ALDURA33  SAP245X.   ALDURB33  SAP246X.   ALCHRC33  SAP247X.
      ALTIME34  SAP243X.   ALUNIT34  SAP244X.   ALDURA34  SAP245X.
      ALDURB34  SAP246X.   ALCHRC34  SAP247X.   ALTIME90  SAP243X.
      ALUNIT90  SAP244X.   ALDURA90  SAP245X.   ALDURB90  SAP246X.
      ALCHRC90  SAP247X.   ALTIME91  SAP243X.   ALUNIT91  SAP244X.
      ALDURA91  SAP245X.   ALDURB91  SAP246X.   ALCHRC91  SAP247X.
      ALCNDRT   SAP423X.   ALCHRONR  SAP424X.

      /* AHB FORMAT ASSOCIATIONS */

      SMKEV     SAP025X.   SMKREG    SAP426X.   SMKNOW    SAP427X.
      SMKSTAT2  SAP428X.   SMKQTNO   SAP429X.   SMKQTTP   SAP430X.
      SMKQTY    SAP431X.   CIGSDA1   SAP432X.   CIGDAMO   SAP433X.
      CIGSDA2   SAP432X.   CIGSDAY   SAP432X.   CIGQTYR   SAP025X.
      VIGNO     SAP437X.   VIGTP     SAP438X.   VIGFREQW  SAP439X.
      VIGLNGNO  SAP126X.   VIGLNGTP  SAP441X.   VIGMIN    SAP126X.
      MODNO     SAP437X.   MODTP     SAP438X.   MODFREQW  SAP445X.
      MODLNGNO  SAP126X.   MODLNGTP  SAP441X.   MODMIN    SAP126X.
      STRNGNO   SAP437X.   STRNGTP   SAP438X.   STRFREQW  SAP451X.
      ALC1YR    SAP025X.   ALCLIFE   SAP025X.   ALC12MNO  SAP454X.
      ALC12MTP  SAP455X.   ALC12MWK  SAP456X.   ALC12MYR  SAP457X.
      ALCAMT    SAP458X.   ALCSTAT   SAP459X.   ALC5UPNO  SAP457X.
      ALC5UPTP  SAP461X.   ALC5UPYR  SAP457X.   AHEIGHT   SAP463X.
      AWEIGHTP  SAP464X.   BMI       SAP465X.   SLEEP     SAP154X.

      /* AAU FORMAT ASSOCIATIONS */

      AUSUALPL  SAP467X.   APLKIND   SAP468X.   AHCPLROU  SAP025X.
      AHCPLKND  SAP470X.   AHCCHGYR  SAP025X.   AHCCHGHI  SAP025X.
      AHCDLYR1  SAP025X.   AHCDLYR2  SAP025X.   AHCDLYR3  SAP025X.
      AHCDLYR4  SAP025X.   AHCDLYR5  SAP025X.   AHCAFYR1  SAP025X.
      AHCAFYR2  SAP025X.   AHCAFYR3  SAP025X.   AHCAFYR4  SAP025X.
      ADNLONG2  SAP482X.   AHCSYR1   SAP025X.   AHCSYR2   SAP025X.
      AHCSYR3   SAP025X.   AHCSYR4   SAP025X.   AHCSYR5   SAP025X.
      AHCSYR6   SAP025X.   AHCSYR7   SAP025X.   AHCSYR8   SAP025X.
      AHCSYR9   SAP025X.   AHCSYR10  SAP025X.   AHERNOY2  SAP493X.
      AHCHYR    SAP025X.   AHCHMOYR  SAP154X.   AHCHNOY2  SAP496X.
      AHCNOYR2  SAP493X.   ASRGYR    SAP025X.   ASRGNOYR  SAP499X.
      AMDLONGR  SAP482X.   SHTFLUYR  SAP025X.   ASHFLU_M  SAP502X.
      ASHFLU_Y  SAP503X.   SPRFLUYR  SAP025X.   ASPFLU_M  SAP502X.
      ASPFLU_Y  SAP503X.   SHTPNUYR  SAP025X.   APOX      SAP025X.
      APOX12MO  SAP025X.   AHEP      SAP025X.   AHEPLIV   SAP025X.
      SHTHEPB   SAP025X.   SHEPDOS   SAP513X.

      /* ADS FORMAT ASSOCIATIONS */

      BLDGV     SAP025X.   BLDG12M   SAP025X.   HIVTST    SAP025X.
      WHYTST_R  SAP517X.   TST12M_M  SAP518X.   TST12M_Y  SAP519X.
      TIMETST   SAP520X.   REATST_C  SAP521X.   REASWHOR  SAP522X.
      LASTST_C  SAP523X.   CLNTYP_C  SAP524X.   WHOADM    SAP525X.
      GIVNAM    SAP025X.   EXTST12M  SAP025X.   CHNSADSP  SAP528X.
      STMTRU    SAP529X.   STD       SAP025X.   STDDOC    SAP025X.
      STDWHER   SAP532X.   TBHRD     SAP025X.   TBKNOW    SAP025X.
      TB        SAP535X.   TBSPRD1   SAP054X.   TBSPRD2   SAP054X.
      TBSPRD3   SAP054X.   TBSPRD4   SAP054X.   TBSPRD5   SAP054X.
      TBSPRD6   SAP054X.   TBCURED   SAP025X.   TBCHANC   SAP543X.
      TBSHAME   SAP025X.   HOMELESS  SAP025X.;
RUN;

PROC CONTENTS DATA=NHIS.SAMADULT;
   TITLE1 'CONTENTS OF THE 2006 NHIS Sample Adult FILE';

PROC FREQ DATA=NHIS.SAMADULT NOTITLE;
   TABLES RECTYPE/LIST MISSING;
   TITLE1 'FREQUENCY REPORT FOR 2006 NHIS Sample Adult FILE';
   TITLE2 '(WEIGHTED)';
   WEIGHT WTFA_SA;

PROC FREQ DATA=NHIS.SAMADULT NOTITLE;
   TABLES RECTYPE/LIST MISSING;
   TITLE1 'FREQUENCY REPORT FOR 2006 NHIS Sample Adult FILE';
   TITLE2 '(UNWEIGHTED)';

* USER NOTE: TO SEE UNFORMATTED VALUES IN PROCEDURES, ADD THE
             STATEMENT: FORMAT _ALL_;
RUN;
