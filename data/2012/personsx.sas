*********************************************************************
 MAY 22, 2013 10:31 AM
 
 This is an example of a SAS program that creates a SAS
 file from the 2012 NHIS Public Use PERSONSX.DAT ASCII file
 
 This is stored in PERSONSX.SAS
*********************************************************************;

* USER NOTE: PLACE NEXT STATEMENT IN SUBSEQUENT PROGRAMS;
LIBNAME  NHIS     "C:\NHIS2012";

* USER NOTE: PLACE NEXT STATEMENT IN SUBSEQUENT PROGRAMS
             IF YOU ALLOW PROGRAM TO PERMANENTLY STORE FORMATS;
LIBNAME  LIBRARY  "C:\NHIS2012";

FILENAME ASCIIDAT 'C:\NHIS2012\PERSONSX.dat';

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
   VALUE PEP001X
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
   VALUE PEP002X
      .                   = '.'
      OTHER              = "Survey Year"
   ;
   VALUE PEP004X
      1                  = "1 Quarter 1"
      2                  = "2 Quarter 2"
      3                  = "3 Quarter 3"
      4                  = "4 Quarter 4"
   ;
   VALUE PEP005X
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
      ' '                 = ' '
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
      01                 = "01 Less than/equal to 8th grade"
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
   VALUE PEP051X
      1                  = "1 No sample adult record due to quality reasons"
   ;
   VALUE PEP052X
      1                  = "1 No sample child record due to quality reasons"
   ;
   VALUE PEP053X
      1                  = "1 Sample Adult selected to receive AFD section"
      2                  = "2 Sample Adult not selected to receive AFD section"
   ;
   VALUE PEP054X
      1                  = 
"1 Families selected to receive ADB (sample adults) and CDB (sample children 1-1
7 years) sections"
      2                  = 
"2 Families selected to receive FDB (all persons 1 year and older) section"
   ;
   VALUE PEP068X
      0                  = "0 Unable to work"
      1                  = "1 Limited in work"
      2                  = "2 Not limited in work"
      7                  = "7 Refused"
      8                  = "8 Not ascertained"
      9                  = "9 Don't know"
   ;
   VALUE PEP071X
      0                  = "0 Limitation previously mentioned"
      1                  = "1 Yes, limited in some other way"
      2                  = "2 Not limited in any way"
      7                  = "7 Refused"
      8                  = "8 Not ascertained"
      9                  = "9 Don't know"
   ;
   VALUE PEP072X
      1                  = "1 Yes, limited in some way"
      2                  = "2 Not limited in some way"
      7                  = "7 Refused"
      8                  = "8 Not ascertained"
      9                  = "9 Don't know"
   ;
   VALUE PEP073X
      1                  = "1 Limited in any way"
      2                  = "2 Not limited in any way"
      3                  = "3 Unknown if limited"
   ;
   VALUE PEP074X
      1                  = "1 Mentioned"
      2                  = "2 Not mentioned"
      7                  = "7 Refused"
      8                  = "8 Not ascertained"
      9                  = "9 Don't know"
   ;
   VALUE PEP089X
      95                 = "95 95+"
      96                 = "96 Since birth"
      97                 = "97 Refused"
      98                 = "98 Not ascertained"
      99                 = "99 Don't know"
   ;
   VALUE PEP090X
      1                  = "1 Day(s)"
      2                  = "2 Week(s)"
      3                  = "3 Month(s)"
      4                  = "4 Year(s)"
      6                  = "6 Since birth"
      7                  = "7 Refused"
      8                  = "8 Not ascertained"
      9                  = "9 Don't know"
   ;
   VALUE PEP091X
      00                 = "00 Less than 1 year"
      96                 = "96 Unknown number of years"
      97                 = "97 Refused"
      98                 = "98 Not ascertained"
      99                 = "99 Don't know"
   ;
   VALUE PEP092X
      0                  = "0 Since birth and child <1 year of age"
      1                  = "1 Less than 3 months"
      2                  = "2 3-5 months"
      3                  = "3 6-12 months"
      4                  = "4 More than 1 year"
      7                  = "7 Refused"
      8                  = "8 Not ascertained"
      9                  = "9 Don't know"
   ;
   VALUE PEP093X
      1                  = "1 Chronic"
      2                  = "2 Not chronic"
      9                  = "9 Unknown if chronic"
   ;
   VALUE PEP202X
      00                 = "00 Less than 1 year"
      85                 = "85 85+ years"
      96                 = "96 Unknown number of years"
      97                 = "97 Refused"
      98                 = "98 Not ascertained"
      99                 = "99 Don't know"
   ;
   VALUE PEP203X
      1                  = "1 Less than 3 months"
      2                  = "2 3-5 months"
      3                  = "3 6-12 months"
      4                  = "4 More than 1 year"
      7                  = "7 Refused"
      8                  = "8 Not ascertained"
      9                  = "9 Don't know"
   ;
   VALUE PEP380X
      1                  = 
"1 At least one condition causing limitation of activity is chronic"
      2                  = 
"2 No condition causing limitation of activity is chronic"
      9                  = 
"9 Unknown if any condition causing limitation of activity is chronic"
   ;
   VALUE PEP381X
      0                  = 
"0 Not limited in any way (including unknown if limited)"
      1                  = "1 Limited; caused by at least one chronic condition"
      2                  = "2 Limited; not caused by chronic condition"
      3                  = "3 Limited; unknown if condition is chronic"
   ;
   VALUE PEP382X
      1                  = "1 Excellent"
      2                  = "2 Very good"
      3                  = "3 Good"
      4                  = "4 Fair"
      5                  = "5 Poor"
      7                  = "7 Refused"
      8                  = "8 Not ascertained"
      9                  = "9 Don't know"
   ;
   VALUE PEP386X
      997                = "997 Refused"
      998                = "998 Not ascertained"
      999                = "999 Don't know"
   ;
   VALUE PEP389X
      97                 = "97 Refused"
      98                 = "98 Not ascertained"
      99                 = "99 Don't know"
   ;
   VALUE PEP395X
      1                  = "1 Not covered"
      2                  = "2 Covered"
      7                  = "7 Refused"
      8                  = "8 Not ascertained"
      9                  = "9 Don't know"
   ;
   VALUE PEP396X
      1                  = "1 Yes, information"
      2                  = "2 Yes, but no information"
      3                  = "3 No"
      7                  = "7 Refused"
      8                  = "8 Not ascertained"
      9                  = "9 Don't know"
   ;
   VALUE PEP397X
      1                  = "1 Part A - Hospital only"
      2                  = "2 Part B - Medical only"
      3                  = "3 Both Part A and Part B"
      7                  = "7 Refused"
      8                  = "8 Not ascertained"
      9                  = "9 Don't know"
   ;
   VALUE PEP400X
      1                  = "1 Medicare Advantage"
      2                  = "2 Private plan not Medicare Advantage"
      7                  = "7 Refused"
      8                  = "8 Not Ascertained"
      9                  = "9 Don't Know"
   ;
   VALUE PEP405X
      1                  = "1  Any doctor"
      2                  = "2  Select from book/list"
      3                  = "3  Doctor is assigned"
      7                  = "7 Refused"
      8                  = "8 Not ascertained"
      9                  = "9 Don't know"
   ;
   VALUE PEP408X
      1                  = "1 Yes, with information"
      2                  = "2 Yes, but no information"
      3                  = "3 No"
      7                  = "7 Refused"
      8                  = "8 Not ascertained"
      9                  = "9 Don't know"
   ;
   VALUE PEP422X
      1                  = "1 In own name"
      2                  = "2 Someone else in family"
      3                  = "3 Person not in household"
      7                  = "7 Refused"
      8                  = "8 Not ascertained"
      9                  = "9 Don't know"
   ;
   VALUE PEP423X
      1                  = "1 Child (including stepchildren)"
      2                  = "2 Spouse"
      3                  = "3 Former spouse"
      4                  = "4 Some other relationship"
      7                  = "7 Refused"
      8                  = "8 Not ascertained"
      9                  = "9 Don't know"
   ;
   VALUE PEP430X
      97                 = "97 Refused"
      98                 = "98 Not ascertained"
      99                 = "99 Don’t know"
   ;
   VALUE PEP434X
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
      09                 = "09 Through parents"
      10                 = "10 Through relative other than parents"
      97                 = "97 Refused"
      98                 = "98 Not ascertained"
      99                 = "99 Don't know"
   ;
   VALUE PEP442X
      20000              = "20000 $20,000 or more"
      99997              = "99997 Refused"
      99998              = "99998 Not ascertained"
      99999              = "99999 Don't know"
   ;
   VALUE PEP443X
      1                  = "1 Yes"
      2                  = "2 No"
      7                  = "7 Refused"
      8                  = "8 Not ascertained"
      9                  = "9 Don’t know"
   ;
   VALUE PEP444X
      40000              = "40000 $40,000 or more"
      99997              = "99997 Refused"
      99998              = "99998 Not ascertained"
      99999              = "99999 Don't know"
   ;
   VALUE PEP445X
      997                = "997 Refused"
      998                = "998 Not ascertained"
      999                = "999 Don’t know"
   ;
   VALUE PEP446X
      1                  = "1 HMO/IPA"
      2                  = "2 PPO"
      3                  = "3 POS"
      4                  = "4 Fee-for-service/indemnity"
      5                  = "5 Other"
      7                  = "7 Refused"
      8                  = "8 Not ascertained"
      9                  = "9 Don't know"
   ;
   VALUE PEP447X
      1                  = "1 Less than [$1,200/$2,400]"
      2                  = "2 [$1,200/$2,400] or more"
      7                  = "7 Refused"
      8                  = "8 Not ascertained"
      9                  = "9 Don't know"
   ;
   VALUE PEP449X
      1                  = "1 Any doctor"
      2                  = "2 Select from group/list"
      7                  = "7 Refused"
      8                  = "8 Not ascertained"
      9                  = "9 Don't know"
   ;
   VALUE PEP491X
      1                  = "1 Very confident"
      2                  = "2 Somewhat confident"
      3                  = "3 Not too confident"
      4                  = "4 Not confident at all"
      7                  = "7 Refused"
      8                  = "8 Not ascertained"
      9                  = "9 Don’t know"
   ;
   VALUE PEP509X
      1                  = "1 TRICARE Prime"
      2                  = "2 TRICARE Extra"
      3                  = "3 TRICARE Standard"
      4                  = "4 TRICARE for life"
      5                  = "5 TRICARE other (specify)"
      7                  = "7 Refused"
      8                  = "8 Not ascertained"
      9                  = "9 Don't know"
   ;
   VALUE PEP511X
      1                  = "1 6 months or less"
      2                  = "2 More than 6 months, but not more than 1 year ago"
      3                  = "3 More than 1 year, but not more than 3 years ago"
      4                  = "4 More than 3 years"
      5                  = "5 Never"
      7                  = "7 Refused"
      8                  = "8 Not ascertained"
      9                  = "9 Don't know"
   ;
   VALUE PEP542X
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
   VALUE PEP562X
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
   VALUE PEP563X
      1                  = "1 USA: born in one of the 50 United States or D.C."
      2                  = "2 USA: born in a U.S. territory"
      3                  = "3 Not born in the U.S. or a U.S. territory"
      7                  = "7 Refused"
      8                  = "8 Not ascertained"
      9                  = "9 Don't know"
   ;
   VALUE PEP564X
      1                  = "1 Less than 1 year"
      2                  = "2 1 yr., less than 5 yrs."
      3                  = "3 5 yrs., less than 10 yrs."
      4                  = "4 10 yrs., less than 15 yrs."
      5                  = "5 15 years or more"
      9                  = "9 Unknown"
   ;
   VALUE PEP565X
      1                  = "1 Yes, citizen of the United States"
      2                  = "2 No, not a citizen of the United States"
      7                  = "7 Refused"
      8                  = "8 Not ascertained"
      9                  = "9 Don't know"
   ;
   VALUE PEP568X
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
      10                 = "10 10th grade"
      11                 = "11 11th grade"
      12                 = "12 12th grade, no diploma"
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
   VALUE PEP583X
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
   VALUE PEP584X
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
   VALUE PEP585X
      95                 = "95 95+ hours"
      97                 = "97 Refused"
      98                 = "98 Not ascertained"
      99                 = "99 Don't know"
   ;
   VALUE PEP588X
      01                 = "01 1 month or less"
      97                 = "97 Refused"
      98                 = "98 Not ascertained"
      99                 = "99 Don't know"
   ;
   VALUE PEP589X
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
   VALUE PEP590X
      1                  = "1 Earnings data collected differently"
   ;
   VALUE PEP592X
      1                  = "1 Enter 1 to continue"
      8                  = "8 Not ascertained"
   ;
   VALUE PEP611X
      0                  = "0 No WIC age-eligible family members"
      1                  = "1 At least 1 WIC age-eligible family member"
   ;
   VALUE PEP613X
      0                  = "0 Person not age-eligible"
      1                  = "1 Person age-eligible"
   ;

