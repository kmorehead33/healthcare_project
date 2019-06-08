*********************************************************************
 MAY 30, 2007  9:11 AM
 
 This is an example of a SAS program that creates a SAS
 file from the 2006 NHIS Public Use PERSONSX.DAT ASCII file
 
 This is stored in PERSONSX.SAS
*********************************************************************;

* USER NOTE: PLACE NEXT STATEMENT IN SUBSEQUENT PROGRAMS;
LIBNAME  NHIS     "C:\NHIS2006";

* USER NOTE: PLACE NEXT STATEMENT IN SUBSEQUENT PROGRAMS
             IF YOU ALLOW PROGRAM TO PERMANENTLY STORE FORMATS;
LIBNAME  LIBRARY  "C:\NHIS2006";

FILENAME ASCIIDAT 'C:\NHIS2006\PERSONSX.dat';

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
   VALUE PEP001X
      10                 = "10 Household"
      20                 = "20 Person"
      30                 = "30 Sample Adult"
      31                 = "31 Sample Adult Cancer"
      40                 = "40 Sample Child"
      60                 = "60 Family"
      70                 = "70 Injury/Poisoning Episode"
      75                 = "75 Injury/Poisoning Verbatim"
   ;
   VALUE PEP002X
      OTHER              = "Survey Year"
   ;
   VALUE PEP004X
      1                  = "1 Quarter 1"
      2                  = "2 Quarter 2"
      3                  = "3 Quarter 3"
      4                  = "4 Quarter 4"
   ;
   VALUE PEP005X
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
   VALUE PEP010X
      1                  = "1 Northeast"
      2                  = "2 Midwest"
      3                  = "3 South"
      4                  = "4 West"
   ;
   VALUE PEP013X
      1                  = "1 Male"
      2                  = "2 Female"
   ;
   VALUE PEP014X
      1                  = "1 Yes"
      2                  = "2 No"
   ;
   VALUE PEP015X
      1                  = "1 Imputed: was 'refused' Hispanic Origin"
      2                  = "2 Imputed: was 'not ascertained' Hispanic Origin"
      3                  = "3 Imputed: was 'does not know' Hispanic Origin"
      4                  = "4 Hispanic origin given by respondent/proxy"
   ;
   VALUE PEP016X
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
   VALUE PEP017X
      1                  = "1 Imputed: was 'refused' Hispanic Origin"
      2                  = "2 Imputed: was 'not ascertained' Hispanic Origin"
      3                  = "3 Imputed: was 'does not know' Hispanic Origin"
      4                  = "4 Hispanic Origin type given by respondent/proxy"
   ;
   VALUE PEP018X
      01                 = "01 White only"
      02                 = "02 Black/African American only"
      03                 = "03 AIAN only"
      04                 = "04 Asian only"
      05                 = "05 Race group not releasable (See file layout)"
      06                 = "06 Multiple race"
   ;
   VALUE PEP019X
      1                  = "1 Imputed: was 'refused'"
      2                  = "2 Imputed: was 'not ascertained'"
      3                  = "3 Imputed: was 'does not know'"
      4                  = "4 Imputed: was other race'"
      5                  = "5 Imputed: was 'unspecified multiple race'"
      6                  = "6 Race given by respondent/proxy"
   ;
   VALUE PEP020X
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
   VALUE PEP021X
      01                 = "01 White"
      02                 = "02 Black/African American"
      03                 = "03 Indian (American) (includes Eskimo, Aleut)"
      06                 = "06 Chinese"
      07                 = "07 Filipino"
      12                 = "12 Asian Indian"
      16                 = "16 Other race (See file layout)"
      17                 = "17 Multiple race, no primary race selected"
   ;
   VALUE PEP022X
      1                  = "1 White"
      2                  = "2 Black"
      3                  = "3 Asian"
      4                  = "4 All other race groups (See file layout)"
   ;
   VALUE PEP023X
      1                  = "1 Hispanic"
      2                  = "2 Non-Hispanic White"
      3                  = "3 Non-Hispanic Black"
      4                  = "4 Non-Hispanic Asian"
      5                  = "5 Non-Hispanic All other race groups"
   ;
   VALUE PEP024X
      1                  = "1 Ethnicity/race imputed"
      2                  = "2 Ethnicity/race given by respondent/proxy"
   ;
   VALUE PEP025X
      1                  = "1 Armed Forces"
      2                  = "2 Not Armed Forces"
      7                  = "7 Refused"
      8                  = "8 Not ascertained"
      9                  = "9 Don't know"
   ;
   VALUE PEP026X
      01                 = "01 Household reference person"
      02                 = "02 Spouse (husband/wife)"
      03                 = "03 Unmarried Partner"
      04                 = "04 Child (biological/adoptive/in-law/step/foster)"
      05                 = "05 Child of partner"
      06                 = "06 Grandchild"
      07                 = "07 Parent (biological/adoptive/in-law/step/foster)"
      08                 = 
"08 Brother/sister (biological/adoptive/in-law/step/foster)"
      09                 = "09 Grandparent (Grandmother/Grandfather)"
      10                 = "10 Aunt/Uncle"
      11                 = "11 Niece/Nephew"
      12                 = "12 Other relative"
      13                 = "13 Housemate/roommate"
      14                 = "14 Roomer/Boarder"
      15                 = "15 Other nonrelative"
      16                 = "16 Legal guardian"
      17                 = "17 Ward"
      97                 = "97 Refused"
      98                 = "98 Not ascertained"
      99                 = "99 Don't know"
   ;
   VALUE $PEP027X
      "8"                = "8 Not ascertained"
      "P"                = "P HH Reference person"
   ;
   VALUE PEP028X
      01                 = "01 Family reference person"
      02                 = "02 Spouse (husband/wife)"
      03                 = "03 Unmarried Partner"
      04                 = "04 Child (biological/adoptive/in-law/step/foster)"
      05                 = "05 Child of partner"
      06                 = "06 Grandchild"
      07                 = "07 Parent (biological/adoptive/in-law/step/foster)"
      08                 = 
"08 Brother/sister (biological/adoptive/in-law/step/foster)"
      09                 = "09 Grandparent (Grandmother/Grandfather)"
      10                 = "10 Aunt/Uncle"
      11                 = "11 Niece/Nephew"
      12                 = "12 Other relative"
      16                 = "16 Legal guardian"
      17                 = "17 Ward"
      97                 = "97 Refused"
      98                 = "98 Not ascertained"
      99                 = "99 Don't know"
   ;
   VALUE $PEP029X
      "01"               = "01 January"
      "02"               = "02 February"
      "03"               = "03 March"
      "04"               = "04 April"
      "05"               = "05 May"
      "06"               = "06 June"
      "07"               = "07 July"
      "08"               = "08 August"
      "09"               = "09 September"
      "10"               = "10 October"
      "11"               = "11 November"
      "12"               = "12 December"
      "97"               = "97 Refused"
      "98"               = "98 Not ascertained"
      "99"               = "99 Don't know"
   ;
   VALUE $PEP030X
      OTHER              = "Birth Year"
      ' '                 = 'Missing Value'
      "9997"             = "9997 Refused"
      "9998"             = "9998 Not ascertained"
      "9999"             = "9999 Don't know"
   ;
   VALUE PEP031X
      00                 = "00 Under 1 year"
      85                 = "85 85+ years"
   ;
   VALUE PEP032X
      1                  = "1 Change on AGE due to data entry error"
   ;
   VALUE $PEP033X
      "8"                = "8 Not ascertained"
      "B"                = "B Family respondent"
   ;
   VALUE $PEP034X
      "8"                = "8 Not ascertained"
      "P"                = "P Family reference person"
   ;
   VALUE PEP035X
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
   VALUE $PEP036X
      "98"               = "98 Not ascertained"
   ;
   VALUE PEP037X
      1                  = "1 Yes"
      2                  = "2 No"
      7                  = "7 Refused"
      8                  = "8 Not ascertained"
      9                  = "9 Don't know"
   ;
   VALUE PEP038X
      1                  = "1 Married"
      2                  = "2 Widowed"
      3                  = "3 Divorced"
      4                  = "4 Separated"
      7                  = "7 Refused"
      8                  = "8 Not ascertained"
      9                  = "9 Don't know"
   ;
   VALUE PEP040X
      1                  = "1 Separated"
      2                  = "2 Divorced"
      3                  = "3 Married"
      4                  = "4 Single/never married"
      5                  = "5 Widowed"
      9                  = "9 Unknown marital status"
   ;
   VALUE PEP041X
      1                  = "1 Full {brother/sister}"
      2                  = "2 Half {brother/sister}"
      3                  = "3 Adopted {brother/sister}"
      4                  = "4 Step {brother/sister}"
      5                  = "5 Foster {brother/sister}"
      6                  = "6 {Brother/Sister}-in-law"
      7                  = "7 Refused"
      8                  = "8 Not ascertained"
      9                  = "9 Don't know"
   ;
   VALUE $PEP042X
      "00"               = "00 Mother not a household member"
      "96"               = "96 Has legal guardian"
      "97"               = "97 Refused"
      "98"               = "98 Not ascertained"
      "99"               = "99 Don't know"
   ;
   VALUE PEP043X
      1                  = "1 Biological"
      2                  = "2 Adoptive"
      3                  = "3 Step"
      4                  = "4 Foster"
      5                  = "5 In-law"
      7                  = "7 Refused"
      8                  = "8 Not ascertained"
      9                  = "9 Don't know"
   ;
   VALUE $PEP044X
      "00"               = "00 Father not in household"
      "96"               = "96 Has legal guardian"
      "97"               = "97 Refused"
      "98"               = "98 Not ascertained"
      "99"               = "99 Don't know"
   ;
   VALUE PEP046X
      1                  = "1 Mother, no father"
      2                  = "2 Father, no mother"
      3                  = "3 Mother and father"
      4                  = "4 Neither mother nor father"
      9                  = "9 Unknown"
   ;
   VALUE PEP047X
      01                 = "01 Less/equal to 8th grade"
      02                 = "02 9-12th grade, no high school diploma"
      03                 = "03 High school graduate/GED recipient"
      04                 = "04 Some college, no degree"
      05                 = "05 AA degree, technical or vocational"
      06                 = "06 AA degree, academic program"
      07                 = "07 Bachelor's degree"
      08                 = "08 Master's, professional, or doctoral degree"
      97                 = "97 Refused"
      98                 = "98 Not ascertained"
      99                 = "99 Don't know"
   ;
   VALUE PEP049X
      0                  = "0 Sample Adult - no record"
      1                  = "1 Sample Adult - has record"
      2                  = "2 Not selected as Sample Adult"
      3                  = "3 No one selected as Sample Adult"
      4                  = "4 Armed Force member"
      5                  = "5 Armed Force member - selected as Sample Adult"
   ;
   VALUE PEP050X
      0                  = "0 Sample Child - no record"
      1                  = "1 Sample Child - has record"
      2                  = "2 Not selected as Sample Child"
      3                  = "3 No one selected as Sample Child"
      4                  = "4 Emancipated minor"
   ;
   VALUE PEP064X
      0                  = "0 Unable to work"
      1                  = "1 Limited in work"
      2                  = "2 Not limited in work"
      7                  = "7 Refused"
      8                  = "8 Not ascertained"
      9                  = "9 Don't Know"
   ;
   VALUE PEP067X
      0                  = "0 Limitation previously mentioned"
      1                  = "1 Yes, limited in some other way"
      2                  = "2 Not limited in any way"
      7                  = "7 Refused"
      8                  = "8 Not ascertained"
      9                  = "9 Don't know"
   ;
   VALUE PEP068X
      1                  = "1 Limited in any way"
      2                  = "2 Not limited in any way"
      3                  = "3 Unknown if limited"
   ;
   VALUE PEP069X
      1                  = "1 Mentioned"
      2                  = "2 Not mentioned"
      7                  = "7 Refused"
      8                  = "8 Not ascertained"
      9                  = "9 Don't know"
   ;
   VALUE PEP084X
      95                 = "95 95+"
      96                 = "96 Since birth"
      97                 = "97 Refused"
      98                 = "98 Not ascertained"
      99                 = "99 Don't know"
   ;
   VALUE PEP085X
      1                  = "1 Day(s)"
      2                  = "2 Week(s)"
      3                  = "3 Month(s)"
      4                  = "4 Year(s)"
      6                  = "6 Since birth"
      7                  = "7 Refused"
      8                  = "8 Not ascertained"
      9                  = "9 Don't know"
   ;
   VALUE PEP086X
      00                 = "00 Less than 1 year"
      96                 = "96 Unknown number of years"
      97                 = "97 Refused"
      98                 = "98 Not ascertained"
      99                 = "99 Don't know"
   ;
   VALUE PEP087X
      0                  = "0 Since birth and child <1 year of age"
      1                  = "1 Less than 3 months"
      2                  = "2 3-5 months"
      3                  = "3 6-12 months"
      4                  = "4 More than 1 year"
      7                  = "7 Refused"
      8                  = "8 Not ascertained"
      9                  = "9 Don't know"
   ;
   VALUE PEP088X
      1                  = "1 Chronic"
      2                  = "2 Not chronic"
      9                  = "9 Unknown if chronic"
   ;
   VALUE PEP197X
      00                 = "00 Less than 1 year"
      85                 = "85 85+ years"
      96                 = "96 Unknown number of years"
      97                 = "97 Refused"
      98                 = "98 Not ascertained"
      99                 = "99 Don't know"
   ;
   VALUE PEP198X
      1                  = "1 Less than 3 months"
      2                  = "2 3-5 months"
      3                  = "3 6-12 months"
      4                  = "4 More than 1 year"
      7                  = "7 Refused"
      8                  = "8 Not ascertained"
      9                  = "9 Don't know"
   ;
   VALUE PEP375X
      1                  = 
