*********************************************************************
 JUNE 3, 2010  1:48 PM
 
 This is an example of a SAS program that creates a SAS
 file from the 2009 NHIS Public Use PERSONSX.DAT ASCII file
 
 This is stored in PERSONSX.SAS
*********************************************************************;

* USER NOTE: PLACE NEXT STATEMENT IN SUBSEQUENT PROGRAMS;
LIBNAME  NHIS     "C:\NHIS2009";

* USER NOTE: PLACE NEXT STATEMENT IN SUBSEQUENT PROGRAMS
             IF YOU ALLOW PROGRAM TO PERMANENTLY STORE FORMATS;
LIBNAME  LIBRARY  "C:\NHIS2009";

FILENAME ASCIIDAT 'C:\NHIS2009\PERSONSX.dat';

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
      40                 = "40 Sample Child"
      60                 = "60 Family"
      63                 = "63 Disability Questions Tests 2008/2009"
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
   VALUE PEP066X
      0                  = "0 Unable to work"
      1                  = "1 Limited in work"
      2                  = "2 Not limited in work"
      7                  = "7 Refused"
      8                  = "8 Not ascertained"
      9                  = "9 Don't know"
   ;
   VALUE PEP069X
      0                  = "0 Limitation previously mentioned"
      1                  = "1 Yes, limited in some other way"
      2                  = "2 Not limited in any way"
      7                  = "7 Refused"
      8                  = "8 Not ascertained"
      9                  = "9 Don't know"
   ;
   VALUE PEP070X
      1                  = "1 Limited in any way"
      2                  = "2 Not limited in any way"
      3                  = "3 Unknown if limited"
   ;
   VALUE PEP071X
      1                  = "1 Mentioned"
      2                  = "2 Not mentioned"
      7                  = "7 Refused"
      8                  = "8 Not ascertained"
      9                  = "9 Don't know"
   ;
   VALUE PEP086X
      95                 = "95 95+"
      96                 = "96 Since birth"
      97                 = "97 Refused"
      98                 = "98 Not ascertained"
      99                 = "99 Don't know"
   ;
   VALUE PEP087X
      1                  = "1 Day(s)"
      2                  = "2 Week(s)"
      3                  = "3 Month(s)"
      4                  = "4 Year(s)"
      6                  = "6 Since birth"
      7                  = "7 Refused"
      8                  = "8 Not ascertained"
      9                  = "9 Don't know"
   ;
   VALUE PEP088X
      00                 = "00 Less than 1 year"
      96                 = "96 Unknown number of years"
      97                 = "97 Refused"
      98                 = "98 Not ascertained"
      99                 = "99 Don't know"
   ;
   VALUE PEP089X
      0                  = "0 Since birth and child <1 year of age"
      1                  = "1 Less than 3 months"
      2                  = "2 3-5 months"
      3                  = "3 6-12 months"
      4                  = "4 More than 1 year"
      7                  = "7 Refused"
      8                  = "8 Not ascertained"
      9                  = "9 Don't know"
   ;
   VALUE PEP090X
      1                  = "1 Chronic"
      2                  = "2 Not chronic"
      9                  = "9 Unknown if chronic"
   ;
   VALUE PEP199X
      00                 = "00 Less than 1 year"
      85                 = "85 85+ years"
      96                 = "96 Unknown number of years"
      97                 = "97 Refused"
      98                 = "98 Not ascertained"
      99                 = "99 Don't know"
   ;
   VALUE PEP200X
      1                  = "1 Less than 3 months"
      2                  = "2 3-5 months"
      3                  = "3 6-12 months"
      4                  = "4 More than 1 year"
      7                  = "7 Refused"
      8                  = "8 Not ascertained"
      9                  = "9 Don't know"
   ;
   VALUE PEP377X
      1                  = 
"1 At least one condition causing limitation of activity is chronic"
      2                  = 
"2 No condition causing limitation of activity is chronic"
      9                  = 
"9 Unknown if any condition causing limitation of activity is chronic"
   ;
   VALUE PEP378X
      0                  = 