DATA NHIS.PERSONSX;
   * CREATE A SAS DATA SET;
   INFILE ASCIIDAT PAD LRECL=805;

   * DEFINE LENGTH OF ALL VARIABLES;

   LENGTH

      /* IDN LENGTHS */

      RECTYPE    3   SRVY_YR    4   HHX      $ 6   INTV_QRT   3
      INTV_MON   3   FMX      $ 2   FPX      $ 2   WTIA       8
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
      ASTATFLG   3   CSTATFLG   3   QCADULT    3   QCCHILD    3

      /* FRT LENGTHS */

      AFD_FLG    3

      /* FDB LENGTHS */

      FDRN_FLG   3

      /* FHS LENGTHS */

      PLAPLYLM   3   PLAPLYUN   3   PSPEDEIS   3   PSPEDEM    3
      PLAADL     3   LABATH     3   LADRESS    3   LAEAT      3
      LABED      3   LATOILT    3   LAHOME     3   PLAIADL    3
      PLAWKNOW   3   PLAWKLIM   3   PLAWALK    3   PLAREMEM   3
      PLIMANY    3   PLIMANY2   3   LA1AR      3   LAHCC1     3
      LAHCC2     3   LAHCC3     3   LAHCC4     3   LAHCC5     3
      LAHCC6     3   LAHCC7A    3   LAHCC8     3   LAHCC9     3
      LAHCC10    3   LAHCC11    3   LAHCC12    3   LAHCC13    3
      LAHCC90    3   LAHCC91    3   LCTIME1    3   LCUNIT1    3
      LCDURA1    3   LCDURB1    3   LCCHRC1    3   LCTIME2    3
      LCUNIT2    3   LCDURA2    3   LCDURB2    3   LCCHRC2    3
      LCTIME3    3   LCUNIT3    3   LCDURA3    3   LCDURB3    3
      LCCHRC3    3   LCTIME4    3   LCUNIT4    3   LCDURA4    3
      LCDURB4    3   LCCHRC4    3   LCTIME5    3   LCUNIT5    3
      LCDURA5    3   LCDURB5    3   LCCHRC5    3   LCTIME6    3
      LCUNIT6    3   LCDURA6    3   LCDURB6    3   LCCHRC6    3
      LCTIME7A   3   LCUNIT7A   3   LCDURA7A   3   LCDURB7A   3
      LCCHRC7A   3   LCTIME8    3   LCUNIT8    3   LCDURA8    3
      LCDURB8    3   LCCHRC8    3   LCTIME9    3   LCUNIT9    3
      LCDURA9    3   LCDURB9    3   LCCHRC9    3   LCTIME10   3
      LCUNIT10   3   LCDURA10   3   LCDURB10   3   LCCHRC10   3
      LCTIME11   3   LCUNIT11   3   LCDURA11   3   LCDURB11   3
      LCCHRC11   3   LCTIME12   3   LCUNIT12   3   LCDURA12   3
      LCDURB12   3   LCCHRC12   3   LCTIME13   3   LCUNIT13   3
      LCDURA13   3   LCDURB13   3   LCCHRC13   3   LCTIME90   3
      LCUNIT90   3   LCDURA90   3   LCDURB90   3   LCCHRC90   3
      LCTIME91   3   LCUNIT91   3   LCDURA91   3   LCDURB91   3
      LCCHRC91   3   LAHCA1     3   LAHCA2     3   LAHCA3     3
      LAHCA4     3   LAHCA5     3   LAHCA6     3   LAHCA7     3
      LAHCA8     3   LAHCA9     3   LAHCA10    3   LAHCA11    3
      LAHCA12    3   LAHCA13    3   LAHCA14A   3   LAHCA15    3
      LAHCA16    3   LAHCA17    3   LAHCA18    3   LAHCA19_   3
      LAHCA20_   3   LAHCA21_   3   LAHCA22_   3   LAHCA23_   3
      LAHCA24_   3   LAHCA25_   3   LAHCA26_   3   LAHCA27_   3
      LAHCA28_   3   LAHCA29_   3   LAHCA30_   3   LAHCA31_   3
      LAHCA32_   3   LAHCA33_   3   LAHCA34_   3   LAHCA90    3
      LAHCA91    3   LATIME1    3   LAUNIT1    3   LADURA1    3
      LADURB1    3   LACHRC1    3   LATIME2    3   LAUNIT2    3
      LADURA2    3   LADURB2    3   LACHRC2    3   LATIME3    3
      LAUNIT3    3   LADURA3    3   LADURB3    3   LACHRC3    3
      LATIME4    3   LAUNIT4    3   LADURA4    3   LADURB4    3
      LACHRC4    3   LATIME5    3   LAUNIT5    3   LADURA5    3
      LADURB5    3   LACHRC5    3   LATIME6    3   LAUNIT6    3
      LADURA6    3   LADURB6    3   LACHRC6    3   LATIME7    3
      LAUNIT7    3   LADURA7    3   LADURB7    3   LACHRC7    3
      LATIME8    3   LAUNIT8    3   LADURA8    3   LADURB8    3
      LACHRC8    3   LATIME9    3   LAUNIT9    3   LADURA9    3
      LADURB9    3   LACHRC9    3   LATIME10   3   LAUNIT10   3
      LADURA10   3   LADURB10   3   LACHRC10   3   LATIME11   3
      LAUNIT11   3   LADURA11   3   LADURB11   3   LACHRC11   3
      LATIME12   3   LAUNIT12   3   LADURA12   3   LADURB12   3
      LACHRC12   3   LATIME13   3   LAUNIT13   3   LADURA13   3
      LADURB13   3   LACHRC13   3   LTIME14A   3   LUNIT14A   3
      LDURA14A   3   LDURB14A   3   LCHRC14A   3   LATIME15   3
      LAUNIT15   3   LADURA15   3   LADURB15   3   LACHRC15   3
      LATIME16   3   LAUNIT16   3   LADURA16   3   LADURB16   3
      LACHRC16   3   LATIME17   3   LAUNIT17   3   LADURA17   3
      LADURB17   3   LACHRC17   3   LATIME18   3   LAUNIT18   3
      LADURA18   3   LADURB18   3   LACHRC18   3   LATIME19   3
      LAUNIT19   3   LADURA19   3   LADURB19   3   LACHRC19   3
      LATIME20   3   LAUNIT20   3   LADURA20   3   LADURB20   3
      LACHRC20   3   LATIME21   3   LAUNIT21   3   LADURA21   3
      LADURB21   3   LACHRC21   3   LATIME22   3   LAUNIT22   3
      LADURA22   3   LADURB22   3   LACHRC22   3   LATIME23   3
      LAUNIT23   3   LADURA23   3   LADURB23   3   LACHRC23   3
      LATIME24   3   LAUNIT24   3   LADURA24   3   LADURB24   3
      LACHRC24   3   LATIME25   3   LAUNIT25   3   LADURA25   3
      LADURB25   3   LACHRC25   3   LATIME26   3   LAUNIT26   3
      LADURA26   3   LADURB26   3   LACHRC26   3   LATIME27   3
      LAUNIT27   3   LADURA27   3   LADURB27   3   LACHRC27   3
      LATIME28   3   LAUNIT28   3   LADURA28   3   LADURB28   3
      LACHRC28   3   LATIME29   3   LAUNIT29   3   LADURA29   3
      LADURB29   3   LACHRC29   3   LATIME30   3   LAUNIT30   3
      LADURA30   3   LADURB30   3   LACHRC30   3   LATIME31   3
      LAUNIT31   3   LADURA31   3   LADURB31   3   LACHRC31   3
      LATIME32   3   LAUNIT32   3   LADURA32   3   LADURB32   3
      LACHRC32   3   LATIME33   3   LAUNIT33   3   LADURA33   3
      LADURB33   3   LACHRC33   3   LATIME34   3   LAUNIT34   3
      LADURA34   3   LADURB34   3   LACHRC34   3   LATIME90   3
      LAUNIT90   3   LADURA90   3   LADURB90   3   LACHRC90   3
      LATIME91   3   LAUNIT91   3   LADURA91   3   LADURB91   3
      LACHRC91   3   LCONDRT    3   LACHRONR   3   PHSTAT     3

      /* FAU LENGTHS */

      PDMED12M   3   PNMED12M   3   PHOSPYR2   3   HOSPNO     4
      HPNITE     4   PHCHM2W    3   PHCHMN2W   3   PHCPH2WR   3
      PHCPHN2W   3   PHCDV2W    3   PHCDVN2W   3   P10DVYR    3

      /* FHI LENGTHS */

      NOTCOV     3   MEDICARE   3   MCPART     3   MCCHOICE   3
      MCHMO      3   MCADVR     3   MCPREM     3   MCREF      3
      MCPARTD    3   MEDICAID   3   MACHMD     3   MAPCMD     3
      MAREF      3   SINGLE     3   SSTYPEA    3   SSTYPEB    3
      SSTYPEC    3   SSTYPED    3   SSTYPEE    3   SSTYPEF    3
      SSTYPEG    3   SSTYPEH    3   SSTYPEI    3   SSTYPEJ    3
      SSTYPEK    3   SSTYPEL    3   PRIVATE    3   WHONAM1    3
      PRPOLH1    3   PRCOOH1    3   PRCTOH1    3   PRRLOH11   3
      PRRLOH21   3   PRRLOH31   3   PRRLOH41   3   PRCNUM1    3
      COHU191    3   COH19251   3   COHO251    3   PLNWRKR1   3
      PLNPAY11   3   PLNPAY21   3   PLNPAY31   3   PLNPAY41   3
      PLNPAY51   3   PLNPAY61   3   PLNPAY71   3   HICOSTR1   4
      EMPPAY1    3   ECOSTR1    4   EMPCSTP1   4   PLNMGD1    3
      HDHP1      3   HSAHRA1    3   MGCHMD1    3   MGPRMD1    3
      MGPYMD1    3   MGPREF1    3   PCPREQ1    3   PRRXCOV1   3
      PRDNCOV1   3   WHONAM2    3   PRPOLH2    3   PRCOOH2    3
      PRCTOH2    3   PRRLOH12   3   PRRLOH22   3   PRRLOH32   3
      PRRLOH42   3   PRCNUM2    3   COHU192    3   COH19252   3
      COHO252    3   PLNWRKR2   3   PLNPAY12   3   PLNPAY22   3
      PLNPAY32   3   PLNPAY42   3   PLNPAY52   3   PLNPAY62   3
      PLNPAY72   3   HICOSTR2   4   EMPPAY2    3   ECOSTR2    4
      EMPCSTP2   4   PLNMGD2    3   HDHP2      3   HSAHRA2    3
      MGCHMD2    3   MGPRMD2    3   MGPYMD2    3   MGPREF2    3
      PCPREQ2    3   PRRXCOV2   3   PRDNCOV2   3   PRPLPLUS   3
      FCOVCONF   3   SCHIP      3   STDOC1     3   STPCMD1    3
      STREF1     3   OTHPUB     3   STDOC2     3   STPCMD2    3
      STREF2     3   OTHGOV     3   STDOC3     3   STPCMD3    3
      STREF3     3   MILCARE    3   MILSPC1    3   MILSPC2    3
      MILSPC3    3   MILSPC4    3   MILMAN     3   IHS        3
      HILAST     3   HISTOP1    3   HISTOP2    3   HISTOP3    3
      HISTOP4    3   HISTOP5    3   HISTOP6    3   HISTOP7    3
      HISTOP8    3   HISTOP9    3   HISTOP10   3   HISTOP11   3
      HISTOP12   3   HISTOP13   3   HISTOP14   3   HISTOP15   3
      HINOTYR    3   HINOTMYR   3   FHICHNG    3   FHIKDBA    3
      FHIKDBB    3   FHIKDBC    3   FHIKDBD    3   FHIKDBE    3
      FHIKDBF    3   FHIKDBG    3   FHIKDBH    3   FHIKDBI    3
      FHIKDBJ    3   FHIKDBK    3   PWRKBR1    3   HCSPFYR    3
      MEDBILL    3   MEDBPAY    3   MEDBNOP    3   FSA        3
      HIKINDNA   3   HIKINDNB   3   HIKINDNC   3   HIKINDND   3
      HIKINDNE   3   HIKINDNF   3   HIKINDNG   3   HIKINDNH   3
      HIKINDNI   3   HIKINDNJ   3   HIKINDNK   3   MCAREPRB   3
      MCAIDPRB   3   SINCOV     3

      /* FSD LENGTHS */

      PLBORN     3   REGIONBR   3   GEOBRTH    3   YRSINUS    3
      CITIZENP   3   HEADST     3   HEADSTV1   3   EDUC1      3
      ARMFVER    3   ARMFEV     3   ARMFFC     3   ARMFTM1    3
      ARMFTM2    3   ARMFTM3    3   ARMFTM4    3   ARMFTM5    3
      ARMFTM6    3   ARMFTM7    3   ARMFTM8    3   ARMFTM9    3
      ARMFT10P   3   ARMFDS1    3   DOINGLWP   3   WHYNOWKP   3
      WRKHRS2    3   WRKFTALL   3   WRKLYR1    3   WRKMYR     3
      ERNYR_P    3   ERNYRFLG   3   HIEMPOF    3

      /* FIN LENGTHS */

      FINCINT    3   PSAL       3   PSEINC     3   PSSRR      3
      PSSRRDB    3   PSSRRD     3   PPENS      3   POPENS     3
      PSSI       3   PSSID      3   PTANF      3   POWBEN     3
      PINTRSTR   3   PDIVD      3   PCHLDSP    3   PINCOT     3
      PSSAPL     3   PSDAPL     3   TANFMYR    3   ELIGPWIC   3
      PWIC       3   WIC_FLAG   3 ;

   * INPUT ALL VARIABLES;

   INPUT

      /* IDN LOCATIONS */

      RECTYPE       1 -   2    SRVY_YR       3 -   6
      HHX      $    7 -  12    INTV_QRT     13 -  13
      INTV_MON     14 -  15    FMX      $   16 -  17
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
      QCADULT      93 -  93    QCCHILD      94 -  94


      /* FRT LOCATIONS */

      AFD_FLG      95 -  95

      /* FDB LOCATIONS */

      FDRN_FLG     96 -  96

      /* FHS LOCATIONS */

      PLAPLYLM     97 -  97    PLAPLYUN     98 -  98
      PSPEDEIS     99 -  99    PSPEDEM     100 - 100
      PLAADL      101 - 101    LABATH      102 - 102
      LADRESS     103 - 103    LAEAT       104 - 104
      LABED       105 - 105    LATOILT     106 - 106
      LAHOME      107 - 107    PLAIADL     108 - 108
      PLAWKNOW    109 - 109    PLAWKLIM    110 - 110
      PLAWALK     111 - 111    PLAREMEM    112 - 112
      PLIMANY     113 - 113    PLIMANY2    114 - 114
      LA1AR       115 - 115    LAHCC1      116 - 116
      LAHCC2      117 - 117    LAHCC3      118 - 118
      LAHCC4      119 - 119    LAHCC5      120 - 120
      LAHCC6      121 - 121    LAHCC7A     122 - 122
      LAHCC8      123 - 123    LAHCC9      124 - 124
      LAHCC10     125 - 125    LAHCC11     126 - 126
      LAHCC12     127 - 127    LAHCC13     128 - 128
      LAHCC90     129 - 129    LAHCC91     130 - 130
      LCTIME1     131 - 132    LCUNIT1     133 - 133
      LCDURA1     134 - 135    LCDURB1     136 - 136
      LCCHRC1     137 - 137    LCTIME2     138 - 139
      LCUNIT2     140 - 140    LCDURA2     141 - 142
      LCDURB2     143 - 143    LCCHRC2     144 - 144
      LCTIME3     145 - 146    LCUNIT3     147 - 147
      LCDURA3     148 - 149    LCDURB3     150 - 150
      LCCHRC3     151 - 151    LCTIME4     152 - 153
      LCUNIT4     154 - 154    LCDURA4     155 - 156
      LCDURB4     157 - 157    LCCHRC4     158 - 158
      LCTIME5     159 - 160    LCUNIT5     161 - 161
      LCDURA5     162 - 163    LCDURB5     164 - 164
      LCCHRC5     165 - 165    LCTIME6     166 - 167
      LCUNIT6     168 - 168    LCDURA6     169 - 170
      LCDURB6     171 - 171    LCCHRC6     172 - 172
      LCTIME7A    173 - 174    LCUNIT7A    175 - 175
      LCDURA7A    176 - 177    LCDURB7A    178 - 178
      LCCHRC7A    179 - 179    LCTIME8     180 - 181
      LCUNIT8     182 - 182    LCDURA8     183 - 184
      LCDURB8     185 - 185    LCCHRC8     186 - 186
      LCTIME9     187 - 188    LCUNIT9     189 - 189
      LCDURA9     190 - 191    LCDURB9     192 - 192
      LCCHRC9     193 - 193    LCTIME10    194 - 195
      LCUNIT10    196 - 196    LCDURA10    197 - 198
      LCDURB10    199 - 199    LCCHRC10    200 - 200
      LCTIME11    201 - 202    LCUNIT11    203 - 203
      LCDURA11    204 - 205    LCDURB11    206 - 206
      LCCHRC11    207 - 207    LCTIME12    208 - 209
      LCUNIT12    210 - 210    LCDURA12    211 - 212
      LCDURB12    213 - 213    LCCHRC12    214 - 214
      LCTIME13    215 - 216    LCUNIT13    217 - 217
      LCDURA13    218 - 219    LCDURB13    220 - 220
      LCCHRC13    221 - 221    LCTIME90    222 - 223
      LCUNIT90    224 - 224    LCDURA90    225 - 226
      LCDURB90    227 - 227    LCCHRC90    228 - 228
      LCTIME91    229 - 230    LCUNIT91    231 - 231
      LCDURA91    232 - 233    LCDURB91    234 - 234
      LCCHRC91    235 - 235    LAHCA1      236 - 236
      LAHCA2      237 - 237    LAHCA3      238 - 238
      LAHCA4      239 - 239    LAHCA5      240 - 240
      LAHCA6      241 - 241    LAHCA7      242 - 242
      LAHCA8      243 - 243    LAHCA9      244 - 244
      LAHCA10     245 - 245    LAHCA11     246 - 246
      LAHCA12     247 - 247    LAHCA13     248 - 248
      LAHCA14A    249 - 249    LAHCA15     250 - 250
      LAHCA16     251 - 251    LAHCA17     252 - 252
      LAHCA18     253 - 253    LAHCA19_    254 - 254
      LAHCA20_    255 - 255    LAHCA21_    256 - 256
      LAHCA22_    257 - 257    LAHCA23_    258 - 258
      LAHCA24_    259 - 259    LAHCA25_    260 - 260
      LAHCA26_    261 - 261    LAHCA27_    262 - 262
      LAHCA28_    263 - 263    LAHCA29_    264 - 264
      LAHCA30_    265 - 265    LAHCA31_    266 - 266
      LAHCA32_    267 - 267    LAHCA33_    268 - 268
      LAHCA34_    269 - 269    LAHCA90     270 - 270
      LAHCA91     271 - 271    LATIME1     272 - 273
      LAUNIT1     274 - 274    LADURA1     275 - 276
      LADURB1     277 - 277    LACHRC1     278 - 278
      LATIME2     279 - 280    LAUNIT2     281 - 281
      LADURA2     282 - 283    LADURB2     284 - 284
      LACHRC2     285 - 285    LATIME3     286 - 287
      LAUNIT3     288 - 288    LADURA3     289 - 290
      LADURB3     291 - 291    LACHRC3     292 - 292
      LATIME4     293 - 294    LAUNIT4     295 - 295
      LADURA4     296 - 297    LADURB4     298 - 298
      LACHRC4     299 - 299    LATIME5     300 - 301
      LAUNIT5     302 - 302    LADURA5     303 - 304
      LADURB5     305 - 305    LACHRC5     306 - 306
      LATIME6     307 - 308    LAUNIT6     309 - 309
      LADURA6     310 - 311    LADURB6     312 - 312
      LACHRC6     313 - 313    LATIME7     314 - 315
      LAUNIT7     316 - 316    LADURA7     317 - 318
      LADURB7     319 - 319    LACHRC7     320 - 320
      LATIME8     321 - 322    LAUNIT8     323 - 323
      LADURA8     324 - 325    LADURB8     326 - 326
      LACHRC8     327 - 327    LATIME9     328 - 329
      LAUNIT9     330 - 330    LADURA9     331 - 332
      LADURB9     333 - 333    LACHRC9     334 - 334
      LATIME10    335 - 336    LAUNIT10    337 - 337
      LADURA10    338 - 339    LADURB10    340 - 340
      LACHRC10    341 - 341    LATIME11    342 - 343
      LAUNIT11    344 - 344    LADURA11    345 - 346
      LADURB11    347 - 347    LACHRC11    348 - 348
      LATIME12    349 - 350    LAUNIT12    351 - 351
      LADURA12    352 - 353    LADURB12    354 - 354
      LACHRC12    355 - 355    LATIME13    356 - 357
      LAUNIT13    358 - 358    LADURA13    359 - 360
      LADURB13    361 - 361    LACHRC13    362 - 362
      LTIME14A    363 - 364    LUNIT14A    365 - 365
      LDURA14A    366 - 367    LDURB14A    368 - 368
      LCHRC14A    369 - 369    LATIME15    370 - 371
      LAUNIT15    372 - 372    LADURA15    373 - 374
      LADURB15    375 - 375    LACHRC15    376 - 376
      LATIME16    377 - 378    LAUNIT16    379 - 379
      LADURA16    380 - 381    LADURB16    382 - 382
      LACHRC16    383 - 383    LATIME17    384 - 385
      LAUNIT17    386 - 386    LADURA17    387 - 388
      LADURB17    389 - 389    LACHRC17    390 - 390
      LATIME18    391 - 392    LAUNIT18    393 - 393
      LADURA18    394 - 395    LADURB18    396 - 396
      LACHRC18    397 - 397    LATIME19    398 - 399
      LAUNIT19    400 - 400    LADURA19    401 - 402
      LADURB19    403 - 403    LACHRC19    404 - 404
      LATIME20    405 - 406    LAUNIT20    407 - 407
      LADURA20    408 - 409    LADURB20    410 - 410
      LACHRC20    411 - 411    LATIME21    412 - 413
      LAUNIT21    414 - 414    LADURA21    415 - 416
      LADURB21    417 - 417    LACHRC21    418 - 418
      LATIME22    419 - 420    LAUNIT22    421 - 421
      LADURA22    422 - 423    LADURB22    424 - 424
      LACHRC22    425 - 425    LATIME23    426 - 427
      LAUNIT23    428 - 428    LADURA23    429 - 430
      LADURB23    431 - 431    LACHRC23    432 - 432
      LATIME24    433 - 434    LAUNIT24    435 - 435
      LADURA24    436 - 437    LADURB24    438 - 438
      LACHRC24    439 - 439    LATIME25    440 - 441
      LAUNIT25    442 - 442    LADURA25    443 - 444
      LADURB25    445 - 445    LACHRC25    446 - 446
      LATIME26    447 - 448    LAUNIT26    449 - 449
      LADURA26    450 - 451    LADURB26    452 - 452
      LACHRC26    453 - 453    LATIME27    454 - 455
      LAUNIT27    456 - 456    LADURA27    457 - 458
      LADURB27    459 - 459    LACHRC27    460 - 460
      LATIME28    461 - 462    LAUNIT28    463 - 463
      LADURA28    464 - 465    LADURB28    466 - 466
      LACHRC28    467 - 467    LATIME29    468 - 469
      LAUNIT29    470 - 470    LADURA29    471 - 472
      LADURB29    473 - 473    LACHRC29    474 - 474
      LATIME30    475 - 476    LAUNIT30    477 - 477
      LADURA30    478 - 479    LADURB30    480 - 480
      LACHRC30    481 - 481    LATIME31    482 - 483
      LAUNIT31    484 - 484    LADURA31    485 - 486
      LADURB31    487 - 487    LACHRC31    488 - 488
      LATIME32    489 - 490    LAUNIT32    491 - 491
      LADURA32    492 - 493    LADURB32    494 - 494
      LACHRC32    495 - 495    LATIME33    496 - 497
      LAUNIT33    498 - 498    LADURA33    499 - 500
      LADURB33    501 - 501    LACHRC33    502 - 502
      LATIME34    503 - 504    LAUNIT34    505 - 505
      LADURA34    506 - 507    LADURB34    508 - 508
      LACHRC34    509 - 509    LATIME90    510 - 511
      LAUNIT90    512 - 512    LADURA90    513 - 514
      LADURB90    515 - 515    LACHRC90    516 - 516
      LATIME91    517 - 518    LAUNIT91    519 - 519
      LADURA91    520 - 521    LADURB91    522 - 522
      LACHRC91    523 - 523    LCONDRT     524 - 524
      LACHRONR    525 - 525    PHSTAT      526 - 526


      /* FAU LOCATIONS */

      PDMED12M    527 - 527    PNMED12M    528 - 528
      PHOSPYR2    529 - 529    HOSPNO      530 - 532
      HPNITE      533 - 535    PHCHM2W     536 - 536
      PHCHMN2W    537 - 538    PHCPH2WR    539 - 539
      PHCPHN2W    540 - 541    PHCDV2W     542 - 542
      PHCDVN2W    543 - 544    P10DVYR     545 - 545


      /* FHI LOCATIONS */

      NOTCOV      546 - 546    MEDICARE    547 - 547
      MCPART      548 - 548    MCCHOICE    549 - 549
      MCHMO       550 - 550    MCADVR      551 - 551
      MCPREM      552 - 552    MCREF       553 - 553
      MCPARTD     554 - 554    MEDICAID    555 - 555
      MACHMD      556 - 556    MAPCMD      557 - 557
      MAREF       558 - 558    SINGLE      559 - 559
      SSTYPEA     560 - 560    SSTYPEB     561 - 561
      SSTYPEC     562 - 562    SSTYPED     563 - 563
      SSTYPEE     564 - 564    SSTYPEF     565 - 565
      SSTYPEG     566 - 566    SSTYPEH     567 - 567
      SSTYPEI     568 - 568    SSTYPEJ     569 - 569
      SSTYPEK     570 - 570    SSTYPEL     571 - 571
      PRIVATE     572 - 572    WHONAM1     573 - 573
      PRPOLH1     574 - 574    PRCOOH1     575 - 575
      PRCTOH1     576 - 577    PRRLOH11    578 - 578
      PRRLOH21    579 - 579    PRRLOH31    580 - 580
      PRRLOH41    581 - 581    PRCNUM1     582 - 583
      COHU191     584 - 585    COH19251    586 - 587
      COHO251     588 - 589    PLNWRKR1    590 - 591
      PLNPAY11    592 - 592    PLNPAY21    593 - 593
      PLNPAY31    594 - 594    PLNPAY41    595 - 595
      PLNPAY51    596 - 596    PLNPAY61    597 - 597
      PLNPAY71    598 - 598    HICOSTR1    599 - 603
      EMPPAY1     604 - 604    ECOSTR1     605 - 609
      EMPCSTP1    610 - 612    PLNMGD1     613 - 613
      HDHP1       614 - 614    HSAHRA1     615 - 615
      MGCHMD1     616 - 616    MGPRMD1     617 - 617
      MGPYMD1     618 - 618    MGPREF1     619 - 619
      PCPREQ1     620 - 620    PRRXCOV1    621 - 621
      PRDNCOV1    622 - 622    WHONAM2     623 - 623
      PRPOLH2     624 - 624    PRCOOH2     625 - 625
      PRCTOH2     626 - 627    PRRLOH12    628 - 628
      PRRLOH22    629 - 629    PRRLOH32    630 - 630
      PRRLOH42    631 - 631    PRCNUM2     632 - 633
      COHU192     634 - 635    COH19252    636 - 637
      COHO252     638 - 639    PLNWRKR2    640 - 641
      PLNPAY12    642 - 642    PLNPAY22    643 - 643
      PLNPAY32    644 - 644    PLNPAY42    645 - 645
      PLNPAY52    646 - 646    PLNPAY62    647 - 647
      PLNPAY72    648 - 648    HICOSTR2    649 - 653
      EMPPAY2     654 - 654    ECOSTR2     655 - 659
      EMPCSTP2    660 - 662    PLNMGD2     663 - 663
      HDHP2       664 - 664    HSAHRA2     665 - 665
      MGCHMD2     666 - 666    MGPRMD2     667 - 667
      MGPYMD2     668 - 668    MGPREF2     669 - 669
      PCPREQ2     670 - 670    PRRXCOV2    671 - 671
      PRDNCOV2    672 - 672    PRPLPLUS    673 - 673
      FCOVCONF    674 - 674    SCHIP       675 - 675
      STDOC1      676 - 676    STPCMD1     677 - 677
      STREF1      678 - 678    OTHPUB      679 - 679
      STDOC2      680 - 680    STPCMD2     681 - 681
      STREF2      682 - 682    OTHGOV      683 - 683
      STDOC3      684 - 684    STPCMD3     685 - 685
      STREF3      686 - 686    MILCARE     687 - 687
      MILSPC1     688 - 688    MILSPC2     689 - 689
      MILSPC3     690 - 690    MILSPC4     691 - 691
      MILMAN      692 - 692    IHS         693 - 693
      HILAST      694 - 694    HISTOP1     695 - 695
      HISTOP2     696 - 696    HISTOP3     697 - 697
      HISTOP4     698 - 698    HISTOP5     699 - 699
      HISTOP6     700 - 700    HISTOP7     701 - 701
      HISTOP8     702 - 702    HISTOP9     703 - 703
      HISTOP10    704 - 704    HISTOP11    705 - 705
      HISTOP12    706 - 706    HISTOP13    707 - 707
      HISTOP14    708 - 708    HISTOP15    709 - 709
      HINOTYR     710 - 710    HINOTMYR    711 - 712
      FHICHNG     713 - 713    FHIKDBA     714 - 714
      FHIKDBB     715 - 715    FHIKDBC     716 - 716
      FHIKDBD     717 - 717    FHIKDBE     718 - 718
      FHIKDBF     719 - 719    FHIKDBG     720 - 720
      FHIKDBH     721 - 721    FHIKDBI     722 - 722
      FHIKDBJ     723 - 723    FHIKDBK     724 - 724
      PWRKBR1     725 - 726    HCSPFYR     727 - 727
      MEDBILL     728 - 728    MEDBPAY     729 - 729
      MEDBNOP     730 - 730    FSA         731 - 731
      HIKINDNA    732 - 732    HIKINDNB    733 - 733
      HIKINDNC    734 - 734    HIKINDND    735 - 735
      HIKINDNE    736 - 736    HIKINDNF    737 - 737
      HIKINDNG    738 - 738    HIKINDNH    739 - 739
      HIKINDNI    740 - 740    HIKINDNJ    741 - 741
      HIKINDNK    742 - 742    MCAREPRB    743 - 743
      MCAIDPRB    744 - 744    SINCOV      745 - 745


      /* FSD LOCATIONS */

      PLBORN      746 - 746    REGIONBR    747 - 748
      GEOBRTH     749 - 749    YRSINUS     750 - 750
      CITIZENP    751 - 751    HEADST      752 - 752
      HEADSTV1    753 - 753    EDUC1       754 - 755
      ARMFVER     756 - 756    ARMFEV      757 - 757
      ARMFFC      758 - 758    ARMFTM1     759 - 759
      ARMFTM2     760 - 760    ARMFTM3     761 - 761
      ARMFTM4     762 - 762    ARMFTM5     763 - 763
      ARMFTM6     764 - 764    ARMFTM7     765 - 765
      ARMFTM8     766 - 766    ARMFTM9     767 - 767
      ARMFT10P    768 - 768    ARMFDS1     769 - 769
      DOINGLWP    770 - 770    WHYNOWKP    771 - 772
      WRKHRS2     773 - 774    WRKFTALL    775 - 775
      WRKLYR1     776 - 776    WRKMYR      777 - 778
      ERNYR_P     779 - 780    ERNYRFLG    781 - 781
      HIEMPOF     782 - 782

      /* FIN LOCATIONS */

      FINCINT     783 - 783    PSAL        784 - 784
      PSEINC      785 - 785    PSSRR       786 - 786
      PSSRRDB     787 - 787    PSSRRD      788 - 788
      PPENS       789 - 789    POPENS      790 - 790
      PSSI        791 - 791    PSSID       792 - 792
      PTANF       793 - 793    POWBEN      794 - 794
      PINTRSTR    795 - 795    PDIVD       796 - 796
      PCHLDSP     797 - 797    PINCOT      798 - 798
      PSSAPL      799 - 799    PSDAPL      800 - 800
      TANFMYR     801 - 802    ELIGPWIC    803 - 803
      PWIC        804 - 804    WIC_FLAG    805 - 805
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
      WTIA       ="Weight - Interim Annual"
      WTFA       ="Weight - Final Annual"

      /* UCF LABELS */

      REGION     ="Region"
      STRAT_P    ="Pseudo-stratum for public-use file variance estimation"
      PSU_P      ="Pseudo-PSU for public-use file variance estimation"

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
      SIB_DEG    ="Degree of sibling relationship to HH reference person"
      FMOTHER    ="Person # of mother"
      MOM_DEG    ="Type of relationship with Mother"
      FFATHER    ="Person # of father"
      DAD_DEG    ="Type of relationship with Father"
      PARENTS    ="Parent(s) present in the family"
      MOM_ED     ="Education of Mother"
      DAD_ED     ="Education of Father"
      ASTATFLG   ="Sample Adult Flag"
      CSTATFLG   ="Sample Child Flag"
      QCADULT    ="Quality control flag for sample adult"
      QCCHILD    ="Quality control flag for sample child"

      /* FRT LABELS */

      AFD_FLG    ="Adult Functioning and Disability flag"

      /* FDB LABELS */

      FDRN_FLG   ="Disability Questions Test flag"

      /* FHS LABELS */

      PLAPLYLM   ="Is - - limited in kind/amount play?"
      PLAPLYUN   ="Is - - able to play at all?"
      PSPEDEIS   ="Does - - receive Special Education or EIS?"
      PSPEDEM    =