"1 At least one condition causing lim of activ is chronic"
      2                  = "2 No condition causing lim of activ is chronic"
      9                  = 
"9 Unk if any condition causing lim of activ is chronic"
   ;
   VALUE PEP376X
      0                  = "0 Not limited in any way (incl unk if limited)"
      1                  = "1 Limited; caused by at least one chronic cond"
      2                  = "2 Limited; not caused by chronic cond"
      3                  = "3 Limited; unk if cond is chronic"
   ;
   VALUE PEP377X
      1                  = "1 Excellent"
      2                  = "2 Very good"
      3                  = "3 Good"
      4                  = "4 Fair"
      5                  = "5 Poor"
      7                  = "7 Refused"
      8                  = "8 Not ascertained"
      9                  = "9 Don't know"
   ;
   VALUE PEP381X
      997                = "997 Refused"
      998                = "998 Not ascertained"
      999                = "999 Don't know"
   ;
   VALUE PEP384X
      97                 = "97 Refused"
      98                 = "98 Not ascertained"
      99                 = "99 Don't know"
   ;
   VALUE PEP390X
      1                  = "1 Not covered"
      2                  = "2 Covered"
      7                  = "7 Refused"
      8                  = "8 Not ascertained"
      9                  = "9 Don't know"
   ;
   VALUE PEP391X
      1                  = "1 Yes, information"
      2                  = "2 Yes, but no information"
      3                  = "3 No"
      7                  = "7 Refused"
      8                  = "8 Not ascertained"
      9                  = "9 Don't know"
   ;
   VALUE PEP392X
      1                  = "1 Part A - Hospital only"
      2                  = "2 Part B - Medical only"
      3                  = "3 Both Part A and Part B"
      7                  = "7 Refused"
      8                  = "8 Not ascertained"
      9                  = "9 Don't know"
   ;
   VALUE PEP395X
      04                 = "04 Medigap plan"
      12                 = "12 Group"
      22                 = "22 Staff"
      32                 = "32 IPA"
      92                 = "92 Other"
      97                 = "97 Refused"
      98                 = "98 Not ascertained"
      99                 = "99 Don't know"
   ;
   VALUE PEP400X
      1                  = "1  Any doctor"
      2                  = "2  Select from book/list"
      3                  = "3  Doctor is assigned"
      7                  = "7 Refused"
      8                  = "8 Not ascertained"
      9                  = "9 Don't know"
   ;
   VALUE PEP403X
      1                  = "1 Yes, with information"
      2                  = "2 Yes, but no information"
      3                  = "3 No"
      7                  = "7 Refused"
      8                  = "8 Not ascertained"
      9                  = "9 Don't know"
   ;
   VALUE PEP418X
      1                  = "1 In own name"
      2                  = "2 Someone else in family"
      3                  = "3 Person not in household"
      7                  = "7 Refused"
      8                  = "8 Not ascertained"
      9                  = "9 Don't know"
   ;
   VALUE PEP419X
      01                 = "01 Through employer"
      02                 = "02 Through union"
      03                 = 
"03 Through workplace, but don't know if employer or union"
      04                 = 
"04 Through workplace, self-employed or professional association"
      05                 = "05 Purchased directly"
      06                 = 
"06 Through a state/local government or community program"
      07                 = "07 Other"
      08                 = "08 Through school"
      97                 = "97 Refused"
      98                 = "98 Not ascertained"
      99                 = "99 Don't know"
   ;
   VALUE PEP427X
      20000              = "20000 $20,000 or more"
      99997              = "99997 Refused"
      99998              = "99998 Not ascertained"
      99999              = "99999 Don't know"
   ;
   VALUE PEP428X
      1                  = "1 HMO/IPA"
      2                  = "2 PPO"
      3                  = "3 POS"
      4                  = "4 Fee-for-service/indemnity"
      5                  = "5 Other"
      7                  = "7 Refused"
      8                  = "8 Not ascertained"
      9                  = "9 Don't know"
   ;
   VALUE PEP429X
      1                  = "1 Any doctor"
      2                  = "2 Select from group/list"
      7                  = "7 Refused"
      8                  = "8 Not ascertained"
      9                  = "9 Don't know"
   ;
   VALUE PEP469X
      1                  = "1 TRICARE Prime"
      2                  = "2 TRICARE Extra"
      3                  = "3 TRICARE Standard"
      4                  = "4 TRICARE for life"
      5                  = "5 TRICARE other (specify)"
      7                  = "7 Refused"
      8                  = "8 Not ascertained"
      9                  = "9 Don't know"
   ;
   VALUE PEP471X
      1                  = "1 6 months or less"
      2                  = "2 More than 6 months, but not more than 1 year ago"
      3                  = "3 More than 1 year, but not more than 3 years ago"
      4                  = "4 More than 3 years"
      5                  = "5 Never"
      7                  = "7 Refused"
      8                  = "8 Not ascertained"
      9                  = "9 Don't know"
   ;
   VALUE PEP489X
      0                  = "0 Zero"
      1                  = "1 Less than $500"
      2                  = "2 $500 - $1,999"
      3                  = "3 $2,000 - $2,999"
      4                  = "4 $3,000 - $4,999"
      5                  = "5 $5,000 or more"
      7                  = "7 Refused"
      8                  = "8 Not ascertained"
      9                  = "9 Don't know"
   ;
   VALUE PEP505X
      01                 = "01 United States"
      02                 = "02 Mexico, Central America, Caribbean Islands"
      03                 = "03 South America"
      04                 = "04 Europe"
      05                 = "05 Russia (and former USSR areas)"
      06                 = "06 Africa"
      07                 = "07 Middle East"
      08                 = "08 Indian Subcontinent"
      09                 = "09 Asia"
      10                 = "10 SE Asia"
      11                 = "11 Elsewhere"
      99                 = "99 Unknown"
   ;
   VALUE PEP506X
      1                  = "1 USA: born in one of the 50 United States or D.C."
      2                  = "2 USA: born in a U.S. territory"
      3                  = "3 Not born in the U.S. or a U.S. territory"
      7                  = "7 Refused"
      8                  = "8 Not ascertained"
      9                  = "9 Don't know"
   ;
   VALUE PEP507X
      1                  = "1 Less than 1 year"
      2                  = "2 1 yr., less than 5 yrs."
      3                  = "3 5 yrs., less than 10 yrs."
      4                  = "4 10 yrs., less than 15 yrs."
      5                  = "5 15 years or more"
      9                  = "9 Unknown"
   ;
   VALUE PEP508X
      1                  = "1 Yes, citizen of the United States"
      2                  = "2 No, not a citizen of the United States"
      7                  = "7 Refused"
      8                  = "8 Not ascertained"
      9                  = "9 Don't know"
   ;
   VALUE PEP511X
      00                 = "00 Never attended/kindergarten only"
      01                 = "01 1st grade"
      02                 = "02 2nd grade"
      03                 = "03 3rd grade"
      04                 = "04 4th grade"
      05                 = "05 5th grade"
      06                 = "06 6th grade"
      07                 = "07 7th grade"
      08                 = "08 8th grade"
      09                 = "09 9th grade"
      10                 = "10th grade"
      11                 = "11th grade"
      12                 = "12th grade, no diploma"
      13                 = "13 GED or equivalent"
      14                 = "14 High School Graduate"
      15                 = "15 Some college, no degree"
      16                 = 
"16 Associate degree: occupational, technical, or vocational program"
      17                 = "17 Associate degree: academic program"
      18                 = "18 Bachelor's degree (Example: BA, AB, BS, BBA)"
      19                 = "19 Master's degree (Example: MA, MS, MEng, MEd, MBA)
"
      20                 = 
"20 Professional School degree (Example: MD, DDS, DVM, JD)"
      21                 = "21 Doctoral degree (Example: PhD, EdD)"
      96                 = "96 Child under 5 years old"
      97                 = "97 Refused"
      98                 = "98 Not ascertained"
      99                 = "99 Don't know"
   ;
   VALUE PEP513X
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
   VALUE PEP514X
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
   VALUE PEP515X
      95                 = "95 95+ hours"
      97                 = "97 Refused"
      98                 = "98 Not ascertained"
      99                 = "99 Don't know"
   ;
   VALUE PEP518X
      01                 = "01 1 month or less"
      97                 = "97 Refused"
      98                 = "98 Not ascertained"
      99                 = "99 Don't know"
   ;
   VALUE PEP519X
      01                 = "01 $01-$4,999"
      02                 = "02 $5,000-$9,999"
      03                 = "03 $10,000-$14,999"
      04                 = "04 $15,000-$19,999"
      05                 = "05 $20,000-$24,999"
      06                 = "06 $25,000-$34,999"
      07                 = "07 $35,000-$44,999"
      08                 = "08 $45,000-$54,999"
      09                 = "09 $55,000-$64,999"
      10                 = "10 $65,000-$74,999"
      11                 = "11 $75,000 and over"
      97                 = "97 Refused"
      98                 = "98 Not ascertained"
      99                 = "99 Don't know"
   ;
   VALUE PEP541X
      0                  = "0 No WIC age-eligible family members"
      1                  = "1 At least 1 WIC age-eligible family member"
   ;
   VALUE PEP543X
      0                  = "0 Person not age-eligible"
      1                  = "1 Person age-eligible"
   ;