"0 Not limited in any way (including unknown if limited)"
      1                  = "1 Limited; caused by at least one chronic condition"
      2                  = "2 Limited; not caused by chronic condition"
      3                  = "3 Limited; unknown if condition is chronic"
   ;
   VALUE PEP379X
      1                  = "1 Excellent"
      2                  = "2 Very good"
      3                  = "3 Good"
      4                  = "4 Fair"
      5                  = "5 Poor"
      7                  = "7 Refused"
      8                  = "8 Not ascertained"
      9                  = "9 Don't know"
   ;
   VALUE PEP383X
      997                = "997 Refused"
      998                = "998 Not ascertained"
      999                = "999 Don't know"
   ;
   VALUE PEP386X
      97                 = "97 Refused"
      98                 = "98 Not ascertained"
      99                 = "99 Don't know"
   ;
   VALUE PEP392X
      1                  = "1 Not covered"
      2                  = "2 Covered"
      7                  = "7 Refused"
      8                  = "8 Not ascertained"
      9                  = "9 Don't know"
   ;
   VALUE PEP393X
      1                  = "1 Yes, information"
      2                  = "2 Yes, but no information"
      3                  = "3 No"
      7                  = "7 Refused"
      8                  = "8 Not ascertained"
      9                  = "9 Don't know"
   ;
   VALUE PEP394X
      1                  = "1 Part A - Hospital only"
      2                  = "2 Part B - Medical only"
      3                  = "3 Both Part A and Part B"
      7                  = "7 Refused"
      8                  = "8 Not ascertained"
      9                  = "9 Don't know"
   ;
   VALUE PEP397X
      04                 = "04 Medigap plan"
      12                 = "12 Group"
      22                 = "22 Staff"
      32                 = "32 IPA"
      92                 = "92 Other"
      97                 = "97 Refused"
      98                 = "98 Not ascertained"
      99                 = "99 Don't know"
   ;
   VALUE PEP402X
      1                  = "1  Any doctor"
      2                  = "2  Select from book/list"
      3                  = "3  Doctor is assigned"
      7                  = "7 Refused"
      8                  = "8 Not ascertained"
      9                  = "9 Don't know"
   ;
   VALUE PEP405X
      1                  = "1 Yes, with information"
      2                  = "2 Yes, but no information"
      3                  = "3 No"
      7                  = "7 Refused"
      8                  = "8 Not ascertained"
      9                  = "9 Don't know"
   ;
   VALUE PEP419X
      1                  = "1 HMO"
      2                  = "2 Non-HMO"
      3                  = "3 Unknown model type"
      7                  = "7 Refused"
      8                  = "8 Not ascertained"
      9                  = "9 Don't know"
   ;
   VALUE PEP420X
      1                  = "1 In own name"
      2                  = "2 Someone else in family"
      3                  = "3 Person not in household"
      7                  = "7 Refused"
      8                  = "8 Not ascertained"
      9                  = "9 Don't know"
   ;
   VALUE PEP421X
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
   VALUE PEP429X
      20000              = "20000 $20,000 or more"
      99997              = "99997 Refused"
      99998              = "99998 Not ascertained"
      99999              = "99999 Don't know"
   ;
   VALUE PEP430X
      1                  = "1 HMO/IPA"
      2                  = "2 PPO"
      3                  = "3 POS"
      4                  = "4 Fee-for-service/indemnity"
      5                  = "5 Other"
      7                  = "7 Refused"
      8                  = "8 Not ascertained"
      9                  = "9 Don't know"
   ;
   VALUE PEP431X
      1                  = "1 Less than [$1,150/$2,300]"
      2                  = "2 [$1,150/$2,300] or more"
      7                  = "7 Refused"
      8                  = "8 Not ascertained"
      9                  = "9 Don't know"
   ;
   VALUE PEP433X
      1                  = "1 Any doctor"
      2                  = "2 Select from group/list"
      7                  = "7 Refused"
      8                  = "8 Not ascertained"
      9                  = "9 Don't know"
   ;
   VALUE PEP468X
      1                  = "1 Yes, information"
      2                  = "2 Yes, but no information"
      3                  = "3 No"
      7                  = "7 Refused"
      8                  = "8 Not asertained"
      9                  = "9 Don't know"
   ;
   VALUE PEP477X
      1                  = "1 TRICARE Prime"
      2                  = "2 TRICARE Extra"
      3                  = "3 TRICARE Standard"
      4                  = "4 TRICARE for life"
      5                  = "5 TRICARE other (specify)"
      7                  = "7 Refused"
      8                  = "8 Not ascertained"
      9                  = "9 Don't know"
   ;
   VALUE PEP479X
      1                  = "1 6 months or less"
      2                  = "2 More than 6 months, but not more than 1 year ago"
      3                  = "3 More than 1 year, but not more than 3 years ago"
      4                  = "4 More than 3 years"
      5                  = "5 Never"
      7                  = "7 Refused"
      8                  = "8 Not ascertained"
      9                  = "9 Don't know"
   ;
   VALUE PEP497X
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
   VALUE PEP514X
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
   VALUE PEP515X
      1                  = "1 USA: born in one of the 50 United States or D.C."
      2                  = "2 USA: born in a U.S. territory"
      3                  = "3 Not born in the U.S. or a U.S. territory"
      7                  = "7 Refused"
      8                  = "8 Not ascertained"
      9                  = "9 Don't know"
   ;
   VALUE PEP516X
      1                  = "1 Less than 1 year"
      2                  = "2 1 yr., less than 5 yrs."
      3                  = "3 5 yrs., less than 10 yrs."
      4                  = "4 10 yrs., less than 15 yrs."
      5                  = "5 15 years or more"
      9                  = "9 Unknown"
   ;
   VALUE PEP517X
      1                  = "1 Yes, citizen of the United States"
      2                  = "2 No, not a citizen of the United States"
      7                  = "7 Refused"
      8                  = "8 Not ascertained"
      9                  = "9 Don't know"
   ;
   VALUE PEP520X
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
   VALUE PEP522X
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
   VALUE PEP523X
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
   VALUE PEP524X
      95                 = "95 95+ hours"
      97                 = "97 Refused"
      98                 = "98 Not ascertained"
      99                 = "99 Don't know"
   ;
   VALUE PEP527X
      01                 = "01 1 month or less"
      97                 = "97 Refused"
      98                 = "98 Not ascertained"
      99                 = "99 Don't know"
   ;
   VALUE PEP528X
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
   VALUE PEP530X
      1                  = "1 Enter 1 to continue"
      8                  = "8 Not ascertained"
   ;
   VALUE PEP551X
      0                  = "0 No WIC age-eligible family members"
      1                  = "1 At least 1 WIC age-eligible family member"
   ;
   VALUE PEP553X
      0                  = "0 Person not age-eligible"
      1                  = "1 Person age-eligible"
   ;