"Receive Special Education/EIS due to emotional/behavioral problem"
      PLAADL     ="Does - - need help with personal care?"
      LABATH     ="Does - - need help with bathing/showering?"
      LADRESS    ="Does - - need help dressing?"
      LAEAT      ="Does - - need help eating?"
      LABED      ="Does - - need help in/out of bed or chairs?"
      LATOILT    ="Does - - need help using the toilet?"
      LAHOME     ="Does - - need help to get around in the home?"
      PLAIADL    ="Does - - need help with routine needs?"
      PLAWKNOW   ="Is - - unable to work NOW due to health problem?"
      PLAWKLIM   ="Is - - limited in kind/amount of work?"
      PLAWALK    ="Does - - have difficulty walking without equipment?"
      PLAREMEM   ="Is - - limited by difficulty remembering?"
      PLIMANY    ="Is - - limited in any (other) way?"
      PLIMANY2   ="Is - - limited in any way?"
      LA1AR      ="Any limitation - all persons, all conditions"
      LAHCC1     ="Vision/problem seeing causes limitation"
      LAHCC2     ="Hearing problem causes limitation"
      LAHCC3     ="Speech problem causes limitation"
      LAHCC4     ="Asthma/breathing problem causes limitation"
      LAHCC5     ="Birth defect causes limitation"
      LAHCC6     ="Injury causes limitation"
      LAHCC7A    =