DATA NHIS.PERSONSX;
   * CREATE A SAS DATA SET;
   INFILE ASCIIDAT PAD LRECL=716;

   * DEFINE LENGTH OF ALL VARIABLES;

   LENGTH

      /* IDN LENGTHS */

      RECTYPE    3   SRVY_YR    4   HHX      $ 6   INTV_QRT   3
      ASSIGNWK   3   FMX      $ 2   FPX      $ 2   WTIA       8
      WTFA       8

      /* UCF LENGTHS */

      REGION     3   STRAT_P    4   PSU_P      3

      /* HHC LENGTHS */

      SEX        3   ORIGIN_I   3   ORIGIMPT   3   HISPAN_I   3
      HISPIMPT   3   RACERPI2   3   RACEIMP2   3   MRACRPI2   3
      MRACBPI2   3   RACRECI3   3   HISCODI3   3   ERIMPFLG   3
      NOWAF      3   RRP        3   HHREFLG  $ 1   FRRP       3
      DOB_M    $ 2   DOB_Y_P  $ 4   AGE_P      3   AGE_CHG    3

      /* FID LENGTHS */

      FMRPFLG  $ 1   FMREFLG  $ 1   R_MARITL   3   FSPOUS2  $ 2
      COHAB1     3   COHAB2     3   FCOHAB3  $ 2   CDCMSTAT   3
      SIB_DEG    3   FMOTHER  $ 2   MOM_DEG    3   FFATHER  $ 2
      DAD_DEG    3   PARENTS    3   MOM_ED     3   DAD_ED     3
      ASTATFLG   3   CSTATFLG   3

      /* FHS LENGTHS */

      PLAPLYLM   3   PLAPLYUN   3   PSPEDEIS   3   PSPEDEM    3
      PLAADL     3   LABATH     3   LADRESS    3   LAEAT      3
      LABED      3   LATOILT    3   LAHOME     3   PLAIADL    3
      PLAWKNOW   3   PLAWKLIM   3   PLAWALK    3   PLAREMEM   3
      PLIMANY    3   LA1AR      3   LAHCC1     3   LAHCC2     3
      LAHCC3     3   LAHCC4     3   LAHCC5     3   LAHCC6     3
      LAHCC7     3   LAHCC8     3   LAHCC9     3   LAHCC10    3
      LAHCC11    3   LAHCC12    3   LAHCC13    3   LAHCC90    3
      LAHCC91    3   LCTIME1    3   LCUNIT1    3   LCDURA1    3
      LCDURB1    3   LCCHRC1    3   LCTIME2    3   LCUNIT2    3
      LCDURA2    3   LCDURB2    3   LCCHRC2    3   LCTIME3    3
      LCUNIT3    3   LCDURA3    3   LCDURB3    3   LCCHRC3    3
      LCTIME4    3   LCUNIT4    3   LCDURA4    3   LCDURB4    3
      LCCHRC4    3   LCTIME5    3   LCUNIT5    3   LCDURA5    3
      LCDURB5    3   LCCHRC5    3   LCTIME6    3   LCUNIT6    3
      LCDURA6    3   LCDURB6    3   LCCHRC6    3   LCTIME7    3
      LCUNIT7    3   LCDURA7    3   LCDURB7    3   LCCHRC7    3
      LCTIME8    3   LCUNIT8    3   LCDURA8    3   LCDURB8    3
      LCCHRC8    3   LCTIME9    3   LCUNIT9    3   LCDURA9    3
      LCDURB9    3   LCCHRC9    3   LCTIME10   3   LCUNIT10   3
      LCDURA10   3   LCDURB10   3   LCCHRC10   3   LCTIME11   3
      LCUNIT11   3   LCDURA11   3   LCDURB11   3   LCCHRC11   3
      LCTIME12   3   LCUNIT12   3   LCDURA12   3   LCDURB12   3
      LCCHRC12   3   LCTIME13   3   LCUNIT13   3   LCDURA13   3
      LCDURB13   3   LCCHRC13   3   LCTIME90   3   LCUNIT90   3
      LCDURA90   3   LCDURB90   3   LCCHRC90   3   LCTIME91   3
      LCUNIT91   3   LCDURA91   3   LCDURB91   3   LCCHRC91   3
      LAHCA1     3   LAHCA2     3   LAHCA3     3   LAHCA4     3
      LAHCA5     3   LAHCA6     3   LAHCA7     3   LAHCA8     3
      LAHCA9     3   LAHCA10    3   LAHCA11    3   LAHCA12    3
      LAHCA13    3   LAHCA14    3   LAHCA15    3   LAHCA16    3
      LAHCA17    3   LAHCA18    3   LAHCA19_   3   LAHCA20_   3
      LAHCA21_   3   LAHCA22_   3   LAHCA23_   3   LAHCA24_   3
      LAHCA25_   3   LAHCA26_   3   LAHCA27_   3   LAHCA28_   3
      LAHCA29_   3   LAHCA30_   3   LAHCA31_   3   LAHCA32_   3
      LAHCA33_   3   LAHCA34_   3   LAHCA90    3   LAHCA91    3
      LATIME1    3   LAUNIT1    3   LADURA1    3   LADURB1    3
      LACHRC1    3   LATIME2    3   LAUNIT2    3   LADURA2    3
      LADURB2    3   LACHRC2    3   LATIME3    3   LAUNIT3    3
      LADURA3    3   LADURB3    3   LACHRC3    3   LATIME4    3
      LAUNIT4    3   LADURA4    3   LADURB4    3   LACHRC4    3
      LATIME5    3   LAUNIT5    3   LADURA5    3   LADURB5    3
      LACHRC5    3   LATIME6    3   LAUNIT6    3   LADURA6    3
      LADURB6    3   LACHRC6    3   LATIME7    3   LAUNIT7    3
      LADURA7    3   LADURB7    3   LACHRC7    3   LATIME8    3
      LAUNIT8    3   LADURA8    3   LADURB8    3   LACHRC8    3
      LATIME9    3   LAUNIT9    3   LADURA9    3   LADURB9    3
      LACHRC9    3   LATIME10   3   LAUNIT10   3   LADURA10   3
      LADURB10   3   LACHRC10   3   LATIME11   3   LAUNIT11   3
      LADURA11   3   LADURB11   3   LACHRC11   3   LATIME12   3
      LAUNIT12   3   LADURA12   3   LADURB12   3   LACHRC12   3
      LATIME13   3   LAUNIT13   3   LADURA13   3   LADURB13   3
      LACHRC13   3   LATIME14   3   LAUNIT14   3   LADURA14   3
      LADURB14   3   LACHRC14   3   LATIME15   3   LAUNIT15   3
      LADURA15   3   LADURB15   3   LACHRC15   3   LATIME16   3
      LAUNIT16   3   LADURA16   3   LADURB16   3   LACHRC16   3
      LATIME17   3   LAUNIT17   3   LADURA17   3   LADURB17   3
      LACHRC17   3   LATIME18   3   LAUNIT18   3   LADURA18   3
      LADURB18   3   LACHRC18   3   LATIME19   3   LAUNIT19   3
      LADURA19   3   LADURB19   3   LACHRC19   3   LATIME20   3
      LAUNIT20   3   LADURA20   3   LADURB20   3   LACHRC20   3
      LATIME21   3   LAUNIT21   3   LADURA21   3   LADURB21   3
      LACHRC21   3   LATIME22   3   LAUNIT22   3   LADURA22   3
      LADURB22   3   LACHRC22   3   LATIME23   3   LAUNIT23   3
      LADURA23   3   LADURB23   3   LACHRC23   3   LATIME24   3
      LAUNIT24   3   LADURA24   3   LADURB24   3   LACHRC24   3
      LATIME25   3   LAUNIT25   3   LADURA25   3   LADURB25   3
      LACHRC25   3   LATIME26   3   LAUNIT26   3   LADURA26   3
      LADURB26   3   LACHRC26   3   LATIME27   3   LAUNIT27   3
      LADURA27   3   LADURB27   3   LACHRC27   3   LATIME28   3
      LAUNIT28   3   LADURA28   3   LADURB28   3   LACHRC28   3
      LATIME29   3   LAUNIT29   3   LADURA29   3   LADURB29   3
      LACHRC29   3   LATIME30   3   LAUNIT30   3   LADURA30   3
      LADURB30   3   LACHRC30   3   LATIME31   3   LAUNIT31   3
      LADURA31   3   LADURB31   3   LACHRC31   3   LATIME32   3
      LAUNIT32   3   LADURA32   3   LADURB32   3   LACHRC32   3
      LATIME33   3   LAUNIT33   3   LADURA33   3   LADURB33   3
      LACHRC33   3   LATIME34   3   LAUNIT34   3   LADURA34   3
      LADURB34   3   LACHRC34   3   LATIME90   3   LAUNIT90   3
      LADURA90   3   LADURB90   3   LACHRC90   3   LATIME91   3
      LAUNIT91   3   LADURA91   3   LADURB91   3   LACHRC91   3
      LCONDRT    3   LACHRONR   3   PHSTAT     3

      /* FAU LENGTHS */

      PDMED12M   3   PNMED12M   3   PHOSPYR2   3   HOSPNO     4
      HPNITE     4   PHCHM2W    3   PHCHMN2W   3   PHCPH2WR   3
      PHCPHN2W   3   PHCDV2W    3   PHCDVN2W   3   P10DVYR    3

      /* FHI LENGTHS */

      NOTCOV     3   MEDICARE   3   MCPART     3   MCCHOICE   3
      MCHMO      3   MCNAMEN    3   MCREF      3   MCPAYPRE   3
      MCPARTD    3   MEDICAID   3   MACHMD     3   MAPCMD     3
      MAREF      3   SINGLE     3   SSTYPEA    3   SSTYPEB    3
      SSTYPEC    3   SSTYPED    3   SSTYPEE    3   SSTYPEF    3
      SSTYPEG    3   SSTYPEH    3   SSTYPEI    3   SSTYPEJ    3
      SSTYPEK    3   SSTYPEL    3   PRIVATE    3   HITYPE1    3
      WHONAM1    3   PLNWRKN1   3   PLNPAY11   3   PLNPAY21   3
      PLNPAY31   3   PLNPAY41   3   PLNPAY51   3   PLNPAY61   3
      PLNPAY71   3   HICOSTR1   4   PLNMGD1    3   MGCHMD1    3
      MGPRMD1    3   MGPYMD1    3   MGPREF1    3   PRRXCOV1   3
      HITYPE2    3   WHONAM2    3   PLNWRKN2   3   PLNPAY12   3
      PLNPAY22   3   PLNPAY32   3   PLNPAY42   3   PLNPAY52   3
      PLNPAY62   3   PLNPAY72   3   HICOSTR2   4   PLNMGD2    3
      MGCHMD2    3   MGPRMD2    3   MGPYMD2    3   MGPREF2    3
      PRRXCOV2   3   PRPLPLUS   3   SCHIP      3   STDOC1     3
      STPCMD1    3   STREF1     3   OTHERPUB   3   STDOC2     3
      STPCMD2    3   STREF2     3   OTHERGOV   3   STDOC3     3
      STPCMD3    3   STREF3     3   MILITARY   3   MILSPC1    3
      MILSPC2    3   MILSPC3    3   MILSPC4    3   MILMAN     3
      IHS        3   HILAST     3   HISTOP1    3   HISTOP2    3
      HISTOP3    3   HISTOP4    3   HISTOP5    3   HISTOP6    3
      HISTOP7    3   HISTOP8    3   HISTOP9    3   HISTOP10   3
      HISTOP11   3   HISTOP12   3   HISTOP13   3   HISTOP14   3
      HISTOP15   3   HINOTYR    3   HINOTMYR   3   HCSPFYR    3
      HIKINDA    3   HIKINDB    3   HIKINDC    3   HIKINDD    3
      HIKINDE    3   HIKINDF    3   HIKINDG    3   HIKINDH    3
      HIKINDI    3   HIKINDJ    3   HIKINDK    3   MCAREPRB   3
      MCAIDPRB   3   SINCOV     3

      /* FSD LENGTHS */

      PLBORN     3   REGIONBR   3   GEOBRTH    3   YRSINUS    3
      CITIZENP   3   HEADST     3   HEADSTV1   3   EDUC1      3
      PMILTRY    3   DOINGLWP   3   WHYNOWKP   3   WRKHRS2    3
      WRKFTALL   3   WRKLYR1    3   WRKMYR     3   ERNYR_P    3
      HIEMPOF    3

      /* FIN LENGTHS */

      PSAL       3   PSEINC     3   PSSRR      3   PSSRRDB    3
      PSSRRD     3   PPENS      3   POPENS     3   PSSI       3
      PSSID      3   PTANF      3   POWBEN     3   PINTRSTR   3
      PDIVD      3   PCHLDSP    3   PINCOT     3   PSSAPL     3
      PSDAPL     3   TANFMYR    3   PFSTP      3   FSTPMYR    3
      ELIGPWIC   3   PWIC       3   WIC_FLAG   3 ;

   * INPUT ALL VARIABLES;

   INPUT

      /* IDN LOCATIONS */

      RECTYPE       1 -   2    SRVY_YR       3 -   6
      HHX      $    7 -  12    INTV_QRT     13 -  13
      ASSIGNWK     14 -  15    FMX      $   16 -  17
      FPX      $   18 -  19    WTIA         20 -  25 .1
      WTFA         26 -  31

      /* UCF LOCATIONS */

      REGION       32 -  32    STRAT_P      33 -  35
      PSU_P        36 -  37

      /* HHC LOCATIONS */

      SEX          38 -  38    ORIGIN_I     39 -  39
      ORIGIMPT     40 -  40    HISPAN_I     41 -  42
      HISPIMPT     43 -  43    RACERPI2     44 -  45
      RACEIMP2     46 -  46    MRACRPI2     47 -  48
      MRACBPI2     49 -  50    RACRECI3     51 -  51
      HISCODI3     52 -  52    ERIMPFLG     53 -  53
      NOWAF        54 -  54    RRP          55 -  56
      HHREFLG  $   57 -  57    FRRP         58 -  59
      DOB_M    $   60 -  61    DOB_Y_P  $   62 -  65
      AGE_P        66 -  67    AGE_CHG      68 -  68


      /* FID LOCATIONS */

      FMRPFLG  $   69 -  69    FMREFLG  $   70 -  70
      R_MARITL     71 -  71    FSPOUS2  $   72 -  73
      COHAB1       74 -  74    COHAB2       75 -  75
      FCOHAB3  $   76 -  77    CDCMSTAT     78 -  78
      SIB_DEG      79 -  79    FMOTHER  $   80 -  81
      MOM_DEG      82 -  82    FFATHER  $   83 -  84
      DAD_DEG      85 -  85    PARENTS      86 -  86
      MOM_ED       87 -  88    DAD_ED       89 -  90
      ASTATFLG     91 -  91    CSTATFLG     92 -  92


      /* FHS LOCATIONS */

      PLAPLYLM     93 -  93    PLAPLYUN     94 -  94
      PSPEDEIS     95 -  95    PSPEDEM      96 -  96
      PLAADL       97 -  97    LABATH       98 -  98
      LADRESS      99 -  99    LAEAT       100 - 100
      LABED       101 - 101    LATOILT     102 - 102
      LAHOME      103 - 103    PLAIADL     104 - 104
      PLAWKNOW    105 - 105    PLAWKLIM    106 - 106
      PLAWALK     107 - 107    PLAREMEM    108 - 108
      PLIMANY     109 - 109    LA1AR       110 - 110
      LAHCC1      111 - 111    LAHCC2      112 - 112
      LAHCC3      113 - 113    LAHCC4      114 - 114
      LAHCC5      115 - 115    LAHCC6      116 - 116
      LAHCC7      117 - 117    LAHCC8      118 - 118
      LAHCC9      119 - 119    LAHCC10     120 - 120
      LAHCC11     121 - 121    LAHCC12     122 - 122
      LAHCC13     123 - 123    LAHCC90     124 - 124
      LAHCC91     125 - 125    LCTIME1     126 - 127
      LCUNIT1     128 - 128    LCDURA1     129 - 130
      LCDURB1     131 - 131    LCCHRC1     132 - 132
      LCTIME2     133 - 134    LCUNIT2     135 - 135
      LCDURA2     136 - 137    LCDURB2     138 - 138
      LCCHRC2     139 - 139    LCTIME3     140 - 141
      LCUNIT3     142 - 142    LCDURA3     143 - 144
      LCDURB3     145 - 145    LCCHRC3     146 - 146
      LCTIME4     147 - 148    LCUNIT4     149 - 149
      LCDURA4     150 - 151    LCDURB4     152 - 152
      LCCHRC4     153 - 153    LCTIME5     154 - 155
      LCUNIT5     156 - 156    LCDURA5     157 - 158
      LCDURB5     159 - 159    LCCHRC5     160 - 160
      LCTIME6     161 - 162    LCUNIT6     163 - 163
      LCDURA6     164 - 165    LCDURB6     166 - 166
      LCCHRC6     167 - 167    LCTIME7     168 - 169
      LCUNIT7     170 - 170    LCDURA7     171 - 172
      LCDURB7     173 - 173    LCCHRC7     174 - 174
      LCTIME8     175 - 176    LCUNIT8     177 - 177
      LCDURA8     178 - 179    LCDURB8     180 - 180
      LCCHRC8     181 - 181    LCTIME9     182 - 183
      LCUNIT9     184 - 184    LCDURA9     185 - 186
      LCDURB9     187 - 187    LCCHRC9     188 - 188
      LCTIME10    189 - 190    LCUNIT10    191 - 191
      LCDURA10    192 - 193    LCDURB10    194 - 194
      LCCHRC10    195 - 195    LCTIME11    196 - 197
      LCUNIT11    198 - 198    LCDURA11    199 - 200
      LCDURB11    201 - 201    LCCHRC11    202 - 202
      LCTIME12    203 - 204    LCUNIT12    205 - 205
      LCDURA12    206 - 207    LCDURB12    208 - 208
      LCCHRC12    209 - 209    LCTIME13    210 - 211
      LCUNIT13    212 - 212    LCDURA13    213 - 214
      LCDURB13    215 - 215    LCCHRC13    216 - 216
      LCTIME90    217 - 218    LCUNIT90    219 - 219
      LCDURA90    220 - 221    LCDURB90    222 - 222
      LCCHRC90    223 - 223    LCTIME91    224 - 225
      LCUNIT91    226 - 226    LCDURA91    227 - 228
      LCDURB91    229 - 229    LCCHRC91    230 - 230
      LAHCA1      231 - 231    LAHCA2      232 - 232
      LAHCA3      233 - 233    LAHCA4      234 - 234
      LAHCA5      235 - 235    LAHCA6      236 - 236
      LAHCA7      237 - 237    LAHCA8      238 - 238
      LAHCA9      239 - 239    LAHCA10     240 - 240
      LAHCA11     241 - 241    LAHCA12     242 - 242
      LAHCA13     243 - 243    LAHCA14     244 - 244
      LAHCA15     245 - 245    LAHCA16     246 - 246
      LAHCA17     247 - 247    LAHCA18     248 - 248
      LAHCA19_    249 - 249    LAHCA20_    250 - 250
      LAHCA21_    251 - 251    LAHCA22_    252 - 252
      LAHCA23_    253 - 253    LAHCA24_    254 - 254
      LAHCA25_    255 - 255    LAHCA26_    256 - 256
      LAHCA27_    257 - 257    LAHCA28_    258 - 258
      LAHCA29_    259 - 259    LAHCA30_    260 - 260
      LAHCA31_    261 - 261    LAHCA32_    262 - 262
      LAHCA33_    263 - 263    LAHCA34_    264 - 264
      LAHCA90     265 - 265    LAHCA91     266 - 266
      LATIME1     267 - 268    LAUNIT1     269 - 269
      LADURA1     270 - 271    LADURB1     272 - 272
      LACHRC1     273 - 273    LATIME2     274 - 275
      LAUNIT2     276 - 276    LADURA2     277 - 278
      LADURB2     279 - 279    LACHRC2     280 - 280
      LATIME3     281 - 282    LAUNIT3     283 - 283
      LADURA3     284 - 285    LADURB3     286 - 286
      LACHRC3     287 - 287    LATIME4     288 - 289
      LAUNIT4     290 - 290    LADURA4     291 - 292
      LADURB4     293 - 293    LACHRC4     294 - 294
      LATIME5     295 - 296    LAUNIT5     297 - 297
      LADURA5     298 - 299    LADURB5     300 - 300
      LACHRC5     301 - 301    LATIME6     302 - 303
      LAUNIT6     304 - 304    LADURA6     305 - 306
      LADURB6     307 - 307    LACHRC6     308 - 308
      LATIME7     309 - 310    LAUNIT7     311 - 311
      LADURA7     312 - 313    LADURB7     314 - 314
      LACHRC7     315 - 315    LATIME8     316 - 317
      LAUNIT8     318 - 318    LADURA8     319 - 320
      LADURB8     321 - 321    LACHRC8     322 - 322
      LATIME9     323 - 324    LAUNIT9     325 - 325
      LADURA9     326 - 327    LADURB9     328 - 328
      LACHRC9     329 - 329    LATIME10    330 - 331
      LAUNIT10    332 - 332    LADURA10    333 - 334
      LADURB10    335 - 335    LACHRC10    336 - 336
      LATIME11    337 - 338    LAUNIT11    339 - 339
      LADURA11    340 - 341    LADURB11    342 - 342
      LACHRC11    343 - 343    LATIME12    344 - 345
      LAUNIT12    346 - 346    LADURA12    347 - 348
      LADURB12    349 - 349    LACHRC12    350 - 350
      LATIME13    351 - 352    LAUNIT13    353 - 353
      LADURA13    354 - 355    LADURB13    356 - 356
      LACHRC13    357 - 357    LATIME14    358 - 359
      LAUNIT14    360 - 360    LADURA14    361 - 362
      LADURB14    363 - 363    LACHRC14    364 - 364
      LATIME15    365 - 366    LAUNIT15    367 - 367
      LADURA15    368 - 369    LADURB15    370 - 370
      LACHRC15    371 - 371    LATIME16    372 - 373
      LAUNIT16    374 - 374    LADURA16    375 - 376
      LADURB16    377 - 377    LACHRC16    378 - 378
      LATIME17    379 - 380    LAUNIT17    381 - 381
      LADURA17    382 - 383    LADURB17    384 - 384
      LACHRC17    385 - 385    LATIME18    386 - 387
      LAUNIT18    388 - 388    LADURA18    389 - 390
      LADURB18    391 - 391    LACHRC18    392 - 392
      LATIME19    393 - 394    LAUNIT19    395 - 395
      LADURA19    396 - 397    LADURB19    398 - 398
      LACHRC19    399 - 399    LATIME20    400 - 401
      LAUNIT20    402 - 402    LADURA20    403 - 404
      LADURB20    405 - 405    LACHRC20    406 - 406
      LATIME21    407 - 408    LAUNIT21    409 - 409
      LADURA21    410 - 411    LADURB21    412 - 412
      LACHRC21    413 - 413    LATIME22    414 - 415
      LAUNIT22    416 - 416    LADURA22    417 - 418
      LADURB22    419 - 419    LACHRC22    420 - 420
      LATIME23    421 - 422    LAUNIT23    423 - 423
      LADURA23    424 - 425    LADURB23    426 - 426
      LACHRC23    427 - 427    LATIME24    428 - 429
      LAUNIT24    430 - 430    LADURA24    431 - 432
      LADURB24    433 - 433    LACHRC24    434 - 434
      LATIME25    435 - 436    LAUNIT25    437 - 437
      LADURA25    438 - 439    LADURB25    440 - 440
      LACHRC25    441 - 441    LATIME26    442 - 443
      LAUNIT26    444 - 444    LADURA26    445 - 446
      LADURB26    447 - 447    LACHRC26    448 - 448
      LATIME27    449 - 450    LAUNIT27    451 - 451
      LADURA27    452 - 453    LADURB27    454 - 454
      LACHRC27    455 - 455    LATIME28    456 - 457
      LAUNIT28    458 - 458    LADURA28    459 - 460
      LADURB28    461 - 461    LACHRC28    462 - 462
      LATIME29    463 - 464    LAUNIT29    465 - 465
      LADURA29    466 - 467    LADURB29    468 - 468
      LACHRC29    469 - 469    LATIME30    470 - 471
      LAUNIT30    472 - 472    LADURA30    473 - 474
      LADURB30    475 - 475    LACHRC30    476 - 476
      LATIME31    477 - 478    LAUNIT31    479 - 479
      LADURA31    480 - 481    LADURB31    482 - 482
      LACHRC31    483 - 483    LATIME32    484 - 485
      LAUNIT32    486 - 486    LADURA32    487 - 488
      LADURB32    489 - 489    LACHRC32    490 - 490
      LATIME33    491 - 492    LAUNIT33    493 - 493
      LADURA33    494 - 495    LADURB33    496 - 496
      LACHRC33    497 - 497    LATIME34    498 - 499
      LAUNIT34    500 - 500    LADURA34    501 - 502
      LADURB34    503 - 503    LACHRC34    504 - 504
      LATIME90    505 - 506    LAUNIT90    507 - 507
      LADURA90    508 - 509    LADURB90    510 - 510
      LACHRC90    511 - 511    LATIME91    512 - 513
      LAUNIT91    514 - 514    LADURA91    515 - 516
      LADURB91    517 - 517    LACHRC91    518 - 518
      LCONDRT     519 - 519    LACHRONR    520 - 520
      PHSTAT      521 - 521

      /* FAU LOCATIONS */

      PDMED12M    522 - 522    PNMED12M    523 - 523
      PHOSPYR2    524 - 524    HOSPNO      525 - 527
      HPNITE      528 - 530    PHCHM2W     531 - 531
      PHCHMN2W    532 - 533    PHCPH2WR    534 - 534
      PHCPHN2W    535 - 536    PHCDV2W     537 - 537
      PHCDVN2W    538 - 539    P10DVYR     540 - 540


      /* FHI LOCATIONS */

      NOTCOV      541 - 541    MEDICARE    542 - 542
      MCPART      543 - 543    MCCHOICE    544 - 544
      MCHMO       545 - 545    MCNAMEN     546 - 547
      MCREF       548 - 548    MCPAYPRE    549 - 549
      MCPARTD     550 - 550    MEDICAID    551 - 551
      MACHMD      552 - 552    MAPCMD      553 - 553
      MAREF       554 - 554    SINGLE      555 - 555
      SSTYPEA     556 - 556    SSTYPEB     557 - 557
      SSTYPEC     558 - 558    SSTYPED     559 - 559
      SSTYPEE     560 - 560    SSTYPEF     561 - 561
      SSTYPEG     562 - 562    SSTYPEH     563 - 563
      SSTYPEI     564 - 564    SSTYPEJ     565 - 565
      SSTYPEK     566 - 566    SSTYPEL     567 - 567
      PRIVATE     568 - 568    HITYPE1     569 - 570
      WHONAM1     571 - 571    PLNWRKN1    572 - 573
      PLNPAY11    574 - 574    PLNPAY21    575 - 575
      PLNPAY31    576 - 576    PLNPAY41    577 - 577
      PLNPAY51    578 - 578    PLNPAY61    579 - 579
      PLNPAY71    580 - 580    HICOSTR1    581 - 585
      PLNMGD1     586 - 586    MGCHMD1     587 - 587
      MGPRMD1     588 - 588    MGPYMD1     589 - 589
      MGPREF1     590 - 590    PRRXCOV1    591 - 591
      HITYPE2     592 - 593    WHONAM2     594 - 594
      PLNWRKN2    595 - 596    PLNPAY12    597 - 597
      PLNPAY22    598 - 598    PLNPAY32    599 - 599
      PLNPAY42    600 - 600    PLNPAY52    601 - 601
      PLNPAY62    602 - 602    PLNPAY72    603 - 603
      HICOSTR2    604 - 608    PLNMGD2     609 - 609
      MGCHMD2     610 - 610    MGPRMD2     611 - 611
      MGPYMD2     612 - 612    MGPREF2     613 - 613
      PRRXCOV2    614 - 614    PRPLPLUS    615 - 615
      SCHIP       616 - 616    STDOC1      617 - 617
      STPCMD1     618 - 618    STREF1      619 - 619
      OTHERPUB    620 - 620    STDOC2      621 - 621
      STPCMD2     622 - 622    STREF2      623 - 623
      OTHERGOV    624 - 624    STDOC3      625 - 625
      STPCMD3     626 - 626    STREF3      627 - 627
      MILITARY    628 - 628    MILSPC1     629 - 629
      MILSPC2     630 - 630    MILSPC3     631 - 631
      MILSPC4     632 - 632    MILMAN      633 - 633
      IHS         634 - 634    HILAST      635 - 635
      HISTOP1     636 - 636    HISTOP2     637 - 637
      HISTOP3     638 - 638    HISTOP4     639 - 639
      HISTOP5     640 - 640    HISTOP6     641 - 641
      HISTOP7     642 - 642    HISTOP8     643 - 643
      HISTOP9     644 - 644    HISTOP10    645 - 645
      HISTOP11    646 - 646    HISTOP12    647 - 647
      HISTOP13    648 - 648    HISTOP14    649 - 649
      HISTOP15    650 - 650    HINOTYR     651 - 651
      HINOTMYR    652 - 653    HCSPFYR     654 - 654
      HIKINDA     655 - 655    HIKINDB     656 - 656
      HIKINDC     657 - 657    HIKINDD     658 - 658
      HIKINDE     659 - 659    HIKINDF     660 - 660
      HIKINDG     661 - 661    HIKINDH     662 - 662
      HIKINDI     663 - 663    HIKINDJ     664 - 664
      HIKINDK     665 - 665    MCAREPRB    666 - 666
      MCAIDPRB    667 - 667    SINCOV      668 - 668


      /* FSD LOCATIONS */

      PLBORN      669 - 669    REGIONBR    670 - 671
      GEOBRTH     672 - 672    YRSINUS     673 - 673
      CITIZENP    674 - 674    HEADST      675 - 675
      HEADSTV1    676 - 676    EDUC1       677 - 678
      PMILTRY     679 - 679    DOINGLWP    680 - 680
      WHYNOWKP    681 - 682    WRKHRS2     683 - 684
      WRKFTALL    685 - 685    WRKLYR1     686 - 686
      WRKMYR      687 - 688    ERNYR_P     689 - 690
      HIEMPOF     691 - 691

      /* FIN LOCATIONS */

      PSAL        692 - 692    PSEINC      693 - 693
      PSSRR       694 - 694    PSSRRDB     695 - 695
      PSSRRD      696 - 696    PPENS       697 - 697
      POPENS      698 - 698    PSSI        699 - 699
      PSSID       700 - 700    PTANF       701 - 701
      POWBEN      702 - 702    PINTRSTR    703 - 703
      PDIVD       704 - 704    PCHLDSP     705 - 705
      PINCOT      706 - 706    PSSAPL      707 - 707
      PSDAPL      708 - 708    TANFMYR     709 - 710
      PFSTP       711 - 711    FSTPMYR     712 - 713
      ELIGPWIC    714 - 714    PWIC        715 - 715
      WIC_FLAG    716 - 716;

   * DEFINE VARIABLE LABELS;

   LABEL

      /* IDN LABELS */

      RECTYPE    ="File type identifier"
      SRVY_YR    ="Year of National Health Interview Survey"
      HHX        ="Household Serial Number"
      INTV_QRT   ="Interview Quarter"
      ASSIGNWK   ="Assignment Week"
      FMX        ="Family #"
      FPX        ="Person #"
      WTIA       ="Weight - Interim Annual"
      WTFA       ="Weight - Final Annual"

      /* UCF LABELS */

      REGION     ="Region"
      STRAT_P    ="Pseudo-stratum for public use file variance estimation"
      PSU_P      ="Pseudo-PSU for public use file variance estimation"

      /* HHC LABELS */

      SEX        ="Sex"
      ORIGIN_I   ="Hispanic Ethnicity"
      ORIGIMPT   ="Hispanic Origin Imputation Flag"
      HISPAN_I   ="Hispanic subgroup detail"
      HISPIMPT   ="Type of Hispanic Origin Imputation Flag"
      RACERPI2   ="OMB groups w/multiple race"
      RACEIMP2   ="Race Imputation Flag"
      MRACRPI2   ="Race coded to single/multiple race group"
      MRACBPI2   ="Race coded to single/multiple race group"
      RACRECI3   ="Race Recode"
      HISCODI3   ="Race/ethnicity recode"
      ERIMPFLG   ="Ethnicity/Race Imputation Flag"
      NOWAF      ="Armed Forces Status"
      RRP        ="Relationship to the HH reference person"
      HHREFLG    ="HH Reference Person Flag"
      FRRP       ="Relationship to family ref. Person"
      DOB_M      ="Month of Birth"
      DOB_Y_P    ="Year of Birth"
      AGE_P      ="Age"
      AGE_CHG    ="Indication of AGE correction due to data entry error"

      /* FID LABELS */

      FMRPFLG    ="Family Respondent Flag"
      FMREFLG    ="Family Reference Person Flag"
      R_MARITL   ="Marital Status"
      FSPOUS2    ="Person # of spouse"
      COHAB1     ="Cohabiting person ever married"
      COHAB2     ="Cohabiting person's current marital status"
      FCOHAB3    ="Person # of partner"
      CDCMSTAT   ="CDC standard for legal marital status"
      SIB_DEG    ="Degree of sib rel to HH ref person"
      FMOTHER    ="Person # of mother"
      MOM_DEG    ="Type of relationship with Mother"
      FFATHER    ="Person # of father"
      DAD_DEG    ="Type of relationship with Father"
      PARENTS    ="Parent(s) present in the family"
      MOM_ED     ="Education of Mother"
      DAD_ED     ="Education of Father"
      ASTATFLG   ="Sample Adult Flag"
      CSTATFLG   ="Sample Child Flag"

      /* FHS LABELS */

      PLAPLYLM   ="Is - - limited in kind/amt play?"
      PLAPLYUN   ="Is - - able to play at all?"
      PSPEDEIS   ="Does - - receive Special Ed or EIS"
      PSPEDEM    ="Receive Special Ed/EIS due to emotional/behavioral problem"
      PLAADL     ="Does - - need help with personal care?"
      LABATH     ="Does - -  need help with bathing/showering?"
      LADRESS    ="Does - -  need help dressing?"
      LAEAT      ="Does - -  need help eating?"
      LABED      ="Does - -  need help in/out of bed or chairs?"
      LATOILT    ="Does - -  need help using the toilet?"
      LAHOME     ="Does - -  need help to get around in the home?"
      PLAIADL    ="Does - - need help with routine needs?"
      PLAWKNOW   ="Is - - unable to work NOW due to health prob?"
      PLAWKLIM   ="Is - - limited kind/amount of work?"
      PLAWALK    ="Does - - have difficulty walk w/o equip?"
      PLAREMEM   ="Is - - limited by difficulty remembering?"
      PLIMANY    ="Is - - limited in any (other) way?"
      LA1AR      ="Any limitation - all persons, all conds"
      LAHCC1     ="Vision problem causes limitation"
      LAHCC2     ="Hearing problem causes limitation"
      LAHCC3     ="Speech problem causes limitation"
      LAHCC4     ="Asthma/breathing problem causes limitation"
      LAHCC5     ="Birth defect causes limitation"
      LAHCC6     ="Injury causes limitation"
      LAHCC7     ="Mental retardation causes limitation"
      LAHCC8     ="Other dev problem causes limitation"
      LAHCC9     ="Other mental/emot/behav problem causes limitation"
      LAHCC10    ="Bone/joint/muscle problem causes limitation"
      LAHCC11    ="Epilepsy/seizures causes limitation"
      LAHCC12    ="Learning disability causes  limitation"
      LAHCC13    ="ADD/ADHD causes limitation"
      LAHCC90    ="Other impair/problem (1) causes limitation"
      LAHCC91    ="Other impair/problem (2) causes limitation"
      LCTIME1    ="Duration of vision problem: Number of units"
      LCUNIT1    ="Duration of vision problem: Time unit"
      LCDURA1    ="Duration of vision problem (in years)"
      LCDURB1    ="Duration of vision problem recode 2"
      LCCHRC1    ="Vision problem condition status"
      LCTIME2    ="Duration of hearing problem: Number of units"
      LCUNIT2    ="Duration of hearing problem: Time unit"
      LCDURA2    ="Duration of hearing problem (in years)"
      LCDURB2    ="Duration of hearing problem recode 2"
      LCCHRC2    ="Hearing problem condition status"
      LCTIME3    ="Duration of speech problem: Number of units"
      LCUNIT3    ="Duration of speech problem: Time unit"
      LCDURA3    ="Duration of speech problem (in years)"
      LCDURB3    ="Duration of speech problem recode 2"
      LCCHRC3    ="Speech problem condition status"
      LCTIME4    ="Duration of asthma/breathing problem: Number of units"
      LCUNIT4    ="Duration of asthma/breathing problem: Time unit"
      LCDURA4    ="Duration of asthma/breathing problem (in years)"
      LCDURB4    ="Duration of asthma/breathing problem recode 2"
      LCCHRC4    ="Asthma/breathing problem condition status"
      LCTIME5    ="Duration of birth defect: Number of units"
      LCUNIT5    ="Duration of birth defect: Time unit"
      LCDURA5    ="Duration of birth defect (in years)"
      LCDURB5    ="Duration of birth defect recode 2"
      LCCHRC5    ="Birth defect condition status"
      LCTIME6    ="Duration of injury: Number of units"
      LCUNIT6    ="Duration of injury: Time unit"
      LCDURA6    ="Duration of injury (in years)"
      LCDURB6    ="Duration of injury recode 2"
      LCCHRC6    ="Injury condition status"
      LCTIME7    ="Duration of mental retardation: Number of units"
      LCUNIT7    ="Duration of mental retardation: Time unit"
      LCDURA7    ="Duration of mental retardation (in years)"
      LCDURB7    ="Duration of mental retardation recode 2"
      LCCHRC7    ="Mental retardation condition status"
      LCTIME8    ="Duration of other developmental problem: Number of units"
      LCUNIT8    ="Duration of other developmental problem: Time unit"
      LCDURA8    ="Duration of other developmental problem (in years)"
      LCDURB8    ="Duration of other developmental problem recode 2"
      LCCHRC8    ="Other developmental problem condition status"
      LCTIME9    ="Duration of other mental/emot/behav problem: Number of units"
      LCUNIT9    ="Duration of otr ment/emot/behav problem: Number of units"
      LCDURA9    ="Duration of other mental/emot/behav problem (in years)"
      LCDURB9    ="Duration of other mental/emotional/behavioral prob recode 2"
      LCCHRC9    ="Other mental/emotional/behavioral problem condition status"
      LCTIME10   ="Duration of bone/joint/muscle problem: Number of units"
      LCUNIT10   ="Duration of bone/joint/muscle problem: Time unit"
      LCDURA10   ="Duration of bone/joint/muscle problem (in years)"
      LCDURB10   ="Duration of bone/joint/muscle problem recode 2"
      LCCHRC10   ="Bone/joint/muscle problem condition status"
      LCTIME11   ="Duration of epilepsy/seizures: Number of units"
      LCUNIT11   ="Duration of epilepsy/seizures: Time unit"
      LCDURA11   ="Duration of epilepsy/seizures (in years)"
      LCDURB11   ="Duration of epilepsy/seizures recode 2"
      LCCHRC11   ="Epilepsy/seizures condition status"
      LCTIME12   ="Duration of learning disability: Number of units"
      LCUNIT12   ="Duration of learning disability: Time unit"
      LCDURA12   ="Duration of learning disability (in years)"
      LCDURB12   ="Duration of learning disability recode 2"
      LCCHRC12   ="Learning disability condition status"
      LCTIME13   ="Duration of ADD/ADHD: Number of units"
      LCUNIT13   ="Duration of ADD/ADHD: Time unit"
      LCDURA13   ="Duration of ADD/ADHD (in years)"
      LCDURB13   ="Duration of ADD/ADHD recode 2"
      LCCHRC13   ="ADD/ADHD condition status"
      LCTIME90   ="Duration of other impairment problem (1): Number of units"
      LCUNIT90   ="Duration of other impairment/problem (1): Time unit"
      LCDURA90   ="Duration of other impairment/problem (1) (in years)"
      LCDURB90   ="Duration of other impairment/problem (1) recode 2"
      LCCHRC90   ="Other impairment/problem (1) condition status"
      LCTIME91   ="Duration of other impairment/problem (2): Number of units"
      LCUNIT91   ="Duration of other impairment/problem (2): Time unit"
      LCDURA91   ="Duration of other impairment/problem (2) (in years)"
      LCDURB91   ="Duration of other impairment/problem (2) recode 2"
      LCCHRC91   ="Other impairment/problem (2) condition status"
      LAHCA1     ="Vision problem causes limitation"
      LAHCA2     ="Hearing problem causes limitation"
      LAHCA3     ="Arthritis/rheumatism causes limitation"
      LAHCA4     ="Back/neck prob causes limitation"
      LAHCA5     ="Fracture/bone/joint inj causes limitation"
      LAHCA6     ="Other injury causes limitation"
      LAHCA7     ="Heart problem causes limitation"
      LAHCA8     ="Stroke causes limitation"
      LAHCA9     ="Hypertension causes limitation"
      LAHCA10    ="Diabetes causes limitation"
      LAHCA11    ="Lung/breath problem causes limitation"
      LAHCA12    ="Cancer causes limitation"
      LAHCA13    ="Birth defect causes limitation"
      LAHCA14    ="Mental retardation causes limitation"
      LAHCA15    ="Otr dev problem causes limitation"
      LAHCA16    ="Senility causes limitation"
      LAHCA17    ="Dep/anx/emot problem causes limitation"
      LAHCA18    ="Weight problem causes limitation"
      LAHCA19_   ="Missing or amputated limb/finger/digit"
      LAHCA20_   ="Musculoskeletal/connective tissue problem"
      LAHCA21_   ="Circulation problem"
      LAHCA22_   ="Endocrine/nutritional/metabolic problem"
      LAHCA23_   ="Nervous system/sensory organ condition"
      LAHCA24_   ="Digestive system problem"
      LAHCA25_   ="Genitourinary system problem"
      LAHCA26_   ="Skin/subcutaneous system problem"
      LAHCA27_   ="Blood or blood-forming organ problem"
      LAHCA28_   ="Benign tumor/cyst"
      LAHCA29_   ="Alcohol/drug/substance abuse problem"
      LAHCA30_   ="Otr mental problem/ADD/bipolar/schizophrenia"
      LAHCA31_   ="Surgical after-effects/medical treatment"
      LAHCA32_   ='"Old age"/elderly/aging-related problem'
      LAHCA33_   ="Fatigue/tiredness/weakness"
      LAHCA34_   ="Pregnancy-related problem"
      LAHCA90    ="Other impair/problem(1) causes limitation"
      LAHCA91    ="Other impair/problem(2) causes limitation"
      LATIME1    ="Duration of vision problem: Number of units"
      LAUNIT1    ="Duration of vision problem: Time unit"
      LADURA1    ="Duration of vision problem (in years)"
      LADURB1    ="Duration of vision problem recode 2"
      LACHRC1    ="Vision problem condition status"
      LATIME2    ="Duration of hearing problem: Number of units"
      LAUNIT2    ="Duration of hearing problem: Time unit"
      LADURA2    ="Duration of hearing problem (in years)"
      LADURB2    ="Duration of hearing problem recode 2"
      LACHRC2    ="Hearing problem condition status"
      LATIME3    ="Duration of arthritis/rheumatism: Number of units"
      LAUNIT3    ="Duration of arthritis/rheumatism: Time unit"
      LADURA3    ="Duration of arthritis/rheumatism (in years)"
      LADURB3    ="Duration of arthritis/rheumatism recode 2"
      LACHRC3    ="Arthritis/rheumatism condition status"
      LATIME4    ="Duration of back/neck problem: Number of units"
      LAUNIT4    ="Duration of back/neck problem: Time unit"
      LADURA4    ="Duration of back/neck problem (in years)"
      LADURB4    ="Duration of back/neck problem recode 2"
      LACHRC4    ="Back/neck problem condition status"
      LATIME5    ="Duration of fracture/bone/joint injury: Number of units"
      LAUNIT5    ="Duration of fracture/bone/joint injury: Time unit"
      LADURA5    ="Duration of fracture/bone/joint injury (in years)"
      LADURB5    ="Duration of fracture/bone/joint injury recode 2"
      LACHRC5    ="Fracture/bone/joint injury condition status"
      LATIME6    ="Duration of other injury: Number of units"
      LAUNIT6    ="Duration of other injury: Time unit"
      LADURA6    ="Duration of other injury (in years)"
      LADURB6    ="Duration of other injury recode 2"
      LACHRC6    ="Other injury condition status"
      LATIME7    ="Duration of heart problem: Number of units"
      LAUNIT7    ="Duration of heart problem: Time unit"
      LADURA7    ="Duration of heart problem (in years)"
      LADURB7    ="Duration of heart problem recode 2"
      LACHRC7    ="Heart problem condition status"
      LATIME8    ="Duration of stroke: Number of units"
      LAUNIT8    ="Duration of stroke: Time unit"
      LADURA8    ="Duration of stroke (in years)"
      LADURB8    ="Duration of stroke recode 2"
      LACHRC8    ="Stroke condition status"
      LATIME9    ="Duration of hypertension: Number of units"
      LAUNIT9    ="Duration of hypertension: Time unit"
      LADURA9    ="Duration of hypertension (in years)"
      LADURB9    ="Duration of hypertension recode 2"
      LACHRC9    ="Hypertension condition status"
      LATIME10   ="Duration of diabetes: Number of units"
      LAUNIT10   ="Duration of diabetes: Time unit"
      LADURA10   ="Duration of diabetes (in years)"
      LADURB10   ="Duration of diabetes recode 2"
      LACHRC10   ="Diabetes condition status"
      LATIME11   ="Duration of lung/breathing problem: Number of units"
      LAUNIT11   ="Duration of lung/breath problem: Time unit"
      LADURA11   ="Duration of lung/breathing problem (in years)"
      LADURB11   ="Duration of lung/breathing problem recode 2"
      LACHRC11   ="Lung/breathing problem condition status"
      LATIME12   ="Duration of cancer: Number of units"
      LAUNIT12   ="Duration of cancer: Time unit"
      LADURA12   ="Duration of cancer (in years)"
      LADURB12   ="Duration of cancer recode 2"
      LACHRC12   ="Cancer condition status"
      LATIME13   ="Duration of birth defect: Number of units"
      LAUNIT13   ="Duration of birth defect: Time unit"
      LADURA13   ="Duration of birth defect (in years)"
      LADURB13   ="Duration of birth defect recode 2"
      LACHRC13   ="Birth defect condition status"
      LATIME14   ="Duration of ment retardation: Number of units"
      LAUNIT14   ="Duration of ment retardation: Time unit"
      LADURA14   ="Duration of mental retardation (in years)"
      LADURB14   ="Duration of mental retardation recode 2"
      LACHRC14   ="Mental retardation condition status"
      LATIME15   ="Duration of other developmental problem: Number of units"
      LAUNIT15   ="Duration of other developmental problem: Time unit"
      LADURA15   ="Duration of other developmental problem (in years)"
      LADURB15   ="Duration of other developmental problem recode 2"
      LACHRC15   ="Other developmental problem condition status"
      LATIME16   ="Duration of senility: Number of units"
      LAUNIT16   ="Duration of senility: Time unit"
      LADURA16   ="Duration of senility (in years)"
      LADURB16   ="Duration of senility recode 2"
      LACHRC16   ="Senility condition status"
      LATIME17   =