DATA NHIS.PERSONSX;
   * CREATE A SAS DATA SET;
   INFILE ASCIIDAT PAD LRECL=724;

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
      ASTATFLG   3   CSTATFLG   3   QCADULT    3   QCCHILD    3

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
      SSTYPEK    3   SSTYPEL    3   PRIVATE    3   HITYPEN1   3
      WHONAM1    3   PLNWRKN1   3   PLNPAY11   3   PLNPAY21   3
      PLNPAY31   3   PLNPAY41   3   PLNPAY51   3   PLNPAY61   3
      PLNPAY71   3   HICOSTR1   4   PLNMGD1    3   HDHP1      3
      HSAHRA1    3   MGCHMD1    3   MGPRMD1    3   MGPYMD1    3
      MGPREF1    3   PRRXCOV1   3   PRDNCOV1   3   HITYPEN2   3
      WHONAM2    3   PLNWRKN2   3   PLNPAY12   3   PLNPAY22   3
      PLNPAY32   3   PLNPAY42   3   PLNPAY52   3   PLNPAY62   3
      PLNPAY72   3   HICOSTR2   4   PLNMGD2    3   HDHP2      3
      HSAHRA2    3   MGCHMD2    3   MGPRMD2    3   MGPYMD2    3
      MGPREF2    3   PRRXCOV2   3   PRDNCOV2   3   PRPLPLUS   3
      SCHIP      3   STDOC1     3   STPCMD1    3   STREF1     3
      OTHPUB     3   STDOC2     3   STPCMD2    3   STREF2     3
      OTHGOV     3   STDOC3     3   STPCMD3    3   STREF3     3
      MILCARE    3   MILSPC1    3   MILSPC2    3   MILSPC3    3
      MILSPC4    3   MILMAN     3   IHS        3   HILAST     3
      HISTOP1    3   HISTOP2    3   HISTOP3    3   HISTOP4    3
      HISTOP5    3   HISTOP6    3   HISTOP7    3   HISTOP8    3
      HISTOP9    3   HISTOP10   3   HISTOP11   3   HISTOP12   3
      HISTOP13   3   HISTOP14   3   HISTOP15   3   HINOTYR    3
      HINOTMYR   3   HCSPFYR    3   FSA        3   HIKINDNA   3
      HIKINDNB   3   HIKINDNC   3   HIKINDND   3   HIKINDNE   3
      HIKINDNF   3   HIKINDNG   3   HIKINDNH   3   HIKINDNI   3
      HIKINDNJ   3   HIKINDNK   3   MCAREPRB   3   MCAIDPRB   3
      SINCOV     3

      /* FSD LENGTHS */

      PLBORN     3   REGIONBR   3   GEOBRTH    3   YRSINUS    3
      CITIZENP   3   HEADST     3   HEADSTV1   3   EDUC1      3
      PMILTRY    3   DOINGLWP   3   WHYNOWKP   3   WRKHRS2    3
      WRKFTALL   3   WRKLYR1    3   WRKMYR     3   ERNYR_P    3
      HIEMPOF    3

      /* FIN LENGTHS */

      FINCINT    3   PSAL       3   PSEINC     3   PSSRR      3
      PSSRRDB    3   PSSRRD     3   PPENS      3   POPENS     3
      PSSI       3   PSSID      3   PTANF      3   POWBEN     3
      PINTRSTR   3   PDIVD      3   PCHLDSP    3   PINCOT     3
      PSSAPL     3   PSDAPL     3   TANFMYR    3   PFSTP      3
      FSTPMYR    3   ELIGPWIC   3   PWIC       3   WIC_FLAG   3 ;

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
      QCADULT      93 -  93    QCCHILD      94 -  94


      /* FHS LOCATIONS */

      PLAPLYLM     95 -  95    PLAPLYUN     96 -  96
      PSPEDEIS     97 -  97    PSPEDEM      98 -  98
      PLAADL       99 -  99    LABATH      100 - 100
      LADRESS     101 - 101    LAEAT       102 - 102
      LABED       103 - 103    LATOILT     104 - 104
      LAHOME      105 - 105    PLAIADL     106 - 106
      PLAWKNOW    107 - 107    PLAWKLIM    108 - 108
      PLAWALK     109 - 109    PLAREMEM    110 - 110
      PLIMANY     111 - 111    LA1AR       112 - 112
      LAHCC1      113 - 113    LAHCC2      114 - 114
      LAHCC3      115 - 115    LAHCC4      116 - 116
      LAHCC5      117 - 117    LAHCC6      118 - 118
      LAHCC7      119 - 119    LAHCC8      120 - 120
      LAHCC9      121 - 121    LAHCC10     122 - 122
      LAHCC11     123 - 123    LAHCC12     124 - 124
      LAHCC13     125 - 125    LAHCC90     126 - 126
      LAHCC91     127 - 127    LCTIME1     128 - 129
      LCUNIT1     130 - 130    LCDURA1     131 - 132
      LCDURB1     133 - 133    LCCHRC1     134 - 134
      LCTIME2     135 - 136    LCUNIT2     137 - 137
      LCDURA2     138 - 139    LCDURB2     140 - 140
      LCCHRC2     141 - 141    LCTIME3     142 - 143
      LCUNIT3     144 - 144    LCDURA3     145 - 146
      LCDURB3     147 - 147    LCCHRC3     148 - 148
      LCTIME4     149 - 150    LCUNIT4     151 - 151
      LCDURA4     152 - 153    LCDURB4     154 - 154
      LCCHRC4     155 - 155    LCTIME5     156 - 157
      LCUNIT5     158 - 158    LCDURA5     159 - 160
      LCDURB5     161 - 161    LCCHRC5     162 - 162
      LCTIME6     163 - 164    LCUNIT6     165 - 165
      LCDURA6     166 - 167    LCDURB6     168 - 168
      LCCHRC6     169 - 169    LCTIME7     170 - 171
      LCUNIT7     172 - 172    LCDURA7     173 - 174
      LCDURB7     175 - 175    LCCHRC7     176 - 176
      LCTIME8     177 - 178    LCUNIT8     179 - 179
      LCDURA8     180 - 181    LCDURB8     182 - 182
      LCCHRC8     183 - 183    LCTIME9     184 - 185
      LCUNIT9     186 - 186    LCDURA9     187 - 188
      LCDURB9     189 - 189    LCCHRC9     190 - 190
      LCTIME10    191 - 192    LCUNIT10    193 - 193
      LCDURA10    194 - 195    LCDURB10    196 - 196
      LCCHRC10    197 - 197    LCTIME11    198 - 199
      LCUNIT11    200 - 200    LCDURA11    201 - 202
      LCDURB11    203 - 203    LCCHRC11    204 - 204
      LCTIME12    205 - 206    LCUNIT12    207 - 207
      LCDURA12    208 - 209    LCDURB12    210 - 210
      LCCHRC12    211 - 211    LCTIME13    212 - 213
      LCUNIT13    214 - 214    LCDURA13    215 - 216
      LCDURB13    217 - 217    LCCHRC13    218 - 218
      LCTIME90    219 - 220    LCUNIT90    221 - 221
      LCDURA90    222 - 223    LCDURB90    224 - 224
      LCCHRC90    225 - 225    LCTIME91    226 - 227
      LCUNIT91    228 - 228    LCDURA91    229 - 230
      LCDURB91    231 - 231    LCCHRC91    232 - 232
      LAHCA1      233 - 233    LAHCA2      234 - 234
      LAHCA3      235 - 235    LAHCA4      236 - 236
      LAHCA5      237 - 237    LAHCA6      238 - 238
      LAHCA7      239 - 239    LAHCA8      240 - 240
      LAHCA9      241 - 241    LAHCA10     242 - 242
      LAHCA11     243 - 243    LAHCA12     244 - 244
      LAHCA13     245 - 245    LAHCA14     246 - 246
      LAHCA15     247 - 247    LAHCA16     248 - 248
      LAHCA17     249 - 249    LAHCA18     250 - 250
      LAHCA19_    251 - 251    LAHCA20_    252 - 252
      LAHCA21_    253 - 253    LAHCA22_    254 - 254
      LAHCA23_    255 - 255    LAHCA24_    256 - 256
      LAHCA25_    257 - 257    LAHCA26_    258 - 258
      LAHCA27_    259 - 259    LAHCA28_    260 - 260
      LAHCA29_    261 - 261    LAHCA30_    262 - 262
      LAHCA31_    263 - 263    LAHCA32_    264 - 264
      LAHCA33_    265 - 265    LAHCA34_    266 - 266
      LAHCA90     267 - 267    LAHCA91     268 - 268
      LATIME1     269 - 270    LAUNIT1     271 - 271
      LADURA1     272 - 273    LADURB1     274 - 274
      LACHRC1     275 - 275    LATIME2     276 - 277
      LAUNIT2     278 - 278    LADURA2     279 - 280
      LADURB2     281 - 281    LACHRC2     282 - 282
      LATIME3     283 - 284    LAUNIT3     285 - 285
      LADURA3     286 - 287    LADURB3     288 - 288
      LACHRC3     289 - 289    LATIME4     290 - 291
      LAUNIT4     292 - 292    LADURA4     293 - 294
      LADURB4     295 - 295    LACHRC4     296 - 296
      LATIME5     297 - 298    LAUNIT5     299 - 299
      LADURA5     300 - 301    LADURB5     302 - 302
      LACHRC5     303 - 303    LATIME6     304 - 305
      LAUNIT6     306 - 306    LADURA6     307 - 308
      LADURB6     309 - 309    LACHRC6     310 - 310
      LATIME7     311 - 312    LAUNIT7     313 - 313
      LADURA7     314 - 315    LADURB7     316 - 316
      LACHRC7     317 - 317    LATIME8     318 - 319
      LAUNIT8     320 - 320    LADURA8     321 - 322
      LADURB8     323 - 323    LACHRC8     324 - 324
      LATIME9     325 - 326    LAUNIT9     327 - 327
      LADURA9     328 - 329    LADURB9     330 - 330
      LACHRC9     331 - 331    LATIME10    332 - 333
      LAUNIT10    334 - 334    LADURA10    335 - 336
      LADURB10    337 - 337    LACHRC10    338 - 338
      LATIME11    339 - 340    LAUNIT11    341 - 341
      LADURA11    342 - 343    LADURB11    344 - 344
      LACHRC11    345 - 345    LATIME12    346 - 347
      LAUNIT12    348 - 348    LADURA12    349 - 350
      LADURB12    351 - 351    LACHRC12    352 - 352
      LATIME13    353 - 354    LAUNIT13    355 - 355
      LADURA13    356 - 357    LADURB13    358 - 358
      LACHRC13    359 - 359    LATIME14    360 - 361
      LAUNIT14    362 - 362    LADURA14    363 - 364
      LADURB14    365 - 365    LACHRC14    366 - 366
      LATIME15    367 - 368    LAUNIT15    369 - 369
      LADURA15    370 - 371    LADURB15    372 - 372
      LACHRC15    373 - 373    LATIME16    374 - 375
      LAUNIT16    376 - 376    LADURA16    377 - 378
      LADURB16    379 - 379    LACHRC16    380 - 380
      LATIME17    381 - 382    LAUNIT17    383 - 383
      LADURA17    384 - 385    LADURB17    386 - 386
      LACHRC17    387 - 387    LATIME18    388 - 389
      LAUNIT18    390 - 390    LADURA18    391 - 392
      LADURB18    393 - 393    LACHRC18    394 - 394
      LATIME19    395 - 396    LAUNIT19    397 - 397
      LADURA19    398 - 399    LADURB19    400 - 400
      LACHRC19    401 - 401    LATIME20    402 - 403
      LAUNIT20    404 - 404    LADURA20    405 - 406
      LADURB20    407 - 407    LACHRC20    408 - 408
      LATIME21    409 - 410    LAUNIT21    411 - 411
      LADURA21    412 - 413    LADURB21    414 - 414
      LACHRC21    415 - 415    LATIME22    416 - 417
      LAUNIT22    418 - 418    LADURA22    419 - 420
      LADURB22    421 - 421    LACHRC22    422 - 422
      LATIME23    423 - 424    LAUNIT23    425 - 425
      LADURA23    426 - 427    LADURB23    428 - 428
      LACHRC23    429 - 429    LATIME24    430 - 431
      LAUNIT24    432 - 432    LADURA24    433 - 434
      LADURB24    435 - 435    LACHRC24    436 - 436
      LATIME25    437 - 438    LAUNIT25    439 - 439
      LADURA25    440 - 441    LADURB25    442 - 442
      LACHRC25    443 - 443    LATIME26    444 - 445
      LAUNIT26    446 - 446    LADURA26    447 - 448
      LADURB26    449 - 449    LACHRC26    450 - 450
      LATIME27    451 - 452    LAUNIT27    453 - 453
      LADURA27    454 - 455    LADURB27    456 - 456
      LACHRC27    457 - 457    LATIME28    458 - 459
      LAUNIT28    460 - 460    LADURA28    461 - 462
      LADURB28    463 - 463    LACHRC28    464 - 464
      LATIME29    465 - 466    LAUNIT29    467 - 467
      LADURA29    468 - 469    LADURB29    470 - 470
      LACHRC29    471 - 471    LATIME30    472 - 473
      LAUNIT30    474 - 474    LADURA30    475 - 476
      LADURB30    477 - 477    LACHRC30    478 - 478
      LATIME31    479 - 480    LAUNIT31    481 - 481
      LADURA31    482 - 483    LADURB31    484 - 484
      LACHRC31    485 - 485    LATIME32    486 - 487
      LAUNIT32    488 - 488    LADURA32    489 - 490
      LADURB32    491 - 491    LACHRC32    492 - 492
      LATIME33    493 - 494    LAUNIT33    495 - 495
      LADURA33    496 - 497    LADURB33    498 - 498
      LACHRC33    499 - 499    LATIME34    500 - 501
      LAUNIT34    502 - 502    LADURA34    503 - 504
      LADURB34    505 - 505    LACHRC34    506 - 506
      LATIME90    507 - 508    LAUNIT90    509 - 509
      LADURA90    510 - 511    LADURB90    512 - 512
      LACHRC90    513 - 513    LATIME91    514 - 515
      LAUNIT91    516 - 516    LADURA91    517 - 518
      LADURB91    519 - 519    LACHRC91    520 - 520
      LCONDRT     521 - 521    LACHRONR    522 - 522
      PHSTAT      523 - 523

      /* FAU LOCATIONS */

      PDMED12M    524 - 524    PNMED12M    525 - 525
      PHOSPYR2    526 - 526    HOSPNO      527 - 529
      HPNITE      530 - 532    PHCHM2W     533 - 533
      PHCHMN2W    534 - 535    PHCPH2WR    536 - 536
      PHCPHN2W    537 - 538    PHCDV2W     539 - 539
      PHCDVN2W    540 - 541    P10DVYR     542 - 542


      /* FHI LOCATIONS */

      NOTCOV      543 - 543    MEDICARE    544 - 544
      MCPART      545 - 545    MCCHOICE    546 - 546
      MCHMO       547 - 547    MCNAMEN     548 - 549
      MCREF       550 - 550    MCPAYPRE    551 - 551
      MCPARTD     552 - 552    MEDICAID    553 - 553
      MACHMD      554 - 554    MAPCMD      555 - 555
      MAREF       556 - 556    SINGLE      557 - 557
      SSTYPEA     558 - 558    SSTYPEB     559 - 559
      SSTYPEC     560 - 560    SSTYPED     561 - 561
      SSTYPEE     562 - 562    SSTYPEF     563 - 563
      SSTYPEG     564 - 564    SSTYPEH     565 - 565
      SSTYPEI     566 - 566    SSTYPEJ     567 - 567
      SSTYPEK     568 - 568    SSTYPEL     569 - 569
      PRIVATE     570 - 570    HITYPEN1    571 - 571
      WHONAM1     572 - 572    PLNWRKN1    573 - 574
      PLNPAY11    575 - 575    PLNPAY21    576 - 576
      PLNPAY31    577 - 577    PLNPAY41    578 - 578
      PLNPAY51    579 - 579    PLNPAY61    580 - 580
      PLNPAY71    581 - 581    HICOSTR1    582 - 586
      PLNMGD1     587 - 587    HDHP1       588 - 588
      HSAHRA1     589 - 589    MGCHMD1     590 - 590
      MGPRMD1     591 - 591    MGPYMD1     592 - 592
      MGPREF1     593 - 593    PRRXCOV1    594 - 594
      PRDNCOV1    595 - 595    HITYPEN2    596 - 596
      WHONAM2     597 - 597    PLNWRKN2    598 - 599
      PLNPAY12    600 - 600    PLNPAY22    601 - 601
      PLNPAY32    602 - 602    PLNPAY42    603 - 603
      PLNPAY52    604 - 604    PLNPAY62    605 - 605
      PLNPAY72    606 - 606    HICOSTR2    607 - 611
      PLNMGD2     612 - 612    HDHP2       613 - 613
      HSAHRA2     614 - 614    MGCHMD2     615 - 615
      MGPRMD2     616 - 616    MGPYMD2     617 - 617
      MGPREF2     618 - 618    PRRXCOV2    619 - 619
      PRDNCOV2    620 - 620    PRPLPLUS    621 - 621
      SCHIP       622 - 622    STDOC1      623 - 623
      STPCMD1     624 - 624    STREF1      625 - 625
      OTHPUB      626 - 626    STDOC2      627 - 627
      STPCMD2     628 - 628    STREF2      629 - 629
      OTHGOV      630 - 630    STDOC3      631 - 631
      STPCMD3     632 - 632    STREF3      633 - 633
      MILCARE     634 - 634    MILSPC1     635 - 635
      MILSPC2     636 - 636    MILSPC3     637 - 637
      MILSPC4     638 - 638    MILMAN      639 - 639
      IHS         640 - 640    HILAST      641 - 641
      HISTOP1     642 - 642    HISTOP2     643 - 643
      HISTOP3     644 - 644    HISTOP4     645 - 645
      HISTOP5     646 - 646    HISTOP6     647 - 647
      HISTOP7     648 - 648    HISTOP8     649 - 649
      HISTOP9     650 - 650    HISTOP10    651 - 651
      HISTOP11    652 - 652    HISTOP12    653 - 653
      HISTOP13    654 - 654    HISTOP14    655 - 655
      HISTOP15    656 - 656    HINOTYR     657 - 657
      HINOTMYR    658 - 659    HCSPFYR     660 - 660
      FSA         661 - 661    HIKINDNA    662 - 662
      HIKINDNB    663 - 663    HIKINDNC    664 - 664
      HIKINDND    665 - 665    HIKINDNE    666 - 666
      HIKINDNF    667 - 667    HIKINDNG    668 - 668
      HIKINDNH    669 - 669    HIKINDNI    670 - 670
      HIKINDNJ    671 - 671    HIKINDNK    672 - 672
      MCAREPRB    673 - 673    MCAIDPRB    674 - 674
      SINCOV      675 - 675

      /* FSD LOCATIONS */

      PLBORN      676 - 676    REGIONBR    677 - 678
      GEOBRTH     679 - 679    YRSINUS     680 - 680
      CITIZENP    681 - 681    HEADST      682 - 682
      HEADSTV1    683 - 683    EDUC1       684 - 685
      PMILTRY     686 - 686    DOINGLWP    687 - 687
      WHYNOWKP    688 - 689    WRKHRS2     690 - 691
      WRKFTALL    692 - 692    WRKLYR1     693 - 693
      WRKMYR      694 - 695    ERNYR_P     696 - 697
      HIEMPOF     698 - 698

      /* FIN LOCATIONS */

      FINCINT     699 - 699    PSAL        700 - 700
      PSEINC      701 - 701    PSSRR       702 - 702
      PSSRRDB     703 - 703    PSSRRD      704 - 704
      PPENS       705 - 705    POPENS      706 - 706
      PSSI        707 - 707    PSSID       708 - 708
      PTANF       709 - 709    POWBEN      710 - 710
      PINTRSTR    711 - 711    PDIVD       712 - 712
      PCHLDSP     713 - 713    PINCOT      714 - 714
      PSSAPL      715 - 715    PSDAPL      716 - 716
      TANFMYR     717 - 718    PFSTP       719 - 719
      FSTPMYR     720 - 721    ELIGPWIC    722 - 722
      PWIC        723 - 723    WIC_FLAG    724 - 724