"Intellectual disability, also known as mental retardation causes limitation"
      LAHCC8     =
"Other developmental problem (e.g., cerebral palsy) causes limitation"
      LAHCC9     =
"Other mental, emotional, or behavioral problem causes limitation"
      LAHCC10    ="Bone, joint, or muscle problem causes limitation"
      LAHCC11    ="Epilepsy or seizures cause limitation"
      LAHCC12    ="Learning disability causes limitation"
      LAHCC13    =
"Attention Deficit/Hyperactivity Disorder (ADD/ADHD) causes limitation"
      LAHCC90    ="Other impairment/problem (1) causes limitation"
      LAHCC91    ="Other impairment/problem (2) causes limitation"
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
      LCTIME7A   =
"Duration of intellectual disability, also known as mental retardation: Number o
f units"
      LCUNIT7A   =
"Duration of intellectual disability, also known as mental retardation: Time uni
t"
      LCDURA7A   =
"Duration of intellectual disability, also known as mental retardation (in years
)"
      LCDURB7A   =
"Duration of intellectual disability, also known as mental retardation recode 2"
      LCCHRC7A   =
"Intellectual disability, also known as mental retardation condition status"
      LCTIME8    ="Duration of other developmental problem: Number of units"
      LCUNIT8    ="Duration of other developmental problem: Time unit"
      LCDURA8    ="Duration of other developmental problem (in years)"
      LCDURB8    ="Duration of other developmental problem recode 2"
      LCCHRC8    ="Other developmental problem condition status"
      LCTIME9    =
