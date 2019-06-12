*********************************************************************
 MAY 22, 2008 10:09 AM
 
 This is an example of a SAS program that creates a SAS
 file from the 2007 NHIS Public Use SAMADULT.DAT ASCII file
 
 This is stored in SAMADULT.SAS
*********************************************************************;

* USER NOTE: PLACE NEXT STATEMENT IN SUBSEQUENT PROGRAMS;
LIBNAME  NHIS     "C:\NHIS2007";

* USER NOTE: PLACE NEXT STATEMENT IN SUBSEQUENT PROGRAMS
             IF YOU ALLOW PROGRAM TO PERMANENTLY STORE FORMATS;
LIBNAME  LIBRARY  "C:\NHIS2007";

FILENAME ASCIIDAT 'C:\NHIS2007\SAMADULT.dat';

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
   VALUE $VERBAT
      ' '< - HIGH   = "Verbatim Response"
   ;
   VALUE SAP001X
      10                 = "10 Household"
      20                 = "20 Person"
      30                 = "30 Sample Adult"
      31                 = "31 Sample Adult Cancer"
      34                 = "34 Adult Alternative Medicine"
      40                 = "40 Sample Child"
      44                 = "44 Child Alternative Medicine"
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
   VALUE SAP080X
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
   VALUE SAP208X
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
   VALUE SAP210X
      1                  = "1 The right ear"
      2                  = "2 The left ear"
      7                  = "7 Refused"
      8                  = "8 Not ascertained"
      9                  = "9 Don't know"
   ;
   VALUE SAP217X
      1                  = "1 Always"
      2                  = "2 Usually"
      3                  = "3 About half the time"
      4                  = "4 Seldom"
      5                  = "5 Never"
      7                  = "7 Refused"
      8                  = "8 Not ascertained"
      9                  = "9 Don't know"
   ;
   VALUE SAP220X
      01                 = "01 At birth"
      02                 = "02 0 to 2 years of age"
      03                 = "03 3 to 5 years of age"
      04                 = "04 6 to 11 years of age"
      05                 = "05 12 to 19 years of age"
      06                 = "06 20 to 39 years of age"
      07                 = "07 40 to 59 years of age"
      08                 = "08 60 to 69 years of age"
      09                 = "09 70 or more years of age"
      97                 = "97 Refused"
      98                 = "98 Not ascertained"
      99                 = "99 Don't know"
   ;
   VALUE SAP221X
      1                  = "1 Sudden"
      2                  = "2 Gradual"
      7                  = "7 Refused"
      8                  = "8 Not ascertained"
      9                  = "9 Don't know"
   ;
   VALUE SAP222X
      01                 = 
"01 Present at birth because mother had German measles (Rubella) or Cytomegalovi
rus (CMV)"
      02                 = "02 Present at birth for a genetic reason"
      03                 = 
"03 Present at birth for some other reason, not including genetic or infectious 
disease"
      04                 = 
"04 Infectious disease after birth (measles, meningitis, etc.)"
      05                 = "05 Ear infections or Otitis Media"
      06                 = "06 Ear injury (holes in the eardrum, etc.)"
      07                 = "07 Ear surgery"
      08                 = 
"08 Ear disease such as Meniere's Disease or Otosclerosis"
      09                 = "09 Brain tumor (Acoustic Neuroma, etc)"
      10                 = 
"10 Loud, brief noise from gunfire, blasts, or explosions"
      11                 = 
"11 Noise exposure from machinery, aircraft, power tools, loud music, appliances
, personal stereos or MP3 players, hair dryers, etc"
      12                 = "12 Getting older/aging"
      13                 = "13 Some other cause"
      97                 = "97 Refused"
      98                 = "98 Not ascertained"
      99                 = "99 Don't know"
   ;
   VALUE SAP224X
      0                  = "0 Never"
      1                  = "1 In the past year"
      2                  = "2 1 to 2 years ago"
      3                  = "3 to 4 years ago"
      4                  = "4 5 to 9 years ago"
      5                  = "5 10 to 14 years ago"
      6                  = "6 15 or more years ago"
      7                  = "7 Refused"
      8                  = "8 Not ascertained"
      9                  = "9 Don't know"
   ;
   VALUE SAP231X
      01                 = "01 Less than 6 weeks"
      02                 = "02 6 weeks to 11 months"
      03                 = "03 1 to 2 years"
      04                 = "04 3 to 4 years"
      05                 = "05 5 to 9 years"
      06                 = "06 10 to 14 years"
      07                 = "07 15 years or more"
      97                 = "97 Refused"
      98                 = "98 Not ascertained"
      99                 = "99 Don't know"
   ;
   VALUE SAP257X
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
   VALUE SAP258X
      1                  = "1 Almost always"
      2                  = "2 At least once a day"
      3                  = "3 At least once a week"
      4                  = "4 At least once a month"
      5                  = "5 Less frequently than once a month"
      7                  = "7 Refused"
      8                  = "8 Not ascertained"
      9                  = "9 Don't know"
   ;
   VALUE SAP261X
      1                  = "1 No problem"
      2                  = "2 A small problem"
      3                  = "3 A moderate problem"
      4                  = "4 A big problem"
      5                  = "5 A very big problem"
      7                  = "7 Refused"
      8                  = "8 Not ascertained"
      9                  = "9 Don't know"
   ;
   VALUE SAP280X
      1                  = "1 Work"
      2                  = "2 Leisure"
      3                  = "3 Both"
      7                  = "7 Refused"
      8                  = "8 Not ascertained"
      9                  = "9 Don't know"
   ;
   VALUE SAP281X
      1                  = "1 to less than 100 rounds"
      2                  = "2 100 to less than 1000 rounds"
      3                  = "3 1000 to less than 10,000 rounds"
      4                  = "4 10,000 to less than 50,000 rounds"
      5                  = "5 50,000 rounds or more"
      7                  = "7 Refused"
      8                  = "8 Not ascertained"
      9                  = "9 Don't know"
   ;
   VALUE SAP282X
      0                  = "0 None"
      1                  = "1 to less than 100 rounds"
      2                  = "2 100 to less than 1000 rounds"
      3                  = "3 1000 to less than 10,000 rounds"
      4                  = "4 10,000 rounds or more"
      7                  = "7 Refused"
      8                  = "8 Not ascertained"
      9                  = "9 Don't know"
   ;
   VALUE SAP285X
      01                 = "01 Less than 3 months"
      02                 = "02 3 to 11 months"
      03                 = "03 1 to 2 years"
      04                 = "04 3 to 4 years"
      05                 = "05 5 to 9 years"
      06                 = "06 10 to 14 years"
      07                 = "07 15 or more years"
      97                 = "97 Refused"
      98                 = "98 Not ascertained"
      99                 = "99 Don't know"
   ;
   VALUE SAP304X
      1                  = "1 ALL of the time"
      2                  = "2 MOST of the time"
      3                  = "3 SOME of the time"
      4                  = "4 A LITTLE of the time"
      5                  = "5 NONE of the time"
      7                  = "7 Refused"
      8                  = "8 Not ascertained"
      9                  = "9 Don't know"
   ;
   VALUE SAP310X
      1                  = "1 A lot"
      2                  = "2 Some"
      3                  = "3 A little"
      4                  = "4 Not at all"
      7                  = "7 Refused"
      8                  = "8 Not ascertained"
      9                  = "9 Don't know"
   ;
   VALUE SAP311X
      0                  = "0 Had job last week"
      1                  = "1 No job last week, had job past 12 m"
      2                  = "2 No job last week, no job past 12 m"
      3                  = "3 Never worked"
      7                  = "7 Refused"
      8                  = "8 Not ascertained"
      9                  = "9 Don't know"
   ;
   VALUE SAP312X
      000                = "000 None"
      997                = "997 Refused"
      998                = "998 Not ascertained"
      999                = "999 Don't know"
   ;
   VALUE SAP314X
      1                  = "1 Better"
      2                  = "2 Worse"
      3                  = "3 About the same"
      7                  = "7 Refused"
      8                  = "8 Not ascertained"
      9                  = "9 Don't know"
   ;
   VALUE SAP316X
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
   VALUE SAP328X
      1                  = "1 Limited in any way"
      2                  = "2 Not limited in any way"
      3                  = "3 Unknown if limited"
   ;
   VALUE SAP365X
      95                 = "95 95+"
      96                 = "96 Since birth"
      97                 = "97 Refused"
      98                 = "98 Not ascertained"
      99                 = "99 Don't know"
   ;
   VALUE SAP366X
      1                  = "1 Day(s)"
      2                  = "2 Week(s)"
      3                  = "3 Month(s)"
      4                  = "4 Year(s)"
      6                  = "6 Since birth"
      7                  = "7 Refused"
      8                  = "8 Not ascertained"
      9                  = "9 Don't know"
   ;
   VALUE SAP367X
      00                 = "00 Less than 1 year"
      85                 = "85 85+ years"
      96                 = "96 Unknown number of years"
      97                 = "97 Refused"
      98                 = "98 Not ascertained"
      99                 = "99 Don't know"
   ;
   VALUE SAP368X
      1                  = "1 Less than 3 months"
      2                  = "2 3-5 months"
      3                  = "3 6-12 months"
      4                  = "4 More than 1 year"
      7                  = "7 Refused"
      8                  = "8 Not ascertained"
      9                  = "9 Don't know"
   ;
   VALUE SAP369X
      1                  = "1 Chronic"
      2                  = "2 Not chronic"
      9                  = "9 Unknown if chronic"
   ;
   VALUE SAP545X
      1                  = 
"1 At least one chronic condition causes functional limitation"
      2                  = "2 No chronic condition causes functional limitation"
      9                  = 
"9 Unknown if any chronic condition causes functional limitation"
   ;
   VALUE SAP546X
      0                  = 