;

   * DEFINE VARIABLE LABELS;

   LABEL

      /* IDN LABELS */

      RECTYPE    ="File type identifier"
      SRVY_YR    ="Year of National Health Interview Survey"
      HHX        ="Household Serial Number"
      INTV_QRT   ="Interview Quarter"
      ASSIGNWK   ="Assignment Week"
      FMX        ="Family #"
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
      QCADULT    ="Quality control flag for sample adult"
      QCCHILD    ="Quality control flag for sample child"

      /* FHS LABELS */

      PLAPLYLM   ="Is - - limited in kind/amount play?"
      PLAPLYUN   ="Is - - able to play at all?"
      PSPEDEIS   ="Does - - receive Special Education or EIS"
      PSPEDEM    =
"Receive Special Education/EIS due to emotional/behavioral problem"
      PLAADL     ="Does - - need help with personal care?"
      LABATH     ="Does - -  need help with bathing/showering?"
      LADRESS    ="Does - -  need help dressing?"
      LAEAT      ="Does - -  need help eating?"
      LABED      ="Does - -  need help in/out of bed or chairs?"
      LATOILT    ="Does - -  need help using the toilet?"
      LAHOME     ="Does - -  need help to get around in the home?"
      PLAIADL    ="Does - - need help with routine needs?"
      PLAWKNOW   ="Is - - unable to work NOW due to health problem?"
      PLAWKLIM   ="Is - - limited in kind/amount of work?"
      PLAWALK    ="Does - - have difficulty walking without equipment?"
      PLAREMEM   ="Is - - limited by difficulty remembering?"
      PLIMANY    ="Is - - limited in any (other) way?"
      LA1AR      ="Any limitation - all persons, all conditions"
      LAHCC1     ="Vision problem causes limitation"
      LAHCC2     ="Hearing problem causes limitation"
      LAHCC3     ="Speech problem causes limitation"
      LAHCC4     ="Asthma/breathing problem causes limitation"
      LAHCC5     ="Birth defect causes limitation"
      LAHCC6     ="Injury causes limitation"
      LAHCC7     ="Mental retardation causes limitation"
      LAHCC8     ="Other developmental problem causes limitation"
      LAHCC9     ="Other mental/emotional/behavioral problem causes limitation"
      LAHCC10    ="Bone/joint/muscle problem causes limitation"
      LAHCC11    ="Epilepsy/seizures causes limitation"
      LAHCC12    ="Learning disability causes  limitation"
      LAHCC13    ="ADD/ADHD causes limitation"
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
      LCTIME9    =