"Duration of other mental/emotional/behavioral problem: Number of units"
      LCUNIT9    =
"Duration of other mental, emotional, or behavioral problem: Number of units"
      LCDURA9    =
"Duration of other mental, emotional, or behavioral problem (in years)"
      LCDURB9    =
"Duration of other mental, emotional, or behavioral problem recode 2"
      LCCHRC9    =
"Other mental, emotional, or behavioral problem condition status"
      LCTIME10   ="Duration of bone, joint, or muscle problem: Number of units"
      LCUNIT10   ="Duration of bone, joint, or muscle problem: Time unit"
      LCDURA10   ="Duration of bone, joint, or muscle problem (in years)"
      LCDURB10   ="Duration of bone, joint, or muscle problem recode 2"
      LCCHRC10   ="Bone, joint, or muscle problem condition status"
      LCTIME11   ="Duration of epilepsy or seizures: Number of units"
      LCUNIT11   ="Duration of epilepsy or seizures: Time unit"
      LCDURA11   ="Duration of epilepsy or seizures (in years)"
      LCDURB11   ="Duration of epilepsy or seizures recode 2"
      LCCHRC11   ="Epilepsy or seizures condition status"
      LCTIME12   ="Duration of learning disability: Number of units"
      LCUNIT12   ="Duration of learning disability: Time unit"
      LCDURA12   ="Duration of learning disability (in years)"
      LCDURB12   ="Duration of learning disability recode 2"
      LCCHRC12   ="Learning disability condition status"
      LCTIME13   =
"Duration of attention deficit/hyperactivity disorder (ADD/ADHD): Number of unit
s"
      LCUNIT13   =
"Duration of attention deficit/hyperactivity disorder (ADD/ADHD): Time unit"
      LCDURA13   =
"Duration of attention deficit/hyperactivity disorder (ADD/ADHD) (in years)"
      LCDURB13   =
"Duration of attention deficit/hyperactivity disorder (ADD/ADHD) recode 2"
      LCCHRC13   =
"Attention deficit/hyperactivity disorder (ADD/ADHD) condition status"
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
      LAHCA1     ="Vision/problem seeing causes limitation"
      LAHCA2     ="Hearing problem causes limitation"
      LAHCA3     ="Arthritis/rheumatism causes limitation"
      LAHCA4     ="Back or neck problem causes limitation"
      LAHCA5     ="Fracture, bone/joint injury causes limitation"
      LAHCA6     ="Other injury causes limitation"
      LAHCA7     ="Heart problem causes limitation"
      LAHCA8     ="Stroke problem causes limitation"
      LAHCA9     ="Hypertension/high blood pressure causes limitation"
      LAHCA10    ="Diabetes causes limitation"
      LAHCA11    =
"Lung/breathing problem (e.g., asthma and emphysema) causes limitation"
      LAHCA12    ="Cancer causes limitation"
      LAHCA13    ="Birth defect causes limitation"
      LAHCA14A   =
"Intellectual disability, also known as mental retardation causes limitation"
      LAHCA15    =
"Other developmental problem (e.g., cerebral palsy) causes limitation"
      LAHCA16    ="Senility causes limitation"
      LAHCA17    ="Depression/anxiety/emotional problem causes limitation"
      LAHCA18    ="Weight problem causes limitation"
      LAHCA19_   ="Missing or amputated limb/finger/digit causes limitation"
      LAHCA20_   ="Musculoskeletal/connective tissue problem causes limitation"
      LAHCA21_   ="Circulation problems (including blood clots) cause limitation
"
      LAHCA22_   ="Endocrine/nutritional/metabolic problem causes limitation"
      LAHCA23_   ="Nervous system/sensory organ condition causes limitation"
      LAHCA24_   ="Digestive system problem causes limitation"
      LAHCA25_   ="Genitourinary system problem causes limitation"
      LAHCA26_   ="Skin/subcutaneous system problem causes limitation"
      LAHCA27_   ="Blood or blood-forming organ problem causes limitation"
      LAHCA28_   ="Benign tumor/cyst causes limitation"
      LAHCA29_   ="Alcohol/drug/substance abuse problem causes limitation"
      LAHCA30_   =
"Other mental problem/ADD/bipolar/schizophrenia causes limitation"
      LAHCA31_   ="Surgical after-effects/medical treatment causes limitation"
      LAHCA32_   ='"Old age"/elderly/aging-related problem causes limitation'
      LAHCA33_   ="Fatigue/tiredness/weakness causes limitation"
      LAHCA34_   ="Pregnancy-related problem causes limitation"
      LAHCA90    ="Other impairment/problem (1) causes limitation"
      LAHCA91    ="Other impairment/problem (2) causes limitation"
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
      LATIME4    ="Duration of back or neck problem: Number of units"
      LAUNIT4    ="Duration of back or neck problem: Time unit"
      LADURA4    ="Duration of back or neck problem (in years)"
      LADURB4    ="Duration of back or neck problem recode 2"
      LACHRC4    ="Back or neck problem condition status"
      LATIME5    ="Duration of fracture, bone/joint injury: Number of units"
      LAUNIT5    ="Duration of fracture, bone/joint injury: Time unit"
      LADURA5    ="Duration of fracture, bone/joint injury (in years)"
      LADURB5    ="Duration of fracture, bone/joint injury recode 2"
      LACHRC5    ="Fracture, bone/joint injury condition status"
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
      LATIME8    ="Duration of stroke problem: Number of units"
      LAUNIT8    ="Duration of stroke problem: Time unit"
      LADURA8    ="Duration of stroke problem (in years)"
      LADURB8    ="Duration of stroke problem recode 2"
      LACHRC8    ="Stroke problem condition status"
      LATIME9    =
"Duration of hypertension or high blood pressure: Number of units"
      LAUNIT9    ="Duration of hypertension or high blood pressure: Time unit"
      LADURA9    ="Duration of hypertension or high blood pressure (in years)"
      LADURB9    ="Duration of hypertension or high blood pressure: recode 2"
      LACHRC9    ="Hypertension or high blood pressure condition status"
      LATIME10   ="Duration of diabetes: Number of units"
      LAUNIT10   ="Duration of diabetes: Time unit"
      LADURA10   ="Duration of diabetes (in years)"
      LADURB10   ="Duration of diabetes recode 2"
      LACHRC10   ="Diabetes condition status"
      LATIME11   =
"Duration of lung or breathing problem (e.g., asthma and emphysema): Number of u
nits"
      LAUNIT11   =
"Duration of lung or breathing problem (e.g., asthma and emphysema): Time unit"
      LADURA11   =
"Duration of lung or breathing problem (e.g., asthma and emphysema) (in years)"
      LADURB11   =
"Duration of lung or breathing problem (e.g., asthma and emphysema): recode 2"
      LACHRC11   =
"Lung or breathing problem (e.g., asthma and emphysema): condition status"
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
      LTIME14A   =
"Duration of intellectual disability, also known as mental retardation: Number o
f units"
      LUNIT14A   =
"Duration of intellectual disability, also known as mental retardation: Time uni
t"
      LDURA14A   =
"Duration of intellectual disability, also known as mental retardation (in years
)"
      LDURB14A   =
"Duration of intellectual disability, also known as mental retardation recode 2"
      LCHRC14A   =
"Intellectual disability, also known as mental retardation condition status"
      LATIME15   =
"Duration of other developmental problem (e.g., cerebral palsy): Number of units
"
      LAUNIT15   =
"Duration of other developmental problem (e.g., cerebral palsy): Time unit"
      LADURA15   =
"Duration of other developmental problem (e.g., cerebral palsy) (in years)"
      LADURB15   =
"Duration of other developmental problem (e.g., cerebral palsy) recode 2"
      LACHRC15   =
"Other developmental problem (e.g., cerebral palsy) condition status"
      LATIME16   ="Duration of senility: Number of units"
      LAUNIT16   ="Duration of senility: Time unit"
      LADURA16   ="Duration of senility (in years)"
      LADURB16   ="Duration of senility recode 2"
      LACHRC16   ="Senility condition status"
      LATIME17   =
"Duration of depression, anxiety, or emotional problem: Number of units"
      LAUNIT17   =
"Duration of depression, anxiety, or emotional problem: Time unit"
      LADURA17   =
"Duration of depression, anxiety, or emotional problem (in years)"
      LADURB17   =
"Duration of depression, anxiety, or emotional problem recode 2"
      LACHRC17   ="Depression/anxiety/emotional problem condition status"
      LATIME18   ="Duration of weight problem: Number of units"
      LAUNIT18   ="Duration of weight problem: Time unit"
      LADURA18   ="Duration of weight problem (in years)"
      LADURB18   ="Duration of weight problem recode 2"
      LACHRC18   ="Weight problem condition status"
      LATIME19   =
"Duration of missing limbs (fingers, toes, or digits); amputation: Number of uni
ts"
      LAUNIT19   =
"Duration of missing limbs (fingers, toes, or digits); amputation: Time unit"
      LADURA19   =
"Duration of missing limbs (fingers, toes, or digits); amputation (in years)"
      LADURB19   =
"Duration of missing limbs (fingers, toes, or digits); amputation recode 2"
      LACHRC19   =
"Missing limbs (fingers, toes, or digits); amputation condition status"
      LATIME20   =
"Duration of musculoskeletal/connective tissue problem: Number of units"
      LAUNIT20   =
"Duration of musculoskeletal/connective tissue problem: Time unit"
      LADURA20   =
"Duration of musculoskeletal/connective tissue problem (in years)"
      LADURB20   =
"Duration of musculoskeletal/connective tissue problem recode 2"
      LACHRC20   ="Musculoskeletal/connective tissue problem condition status"
      LATIME21   =
"Duration of circulation problems (including blood clots) : Number of units"
      LAUNIT21   =
"Duration of circulation problems (including blood clots): Time unit"
      LADURA21   =
"Duration of circulation problems (including blood clots) (in years)"
      LADURB21   =
"Duration of circulation problems (including blood clots) recode 2"
      LACHRC21   ="Circulation problems (including blood clots) condition status
"
      LATIME22   =
"Duration of endocrine/nutritional/metabolic problem: Number of units"
      LAUNIT22   =
"Duration of endocrine/nutritional/metabolic problem: Time unit"
      LADURA22   =
"Duration of endocrine/nutritional/metabolic problem (in years)"
      LADURB22   ="Duration of endocrine/nutritional/metabolic problem recode 2"
      LACHRC22   ="Endocrine/nutritional/metabolic problem condition status"
      LATIME23   =
"Duration of nervous system /sensory organ condition: Number of units"
      LAUNIT23   ="Duration of nervous system/sensory organ condition: Time unit
"
      LADURA23   ="Duration of nervous system/sensory organ condition (in years)
"
      LADURB23   ="Duration of nervous system/sensory organ condition recode 2"
      LACHRC23   ="Nervous system/sensory organ condition status"
      LATIME24   ="Duration of digestive system problems: Number of units"
      LAUNIT24   ="Duration of digestive system problems: Number of units"
      LADURA24   ="Duration of digestive system problems (in years)"
      LADURB24   ="Duration of digestive system problems recode 2"
      LACHRC24   ="Digestive system problems condition status"
      LATIME25   ="Duration of genitourinary system problem: Number of units"
      LAUNIT25   ="Duration of genitourinary system problem: Time unit"
      LADURA25   ="Duration of genitourinary system problem (in years)"
      LADURB25   ="Duration of genitourinary system problem recode 2"
      LACHRC25   ="Genitourinary system problem condition status"
      LATIME26   =
"Duration of skin/subcutaneous system problems: Number of units"
      LAUNIT26   ="Duration of skin/subcutaneous system problems: Time unit"
      LADURA26   ="Duration of skin/subcutaneous system problems (in years)"
      LADURB26   ="Duration of skin/subcutaneous system problem recode 2"
      LACHRC26   ="Skin/subcutaneous system problems condition status"
      LATIME27   =