"0 Not limited in any way (including unknown if limited)"
      1                  = "1 Limited; caused by at least one chronic condition"
      2                  = "2 Limited; not caused by chronic condition"
      3                  = "3 Limited; unknown if condition is chronic"
   ;
   VALUE SAP548X
      85                 = "85 85 years or older"
      96                 = "96 Never smoked regularly"
      97                 = "97 Refused"
      98                 = "98 Not ascertained"
      99                 = "99 Don't know"
   ;
   VALUE SAP549X
      1                  = "1 Every day"
      2                  = "2 Some days"
      3                  = "3 Not at all"
      7                  = "7 Refused"
      8                  = "8 Not ascertained"
      9                  = "9 Don't know"
   ;
   VALUE SAP550X
      1                  = "1 Current every day smoker"
      2                  = "2 Current some day smoker"
      3                  = "3 Former smoker"
      4                  = "4 Never smoker"
      5                  = "5 Smoker, current status unknown"
      9                  = "9 Unknown if ever smoked"
   ;
   VALUE SAP551X
      95                 = "95 95+"
      97                 = "97 Refused"
      98                 = "98 Not ascertained"
      99                 = "99 Don't know"
   ;
   VALUE SAP552X
      1                  = "1 Day(s)"
      2                  = "2 Week(s)"
      3                  = "3 Month(s)"
      4                  = "4 Year(s)"
      7                  = "7 Refused"
      8                  = "8 Not ascertained"
      9                  = "9 Don't know"
   ;
   VALUE SAP553X
      00                 = "00 Less than 1 year"
      70                 = "70 70+ years"
      97                 = "97 Refused"
      98                 = "98 Not ascertained"
      99                 = "99 Don't know"
   ;
   VALUE SAP554X
      95                 = "95 95+ cigarettes"
      97                 = "97 Refused"
      98                 = "98 Not ascertained"
      99                 = "99 Don't know"
   ;
   VALUE SAP555X
      00                 = "00 None"
      97                 = "97 Refused"
      98                 = "98 Not ascertained"
      99                 = "99 Don't know"
   ;
   VALUE SAP559X
      000                = "000 Never"
      996                = "996 Unable to do this type activity"
      997                = "997 Refused"
      998                = "998 Not ascertained"
      999                = "999 Don't know"
   ;
   VALUE SAP560X
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
   VALUE SAP561X
      00                 = "00 Less than once per week"
      95                 = "95 Never"
      96                 = "96 Unable to do vigorous activity"
      97                 = "97 Refused"
      98                 = "98 Not ascertained"
      99                 = "99 Don't know"
   ;
   VALUE SAP562X
      997                = "997 Refused"
      998                = "998 Not ascertained"
      999                = "999 Don't know"
   ;
   VALUE SAP563X
      1                  = "1 Minutes"
      2                  = "2 Hours"
      7                  = "7 Refused"
      8                  = "8 Not ascertained"
      9                  = "9 Don't know"
   ;
   VALUE SAP567X
      00                 = "00 Less than once per week"
      95                 = "95 Never"
      96                 = "96 Unable to do light or moderate activity"
      97                 = "97 Refused"
      98                 = "98 Not ascertained"
      99                 = "99 Don't know"
   ;
   VALUE SAP573X
      00                 = "00 Less than once per week"
      95                 = "95 Never"
      96                 = "96 Unable to do strength activity"
      97                 = "97 Refused"
      98                 = "98 Not ascertained"
      99                 = "99 Don't know"
   ;
   VALUE SAP576X
      000                = "000 Never"
      997                = "997 Refused"
      998                = "998 Not ascertained"
      999                = "999 Don't know"
   ;
   VALUE SAP577X
      0                  = "0 Never/None"
      1                  = "1 Week"
      2                  = "2 Month"
      3                  = "3 Year"
      7                  = "7 Refused"
      8                  = "8 Not ascertained"
      9                  = "9 Don't know"
   ;
   VALUE SAP578X
      00                 = "00 Less than one day per week"
      95                 = "95 Did not drink in past year"
      97                 = "97 Refused"
      98                 = "98 Not ascertained"
      99                 = "99 Don't know"
   ;
   VALUE SAP579X
      000                = "000 Never/none"
      997                = "997 Refused"
      998                = "998 Not ascertained"
      999                = "999 Don't know"
   ;
   VALUE SAP580X
      95                 = "95 95+ drinks"
      97                 = "97 Refused"
      98                 = "98 Not ascertained"
      99                 = "99 Don't know"
   ;
   VALUE SAP581X
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
   VALUE SAP583X
      0                  = "0 Never/None"
      1                  = "1 Per week"
      2                  = "2 Per month"
      3                  = "3 Per year"
      7                  = "7 Refused"
      8                  = "8 Not ascertained"
      9                  = "9 Don't know"
   ;
   VALUE SAP585X
      96                 = "96 Not available"
      97                 = "97 Refused"
      98                 = "98 Not ascertained"
      99                 = "99 Don't know"
   ;
   VALUE SAP586X
      996                = "996 Not available"
      997                = "997 Refused"
      998                = "998 Not ascertained"
      999                = "999 Don't know"
   ;
   VALUE SAP587X
      99.95              = "99.95 99.95+"
      99.99              = "99.99 Unknown"
   ;
   VALUE SAP588X
      97                 = "97 Refused"
      98                 = "98 Not ascertained"
      99                 = "99 Don't know"
   ;
   VALUE SAP589X
      1                  = "1 Yes"
      2                  = "2 There is NO place"
      3                  = "3 There is MORE THAN ONE place"
      7                  = "7 Refused"
      8                  = "8 Not ascertained"
      9                  = "9 Don't know"
   ;
   VALUE SAP590X
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
   VALUE SAP592X
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
   VALUE SAP604X
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
   VALUE SAP615X
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
   VALUE SAP618X
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
   VALUE SAP621X
      95                 = "95 95+ times"
      97                 = "97 Refused"
      98                 = "98 Not ascertained"
      99                 = "99 Don't know"
   ;
   VALUE SAP624X
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
   VALUE SAP625X
      .                   = '.'
      OTHER              = "Year"
      9997               = "9997 Refused"
      9998               = "9998 Not ascertained"
      9999               = "9999 Don't know"
   ;
   VALUE SAP635X
      1                  = "1 Received at least 3 doses"
      2                  = "2 Received less than 3 doses"
      7                  = "7 Refused"
      8                  = "8 Not ascertained"
      9                  = "9 Don't know"
   ;
   VALUE SAP639X
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
   VALUE SAP640X
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
   VALUE SAP641X
      9996               = "9996 Time period format"
      9997               = "9997 Refused"
      9998               = "9998 Not ascertained"
      9999               = "9999 Don't know"
   ;
   VALUE SAP642X
      1                  = "1 6 months or less"
      2                  = "2 More than 6 months but not more than 1 year ago"
      3                  = "3 More than 1 year, but not more than 2 years ago"
      4                  = "4 More than 2 years, but not more than 5 years ago"
      5                  = "5 More than 5 years ago"
      7                  = "7 Refused"
      8                  = "8 Not ascertained"
      9                  = "9 Don't know"
   ;
   VALUE SAP643X
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
   VALUE SAP644X
      1                  = "1 Doctor, nurse or other health care professional"
      2                  = "2 Sex partner"
      3                  = "3 Someone at health department"
      4                  = "4 Family member or friend"
      5                  = "5 Other"
      7                  = "7 Refused"
      8                  = "8 Not ascertained"
      9                  = "9 Don't know"
   ;
   VALUE SAP645X
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
   VALUE SAP646X
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
   VALUE SAP647X
      1                  = "1 Nurse or health worker"
      2                  = "2 Self-sampling kit"
      7                  = "7 Refused"
      8                  = "8 Not ascertained"
      9                  = "9 Don't know"
   ;
   VALUE SAP650X
      1                  = "1 High/Already have HIV/AIDS"
      2                  = "2 Medium"
      3                  = "3 Low"
      4                  = "4 None"
      7                  = "7 Refused"
      8                  = "8 Not ascertained"
      9                  = "9 Don't know"
   ;
   VALUE SAP651X
      1                  = "1 Yes, at least one statement is true"
      2                  = "2 No, none of these statements are true"
      7                  = "7 Refused"
      8                  = "8 Not ascertained"
      9                  = "9 Don't know"
   ;
   VALUE SAP654X
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
   VALUE SAP657X
      1                  = "1 A lot"
      2                  = "2 Some"
      3                  = "3 A little"
      4                  = "4 Nothing"
      7                  = "7 Refused"
      8                  = "8 Not ascertained"
      9                  = "9 Don't know"
   ;
   VALUE SAP665X
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
   INFILE ASCIIDAT PAD LRECL=882;

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

      HYPEV      3   HYPDIFV    3   HYPYR      3   CHDEV      3
      CHDYR      3   ANGEV      3   ANGYR      3   MIEV       3
      MIEVYR     3   HRTEV      3   HRTYR      3   STREV      3
      STRYR      3   EPHEV      3   EPHYR      3   AASMEV     3
      AASSTILL   3   AASMYR     3   AASMERYR   3   ULCEV      3
      ULCYR      3   CHLEV      3   CHLYR      3   GUMDISEV   3
      GUMDISYR   3   PHOBIAEV   3   PHOBIAYR   3   AFLUPNEV   3
      AFLUPNYR   3   PRCIREV    3   PRCIRYR    3   UREV       3
      URYR       3   ADDHYP     3   AUTISM     3   BIPDIS     3
      DEMENTIA   3   MANIAPSY   3   SCHIZPHN   3   SEIZURES   3
      BOWLEV     3   BOWLYR     3   BOWLTYP1   3   BOWLTYP2   3
      BOWLTYP3   3   ACIDRYR    3   HACHEYR    3   MEMLOSYR   3
      SPNYR      3   DENYR      3   ALCTOBYR   3   SUBABYR    3
      SKNYR      3   INSYR      3   FATYR      3   DEPYR      3
      ANXYR      3   CANEV      3   CNKIND1    3   CNKIND2    3
      CNKIND3    3   CNKIND4    3   CNKIND5    3   CNKIND6    3
      CNKIND7    3   CNKIND8    3   CNKIND9    3   CNKIND10   3
      CNKIND11   3   CNKIND12   3   CNKIND13   3   CNKIND14   3
      CNKIND15   3   CNKIND16   3   CNKIND17   3   CNKIND18   3
      CNKIND19   3   CNKIND20   3   CNKIND21   3   CNKIND22   3
      CNKIND23   3   CNKIND24   3   CNKIND25   3   CNKIND26   3
      CNKIND27   3   CNKIND28   3   CNKIND29   3   CNKIND30   3
      CNKIND31   3   CANAGE1    3   CANAGE2    3   CANAGE3    3
      CANAGE4    3   CANAGE5    3   CANAGE6    3   CANAGE7    3
      CANAGE8    3   CANAGE9    3   CANAGE10   3   CANAGE11   3
      CANAGE12   3   CANAGE13   3   CANAGE14   3   CANAGE15   3
      CANAGE16   3   CANAGE17   3   CANAGE18   3   CANAGE19   3
      CANAGE20   3   CANAGE21   3   CANAGE22   3   CANAGE23   3
      CANAGE24   3   CANAGE25   3   CANAGE26   3   CANAGE27   3
      CANAGE28   3   CANAGE29   3   CANAGE30   3   DIBEV      3
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
      AINTIL2W   3   PREGNOW    3   MENSYR     3   MENOYR     3
      GYNYR      3   PROSTYR    3   AHEARST1   3   HRWORS     3
      HRWHICH    3   HRRIGHT    3   HRLEFT     3   HRWHISP    3
      HRTALK     3   HRSHOUT    3   HRSPEAK    3   HRBACK     3
      HRFRUST    3   HRSAFETY   3   HEARAGE1   3   HRSUDDEN   3
      HRCAUS1    3   HRFAM      3   HRPROBHP   3   HRENT      3
      HRAUD      3   HRTEST     3   HRCOCREC   3   HRCOCNOW   3
      HRAIDNOW   3   HRAIDLNG   3   HRAIDYR    3   HRAIDEV    3
      HRAIDREC   3   HRAIDLGP   3   HRAIDOFT   3   HRAIDNT1   3
      HRAIDNT2   3   HRAIDNT3   3   HRAIDNT4   3   HRAIDNT5   3
      HRAIDNT6   3   HRAIDNT7   3   HRAIDNT8   3   HRAIDNT9   3
      HRALDS     3   HRALDTP1   3   HRALDTP2   3   HRALDTP3   3
      HRALDTP4   3   HRALDTP5   3   HRALDTP6   3   HRALDTP7   3
      HRALDTP8   3   HRALDTP9   3   HRTIN      3   HRTINLNG   3
      HRTINOFT   3   HRTINMUS   3   HRTINSLP   3   HRTNPROB   3
      HRTINDIS   3   HRTINRM    3   HREMTP01   3   HREMTP02   3
      HREMTP03   3   HREMTP04   3   HREMTP05   3   HREMTP06   3
      HREMTP07   3   HREMTP08   3   HREMTP09   3   HREMTP10   3
      HREMTP11   3   HREMTP12   3   HREMTP13   3   HREMTP14   3
      HREMTP15   3   HRFIRE     3   HRFIRTYP   3   HRTOTR     3
      HR12MR     3   HRFRPROT   3   HRWRKNOS   3   HRWRKTOT   3
      HRWRKYR    3   HRWKPROT   3   HRLESNOS   3   HRLESYR    3
      HRLSPROT   3   HRLSTP01   3   HRLSTP02   3   HRLSTP03   3
      HRLSTP04   3   HRLSTP05   3   HRLSTP06   3   HRLSTP07   3
      HRLSTP08   3   HRLSTP09   3   HRLSTP10   3   AVISION    3
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
      HYPYR        78 -  78    CHDEV        79 -  79
      CHDYR        80 -  80    ANGEV        81 -  81
      ANGYR        82 -  82    MIEV         83 -  83
      MIEVYR       84 -  84    HRTEV        85 -  85
      HRTYR        86 -  86    STREV        87 -  87
      STRYR        88 -  88    EPHEV        89 -  89
      EPHYR        90 -  90    AASMEV       91 -  91
      AASSTILL     92 -  92    AASMYR       93 -  93
      AASMERYR     94 -  94    ULCEV        95 -  95
      ULCYR        96 -  96    CHLEV        97 -  97
      CHLYR        98 -  98    GUMDISEV     99 -  99
      GUMDISYR    100 - 100    PHOBIAEV    101 - 101
      PHOBIAYR    102 - 102    AFLUPNEV    103 - 103
      AFLUPNYR    104 - 104    PRCIREV     105 - 105
      PRCIRYR     106 - 106    UREV        107 - 107
      URYR        108 - 108    ADDHYP      109 - 109
      AUTISM      110 - 110    BIPDIS      111 - 111
      DEMENTIA    112 - 112    MANIAPSY    113 - 113
      SCHIZPHN    114 - 114    SEIZURES    115 - 115
      BOWLEV      116 - 116    BOWLYR      117 - 117
      BOWLTYP1    118 - 118    BOWLTYP2    119 - 119
      BOWLTYP3    120 - 120    ACIDRYR     121 - 121
      HACHEYR     122 - 122    MEMLOSYR    123 - 123
      SPNYR       124 - 124    DENYR       125 - 125
      ALCTOBYR    126 - 126    SUBABYR     127 - 127
      SKNYR       128 - 128    INSYR       129 - 129
      FATYR       130 - 130    DEPYR       131 - 131
      ANXYR       132 - 132    CANEV       133 - 133
      CNKIND1     134 - 134    CNKIND2     135 - 135
      CNKIND3     136 - 136    CNKIND4     137 - 137
      CNKIND5     138 - 138    CNKIND6     139 - 139
      CNKIND7     140 - 140    CNKIND8     141 - 141
      CNKIND9     142 - 142    CNKIND10    143 - 143
      CNKIND11    144 - 144    CNKIND12    145 - 145
      CNKIND13    146 - 146    CNKIND14    147 - 147
      CNKIND15    148 - 148    CNKIND16    149 - 149
      CNKIND17    150 - 150    CNKIND18    151 - 151
      CNKIND19    152 - 152    CNKIND20    153 - 153
      CNKIND21    154 - 154    CNKIND22    155 - 155
      CNKIND23    156 - 156    CNKIND24    157 - 157
      CNKIND25    158 - 158    CNKIND26    159 - 159
      CNKIND27    160 - 160    CNKIND28    161 - 161
      CNKIND29    162 - 162    CNKIND30    163 - 163
      CNKIND31    164 - 164    CANAGE1     165 - 166
      CANAGE2     167 - 168    CANAGE3     169 - 170
      CANAGE4     171 - 172    CANAGE5     173 - 174
      CANAGE6     175 - 176    CANAGE7     177 - 178
      CANAGE8     179 - 180    CANAGE9     181 - 182
      CANAGE10    183 - 184    CANAGE11    185 - 186
      CANAGE12    187 - 188    CANAGE13    189 - 190
      CANAGE14    191 - 192    CANAGE15    193 - 194
      CANAGE16    195 - 196    CANAGE17    197 - 198
      CANAGE18    199 - 200    CANAGE19    201 - 202
      CANAGE20    203 - 204    CANAGE21    205 - 206
      CANAGE22    207 - 208    CANAGE23    209 - 210
      CANAGE24    211 - 212    CANAGE25    213 - 214
      CANAGE26    215 - 216    CANAGE27    217 - 218
      CANAGE28    219 - 220    CANAGE29    221 - 222
      CANAGE30    223 - 224    DIBEV       225 - 225
      DIBPRE1     226 - 226    DIBAGE      227 - 228
      DIFAGE2     229 - 230    INSLN       231 - 231
      DIBPILL     232 - 232    AHAYFYR     233 - 233
      SINYR       234 - 234    CBRCHYR     235 - 235
      KIDWKYR     236 - 236    LIVYR       237 - 237
      JNTSYMP     238 - 238    JMTHP1      239 - 239
      JMTHP2      240 - 240    JMTHP3      241 - 241
      JMTHP4      242 - 242    JMTHP5      243 - 243
      JMTHP6      244 - 244    JMTHP7      245 - 245
      JMTHP8      246 - 246    JMTHP9      247 - 247
      JMTHP10     248 - 248    JMTHP11     249 - 249
      JMTHP12     250 - 250    JMTHP13     251 - 251
      JMTHP14     252 - 252    JMTHP15     253 - 253
      JMTHP16     254 - 254    JMTHP17     255 - 255
      JNTCHR      256 - 256    JNTHP       257 - 257
      ARTH1       258 - 258    ARTHLMT     259 - 259
      ARTHTYP1    260 - 260    ARTHTYP2    261 - 261
      ARTHTYP3    262 - 262    ARTHTYP4    263 - 263
      ARTHTYP5    264 - 264    ARTHTYP6    265 - 265
      PAINECK     266 - 266    PAINLB      267 - 267
      PAINLEG     268 - 268    PAINFACE    269 - 269
      AMIGR       270 - 270    ACOLD2W     271 - 271
      AINTIL2W    272 - 272    PREGNOW     273 - 273
      MENSYR      274 - 274    MENOYR      275 - 275
      GYNYR       276 - 276    PROSTYR     277 - 277
      AHEARST1    278 - 278    HRWORS      279 - 279
      HRWHICH     280 - 280    HRRIGHT     281 - 281
      HRLEFT      282 - 282    HRWHISP     283 - 283
      HRTALK      284 - 284    HRSHOUT     285 - 285
      HRSPEAK     286 - 286    HRBACK      287 - 287
      HRFRUST     288 - 288    HRSAFETY    289 - 289
      HEARAGE1    290 - 291    HRSUDDEN    292 - 292
      HRCAUS1     293 - 294    HRFAM       295 - 295
      HRPROBHP    296 - 296    HRENT       297 - 297
      HRAUD       298 - 298    HRTEST      299 - 299
      HRCOCREC    300 - 300    HRCOCNOW    301 - 301
      HRAIDNOW    302 - 302    HRAIDLNG    303 - 304
      HRAIDYR     305 - 305    HRAIDEV     306 - 306
      HRAIDREC    307 - 307    HRAIDLGP    308 - 309
      HRAIDOFT    310 - 310    HRAIDNT1    311 - 311
      HRAIDNT2    312 - 312    HRAIDNT3    313 - 313
      HRAIDNT4    314 - 314    HRAIDNT5    315 - 315
      HRAIDNT6    316 - 316    HRAIDNT7    317 - 317
      HRAIDNT8    318 - 318    HRAIDNT9    319 - 319
      HRALDS      320 - 320    HRALDTP1    321 - 321
      HRALDTP2    322 - 322    HRALDTP3    323 - 323
      HRALDTP4    324 - 324    HRALDTP5    325 - 325
      HRALDTP6    326 - 326    HRALDTP7    327 - 327
      HRALDTP8    328 - 328    HRALDTP9    329 - 329
      HRTIN       330 - 330    HRTINLNG    331 - 332
      HRTINOFT    333 - 333    HRTINMUS    334 - 334
      HRTINSLP    335 - 335    HRTNPROB    336 - 336
      HRTINDIS    337 - 337    HRTINRM     338 - 338
      HREMTP01    339 - 339    HREMTP02    340 - 340
      HREMTP03    341 - 341    HREMTP04    342 - 342
      HREMTP05    343 - 343    HREMTP06    344 - 344
      HREMTP07    345 - 345    HREMTP08    346 - 346
      HREMTP09    347 - 347    HREMTP10    348 - 348
      HREMTP11    349 - 349    HREMTP12    350 - 350
      HREMTP13    351 - 351    HREMTP14    352 - 352
      HREMTP15    353 - 353    HRFIRE      354 - 354
      HRFIRTYP    355 - 355    HRTOTR      356 - 356
      HR12MR      357 - 357    HRFRPROT    358 - 358
      HRWRKNOS    359 - 359    HRWRKTOT    360 - 361
      HRWRKYR     362 - 362    HRWKPROT    363 - 363
      HRLESNOS    364 - 364    HRLESYR     365 - 365
      HRLSPROT    366 - 366    HRLSTP01    367 - 367
      HRLSTP02    368 - 368    HRLSTP03    369 - 369
      HRLSTP04    370 - 370    HRLSTP05    371 - 371
      HRLSTP06    372 - 372    HRLSTP07    373 - 373
      HRLSTP08    374 - 374    HRLSTP09    375 - 375
      HRLSTP10    376 - 376    AVISION     377 - 377
      ABLIND      378 - 378    LUPPRT      379 - 379
      SAD         380 - 380    NERVOUS     381 - 381
      RESTLESS    382 - 382    HOPELESS    383 - 383
      EFFORT      384 - 384    WORTHLS     385 - 385
      MHAMTMO     386 - 386

      /* AHS LOCATIONS */

      WRKLYR3     387 - 387    WKDAYR      388 - 390
      BEDDAYR     391 - 393    AHSTATYR    394 - 394
      SPECEQ      395 - 395    FLWALK      396 - 396
      FLCLIMB     397 - 397    FLSTAND     398 - 398
      FLSIT       399 - 399    FLSTOOP     400 - 400
      FLREACH     401 - 401    FLGRASP     402 - 402
      FLCARRY     403 - 403    FLPUSH      404 - 404
      FLSHOP      405 - 405    FLSOCL      406 - 406
      FLRELAX     407 - 407    FLA1AR      408 - 408
      AFLHCA1     409 - 409    AFLHCA2     410 - 410
      AFLHCA3     411 - 411    AFLHCA4     412 - 412
      AFLHCA5     413 - 413    AFLHCA6     414 - 414
      AFLHCA7     415 - 415    AFLHCA8     416 - 416
      AFLHCA9     417 - 417    AFLHCA10    418 - 418
      AFLHCA11    419 - 419    AFLHCA12    420 - 420
      AFLHCA13    421 - 421    AFLHCA14    422 - 422
      AFLHCA15    423 - 423    AFLHCA16    424 - 424
      AFLHCA17    425 - 425    AFLHCA18    426 - 426
      AFLHC19_    427 - 427    AFLHC20_    428 - 428
      AFLHC21_    429 - 429    AFLHC22_    430 - 430
      AFLHC23_    431 - 431    AFLHC24_    432 - 432
      AFLHC25_    433 - 433    AFLHC26_    434 - 434
      AFLHC27_    435 - 435    AFLHC28_    436 - 436
      AFLHC29_    437 - 437    AFLHC30_    438 - 438
      AFLHC31_    439 - 439    AFLHC32_    440 - 440
      AFLHC33_    441 - 441    AFLHC34_    442 - 442
      AFLHCA90    443 - 443    AFLHCA91    444 - 444
      ALTIME1     445 - 446    ALUNIT1     447 - 447
      ALDURA1     448 - 449    ALDURB1     450 - 450
      ALCHRC1     451 - 451    ALTIME2     452 - 453
      ALUNIT2     454 - 454    ALDURA2     455 - 456
      ALDURB2     457 - 457    ALCHRC2     458 - 458
      ALTIME3     459 - 460    ALUNIT3     461 - 461
      ALDURA3     462 - 463    ALDURB3     464 - 464
      ALCHRC3     465 - 465    ALTIME4     466 - 467
      ALUNIT4     468 - 468    ALDURA4     469 - 470
      ALDURB4     471 - 471    ALCHRC4     472 - 472
      ALTIME5     473 - 474    ALUNIT5     475 - 475
      ALDURA5     476 - 477    ALDURB5     478 - 478
      ALCHRC5     479 - 479    ALTIME6     480 - 481
      ALUNIT6     482 - 482    ALDURA6     483 - 484
      ALDURB6     485 - 485    ALCHRC6     486 - 486
      ALTIME7     487 - 488    ALUNIT7     489 - 489
      ALDURA7     490 - 491    ALDURB7     492 - 492
      ALCHRC7     493 - 493    ALTIME8     494 - 495
      ALUNIT8     496 - 496    ALDURA8     497 - 498
      ALDURB8     499 - 499    ALCHRC8     500 - 500
      ALTIME9     501 - 502    ALUNIT9     503 - 503
      ALDURA9     504 - 505    ALDURB9     506 - 506
      ALCHRC9     507 - 507    ALTIME10    508 - 509
      ALUNIT10    510 - 510    ALDURA10    511 - 512
      ALDURB10    513 - 513    ALCHRC10    514 - 514
      ALTIME11    515 - 516    ALUNIT11    517 - 517
      ALDURA11    518 - 519    ALDURB11    520 - 520
      ALCHRC11    521 - 521    ALTIME12    522 - 523
      ALUNIT12    524 - 524    ALDURA12    525 - 526
      ALDURB12    527 - 527    ALCHRC12    528 - 528
      ALTIME13    529 - 530    ALUNIT13    531 - 531
      ALDURA13    532 - 533    ALDURB13    534 - 534
      ALCHRC13    535 - 535    ALTIME14    536 - 537
      ALUNIT14    538 - 538    ALDURA14    539 - 540
      ALDURB14    541 - 541    ALCHRC14    542 - 542
      ALTIME15    543 - 544    ALUNIT15    545 - 545
      ALDURA15    546 - 547    ALDURB15    548 - 548
      ALCHRC15    549 - 549    ALTIME16    550 - 551
      ALUNIT16    552 - 552    ALDURA16    553 - 554
      ALDURB16    555 - 555    ALCHRC16    556 - 556
      ALTIME17    557 - 558    ALUNIT17    559 - 559
      ALDURA17    560 - 561    ALDURB17    562 - 562
      ALCHRC17    563 - 563    ALTIME18    564 - 565
      ALUNIT18    566 - 566    ALDURA18    567 - 568
      ALDURB18    569 - 569    ALCHRC18    570 - 570
      ALTIME19    571 - 572    ALUNIT19    573 - 573
      ALDURA19    574 - 575    ALDURB19    576 - 576
      ALCHRC19    577 - 577    ALTIME20    578 - 579
      ALUNIT20    580 - 580    ALDURA20    581 - 582
      ALDURB20    583 - 583    ALCHRC20    584 - 584
      ALTIME21    585 - 586    ALUNIT21    587 - 587
      ALDURA21    588 - 589    ALDURB21    590 - 590
      ALCHRC21    591 - 591    ALTIME22    592 - 593
      ALUNIT22    594 - 594    ALDURA22    595 - 596
      ALDURB22    597 - 597    ALCHRC22    598 - 598
      ALTIME23    599 - 600    ALUNIT23    601 - 601
      ALDURA23    602 - 603    ALDURB23    604 - 604
      ALCHRC23    605 - 605    ALTIME24    606 - 607
      ALUNIT24    608 - 608    ALDURA24    609 - 610
      ALDURB24    611 - 611    ALCHRC24    612 - 612
      ALTIME25    613 - 614    ALUNIT25    615 - 615
      ALDURA25    616 - 617    ALDURB25    618 - 618
      ALCHRC25    619 - 619    ALTIME26    620 - 621
      ALUNIT26    622 - 622    ALDURA26    623 - 624
      ALDURB26    625 - 625    ALCHRC26    626 - 626
      ALTIME27    627 - 628    ALUNIT27    629 - 629
      ALDURA27    630 - 631    ALDURB27    632 - 632
      ALCHRC27    633 - 633    ALTIME28    634 - 635
      ALUNIT28    636 - 636    ALDURA28    637 - 638
      ALDURB28    639 - 639    ALCHRC28    640 - 640
      ALTIME29    641 - 642    ALUNIT29    643 - 643
      ALDURA29    644 - 645    ALDURB29    646 - 646
      ALCHRC29    647 - 647    ALTIME30    648 - 649
      ALUNIT30    650 - 650    ALDURA30    651 - 652
      ALDURB30    653 - 653    ALCHRC30    654 - 654
      ALTIME31    655 - 656    ALUNIT31    657 - 657
      ALDURA31    658 - 659    ALDURB31    660 - 660
      ALCHRC31    661 - 661    ALTIME32    662 - 663
      ALUNIT32    664 - 664    ALDURA32    665 - 666
      ALDURB32    667 - 667    ALCHRC32    668 - 668
      ALTIME33    669 - 670    ALUNIT33    671 - 671
      ALDURA33    672 - 673    ALDURB33    674 - 674
      ALCHRC33    675 - 675    ALTIME34    676 - 677
      ALUNIT34    678 - 678    ALDURA34    679 - 680
      ALDURB34    681 - 681    ALCHRC34    682 - 682
      ALTIME90    683 - 684    ALUNIT90    685 - 685
      ALDURA90    686 - 687    ALDURB90    688 - 688
      ALCHRC90    689 - 689    ALTIME91    690 - 691
      ALUNIT91    692 - 692    ALDURA91    693 - 694
      ALDURB91    695 - 695    ALCHRC91    696 - 696
      ALCNDRT     697 - 697    ALCHRONR    698 - 698


      /* AHB LOCATIONS */

      SMKEV       699 - 699    SMKREG      700 - 701
      SMKNOW      702 - 702    SMKSTAT2    703 - 703
      SMKQTNO     704 - 705    SMKQTTP     706 - 706
      SMKQTY      707 - 708    CIGSDA1     709 - 710
      CIGDAMO     711 - 712    CIGSDA2     713 - 714
      CIGSDAY     715 - 716    CIGQTYR     717 - 717
      VIGNO       718 - 720    VIGTP       721 - 721
      VIGFREQW    722 - 723    VIGLNGNO    724 - 726
      VIGLNGTP    727 - 727    VIGMIN      728 - 730
      MODNO       731 - 733    MODTP       734 - 734
      MODFREQW    735 - 736    MODLNGNO    737 - 739
      MODLNGTP    740 - 740    MODMIN      741 - 743
      STRNGNO     744 - 746    STRNGTP     747 - 747
      STRFREQW    748 - 749    ALC1YR      750 - 750
      ALCLIFE     751 - 751    ALC12MNO    752 - 754
      ALC12MTP    755 - 755    ALC12MWK    756 - 757
      ALC12MYR    758 - 760    ALCAMT      761 - 762
      ALCSTAT     763 - 764    ALC5UPNO    765 - 767
      ALC5UPTP    768 - 768    ALC5UPYR    769 - 771
      AHEIGHT     772 - 773    AWEIGHTP    774 - 776
      BMI         777 - 780 .2 SLEEP       781 - 782


      /* AAU LOCATIONS */

      AUSUALPL    783 - 783    APLKIND     784 - 784
      AHCPLROU    785 - 785    AHCPLKND    786 - 786
      AHCCHGYR    787 - 787    AHCCHGHI    788 - 788
      AHCDLYR1    789 - 789    AHCDLYR2    790 - 790
      AHCDLYR3    791 - 791    AHCDLYR4    792 - 792
      AHCDLYR5    793 - 793    AHCAFYR1    794 - 794
      AHCAFYR2    795 - 795    AHCAFYR3    796 - 796
      AHCAFYR4    797 - 797    ADNLONG2    798 - 798
      AHCSYR1     799 - 799    AHCSYR2     800 - 800
      AHCSYR3     801 - 801    AHCSYR4     802 - 802
      AHCSYR5     803 - 803    AHCSYR6     804 - 804
      AHCSYR7     805 - 805    AHCSYR8     806 - 806
      AHCSYR9     807 - 807    AHCSYR10    808 - 808
      AHERNOY2    809 - 810    AHCHYR      811 - 811
      AHCHMOYR    812 - 813    AHCHNOY2    814 - 815
      AHCNOYR2    816 - 817    ASRGYR      818 - 818
      ASRGNOYR    819 - 820    AMDLONGR    821 - 821
      SHTFLUYR    822 - 822    ASHFLU_M    823 - 824
      ASHFLU_Y    825 - 828    SPRFLUYR    829 - 829
      ASPFLU_M    830 - 831    ASPFLU_Y    832 - 835
      SHTPNUYR    836 - 836    APOX        837 - 837
      APOX12MO    838 - 838    AHEP        839 - 839
      AHEPLIV     840 - 840    SHTHEPB     841 - 841
      SHEPDOS     842 - 842

      /* ADS LOCATIONS */

      BLDGV       843 - 843    BLDG12M     844 - 844
      HIVTST      845 - 845    WHYTST_R    846 - 847
      TST12M_M    848 - 849    TST12M_Y    850 - 853
      TIMETST     854 - 854    REATST_C    855 - 856
      REASWHOR    857 - 857    LASTST_C    858 - 859
      CLNTYP_C    860 - 861    WHOADM      862 - 862
      GIVNAM      863 - 863    EXTST12M    864 - 864
      CHNSADSP    865 - 865    STMTRU      866 - 866
      STD         867 - 867    STDDOC      868 - 868
      STDWHER     869 - 869    TBHRD       870 - 870
      TBKNOW      871 - 871    TB          872 - 872
      TBSPRD1     873 - 873    TBSPRD2     874 - 874
      TBSPRD3     875 - 875    TBSPRD4     876 - 876
      TBSPRD5     877 - 877    TBSPRD6     878 - 878
      TBCURED     879 - 879    TBCHANC     880 - 880
      TBSHAME     881 - 881    HOMELESS    882 - 882
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
      HOURPDA    ="Paid by the hour at current/most recent/longest held job"
      PDSICKA    ="Paid sick leave at current/most recent/longest held job"
      ONEJOB     ="Have more than one job"

      /* ACN LABELS */

      HYPEV      ="Ever been told you have hypertension"
      HYPDIFV    ="Ever had hypertension on 2+ visits"
      HYPYR      ="Had hypertension, past 12 months"
      CHDEV      ="Ever been told you had coronary heart disease"
      CHDYR      ="Had coronary heart disease, past 12 months"
      ANGEV      ="Ever been told you had angina pectoris"
      ANGYR      ="Had angina, past 12 months"
      MIEV       ="Ever been told you had a heart attack"
      MIEVYR     ="Had a heart attack, past 12 months"
      HRTEV      ="Ever been told you had a heart condition/disease"
      HRTYR      ="Had other heart condition, past 12 months"
      STREV      ="Ever been told you had a stroke"
      STRYR      ="Had stroke, past 12 months"
      EPHEV      ="Ever been told you had emphysema"
      EPHYR      ="Had emphysema, past 12 months"
      AASMEV     ="Ever been told you had asthma"
      AASSTILL   ="Still have asthma"
      AASMYR     ="Had an asthma episode/attack past 12 m"
      AASMERYR   ="Had visit to ER due to asthma past 12 m"
      ULCEV      ="Ever been told you have an ulcer"
      ULCYR      ="Had ulcer in past 12 m"
      CHLEV      ="Ever told you had high cholesterol"
      CHLYR      ="Had high cholesterol, past 12 months"
      GUMDISEV   ="Ever told you had gum disease"
      GUMDISYR   ="Had gum disease, past 12 months"
      PHOBIAEV   ="Ever told you had phobia or fears"
      PHOBIAYR   ="Had phobia or fears, past 12 months"
      AFLUPNEV   ="Ever told you had influenza/pneumonia"
      AFLUPNYR   ="Had influenza/pneumonia, past 12 months"
      PRCIREV    ="Ever told you had poor circulation"
      PRCIRYR    ="Had poor circulation, past 12 months"
      UREV       ="Ever told you had urinary problems"
      URYR       ="Had urinary problems, past 12 months"
      ADDHYP     ="Ever told you had ADD/Hyperactivity"
      AUTISM     ="Ever told you had Autism"
      BIPDIS     ="Ever told you had Bipolar Disorder"
      DEMENTIA   ="Ever told you had Dementia"
      MANIAPSY   ="Ever told you had Mania/Psychosis"
      SCHIZPHN   ="Ever told you had Schizophrenia"
      SEIZURES   ="Ever told you had Seizures"
      BOWLEV     ="Ever told you had bowel problems"
      BOWLYR     ="Had bowel problems, past 12 months"
      BOWLTYP1   ="Had inflammatory bowel, past 12 months"
      BOWLTYP2   ="Had irritable bowel, past 12 months"
      BOWLTYP3   ="Had severe constipation, past 12 months"
      ACIDRYR    ="Had acid reflux/heartburn, past 12 months"
      HACHEYR    ="Had regular headaches, past 12 months"
      MEMLOSYR   ="Had memory loss, past 12 months"
      SPNYR      ="Had sprains/strains, past 12 months"
      DENYR      ="Had dental pain, past 12 months"
      ALCTOBYR   ="Excessive alcohol/tobacco, past 12 months"
      SUBABYR    ="Substance abuse, past 12 months"
      SKNYR      ="Skin problems, past 12 months"
      INSYR      ="Insomnia, past 12 months"
      FATYR      ="Excessive sleepiness, past 12 months"
      DEPYR      ="Frequently depressed, past 12 months"
      ANXYR      ="Frequently anxious, past 12 months"
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
      JNTCHR     ="Symptoms begin more than 3 m ago"
      JNTHP      ="Ever seen doctor or hlth prof for joint symptoms"
      ARTH1      ="Ever been told you had arthritis"
      ARTHLMT    ="Limited due to arthritis or joint symptoms"
      ARTHTYP1   ="Ever told you had arthritis"
      ARTHTYP2   ="Ever told you had rheumatoid arthritis"
      ARTHTYP3   ="Ever told you had gout"
      ARTHTYP4   ="Ever told you had lupus"
      ARTHTYP5   ="Ever told you had fibromyalgia"
      ARTHTYP6   ="Ever told you had other joint condition"
      PAINECK    ="Had neck pain, past 3 m"
      PAINLB     ="Had low back pain, past 3 m"
      PAINLEG    ="Pain spread down leg/below knees"
      PAINFACE   ="Had pain in jaw/front of ear, past 3 m"
      AMIGR      ="Had severe headache/migraine, past 3 m"
      ACOLD2W    ="Had a head/chest cold past 2 w"
      AINTIL2W   ="Had stomach prob w/vomit/diarrhea, 2 w"
      PREGNOW    ="Currently pregnant"
      MENSYR     ="Menstrual problems, past 12 months"
      MENOYR     ="Menopausal problems, past 12 months"
      GYNYR      ="Gynecologic problems, past 12 months"
      PROSTYR    ="Prostate problems, past 12 months"
      AHEARST1   ="Description of hearing w/o aids"
      HRWORS     ="Hearing worse in one ear"
      HRWHICH    ="Which ear is worse"
      HRRIGHT    ="Hearing in right ear"
      HRLEFT     ="Hearing in left ear"
      HRWHISP    ="Hear whispers across room"
      HRTALK     ="Hear normal voice across room"
      HRSHOUT    ="Hear shouting voice across room"
      HRSPEAK    ="Hear voice in better ear"
      HRBACK     ="Trouble with background noise"
      HRFRUST    ="Frustrated with hearing when talking"
      HRSAFETY   ="Hearing causes worry about safety"
      HEARAGE1   ="Age at first hearing loss"
      HRSUDDEN   ="Hearing loss sudden/gradual"
      HRCAUS1    ="Main cause of hearing loss"
      HRFAM      ="Told of hearing problem by others"
      HRPROBHP   ="Last saw doctor/hp about hearing problem"
      HRENT      ="Referred to hearing specialist, past 5 years"
      HRAUD      ="Referred to audiologist, past 5 years"
      HRTEST     ="Last time hearing tested"
      HRCOCREC   ="Cochlear implant recommended"
      HRCOCNOW   ="Now use cochlear implant"
      HRAIDNOW   ="Now use hearing aid"
      HRAIDLNG   ="How long used hearing aid"
      HRAIDYR    ="How often used hearing aid, past 12 months"
      HRAIDEV    ="Ever used a hearing aid"
      HRAIDREC   ="Hearing aid ever recommended"
      HRAIDLGP   ="How long hearing aid used in the past"
      HRAIDOFT   ="How often used hearing aid in the past"
      HRAIDNT1   ="HA not used - it didn't help"
      HRAIDNT2   ="HA not used - too loud"
      HRAIDNT3   ="HA not used - whistling sounds"
      HRAIDNT4   ="HA not used - uncomfortable"
      HRAIDNT5   ="HA not used - frequent breakdowns"
      HRAIDNT6   ="HA not used - didn't like look"
      HRAIDNT7   ="HA not used - cost too much"
      HRAIDNT8   ="HA not used - don't need"
      HRAIDNT9   ="HA not used - other"
      HRALDS     ="Use assistive-listening devices"
      HRALDTP1   ="ALD - pocket talker"
      HRALDTP2   ="ALD - amplified telephone"
      HRALDTP3   ="ALD - amplified alarm clock"
      HRALDTP4   ="ALD - signaling system"
      HRALDTP5   ="ALD - headset or CCTV"
      HRALDTP6   ="ALD - TTY/TDD"
      HRALDTP7   ="ALD - video relay service"
      HRALDTP8   ="ALD - sign language interpreter"
      HRALDTP9   ="ALD - other"
      HRTIN      ="Had ringing in ears, past 12 months"
      HRTINLNG   ="How long bothered by ringing in ears"
      HRTINOFT   ="How often had ringing in ears, past 12 months"
      HRTINMUS   ="Ringing in ears only after loud sounds/music"
      HRTINSLP   ="Ringing in ears when going to sleep"
      HRTNPROB   ="How much a problem, ringing in ears"
      HRTINDIS   ="Discuss ringing in ears with doctor/HP"
      HRTINRM    ="Tried remedies for ringing in ears"
      HREMTP01   ="Amplification/Hearing aids"
      HREMTP02   ="Masking wearable device"
      HREMTP03   ="Masking non-wearable device"
      HREMTP04   ="Cognitive therapy w/counseling"
      HREMTP05   ="Stress reduction/relaxation methods"
      HREMTP06   ="Biofeedback"
      HREMTP07   ="Tinnitus Retraining Therapy"
      HREMTP08   ="Psychiatric treatment"
      HREMTP09   ="Surgery to cut hearing nerve"
      HREMTP10   ="Drugs or medications"
      HREMTP11   ="Nutritional supplements"
      HREMTP12   ="Music therapy"
      HREMTP13   ="TMJ treatment"
      HREMTP14   ="Alternative medicine"
      HREMTP15   ="Other remedy or treatment"
      HRFIRE     ="Ever used firearms"
      HRFIRTYP   ="Used firearms for work/leisure"
      HRTOTR     ="Number of total rounds fired"
      HR12MR     ="Number of rounds fired, past 12 months"
      HRFRPROT   ="Wear ear protection for firearms, past 12 months"
      HRWRKNOS   ="Ever exposed to loud noise at job"
      HRWRKTOT   ="Time exposed to loud noise at job"
      HRWRKYR    ="Noise exposure in past 12 months"
      HRWKPROT   ="Wear ear protection at job, past 12 months"
      HRLESNOS   ="Exposed to leisure-time loud noise"
      HRLESYR    ="Leisure-time noise, past 12 months"
      HRLSPROT   ="Wear ear protection at leisure, past 12 months"
      HRLSTP01   ="Motocycles/Auto racing"
      HRLSTP02   ="Operating farm machinery"
      HRLSTP03   ="Wood cutting/Power tools"
      HRLSTP04   ="Lawn mower/snow blower"
      HRLSTP05   ="Firearms"
      HRLSTP06   ="Household applicances"
      HRLSTP07   ="MP3 Player/iPod"
      HRLSTP08   ="Playing in a music group"
      HRLSTP09   ="Other music-related activities"
      HRLSTP10   ="Other noisy, non-work activities"
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
      AFLHCA16   ="Senility/dementia/alzheimers causes difficulty with activity"
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
      AFLHC34_   ="Pregnancy related problem causes difficulty with activity"
      AFLHCA90   ="Other impairment/problem (1) causes difficulty with activity"
      AFLHCA91   ="Other impairment/problem (2) causes difficulty with activity"
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
      ALCNDRT    =