"Duration of other mental/emotional/behavioral  problem: Number of units"
      LCUNIT9    =
"Duration of other mental/emotional/behavioral  problem: Number of units"
      LCDURA9    =
"Duration of other mental/emotional/behavioral  problem (in years)"
      LCDURB9    =
"Duration of other mental/emotional/behavioral problem recode 2"
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
      LAHCA4     ="Back/neck problem causes limitation"
      LAHCA5     ="Fracture/bone/joint injury causes limitation"
      LAHCA6     ="Other injury causes limitation"
      LAHCA7     ="Heart problem causes limitation"
      LAHCA8     ="Stroke causes limitation"
      LAHCA9     ="Hypertension causes limitation"
      LAHCA10    ="Diabetes causes limitation"
      LAHCA11    ="Lung/breathing problem causes limitation"
      LAHCA12    ="Cancer causes limitation"
      LAHCA13    ="Birth defect causes limitation"
      LAHCA14    ="Mental retardation causes limitation"
      LAHCA15    ="Other developmental problem causes limitation"
      LAHCA16    ="Senility causes limitation"
      LAHCA17    ="Depression/anxiety/emotional problem causes limitation"
      LAHCA18    ="Weight problem causes limitation"
      LAHCA19_   ="Missing or amputated limb/finger/digit causes limitation"
      LAHCA20_   ="Musculoskeletal/connective tissue problem causes limitation"
      LAHCA21_   ="Circulation problem causes limitation"
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
      LAHCA90    ="Other impairment/problem(1) causes limitation"
      LAHCA91    ="Other impairment/problem(2) causes limitation"
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
      LAUNIT11   ="Duration of lung/breathing problem: Time unit"
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
      LATIME14   ="Duration of mental retardation: Number of units"
      LAUNIT14   ="Duration of mental retardation: Time unit"
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
      LATIME21   ="Duration of circulation problem: Number of units"
      LAUNIT21   ="Duration of circulation problem: Time unit"
      LADURA21   ="Duration of circulation problem (in years)"
      LADURB21   ="Duration of circulation problem recode 2"
      LACHRC21   ="Circulation problem condition status"
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
      LADURA24   ="Duration of digestive problems (in years)"
      LADURB24   ="Duration of digestive problem recode 2"
      LACHRC24   ="Digestive problem condition status"
      LATIME25   ="Duration of genitourinary problem: Number of units"
      LAUNIT25   ="Duration of genitourinary problem: Time unit"
      LADURA25   ="Duration of genitourinary problem (in years)"
      LADURB25   ="Duration of genitourinary problem recode 2"
      LACHRC25   ="Genitourinary problem condition status"
      LATIME26   ="Duration of skin problems: Number of units"
      LAUNIT26   ="Duration of skin problems: Time unit"
      LADURA26   ="Duration of skin problems (in years)"
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
      LCONDRT    =