"Duration of blood or blood-forming organ problem: Number of units"
      LAUNIT27   ="Duration of blood or blood-forming organ problem: Time unit"
      LADURA27   ="Duration of blood or blood-forming organ problem (in years)"
      LADURB27   ="Duration of blood or blood-forming organ problem recode 2"
      LACHRC27   ="Blood or blood-forming organ problem condition status"
      LATIME28   ="Duration of benign tumor/cyst: Number of units"
      LAUNIT28   ="Duration of benign tumor/cyst: Time unit"
      LADURA28   ="Duration of benign tumor/cyst (in years)"
      LADURB28   ="Duration of benign tumor/cyst recode 2"
      LACHRC28   ="Benign tumor/cyst condition status"
      LATIME29   =
"Duration of alcohol/drug/substance abuse problem: Number of units"
      LAUNIT29   ="Duration of alcohol/drug/substance abuse problem: Time unit"
      LADURA29   ="Duration of alcohol/drug/substance abuse problem (in years)"
      LADURB29   ="Duration of alcohol/drug/substance abuse problem recode 2"
      LACHRC29   ="Alcohol/drug/substance abuse problem condition status"
      LATIME30   =
"Duration of other mental problem/ADD/Bipolar/Schizophrenia: Number of units"
      LAUNIT30   =
"Duration of other mental problem/ADD/Bipolar/Schizophrenia: Time unit"
      LADURA30   =
"Duration of other mental problem/ADD/Bipolar/Schizophrenia (in years)"
      LADURB30   =
"Duration of other mental problem/ADD/Bipolar/Schizophrenia recode 2"
      LACHRC30   =
"Other mental problem/ADD/Bipolar/Schizophrenia condition status"
      LATIME31   =
"Duration of surgical after-effects/medical treatment problems: Number of units"
      LAUNIT31   =
"Duration of surgical after-effects/medical treatment problems: Time unit"
      LADURA31   =
"Duration of surgical after-effects/medical treatment problems (in years)"
      LADURB31   =
"Duration of surgical after-effects/medical treatment problems recode 2"
      LACHRC31   =
"Surgical after-effects/medical treatment problems condition status"
      LATIME32   =
'Duration of "old age"/elderly/aging-related problems: Number of units'
      LAUNIT32   =
'Duration of "old age"/elderly/aging-related problems: Number of units'
      LADURA32   =
'Duration of "old age"/elderly/aging-related problems (in years)'
      LADURB32   ='Duration of "old age"/elderly/aging-related problems recode 2
'
      LACHRC32   ='"Old age"/elderly/aging-related problems condition status'
      LATIME33   =
"Duration of fatigue/tiredness/weakness problem: Number of units"
      LAUNIT33   ="Duration of fatigue/tiredness/weakness problem: Time unit"
      LADURA33   ="Duration of fatigue/tiredness/weakness problem (in years)"
      LADURB33   ="Duration of fatigue/tiredness/weakness problem recode 2"
      LACHRC33   ="Fatigue/tiredness/weakness problem condition status"
      LATIME34   ="Duration of pregnancy-related problem: Number of units"
      LAUNIT34   ="Duration of pregnancy-related problem: Time unit"
      LADURA34   ="Duration of pregnancy-related problem (in years)"
      LADURB34   ="Duration of pregnancy-related problem recode 2"
      LACHRC34   ="Pregnancy-related condition status"
      LATIME90   =
"Duration of other impairment/problem N.E.C. (1): Number of units"
      LAUNIT90   ="Duration of other impairment/problem N.E.C. (1): Time unit"
      LADURA90   ="Duration of other impairment/problem N.E.C. (1) (in years)"
      LADURB90   ="Duration of other impairment/problem N.E.C. (1) recode 2"
      LACHRC90   ="Other impairment/problem N.E.C. (1) condition status"
      LATIME91   =
"Duration of other impairment/problem N.E.C. (2): Number of units"
      LAUNIT91   ="Duration of other impairment/problem N.E.C. (2): Time unit"
      LADURA91   ="Duration of other impairment/problem N.E.C. (2) (in years)"
      LADURB91   ="Duration of other impairment/problem N.E.C. (2) recode 2"
      LACHRC91   ="Other impairment/problem N.E.C. (2) condition status"
      LCONDRT    =
"Chronic condition recode for person with limitation of activity"
      LACHRONR   ="Limitation of activity recode by chronic condition status"
      PHSTAT     ="Reported health status"

      /* FAU LABELS */

      PDMED12M   ="Has medical care been delayed for - - (cost), 12m"
      PNMED12M   ="Did - - need and NOT get medical care (cost), 12m"
      PHOSPYR2   ="Has - - been in a hospital OVERNIGHT, 12m"
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
      MCADVR     ="Medicare Advantage Plan"
      MCPREM     ="Premium for Medicare Advantage/ Medicare HMO"
      MCREF      ="Need a referral for special care"
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
      WHONAM1    ="Plan in whose name (Plan 1)"
      PRPOLH1    ="Relationship to outside policyholder (Plan 1)"
      PRCOOH1    ="Covered persons outside family roster (Plan 1)"
      PRCTOH1    ="Number of persons (Plan 1)"
      PRRLOH11   ="Child, including stepchild (Plan 1)"
      PRRLOH21   ="Spouse (Plan 1)"
      PRRLOH31   ="Former spouse (Plan 1)"
      PRRLOH41   ="Some other relationship (Plan 1)"
      PRCNUM1    ="Number of children covered who live elsewhere (Plan 1)"
      COHU191    ="Number of children age 0-18 (Plan 1)"
      COH19251   ="Number of children age 19-25 (Plan 1)"
      COHO251    ="Number of children age 26+ (Plan 1)"
      PLNWRKR1   ="How plan was originally obtained (Plan 1)"
      PLNPAY11   ="Paid for by self or family (Plan 1)"
      PLNPAY21   ="Paid for by employer or union (Plan 1)"
      PLNPAY31   ="Paid for by someone outside the household (Plan 1)"
      PLNPAY41   ="Paid for by Medicare (Plan 1)"
      PLNPAY51   ="Paid for by Medicaid (Plan 1)"
      PLNPAY61   ="Paid for by CHIP (Plan 1)"
      PLNPAY71   ="Paid for by government program (Plan 1)"
      HICOSTR1   ="Out-of-pocket premium cost (Plan 1)"
      EMPPAY1    ="Know how much employer or union pays (Plan 1)"
      ECOSTR1    ="Employer premium cost (Plan 1)"
      EMPCSTP1   ="Percent employer or union pays (Plan 1)"
      PLNMGD1    ="Type of private plan (Plan 1)"
      HDHP1      ="High deductible health plan (Plan 1)"
      HSAHRA1    =
"Health Savings Accounts/Health Reimbursement Accounts (plan 1)"
      MGCHMD1    ="Doctor choice (Plan 1)"
      MGPRMD1    ="Preferred list (Plan 1)"
      MGPYMD1    ="Out of plan use (Plan 1)"
      MGPREF1    ="Private referral (Plan 1)"
      PCPREQ1    ="Primary care doctor required (Plan 1)"
      PRRXCOV1   ="Prescription drug benefit (Plan 1)"
      PRDNCOV1   ="Dental Coverage (Plan 1)"
      WHONAM2    ="Plan in whose name (Plan 2)"
      PRPOLH2    ="Relationship to outside policyholder (Plan 2)"
      PRCOOH2    ="Covered persons outside family roster (Plan 2)"
      PRCTOH2    ="Number of persons (Plan 2)"
      PRRLOH12   ="Child including stepchild (Plan 2)"
      PRRLOH22   ="Spouse (Plan 2)"
      PRRLOH32   ="Former spouse (Plan 2)"
      PRRLOH42   ="Some other relationship (Plan 2)"
      PRCNUM2    ="Number of children covered who live elsewhere (Plan 2)"
      COHU192    ="Number of children age 0-18 (Plan 2)"
      COH19252   ="Number of children age 19-25 (Plan 2)"
      COHO252    ="Number of children age 26+ (Plan 2)"
      PLNWRKR2   ="How plan was originally obtained (Plan 2)"
      PLNPAY12   ="Paid for by self or family (Plan 2)"
      PLNPAY22   ="Paid for by employer or union (Plan 2)"
      PLNPAY32   ="Paid for by someone outside the household (Plan 2)"
      PLNPAY42   ="Paid for by Medicare (Plan 2)"
      PLNPAY52   ="Paid for by Medicaid (Plan 2)"
      PLNPAY62   ="Paid for by CHIP (Plan 2)"
      PLNPAY72   ="Paid for by government program (Plan 2)"
      HICOSTR2   ="Out-of-pocket premium cost (Plan 2)"
      EMPPAY2    ="Know how much employer or union pays (Plan 2)"
      ECOSTR2    ="Employer premium cost (Plan 2)"
      EMPCSTP2   ="Percent employer or union pays (Plan 2)"
      PLNMGD2    ="Type of private plan (plan 2)"
      HDHP2      ="High deductible health plan (Plan 2)"
      HSAHRA2    =
"Health Savings Accounts/Health Reimbursement Accounts (plan 2)"
      MGCHMD2    ="Doctor choice (Plan 2)"
      MGPRMD2    ="Preferred list (Plan 2)"
      MGPYMD2    ="Out of plan use (Plan 2)"
      MGPREF2    ="Private referral (Plan 2)"
      PCPREQ2    ="Primary care doctor required (Plan 2)"
      PRRXCOV2   ="Prescription drug benefit (Plan 2)"
      PRDNCOV2   ="Dental Coverage (Plan 2)"
      PRPLPLUS   ="Person has more than two private plans"
      FCOVCONF   ="Obtaining affordable coverage"
      SCHIP      ="SCHIP coverage recode"
      STDOC1     ="Any doc, chooses from a list, doc assigned (SCHIP)"
      STPCMD1    ="Primary care physician for routine care (SCHIP)"
      STREF1     ="Need a referral for special care (SCHIP)"
      OTHPUB     ="State-sponsored health plan recode"
      STDOC2     ="Any doc, chooses from a list, doc assigned (OTHPUB)"
      STPCMD2    ="Primary care physician for routine care (OTHPUB)"
      STREF2     ="Need a referral for special care (OTHPUB)"
      OTHGOV     ="Other government program recode"
      STDOC3     ="Any doc, chooses from a list, doc assigned (OTHGOV)"
      STPCMD3    ="Primary care physician for routine care (OTHGOV)"
      STREF3     ="Need a referral for special care (OTHGOV)"
      MILCARE    ="Military health care coverage recode"
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
      FHICHNG    ="Change in coverage in past 12 months"
      FHIKDBA    ="Had private health insurance coverage in the past 12 months"
      FHIKDBB    ="Had Medicare coverage in the past 12 months"
      FHIKDBC    ="Had Medi-Gap coverage in the past 12 months"
      FHIKDBD    ="Had Medicaid coverage in the past 12 months"
      FHIKDBE    ="Had SCHIP coverage in the past 12 months"
      FHIKDBF    ="Had Military health care coverage in the past 12 months"
      FHIKDBG    ="Had Indian Health Service coverage in the past 12 months"
      FHIKDBH    =
"Had State-sponsored health plan coverage in the past 12 months"
      FHIKDBI    ="Had Other government program coverage in the past 12 months"
      FHIKDBJ    ="Had Single service plan coverage in the past 12 months"
      FHIKDBK    ="Had no coverage in the past 12 months"
      PWRKBR1    =
"Which one of these categories best describes how [fill 1: your/ALIAS's] private
 health insurance was obtained?"
      HCSPFYR    ="Amount family spent for medical care"
      MEDBILL    ="Problems paying medical bills"
      MEDBPAY    ="Medical bills being paid off over time"
      MEDBNOP    ="Unable to pay medical bills"
      FSA        ="Flexible Spending Accounts"
      HIKINDNA   ="Private health insurance"
      HIKINDNB   ="Medicare"
      HIKINDNC   ="Medi-Gap"
      HIKINDND   ="Medicaid"
      HIKINDNE   ="SCHIP"
      HIKINDNF   ="Military health care"
      HIKINDNG   ="Indian Health Service"
      HIKINDNH   ="State-sponsored health plan"
      HIKINDNI   ="Other government plan"
      HIKINDNJ   ="Single service plan"
      HIKINDNK   ="No coverage of any type"
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
      ARMFVER    ="Currently on full-time active duty with the Armed Forces"
      ARMFEV     =