"Duration of depression/anxiety/emotional problem: Number of units"
      LAUNIT17   ="Duration of depression/anxiety/emotional problem: Time unit"
      LADURA17   ="Duration of depression/anxiety/emotional problem (in years)"
      LADURB17   ="Duration of depression/anxiety/emotional problem recode 2"
      LACHRC17   ="Depression/anxiety/emotional problem condition status"
      LATIME18   ="Duration of weight problem: Number of units"
      LAUNIT18   ="Duration of weight problem: Time unit"
      LADURA18   ="Duration of weight problem (in years)"
      LADURB18   ="Duration of weight problem recode 2"
      LACHRC18   ="Weight problem condition status"
      LATIME19   ="Duration of missing limb/amputation: Number of units"
      LAUNIT19   ="Duration of missing limb/amputation: Time unit"
      LADURA19   ="Duration of missing limb/amputation (in years)"
      LADURB19   ="Duration of missing limb/amputation recode 2"
      LACHRC19   ="Missing limb/amputation condition status"
      LATIME20   ="Duration of musculoskeletal problem: Number of units"
      LAUNIT20   ="Duration of musculoskeletal problem: Time unit"
      LADURA20   ="Duration of musculoskeletal problem (in years)"
      LADURB20   ="Duration of musculoskeletal problem recode 2"
      LACHRC20   ="Musculoskeletal problem condition status"
      LATIME21   ="Duration of circulatory problem: Number of units"
      LAUNIT21   ="Duration of circulatory problem: Time unit"
      LADURA21   ="Duration of circulatory problem (in years)"
      LADURB21   ="Duration of circulatory problem recode 2"
      LACHRC21   ="Circulatory problem condition status"
      LATIME22   ="Duration of endocrine problem: Number of units"
      LAUNIT22   ="Duration of endocrine problem: Time unit"
      LADURA22   ="Duration of endocrine problem (in years)"
      LADURB22   ="Duration of endocrine problem recode 2"
      LACHRC22   ="Endocrine problem condition status"
      LATIME23   ="Duration of nervous system condition: Number of units"
      LAUNIT23   ="Duration of nervous system condition: Time unit"
      LADURA23   ="Duration of nervous system condition (in years)"
      LADURB23   ="Duration of nervous system condition recode 2"
      LACHRC23   ="Nervous system condition status"
      LATIME24   ="Duration of digestive problems: Number of units"
      LAUNIT24   ="Duration of digestive problems: Number of units"
      LADURA24   ="Duration of digestive problem (in years)"
      LADURB24   ="Duration of digestive problem recode 2"
      LACHRC24   ="Digestive problem condition status"
      LATIME25   ="Duration of genitourinary problem: Number of units"
      LAUNIT25   ="Duration of genitourinary problem: Time unit"
      LADURA25   ="Duration of genitourinary problem (in years)"
      LADURB25   ="Duration of genitourinary problem recode 2"
      LACHRC25   ="Genitourinary problem condition status"
      LATIME26   ="Duration of skin problems: Number of units"
      LAUNIT26   ="Duration of skin problems: Time unit"
      LADURA26   ="Duration of skin problem (in years)"
      LADURB26   ="Duration of skin problem recode 2"
      LACHRC26   ="Skin problems condition status"
      LATIME27   ="Duration of blood problem: Number of units"
      LAUNIT27   ="Duration of blood problem: Time unit"
      LADURA27   ="Duration of blood problem (in years)"
      LADURB27   ="Duration of blood problem recode 2"
      LACHRC27   ="Blood problem condition status"
      LATIME28   ="Duration of benign tumor: Number of units"
      LAUNIT28   ="Duration of benign tumor: Time unit"
      LADURA28   ="Duration of benign tumor (in years)"
      LADURB28   ="Duration of benign tumor recode 2"
      LACHRC28   ="Benign tumor condition status"
      LATIME29   ="Duration of alcohol or drug problem: Number of units"
      LAUNIT29   ="Duration of alcohol or drug problem: Time unit"
      LADURA29   ="Duration of alcohol or drug problem (in years)"
      LADURB29   ="Duration of alcohol or drug problem recode 2"
      LACHRC29   ="Alcohol or drug problem condition status"
      LATIME30   ="Duration of other mental problem: Number of units"
      LAUNIT30   ="Duration of other mental problem: Time unit"
      LADURA30   ="Duration of other mental problem (in years)"
      LADURB30   ="Duration of other mental problem recode 2"
      LACHRC30   ="Other mental problem condition status"
      LATIME31   ="Duration of surgical after-effects: Number of units"
      LAUNIT31   ="Duration of surgical after-effects: Time unit"
      LADURA31   ="Duration of surgical after-effects (in years)"
      LADURB31   ="Duration of surgical after-effects recode 2"
      LACHRC31   ="Surgical after-effects condition status"
      LATIME32   ='Duration of "old age": Number of units'
      LAUNIT32   ='Duration of "old age": Number of units'
      LADURA32   ='Duration of "old age" (in years)'
      LADURB32   ='Duration of "old age" recode 2'
      LACHRC32   ='"Old age" condition status'
      LATIME33   ="Duration of fatigue problem: Number of units"
      LAUNIT33   ="Duration of fatigue problem: Time unit"
      LADURA33   ="Duration of fatigue problem (in years)"
      LADURB33   ="Duration of fatigue problem recode 2"
      LACHRC33   ="Fatigue problem condition status"
      LATIME34   ="Duration of pregnancy-related problem: Number of units"
      LAUNIT34   ="Duration of pregnancy-related problem: Time unit"
      LADURA34   ="Duration of pregnancy-related problem (in years)"
      LADURB34   ="Duration of pregnancy-related problem recode 2"
      LACHRC34   ="Pregnancy-related condition status"
      LATIME90   ="Duration of other N.E.C. problem (1): Number of units"
      LAUNIT90   ="Duration of other N.E.C. problem (1): Time unit"
      LADURA90   ="Duration of other N.E.C. problem (1) (in years)"
      LADURB90   ="Duration of other N.E.C. problem (1) recode 2"
      LACHRC90   ="Other N.E.C. problem (1) condition status"
      LATIME91   ="Duration of other N.E.C. problem (2): Number of units"
      LAUNIT91   ="Duration of other N.E.C. problem (2): Time unit"
      LADURA91   ="Duration of other N.E.C. problem (2) (in years)"
      LADURB91   ="Duration of other N.E.C. problem (2) recode 2"
      LACHRC91   ="Other N.E.C. problem (2) condition status"
      LCONDRT    ="Chronic condition recode for person with lim of activ"
      LACHRONR   ="Lim of activ recode by chron cond status"
      PHSTAT     ="Reported health status"

      /* FAU LABELS */

      PDMED12M   ="Was medical care delayed for - - (cost), 12m"
      PNMED12M   ="Did - - need and NOT get medical care (cost), 12m"
      PHOSPYR2   ="Was - - in a hospital OVERNIGHT, 12m"
      HOSPNO     ="Number of times in hospital overnight, 12m"
      HPNITE     ="Number of nights in hospital, 12m"
      PHCHM2W    ="Did - - receive HOME care by health professional, 2 wk"
      PHCHMN2W   ="Number of HOME visits by health professional, 2wk"
      PHCPH2WR   ="Did--get advice/test results by phone, 2wk"
      PHCPHN2W   ="Number of PHONE calls to health professional, 2wk"
      PHCDV2W    ="Did - - see health professional in office, etc, 2wk"
      PHCDVN2W   ="Number of times VISITED health professional, 2wk"
      P10DVYR    ="Did - - receive care 10+ times, 12m"

      /* FHI LABELS */

      NOTCOV     ="Cov stat as used in Health United States"
      MEDICARE   ="Medicare coverage recode"
      MCPART     ="Type of Medicare coverage"
      MCCHOICE   ="Enrolled in Medicare Advantage Plan"
      MCHMO      ="Is - - signed up with an HMO"
      MCNAMEN    ="Medicare HMO name"
      MCREF      ="Need a referral for special care"
      MCPAYPRE   ="More comprehensive benefit plan"
      MCPARTD    ="Medicare Part D"
      MEDICAID   ="Medicaid coverage recode"
      MACHMD     ="Any doc, chooses from a list, doc assigned"
      MAPCMD     ="Primary care physician for routine care"
      MAREF      ="Need a referral for special care"
      SINGLE     ="Single service plan recode"
      SSTYPEA    ="Accidents"
      SSTYPEB    ="AIDS care"
      SSTYPEC    ="Cancer treatment"
      SSTYPED    ="Catastrophic care"
      SSTYPEE    ="Dental care"
      SSTYPEF    ="Disability insurance"
      SSTYPEG    ="Hospice care"
      SSTYPEH    ="Hospitalization only"
      SSTYPEI    ="Long-term care"
      SSTYPEJ    ="Prescriptions"
      SSTYPEK    ="Vision care"
      SSTYPEL    ="Other"
      PRIVATE    ="Private health insurance recode"
      HITYPE1    ="Name of plan (Plan 1)"
      WHONAM1    ="Plan in whose name (Plan 1)"
      PLNWRKN1   ="How plan was originally obtained (plan 1)"
      PLNPAY11   ="Paid for by self or family (Plan 1)"
      PLNPAY21   ="Paid for by employer or union (Plan 1)"
      PLNPAY31   ="Paid for by someone outside the household (Plan 1)"
      PLNPAY41   ="Paid for by Medicare (Plan 1)"
      PLNPAY51   ="Paid for by Medicaid (Plan 1)"
      PLNPAY61   ="Paid for by SCHIP (Plan 1)"
      PLNPAY71   ="Paid for by government program (Plan 1)"
      HICOSTR1   ="Out-of-pocket premium cost (Plan 1)"
      PLNMGD1    ="Type of private plan (Plan 1)"
      MGCHMD1    ="Doctor choice (Plan 1)"
      MGPRMD1    ="Preferred list (Plan 1)"
      MGPYMD1    ="Out of plan use (Plan 1)"
      MGPREF1    ="Private referral (Plan 1)"
      PRRXCOV1   ="Prescription drug benefit (Plan 1)"
      HITYPE2    ="Name of plan (Plan 2)"
      WHONAM2    ="Plan in whose name (Plan 2)"
      PLNWRKN2   ="How plan was originally obtained (Plan 2)"
      PLNPAY12   ="Paid for by self or family (Plan 2)"
      PLNPAY22   ="Paid for by employer or union (Plan 2)"
      PLNPAY32   ="Paid for by someone outside the household (Plan 2)"
      PLNPAY42   ="Paid for by Medicare (Plan 2)"
      PLNPAY52   ="Paid for by Medicaid (Plan 2)"
      PLNPAY62   ="Paid for by SCHIP (Plan 2)"
      PLNPAY72   ="Paid for by government program (Plan 2)"
      HICOSTR2   ="Out-of-pocket premium cost (Plan 2)"
      PLNMGD2    ="Type of private plan (plan 2)"
      MGCHMD2    ="Doctor choice (Plan 2)"
      MGPRMD2    ="Preferred list (Plan 2)"
      MGPYMD2    ="Out of plan use (Plan 2)"
      MGPREF2    ="Private referral (Plan 2)"
      PRRXCOV2   ="Prescription drug benefit (Plan 2)"
      PRPLPLUS   ="Person has more than two private plans"
      SCHIP      ="SCHIP coverage recode"
      STDOC1     ="Any doc, chooses from a list, doc assigned (SCHIP)"
      STPCMD1    ="Primary care physician for routine care (SCHIP)"
      STREF1     ="Need a referral for special care (SCHIP)"
      OTHERPUB   ="State-sponsored health plan recode"
      STDOC2     ="Any doc, chooses from a list, doc assigned (OTHERPUB)"
      STPCMD2    ="Primary care physician for routine care (OTHERPUB)"
      STREF2     ="Need a referral for special care (OTHERPUB)"
      OTHERGOV   ="Other government program recode"
      STDOC3     ="Any doc, chooses from a list, doc assigned (OTHERGOV)"
      STPCMD3    ="Primary care physician for routine care (OTHERGOV)"
      STREF3     ="Need a referral for special care (OTHERGOV)"
      MILITARY   ="Military health care coverage recode"
      MILSPC1    ="TRICARE coverage"
      MILSPC2    ="VA coverage"
      MILSPC3    ="CHAMP-VA coverage"
      MILSPC4    ="Other military coverage"
      MILMAN     ="Type of TRICARE coverage"
      IHS        ="Indian Health Service recode"
      HILAST     ="How long since last had health coverage"
      HISTOP1    ="Lost job or changed employers"
      HISTOP2    ="Divorced/sep/death of spouse or parent"
      HISTOP3    ="Ineligible because of age/left school"
      HISTOP4    ="Employer does not offer/not eligible for cov"
      HISTOP5    ="Cost is too high"
      HISTOP6    ="Insurance company refused coverage"
      HISTOP7    ="Medicaid/medi plan stopped after pregnancy"
      HISTOP8    ="Lost Medicaid/new job/increase in income"
      HISTOP9    ="Lost Medicaid (other)"
      HISTOP10   ="Other"
      HISTOP11   ="Never had health insurance"
      HISTOP12   ="Moved from another county/state/country"
      HISTOP13   ="Self-employed"
      HISTOP14   ="No need for it/chooses not to have"
      HISTOP15   ="Got married"
      HINOTYR    ="No health coverage during past 12 months"
      HINOTMYR   ="Months without coverage in past 12 months"
      HCSPFYR    ="Amount family spent for medical care"
      HIKINDA    ="Private health insurance"
      HIKINDB    ="Medicare"
      HIKINDC    ="Medi-Gap"
      HIKINDD    ="Medicaid"
      HIKINDE    ="SCHIP"
      HIKINDF    ="Military health care"
      HIKINDG    ="Indian Health Service"
      HIKINDH    ="State-sponsored health plan"
      HIKINDI    ="Other government plan"
      HIKINDJ    ="Single service plan"
      HIKINDK    ="No coverage of any type"
      MCAREPRB   ="Medicare coverage probe"
      MCAIDPRB   ="Medicaid coverage probe"
      SINCOV     ="Single service plan probe"

      /* FSD LABELS */

      PLBORN     ="Born in the United States"
      REGIONBR   ="Geographic region of birth recode"
      GEOBRTH    ="Geographic place of birth recode"
      YRSINUS    ="Years that - - has been in the U.S."
      CITIZENP   ="U.S. citizenship status"
      HEADST     ="Now attending Head Start"
      HEADSTV1   ="Ever attended Head Start"
      EDUC1      ="Highest level of school completed"
      PMILTRY    ="Did - - receive honorable discharge"
      DOINGLWP   ="What was - - doing last week"
      WHYNOWKP   ="Main reason for not working last week"
      WRKHRS2    ="Hours worked last week"
      WRKFTALL   ="Usually work full time"
      WRKLYR1    ="Work for pay last year"
      WRKMYR     ="Months worked last year"
      ERNYR_P    ="Total earnings last year"
      HIEMPOF    ="Health insurance offered at workplace"

      /* FIN LABELS */

      PSAL       ="Receive income from wages/salary (last CY)"
      PSEINC     ="Receive income from self-employment (last CY)"
      PSSRR      ="Receive income from SS or RR (last CY)"
      PSSRRDB    ="Received SS or RR as a disability benefit"
      PSSRRD     ="Received benefit due to disability"
      PPENS      ="Receive income from other pensions (disability)"
      POPENS     ="Receive income from any other pension"
      PSSI       ="Received income from SSI"
      PSSID      ="Received SSI due to disability"
      PTANF      ="Received income from welfare/TANF"
      POWBEN     ="Received other government assistance"
      PINTRSTR   ="Receive interest income"
      PDIVD      ="Receive dividends from stocks, funds, etc."
      PCHLDSP    ="Receive income from child support"
      PINCOT     ="Received income from any other source"
      PSSAPL     ="Ever applied for SSI"
      PSDAPL     ="Ever applied for SSDI"
      TANFMYR    ="Months received welfare/TANF (last CY)"
      PFSTP      ="Person authorized to receive food stamps (last CY)"
      FSTPMYR    ="Months received food stamps (last CY)"
      ELIGPWIC   ="Anyone age-eligible for the WIC program?"
      PWIC       ="Received WIC benefits"
      WIC_FLAG   ="WIC recipient age-eligible"
   ;

   * ASSOCIATE VARIABLES WITH FORMAT VALUES;
   *    (PUT ASTERISK (*) BEFORE WORD "FORMAT"
        IN NEXT STATEMENT TO PREVENT FORMAT
        ASSOCIATIONS BEING STORED WITH DATA SET);
   FORMAT

      /* IDN FORMAT ASSOCIATIONS */

      RECTYPE   PEP001X.   SRVY_YR   PEP002X.   HHX       $GROUPC.
      INTV_QRT  PEP004X.   ASSIGNWK  PEP005X.   WTIA      GROUPN.
      WTFA      GROUPN.

      /* UCF FORMAT ASSOCIATIONS */

      REGION    PEP010X.

      /* HHC FORMAT ASSOCIATIONS */

      SEX       PEP013X.   ORIGIN_I  PEP014X.   ORIGIMPT  PEP015X.
      HISPAN_I  PEP016X.   HISPIMPT  PEP017X.   RACERPI2  PEP018X.
      RACEIMP2  PEP019X.   MRACRPI2  PEP020X.   MRACBPI2  PEP021X.
      RACRECI3  PEP022X.   HISCODI3  PEP023X.   ERIMPFLG  PEP024X.
      NOWAF     PEP025X.   RRP       PEP026X.   HHREFLG   $PEP027X.
      FRRP      PEP028X.   DOB_M     $PEP029X.  DOB_Y_P   $PEP030X.
      AGE_P     PEP031X.   AGE_CHG   PEP032X.

      /* FID FORMAT ASSOCIATIONS */

      FMRPFLG   $PEP033X.  FMREFLG   $PEP034X.  R_MARITL  PEP035X.
      FSPOUS2   $PEP036X.  COHAB1    PEP037X.   COHAB2    PEP038X.
      CDCMSTAT  PEP040X.   SIB_DEG   PEP041X.   FMOTHER   $PEP042X.
      MOM_DEG   PEP043X.   FFATHER   $PEP044X.  DAD_DEG   PEP043X.
      PARENTS   PEP046X.   MOM_ED    PEP047X.   DAD_ED    PEP047X.
      ASTATFLG  PEP049X.   CSTATFLG  PEP050X.

      /* FHS FORMAT ASSOCIATIONS */

      PLAPLYLM  PEP037X.   PLAPLYUN  PEP037X.   PSPEDEIS  PEP037X.
      PSPEDEM   PEP037X.   PLAADL    PEP037X.   LABATH    PEP037X.
      LADRESS   PEP037X.   LAEAT     PEP037X.   LABED     PEP037X.
      LATOILT   PEP037X.   LAHOME    PEP037X.   PLAIADL   PEP037X.
      PLAWKNOW  PEP037X.   PLAWKLIM  PEP064X.   PLAWALK   PEP037X.
      PLAREMEM  PEP037X.   PLIMANY   PEP067X.   LA1AR     PEP068X.
      LAHCC1    PEP069X.   LAHCC2    PEP069X.   LAHCC3    PEP069X.
      LAHCC4    PEP069X.   LAHCC5    PEP069X.   LAHCC6    PEP069X.
      LAHCC7    PEP069X.   LAHCC8    PEP069X.   LAHCC9    PEP069X.
      LAHCC10   PEP069X.   LAHCC11   PEP069X.   LAHCC12   PEP069X.
      LAHCC13   PEP069X.   LAHCC90   PEP069X.   LAHCC91   PEP069X.
      LCTIME1   PEP084X.   LCUNIT1   PEP085X.   LCDURA1   PEP086X.
      LCDURB1   PEP087X.   LCCHRC1   PEP088X.   LCTIME2   PEP084X.
      LCUNIT2   PEP085X.   LCDURA2   PEP086X.   LCDURB2   PEP087X.
      LCCHRC2   PEP088X.   LCTIME3   PEP084X.   LCUNIT3   PEP085X.
      LCDURA3   PEP086X.   LCDURB3   PEP087X.   LCCHRC3   PEP088X.
      LCTIME4   PEP084X.   LCUNIT4   PEP085X.   LCDURA4   PEP086X.
      LCDURB4   PEP087X.   LCCHRC4   PEP088X.   LCTIME5   PEP084X.
      LCUNIT5   PEP085X.   LCDURA5   PEP086X.   LCDURB5   PEP087X.
      LCCHRC5   PEP088X.   LCTIME6   PEP084X.   LCUNIT6   PEP085X.
      LCDURA6   PEP086X.   LCDURB6   PEP087X.   LCCHRC6   PEP088X.
      LCTIME7   PEP084X.   LCUNIT7   PEP085X.   LCDURA7   PEP086X.
      LCDURB7   PEP087X.   LCCHRC7   PEP088X.   LCTIME8   PEP084X.
      LCUNIT8   PEP085X.   LCDURA8   PEP086X.   LCDURB8   PEP087X.
      LCCHRC8   PEP088X.   LCTIME9   PEP084X.   LCUNIT9   PEP085X.
      LCDURA9   PEP086X.   LCDURB9   PEP087X.   LCCHRC9   PEP088X.
      LCTIME10  PEP084X.   LCUNIT10  PEP085X.   LCDURA10  PEP086X.
      LCDURB10  PEP087X.   LCCHRC10  PEP088X.   LCTIME11  PEP084X.
      LCUNIT11  PEP085X.   LCDURA11  PEP086X.   LCDURB11  PEP087X.
      LCCHRC11  PEP088X.   LCTIME12  PEP084X.   LCUNIT12  PEP085X.
      LCDURA12  PEP086X.   LCDURB12  PEP087X.   LCCHRC12  PEP088X.
      LCTIME13  PEP084X.   LCUNIT13  PEP085X.   LCDURA13  PEP086X.
      LCDURB13  PEP087X.   LCCHRC13  PEP088X.   LCTIME90  PEP084X.
      LCUNIT90  PEP085X.   LCDURA90  PEP086X.   LCDURB90  PEP087X.
      LCCHRC90  PEP088X.   LCTIME91  PEP084X.   LCUNIT91  PEP085X.
      LCDURA91  PEP086X.   LCDURB91  PEP087X.   LCCHRC91  PEP088X.
      LAHCA1    PEP069X.   LAHCA2    PEP069X.   LAHCA3    PEP069X.
      LAHCA4    PEP069X.   LAHCA5    PEP069X.   LAHCA6    PEP069X.
      LAHCA7    PEP069X.   LAHCA8    PEP069X.   LAHCA9    PEP069X.
      LAHCA10   PEP069X.   LAHCA11   PEP069X.   LAHCA12   PEP069X.
      LAHCA13   PEP069X.   LAHCA14   PEP069X.   LAHCA15   PEP069X.
      LAHCA16   PEP069X.   LAHCA17   PEP069X.   LAHCA18   PEP069X.
      LAHCA19_  PEP069X.   LAHCA20_  PEP069X.   LAHCA21_  PEP069X.
      LAHCA22_  PEP069X.   LAHCA23_  PEP069X.   LAHCA24_  PEP069X.
      LAHCA25_  PEP069X.   LAHCA26_  PEP069X.   LAHCA27_  PEP069X.
      LAHCA28_  PEP069X.   LAHCA29_  PEP069X.   LAHCA30_  PEP069X.
      LAHCA31_  PEP069X.   LAHCA32_  PEP069X.   LAHCA33_  PEP069X.
      LAHCA34_  PEP069X.   LAHCA90   PEP069X.   LAHCA91   PEP069X.
      LATIME1   PEP084X.   LAUNIT1   PEP085X.   LADURA1   PEP197X.
      LADURB1   PEP198X.   LACHRC1   PEP088X.   LATIME2   PEP084X.
      LAUNIT2   PEP085X.   LADURA2   PEP197X.   LADURB2   PEP198X.
      LACHRC2   PEP088X.   LATIME3   PEP084X.   LAUNIT3   PEP085X.
      LADURA3   PEP197X.   LADURB3   PEP198X.   LACHRC3   PEP088X.
      LATIME4   PEP084X.   LAUNIT4   PEP085X.   LADURA4   PEP197X.
      LADURB4   PEP198X.   LACHRC4   PEP088X.   LATIME5   PEP084X.
      LAUNIT5   PEP085X.   LADURA5   PEP197X.   LADURB5   PEP198X.
      LACHRC5   PEP088X.   LATIME6   PEP084X.   LAUNIT6   PEP085X.
      LADURA6   PEP197X.   LADURB6   PEP198X.   LACHRC6   PEP088X.
      LATIME7   PEP084X.   LAUNIT7   PEP085X.   LADURA7   PEP197X.
      LADURB7   PEP198X.   LACHRC7   PEP088X.   LATIME8   PEP084X.
      LAUNIT8   PEP085X.   LADURA8   PEP197X.   LADURB8   PEP198X.
      LACHRC8   PEP088X.   LATIME9   PEP084X.   LAUNIT9   PEP085X.
      LADURA9   PEP197X.   LADURB9   PEP198X.   LACHRC9   PEP088X.
      LATIME10  PEP084X.   LAUNIT10  PEP085X.   LADURA10  PEP197X.
      LADURB10  PEP198X.   LACHRC10  PEP088X.   LATIME11  PEP084X.
      LAUNIT11  PEP085X.   LADURA11  PEP197X.   LADURB11  PEP198X.
      LACHRC11  PEP088X.   LATIME12  PEP084X.   LAUNIT12  PEP085X.
      LADURA12  PEP197X.   LADURB12  PEP198X.   LACHRC12  PEP088X.
      LATIME13  PEP084X.   LAUNIT13  PEP085X.   LADURA13  PEP197X.
      LADURB13  PEP198X.   LACHRC13  PEP088X.   LATIME14  PEP084X.
      LAUNIT14  PEP085X.   LADURA14  PEP197X.   LADURB14  PEP198X.
      LACHRC14  PEP088X.   LATIME15  PEP084X.   LAUNIT15  PEP085X.
      LADURA15  PEP197X.   LADURB15  PEP198X.   LACHRC15  PEP088X.
      LATIME16  PEP084X.   LAUNIT16  PEP085X.   LADURA16  PEP197X.
      LADURB16  PEP198X.   LACHRC16  PEP088X.   LATIME17  PEP084X.
      LAUNIT17  PEP085X.   LADURA17  PEP197X.   LADURB17  PEP198X.
      LACHRC17  PEP088X.   LATIME18  PEP084X.   LAUNIT18  PEP085X.
      LADURA18  PEP197X.   LADURB18  PEP198X.   LACHRC18  PEP088X.
      LATIME19  PEP084X.   LAUNIT19  PEP085X.   LADURA19  PEP197X.
      LADURB19  PEP198X.   LACHRC19  PEP088X.   LATIME20  PEP084X.
      LAUNIT20  PEP085X.   LADURA20  PEP197X.   LADURB20  PEP198X.
      LACHRC20  PEP088X.   LATIME21  PEP084X.   LAUNIT21  PEP085X.
      LADURA21  PEP197X.   LADURB21  PEP198X.   LACHRC21  PEP088X.
      LATIME22  PEP084X.   LAUNIT22  PEP085X.   LADURA22  PEP197X.
      LADURB22  PEP198X.   LACHRC22  PEP088X.   LATIME23  PEP084X.
      LAUNIT23  PEP085X.   LADURA23  PEP197X.   LADURB23  PEP198X.
      LACHRC23  PEP088X.   LATIME24  PEP084X.   LAUNIT24  PEP085X.
      LADURA24  PEP197X.   LADURB24  PEP198X.   LACHRC24  PEP088X.
      LATIME25  PEP084X.   LAUNIT25  PEP085X.   LADURA25  PEP197X.
      LADURB25  PEP198X.   LACHRC25  PEP088X.   LATIME26  PEP084X.
      LAUNIT26  PEP085X.   LADURA26  PEP197X.   LADURB26  PEP198X.
      LACHRC26  PEP088X.   LATIME27  PEP084X.   LAUNIT27  PEP085X.
      LADURA27  PEP197X.   LADURB27  PEP198X.   LACHRC27  PEP088X.
      LATIME28  PEP084X.   LAUNIT28  PEP085X.   LADURA28  PEP197X.
      LADURB28  PEP198X.   LACHRC28  PEP088X.   LATIME29  PEP084X.
      LAUNIT29  PEP085X.   LADURA29  PEP197X.   LADURB29  PEP198X.
      LACHRC29  PEP088X.   LATIME30  PEP084X.   LAUNIT30  PEP085X.
      LADURA30  PEP197X.   LADURB30  PEP198X.   LACHRC30  PEP088X.
      LATIME31  PEP084X.   LAUNIT31  PEP085X.   LADURA31  PEP197X.
      LADURB31  PEP198X.   LACHRC31  PEP088X.   LATIME32  PEP084X.
      LAUNIT32  PEP085X.   LADURA32  PEP197X.   LADURB32  PEP198X.
      LACHRC32  PEP088X.   LATIME33  PEP084X.   LAUNIT33  PEP085X.
      LADURA33  PEP197X.   LADURB33  PEP198X.   LACHRC33  PEP088X.
      LATIME34  PEP084X.   LAUNIT34  PEP085X.   LADURA34  PEP197X.
      LADURB34  PEP198X.   LACHRC34  PEP088X.   LATIME90  PEP084X.
      LAUNIT90  PEP085X.   LADURA90  PEP197X.   LADURB90  PEP198X.
      LACHRC90  PEP088X.   LATIME91  PEP084X.   LAUNIT91  PEP085X.
      LADURA91  PEP197X.   LADURB91  PEP198X.   LACHRC91  PEP088X.
      LCONDRT   PEP375X.   LACHRONR  PEP376X.   PHSTAT    PEP377X.

      /* FAU FORMAT ASSOCIATIONS */

      PDMED12M  PEP037X.   PNMED12M  PEP037X.   PHOSPYR2  PEP037X.
      HOSPNO    PEP381X.   HPNITE    PEP381X.   PHCHM2W   PEP037X.
      PHCHMN2W  PEP384X.   PHCPH2WR  PEP037X.   PHCPHN2W  PEP384X.
      PHCDV2W   PEP037X.   PHCDVN2W  PEP384X.   P10DVYR   PEP037X.

      /* FHI FORMAT ASSOCIATIONS */

      NOTCOV    PEP390X.   MEDICARE  PEP391X.   MCPART    PEP392X.
      MCCHOICE  PEP037X.   MCHMO     PEP037X.   MCNAMEN   PEP395X.
      MCREF     PEP037X.   MCPAYPRE  PEP037X.   MCPARTD   PEP037X.
      MEDICAID  PEP391X.   MACHMD    PEP400X.   MAPCMD    PEP037X.
      MAREF     PEP037X.   SINGLE    PEP403X.   SSTYPEA   PEP069X.
      SSTYPEB   PEP069X.   SSTYPEC   PEP069X.   SSTYPED   PEP069X.
      SSTYPEE   PEP069X.   SSTYPEF   PEP069X.   SSTYPEG   PEP069X.
      SSTYPEH   PEP069X.   SSTYPEI   PEP069X.   SSTYPEJ   PEP069X.
      SSTYPEK   PEP069X.   SSTYPEL   PEP069X.   PRIVATE   PEP391X.
      HITYPE1   PEP384X.   WHONAM1   PEP418X.   PLNWRKN1  PEP419X.
      PLNPAY11  PEP069X.   PLNPAY21  PEP069X.   PLNPAY31  PEP069X.
      PLNPAY41  PEP069X.   PLNPAY51  PEP069X.   PLNPAY61  PEP069X.
      PLNPAY71  PEP069X.   HICOSTR1  PEP427X.   PLNMGD1   PEP428X.
      MGCHMD1   PEP429X.   MGPRMD1   PEP037X.   MGPYMD1   PEP037X.
      MGPREF1   PEP037X.   PRRXCOV1  PEP037X.   HITYPE2   PEP384X.
      WHONAM2   PEP418X.   PLNWRKN2  PEP419X.   PLNPAY12  PEP069X.
      PLNPAY22  PEP069X.   PLNPAY32  PEP069X.   PLNPAY42  PEP069X.
      PLNPAY52  PEP069X.   PLNPAY62  PEP069X.   PLNPAY72  PEP069X.
      HICOSTR2  PEP427X.   PLNMGD2   PEP428X.   MGCHMD2   PEP429X.
      MGPRMD2   PEP037X.   MGPYMD2   PEP037X.   MGPREF2   PEP037X.
      PRRXCOV2  PEP037X.   PRPLPLUS  PEP037X.   SCHIP     PEP391X.
      STDOC1    PEP400X.   STPCMD1   PEP037X.   STREF1    PEP037X.
      OTHERPUB  PEP391X.   STDOC2    PEP400X.   STPCMD2   PEP037X.
      STREF2    PEP037X.   OTHERGOV  PEP391X.   STDOC3    PEP400X.
      STPCMD3   PEP037X.   STREF3    PEP037X.   MILITARY  PEP391X.
      MILSPC1   PEP069X.   MILSPC2   PEP069X.   MILSPC3   PEP069X.
      MILSPC4   PEP069X.   MILMAN    PEP469X.   IHS       PEP037X.
      HILAST    PEP471X.   HISTOP1   PEP069X.   HISTOP2   PEP069X.
      HISTOP3   PEP069X.   HISTOP4   PEP069X.   HISTOP5   PEP069X.
      HISTOP6   PEP069X.   HISTOP7   PEP069X.   HISTOP8   PEP069X.
      HISTOP9   PEP069X.   HISTOP10  PEP069X.   HISTOP11  PEP069X.
      HISTOP12  PEP069X.   HISTOP13  PEP069X.   HISTOP14  PEP069X.
      HISTOP15  PEP069X.   HINOTYR   PEP037X.   HINOTMYR  PEP384X.
      HCSPFYR   PEP489X.   HIKINDA   PEP069X.   HIKINDB   PEP069X.
      HIKINDC   PEP069X.   HIKINDD   PEP069X.   HIKINDE   PEP069X.
      HIKINDF   PEP069X.   HIKINDG   PEP069X.   HIKINDH   PEP069X.
      HIKINDI   PEP069X.   HIKINDJ   PEP069X.   HIKINDK   PEP069X.
      MCAREPRB  PEP037X.   MCAIDPRB  PEP037X.   SINCOV    PEP037X.

      /* FSD FORMAT ASSOCIATIONS */

      PLBORN    PEP037X.   REGIONBR  PEP505X.   GEOBRTH   PEP506X.
      YRSINUS   PEP507X.   CITIZENP  PEP508X.   HEADST    PEP037X.
      HEADSTV1  PEP037X.   EDUC1     PEP511X.   PMILTRY   PEP037X.
      DOINGLWP  PEP513X.   WHYNOWKP  PEP514X.   WRKHRS2   PEP515X.
      WRKFTALL  PEP037X.   WRKLYR1   PEP037X.   WRKMYR    PEP518X.
      ERNYR_P   PEP519X.   HIEMPOF   PEP037X.

      /* FIN FORMAT ASSOCIATIONS */

      PSAL      PEP037X.   PSEINC    PEP037X.   PSSRR     PEP037X.
      PSSRRDB   PEP037X.   PSSRRD    PEP037X.   PPENS     PEP037X.
      POPENS    PEP037X.   PSSI      PEP037X.   PSSID     PEP037X.
      PTANF     PEP037X.   POWBEN    PEP037X.   PINTRSTR  PEP037X.
      PDIVD     PEP037X.   PCHLDSP   PEP037X.   PINCOT    PEP037X.
      PSSAPL    PEP037X.   PSDAPL    PEP037X.   TANFMYR   PEP384X.
      PFSTP     PEP037X.   FSTPMYR   PEP384X.   ELIGPWIC  PEP541X.
      PWIC      PEP037X.   WIC_FLAG  PEP543X.;
RUN;

PROC CONTENTS DATA=NHIS.PERSONSX;
   TITLE1 'CONTENTS OF THE 2006 NHIS Person FILE';

PROC FREQ DATA=NHIS.PERSONSX NOTITLE;
   TABLES RECTYPE/LIST MISSING;
   TITLE1 'FREQUENCY REPORT FOR 2006 NHIS Person FILE';
   TITLE2 '(WEIGHTED)';
   WEIGHT WTFA;

PROC FREQ DATA=NHIS.PERSONSX NOTITLE;
   TABLES RECTYPE/LIST MISSING;
   TITLE1 'FREQUENCY REPORT FOR 2006 NHIS Person FILE';
   TITLE2 '(UNWEIGHTED)';

* USER NOTE: TO SEE UNFORMATTED VALUES IN PROCEDURES, ADD THE
             STATEMENT: FORMAT _ALL_;
RUN;