"Chronic condition recode for person with limitation of activity"
      LACHRONR   ="Limitation of activity recode by chronic condition status"
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
      HITYPEN1   ="Name of plan (Plan 1)"
      WHONAM1    ="Plan in whose name (Plan 1)"
      PLNWRKN1   ="How plan was originally obtained (plan 1)"
      PLNPAY11   ="Paid for by self or family (Plan 1)"
      PLNPAY21   ="Paid for by employer or union (Plan 1)"
      PLNPAY31   ="Paid for by someone outside the household (Plan 1)"
      PLNPAY41   ="Paid for by Medicare (Plan 1)"
      PLNPAY51   ="Paid for by Medicaid (Plan 1)"
      PLNPAY61   ="Paid for by CHIP (Plan 1)"
      PLNPAY71   ="Paid for by government program (Plan 1)"
      HICOSTR1   ="Out-of-pocket premium cost (Plan 1)"
      PLNMGD1    ="Type of private plan (Plan 1)"
      HDHP1      ="High deductible health plan (plan 1)"
      HSAHRA1    =
"Health Savings Accounts/Health Reimbursement Accounts (plan 1)"
      MGCHMD1    ="Doctor choice (Plan 1)"
      MGPRMD1    ="Preferred list (Plan 1)"
      MGPYMD1    ="Out of plan use (Plan 1)"
      MGPREF1    ="Private referral (Plan 1)"
      PRRXCOV1   ="Prescription drug benefit (Plan 1)"
      PRDNCOV1   ="Dental Coverage (Plan 1)"
      HITYPEN2   ="Name of plan (Plan 2)"
      WHONAM2    ="Plan in whose name (Plan 2)"
      PLNWRKN2   ="How plan was originally obtained (Plan 2)"
      PLNPAY12   ="Paid for by self or family (Plan 2)"
      PLNPAY22   ="Paid for by employer or union (Plan 2)"
      PLNPAY32   ="Paid for by someone outside the household (Plan 2)"
      PLNPAY42   ="Paid for by Medicare (Plan 2)"
      PLNPAY52   ="Paid for by Medicaid (Plan 2)"
      PLNPAY62   ="Paid for by CHIP (Plan 2)"
      PLNPAY72   ="Paid for by government program (Plan 2)"
      HICOSTR2   ="Out-of-pocket premium cost (Plan 2)"
      PLNMGD2    ="Type of private plan (plan 2)"
      HDHP2      ="High deductible health plan (plan 2)"
      HSAHRA2    =