"Has - - ever served in U.S. Armed Forces, Reserves, or National Guard?"
      ARMFFC     =
"Was - - active duty personnel who served on a humanitarian or peacekeeping miss
ion?"
      ARMFTM1    =
"Was - - active duty in the U.S. Armed Forces in September, 2001 or later?"
      ARMFTM2    =
"Was - - active duty in the U.S. Armed Forces in August, 1990 to August, 2001 (i
ncluding Persian Gulf War)?"
      ARMFTM3    =
"Was - - active duty in the U.S. Armed Forces in September, 1980 to July, 1990?"
      ARMFTM4    =
"Was - - active duty in the U.S. Armed Forces in May, 1975 to August, 1980?"
      ARMFTM5    =
"Was - - active duty in the U.S. Armed Forces during the Vietnam era (August, 19
64 to April, 1975)?"
      ARMFTM6    =
"Was - - active duty in the U.S. Armed Forces in March, 1961 to July, 1964?"
      ARMFTM7    =
"Was - - active duty in the U.S. Armed Forces in February, 1955 to February, 196
1?"
      ARMFTM8    =
"Was - - active duty in the U.S. Armed Forces during the Korean War (July, 1950 
to January, 1955)?"
      ARMFTM9    =
"Was - - active duty in the U.S. Armed Forces in January, 1947 to June 1950?"
      ARMFT10P   =
"Was - - active duty in the U.S. Armed Forces in December, 1946 or earlier?"
      ARMFDS1    =
"Was - - active duty in the Persian Gulf during Desert Shield and/or Desert Stor
m between Aug., 1990 to Apr., 1991?"
      DOINGLWP   ="What was - - doing last week"
      WHYNOWKP   ="Main reason for not working last week"
      WRKHRS2    ="Hours worked last week"
      WRKFTALL   ="Usually work full time"
      WRKLYR1    ="Work for pay last year"
      WRKMYR     ="Months worked last year"
      ERNYR_P    ="Total earnings last year"
      ERNYRFLG   =
"Flag indicating difference in how earnings data were collected"
      HIEMPOF    ="Health insurance offered at workplace"

      /* FIN LABELS */

      FINCINT    ="Introduction to the family income section"
      PSAL       ="Received income from wages or salary (last CY)"
      PSEINC     ="Received income from self-employment (last CY)"
      PSSRR      =
"Received income from Social Security or Railroad Retirement (last CY)"
      PSSRRDB    =
"Received Social Security or Railroad Retirement income as a disability benefit"
      PSSRRD     ="Received benefit due to disability"
      PPENS      =
"Received income from any disability pension other than Social Security or Railr
oad Retirement"
      POPENS     ="Received income from any other pension"
      PSSI       ="Received income from SSI"
      PSSID      ="Received SSI due to disability"
      PTANF      =