"Chronic condition recode for individual w/functional limitation"
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

      HYPEV     SAP025X.   HYPDIFV   SAP025X.   HYPYR     SAP025X.
      CHDEV     SAP025X.   CHDYR     SAP025X.   ANGEV     SAP025X.
      ANGYR     SAP025X.   MIEV      SAP025X.   MIEVYR    SAP025X.
      HRTEV     SAP025X.   HRTYR     SAP025X.   STREV     SAP025X.
      STRYR     SAP025X.   EPHEV     SAP025X.   EPHYR     SAP025X.
      AASMEV    SAP025X.   AASSTILL  SAP025X.   AASMYR    SAP025X.
      AASMERYR  SAP025X.   ULCEV     SAP025X.   ULCYR     SAP025X.
      CHLEV     SAP025X.   CHLYR     SAP025X.   GUMDISEV  SAP025X.
      GUMDISYR  SAP025X.   PHOBIAEV  SAP025X.   PHOBIAYR  SAP025X.
      AFLUPNEV  SAP025X.   AFLUPNYR  SAP025X.   PRCIREV   SAP025X.
      PRCIRYR   SAP025X.   UREV      SAP025X.   URYR      SAP025X.
      ADDHYP    SAP025X.   AUTISM    SAP025X.   BIPDIS    SAP025X.
      DEMENTIA  SAP025X.   MANIAPSY  SAP025X.   SCHIZPHN  SAP025X.
      SEIZURES  SAP025X.   BOWLEV    SAP025X.   BOWLYR    SAP025X.
      BOWLTYP1  SAP080X.   BOWLTYP2  SAP080X.   BOWLTYP3  SAP080X.
      ACIDRYR   SAP025X.   HACHEYR   SAP025X.   MEMLOSYR  SAP025X.
      SPNYR     SAP025X.   DENYR     SAP025X.   ALCTOBYR  SAP025X.
      SUBABYR   SAP025X.   SKNYR     SAP025X.   INSYR     SAP025X.
      FATYR     SAP025X.   DEPYR     SAP025X.   ANXYR     SAP025X.
      CANEV     SAP025X.   CNKIND1   SAP080X.   CNKIND2   SAP080X.
      CNKIND3   SAP080X.   CNKIND4   SAP080X.   CNKIND5   SAP080X.
      CNKIND6   SAP080X.   CNKIND7   SAP080X.   CNKIND8   SAP080X.
      CNKIND9   SAP080X.   CNKIND10  SAP080X.   CNKIND11  SAP080X.
      CNKIND12  SAP080X.   CNKIND13  SAP080X.   CNKIND14  SAP080X.
      CNKIND15  SAP080X.   CNKIND16  SAP080X.   CNKIND17  SAP080X.
      CNKIND18  SAP080X.   CNKIND19  SAP080X.   CNKIND20  SAP080X.
      CNKIND21  SAP080X.   CNKIND22  SAP080X.   CNKIND23  SAP080X.
      CNKIND24  SAP080X.   CNKIND25  SAP080X.   CNKIND26  SAP080X.
      CNKIND27  SAP080X.   CNKIND28  SAP080X.   CNKIND29  SAP080X.
      CNKIND30  SAP080X.   CNKIND31  SAP080X.   CANAGE1   SAP127X.
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
      LIVYR     SAP025X.   JNTSYMP   SAP025X.   JMTHP1    SAP080X.
      JMTHP2    SAP080X.   JMTHP3    SAP080X.   JMTHP4    SAP080X.
      JMTHP5    SAP080X.   JMTHP6    SAP080X.   JMTHP7    SAP080X.
      JMTHP8    SAP080X.   JMTHP9    SAP080X.   JMTHP10   SAP080X.
      JMTHP11   SAP080X.   JMTHP12   SAP080X.   JMTHP13   SAP080X.
      JMTHP14   SAP080X.   JMTHP15   SAP080X.   JMTHP16   SAP080X.
      JMTHP17   SAP080X.   JNTCHR    SAP025X.   JNTHP     SAP025X.
      ARTH1     SAP025X.   ARTHLMT   SAP025X.   ARTHTYP1  SAP080X.
      ARTHTYP2  SAP080X.   ARTHTYP3  SAP080X.   ARTHTYP4  SAP080X.
      ARTHTYP5  SAP080X.   ARTHTYP6  SAP080X.   PAINECK   SAP025X.
      PAINLB    SAP025X.   PAINLEG   SAP025X.   PAINFACE  SAP025X.
      AMIGR     SAP025X.   ACOLD2W   SAP025X.   AINTIL2W  SAP025X.
      PREGNOW   SAP025X.   MENSYR    SAP025X.   MENOYR    SAP025X.
      GYNYR     SAP025X.   PROSTYR   SAP025X.   AHEARST1  SAP208X.
      HRWORS    SAP025X.   HRWHICH   SAP210X.   HRRIGHT   SAP208X.
      HRLEFT    SAP208X.   HRWHISP   SAP025X.   HRTALK    SAP025X.
      HRSHOUT   SAP025X.   HRSPEAK   SAP025X.   HRBACK    SAP217X.
      HRFRUST   SAP217X.   HRSAFETY  SAP217X.   HEARAGE1  SAP220X.
      HRSUDDEN  SAP221X.   HRCAUS1   SAP222X.   HRFAM     SAP025X.
      HRPROBHP  SAP224X.   HRENT     SAP025X.   HRAUD     SAP025X.
      HRTEST    SAP224X.   HRCOCREC  SAP025X.   HRCOCNOW  SAP025X.
      HRAIDNOW  SAP025X.   HRAIDLNG  SAP231X.   HRAIDYR   SAP217X.
      HRAIDEV   SAP025X.   HRAIDREC  SAP025X.   HRAIDLGP  SAP231X.
      HRAIDOFT  SAP217X.   HRAIDNT1  SAP080X.   HRAIDNT2  SAP080X.
      HRAIDNT3  SAP080X.   HRAIDNT4  SAP080X.   HRAIDNT5  SAP080X.
      HRAIDNT6  SAP080X.   HRAIDNT7  SAP080X.   HRAIDNT8  SAP080X.
      HRAIDNT9  SAP080X.   HRALDS    SAP025X.   HRALDTP1  SAP080X.
      HRALDTP2  SAP080X.   HRALDTP3  SAP080X.   HRALDTP4  SAP080X.
      HRALDTP5  SAP080X.   HRALDTP6  SAP080X.   HRALDTP7  SAP080X.
      HRALDTP8  SAP080X.   HRALDTP9  SAP080X.   HRTIN     SAP025X.
      HRTINLNG  SAP257X.   HRTINOFT  SAP258X.   HRTINMUS  SAP025X.
      HRTINSLP  SAP025X.   HRTNPROB  SAP261X.   HRTINDIS  SAP025X.
      HRTINRM   SAP025X.   HREMTP01  SAP080X.   HREMTP02  SAP080X.
      HREMTP03  SAP080X.   HREMTP04  SAP080X.   HREMTP05  SAP080X.
      HREMTP06  SAP080X.   HREMTP07  SAP080X.   HREMTP08  SAP080X.
      HREMTP09  SAP080X.   HREMTP10  SAP080X.   HREMTP11  SAP080X.
      HREMTP12  SAP080X.   HREMTP13  SAP080X.   HREMTP14  SAP080X.
      HREMTP15  SAP080X.   HRFIRE    SAP025X.   HRFIRTYP  SAP280X.
      HRTOTR    SAP281X.   HR12MR    SAP282X.   HRFRPROT  SAP217X.
      HRWRKNOS  SAP025X.   HRWRKTOT  SAP285X.   HRWRKYR   SAP025X.
      HRWKPROT  SAP217X.   HRLESNOS  SAP025X.   HRLESYR   SAP025X.
      HRLSPROT  SAP217X.   HRLSTP01  SAP080X.   HRLSTP02  SAP080X.
      HRLSTP03  SAP080X.   HRLSTP04  SAP080X.   HRLSTP05  SAP080X.
      HRLSTP06  SAP080X.   HRLSTP07  SAP080X.   HRLSTP08  SAP080X.
      HRLSTP09  SAP080X.   HRLSTP10  SAP080X.   AVISION   SAP025X.
      ABLIND    SAP025X.   LUPPRT    SAP025X.   SAD       SAP304X.
      NERVOUS   SAP304X.   RESTLESS  SAP304X.   HOPELESS  SAP304X.
      EFFORT    SAP304X.   WORTHLS   SAP304X.   MHAMTMO   SAP310X.

      /* AHS FORMAT ASSOCIATIONS */

      WRKLYR3   SAP311X.   WKDAYR    SAP312X.   BEDDAYR   SAP312X.
      AHSTATYR  SAP314X.   SPECEQ    SAP025X.   FLWALK    SAP316X.
      FLCLIMB   SAP316X.   FLSTAND   SAP316X.   FLSIT     SAP316X.
      FLSTOOP   SAP316X.   FLREACH   SAP316X.   FLGRASP   SAP316X.
      FLCARRY   SAP316X.   FLPUSH    SAP316X.   FLSHOP    SAP316X.
      FLSOCL    SAP316X.   FLRELAX   SAP316X.   FLA1AR    SAP328X.
      AFLHCA1   SAP080X.   AFLHCA2   SAP080X.   AFLHCA3   SAP080X.
      AFLHCA4   SAP080X.   AFLHCA5   SAP080X.   AFLHCA6   SAP080X.
      AFLHCA7   SAP080X.   AFLHCA8   SAP080X.   AFLHCA9   SAP080X.
      AFLHCA10  SAP080X.   AFLHCA11  SAP080X.   AFLHCA12  SAP080X.
      AFLHCA13  SAP080X.   AFLHCA14  SAP080X.   AFLHCA15  SAP080X.
      AFLHCA16  SAP080X.   AFLHCA17  SAP080X.   AFLHCA18  SAP080X.
      AFLHC19_  SAP080X.   AFLHC20_  SAP080X.   AFLHC21_  SAP080X.
      AFLHC22_  SAP080X.   AFLHC23_  SAP080X.   AFLHC24_  SAP080X.
      AFLHC25_  SAP080X.   AFLHC26_  SAP080X.   AFLHC27_  SAP080X.
      AFLHC28_  SAP080X.   AFLHC29_  SAP080X.   AFLHC30_  SAP080X.
      AFLHC31_  SAP080X.   AFLHC32_  SAP080X.   AFLHC33_  SAP080X.
      AFLHC34_  SAP080X.   AFLHCA90  SAP080X.   AFLHCA91  SAP080X.
      ALTIME1   SAP365X.   ALUNIT1   SAP366X.   ALDURA1   SAP367X.
      ALDURB1   SAP368X.   ALCHRC1   SAP369X.   ALTIME2   SAP365X.
      ALUNIT2   SAP366X.   ALDURA2   SAP367X.   ALDURB2   SAP368X.
      ALCHRC2   SAP369X.   ALTIME3   SAP365X.   ALUNIT3   SAP366X.
      ALDURA3   SAP367X.   ALDURB3   SAP368X.   ALCHRC3   SAP369X.
      ALTIME4   SAP365X.   ALUNIT4   SAP366X.   ALDURA4   SAP367X.
      ALDURB4   SAP368X.   ALCHRC4   SAP369X.   ALTIME5   SAP365X.
      ALUNIT5   SAP366X.   ALDURA5   SAP367X.   ALDURB5   SAP368X.
      ALCHRC5   SAP369X.   ALTIME6   SAP365X.   ALUNIT6   SAP366X.
      ALDURA6   SAP367X.   ALDURB6   SAP368X.   ALCHRC6   SAP369X.
      ALTIME7   SAP365X.   ALUNIT7   SAP366X.   ALDURA7   SAP367X.
      ALDURB7   SAP368X.   ALCHRC7   SAP369X.   ALTIME8   SAP365X.
      ALUNIT8   SAP366X.   ALDURA8   SAP367X.   ALDURB8   SAP368X.
      ALCHRC8   SAP369X.   ALTIME9   SAP365X.   ALUNIT9   SAP366X.
      ALDURA9   SAP367X.   ALDURB9   SAP368X.   ALCHRC9   SAP369X.
      ALTIME10  SAP365X.   ALUNIT10  SAP366X.   ALDURA10  SAP367X.
      ALDURB10  SAP368X.   ALCHRC10  SAP369X.   ALTIME11  SAP365X.
      ALUNIT11  SAP366X.   ALDURA11  SAP367X.   ALDURB11  SAP368X.
      ALCHRC11  SAP369X.   ALTIME12  SAP365X.   ALUNIT12  SAP366X.
      ALDURA12  SAP367X.   ALDURB12  SAP368X.   ALCHRC12  SAP369X.
      ALTIME13  SAP365X.   ALUNIT13  SAP366X.   ALDURA13  SAP367X.
      ALDURB13  SAP368X.   ALCHRC13  SAP369X.   ALTIME14  SAP365X.
      ALUNIT14  SAP366X.   ALDURA14  SAP367X.   ALDURB14  SAP368X.
      ALCHRC14  SAP369X.   ALTIME15  SAP365X.   ALUNIT15  SAP366X.
      ALDURA15  SAP367X.   ALDURB15  SAP368X.   ALCHRC15  SAP369X.
      ALTIME16  SAP365X.   ALUNIT16  SAP366X.   ALDURA16  SAP367X.
      ALDURB16  SAP368X.   ALCHRC16  SAP369X.   ALTIME17  SAP365X.
      ALUNIT17  SAP366X.   ALDURA17  SAP367X.   ALDURB17  SAP368X.
      ALCHRC17  SAP369X.   ALTIME18  SAP365X.   ALUNIT18  SAP366X.
      ALDURA18  SAP367X.   ALDURB18  SAP368X.   ALCHRC18  SAP369X.
      ALTIME19  SAP365X.   ALUNIT19  SAP366X.   ALDURA19  SAP367X.
      ALDURB19  SAP368X.   ALCHRC19  SAP369X.   ALTIME20  SAP365X.
      ALUNIT20  SAP366X.   ALDURA20  SAP367X.   ALDURB20  SAP368X.
      ALCHRC20  SAP369X.   ALTIME21  SAP365X.   ALUNIT21  SAP366X.
      ALDURA21  SAP367X.   ALDURB21  SAP368X.   ALCHRC21  SAP369X.
      ALTIME22  SAP365X.   ALUNIT22  SAP366X.   ALDURA22  SAP367X.
      ALDURB22  SAP368X.   ALCHRC22  SAP369X.   ALTIME23  SAP365X.
      ALUNIT23  SAP366X.   ALDURA23  SAP367X.   ALDURB23  SAP368X.
      ALCHRC23  SAP369X.   ALTIME24  SAP365X.   ALUNIT24  SAP366X.
      ALDURA24  SAP367X.   ALDURB24  SAP368X.   ALCHRC24  SAP369X.
      ALTIME25  SAP365X.   ALUNIT25  SAP366X.   ALDURA25  SAP367X.
      ALDURB25  SAP368X.   ALCHRC25  SAP369X.   ALTIME26  SAP365X.
      ALUNIT26  SAP366X.   ALDURA26  SAP367X.   ALDURB26  SAP368X.
      ALCHRC26  SAP369X.   ALTIME27  SAP365X.   ALUNIT27  SAP366X.
      ALDURA27  SAP367X.   ALDURB27  SAP368X.   ALCHRC27  SAP369X.
      ALTIME28  SAP365X.   ALUNIT28  SAP366X.   ALDURA28  SAP367X.
      ALDURB28  SAP368X.   ALCHRC28  SAP369X.   ALTIME29  SAP365X.
      ALUNIT29  SAP366X.   ALDURA29  SAP367X.   ALDURB29  SAP368X.
      ALCHRC29  SAP369X.   ALTIME30  SAP365X.   ALUNIT30  SAP366X.
      ALDURA30  SAP367X.   ALDURB30  SAP368X.   ALCHRC30  SAP369X.
      ALTIME31  SAP365X.   ALUNIT31  SAP366X.   ALDURA31  SAP367X.
      ALDURB31  SAP368X.   ALCHRC31  SAP369X.   ALTIME32  SAP365X.
      ALUNIT32  SAP366X.   ALDURA32  SAP367X.   ALDURB32  SAP368X.
      ALCHRC32  SAP369X.   ALTIME33  SAP365X.   ALUNIT33  SAP366X.
      ALDURA33  SAP367X.   ALDURB33  SAP368X.   ALCHRC33  SAP369X.
      ALTIME34  SAP365X.   ALUNIT34  SAP366X.   ALDURA34  SAP367X.
      ALDURB34  SAP368X.   ALCHRC34  SAP369X.   ALTIME90  SAP365X.
      ALUNIT90  SAP366X.   ALDURA90  SAP367X.   ALDURB90  SAP368X.
      ALCHRC90  SAP369X.   ALTIME91  SAP365X.   ALUNIT91  SAP366X.
      ALDURA91  SAP367X.   ALDURB91  SAP368X.   ALCHRC91  SAP369X.
      ALCNDRT   SAP545X.   ALCHRONR  SAP546X.

      /* AHB FORMAT ASSOCIATIONS */

      SMKEV     SAP025X.   SMKREG    SAP548X.   SMKNOW    SAP549X.
      SMKSTAT2  SAP550X.   SMKQTNO   SAP551X.   SMKQTTP   SAP552X.
      SMKQTY    SAP553X.   CIGSDA1   SAP554X.   CIGDAMO   SAP555X.
      CIGSDA2   SAP554X.   CIGSDAY   SAP554X.   CIGQTYR   SAP025X.
      VIGNO     SAP559X.   VIGTP     SAP560X.   VIGFREQW  SAP561X.
      VIGLNGNO  SAP562X.   VIGLNGTP  SAP563X.   VIGMIN    SAP562X.
      MODNO     SAP559X.   MODTP     SAP560X.   MODFREQW  SAP567X.
      MODLNGNO  SAP562X.   MODLNGTP  SAP563X.   MODMIN    SAP562X.
      STRNGNO   SAP559X.   STRNGTP   SAP560X.   STRFREQW  SAP573X.
      ALC1YR    SAP025X.   ALCLIFE   SAP025X.   ALC12MNO  SAP576X.
      ALC12MTP  SAP577X.   ALC12MWK  SAP578X.   ALC12MYR  SAP579X.
      ALCAMT    SAP580X.   ALCSTAT   SAP581X.   ALC5UPNO  SAP579X.
      ALC5UPTP  SAP583X.   ALC5UPYR  SAP579X.   AHEIGHT   SAP585X.
      AWEIGHTP  SAP586X.   BMI       SAP587X.   SLEEP     SAP588X.

      /* AAU FORMAT ASSOCIATIONS */

      AUSUALPL  SAP589X.   APLKIND   SAP590X.   AHCPLROU  SAP025X.
      AHCPLKND  SAP592X.   AHCCHGYR  SAP025X.   AHCCHGHI  SAP025X.
      AHCDLYR1  SAP025X.   AHCDLYR2  SAP025X.   AHCDLYR3  SAP025X.
      AHCDLYR4  SAP025X.   AHCDLYR5  SAP025X.   AHCAFYR1  SAP025X.
      AHCAFYR2  SAP025X.   AHCAFYR3  SAP025X.   AHCAFYR4  SAP025X.
      ADNLONG2  SAP604X.   AHCSYR1   SAP025X.   AHCSYR2   SAP025X.
      AHCSYR3   SAP025X.   AHCSYR4   SAP025X.   AHCSYR5   SAP025X.
      AHCSYR6   SAP025X.   AHCSYR7   SAP025X.   AHCSYR8   SAP025X.
      AHCSYR9   SAP025X.   AHCSYR10  SAP025X.   AHERNOY2  SAP615X.
      AHCHYR    SAP025X.   AHCHMOYR  SAP588X.   AHCHNOY2  SAP618X.
      AHCNOYR2  SAP615X.   ASRGYR    SAP025X.   ASRGNOYR  SAP621X.
      AMDLONGR  SAP604X.   SHTFLUYR  SAP025X.   ASHFLU_M  SAP624X.
      ASHFLU_Y  SAP625X.   SPRFLUYR  SAP025X.   ASPFLU_M  SAP624X.
      ASPFLU_Y  SAP625X.   SHTPNUYR  SAP025X.   APOX      SAP025X.
      APOX12MO  SAP025X.   AHEP      SAP025X.   AHEPLIV   SAP025X.
      SHTHEPB   SAP025X.   SHEPDOS   SAP635X.

      /* ADS FORMAT ASSOCIATIONS */

      BLDGV     SAP025X.   BLDG12M   SAP025X.   HIVTST    SAP025X.
      WHYTST_R  SAP639X.   TST12M_M  SAP640X.   TST12M_Y  SAP641X.
      TIMETST   SAP642X.   REATST_C  SAP643X.   REASWHOR  SAP644X.
      LASTST_C  SAP645X.   CLNTYP_C  SAP646X.   WHOADM    SAP647X.
      GIVNAM    SAP025X.   EXTST12M  SAP025X.   CHNSADSP  SAP650X.
      STMTRU    SAP651X.   STD       SAP025X.   STDDOC    SAP025X.
      STDWHER   SAP654X.   TBHRD     SAP025X.   TBKNOW    SAP025X.
      TB        SAP657X.   TBSPRD1   SAP080X.   TBSPRD2   SAP080X.
      TBSPRD3   SAP080X.   TBSPRD4   SAP080X.   TBSPRD5   SAP080X.
      TBSPRD6   SAP080X.   TBCURED   SAP025X.   TBCHANC   SAP665X.
      TBSHAME   SAP025X.   HOMELESS  SAP025X.;
RUN;

PROC CONTENTS DATA=NHIS.SAMADULT;
   TITLE1 'CONTENTS OF THE 2007 NHIS Sample Adult FILE';

PROC FREQ DATA=NHIS.SAMADULT NOTITLE;
   TABLES RECTYPE/LIST MISSING;
   TITLE1 'FREQUENCY REPORT FOR 2007 NHIS Sample Adult FILE';
   TITLE2 '(WEIGHTED)';
   WEIGHT WTFA_SA;

PROC FREQ DATA=NHIS.SAMADULT NOTITLE;
   TABLES RECTYPE/LIST MISSING;
   TITLE1 'FREQUENCY REPORT FOR 2007 NHIS Sample Adult FILE';
   TITLE2 '(UNWEIGHTED)';

* USER NOTE: TO SEE UNFORMATTED VALUES IN PROCEDURES, ADD THE
             STATEMENT: FORMAT _ALL_;
RUN;