"Health Savings Accounts/Health Reimbursement Accounts (plan 2)"
      MGCHMD2    ="Doctor choice (Plan 2)"
      MGPRMD2    ="Preferred list (Plan 2)"
      MGPYMD2    ="Out of plan use (Plan 2)"
      MGPREF2    ="Private referral (Plan 2)"
      PRRXCOV2   ="Prescription drug benefit (Plan 2)"
      PRDNCOV2   ="Dental Coverage (Plan 2)"
      PRPLPLUS   ="Person has more than two private plans"
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
      HCSPFYR    ="Amount family spent for medical care"
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

      FINCINT    ="Introduction to the family income section"
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
      ASTATFLG  PEP049X.   CSTATFLG  PEP050X.   QCADULT   PEP051X.
      QCCHILD   PEP052X.

      /* FHS FORMAT ASSOCIATIONS */

      PLAPLYLM  PEP037X.   PLAPLYUN  PEP037X.   PSPEDEIS  PEP037X.
      PSPEDEM   PEP037X.   PLAADL    PEP037X.   LABATH    PEP037X.
      LADRESS   PEP037X.   LAEAT     PEP037X.   LABED     PEP037X.
      LATOILT   PEP037X.   LAHOME    PEP037X.   PLAIADL   PEP037X.
      PLAWKNOW  PEP037X.   PLAWKLIM  PEP066X.   PLAWALK   PEP037X.
      PLAREMEM  PEP037X.   PLIMANY   PEP069X.   LA1AR     PEP070X.
      LAHCC1    PEP071X.   LAHCC2    PEP071X.   LAHCC3    PEP071X.
      LAHCC4    PEP071X.   LAHCC5    PEP071X.   LAHCC6    PEP071X.
      LAHCC7    PEP071X.   LAHCC8    PEP071X.   LAHCC9    PEP071X.
      LAHCC10   PEP071X.   LAHCC11   PEP071X.   LAHCC12   PEP071X.
      LAHCC13   PEP071X.   LAHCC90   PEP071X.   LAHCC91   PEP071X.
      LCTIME1   PEP086X.   LCUNIT1   PEP087X.   LCDURA1   PEP088X.
      LCDURB1   PEP089X.   LCCHRC1   PEP090X.   LCTIME2   PEP086X.
      LCUNIT2   PEP087X.   LCDURA2   PEP088X.   LCDURB2   PEP089X.
      LCCHRC2   PEP090X.   LCTIME3   PEP086X.   LCUNIT3   PEP087X.
      LCDURA3   PEP088X.   LCDURB3   PEP089X.   LCCHRC3   PEP090X.
      LCTIME4   PEP086X.   LCUNIT4   PEP087X.   LCDURA4   PEP088X.
      LCDURB4   PEP089X.   LCCHRC4   PEP090X.   LCTIME5   PEP086X.
      LCUNIT5   PEP087X.   LCDURA5   PEP088X.   LCDURB5   PEP089X.
      LCCHRC5   PEP090X.   LCTIME6   PEP086X.   LCUNIT6   PEP087X.
      LCDURA6   PEP088X.   LCDURB6   PEP089X.   LCCHRC6   PEP090X.
      LCTIME7   PEP086X.   LCUNIT7   PEP087X.   LCDURA7   PEP088X.
      LCDURB7   PEP089X.   LCCHRC7   PEP090X.   LCTIME8   PEP086X.
      LCUNIT8   PEP087X.   LCDURA8   PEP088X.   LCDURB8   PEP089X.
      LCCHRC8   PEP090X.   LCTIME9   PEP086X.   LCUNIT9   PEP087X.
      LCDURA9   PEP088X.   LCDURB9   PEP089X.   LCCHRC9   PEP090X.
      LCTIME10  PEP086X.   LCUNIT10  PEP087X.   LCDURA10  PEP088X.
      LCDURB10  PEP089X.   LCCHRC10  PEP090X.   LCTIME11  PEP086X.
      LCUNIT11  PEP087X.   LCDURA11  PEP088X.   LCDURB11  PEP089X.
      LCCHRC11  PEP090X.   LCTIME12  PEP086X.   LCUNIT12  PEP087X.
      LCDURA12  PEP088X.   LCDURB12  PEP089X.   LCCHRC12  PEP090X.
      LCTIME13  PEP086X.   LCUNIT13  PEP087X.   LCDURA13  PEP088X.
      LCDURB13  PEP089X.   LCCHRC13  PEP090X.   LCTIME90  PEP086X.
      LCUNIT90  PEP087X.   LCDURA90  PEP088X.   LCDURB90  PEP089X.
      LCCHRC90  PEP090X.   LCTIME91  PEP086X.   LCUNIT91  PEP087X.
      LCDURA91  PEP088X.   LCDURB91  PEP089X.   LCCHRC91  PEP090X.
      LAHCA1    PEP071X.   LAHCA2    PEP071X.   LAHCA3    PEP071X.
      LAHCA4    PEP071X.   LAHCA5    PEP071X.   LAHCA6    PEP071X.
      LAHCA7    PEP071X.   LAHCA8    PEP071X.   LAHCA9    PEP071X.
      LAHCA10   PEP071X.   LAHCA11   PEP071X.   LAHCA12   PEP071X.
      LAHCA13   PEP071X.   LAHCA14   PEP071X.   LAHCA15   PEP071X.
      LAHCA16   PEP071X.   LAHCA17   PEP071X.   LAHCA18   PEP071X.
      LAHCA19_  PEP071X.   LAHCA20_  PEP071X.   LAHCA21_  PEP071X.
      LAHCA22_  PEP071X.   LAHCA23_  PEP071X.   LAHCA24_  PEP071X.
      LAHCA25_  PEP071X.   LAHCA26_  PEP071X.   LAHCA27_  PEP071X.
      LAHCA28_  PEP071X.   LAHCA29_  PEP071X.   LAHCA30_  PEP071X.
      LAHCA31_  PEP071X.   LAHCA32_  PEP071X.   LAHCA33_  PEP071X.
      LAHCA34_  PEP071X.   LAHCA90   PEP071X.   LAHCA91   PEP071X.
      LATIME1   PEP086X.   LAUNIT1   PEP087X.   LADURA1   PEP199X.
      LADURB1   PEP200X.   LACHRC1   PEP090X.   LATIME2   PEP086X.
      LAUNIT2   PEP087X.   LADURA2   PEP199X.   LADURB2   PEP200X.
      LACHRC2   PEP090X.   LATIME3   PEP086X.   LAUNIT3   PEP087X.
      LADURA3   PEP199X.   LADURB3   PEP200X.   LACHRC3   PEP090X.
      LATIME4   PEP086X.   LAUNIT4   PEP087X.   LADURA4   PEP199X.
      LADURB4   PEP200X.   LACHRC4   PEP090X.   LATIME5   PEP086X.
      LAUNIT5   PEP087X.   LADURA5   PEP199X.   LADURB5   PEP200X.
      LACHRC5   PEP090X.   LATIME6   PEP086X.   LAUNIT6   PEP087X.
      LADURA6   PEP199X.   LADURB6   PEP200X.   LACHRC6   PEP090X.
      LATIME7   PEP086X.   LAUNIT7   PEP087X.   LADURA7   PEP199X.
      LADURB7   PEP200X.   LACHRC7   PEP090X.   LATIME8   PEP086X.
      LAUNIT8   PEP087X.   LADURA8   PEP199X.   LADURB8   PEP200X.
      LACHRC8   PEP090X.   LATIME9   PEP086X.   LAUNIT9   PEP087X.
      LADURA9   PEP199X.   LADURB9   PEP200X.   LACHRC9   PEP090X.
      LATIME10  PEP086X.   LAUNIT10  PEP087X.   LADURA10  PEP199X.
      LADURB10  PEP200X.   LACHRC10  PEP090X.   LATIME11  PEP086X.
      LAUNIT11  PEP087X.   LADURA11  PEP199X.   LADURB11  PEP200X.
      LACHRC11  PEP090X.   LATIME12  PEP086X.   LAUNIT12  PEP087X.
      LADURA12  PEP199X.   LADURB12  PEP200X.   LACHRC12  PEP090X.
      LATIME13  PEP086X.   LAUNIT13  PEP087X.   LADURA13  PEP199X.
      LADURB13  PEP200X.   LACHRC13  PEP090X.   LATIME14  PEP086X.
      LAUNIT14  PEP087X.   LADURA14  PEP199X.   LADURB14  PEP200X.
      LACHRC14  PEP090X.   LATIME15  PEP086X.   LAUNIT15  PEP087X.
      LADURA15  PEP199X.   LADURB15  PEP200X.   LACHRC15  PEP090X.
      LATIME16  PEP086X.   LAUNIT16  PEP087X.   LADURA16  PEP199X.
      LADURB16  PEP200X.   LACHRC16  PEP090X.   LATIME17  PEP086X.
      LAUNIT17  PEP087X.   LADURA17  PEP199X.   LADURB17  PEP200X.
      LACHRC17  PEP090X.   LATIME18  PEP086X.   LAUNIT18  PEP087X.
      LADURA18  PEP199X.   LADURB18  PEP200X.   LACHRC18  PEP090X.
      LATIME19  PEP086X.   LAUNIT19  PEP087X.   LADURA19  PEP199X.
      LADURB19  PEP200X.   LACHRC19  PEP090X.   LATIME20  PEP086X.
      LAUNIT20  PEP087X.   LADURA20  PEP199X.   LADURB20  PEP200X.
      LACHRC20  PEP090X.   LATIME21  PEP086X.   LAUNIT21  PEP087X.
      LADURA21  PEP199X.   LADURB21  PEP200X.   LACHRC21  PEP090X.
      LATIME22  PEP086X.   LAUNIT22  PEP087X.   LADURA22  PEP199X.
      LADURB22  PEP200X.   LACHRC22  PEP090X.   LATIME23  PEP086X.
      LAUNIT23  PEP087X.   LADURA23  PEP199X.   LADURB23  PEP200X.
      LACHRC23  PEP090X.   LATIME24  PEP086X.   LAUNIT24  PEP087X.
      LADURA24  PEP199X.   LADURB24  PEP200X.   LACHRC24  PEP090X.
      LATIME25  PEP086X.   LAUNIT25  PEP087X.   LADURA25  PEP199X.
      LADURB25  PEP200X.   LACHRC25  PEP090X.   LATIME26  PEP086X.
      LAUNIT26  PEP087X.   LADURA26  PEP199X.   LADURB26  PEP200X.
      LACHRC26  PEP090X.   LATIME27  PEP086X.   LAUNIT27  PEP087X.
      LADURA27  PEP199X.   LADURB27  PEP200X.   LACHRC27  PEP090X.
      LATIME28  PEP086X.   LAUNIT28  PEP087X.   LADURA28  PEP199X.
      LADURB28  PEP200X.   LACHRC28  PEP090X.   LATIME29  PEP086X.
      LAUNIT29  PEP087X.   LADURA29  PEP199X.   LADURB29  PEP200X.
      LACHRC29  PEP090X.   LATIME30  PEP086X.   LAUNIT30  PEP087X.
      LADURA30  PEP199X.   LADURB30  PEP200X.   LACHRC30  PEP090X.
      LATIME31  PEP086X.   LAUNIT31  PEP087X.   LADURA31  PEP199X.
      LADURB31  PEP200X.   LACHRC31  PEP090X.   LATIME32  PEP086X.
      LAUNIT32  PEP087X.   LADURA32  PEP199X.   LADURB32  PEP200X.
      LACHRC32  PEP090X.   LATIME33  PEP086X.   LAUNIT33  PEP087X.
      LADURA33  PEP199X.   LADURB33  PEP200X.   LACHRC33  PEP090X.
      LATIME34  PEP086X.   LAUNIT34  PEP087X.   LADURA34  PEP199X.
      LADURB34  PEP200X.   LACHRC34  PEP090X.   LATIME90  PEP086X.
      LAUNIT90  PEP087X.   LADURA90  PEP199X.   LADURB90  PEP200X.
      LACHRC90  PEP090X.   LATIME91  PEP086X.   LAUNIT91  PEP087X.
      LADURA91  PEP199X.   LADURB91  PEP200X.   LACHRC91  PEP090X.
      LCONDRT   PEP377X.   LACHRONR  PEP378X.   PHSTAT    PEP379X.

      /* FAU FORMAT ASSOCIATIONS */

      PDMED12M  PEP037X.   PNMED12M  PEP037X.   PHOSPYR2  PEP037X.
      HOSPNO    PEP383X.   HPNITE    PEP383X.   PHCHM2W   PEP037X.
      PHCHMN2W  PEP386X.   PHCPH2WR  PEP037X.   PHCPHN2W  PEP386X.
      PHCDV2W   PEP037X.   PHCDVN2W  PEP386X.   P10DVYR   PEP037X.

      /* FHI FORMAT ASSOCIATIONS */

      NOTCOV    PEP392X.   MEDICARE  PEP393X.   MCPART    PEP394X.
      MCCHOICE  PEP037X.   MCHMO     PEP037X.   MCNAMEN   PEP397X.
      MCREF     PEP037X.   MCPAYPRE  PEP037X.   MCPARTD   PEP037X.
      MEDICAID  PEP393X.   MACHMD    PEP402X.   MAPCMD    PEP037X.
      MAREF     PEP037X.   SINGLE    PEP405X.   SSTYPEA   PEP071X.
      SSTYPEB   PEP071X.   SSTYPEC   PEP071X.   SSTYPED   PEP071X.
      SSTYPEE   PEP071X.   SSTYPEF   PEP071X.   SSTYPEG   PEP071X.
      SSTYPEH   PEP071X.   SSTYPEI   PEP071X.   SSTYPEJ   PEP071X.
      SSTYPEK   PEP071X.   SSTYPEL   PEP071X.   PRIVATE   PEP393X.
      HITYPEN1  PEP419X.   WHONAM1   PEP420X.   PLNWRKN1  PEP421X.
      PLNPAY11  PEP071X.   PLNPAY21  PEP071X.   PLNPAY31  PEP071X.
      PLNPAY41  PEP071X.   PLNPAY51  PEP071X.   PLNPAY61  PEP071X.
      PLNPAY71  PEP071X.   HICOSTR1  PEP429X.   PLNMGD1   PEP430X.
      HDHP1     PEP431X.   HSAHRA1   PEP037X.   MGCHMD1   PEP433X.
      MGPRMD1   PEP037X.   MGPYMD1   PEP037X.   MGPREF1   PEP037X.
      PRRXCOV1  PEP037X.   PRDNCOV1  PEP037X.   HITYPEN2  PEP419X.
      WHONAM2   PEP420X.   PLNWRKN2  PEP421X.   PLNPAY12  PEP071X.
      PLNPAY22  PEP071X.   PLNPAY32  PEP071X.   PLNPAY42  PEP071X.
      PLNPAY52  PEP071X.   PLNPAY62  PEP071X.   PLNPAY72  PEP071X.
      HICOSTR2  PEP429X.   PLNMGD2   PEP430X.   HDHP2     PEP431X.
      HSAHRA2   PEP037X.   MGCHMD2   PEP433X.   MGPRMD2   PEP037X.
      MGPYMD2   PEP037X.   MGPREF2   PEP037X.   PRRXCOV2  PEP037X.
      PRDNCOV2  PEP037X.   PRPLPLUS  PEP037X.   SCHIP     PEP393X.
      STDOC1    PEP402X.   STPCMD1   PEP037X.   STREF1    PEP037X.
      OTHPUB    PEP393X.   STDOC2    PEP402X.   STPCMD2   PEP037X.
      STREF2    PEP037X.   OTHGOV    PEP468X.   STDOC3    PEP402X.
      STPCMD3   PEP037X.   STREF3    PEP037X.   MILCARE   PEP393X.
      MILSPC1   PEP071X.   MILSPC2   PEP071X.   MILSPC3   PEP071X.
      MILSPC4   PEP071X.   MILMAN    PEP477X.   IHS       PEP037X.
      HILAST    PEP479X.   HISTOP1   PEP071X.   HISTOP2   PEP071X.
      HISTOP3   PEP071X.   HISTOP4   PEP071X.   HISTOP5   PEP071X.
      HISTOP6   PEP071X.   HISTOP7   PEP071X.   HISTOP8   PEP071X.
      HISTOP9   PEP071X.   HISTOP10  PEP071X.   HISTOP11  PEP071X.
      HISTOP12  PEP071X.   HISTOP13  PEP071X.   HISTOP14  PEP071X.
      HISTOP15  PEP071X.   HINOTYR   PEP037X.   HINOTMYR  PEP386X.
      HCSPFYR   PEP497X.   FSA       PEP037X.   HIKINDNA  PEP071X.
      HIKINDNB  PEP071X.   HIKINDNC  PEP071X.   HIKINDND  PEP071X.
      HIKINDNE  PEP071X.   HIKINDNF  PEP071X.   HIKINDNG  PEP071X.
      HIKINDNH  PEP071X.   HIKINDNI  PEP071X.   HIKINDNJ  PEP071X.
      HIKINDNK  PEP071X.   MCAREPRB  PEP037X.   MCAIDPRB  PEP037X.
      SINCOV    PEP037X.

      /* FSD FORMAT ASSOCIATIONS */

      PLBORN    PEP037X.   REGIONBR  PEP514X.   GEOBRTH   PEP515X.
      YRSINUS   PEP516X.   CITIZENP  PEP517X.   HEADST    PEP037X.
      HEADSTV1  PEP037X.   EDUC1     PEP520X.   PMILTRY   PEP037X.
      DOINGLWP  PEP522X.   WHYNOWKP  PEP523X.   WRKHRS2   PEP524X.
      WRKFTALL  PEP037X.   WRKLYR1   PEP037X.   WRKMYR    PEP527X.
      ERNYR_P   PEP528X.   HIEMPOF   PEP037X.

      /* FIN FORMAT ASSOCIATIONS */

      FINCINT   PEP530X.   PSAL      PEP037X.   PSEINC    PEP037X.
      PSSRR     PEP037X.   PSSRRDB   PEP037X.   PSSRRD    PEP037X.
      PPENS     PEP037X.   POPENS    PEP037X.   PSSI      PEP037X.
      PSSID     PEP037X.   PTANF     PEP037X.   POWBEN    PEP037X.
      PINTRSTR  PEP037X.   PDIVD     PEP037X.   PCHLDSP   PEP037X.
      PINCOT    PEP037X.   PSSAPL    PEP037X.   PSDAPL    PEP037X.
      TANFMYR   PEP386X.   PFSTP     PEP037X.   FSTPMYR   PEP386X.
      ELIGPWIC  PEP551X.   PWIC      PEP037X.   WIC_FLAG  PEP553X.;
RUN;

PROC CONTENTS DATA=NHIS.PERSONSX;
   TITLE1 'CONTENTS OF THE 2009 NHIS Person FILE';

PROC FREQ DATA=NHIS.PERSONSX NOTITLE;
   TABLES RECTYPE/LIST MISSING;
   TITLE1 'FREQUENCY REPORT FOR 2009 NHIS Person FILE';
   TITLE2 '(WEIGHTED)';
   WEIGHT WTFA;

PROC FREQ DATA=NHIS.PERSONSX NOTITLE;
   TABLES RECTYPE/LIST MISSING;
   TITLE1 'FREQUENCY REPORT FOR 2009 NHIS Person FILE';
   TITLE2 '(UNWEIGHTED)';

* USER NOTE: TO SEE UNFORMATTED VALUES IN PROCEDURES, ADD THE
             STATEMENT: FORMAT _ALL_;
RUN;