"Received income from a state or county welfare program (e.g., TANF)"
      POWBEN     ="Received other government assistance"
      PINTRSTR   ="Received interest income"
      PDIVD      ="Received dividends from stocks, funds, etc."
      PCHLDSP    ="Received income from child support"
      PINCOT     ="Received income from any other source"
      PSSAPL     ="Ever applied for Supplemental Security Income (SSI)"
      PSDAPL     ="Ever applied for Social Security Disability Insurance (SSDI)"
      TANFMYR    ="Months received welfare/TANF (last CY)"
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
      INTV_QRT  PEP004X.   INTV_MON  PEP005X.   WTIA      GROUPN.
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
      ASTATFLG  PEP049X.   CSTATFLG  PEP050X.   QCADULT   PEP051X.
      QCCHILD   PEP052X.

      /* FRT FORMAT ASSOCIATIONS */

      AFD_FLG   PEP053X.

      /* FDB FORMAT ASSOCIATIONS */

      FDRN_FLG  PEP054X.

      /* FHS FORMAT ASSOCIATIONS */

      PLAPLYLM  PEP037X.   PLAPLYUN  PEP037X.   PSPEDEIS  PEP037X.
      PSPEDEM   PEP037X.   PLAADL    PEP037X.   LABATH    PEP037X.
      LADRESS   PEP037X.   LAEAT     PEP037X.   LABED     PEP037X.
      LATOILT   PEP037X.   LAHOME    PEP037X.   PLAIADL   PEP037X.
      PLAWKNOW  PEP037X.   PLAWKLIM  PEP068X.   PLAWALK   PEP037X.
      PLAREMEM  PEP037X.   PLIMANY   PEP071X.   PLIMANY2  PEP072X.
      LA1AR     PEP073X.   LAHCC1    PEP074X.   LAHCC2    PEP074X.
      LAHCC3    PEP074X.   LAHCC4    PEP074X.   LAHCC5    PEP074X.
      LAHCC6    PEP074X.   LAHCC7A   PEP074X.   LAHCC8    PEP074X.
      LAHCC9    PEP074X.   LAHCC10   PEP074X.   LAHCC11   PEP074X.
      LAHCC12   PEP074X.   LAHCC13   PEP074X.   LAHCC90   PEP074X.
      LAHCC91   PEP074X.   LCTIME1   PEP089X.   LCUNIT1   PEP090X.
      LCDURA1   PEP091X.   LCDURB1   PEP092X.   LCCHRC1   PEP093X.
      LCTIME2   PEP089X.   LCUNIT2   PEP090X.   LCDURA2   PEP091X.
      LCDURB2   PEP092X.   LCCHRC2   PEP093X.   LCTIME3   PEP089X.
      LCUNIT3   PEP090X.   LCDURA3   PEP091X.   LCDURB3   PEP092X.
      LCCHRC3   PEP093X.   LCTIME4   PEP089X.   LCUNIT4   PEP090X.
      LCDURA4   PEP091X.   LCDURB4   PEP092X.   LCCHRC4   PEP093X.
      LCTIME5   PEP089X.   LCUNIT5   PEP090X.   LCDURA5   PEP091X.
      LCDURB5   PEP092X.   LCCHRC5   PEP093X.   LCTIME6   PEP089X.
      LCUNIT6   PEP090X.   LCDURA6   PEP091X.   LCDURB6   PEP092X.
      LCCHRC6   PEP093X.   LCTIME7A  PEP089X.   LCUNIT7A  PEP090X.
      LCDURA7A  PEP091X.   LCDURB7A  PEP092X.   LCCHRC7A  PEP093X.
      LCTIME8   PEP089X.   LCUNIT8   PEP090X.   LCDURA8   PEP091X.
      LCDURB8   PEP092X.   LCCHRC8   PEP093X.   LCTIME9   PEP089X.
      LCUNIT9   PEP090X.   LCDURA9   PEP091X.   LCDURB9   PEP092X.
      LCCHRC9   PEP093X.   LCTIME10  PEP089X.   LCUNIT10  PEP090X.
      LCDURA10  PEP091X.   LCDURB10  PEP092X.   LCCHRC10  PEP093X.
      LCTIME11  PEP089X.   LCUNIT11  PEP090X.   LCDURA11  PEP091X.
      LCDURB11  PEP092X.   LCCHRC11  PEP093X.   LCTIME12  PEP089X.
      LCUNIT12  PEP090X.   LCDURA12  PEP091X.   LCDURB12  PEP092X.
      LCCHRC12  PEP093X.   LCTIME13  PEP089X.   LCUNIT13  PEP090X.
      LCDURA13  PEP091X.   LCDURB13  PEP092X.   LCCHRC13  PEP093X.
      LCTIME90  PEP089X.   LCUNIT90  PEP090X.   LCDURA90  PEP091X.
      LCDURB90  PEP092X.   LCCHRC90  PEP093X.   LCTIME91  PEP089X.
      LCUNIT91  PEP090X.   LCDURA91  PEP091X.   LCDURB91  PEP092X.
      LCCHRC91  PEP093X.   LAHCA1    PEP074X.   LAHCA2    PEP074X.
      LAHCA3    PEP074X.   LAHCA4    PEP074X.   LAHCA5    PEP074X.
      LAHCA6    PEP074X.   LAHCA7    PEP074X.   LAHCA8    PEP074X.
      LAHCA9    PEP074X.   LAHCA10   PEP074X.   LAHCA11   PEP074X.
      LAHCA12   PEP074X.   LAHCA13   PEP074X.   LAHCA14A  PEP074X.
      LAHCA15   PEP074X.   LAHCA16   PEP074X.   LAHCA17   PEP074X.
      LAHCA18   PEP074X.   LAHCA19_  PEP074X.   LAHCA20_  PEP074X.
      LAHCA21_  PEP074X.   LAHCA22_  PEP074X.   LAHCA23_  PEP074X.
      LAHCA24_  PEP074X.   LAHCA25_  PEP074X.   LAHCA26_  PEP074X.
      LAHCA27_  PEP074X.   LAHCA28_  PEP074X.   LAHCA29_  PEP074X.
      LAHCA30_  PEP074X.   LAHCA31_  PEP074X.   LAHCA32_  PEP074X.
      LAHCA33_  PEP074X.   LAHCA34_  PEP074X.   LAHCA90   PEP074X.
      LAHCA91   PEP074X.   LATIME1   PEP089X.   LAUNIT1   PEP090X.
      LADURA1   PEP202X.   LADURB1   PEP203X.   LACHRC1   PEP093X.
      LATIME2   PEP089X.   LAUNIT2   PEP090X.   LADURA2   PEP202X.
      LADURB2   PEP203X.   LACHRC2   PEP093X.   LATIME3   PEP089X.
      LAUNIT3   PEP090X.   LADURA3   PEP202X.   LADURB3   PEP203X.
      LACHRC3   PEP093X.   LATIME4   PEP089X.   LAUNIT4   PEP090X.
      LADURA4   PEP202X.   LADURB4   PEP203X.   LACHRC4   PEP093X.
      LATIME5   PEP089X.   LAUNIT5   PEP090X.   LADURA5   PEP202X.
      LADURB5   PEP203X.   LACHRC5   PEP093X.   LATIME6   PEP089X.
      LAUNIT6   PEP090X.   LADURA6   PEP202X.   LADURB6   PEP203X.
      LACHRC6   PEP093X.   LATIME7   PEP089X.   LAUNIT7   PEP090X.
      LADURA7   PEP202X.   LADURB7   PEP203X.   LACHRC7   PEP093X.
      LATIME8   PEP089X.   LAUNIT8   PEP090X.   LADURA8   PEP202X.
      LADURB8   PEP203X.   LACHRC8   PEP093X.   LATIME9   PEP089X.
      LAUNIT9   PEP090X.   LADURA9   PEP202X.   LADURB9   PEP203X.
      LACHRC9   PEP093X.   LATIME10  PEP089X.   LAUNIT10  PEP090X.
      LADURA10  PEP202X.   LADURB10  PEP203X.   LACHRC10  PEP093X.
      LATIME11  PEP089X.   LAUNIT11  PEP090X.   LADURA11  PEP202X.
      LADURB11  PEP203X.   LACHRC11  PEP093X.   LATIME12  PEP089X.
      LAUNIT12  PEP090X.   LADURA12  PEP202X.   LADURB12  PEP203X.
      LACHRC12  PEP093X.   LATIME13  PEP089X.   LAUNIT13  PEP090X.
      LADURA13  PEP202X.   LADURB13  PEP203X.   LACHRC13  PEP093X.
      LTIME14A  PEP089X.   LUNIT14A  PEP090X.   LDURA14A  PEP202X.
      LDURB14A  PEP203X.   LCHRC14A  PEP093X.   LATIME15  PEP089X.
      LAUNIT15  PEP090X.   LADURA15  PEP202X.   LADURB15  PEP203X.
      LACHRC15  PEP093X.   LATIME16  PEP089X.   LAUNIT16  PEP090X.
      LADURA16  PEP202X.   LADURB16  PEP203X.   LACHRC16  PEP093X.
      LATIME17  PEP089X.   LAUNIT17  PEP090X.   LADURA17  PEP202X.
      LADURB17  PEP203X.   LACHRC17  PEP093X.   LATIME18  PEP089X.
      LAUNIT18  PEP090X.   LADURA18  PEP202X.   LADURB18  PEP203X.
      LACHRC18  PEP093X.   LATIME19  PEP089X.   LAUNIT19  PEP090X.
      LADURA19  PEP202X.   LADURB19  PEP203X.   LACHRC19  PEP093X.
      LATIME20  PEP089X.   LAUNIT20  PEP090X.   LADURA20  PEP202X.
      LADURB20  PEP203X.   LACHRC20  PEP093X.   LATIME21  PEP089X.
      LAUNIT21  PEP090X.   LADURA21  PEP202X.   LADURB21  PEP203X.
      LACHRC21  PEP093X.   LATIME22  PEP089X.   LAUNIT22  PEP090X.
      LADURA22  PEP202X.   LADURB22  PEP203X.   LACHRC22  PEP093X.
      LATIME23  PEP089X.   LAUNIT23  PEP090X.   LADURA23  PEP202X.
      LADURB23  PEP203X.   LACHRC23  PEP093X.   LATIME24  PEP089X.
      LAUNIT24  PEP090X.   LADURA24  PEP202X.   LADURB24  PEP203X.
      LACHRC24  PEP093X.   LATIME25  PEP089X.   LAUNIT25  PEP090X.
      LADURA25  PEP202X.   LADURB25  PEP203X.   LACHRC25  PEP093X.
      LATIME26  PEP089X.   LAUNIT26  PEP090X.   LADURA26  PEP202X.
      LADURB26  PEP203X.   LACHRC26  PEP093X.   LATIME27  PEP089X.
      LAUNIT27  PEP090X.   LADURA27  PEP202X.   LADURB27  PEP203X.
      LACHRC27  PEP093X.   LATIME28  PEP089X.   LAUNIT28  PEP090X.
      LADURA28  PEP202X.   LADURB28  PEP203X.   LACHRC28  PEP093X.
      LATIME29  PEP089X.   LAUNIT29  PEP090X.   LADURA29  PEP202X.
      LADURB29  PEP203X.   LACHRC29  PEP093X.   LATIME30  PEP089X.
      LAUNIT30  PEP090X.   LADURA30  PEP202X.   LADURB30  PEP203X.
      LACHRC30  PEP093X.   LATIME31  PEP089X.   LAUNIT31  PEP090X.
      LADURA31  PEP202X.   LADURB31  PEP203X.   LACHRC31  PEP093X.
      LATIME32  PEP089X.   LAUNIT32  PEP090X.   LADURA32  PEP202X.
      LADURB32  PEP203X.   LACHRC32  PEP093X.   LATIME33  PEP089X.
      LAUNIT33  PEP090X.   LADURA33  PEP202X.   LADURB33  PEP203X.
      LACHRC33  PEP093X.   LATIME34  PEP089X.   LAUNIT34  PEP090X.
      LADURA34  PEP202X.   LADURB34  PEP203X.   LACHRC34  PEP093X.
      LATIME90  PEP089X.   LAUNIT90  PEP090X.   LADURA90  PEP202X.
      LADURB90  PEP203X.   LACHRC90  PEP093X.   LATIME91  PEP089X.
      LAUNIT91  PEP090X.   LADURA91  PEP202X.   LADURB91  PEP203X.
      LACHRC91  PEP093X.   LCONDRT   PEP380X.   LACHRONR  PEP381X.
      PHSTAT    PEP382X.

      /* FAU FORMAT ASSOCIATIONS */

      PDMED12M  PEP037X.   PNMED12M  PEP037X.   PHOSPYR2  PEP037X.
      HOSPNO    PEP386X.   HPNITE    PEP386X.   PHCHM2W   PEP037X.
      PHCHMN2W  PEP389X.   PHCPH2WR  PEP037X.   PHCPHN2W  PEP389X.
      PHCDV2W   PEP037X.   PHCDVN2W  PEP389X.   P10DVYR   PEP037X.

      /* FHI FORMAT ASSOCIATIONS */

      NOTCOV    PEP395X.   MEDICARE  PEP396X.   MCPART    PEP397X.
      MCCHOICE  PEP037X.   MCHMO     PEP037X.   MCADVR    PEP400X.
      MCPREM    PEP037X.   MCREF     PEP037X.   MCPARTD   PEP037X.
      MEDICAID  PEP396X.   MACHMD    PEP405X.   MAPCMD    PEP037X.
      MAREF     PEP037X.   SINGLE    PEP408X.   SSTYPEA   PEP074X.
      SSTYPEB   PEP074X.   SSTYPEC   PEP074X.   SSTYPED   PEP074X.
      SSTYPEE   PEP074X.   SSTYPEF   PEP074X.   SSTYPEG   PEP074X.
      SSTYPEH   PEP074X.   SSTYPEI   PEP074X.   SSTYPEJ   PEP074X.
      SSTYPEK   PEP074X.   SSTYPEL   PEP074X.   PRIVATE   PEP396X.
      WHONAM1   PEP422X.   PRPOLH1   PEP423X.   PRCOOH1   PEP037X.
      PRCTOH1   PEP389X.   PRRLOH11  PEP074X.   PRRLOH21  PEP074X.
      PRRLOH31  PEP074X.   PRRLOH41  PEP074X.   PRCNUM1   PEP430X.
      COHU191   PEP389X.   COH19251  PEP389X.   COHO251   PEP389X.
      PLNWRKR1  PEP434X.   PLNPAY11  PEP074X.   PLNPAY21  PEP074X.
      PLNPAY31  PEP074X.   PLNPAY41  PEP074X.   PLNPAY51  PEP074X.
      PLNPAY61  PEP074X.   PLNPAY71  PEP074X.   HICOSTR1  PEP442X.
      EMPPAY1   PEP443X.   ECOSTR1   PEP444X.   EMPCSTP1  PEP445X.
      PLNMGD1   PEP446X.   HDHP1     PEP447X.   HSAHRA1   PEP037X.
      MGCHMD1   PEP449X.   MGPRMD1   PEP037X.   MGPYMD1   PEP037X.
      MGPREF1   PEP037X.   PCPREQ1   PEP037X.   PRRXCOV1  PEP037X.
      PRDNCOV1  PEP037X.   WHONAM2   PEP422X.   PRPOLH2   PEP423X.
      PRCOOH2   PEP037X.   PRCTOH2   PEP389X.   PRRLOH12  PEP074X.
      PRRLOH22  PEP074X.   PRRLOH32  PEP074X.   PRRLOH42  PEP074X.
      PRCNUM2   PEP430X.   COHU192   PEP389X.   COH19252  PEP389X.
      COHO252   PEP389X.   PLNWRKR2  PEP434X.   PLNPAY12  PEP074X.
      PLNPAY22  PEP074X.   PLNPAY32  PEP074X.   PLNPAY42  PEP074X.
      PLNPAY52  PEP074X.   PLNPAY62  PEP074X.   PLNPAY72  PEP074X.
      HICOSTR2  PEP442X.   EMPPAY2   PEP443X.   ECOSTR2   PEP444X.
      EMPCSTP2  PEP445X.   PLNMGD2   PEP446X.   HDHP2     PEP447X.
      HSAHRA2   PEP037X.   MGCHMD2   PEP449X.   MGPRMD2   PEP037X.
      MGPYMD2   PEP037X.   MGPREF2   PEP037X.   PCPREQ2   PEP037X.
      PRRXCOV2  PEP037X.   PRDNCOV2  PEP037X.   PRPLPLUS  PEP037X.
      FCOVCONF  PEP491X.   SCHIP     PEP396X.   STDOC1    PEP405X.
      STPCMD1   PEP037X.   STREF1    PEP037X.   OTHPUB    PEP396X.
      STDOC2    PEP405X.   STPCMD2   PEP037X.   STREF2    PEP037X.
      OTHGOV    PEP396X.   STDOC3    PEP405X.   STPCMD3   PEP037X.
      STREF3    PEP037X.   MILCARE   PEP396X.   MILSPC1   PEP074X.
      MILSPC2   PEP074X.   MILSPC3   PEP074X.   MILSPC4   PEP074X.
      MILMAN    PEP509X.   IHS       PEP037X.   HILAST    PEP511X.
      HISTOP1   PEP074X.   HISTOP2   PEP074X.   HISTOP3   PEP074X.
      HISTOP4   PEP074X.   HISTOP5   PEP074X.   HISTOP6   PEP074X.
      HISTOP7   PEP074X.   HISTOP8   PEP074X.   HISTOP9   PEP074X.
      HISTOP10  PEP074X.   HISTOP11  PEP074X.   HISTOP12  PEP074X.
      HISTOP13  PEP074X.   HISTOP14  PEP074X.   HISTOP15  PEP074X.
      HINOTYR   PEP037X.   HINOTMYR  PEP389X.   FHICHNG   PEP037X.
      FHIKDBA   PEP074X.   FHIKDBB   PEP074X.   FHIKDBC   PEP074X.
      FHIKDBD   PEP074X.   FHIKDBE   PEP074X.   FHIKDBF   PEP074X.
      FHIKDBG   PEP074X.   FHIKDBH   PEP074X.   FHIKDBI   PEP074X.
      FHIKDBJ   PEP074X.   FHIKDBK   PEP074X.   PWRKBR1   PEP434X.
      HCSPFYR   PEP542X.   MEDBILL   PEP037X.   MEDBPAY   PEP037X.
      MEDBNOP   PEP037X.   FSA       PEP037X.   HIKINDNA  PEP074X.
      HIKINDNB  PEP074X.   HIKINDNC  PEP074X.   HIKINDND  PEP074X.
      HIKINDNE  PEP074X.   HIKINDNF  PEP074X.   HIKINDNG  PEP074X.
      HIKINDNH  PEP074X.   HIKINDNI  PEP074X.   HIKINDNJ  PEP074X.
      HIKINDNK  PEP074X.   MCAREPRB  PEP037X.   MCAIDPRB  PEP037X.
      SINCOV    PEP037X.

      /* FSD FORMAT ASSOCIATIONS */

      PLBORN    PEP037X.   REGIONBR  PEP562X.   GEOBRTH   PEP563X.
      YRSINUS   PEP564X.   CITIZENP  PEP565X.   HEADST    PEP037X.
      HEADSTV1  PEP037X.   EDUC1     PEP568X.   ARMFVER   PEP037X.
      ARMFEV    PEP037X.   ARMFFC    PEP037X.   ARMFTM1   PEP074X.
      ARMFTM2   PEP074X.   ARMFTM3   PEP074X.   ARMFTM4   PEP074X.
      ARMFTM5   PEP074X.   ARMFTM6   PEP074X.   ARMFTM7   PEP074X.
      ARMFTM8   PEP074X.   ARMFTM9   PEP074X.   ARMFT10P  PEP074X.
      ARMFDS1   PEP037X.   DOINGLWP  PEP583X.   WHYNOWKP  PEP584X.
      WRKHRS2   PEP585X.   WRKFTALL  PEP037X.   WRKLYR1   PEP037X.
      WRKMYR    PEP588X.   ERNYR_P   PEP589X.   ERNYRFLG  PEP590X.
      HIEMPOF   PEP037X.

      /* FIN FORMAT ASSOCIATIONS */

      FINCINT   PEP592X.   PSAL      PEP037X.   PSEINC    PEP037X.
      PSSRR     PEP037X.   PSSRRDB   PEP037X.   PSSRRD    PEP037X.
      PPENS     PEP037X.   POPENS    PEP037X.   PSSI      PEP037X.
      PSSID     PEP037X.   PTANF     PEP037X.   POWBEN    PEP037X.
      PINTRSTR  PEP037X.   PDIVD     PEP037X.   PCHLDSP   PEP037X.
      PINCOT    PEP037X.   PSSAPL    PEP037X.   PSDAPL    PEP037X.
      TANFMYR   PEP389X.   ELIGPWIC  PEP611X.   PWIC      PEP037X.
      WIC_FLAG  PEP613X.;
RUN;

PROC CONTENTS DATA=NHIS.PERSONSX;
   TITLE1 'CONTENTS OF THE 2012 NHIS Person FILE';

PROC FREQ DATA=NHIS.PERSONSX NOTITLE;
   TABLES RECTYPE/LIST MISSING;
   TITLE1 'FREQUENCY REPORT FOR 2012 NHIS Person FILE';
   TITLE2 '(WEIGHTED)';
   WEIGHT WTFA;

PROC FREQ DATA=NHIS.PERSONSX NOTITLE;
   TABLES RECTYPE/LIST MISSING;
   TITLE1 'FREQUENCY REPORT FOR 2012 NHIS Person FILE';
   TITLE2 '(UNWEIGHTED)';

* USER NOTE: TO SEE UNFORMATTED VALUES IN PROCEDURES, ADD THE
             STATEMENT: FORMAT _ALL_;
RUN;
