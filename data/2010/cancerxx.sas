*********************************************************************
 MAY 11, 2011 11:51 AM
 
 This is an example of a SAS program that creates a SAS
 file from the 2010 NHIS Public Use CANCERXX.DAT ASCII file
 
 This is stored in CANCERXX.SAS
*********************************************************************;

* USER NOTE: PLACE NEXT STATEMENT IN SUBSEQUENT PROGRAMS;
LIBNAME  NHIS     "C:\NHIS2010";

* USER NOTE: PLACE NEXT STATEMENT IN SUBSEQUENT PROGRAMS
             IF YOU ALLOW PROGRAM TO PERMANENTLY STORE FORMATS;
LIBNAME  LIBRARY  "C:\NHIS2010";

FILENAME ASCIIDAT 'C:\NHIS2010\CANCERXX.dat';

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
   VALUE CAP001X
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
   VALUE CAP002X
      .                   = '.'
      OTHER              = "Survey Year"
   ;
   VALUE CAP004X
      1                  = "1 Quarter 1"
      2                  = "2 Quarter 2"
      3                  = "3 Quarter 3"
      4                  = "4 Quarter 4"
   ;
   VALUE CAP005X
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
   VALUE CAP010X
      1                  = "1 Northeast"
      2                  = "2 Midwest"
      3                  = "3 South"
      4                  = "4 West"
   ;
   VALUE CAP013X
      1                  = "1 Male"
      2                  = "2 Female"
   ;
   VALUE CAP014X
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
   VALUE CAP015X
      01                 = "01 White only"
      02                 = "02 Black/African American only"
      03                 = "03 AIAN only"
      04                 = "04 Asian only"
      05                 = "05 Race group not releasable (See file layout)"
      06                 = "06 Multiple race"
   ;
   VALUE CAP016X
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
   VALUE CAP017X
      01                 = "01 White"
      02                 = "02 Black/African American"
      03                 = "03 Indian (American) (includes Eskimo, Aleut)"
      06                 = "06 Chinese"
      07                 = "07 Filipino"
      12                 = "12 Asian Indian"
      16                 = "16 Other race (See file layout)"
      17                 = "17 Multiple race, no primary race selected"
   ;
   VALUE CAP018X
      00                 = "00 Under 1 year"
      85                 = "85 85+ years"
   ;
   VALUE CAP019X
      1                  = "1 Not ascertained answers only"
      2                  = "2 Refused and don't know answers only"
      3                  = "3 Refused, DK, and not ascertained answers only"
      4                  = "4 At least one valid answer"
   ;
   VALUE CAP020X
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
   VALUE CAP021X
      1                  = "1 Only Spanish"
      2                  = "2 Mostly Spanish"
      3                  = "3 Spanish and English about the same"
      4                  = "4 Mostly English"
      5                  = "5 Only English"
      6                  = "6 Other"
      7                  = "7 Refused"
      8                  = "8 Not ascertained"
      9                  = "9 Don't know"
   ;
   VALUE CAP022X
      000                = "000 Never"
      997                = "997 Refused"
      998                = "998 Not ascertained"
      999                = "999 Don't know"
   ;
   VALUE CAP023X
      0                  = "0 Never"
      1                  = "1 Per day"
      2                  = "2 Per week"
      3                  = "3 Per month"
      7                  = "7 Refused"
      8                  = "8 Not ascertained"
      9                  = "9 Don't know"
   ;
   VALUE $CAP024X
      "97"               = "97 Refused"
      "98"               = "98 Not ascertained"
      "99"               = "99 Don't know"
      OTHER              = "Verbatim response"
      ' '                 = ' '
      "ZZ"               = "ZZ Other specify"
   ;
   VALUE CAP025X
      997                = "997 Refused"
      998                = "998 Not ascertained"
      999                = "999 Don't know"
   ;
   VALUE $CAP026X
      OTHER              = "Verbatim response"
      ' '                 = ' '
   ;
   VALUE CAP027X
      1                  = "1 Yes"
      2                  = "2 No"
      7                  = "7 Refused"
      8                  = "8 Not ascertained"
      9                  = "9 Don't know"
   ;
   VALUE CAP033X
      1                  = "1 Whole or regular milk"
      2                  = "2 2% fat or reduced-fat milk"
      3                  = 
'3 1% fat or low-fat milk (includes 0.5% fat milk or "low-fat" milk no further s
pecified)'
      4                  = "4 Fat-free, skim or nonfat milk"
      5                  = "5 Other"
      7                  = "7 Refused"
      8                  = "8 Not ascertained"
      9                  = "9 Don't know"
   ;
   VALUE CAP066X
      1                  = "1 Almost never or never"
      2                  = "2 About 1/4 of the time"
      3                  = "3 About 1/2 of the time"
      4                  = "4 About 3/4 of the time"
      5                  = "5 Almost always or always"
      7                  = "7 Refused"
      8                  = "8 Not ascertained"
      9                  = "9 Don't know"
   ;
   VALUE CAP085X
      97                 = "97 Refused"
      98                 = "98 Not ascertained"
      99                 = "99 Don't know"
   ;
   VALUE CAP090X
      1                  = "1 For OVERALL health"
      2                  = "2 For BONE health"
      3                  = "3 To prevent CANCER"
      4                  = "4 For some other reason"
      7                  = "7 Refused"
      8                  = "8 Not ascertained"
      9                  = "9 Don't know"
   ;
   VALUE $CAP091X
      "97"               = "97 Refused"
      "98"               = "98 Not ascertained"
      "99"               = "99 Don't know"
      OTHER              = "Verbatim response"
      ' '                 = ' '
   ;
   VALUE CAP092X
      1                  = "1 Yes"
      2                  = "2 No"
      3                  = "3 Unable to walk"
      7                  = "7 Refused"
      8                  = "8 Not ascertained"
      9                  = "9 Don't know"
   ;
   VALUE CAP095X
      1                  = "1 Minutes"
      2                  = "2 Hours"
      7                  = "7 Refused"
      8                  = "8 Not ascertained"
      9                  = "9 Don't know"
   ;
   VALUE CAP100X
      00                 = "00 None"
      97                 = "97 Refused"
      98                 = "98 Not ascertained"
      99                 = "99 Don't know"
   ;
   VALUE CAP102X
      1                  = "1 Yes"
      2                  = "2 No"
      3                  = "3 Did not see a doctor in the PAST 12 MONTHS"
      7                  = "7 Refused"
      8                  = "8 Not ascertained"
      9                  = "9 Don't know"
   ;
   VALUE CAP103X
      1                  = "1 Menthol"
      2                  = "2 Non menthol"
      3                  = "3 No usual type"
      7                  = "7 Refused"
      8                  = "8 Not ascertained"
      9                  = "9 Don't know"
   ;
   VALUE CAP104X
      95                 = "95 Varied"
      96                 = "96 Never smoked regularly"
      97                 = "97 Refused"
      98                 = "98 Not ascertained"
      99                 = "99 Don't know"
   ;
   VALUE CAP105X
      95                 = "95 95 or more cigarettes"
      97                 = "97 Refused"
      98                 = "98 Not ascertained"
      99                 = "99 Don't know"
   ;
   VALUE CAP127X
      1                  = "1 Every day"
      2                  = "2 Some days"
      3                  = "3 Not at all"
      7                  = "7 Refused"
      8                  = "8 Not ascertained"
      9                  = "9 Don't know"
   ;
   VALUE CAP137X
      01                 = "01 Beech-Nut"
      02                 = "02 Camel Snus"
      03                 = "03 Cope"
      04                 = "04 Copenhagen"
      05                 = "05 Cougar"
      06                 = "06 Grizzly"
      07                 = "07 Hawken"
      08                 = "08 Husky"
      09                 = "09 Kayak"
      10                 = "10 Kodiak"
      11                 = "11 Levi Garrett"
      12                 = "12 Longhorn"
      13                 = "13 Marlboro Snus"
      14                 = "14 Red Man"
      15                 = "15 Red Seal"
      16                 = "16 Rooster"
      17                 = "17 Silver Creek"
      18                 = "18 Skoal"
      19                 = "19 Taylor's Pride"
      20                 = "20 Timber Wolfe"
      21                 = "21 Brand not on list (specify)"
      97                 = "97 Refused"
      98                 = "98 Not ascertained"
      99                 = "99 Don't know"
   ;
   VALUE CAP140X
      1                  = "1 Mentioned"
      2                  = "2 Not mentioned"
      7                  = "7 Refused"
      8                  = "8 Not ascertained"
      9                  = "9 Don't know"
   ;
   VALUE CAP147X
      00                 = "00 None"
      96                 = "96 96+"
      97                 = "97 Refused"
      98                 = "98 Not ascertained"
      99                 = "99 Don't know"
   ;
   VALUE CAP148X
      00                 = "00 Less than one day per week/rarely/none"
      97                 = "97 Refused"
      98                 = "98 Not ascertained"
      99                 = "99 Don't know"
   ;
   VALUE CAP153X
      01                 = "01 First"
      02                 = "02 Second"
      03                 = "03 Third"
      04                 = "04 Fourth"
      05                 = "05 Fifth"
      06                 = "06 Sixth"
      07                 = "07 Seventh"
      08                 = "08 Eighth"
      09                 = "09 Ninth"
      97                 = "97 Refused"
      98                 = "98 Not ascertained"
      99                 = "99 Don't know"
   ;
   VALUE CAP154X
      1                  = "1 Stayed off rest of pregnancy"
      2                  = "2 Started again"
      3                  = "3 Never started again"
      7                  = "7 Refused"
      8                  = "8 Not ascertained"
      9                  = "9 Don't know"
   ;
   VALUE CAP155X
      01                 = "01 Get a severe sunburn with blisters"
      02                 = "02 Have a moderate sunburn with peeling"
      03                 = "03 Burn mildly with some or no darkening/tanning"
      04                 = "04 Turn darker without sunburn"
      05                 = "05 Nothing would happen to my skin"
      06                 = "06 Do not go out in the sun"
      07                 = "07 Other"
      97                 = "97 Refused"
      98                 = "98 Not ascertained"
      99                 = "99 Don't know"
   ;
   VALUE CAP156X
      01                 = "01 Very dark or deeply tanned"
      02                 = "02 Dark/Moderately tanned"
      03                 = "03 A little dark/mildly tanned"
      04                 = "04 Freckled but still light skinned"
      05                 = 
"05 Burned repeatedly with little or no darkening or tanning---still light skinn
ed"
      06                 = "06 Don't go out in the sun"
      07                 = "07 Other"
      97                 = "97 Refused"
      98                 = "98 Not ascertained"
      99                 = "99 Don't know"
   ;
   VALUE CAP157X
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
   VALUE CAP163X
      50                 = "50 50+"
      96                 = "96 More than one, different ones, other"
      97                 = "97 Refused"
      98                 = "98 Not ascertained"
      99                 = "99 Don't know"
   ;
   VALUE CAP164X
      1                  = "1 1-14"
      2                  = "2 15+"
      7                  = "7 Refused"
      8                  = "8 Not ascertained"
      9                  = "9 Don't know"
   ;
   VALUE CAP165X
      000                = "000 None"
      997                = "997 Refused"
      998                = "998 Not ascertained"
      999                = "999 Don't know"
   ;
   VALUE CAP169X
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
   VALUE CAP170X
      9996               = "9996 Time period format"
      9997               = "9997 Refused"
      9998               = "9998 Not ascertained"
      9999               = "9999 Don't know"
   ;
   VALUE CAP171X
      95                 = "95 95+"
      97                 = "97 Refused"
      98                 = "98 Not ascertained"
      99                 = "99 Don't know"
   ;
   VALUE CAP172X
      1                  = "1 Days ago"
      2                  = "2 Weeks ago"
      3                  = "3 Months ago"
      4                  = "4 Years ago"
      7                  = "7 Refused"
      8                  = "8 Not ascertained"
      9                  = "9 Don't know"
   ;
   VALUE CAP173X
      1                  = "1 A year ago or less"
      2                  = "2 More than 1 year but not more than 2 years"
      3                  = "3 More than 2 years but not more than 3 years"
      4                  = "4 More than 3 years but not more than 5 years"
      5                  = "5 Over 5 years ago"
      7                  = "7 Refused"
      8                  = "8 Not ascertained"
      9                  = "9 Don't know"
   ;
   VALUE CAP174X
      1                  = "1 A year ago or less"
      2                  = "2 More than 1 year but not more than 2 years"
      3                  = "3 More than 2 years but not more than 3 years"
      4                  = "4 More than 3 years but not more than 5 years"
      5                  = "5 Over 5 years"
      7                  = "7 Refused"
      8                  = "8 Not ascertained"
      9                  = "9 Don't know"
   ;
   VALUE CAP176X
      1                  = "1 Part of a routine exam"
      2                  = "2 Because of a problem"
      3                  = "3 Other reason"
      7                  = "7 Refused"
      8                  = "8 Not ascertained"
      9                  = "9 Don't know"
   ;
   VALUE CAP177X
      00                 = "00 Haven't started"
      97                 = "97 Refused"
      98                 = "98 Not ascertained"
      99                 = "99 Don't know"
   ;
   VALUE CAP179X
      1                  = "1 year ago or less"
      2                  = "2 More than 1 year ago but less than 2 years ago"
      3                  = "3 2 years ago or more"
      7                  = "7 Refused"
      8                  = "8 Not ascertained"
      9                  = "9 Don't know"
   ;
   VALUE CAP181X
      25                 = "25 25+"
      97                 = "97 Refused"
      98                 = "98 Not ascertained"
      99                 = "99 Don't know"
   ;
   VALUE CAP183X
      9997               = "9997 Refused"
      9998               = "9998 Not ascertained"
      9999               = "9999 Don't know"
   ;
   VALUE CAP186X
      00                 = "00 None"
      95                 = "95 95+"
      97                 = "97 Refused"
      98                 = "98 Not ascertained"
      99                 = "99 Don't know"
   ;
   VALUE CAP195X
      1                  = "1 Yes"
      2                  = "2 No"
      3                  = "3 Only notified if there was a problem"
      7                  = "7 Refused"
      8                  = "8 Not ascertained"
      9                  = "9 Don't know"
   ;
   VALUE CAP199X
      01                 = "01 No reason/never thought about it"
      02                 = "02 Put if off/didn't get around to it"
      03                 = "03 Too expensive/no insurance/cost"
      04                 = "04 Too painful, unpleasant, or embarrassing"
      05                 = "05 Had hysterectomy"
      06                 = "06 Don't have doctor"
      07                 = "07 Fear"
      08                 = "08 Other"
      97                 = "97 Refused"
      98                 = "98 Not ascertained"
      99                 = "99 Don't know"
   ;
   VALUE CAP200X
      01                 = "01 No reason/never thought about it"
      02                 = 
"02 Didn't need it/didn't know I needed this type of test"
      03                 = "03 Doctor didn't order it/didn't say I needed it"
      04                 = "04 Haven't had any problems"
      05                 = "05 Put it off/didn't get around to it"
      06                 = "06 Too expensive/no insurance/cost"
      07                 = "07 Too painful, unpleasant, or embarrassing"
      08                 = "08 Had hysterectomy"
      09                 = "09 Don't have doctor"
      10                 = "10 Had an HPV DNA test"
      11                 = "11 Had HPV vaccine"
      12                 = "12 Other"
      97                 = "97 Refused"
      98                 = "98 Not ascertained"
      99                 = "99 Don't know"
   ;
   VALUE CAP216X
      1                  = "1 Yes"
      2                  = "2 No"
      3                  = "3 Doctor refused when asked"
      7                  = "7 Refused"
      8                  = "8 Not ascertained"
      9                  = "9 Don't know"
   ;
   VALUE CAP217X
      50                 = "50 50+"
      96                 = "96 All shots"
      97                 = "97 Refused"
      98                 = "98 Not ascertained"
      99                 = "99 Don't know"
   ;
   VALUE CAP222X
      1                  = "1 A year ago or less"
      2                  = "2 More than 1 year but not more than 2 years"
      3                  = "3 More than 2 years but not more than 3 years"
      4                  = "4 More than 3 years but not more than 4 years"
      7                  = "7 Refused"
      8                  = "8 Not ascertained"
      9                  = "9 Don't know"
   ;
   VALUE CAP225X
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
   VALUE CAP229X
      1                  = "1 Under 30 years"
      2                  = "2 30-39"
      3                  = "3 40-49"
      4                  = "4 50-59"
      5                  = "5 60 years or older"
      7                  = "7 Refused"
      8                  = "8 Not ascertained"
      9                  = "9 Don't know"
   ;
   VALUE CAP230X
      1                  = "1 Because of a breast problem"
      2                  = "2 My healthcare provider told me I was high-risk"
      3                  = "3 Family history of breast cancer"
      4                  = "4 Part of a routine exam"
      5                  = "5 I requested it"
      6                  = "6 Other reason"
      7                  = "7 Refused"
      8                  = "8 Not ascertained"
      9                  = "9 Don't know"
   ;
   VALUE CAP242X
      01                 = "01 No reason/never thought about it"
      02                 = "02 Put if off/didn't get around to it"
      03                 = "03 Too expensive/no insurance/cost"
      04                 = "04 Too painful, unpleasant, or embarrassing"
      05                 = "05 I'm too young"
      06                 = "06 Don't have doctor"
      07                 = "07 Fear"
      08                 = "08 Other"
      97                 = "97 Refused"
      98                 = "98 Not ascertained"
      99                 = "99 Don't know"
   ;
   VALUE CAP243X
      1                  = "1 In person"
      2                  = "2 Over the telephone"
   ;
   VALUE CAP245X
      01                 = "01 Found by myself by accident"
      02                 = "02 Found by myself during a self-breast examination"
      03                 = "03 Found by my spouse or partner"
      04                 = "04 Found by my physician during routine breast exam"
      05                 = "05 Found by mammogram"
      06                 = "06 Found by Magnetic Resonance Imaging (MRI)"
      07                 = "07 Other: specify"
      97                 = "97 Refused"
      98                 = "98 Not ascertained"
      99                 = "99 Don't know"
   ;
   VALUE CAP247X
      1                  = "1 Yes"
      2                  = "2 No"
      3                  = "3 Lump removed was cancerous"
      7                  = "7 Refused"
      8                  = "8 Not ascertained"
      9                  = "9 Don't know"
   ;
   VALUE CAP249X
      01                 = "01 No reason/never thought about it"
      02                 = 
"02 Didn't need it/didn't know I needed this type of test"
      03                 = "03 Doctor didn't order it/didn't say I needed it"
      04                 = "04 Haven't had any problems"
      05                 = "05 Put it off/Didn't get around to it"
      06                 = "06 Too expensive/no insurance/cost"
      07                 = "07 Too painful, unpleasant or embarrassing"
      08                 = "08 I'm too young"
      09                 = "09 Don't have doctor"
      10                 = "10 Other"
      97                 = "97 Refused"
      98                 = "98 Not ascertained"
      99                 = "99 Don't know"
   ;
   VALUE CAP266X
      01                 = "01 A follow up of an abnormal mammogram"
      02                 = "02 Because of a breast problem"
      03                 = 
"03 Because my healthcare provider told me I was high risk"
      04                 = "04 I have a family history of breast cancer"
      05                 = "05 Part of a routine exam"
      06                 = "06 I requested it"
      07                 = "07 Other"
      97                 = "97 Refused"
      98                 = "98 Not ascertained"
      99                 = "99 Don't know"
   ;
   VALUE CAP268X
      1                  = "1 Yes, to check for lung cancer"
      2                  = "2 No, for some other reason"
      7                  = "7 Refused"
      8                  = "8 Not ascertained"
      9                  = "9 Don't know"
   ;
   VALUE CAP270X
      1                  = "1 Yes"
      2                  = "2 No"
      3                  = "3 Several areas of upper body region"
      7                  = "7 Refused"
      8                  = "8 Not ascertained"
      9                  = "9 Don't know"
   ;
   VALUE CAP278X
      1                  = "1 For problems related to my prostate"
      2                  = "2 For male pattern baldness"
      3                  = 
"3 To reduce the chance that I may develop prostate cancer"
      4                  = "4 Other"
      7                  = "7 Refused"
      8                  = "8 Not ascertained"
      9                  = "9 Don't know"
   ;
   VALUE CAP281X
      1                  = "1 2 years ago or less"
      2                  = 
"2 More than 2 years ago but not more than 5 years ago"
      3                  = "3 More than 5 years ago"
      7                  = "7 Refused"
      8                  = "8 Not ascertained"
      9                  = "9 Don't know"
   ;
   VALUE CAP283X
      1                  = "1 As part of my treatment for breast cancer"
      2                  = "2 To reduce the chance I may develop breast cancer"
      3                  = "3 Both"
      4                  = "4 Other reason"
      7                  = "7 Refused"
      8                  = "8 Not ascertained"
      9                  = "9 Don't know"
   ;
   VALUE CAP285X
      1                  = "1 As part of my treatment for osteoporosis"
      2                  = 
"2 To reduce the chance that I may develop breast cancer"
      3                  = "3 Both"
      4                  = "4 Other reason"
      7                  = "7 Refused"
      8                  = "8 Not ascertained"
      9                  = "9 Don't know"
   ;
   VALUE CAP297X
      01                 = "01 Under 40 years"
      02                 = "02 40-44"
      03                 = "03 45-49"
      04                 = "04 50-54"
      05                 = "05 55-59"
      06                 = "06 60-64"
      07                 = "07 65-69"
      08                 = "08 70 years and older"
      97                 = "97 Refused"
      98                 = "98 Not ascertained"
      99                 = "99 Don't know"
   ;
   VALUE CAP307X
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
   VALUE CAP310X
      1                  = "1 Part of a routine exam"
      2                  = "2 Because of a problem"
      3                  = 
"3 Follow-up test of an earlier test or screening exam"
      4                  = "4 Other reason"
      7                  = "7 Refused"
      8                  = "8 Not ascertained"
      9                  = "9 Don't know"
   ;
   VALUE CAP328X
      1                  = "1 Part of a routine exam"
      2                  = "2 Because of a problem"
      3                  = 
"3 Follow-up test or an earlier test or screening exam"
      4                  = "4 Other reason"
      7                  = "7 Refused"
      8                  = "8 Not ascertained"
      9                  = "9 Don't know"
   ;
   VALUE CAP353X
      1                  = "1 A year ago or less"
      2                  = "2 More than 1 year but not more than 2 years"
      3                  = "3 More than 2 years but not more than 3 years"
      4                  = "4 More than 3 years but not more than 5 years"
      5                  = "5 More than 5 years but not more than 10 years"
      6                  = "6 Over 10 years"
      7                  = "7 Refused"
      8                  = "8 Not ascertained"
      9                  = "9 Don't know"
   ;
   VALUE CAP358X
      1                  = "1 Mentioned"
      2                  = "2 Not mentioned"
      7                  = "7 Refused"
      8                  = "8 Not ascertained"
      9                  = "9 Don’t know"
   ;
   VALUE CAP363X
      01                 = "01 No reason/never thought about it"
      02                 = 
"02 Didn't need it/didn't know I needed this type of test"
      03                 = "03 Doctor didn't order it/didn't say I needed it"
      04                 = "04 Haven't had any problems"
      05                 = "05 Put it off/Didn't get around to it"
      06                 = "06 Too expensive/no insurance/cost"
      07                 = "07 Too painful, unpleasant, or embarrassing"
      08                 = "08 Had another type of colorectal exam"
      09                 = "09 Don't have doctor"
      10                 = "10 Other"
      97                 = "97 Refused"
      98                 = "98 Not ascertained"
      99                 = "99 Don't know"
   ;
   VALUE CAP378X
      1                  = "1 More likely to get cancer"
      2                  = "2 Less likely"
      3                  = "3 About as likely"
      7                  = "7 Refused"
      8                  = "8 Not ascertained"
      9                  = "9 Don't know"
   ;
   VALUE CAP379X
      1                  = "1 More likely to get colon or rectal cancer"
      2                  = "2 Less likely"
      3                  = "3 About as likely"
      7                  = "7 Refused"
      8                  = "8 Not ascertained"
      9                  = "9 Don't know"
   ;
   VALUE CAP380X
      1                  = "1 More likely to get breast cancer"
      2                  = "2 Less likely"
      3                  = "3 About as likely"
      7                  = "7 Refuse"
      8                  = "8 Not ascertained"
      9                  = "9 Don't know"
   ;
   VALUE CAP381X
      1                  = "1 Yes"
      2                  = "2 No"
      3                  = "3 Adopted or don't know biological father"
      7                  = "7 Refused"
      8                  = "8 Not ascertained"
      9                  = "9 Don't know"
   ;
   VALUE CAP437X
      1                  = "1 Yes"
      2                  = "2 No"
      3                  = "3 Adopted or don't know biological mother"
      7                  = "7 Refused"
      8                  = "8 Not ascertained"
      9                  = "9 Don't know"
   ;
   VALUE CAP495X
      00                 = "00 None"
      21                 = "21 21+"
      97                 = "97 Refused"
      98                 = "98 Not ascertained"
      99                 = "99 Don't know"
   ;
   VALUE CAP498X
      21                 = "21 21+"
      97                 = "97 Refused"
      98                 = "98 Not ascertained"
      99                 = "99 Don't know"
   ;
   VALUE CAP666X
      00                 = "00 None"
      21                 = "21 21+"
      96                 = "96 No biological children"
      97                 = "97 Refused"
      98                 = "98 Not ascertained"
      99                 = "99 Don't know"
   ;
   VALUE CAP837X
      1                  = "1 Excellent"
      2                  = "2 Very good"
      3                  = "3 Good"
      4                  = "4 Fair"
      5                  = "5 Poor"
      7                  = "7 Refused"
      8                  = "8 Not ascertained"
      9                  = "9 Don't know"
   ;
   VALUE CAP842X
      1                  = "1 Completely"
      2                  = "2 Mostly"
      3                  = "3 Moderately"
      4                  = "4 A little"
      5                  = "5 Not at all"
      7                  = "7 Refused"
      8                  = "8 Not ascertained"
      9                  = "9 Don't know"
   ;
   VALUE CAP843X
      1                  = "1 Never"
      2                  = "2 Rarely"
      3                  = "3 Sometimes"
      4                  = "4 Often"
      5                  = "5 Always"
      7                  = "7 Refused"
      8                  = "8 Not ascertained"
      9                  = "9 Don't know"
   ;
   VALUE CAP844X
      1                  = "1 None"
      2                  = "2 Mild"
      3                  = "3 Moderate"
      4                  = "4 Severe"
      5                  = "5 Very severe"
      7                  = "7 Refused"
      8                  = "8 Not ascertained"
      9                  = "9 Don't know"
   ;
   VALUE CAP846X
      1                  = "1 Very low"
      2                  = "2 Fairly low"
      3                  = "3 Moderate"
      4                  = "4 Fairly high"
      5                  = "5 Very high"
      7                  = "7 Refused"
      8                  = "8 Not ascertained"
      9                  = "9 Don't know"
   ;
   VALUE CAP847X
      1                  = "1 Never"
      2                  = "2 Rarely"
      3                  = "3 Sometimes"
      4                  = "4 Often"
      5                  = "5 All the time"
      7                  = "7 Refused"
      8                  = "8 Not ascertained"
      9                  = "9 Don't know"
   ;
   VALUE CAP867X
      1                  = "1 Very satisfied"
      2                  = "2 Somewhat satisfied"
      3                  = "3 Not satisfied"
      7                  = "7 Refused"
      8                  = "8 Not ascertained"
      9                  = "9 Don't know"
   ;
   VALUE CAP869X
      1                  = "1 I didn't know these services were available"
      2                  = "2 I didn't want it"
      3                  = "3 I didn't think I needed it"
      4                  = "4 I couldn't afford it"
      5                  = "5 Some other reason (please specify)"
      7                  = "7 Refused"
      8                  = "8 Not ascertained"
      9                  = "9 Don't know"
   ;
   VALUE CAP874X
      1                  = "1 A lot"
      2                  = "2 Some"
      3                  = "3 A little"
      4                  = "4 Not at all"
      7                  = "7 Refused"
      8                  = "8 Not ascertained"
      9                  = "9 Don't know"
   ;

DATA NHIS.CANCERXX;
   * CREATE A SAS DATA SET;
   INFILE ASCIIDAT PAD LRECL=1707;

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
      MRACBPI2   3   AGE_P      3   COMPSTAT   3

      /* FID LENGTHS */

      R_MARITL   3

      /* NAC LENGTHS */

      SPSPEAK    3   CEREALNO   4   CEREALTP   3   CERTYP   $ 75
      CERTYPN    4   CERTPSP  $ 30  CERTYP2    3   CERTYP3  $ 75
      CERTYP3N   4   CERTP3SP $ 30  MILKNO     4   MILKTP     3
      MILKTYP    3   SODANO     4   SODATP     3   FRJUICNO   4
      FRJUICTP   3   COFFEENO   4   COFFEETP   3   SPORDRNO   4
      SPORDRTP   3   FRTDRNO    4   FRTDRTP    3   FRUITNO    4
      FRUITTP    3   SALADNO    4   SALADTP    3   FRIESNO    4
      FRIESTP    3   POTATONO   4   POTATOTP   3   BEANSNO    4
      BEANSTP    3   BRRICENO   4   BRRICETP   3   OVEGNO     4
      OVEGTP     3   SALSANO    4   SALSATP    3   PIZZANO    4
      PIZZATP    3   TOMSAUNO   4   TOMSAUTP   3   CHEESENO   4
      CHEESETP   3   CHEESTYP   3   REDMETNO   4   REDMETTP   3
      PROMETNO   4   PROMETTP   3   BREADNO    4   BREADTP    3
      CANDYNO    4   CANDYTP    3   DONUTNO    4   DONUTTP    3
      COOKIENO   4   COOKIETP   3   ICECRNO    4   ICECRTP    3
      POPCNNO    4   POPCNTP    3   VITMIN     3   VITMULT    3
      VITMULD    3   CALCA      3   CALCD      3   VITD       3
      VITDM      3   VITDWHY    3   VITDSPEC $ 20

      /* NAD LENGTHS */

      AD11A      3   AD12A      3   AD13NO     4   AD13TP     3
      AD14A      3   AD15A      3   AD16NO     4   AD16TP     3
      SITWDAY    3   SITWEND    3   MDEXER     3

      /* NAE LENGTHS */

      MENTHOLF   3   NUMCIGA    3   NUMCVAR    3   FQUITA_1   3
      FQUITA_2   3   FQUITA_3   3   FQUITA_4   3   FQUITA_5   3
      FQUITB_1   3   FQUITB_2   3   FQUITB_3   3   MENTHOL    3
      CSQEV      3   CQUITA_1   3   CQUITA_2   3   CQUITA_3   3
      CQUITA_4   3   CQUITA_5   3   CQUITB_1   3   CQUITB_2   3
      CQUITB_3   3   QWANT      3   CIGEV1     3   CIGEV50    3
      CIGCUR     3   CIG30D     3   SNUFFEV    3   SNUFEV20   3
      SNUFFCUR   3   SNUFF30D   3   CHEWEV     3   CHEWEV20   3
      CHEWCUR    3   CHEW30D    3   CHEWTYP    3   CHTYPOTH $ 20
      MDTOB2     3   HPTOB21    3   HPTOB22    3   HPTOB23    3
      HPTOB24    3   HPTOB25    3   HPTOTH   $ 20  LIVINTRO   3
      LIVSMOKE   3   LVDYSMOK   3   LIVEBTH    3   SMKPREG    3
      SMKLST     3   QUTWK      3   MTHQUIT    3   STSMOK     3

      /* NAF LENGTHS */

      SUN1HR     3   SUNTAN     3   SUN1_SHA   3   SUN1_CAP   3
      SUN_HAT1   3   SUN2_LGS   3   SUN2_LGP   3   SUN2_SCR   3
      SPF        3   SPFSCALE   3   NBURN      4   SNONCE     3
      SNNUM1     4   SKNX       3   RSKX1_MT   3   RSKX1_YR   4
      RSKX1N     3   RSKX1T     3   RSKX2      3   RSKX3A     3
      RSKX3B     3   SKINREAS   3   MENSTAGE   3   MENSTILL   3
      MENLAST    3   BIRTHEV    3   BIRTHNUM   3   BIRTHAGE   3
      BIRTHAG2   4   PAPHAD1    3   PAPFRST1   3   PAP6YR1    3
      RPAP1_M1   3   RPAP1_Y1   4   RPAP1N1    3   RPAP1T1    3
      RPAP21     3   RPAP3A1    3   RPAP3B1    3   PAPREA1    3
      PRESULT    3   PAPABN3    3   PAPADDE1   3   PAPTRT1    3
      PNOTFOL    3   PAPNOT1    3   MDRECP1    3   PREMIND    3
      HYST       3   RHYS1_MT   3   RHYS1_YR   4   RHYS1N     3
      RHYS1T     3   RHYS2      3   RHYST3A    3   RHYST3B    3
      OVARIES    3   OVARAGE    4   HPVHRD     3   HPVHAD     3
      SHHPVHRD   3   SHTHPV     3   SHHPVDOS   3   HPV_MT     3
      HPV_YR     4   HPVN       3   HPVT       3   HPV2       3
      HPV3A      3   HPVINT     3   HPVNOT     3   HPVCOST    3
      HPVLOCST   3   MAMHAD     3   MAMAGE     3   MAMREA     3
      MAM6YR     3   RMAM1_MT   3   RMAM1_YR   4   RMAM1N     3
      RMAM1T     3   RMAM2      3   RMAM3A     3   RMAM3B     3
      MAMREAS    3   MAMABN1    3   MFOLLOW    3   MNOTFOL    3
      MAMMODE    3   MAMCAN1    3   MFOUND     3   MFOUND2  $ 75
      LUMPEV2    3   LUMPNUM2   3   MAMNOT     3   MDRECMAM   3
      CBEHAD     3   RCBE1_MT   3   RCBE1_YR   4   RCBE1N     3
      RCBE1T     3   RCBE2      3   RCBE3A     3   RCBE3B     3
      MRIHAD     3   MRI_MT     3   MRI_YR     4   MRIN       3
      MRIT       3   MRI2       3   MRI3A      3   MRIREA     3
      CHESTX     3   CHESTREA   3   CAT12      3   CATCHEST   3
      CATLUNG    3   ASPIRIN    3   ASPIR3M    3   ADVIL      3
      ADVIL3M    3   PROPECIA   3   PROPMTHS   3   PROPREAS   3
      MEDHRT1    3   HRTEVER    3   HRTSTOP    3   MEDTAMX1   3
      TAMMAIN    3   MEDRALX1   3   RALXREAS   3   MEDBC1     3
      PSAREC     3   PSAHAD     3   RPSA1_MT   3   RPSA1_YR   4
      RPSA1N     3   RPSA1T     3   RPSA2      3   RPSA3A     3
      RPSA3B     3   PSAREAS    3   PSAAGE1    3   PSA5YR     3
      PSAADV     3   PSADISAV   3   PSAEXP     3   COLHAD     3
      COL_MT     3   COL_YR     4   COLN       3   COLT       3
      COL2       3   COL3A      3   COL3B      3   COLREAS    3
      SIGHAD     3   SIG_MT     3   SIG_YR     4   SIGN       3
      SIGT       3   SIG2       3   SIG3A      3   SIG3B      3
      SIGREAS    3   CTHEARD    3   CTHADEV    3   CT_MT      3
      CT_YR      4   CTN        3   CTT        3   CT2        3
      CT3A       3   CTREAS     3   POLYP      3   HFOBHAD    3
      RHFO1_MT   3   RHFO1_YR   4   RHFO1N     3   RHFO1T     3
      RHFO2      3   RHFOB3A    3   RHFOB3B    3   HFOBREA1   3
      HFOBABN1   3   HFOBTST1   3   HFOBTST2   3   HFOBTST3   3
      HFOBTST4   3   HFOBTST5   3   HFOBTST0   3   HFONOTDO   3
      FOBHAD     3   RFOB1_MT   3   RFOB1_YR   4   RFOB1N     3
      RFOB1T     3   RFOB2      3   ROFOB3A    3   ROFOB3B    3
      RFOBREAS   3   COLPROB    3   COLTEST    3   COLKIND1   3
      COLKIND2   3   COLKIND3   3   COLKIND4   3   COLKIND5   3
      COLNOT     3

      /* NAG LENGTHS */

      GTHEARD    3   GTPOSS     3   GTADVISE   3   GTGRISK    3
      GTBRE      3   GTOVA      3   GTCOL      3   GTOTH      3
      GTRSKOTH $ 20  GTRSK_MT   3   GTRSK_YR   4   GTRSKN     3
      GTRSKT     3   GTINSURE   3   GTCCOM     3   GTCCLOM    3
      GTCBOM     3

      /* NAH LENGTHS */

      FHFCAN     3   FHFTYP1    3   FHFAGE01   3   FHFTYP2    3
      FHFAGE02   3   FHFTYP3    3   FHFAGE03   3   FHFTYP4    3
      FHFAGE04   3   FHFTYP5    3   FHFAGE05   3   FHFTYP7    3
      FHFAGE07   3   FHFTYP8    3   FHFAGE08   3   FHFTYP9    3
      FHFAGE09   3   FHFTYP10   3   FHFAGE10   3   FHFTYP11   3
      FHFAGE11   3   FHFTYP12   3   FHFAGE12   3   FHFTYP13   3
      FHFAGE13   3   FHFTYP14   3   FHFAGE14   3   FHFTYP15   3
      FHFAGE15   3   FHFTYP16   3   FHFAGE16   3   FHFTYP17   3
      FHFAGE17   3   FHFTYP19   3   FHFAGE19   3   FHFTYP20   3
      FHFAGE20   3   FHFTYP21   3   FHFAGE21   3   FHFTYP22   3
      FHFAGE22   3   FHFTYP23   3   FHFAGE23   3   FHFTYP24   3
      FHFAGE24   3   FHFTYP25   3   FHFAGE25   3   FHFTYP26   3
      FHFAGE26   3   FHFTYP27   3   FHFAGE27   3   FHFTYP28   3
      FHFAGE28   3   FHFTYP30   3   FHFAGE30   3   FHFTYP31   3
      FHMCAN     3   FHMTYP1    3   FHMAGE01   3   FHMTYP2    3
      FHMAGE02   3   FHMTYP3    3   FHMAGE03   3   FHMTYP4    3
      FHMAGE04   3   FHMTYP5    3   FHMAGE05   3   FHMTYP6    3
      FHMAGE06   3   FHMTYP7    3   FHMAGE07   3   FHMTYP8    3
      FHMAGE08   3   FHMTYP9    3   FHMAGE09   3   FHMTYP10   3
      FHMAGE10   3   FHMTYP11   3   FHMAGE11   3   FHMTYP12   3
      FHMAGE12   3   FHMTYP13   3   FHMAGE13   3   FHMTYP14   3
      FHMAGE14   3   FHMTYP15   3   FHMAGE15   3   FHMTYP16   3
      FHMAGE16   3   FHMTYP17   3   FHMAGE17   3   FHMTYP18   3
      FHMAGE18   3   FHMTYP19   3   FHMAGE19   3   FHMTYP21   3
      FHMAGE21   3   FHMTYP22   3   FHMAGE22   3   FHMTYP23   3
      FHMAGE23   3   FHMTYP24   3   FHMAGE24   3   FHMTYP25   3
      FHMAGE25   3   FHMTYP27   3   FHMAGE27   3   FHMTYP28   3
      FHMAGE28   3   FHMTYP29   3   FHMAGE29   3   FHMTYP30   3
      FHMAGE30   3   FHMTYP31   3   FHBNUM     3   FHBCAN     3
      FHBTYP1    3   FHBMAN01   3   FHBAGE01   3   FHBTYP2    3
      FHBMAN02   3   FHBAGE02   3   FHBTYP3    3   FHBMAN03   3
      FHBAGE03   3   FHBTYP4    3   FHBMAN04   3   FHBAGE04   3
      FHBTYP5    3   FHBMAN05   3   FHBAGE05   3   FHBTYP7    3
      FHBMAN07   3   FHBAGE07   3   FHBTYP8    3   FHBMAN08   3
      FHBAGE08   3   FHBTYP9    3   FHBMAN09   3   FHBAGE09   3
      FHBTYP10   3   FHBMAN10   3   FHBAGE10   3   FHBTYP11   3
      FHBMAN11   3   FHBAGE11   3   FHBTYP12   3   FHBMAN12   3
      FHBAGE12   3   FHBTYP13   3   FHBMAN13   3   FHBAGE13   3
      FHBTYP14   3   FHBMAN14   3   FHBAGE14   3   FHBTYP15   3
      FHBMAN15   3   FHBAGE15   3   FHBTYP16   3   FHBMAN16   3
      FHBAGE16   3   FHBTYP17   3   FHBMAN17   3   FHBAGE17   3
      FHBTYP19   3   FHBMAN19   3   FHBAGE19   3   FHBTYP20   3
      FHBMAN20   3   FHBAGE20   3   FHBTYP21   3   FHBMAN21   3
      FHBAGE21   3   FHBTYP22   3   FHBMAN22   3   FHBAGE22   3
      FHBTYP23   3   FHBMAN23   3   FHBAGE23   3   FHBTYP24   3
      FHBMAN24   3   FHBAGE24   3   FHBTYP25   3   FHBMAN25   3
      FHBAGE25   3   FHBTYP26   3   FHBMAN26   3   FHBAGE26   3
      FHBTYP27   3   FHBMAN27   3   FHBAGE27   3   FHBTYP28   3
      FHBMAN28   3   FHBAGE28   3   FHBTYP30   3   FHBMAN30   3
      FHBAGE30   3   FHBTYP31   3   FHSNUM     3   FHSCAN     3
      FHSTYP1    3   FHSMAN01   3   FHSAGE01   3   FHSTYP2    3
      FHSMAN02   3   FHSAGE02   3   FHSTYP3    3   FHSMAN03   3
      FHSAGE03   3   FHSTYP4    3   FHSMAN04   3   FHSAGE04   3
      FHSTYP5    3   FHSMAN05   3   FHSAGE05   3   FHSTYP6    3
      FHSMAN06   3   FHSAGE06   3   FHSTYP7    3   FHSMAN07   3
      FHSAGE07   3   FHSTYP8    3   FHSMAN08   3   FHSAGE08   3
      FHSTYP9    3   FHSMAN09   3   FHSAGE09   3   FHSTYP10   3
      FHSMAN10   3   FHSAGE10   3   FHSTYP11   3   FHSMAN11   3
      FHSAGE11   3   FHSTYP12   3   FHSMAN12   3   FHSAGE12   3
      FHSTYP13   3   FHSMAN13   3   FHSAGE13   3   FHSTYP14   3
      FHSMAN14   3   FHSAGE14   3   FHSTYP15   3   FHSMAN15   3
      FHSAGE15   3   FHSTYP16   3   FHSMAN16   3   FHSAGE16   3
      FHSTYP17   3   FHSMAN17   3   FHSAGE17   3   FHSTYP18   3
      FHSMAN18   3   FHSAGE18   3   FHSTYP19   3   FHSMAN19   3
      FHSAGE19   3   FHSTYP21   3   FHSMAN21   3   FHSAGE21   3
      FHSTYP22   3   FHSMAN22   3   FHSAGE22   3   FHSTYP23   3
      FHSMAN23   3   FHSAGE23   3   FHSTYP24   3   FHSMAN24   3
      FHSAGE24   3   FHSTYP25   3   FHSMAN25   3   FHSAGE25   3
      FHSTYP27   3   FHSMAN27   3   FHSAGE27   3   FHSTYP28   3
      FHSMAN28   3   FHSAGE28   3   FHSTYP29   3   FHSMAN29   3
      FHSAGE29   3   FHSTYP30   3   FHSMAN30   3   FHSAGE30   3
      FHSTYP31   3   FHNNUM     3   FHNCAN     3   FHNTYP1    3
      FHNMAN01   3   FHNAGE01   3   FHNTYP2    3   FHNMAN02   3
      FHNAGE02   3   FHNTYP3    3   FHNMAN03   3   FHNAGE03   3
      FHNTYP4    3   FHNMAN04   3   FHNAGE04   3   FHNTYP5    3
      FHNMAN05   3   FHNAGE05   3   FHNTYP7    3   FHNMAN07   3
      FHNAGE07   3   FHNTYP8    3   FHNMAN08   3   FHNAGE08   3
      FHNTYP9    3   FHNMAN09   3   FHNAGE09   3   FHNTYP10   3
      FHNMAN10   3   FHNAGE10   3   FHNTYP11   3   FHNMAN11   3
      FHNAGE11   3   FHNTYP12   3   FHNMAN12   3   FHNAGE12   3
      FHNTYP13   3   FHNMAN13   3   FHNAGE13   3   FHNTYP14   3
      FHNMAN14   3   FHNAGE14   3   FHNTYP15   3   FHNMAN15   3
      FHNAGE15   3   FHNTYP16   3   FHNMAN16   3   FHNAGE16   3
      FHNTYP17   3   FHNMAN17   3   FHNAGE17   3   FHNTYP19   3
      FHNMAN19   3   FHNAGE19   3   FHNTYP20   3   FHNMAN20   3
      FHNAGE20   3   FHNTYP21   3   FHNMAN21   3   FHNAGE21   3
      FHNTYP22   3   FHNMAN22   3   FHNAGE22   3   FHNTYP23   3
      FHNMAN23   3   FHNAGE23   3   FHNTYP24   3   FHNMAN24   3
      FHNAGE24   3   FHNTYP25   3   FHNMAN25   3   FHNAGE25   3
      FHNTYP26   3   FHNMAN26   3   FHNAGE26   3   FHNTYP27   3
      FHNMAN27   3   FHNAGE27   3   FHNTYP28   3   FHNMAN28   3
      FHNAGE28   3   FHNTYP30   3   FHNMAN30   3   FHNAGE30   3
      FHNTYP31   3   FHDNUM     3   FHDCAN     3   FHDTYP1    3
      FHDMAN01   3   FHDAGE01   3   FHDTYP2    3   FHDMAN02   3
      FHDAGE02   3   FHDTYP3    3   FHDMAN03   3   FHDAGE03   3
      FHDTYP4    3   FHDMAN04   3   FHDAGE04   3   FHDTYP5    3
      FHDMAN05   3   FHDAGE05   3   FHDTYP6    3   FHDMAN06   3
      FHDAGE06   3   FHDTYP7    3   FHDMAN07   3   FHDAGE07   3
      FHDTYP8    3   FHDMAN08   3   FHDAGE08   3   FHDTYP9    3
      FHDMAN09   3   FHDAGE09   3   FHDTYP10   3   FHDMAN10   3
      FHDAGE10   3   FHDTYP11   3   FHDMAN11   3   FHDAGE11   3
      FHDTYP12   3   FHDMAN12   3   FHDAGE12   3   FHDTYP13   3
      FHDMAN13   3   FHDAGE13   3   FHDTYP14   3   FHDMAN14   3
      FHDAGE14   3   FHDTYP15   3   FHDMAN15   3   FHDAGE15   3
      FHDTYP16   3   FHDMAN16   3   FHDAGE16   3   FHDTYP17   3
      FHDMAN17   3   FHDAGE17   3   FHDTYP18   3   FHDMAN18   3
      FHDAGE18   3   FHDTYP19   3   FHDMAN19   3   FHDAGE19   3
      FHDTYP21   3   FHDMAN21   3   FHDAGE21   3   FHDTYP22   3
      FHDMAN22   3   FHDAGE22   3   FHDTYP23   3   FHDMAN23   3
      FHDAGE23   3   FHDTYP24   3   FHDMAN24   3   FHDAGE24   3
      FHDTYP25   3   FHDMAN25   3   FHDAGE25   3   FHDTYP27   3
      FHDMAN27   3   FHDAGE27   3   FHDTYP28   3   FHDMAN28   3
      FHDAGE28   3   FHDTYP29   3   FHDMAN29   3   FHDAGE29   3
      FHDTYP30   3   FHDMAN30   3   FHDAGE30   3   FHDTYP31   3

      /* NAI LENGTHS */

      QOL        3   QOLPH      3   QOLMH      3   QOLSAR     3
      COUSAR     3   COEPA      3   BEP7D      3   RF7D       3
      RP7D       3   CCBG10Y    3   WCCBGW     3   RECUR      3
      MRRYR      4   TRETMRC1   3   TRETMRC2   3   TRETMRC3   3
      TRETMRC4   3   TRETMRC5   3   TRETMRC6   3   TRETMRC7   3
      TMRCSPEC $ 20  TRETBC     3   CIAT       3   NFOC       3
      TRETDOC    3   FUADVEV    3   FUADVFMT   3   HICT       3
      HPCAEROP   3   HPIDATT    3   HPMETESN   3   ACDPCSG    3
      MRNPCSG    3   RCSGSPEC $ 20  DKPCSG     3   CTRSCT     3
      DHIBC      3   CCFP       3 ;

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
      COMPSTAT     50 -  50

      /* FID LOCATIONS */

      R_MARITL     51 -  51

      /* NAC LOCATIONS */

      SPSPEAK      52 -  52    CEREALNO     53 -  55
      CEREALTP     56 -  56    CERTYP   $   57 - 131
      CERTYPN     132 - 134    CERTPSP  $  135 - 164
      CERTYP2     165 - 165    CERTYP3  $  166 - 240
      CERTYP3N    241 - 243    CERTP3SP $  244 - 273
      MILKNO      274 - 276    MILKTP      277 - 277
      MILKTYP     278 - 278    SODANO      279 - 281
      SODATP      282 - 282    FRJUICNO    283 - 285
      FRJUICTP    286 - 286    COFFEENO    287 - 289
      COFFEETP    290 - 290    SPORDRNO    291 - 293
      SPORDRTP    294 - 294    FRTDRNO     295 - 297
      FRTDRTP     298 - 298    FRUITNO     299 - 301
      FRUITTP     302 - 302    SALADNO     303 - 305
      SALADTP     306 - 306    FRIESNO     307 - 309
      FRIESTP     310 - 310    POTATONO    311 - 313
      POTATOTP    314 - 314    BEANSNO     315 - 317
      BEANSTP     318 - 318    BRRICENO    319 - 321
      BRRICETP    322 - 322    OVEGNO      323 - 325
      OVEGTP      326 - 326    SALSANO     327 - 329
      SALSATP     330 - 330    PIZZANO     331 - 333
      PIZZATP     334 - 334    TOMSAUNO    335 - 337
      TOMSAUTP    338 - 338    CHEESENO    339 - 341
      CHEESETP    342 - 342    CHEESTYP    343 - 343
      REDMETNO    344 - 346    REDMETTP    347 - 347
      PROMETNO    348 - 350    PROMETTP    351 - 351
      BREADNO     352 - 354    BREADTP     355 - 355
      CANDYNO     356 - 358    CANDYTP     359 - 359
      DONUTNO     360 - 362    DONUTTP     363 - 363
      COOKIENO    364 - 366    COOKIETP    367 - 367
      ICECRNO     368 - 370    ICECRTP     371 - 371
      POPCNNO     372 - 374    POPCNTP     375 - 375
      VITMIN      376 - 376    VITMULT     377 - 377
      VITMULD     378 - 379    CALCA       380 - 380
      CALCD       381 - 382    VITD        383 - 383
      VITDM       384 - 385    VITDWHY     386 - 386
      VITDSPEC $  387 - 406

      /* NAD LOCATIONS */

      AD11A       407 - 407    AD12A       408 - 409
      AD13NO      410 - 412    AD13TP      413 - 413
      AD14A       414 - 414    AD15A       415 - 416
      AD16NO      417 - 419    AD16TP      420 - 420
      SITWDAY     421 - 422    SITWEND     423 - 424
      MDEXER      425 - 425

      /* NAE LOCATIONS */

      MENTHOLF    426 - 426    NUMCIGA     427 - 428
      NUMCVAR     429 - 430    FQUITA_1    431 - 431
      FQUITA_2    432 - 432    FQUITA_3    433 - 433
      FQUITA_4    434 - 434    FQUITA_5    435 - 435
      FQUITB_1    436 - 436    FQUITB_2    437 - 437
      FQUITB_3    438 - 438    MENTHOL     439 - 439
      CSQEV       440 - 440    CQUITA_1    441 - 441
      CQUITA_2    442 - 442    CQUITA_3    443 - 443
      CQUITA_4    444 - 444    CQUITA_5    445 - 445
      CQUITB_1    446 - 446    CQUITB_2    447 - 447
      CQUITB_3    448 - 448    QWANT       449 - 449
      CIGEV1      450 - 450    CIGEV50     451 - 451
      CIGCUR      452 - 452    CIG30D      453 - 454
      SNUFFEV     455 - 455    SNUFEV20    456 - 456
      SNUFFCUR    457 - 457    SNUFF30D    458 - 459
      CHEWEV      460 - 460    CHEWEV20    461 - 461
      CHEWCUR     462 - 462    CHEW30D     463 - 464
      CHEWTYP     465 - 466    CHTYPOTH $  467 - 486
      MDTOB2      487 - 487    HPTOB21     488 - 488
      HPTOB22     489 - 489    HPTOB23     490 - 490
      HPTOB24     491 - 491    HPTOB25     492 - 492
      HPTOTH   $  493 - 512    LIVINTRO    513 - 513
      LIVSMOKE    514 - 515    LVDYSMOK    516 - 517
      LIVEBTH     518 - 518    SMKPREG     519 - 519
      SMKLST      520 - 520    QUTWK       521 - 521
      MTHQUIT     522 - 523    STSMOK      524 - 524


      /* NAF LOCATIONS */

      SUN1HR      525 - 526    SUNTAN      527 - 528
      SUN1_SHA    529 - 529    SUN1_CAP    530 - 530
      SUN_HAT1    531 - 531    SUN2_LGS    532 - 532
      SUN2_LGP    533 - 533    SUN2_SCR    534 - 534
      SPF         535 - 536    SPFSCALE    537 - 537
      NBURN       538 - 540    SNONCE      541 - 541
      SNNUM1      542 - 544    SKNX        545 - 545
      RSKX1_MT    546 - 547    RSKX1_YR    548 - 551
      RSKX1N      552 - 553    RSKX1T      554 - 554
      RSKX2       555 - 555    RSKX3A      556 - 556
      RSKX3B      557 - 557    SKINREAS    558 - 558
      MENSTAGE    559 - 560    MENSTILL    561 - 561
      MENLAST     562 - 562    BIRTHEV     563 - 563
      BIRTHNUM    564 - 565    BIRTHAGE    566 - 567
      BIRTHAG2    568 - 571    PAPHAD1     572 - 572
      PAPFRST1    573 - 574    PAP6YR1     575 - 576
      RPAP1_M1    577 - 578    RPAP1_Y1    579 - 582
      RPAP1N1     583 - 584    RPAP1T1     585 - 585
      RPAP21      586 - 586    RPAP3A1     587 - 587
      RPAP3B1     588 - 588    PAPREA1     589 - 589
      PRESULT     590 - 590    PAPABN3     591 - 591
      PAPADDE1    592 - 592    PAPTRT1     593 - 593
      PNOTFOL     594 - 595    PAPNOT1     596 - 597
      MDRECP1     598 - 598    PREMIND     599 - 599
      HYST        600 - 600    RHYS1_MT    601 - 602
      RHYS1_YR    603 - 606    RHYS1N      607 - 608
      RHYS1T      609 - 609    RHYS2       610 - 610
      RHYST3A     611 - 611    RHYST3B     612 - 612
      OVARIES     613 - 613    OVARAGE     614 - 616
      HPVHRD      617 - 617    HPVHAD      618 - 618
      SHHPVHRD    619 - 619    SHTHPV      620 - 620
      SHHPVDOS    621 - 622    HPV_MT      623 - 624
      HPV_YR      625 - 628    HPVN        629 - 630
      HPVT        631 - 631    HPV2        632 - 632
      HPV3A       633 - 633    HPVINT      634 - 634
      HPVNOT      635 - 636    HPVCOST     637 - 637
      HPVLOCST    638 - 638    MAMHAD      639 - 639
      MAMAGE      640 - 640    MAMREA      641 - 641
      MAM6YR      642 - 643    RMAM1_MT    644 - 645
      RMAM1_YR    646 - 649    RMAM1N      650 - 651
      RMAM1T      652 - 652    RMAM2       653 - 653
      RMAM3A      654 - 654    RMAM3B      655 - 655
      MAMREAS     656 - 656    MAMABN1     657 - 657
      MFOLLOW     658 - 658    MNOTFOL     659 - 660
      MAMMODE     661 - 661    MAMCAN1     662 - 662
      MFOUND      663 - 664    MFOUND2  $  665 - 739
      LUMPEV2     740 - 740    LUMPNUM2    741 - 742
      MAMNOT      743 - 744    MDRECMAM    745 - 745
      CBEHAD      746 - 746    RCBE1_MT    747 - 748
      RCBE1_YR    749 - 752    RCBE1N      753 - 754
      RCBE1T      755 - 755    RCBE2       756 - 756
      RCBE3A      757 - 757    RCBE3B      758 - 758
      MRIHAD      759 - 759    MRI_MT      760 - 761
      MRI_YR      762 - 765    MRIN        766 - 767
      MRIT        768 - 768    MRI2        769 - 769
      MRI3A       770 - 770    MRIREA      771 - 772
      CHESTX      773 - 773    CHESTREA    774 - 774
      CAT12       775 - 775    CATCHEST    776 - 776
      CATLUNG     777 - 777    ASPIRIN     778 - 778
      ASPIR3M     779 - 779    ADVIL       780 - 780
      ADVIL3M     781 - 781    PROPECIA    782 - 782
      PROPMTHS    783 - 783    PROPREAS    784 - 784
      MEDHRT1     785 - 785    HRTEVER     786 - 786
      HRTSTOP     787 - 787    MEDTAMX1    788 - 788
      TAMMAIN     789 - 789    MEDRALX1    790 - 790
      RALXREAS    791 - 791    MEDBC1      792 - 792
      PSAREC      793 - 793    PSAHAD      794 - 794
      RPSA1_MT    795 - 796    RPSA1_YR    797 - 800
      RPSA1N      801 - 802    RPSA1T      803 - 803
      RPSA2       804 - 804    RPSA3A      805 - 805
      RPSA3B      806 - 806    PSAREAS     807 - 807
      PSAAGE1     808 - 809    PSA5YR      810 - 811
      PSAADV      812 - 812    PSADISAV    813 - 813
      PSAEXP      814 - 814    COLHAD      815 - 815
      COL_MT      816 - 817    COL_YR      818 - 821
      COLN        822 - 823    COLT        824 - 824
      COL2        825 - 825    COL3A       826 - 826
      COL3B       827 - 827    COLREAS     828 - 828
      SIGHAD      829 - 829    SIG_MT      830 - 831
      SIG_YR      832 - 835    SIGN        836 - 837
      SIGT        838 - 838    SIG2        839 - 839
      SIG3A       840 - 840    SIG3B       841 - 841
      SIGREAS     842 - 842    CTHEARD     843 - 843
      CTHADEV     844 - 844    CT_MT       845 - 846
      CT_YR       847 - 850    CTN         851 - 852
      CTT         853 - 853    CT2         854 - 854
      CT3A        855 - 855    CTREAS      856 - 856
      POLYP       857 - 857    HFOBHAD     858 - 858
      RHFO1_MT    859 - 860    RHFO1_YR    861 - 864
      RHFO1N      865 - 866    RHFO1T      867 - 867
      RHFO2       868 - 868    RHFOB3A     869 - 869
      RHFOB3B     870 - 870    HFOBREA1    871 - 871
      HFOBABN1    872 - 872    HFOBTST1    873 - 873
      HFOBTST2    874 - 874    HFOBTST3    875 - 875
      HFOBTST4    876 - 876    HFOBTST5    877 - 877
      HFOBTST0    878 - 878    HFONOTDO    879 - 879
      FOBHAD      880 - 880    RFOB1_MT    881 - 882
      RFOB1_YR    883 - 886    RFOB1N      887 - 888
      RFOB1T      889 - 889    RFOB2       890 - 890
      ROFOB3A     891 - 891    ROFOB3B     892 - 892
      RFOBREAS    893 - 893    COLPROB     894 - 894
      COLTEST     895 - 895    COLKIND1    896 - 896
      COLKIND2    897 - 897    COLKIND3    898 - 898
      COLKIND4    899 - 899    COLKIND5    900 - 900
      COLNOT      901 - 902

      /* NAG LOCATIONS */

      GTHEARD     903 - 903    GTPOSS      904 - 904
      GTADVISE    905 - 905    GTGRISK     906 - 906
      GTBRE       907 - 907    GTOVA       908 - 908
      GTCOL       909 - 909    GTOTH       910 - 910
      GTRSKOTH $  911 - 930    GTRSK_MT    931 - 932
      GTRSK_YR    933 - 936    GTRSKN      937 - 938
      GTRSKT      939 - 939    GTINSURE    940 - 940
      GTCCOM      941 - 941    GTCCLOM     942 - 942
      GTCBOM      943 - 943

      /* NAH LOCATIONS */

      FHFCAN      944 - 944    FHFTYP1     945 - 945
      FHFAGE01    946 - 946    FHFTYP2     947 - 947
      FHFAGE02    948 - 948    FHFTYP3     949 - 949
      FHFAGE03    950 - 950    FHFTYP4     951 - 951
      FHFAGE04    952 - 952    FHFTYP5     953 - 953
      FHFAGE05    954 - 954    FHFTYP7     955 - 955
      FHFAGE07    956 - 956    FHFTYP8     957 - 957
      FHFAGE08    958 - 958    FHFTYP9     959 - 959
      FHFAGE09    960 - 960    FHFTYP10    961 - 961
      FHFAGE10    962 - 962    FHFTYP11    963 - 963
      FHFAGE11    964 - 964    FHFTYP12    965 - 965
      FHFAGE12    966 - 966    FHFTYP13    967 - 967
      FHFAGE13    968 - 968    FHFTYP14    969 - 969
      FHFAGE14    970 - 970    FHFTYP15    971 - 971
      FHFAGE15    972 - 972    FHFTYP16    973 - 973
      FHFAGE16    974 - 974    FHFTYP17    975 - 975
      FHFAGE17    976 - 976    FHFTYP19    977 - 977
      FHFAGE19    978 - 978    FHFTYP20    979 - 979
      FHFAGE20    980 - 980    FHFTYP21    981 - 981
      FHFAGE21    982 - 982    FHFTYP22    983 - 983
      FHFAGE22    984 - 984    FHFTYP23    985 - 985
      FHFAGE23    986 - 986    FHFTYP24    987 - 987
      FHFAGE24    988 - 988    FHFTYP25    989 - 989
      FHFAGE25    990 - 990    FHFTYP26    991 - 991
      FHFAGE26    992 - 992    FHFTYP27    993 - 993
      FHFAGE27    994 - 994    FHFTYP28    995 - 995
      FHFAGE28    996 - 996    FHFTYP30    997 - 997
      FHFAGE30    998 - 998    FHFTYP31    999 - 999
      FHMCAN     1000 -1000    FHMTYP1    1001 -1001
      FHMAGE01   1002 -1002    FHMTYP2    1003 -1003
      FHMAGE02   1004 -1004    FHMTYP3    1005 -1005
      FHMAGE03   1006 -1006    FHMTYP4    1007 -1007
      FHMAGE04   1008 -1008    FHMTYP5    1009 -1009
      FHMAGE05   1010 -1010    FHMTYP6    1011 -1011
      FHMAGE06   1012 -1012    FHMTYP7    1013 -1013
      FHMAGE07   1014 -1014    FHMTYP8    1015 -1015
      FHMAGE08   1016 -1016    FHMTYP9    1017 -1017
      FHMAGE09   1018 -1018    FHMTYP10   1019 -1019
      FHMAGE10   1020 -1020    FHMTYP11   1021 -1021
      FHMAGE11   1022 -1022    FHMTYP12   1023 -1023
      FHMAGE12   1024 -1024    FHMTYP13   1025 -1025
      FHMAGE13   1026 -1026    FHMTYP14   1027 -1027
      FHMAGE14   1028 -1028    FHMTYP15   1029 -1029
      FHMAGE15   1030 -1030    FHMTYP16   1031 -1031
      FHMAGE16   1032 -1032    FHMTYP17   1033 -1033
      FHMAGE17   1034 -1034    FHMTYP18   1035 -1035
      FHMAGE18   1036 -1036    FHMTYP19   1037 -1037
      FHMAGE19   1038 -1038    FHMTYP21   1039 -1039
      FHMAGE21   1040 -1040    FHMTYP22   1041 -1041
      FHMAGE22   1042 -1042    FHMTYP23   1043 -1043
      FHMAGE23   1044 -1044    FHMTYP24   1045 -1045
      FHMAGE24   1046 -1046    FHMTYP25   1047 -1047
      FHMAGE25   1048 -1048    FHMTYP27   1049 -1049
      FHMAGE27   1050 -1050    FHMTYP28   1051 -1051
      FHMAGE28   1052 -1052    FHMTYP29   1053 -1053
      FHMAGE29   1054 -1054    FHMTYP30   1055 -1055
      FHMAGE30   1056 -1056    FHMTYP31   1057 -1057
      FHBNUM     1058 -1059    FHBCAN     1060 -1061
      FHBTYP1    1062 -1062    FHBMAN01   1063 -1064
      FHBAGE01   1065 -1066    FHBTYP2    1067 -1067
      FHBMAN02   1068 -1069    FHBAGE02   1070 -1071
      FHBTYP3    1072 -1072    FHBMAN03   1073 -1074
      FHBAGE03   1075 -1076    FHBTYP4    1077 -1077
      FHBMAN04   1078 -1079    FHBAGE04   1080 -1081
      FHBTYP5    1082 -1082    FHBMAN05   1083 -1084
      FHBAGE05   1085 -1086    FHBTYP7    1087 -1087
      FHBMAN07   1088 -1089    FHBAGE07   1090 -1091
      FHBTYP8    1092 -1092    FHBMAN08   1093 -1094
      FHBAGE08   1095 -1096    FHBTYP9    1097 -1097
      FHBMAN09   1098 -1099    FHBAGE09   1100 -1101
      FHBTYP10   1102 -1102    FHBMAN10   1103 -1104
      FHBAGE10   1105 -1106    FHBTYP11   1107 -1107
      FHBMAN11   1108 -1109    FHBAGE11   1110 -1111
      FHBTYP12   1112 -1112    FHBMAN12   1113 -1114
      FHBAGE12   1115 -1116    FHBTYP13   1117 -1117
      FHBMAN13   1118 -1119    FHBAGE13   1120 -1121
      FHBTYP14   1122 -1122    FHBMAN14   1123 -1124
      FHBAGE14   1125 -1126    FHBTYP15   1127 -1127
      FHBMAN15   1128 -1129    FHBAGE15   1130 -1131
      FHBTYP16   1132 -1132    FHBMAN16   1133 -1134
      FHBAGE16   1135 -1136    FHBTYP17   1137 -1137
      FHBMAN17   1138 -1139    FHBAGE17   1140 -1141
      FHBTYP19   1142 -1142    FHBMAN19   1143 -1144
      FHBAGE19   1145 -1146    FHBTYP20   1147 -1147
      FHBMAN20   1148 -1149    FHBAGE20   1150 -1151
      FHBTYP21   1152 -1152    FHBMAN21   1153 -1154
      FHBAGE21   1155 -1156    FHBTYP22   1157 -1157
      FHBMAN22   1158 -1159    FHBAGE22   1160 -1161
      FHBTYP23   1162 -1162    FHBMAN23   1163 -1164
      FHBAGE23   1165 -1166    FHBTYP24   1167 -1167
      FHBMAN24   1168 -1169    FHBAGE24   1170 -1171
      FHBTYP25   1172 -1172    FHBMAN25   1173 -1174
      FHBAGE25   1175 -1176    FHBTYP26   1177 -1177
      FHBMAN26   1178 -1179    FHBAGE26   1180 -1181
      FHBTYP27   1182 -1182    FHBMAN27   1183 -1184
      FHBAGE27   1185 -1186    FHBTYP28   1187 -1187
      FHBMAN28   1188 -1189    FHBAGE28   1190 -1191
      FHBTYP30   1192 -1192    FHBMAN30   1193 -1194
      FHBAGE30   1195 -1196    FHBTYP31   1197 -1197
      FHSNUM     1198 -1199    FHSCAN     1200 -1201
      FHSTYP1    1202 -1202    FHSMAN01   1203 -1204
      FHSAGE01   1205 -1206    FHSTYP2    1207 -1207
      FHSMAN02   1208 -1209    FHSAGE02   1210 -1211
      FHSTYP3    1212 -1212    FHSMAN03   1213 -1214
      FHSAGE03   1215 -1216    FHSTYP4    1217 -1217
      FHSMAN04   1218 -1219    FHSAGE04   1220 -1221
      FHSTYP5    1222 -1222    FHSMAN05   1223 -1224
      FHSAGE05   1225 -1226    FHSTYP6    1227 -1227
      FHSMAN06   1228 -1229    FHSAGE06   1230 -1231
      FHSTYP7    1232 -1232    FHSMAN07   1233 -1234
      FHSAGE07   1235 -1236    FHSTYP8    1237 -1237
      FHSMAN08   1238 -1239    FHSAGE08   1240 -1241
      FHSTYP9    1242 -1242    FHSMAN09   1243 -1244
      FHSAGE09   1245 -1246    FHSTYP10   1247 -1247
      FHSMAN10   1248 -1249    FHSAGE10   1250 -1251
      FHSTYP11   1252 -1252    FHSMAN11   1253 -1254
      FHSAGE11   1255 -1256    FHSTYP12   1257 -1257
      FHSMAN12   1258 -1259    FHSAGE12   1260 -1261
      FHSTYP13   1262 -1262    FHSMAN13   1263 -1264
      FHSAGE13   1265 -1266    FHSTYP14   1267 -1267
      FHSMAN14   1268 -1269    FHSAGE14   1270 -1271
      FHSTYP15   1272 -1272    FHSMAN15   1273 -1274
      FHSAGE15   1275 -1276    FHSTYP16   1277 -1277
      FHSMAN16   1278 -1279    FHSAGE16   1280 -1281
      FHSTYP17   1282 -1282    FHSMAN17   1283 -1284
      FHSAGE17   1285 -1286    FHSTYP18   1287 -1287
      FHSMAN18   1288 -1289    FHSAGE18   1290 -1291
      FHSTYP19   1292 -1292    FHSMAN19   1293 -1294
      FHSAGE19   1295 -1296    FHSTYP21   1297 -1297
      FHSMAN21   1298 -1299    FHSAGE21   1300 -1301
      FHSTYP22   1302 -1302    FHSMAN22   1303 -1304
      FHSAGE22   1305 -1306    FHSTYP23   1307 -1307
      FHSMAN23   1308 -1309    FHSAGE23   1310 -1311
      FHSTYP24   1312 -1312    FHSMAN24   1313 -1314
      FHSAGE24   1315 -1316    FHSTYP25   1317 -1317
      FHSMAN25   1318 -1319    FHSAGE25   1320 -1321
      FHSTYP27   1322 -1322    FHSMAN27   1323 -1324
      FHSAGE27   1325 -1326    FHSTYP28   1327 -1327
      FHSMAN28   1328 -1329    FHSAGE28   1330 -1331
      FHSTYP29   1332 -1332    FHSMAN29   1333 -1334
      FHSAGE29   1335 -1336    FHSTYP30   1337 -1337
      FHSMAN30   1338 -1339    FHSAGE30   1340 -1341
      FHSTYP31   1342 -1342    FHNNUM     1343 -1344
      FHNCAN     1345 -1346    FHNTYP1    1347 -1347
      FHNMAN01   1348 -1349    FHNAGE01   1350 -1351
      FHNTYP2    1352 -1352    FHNMAN02   1353 -1354
      FHNAGE02   1355 -1356    FHNTYP3    1357 -1357
      FHNMAN03   1358 -1359    FHNAGE03   1360 -1361
      FHNTYP4    1362 -1362    FHNMAN04   1363 -1364
      FHNAGE04   1365 -1366    FHNTYP5    1367 -1367
      FHNMAN05   1368 -1369    FHNAGE05   1370 -1371
      FHNTYP7    1372 -1372    FHNMAN07   1373 -1374
      FHNAGE07   1375 -1376    FHNTYP8    1377 -1377
      FHNMAN08   1378 -1379    FHNAGE08   1380 -1381
      FHNTYP9    1382 -1382    FHNMAN09   1383 -1384
      FHNAGE09   1385 -1386    FHNTYP10   1387 -1387
      FHNMAN10   1388 -1389    FHNAGE10   1390 -1391
      FHNTYP11   1392 -1392    FHNMAN11   1393 -1394
      FHNAGE11   1395 -1396    FHNTYP12   1397 -1397
      FHNMAN12   1398 -1399    FHNAGE12   1400 -1401
      FHNTYP13   1402 -1402    FHNMAN13   1403 -1404
      FHNAGE13   1405 -1406    FHNTYP14   1407 -1407
      FHNMAN14   1408 -1409    FHNAGE14   1410 -1411
      FHNTYP15   1412 -1412    FHNMAN15   1413 -1414
      FHNAGE15   1415 -1416    FHNTYP16   1417 -1417
      FHNMAN16   1418 -1419    FHNAGE16   1420 -1421
      FHNTYP17   1422 -1422    FHNMAN17   1423 -1424
      FHNAGE17   1425 -1426    FHNTYP19   1427 -1427
      FHNMAN19   1428 -1429    FHNAGE19   1430 -1431
      FHNTYP20   1432 -1432    FHNMAN20   1433 -1434
      FHNAGE20   1435 -1436    FHNTYP21   1437 -1437
      FHNMAN21   1438 -1439    FHNAGE21   1440 -1441
      FHNTYP22   1442 -1442    FHNMAN22   1443 -1444
      FHNAGE22   1445 -1446    FHNTYP23   1447 -1447
      FHNMAN23   1448 -1449    FHNAGE23   1450 -1451
      FHNTYP24   1452 -1452    FHNMAN24   1453 -1454
      FHNAGE24   1455 -1456    FHNTYP25   1457 -1457
      FHNMAN25   1458 -1459    FHNAGE25   1460 -1461
      FHNTYP26   1462 -1462    FHNMAN26   1463 -1464
      FHNAGE26   1465 -1466    FHNTYP27   1467 -1467
      FHNMAN27   1468 -1469    FHNAGE27   1470 -1471
      FHNTYP28   1472 -1472    FHNMAN28   1473 -1474
      FHNAGE28   1475 -1476    FHNTYP30   1477 -1477
      FHNMAN30   1478 -1479    FHNAGE30   1480 -1481
      FHNTYP31   1482 -1482    FHDNUM     1483 -1484
      FHDCAN     1485 -1486    FHDTYP1    1487 -1487
      FHDMAN01   1488 -1489    FHDAGE01   1490 -1491
      FHDTYP2    1492 -1492    FHDMAN02   1493 -1494
      FHDAGE02   1495 -1496    FHDTYP3    1497 -1497
      FHDMAN03   1498 -1499    FHDAGE03   1500 -1501
      FHDTYP4    1502 -1502    FHDMAN04   1503 -1504
      FHDAGE04   1505 -1506    FHDTYP5    1507 -1507
      FHDMAN05   1508 -1509    FHDAGE05   1510 -1511
      FHDTYP6    1512 -1512    FHDMAN06   1513 -1514
      FHDAGE06   1515 -1516    FHDTYP7    1517 -1517
      FHDMAN07   1518 -1519    FHDAGE07   1520 -1521
      FHDTYP8    1522 -1522    FHDMAN08   1523 -1524
      FHDAGE08   1525 -1526    FHDTYP9    1527 -1527
      FHDMAN09   1528 -1529    FHDAGE09   1530 -1531
      FHDTYP10   1532 -1532    FHDMAN10   1533 -1534
      FHDAGE10   1535 -1536    FHDTYP11   1537 -1537
      FHDMAN11   1538 -1539    FHDAGE11   1540 -1541
      FHDTYP12   1542 -1542    FHDMAN12   1543 -1544
      FHDAGE12   1545 -1546    FHDTYP13   1547 -1547
      FHDMAN13   1548 -1549    FHDAGE13   1550 -1551
      FHDTYP14   1552 -1552    FHDMAN14   1553 -1554
      FHDAGE14   1555 -1556    FHDTYP15   1557 -1557
      FHDMAN15   1558 -1559    FHDAGE15   1560 -1561
      FHDTYP16   1562 -1562    FHDMAN16   1563 -1564
      FHDAGE16   1565 -1566    FHDTYP17   1567 -1567
      FHDMAN17   1568 -1569    FHDAGE17   1570 -1571
      FHDTYP18   1572 -1572    FHDMAN18   1573 -1574
      FHDAGE18   1575 -1576    FHDTYP19   1577 -1577
      FHDMAN19   1578 -1579    FHDAGE19   1580 -1581
      FHDTYP21   1582 -1582    FHDMAN21   1583 -1584
      FHDAGE21   1585 -1586    FHDTYP22   1587 -1587
      FHDMAN22   1588 -1589    FHDAGE22   1590 -1591
      FHDTYP23   1592 -1592    FHDMAN23   1593 -1594
      FHDAGE23   1595 -1596    FHDTYP24   1597 -1597
      FHDMAN24   1598 -1599    FHDAGE24   1600 -1601
      FHDTYP25   1602 -1602    FHDMAN25   1603 -1604
      FHDAGE25   1605 -1606    FHDTYP27   1607 -1607
      FHDMAN27   1608 -1609    FHDAGE27   1610 -1611
      FHDTYP28   1612 -1612    FHDMAN28   1613 -1614
      FHDAGE28   1615 -1616    FHDTYP29   1617 -1617
      FHDMAN29   1618 -1619    FHDAGE29   1620 -1621
      FHDTYP30   1622 -1622    FHDMAN30   1623 -1624
      FHDAGE30   1625 -1626    FHDTYP31   1627 -1627


      /* NAI LOCATIONS */

      QOL        1628 -1628    QOLPH      1629 -1629
      QOLMH      1630 -1630    QOLSAR     1631 -1631
      COUSAR     1632 -1632    COEPA      1633 -1633
      BEP7D      1634 -1634    RF7D       1635 -1635
      RP7D       1636 -1637    CCBG10Y    1638 -1638
      WCCBGW     1639 -1639    RECUR      1640 -1640
      MRRYR      1641 -1644    TRETMRC1   1645 -1645
      TRETMRC2   1646 -1646    TRETMRC3   1647 -1647
      TRETMRC4   1648 -1648    TRETMRC5   1649 -1649
      TRETMRC6   1650 -1650    TRETMRC7   1651 -1651
      TMRCSPEC $ 1652 -1671    TRETBC     1672 -1672
      CIAT       1673 -1673    NFOC       1674 -1674
      TRETDOC    1675 -1675    FUADVEV    1676 -1676
      FUADVFMT   1677 -1677    HICT       1678 -1678
      HPCAEROP   1679 -1679    HPIDATT    1680 -1680
      HPMETESN   1681 -1681    ACDPCSG    1682 -1682
      MRNPCSG    1683 -1683    RCSGSPEC $ 1684 -1703
      DKPCSG     1704 -1704    CTRSCT     1705 -1705
      DHIBC      1706 -1706    CCFP       1707 -1707
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
      COMPSTAT   ="Record completion status"

      /* FID LABELS */

      R_MARITL   ="Marital Status"

      /* NAC LABELS */

      SPSPEAK    ="Language used most often"
      CEREALNO   =
"Freq eating hot or cold cereals during the past month: # of units"
      CEREALTP   =
"Freq eating hot or cold cereals during the past month: Time units"
      CERTYP     ="First kind of cereal eaten (name)"
      CERTYPN    ="First kind of cereal eaten (number)"
      CERTPSP    ="Other kind of first cereal mentioned"
      CERTYP2    ="Ate a second kind of cereal"
      CERTYP3    ="Second kind of cereal eaten (name)"
      CERTYP3N   ="Second kind of cereal eaten (number)"
      CERTP3SP   ="Other kind of second cereal mentioned"
      MILKNO     ="Freq drinking milk during the past month: # of units"
      MILKTP     ="Freq drinking milk during the past month: Time units"
      MILKTYP    ="Type of milk"
      SODANO     ="Freq drinking soda during the past month: # of units"
      SODATP     ="Freq drinking soda during the past month: Time units"
      FRJUICNO   ="Freq drinking fruit juice during the past month: # of units"
      FRJUICTP   ="Freq drinking fruit juice during the past month: Time units"
      COFFEENO   =
"Freq drinking coffee and tea during the past month: # of units"
      COFFEETP   =
"Freq drinking coffee and tea during the past month: Time units"
      SPORDRNO   =
"Freq drinking sports and energy drinks during the past month: # of units"
      SPORDRTP   =
"Freq drinking sports and energy drinks during the past month: Time units"
      FRTDRNO    =
"Freq drinking sweetened fruit drinks during the past month: # of units"
      FRTDRTP    =
"Freq drinking sweetened fruit drinks during the past month: Time units"
      FRUITNO    ="Freq eating fruit during the past month: # of units"
      FRUITTP    ="Freq eating fruit during the past month: Time units"
      SALADNO    =
"Freq eating a green leafy or lettuce salad during the past month: # of units"
      SALADTP    =
"Freq eating a green leafy or lettuce salad during the past month: Time units"
      FRIESNO    ="Freq eating fried potatoes during the past month: # of units"
      FRIESTP    ="Freq eating fried potatoes during the past month: Time units"
      POTATONO   =
"Freq eating other kinds of potatoes during the past month: # of units"
      POTATOTP   =
"Freq eating other kinds of potatoes during the past month: Time units"
      BEANSNO    ="Freq eating beans during the past month: # of units"
      BEANSTP    ="Freq eating beans during the past month: Time units"
      BRRICENO   =
"Freq eating brown rice or other cooked whole grains during the past month: # of
 units"
      BRRICETP   =
"Freq eating brown rice or other cooked whole grains during the past month: Time
 units"
      OVEGNO     =
"Freq eating other vegetables during the past month: # of units"
      OVEGTP     =
"Freq eating other vegetables during the past month: Time units"
      SALSANO    ="Freq eating salsa during the past month: # of units"
      SALSATP    ="Freq eating salsa during the past month: Time units"
      PIZZANO    ="Freq eating pizza during the past month: # of units"
      PIZZATP    ="Freq eating pizza during the past month: Time units"
      TOMSAUNO   ="Freq eating tomato sauces during the past month: # of units"
      TOMSAUTP   ="Freq eating tomato sauces during the past month: Time units"
      CHEESENO   ="Freq eating cheese during the past month: # of units"
      CHEESETP   ="Freq eating cheese during the past month: Time units"
      CHEESTYP   ="Freq eating light or low-fat cheese"
      REDMETNO   ="Freq eating red meat during the past month: # of units"
      REDMETTP   ="Freq eating red meat during the past month: Time units"
      PROMETNO   ="Freq eating processed meat during the past month: # of units"
      PROMETTP   ="Freq eating processed meat during the past month: Time units"
      BREADNO    =
"Freq eating whole grain bread during the past month: # of units"
      BREADTP    =
"Freq eating whole grain bread during the past month: Time units"
      CANDYNO    ="Freq eating candy during the past month: # of units"
      CANDYTP    ="Freq eating candy during the past month: Time units"
      DONUTNO    =
"Freq eating doughnuts, sweet rolls, Danish, muffins, or pop-tarts during the pa
st month: # of units"
      DONUTTP    =
"Freq eating doughnuts, sweet rolls, Danish, muffins, or pop-tarts during the pa
st month: Time units"
      COOKIENO   =
"Freq eating cookies, cake, pie, or brownies during the past month: # of units"
      COOKIETP   =
"Freq eating cookies, cake, pie, or brownies during the past month: Time units"
      ICECRNO    =
"Freq eating ice cream or other frozen desserts during the past month: # of unit
s"
      ICECRTP    =
"Freq eating ice cream or other frozen desserts during the past month: Time unit
s"
      POPCNNO    ="Freq eating popcorn during the past month: # of units"
      POPCNTP    ="Freq eating popcorn during the past month: Time units"
      VITMIN     ="Took vitamin or mineral supplements during the past month"
      VITMULT    ="Took any multi-vitamins during the past month"
      VITMULD    ="Number of days during past month took multi-vitamins"
      CALCA      ="Took calcium supplement during the past month"
      CALCD      ="Number of days during past month took calcium supplements"
      VITD       ="Took vitamin D pills or supplements during the past month"
      VITDM      ="Number of days during past month took vitamin D"
      VITDWHY    ="Main reason for taking vitamin D"
      VITDSPEC   ="Other reason for taking vitamin D"

      /* NAD LABELS */

      AD11A      ="Walk for transportation during past 7 days"
      AD12A      ="Number of times walking for transportation in past 7 days"
      AD13NO     ="Duration of walking for transportation: # of units"
      AD13TP     ="Duration of walking for transportation: Time unit"
      AD14A      ="Walk for leisure during past 7 days"
      AD15A      ="Number of times walking for leisure in past 7 days"
      AD16NO     ="Duration of walking for leisure: # of units"
      AD16TP     ="Duration of walking for leisure: Time unit"
      SITWDAY    ="Weekday hours per day sitting outside of work"
      SITWEND    ="Weekend hours per day sitting outside of work"
      MDEXER     ="MD recommends exercise/physical activity"

      /* NAE LABELS */

      MENTHOLF   ="Usual cigarette menthol/non-menthol 12m before quitting"
      NUMCIGA    ="Number of cigarettes smoked daily"
      NUMCVAR    ="Average number of cigarettes during longest period smoked"
      FQUITA_1   ="Use nicotine patch to stop smoking"
      FQUITA_2   ="Use nicotine gum or lozenge to stop smoking"
      FQUITA_3   =
"Use nicotine containing nasal spray or inhaler to stop smoking"
      FQUITA_4   ="Use Chantix or Varenicline to stop smoking"
      FQUITA_5   ="Use Zyban, Bupropion, or Wellbutrin to stop smoking"
      FQUITB_1   ="Use telephone help/quit line to stop smoking"
      FQUITB_2   ="Use one-on-one counseling to stop smoking"
      FQUITB_3   =
"Use a stop smoking clinic, class, or support group to stop smoking"
      MENTHOL    ="Usual cigarette brand menthol/non-menthol"
      CSQEV      ="Stopped smoking one day or longer"
      CQUITA_1   ="Use nicotine patch to try to quit smoking"
      CQUITA_2   ="Use nicotine gum or lozenge to try to quit smoking"
      CQUITA_3   =
"Use nicotine containing spray or inhaler to try to quit smoking"
      CQUITA_4   ="Use Chantix or Varenicline to try to quit smoking"
      CQUITA_5   ="Use Zyban, Bupropion, or Wellbutrin to try to quit smoking"
      CQUITB_1   ="Use telephone help/quit line to try to quit smoking"
      CQUITB_2   ="Use one-on-one counseling to try to quit smoking"
      CQUITB_3   =
"Use a stop smoking clinic, class, or support group to try to quit smoking"
      QWANT      ="Like to completely quit smoking"
      CIGEV1     ="Ever smoked a cigar"
      CIGEV50    ="Smoked at least 50 cigars"
      CIGCUR     ="Smoke cigar every day/some days/not at all"
      CIG30D     ="Number of days smoked cigar in past 30 days"
      SNUFFEV    ="Ever used snuff"
      SNUFEV20   ="Used snuff at least 20 times"
      SNUFFCUR   ="Use snuff every day/some days/not at all"
      SNUFF30D   ="Number of days used snuff in past 30 days"
      CHEWEV     ="Ever used chewing tobacco"
      CHEWEV20   ="Used chewing tobacco at least 20 times"
      CHEWCUR    ="Use chewing tobacco every day/some days/not at all"
      CHEW30D    ="Number of days used chewing tobacco in past 30 days"
      CHEWTYP    ="Brand of snuff/chewing tobacco used most often"
      CHTYPOTH   ="Other brand of snuff/chewing tobacco"
      MDTOB2     =
"Health professional advised quit smoking/using other kinds of tobacco"
      HPTOB21    ="MD advised quit smoking/using other kinds of tobacco"
      HPTOB22    ="Dentist advised quit smoking/using other kinds of tobacco"
      HPTOB23    ="Nurse advised quit smoking/using other kinds of tobacco"
      HPTOB24    =
"Dental Hygienist advised quit smoking/using other kinds of tobacco"
      HPTOB25    =
"Other health prof advised quit smoking/using other kinds of tobacco"
      HPTOTH     =
"Other health prof who advised quit smoking/using other kinds of tobacco"
      LIVINTRO   ="Residents smoke inside home"
      LIVSMOKE   ="Number of residents smoking inside home"
      LVDYSMOK   ="Number of days per week residents smoke inside home"
      LIVEBTH    ="Had live birth in past 5 years"
      SMKPREG    ="Smoking when became pregnant with last child"
      SMKLST     ="Smoke any time during pregnancy with last child"
      QUTWK      ="Quit smoking for 7+ days during pregnancy with last child"
      MTHQUIT    ="Month of pregnancy quit smoking for 7+ days"
      STSMOK     ="Start smoking again during pregnancy"

      /* NAF LABELS */

      SUN1HR     ="In sun 1 hr, effect on skin"
      SUNTAN     ="In sun a long time, effect on skin"
      SUN1_SHA   ="Stay in shade on warm sunny day"
      SUN1_CAP   ="Wear baseball cap/visor on warm sunny day"
      SUN_HAT1   ="Wear wide-brimmed hat on warm sunny day"
      SUN2_LGS   ="Wear long sleeved shirt on warm sunny day"
      SUN2_LGP   ="Wear long clothing to ankles on warm sunny day"
      SUN2_SCR   ="Use sunscreen on warm sunny day"
      SPF        ="SPF of sunscreen used most often"
      SPFSCALE   ="SPF number of usual sunscreen"
      NBURN      ="Number of times sunburned during past 12 months"
      SNONCE     ="Used indoor tanning device during past 12 months"
      SNNUM1     ="Number of times used tanning device during past 12 months"
      SKNX       ="Ever had skin cancer exam"
      RSKX1_MT   ="Month of most recent skin exam"
      RSKX1_YR   ="Year of most recent skin exam"
      RSKX1N     ="Time ago date of most recent skin exam: # of units"
      RSKX1T     ="Time ago date of most recent skin exam: Time unit"
      RSKX2      ="Most recent skin exam, time categories"
      RSKX3A     ="Most recent skin exam, time categories (using 2005 method)"
      RSKX3B     ="Most recent skin exam, time categories (using 2000 method)"
      SKINREAS   ="Main reason for most recent skin exam"
      MENSTAGE   ="Age at first menstrual cycle"
      MENSTILL   ="Still have menstrual cycles"
      MENLAST    ="Time of last menstrual cycle"
      BIRTHEV    ="Ever gave birth to live born infant"
      BIRTHNUM   ="Total number of live births"
      BIRTHAGE   ="Age when first child was born"
      BIRTHAG2   ="Year first child born"
      PAPHAD1    ="Ever had Pap smear/Pap test"
      PAPFRST1   ="Age when had first Pap test"
      PAP6YR1    ="Number of Pap tests, last 6 years"
      RPAP1_M1   ="Month of most recent Pap test"
      RPAP1_Y1   ="Year of most recent Pap test"
      RPAP1N1    ="Time ago date of most recent Pap test: # of units"
      RPAP1T1    ="Time ago date of most recent Pap test:  Time unit"
      RPAP21     ="Most recent Pap test, time categories"
      RPAP3A1    ="Most recent Pap test, time categories (using 2005 method)"
      RPAP3B1    ="Most recent Pap test, time categories (using 2000 method)"
      PAPREA1    ="Main reason for most recent Pap test"
      PRESULT    ="Got results of most recent Pap test"
      PAPABN3    ="Had abnormal Pap test results in last 3 years"
      PAPADDE1   ="Recommended to have more follow-up exams/tests"
      PAPTRT1    ="Followed recommendation to have more follow-up exams/tests"
      PNOTFOL    ="Reason did not have follow-up exams/tests"
      PAPNOT1    ="Reason why never had a Pap test or none in last 3 years"
      MDRECP1    ="Doctor recommended Pap test"
      PREMIND    ="Reminder from doctor to have Pap test would be helpful"
      HYST       ="Ever had a hysterectomy"
      RHYS1_MT   ="Month of hysterectomy"
      RHYS1_YR   ="Year of hysterectomy"
      RHYS1N     ="Time ago date of hysterectomy: # of units"
      RHYS1T     ="Time ago date of hysterectomy: Time unit"
      RHYS2      ="Date of hysterectomy, time categories"
      RHYST3A    ="Date of hysterectomy, time categories (using 2005 method)"
      RHYST3B    ="Date of hysterectomy, time categories (using 2000 method)"
      OVARIES    ="Had both ovaries removed"
      OVARAGE    ="Age when both ovaries were removed"
      HPVHRD     ="Ever heard of HPV"
      HPVHAD     ="Told by doctor you had HPV"
      SHHPVHRD   ="Ever heard of HPV vaccines or shots"
      SHTHPV     ="Ever received HPV shot/vaccine"
      SHHPVDOS   ="Number of HPV shots received"
      HPV_MT     ="Month of last HPV shot"
      HPV_YR     ="Year of last HPV shot"
      HPVN       ="Time ago date of last HPV shot: # of units"
      HPVT       ="Time ago date of last HPV shot: Time unit"
      HPV2       ="Date of last HPV shot, time categories"
      HPV3A      ="Date of last HPV shot, time categories (using 2005 method)"
      HPVINT     ="Interested in getting HPV vaccine"
      HPVNOT     ="Main reason would not get vaccine"
      HPVCOST    ="Get HPV vaccine if had to pay $360-$500"
      HPVLOCST   ="Get HPV vaccine if free/at much lower cost"
      MAMHAD     ="Ever had a mammogram"
      MAMAGE     ="Age at first mammogram, age categories"
      MAMREA     ="Main reason had first mammogram"
      MAM6YR     ="Number of mammograms in last 6 years"
      RMAM1_MT   ="Month of most recent mammogram"
      RMAM1_YR   ="Year of most recent mammogram"
      RMAM1N     ="Time ago date of most recent mammogram: # of units"
      RMAM1T     ="Time ago date of most recent mammogram: Time unit"
      RMAM2      ="Most recent mammogram, time categories"
      RMAM3A     ="Most recent mammogram, time categories (using 2005 method)"
      RMAM3B     ="Most recent mammogram, time categories (using 2000 method)"
      MAMREAS    ="Main reason for most recent mammogram"
      MAMABN1    ="Recommended to have more tests after most recent mammogram"
      MFOLLOW    ="Followed recommendation to have more tests"
      MNOTFOL    ="Reason did not have more tests"
      MAMMODE    ="Mode of previous question"
      MAMCAN1    ="Additional tests indicated cancer"
      MFOUND     ="How breast cancer was found"
      MFOUND2    ="Specify other way breast cancer was found"
      LUMPEV2    ="Had non-cancerous breast lump removed"
      LUMPNUM2   ="Total number of biopsies"
      MAMNOT     ="Reason why never had a mammogram or none in past 2 years"
      MDRECMAM   ="Doctor recommended mammogram"
      CBEHAD     ="Ever had a breast exam"
      RCBE1_MT   ="Month of most recent breast exam"
      RCBE1_YR   ="Year of most recent breast exam"
      RCBE1N     ="Time ago date of most recent breast exam: # of units"
      RCBE1T     ="Time ago date of most recent breast exam: Time unit"
      RCBE2      ="Most recent breast exam, time categories"
      RCBE3A     ="Most recent breast exam, time categories (using 2005 method)"
      RCBE3B     ="Most recent breast exam, time categories (using 2000 method)"
      MRIHAD     ="Ever had a breast MRI"
      MRI_MT     ="Month of most recent breast MRI"
      MRI_YR     ="Year of most recent breast MRI"
      MRIN       ="Time ago date of most recent breast MRI: # of units"
      MRIT       ="Time ago date of most recent breast MRI: Time unit"
      MRI2       ="Most recent breast MRI, time categories"
      MRI3A      ="Most recent breast MRI, time categories (using 2005 method)"
      MRIREA     ="Main reason for most recent breast MRI"
      CHESTX     ="Had a chest x-ray in last 12 months"
      CHESTREA   =
"Chest x-ray done in last 12 months for lung cancer/some other reason"
      CAT12      ="Had CAT scan or CT scan in last 12 months"
      CATCHEST   ="CAT scan done in last 12 months of chest area"
      CATLUNG    ="CAT scan done of chest area for lung cancer/some other reason
"
      ASPIRIN    ="Take Aspirin, Bayer, Bufferin, or Excedrin regularly"
      ASPIR3M    ="Have taken these medications regularly for last 3 months"
      ADVIL      =
"Take Advil, Ibuprofen, Motrin, Nuprin, Aleve, Naprosyn, Naproxen, or Celebrex r
egularly"
      ADVIL3M    ="Have taken these medications regularly for last 3 months"
      PROPECIA   ="Take Propecia, Proscar, or Finasteride regularly"
      PROPMTHS   =
"Have taken Propecia, Proscar, or Finasteride regularly for last 3 months"
      PROPREAS   ="Main reason for taking Propecia, Proscar or Finasteride"
      MEDHRT1    ="Currently taking HRT"
      HRTEVER    ="Ever taken HRT"
      HRTSTOP    ="Time since stopped using HRT"
      MEDTAMX1   ="Currently taking tamoxifen"
      TAMMAIN    ="Main reason taking tamoxifen"
      MEDRALX1   ="Currently taking raloxifene"
      RALXREAS   ="Main reason taking raloxifene"
      MEDBC1     ="Currently taking birth control pills, implants, shots"
      PSAREC     ="Doctor recommended a PSA test"
      PSAHAD     ="Ever had a PSA test"
      RPSA1_MT   ="Month of most recent PSA test"
      RPSA1_YR   ="Year of most recent PSA test"
      RPSA1N     ="Time ago date of most recent PSA test: # of units"
      RPSA1T     ="Time ago date of most recent PSA test: Time unit"
      RPSA2      ="Most recent PSA test, time categories"
      RPSA3A     ="Most recent PSA test, time categories (using 2005 method)"
      RPSA3B     ="Most recent PSA test, time categories (using 2000 method)"
      PSAREAS    ="Main reason for most recent PSA test"
      PSAAGE1    ="Age category at first PSA test"
      PSA5YR     ="Number of PSA tests in last 5 years"
      PSAADV     ="Doctor talked to you about advantages of PSA test"
      PSADISAV   ="Doctor talked to you about disadvantages of PSA test"
      PSAEXP     =
"Doctor told you some experts disagree about whether men should have PSA tests"
      COLHAD     ="Ever had a colonoscopy"
      COL_MT     ="Month of most recent colonoscopy"
      COL_YR     ="Year of most recent colonoscopy"
      COLN       ="Time ago date of most recent colonoscopy: # of units"
      COLT       ="Time ago date of most recent colonoscopy: Time unit"
      COL2       ="Most recent colonoscopy, time categories"
      COL3A      ="Most recent colonoscopy, time categories (using 2005 method)"
      COL3B      ="Most recent colonoscopy, time categories (using 2000 method)"
      COLREAS    ="Main reason for most recent colonoscopy"
      SIGHAD     ="Ever had a Sigmoidoscopy"
      SIG_MT     ="Month of most recent Sigmoidoscopy"
      SIG_YR     ="Year of most recent Sigmoidoscopy"
      SIGN       ="Time ago date of most recent Sigmoidoscopy: # of units"
      SIGT       ="Time ago date of most recent Sigmoidoscopy: Time unit"
      SIG2       ="Most recent Sigmoidoscopy, time categories"
      SIG3A      =
"Most recent Sigmoidoscopy, time categories (using 2005 method)"
      SIG3B      =
"Most recent Sigmoidoscopy, time categories (using 2000 method)"
      SIGREAS    ="Main reason for most recent Sigmoidoscopy"
      CTHEARD    ="Ever heard of CT colonography or virtual colonoscopy"
      CTHADEV    ="Ever had a CT colonography or virtual colonoscopy"
      CT_MT      ="Month of most recent CT colonography or virtual colonoscopy"
      CT_YR      ="Year of most recent CT colonography or virtual colonoscopy"
      CTN        =
"Time ago date of most recent CT colonography or virtual colonoscopy: # of units
"
      CTT        =
"Time ago date of most recent CT colonography or virtual colonoscopy: Time unit"
      CT2        =
"Most recent CT colonography or virtual colonoscopy, time categories"
      CT3A       =
"Most recent CT colonography or virtual colonoscopy, time categories (using 2005
 method)"
      CTREAS     =
"Main reason for most recent CT colonography or virtual colonoscopy"
      POLYP      ="Doctor told you that you had polyps, past 10 years"
      HFOBHAD    ="Had blood stool test using home test kit"
      RHFO1_MT   ="Month of most recent home blood stool test"
      RHFO1_YR   ="Year of most recent home blood stool test"
      RHFO1N     =
"Time ago date of most recent home blood stool test: # of units"
      RHFO1T     ="Time ago date of most recent home blood stool test: Time unit
"
      RHFO2      ="Most recent home blood stool test, time categories"
      RHFOB3A    =
"Most recent home blood stool test, time categories (using 2005 method)"
      RHFOB3B    =
"Most recent home blood stool test, time categories (using 2000 method)"
      HFOBREA1   ="Main reason for most recent home blood stool test"
      HFOBABN1   ="Had abnormal home blood stool test results"
      HFOBTST1   ="Another fecal occult blood test"
      HFOBTST2   ="Sigmoidoscopy"
      HFOBTST3   ="Colonoscopy"
      HFOBTST4   ="Barium enema"
      HFOBTST5   ="Surgery"
      HFOBTST0   ="No additional tests/surgery"
      HFONOTDO   =
"Given home blood stool test kit that was not completed and returned"
      FOBHAD     =
"Ever had blood stool test collected during doctor office visit"
      RFOB1_MT   ="Month of most recent office blood stool test"
      RFOB1_YR   ="Year of most recent office blood stool test"
      RFOB1N     =
"Time ago date of most recent office blood stool test: # of units"
      RFOB1T     =
"Time ago date of most recent office blood stool test: Time unit"
      RFOB2      ="Most recent office blood stool test, time categories"
      ROFOB3A    =
"Most recent office blood stool test, time categories (using 2005 method)"
      ROFOB3B    =
"Most recent office blood stool test, time categories (using 2000 method)"
      RFOBREAS   ="Main reason for most recent office blood stool test"
      COLPROB    =
"Doctor recommended you be tested for colon/rectum problems, past 12 months"
      COLTEST    ="Doctor recommended particular tests"
      COLKIND1   ="Recommended stool blood test/fecal occult blood test"
      COLKIND2   ="Recommended Sigmoidoscopy"
      COLKIND3   ="Recommended colonoscopy"
      COLKIND4   ="Recommended CT colonography/virtual colonoscopy"
      COLKIND5   ="Recommended other test"
      COLNOT     =
"Reason why never had/not recently had any test to look for colon/rectum problem
s"

      /* NAG LABELS */

      GTHEARD    ="Heard of genetic testing for cancer risk"
      GTPOSS     ="Discussed genetic test with MD"
      GTADVISE   ="Advised to have genetic test for cancer"
      GTGRISK    ="Had genetic test for cancer risk"
      GTBRE      ="Had genetic test for breast cancer risk"
      GTOVA      ="Had genetic test for ovarian cancer risk"
      GTCOL      ="Had genetic test for colon or rectal cancer risk"
      GTOTH      ="Had genetic test for other cancer risk"
      GTRSKOTH   ="Other genetic tests for cancer"
      GTRSK_MT   ="Month of last genetic test"
      GTRSK_YR   ="Year of last genetic test"
      GTRSKN     ="Time ago date of genetic test: # of units"
      GTRSKT     ="Time ago date of genetic test: Time unit"
      GTINSURE   ="Genetic testing affects health insurance"
      GTCCOM     ="Risk of cancer compared to average man/woman"
      GTCCLOM    ="Risk of colon/rectal cancer compared to average man/woman"
      GTCBOM     ="Risk of breast cancer compared to average woman"

      /* NAH LABELS */

      FHFCAN     ="Biological father ever have cancer"
      FHFTYP1    ="Father had bladder cancer"
      FHFAGE01   ="Father <50 when diagnosed with bladder cancer"
      FHFTYP2    ="Father had blood cancer"
      FHFAGE02   ="Father <50 when diagnosed with blood cancer"
      FHFTYP3    ="Father had bone cancer"
      FHFAGE03   ="Father <50 when diagnosed with bone cancer"
      FHFTYP4    ="Father had brain cancer"
      FHFAGE04   ="Father <50 when diagnosed with brain cancer"
      FHFTYP5    ="Father had breast cancer"
      FHFAGE05   ="Father <50 when diagnosed with breast cancer"
      FHFTYP7    ="Father had colon cancer"
      FHFAGE07   ="Father <50 when diagnosed with colon cancer"
      FHFTYP8    ="Father had esophageal cancer"
      FHFAGE08   ="Father <50 when diagnosed with esophageal cancer"
      FHFTYP9    ="Father had gall bladder cancer"
      FHFAGE09   ="Father <50 when diagnosed with gall bladder cancer"
      FHFTYP10   ="Father had kidney cancer"
      FHFAGE10   ="Father <50 when diagnosed with kidney cancer"
      FHFTYP11   ="Father had larynx-windpipe cancer"
      FHFAGE11   ="Father <50 when diagnosed with larynx-windpipe cancer"
      FHFTYP12   ="Father had leukemia"
      FHFAGE12   ="Father <50 when diagnosed with leukemia"
      FHFTYP13   ="Father had liver cancer"
      FHFAGE13   ="Father <50 when diagnosed with liver cancer"
      FHFTYP14   ="Father had lung cancer"
      FHFAGE14   ="Father <50 when diagnosed with lung cancer"
      FHFTYP15   ="Father had lymphoma"
      FHFAGE15   ="Father <50 when diagnosed with lymphoma"
      FHFTYP16   ="Father had melanoma"
      FHFAGE16   ="Father <50 when diagnosed with melanoma"
      FHFTYP17   ="Father had mouth/tongue/lip cancer"
      FHFAGE17   ="Father <50 when diagnosed with mouth/tongue/lip cancer"
      FHFTYP19   ="Father had pancreatic cancer"
      FHFAGE19   ="Father <50 when diagnosed with pancreatic cancer"
      FHFTYP20   ="Father had prostate cancer"
      FHFAGE20   ="Father <50 when diagnosed with prostate cancer"
      FHFTYP21   ="Father had rectal cancer"
      FHFAGE21   ="Father <50 when diagnosed with rectal cancer"
      FHFTYP22   ="Father had skin (non-melanoma) cancer"
      FHFAGE22   ="Father <50 when diagnosed with skin (non-melanoma) cancer"
      FHFTYP23   ="Father had skin (DK what kind) cancer"
      FHFAGE23   ="Father <50 when diagnosed with skin (DK what kind) cancer"
      FHFTYP24   ="Father had soft tissue (muscle or fat) cancer"
      FHFAGE24   =
"Father <50 when diagnosed with soft tissue (muscle or fat) cancer"
      FHFTYP25   ="Father had stomach cancer"
      FHFAGE25   ="Father <50 when diagnosed with stomach cancer"
      FHFTYP26   ="Father had testicular cancer"
      FHFAGE26   ="Father <50 when diagnosed with testicular cancer"
      FHFTYP27   ="Father had throat-pharynx cancer"
      FHFAGE27   ="Father <50 when diagnosed with throat-pharynx cancer"
      FHFTYP28   ="Father had thyroid cancer"
      FHFAGE28   ="Father <50 when diagnosed with thyroid cancer"
      FHFTYP30   ="Father had other kind of cancer"
      FHFAGE30   ="Father <50 when diagnosed with other kind of cancer"
      FHFTYP31   ="Father had more than 3 kinds of cancer"
      FHMCAN     ="Biological mother ever have cancer"
      FHMTYP1    ="Mother had bladder cancer"
      FHMAGE01   ="Mother <50 when diagnosed with bladder cancer"
      FHMTYP2    ="Mother had blood cancer"
      FHMAGE02   ="Mother <50 when diagnosed with blood cancer"
      FHMTYP3    ="Mother had bone cancer"
      FHMAGE03   ="Mother <50 when diagnosed with bone cancer"
      FHMTYP4    ="Mother had brain cancer"
      FHMAGE04   ="Mother <50 when diagnosed with brain cancer"
      FHMTYP5    ="Mother had breast cancer"
      FHMAGE05   ="Mother <50 when diagnosed with breast cancer"
      FHMTYP6    ="Mother had cervical cancer"
      FHMAGE06   ="Mother <50 when diagnosed with cervical cancer"
      FHMTYP7    ="Mother had colon cancer"
      FHMAGE07   ="Mother <50 when diagnosed with colon cancer"
      FHMTYP8    ="Mother had esophageal cancer"
      FHMAGE08   ="Mother <50 when diagnosed with esophageal cancer"
      FHMTYP9    ="Mother had gall bladder cancer"
      FHMAGE09   ="Mother <50 when diagnosed with gall bladder cancer"
      FHMTYP10   ="Mother had kidney cancer"
      FHMAGE10   ="Mother <50 when diagnosed with kidney cancer"
      FHMTYP11   ="Mother had larynx-windpipe cancer"
      FHMAGE11   ="Mother <50 when diagnosed with larynx-windpipe cancer"
      FHMTYP12   ="Mother had leukemia"
      FHMAGE12   ="Mother <50 when diagnosed with leukemia"
      FHMTYP13   ="Mother had liver cancer"
      FHMAGE13   ="Mother <50 when diagnosed with liver cancer"
      FHMTYP14   ="Mother had lung cancer"
      FHMAGE14   ="Mother <50 when diagnosed with lung cancer"
      FHMTYP15   ="Mother had lymphoma"
      FHMAGE15   ="Mother <50 when diagnosed with lymphoma"
      FHMTYP16   ="Mother had melanoma"
      FHMAGE16   ="Mother <50 when diagnosed with melanoma"
      FHMTYP17   ="Mother had mouth/tongue/lip cancer"
      FHMAGE17   ="Mother <50 when diagnosed with mouth/tongue/lip cancer"
      FHMTYP18   ="Mother had ovarian cancer"
      FHMAGE18   ="Mother <50 when diagnosed with ovarian cancer"
      FHMTYP19   ="Mother had pancreatic cancer"
      FHMAGE19   ="Mother <50 when diagnosed with pancreatic cancer"
      FHMTYP21   ="Mother had rectal cancer"
      FHMAGE21   ="Mother <50 when diagnosed with rectal cancer"
      FHMTYP22   ="Mother had skin (non-melanoma) cancer"
      FHMAGE22   ="Mother <50 when diagnosed with skin (non-melanoma) cancer"
      FHMTYP23   ="Mother had skin (DK what kind) cancer"
      FHMAGE23   ="Mother <50 when diagnosed with skin (DK what kind) cancer"
      FHMTYP24   ="Mother had soft tissue (muscle or fat) cancer"
      FHMAGE24   =
"Mother <50 when diagnosed with soft tissue (muscle or fat) cancer"
      FHMTYP25   ="Mother had stomach cancer"
      FHMAGE25   ="Mother <50 when diagnosed with stomach cancer"
      FHMTYP27   ="Mother had throat-pharynx cancer"
      FHMAGE27   ="Mother <50 when diagnosed with throat-pharynx cancer"
      FHMTYP28   ="Mother had thyroid cancer"
      FHMAGE28   ="Mother <50 when diagnosed with thyroid cancer"
      FHMTYP29   ="Mother had uterine cancer"
      FHMAGE29   ="Mother <50 when diagnosed with uterine cancer"
      FHMTYP30   ="Mother had other kind of cancer"
      FHMAGE30   ="Mother <50 when diagnosed with other kind of cancer"
      FHMTYP31   ="Mother had more than 3 kinds of cancer"
      FHBNUM     ="Number of full brothers"
      FHBCAN     ="Number of full brothers who ever had cancer"
      FHBTYP1    ="Brother/brothers had bladder cancer"
      FHBMAN01   ="Number of brothers diagnosed with bladder cancer"
      FHBAGE01   ="Number of brothers <50 when diagnosed with bladder cancer"
      FHBTYP2    ="Brother/brothers had blood cancer"
      FHBMAN02   ="Number of brothers diagnosed with blood cancer"
      FHBAGE02   ="Number of brothers <50 when diagnosed with blood cancer"
      FHBTYP3    ="Brother/brothers had bone cancer"
      FHBMAN03   ="Number of brothers diagnosed with bone cancer"
      FHBAGE03   ="Number of brothers <50 when diagnosed with bone cancer"
      FHBTYP4    ="Brother/brothers had brain cancer"
      FHBMAN04   ="Number of brothers diagnosed with brain cancer"
      FHBAGE04   ="Number of brothers <50 when diagnosed with brain cancer"
      FHBTYP5    ="Brother/brothers had breast cancer"
      FHBMAN05   ="Number of brothers diagnosed with breast cancer"
      FHBAGE05   ="Number of brothers <50 when diagnosed with breast cancer"
      FHBTYP7    ="Brother/brothers had colon cancer"
      FHBMAN07   ="Number of brothers diagnosed with colon cancer"
      FHBAGE07   ="Number of brothers <50 when diagnosed with colon cancer"
      FHBTYP8    ="Brother/brothers had esophageal cancer"
      FHBMAN08   ="Number of brothers diagnosed with esophageal cancer"
      FHBAGE08   ="Number of brothers <50 when diagnosed with esophageal cancer"
      FHBTYP9    ="Brother/brothers had gall bladder cancer"
      FHBMAN09   ="Number of brothers diagnosed with gall bladder cancer"
      FHBAGE09   =
"Number of brothers <50 when diagnosed with gall bladder cancer"
      FHBTYP10   ="Brother/brothers had kidney cancer"
      FHBMAN10   ="Number of brothers diagnosed with kidney cancer"
      FHBAGE10   ="Number of brothers <50 when diagnosed with kidney cancer"
      FHBTYP11   ="Brother/brothers had larynx-windpipe cancer"
      FHBMAN11   ="Number of brothers diagnosed with larynx-windpipe cancer"
      FHBAGE11   =
"Number of brothers <50 when diagnosed with larynx-windpipe cancer"
      FHBTYP12   ="Brother/brothers had leukemia"
      FHBMAN12   ="Number of brothers diagnosed with leukemia"
      FHBAGE12   ="Number of brothers <50 when diagnosed with leukemia"
      FHBTYP13   ="Brother/brothers had liver cancer"
      FHBMAN13   ="Number of brothers diagnosed with liver cancer"
      FHBAGE13   ="Number of brothers <50 when diagnosed with liver cancer"
      FHBTYP14   ="Brother/brothers had lung cancer"
      FHBMAN14   ="Number of brothers diagnosed with lung cancer"
      FHBAGE14   ="Number of brothers <50 when diagnosed with lung cancer"
      FHBTYP15   ="Brother/brothers had lymphoma"
      FHBMAN15   ="Number of brothers diagnosed with lymphoma"
      FHBAGE15   ="Number of brothers <50 when diagnosed with lymphoma"
      FHBTYP16   ="Brother/brothers had melanoma"
      FHBMAN16   ="Number of brothers diagnosed with melanoma"
      FHBAGE16   ="Number of brothers <50 when diagnosed with melanoma"
      FHBTYP17   ="Brother/brothers had mouth/tongue/lip cancer"
      FHBMAN17   ="Number of brothers diagnosed with mouth/tongue/lip cancer"
      FHBAGE17   =
"Number of brothers <50 when diagnosed with mouth/tongue/lip cancer"
      FHBTYP19   ="Brother/brothers had pancreatic cancer"
      FHBMAN19   ="Number of brothers diagnosed with pancreatic cancer"
      FHBAGE19   ="Number of brothers <50 when diagnosed with pancreatic cancer"
      FHBTYP20   ="Brother/brothers had prostate cancer"
      FHBMAN20   ="Number of brothers diagnosed with prostate cancer"
      FHBAGE20   ="Number of brothers <50 when diagnosed with prostate cancer"
      FHBTYP21   ="Brother/brothers had rectal cancer"
      FHBMAN21   ="Number of brothers diagnosed with rectal cancer"
      FHBAGE21   ="Number of brothers <50 when diagnosed with rectal cancer"
      FHBTYP22   ="Brother/brothers had skin (non-melanoma) cancer"
      FHBMAN22   ="Number of brothers diagnosed with skin (non-melanoma) cancer"
      FHBAGE22   =
"Number of brothers <50 when diagnosed with skin (non-melanoma) cancer"
      FHBTYP23   ="Brother/brothers had skin (DK what kind) cancer"
      FHBMAN23   ="Number of brothers diagnosed with skin (DK what kind) cancer"
      FHBAGE23   =
"Number of brothers <50 when diagnosed with skin (DK what kind) cancer"
      FHBTYP24   ="Brother/brothers had soft tissue (muscle or fat) cancer"
      FHBMAN24   =
"Number of brothers diagnosed with soft tissue (muscle or fat) cancer"
      FHBAGE24   =
"Number of brothers <50 when diagnosed with soft tissue (muscle or fat) cancer"
      FHBTYP25   ="Brother/brothers had stomach cancer"
      FHBMAN25   ="Number of brothers diagnosed with stomach cancer"
      FHBAGE25   ="Number of brothers <50 when diagnosed with stomach cancer"
      FHBTYP26   ="Brother/brothers had testicular cancer"
      FHBMAN26   ="Number of brothers diagnosed with testicular cancer"
      FHBAGE26   ="Number of brothers <50 when diagnosed with testicular cancer"
      FHBTYP27   ="Brother/brothers had throat-pharynx cancer"
      FHBMAN27   ="Number of brothers diagnosed with throat-pharynx cancer"
      FHBAGE27   =
"Number of brothers <50 when diagnosed with throat-pharynx cancer"
      FHBTYP28   ="Brother/brothers had thyroid cancer"
      FHBMAN28   ="Number of brothers diagnosed with thyroid cancer"
      FHBAGE28   ="Number of brothers <50 when diagnosed with thyroid cancer"
      FHBTYP30   ="Brother/brothers had other kind of cancer"
      FHBMAN30   ="Number of brothers diagnosed with other kind of cancer"
      FHBAGE30   =
"Number of brothers <50 when diagnosed with other kind of cancer"
      FHBTYP31   ="Brother/brothers had more than 3 kinds of cancer"
      FHSNUM     ="Number of full sisters"
      FHSCAN     ="Number of full sisters who ever had cancer"
      FHSTYP1    ="Sister/sisters had bladder cancer"
      FHSMAN01   ="Number of sisters diagnosed with bladder cancer"
      FHSAGE01   ="Number of sisters <50 when diagnosed with bladder cancer"
      FHSTYP2    ="Sister/sisters had blood cancer"
      FHSMAN02   ="Number of sisters diagnosed with blood cancer"
      FHSAGE02   ="Number of sisters <50 when diagnosed with blood cancer"
      FHSTYP3    ="Sister/sisters had bone cancer"
      FHSMAN03   ="Number of sisters diagnosed with bone cancer"
      FHSAGE03   ="Number of sisters <50 when diagnosed with bone cancer"
      FHSTYP4    ="Sister/sisters had brain cancer"
      FHSMAN04   ="Number of sisters diagnosed with brain cancer"
      FHSAGE04   ="Number of sisters <50 when diagnosed with brain cancer"
      FHSTYP5    ="Sister/sisters had breast cancer"
      FHSMAN05   ="Number of sisters diagnosed with breast cancer"
      FHSAGE05   ="Number of sisters <50 when diagnosed with breast cancer"
      FHSTYP6    ="Sister/sisters had cervical cancer"
      FHSMAN06   ="Number of sisters diagnosed with cervical cancer"
      FHSAGE06   ="Number of sisters <50 when diagnosed with cervical cancer"
      FHSTYP7    ="Sister/sisters had colon cancer"
      FHSMAN07   ="Number of sisters diagnosed with colon cancer"
      FHSAGE07   ="Number of sisters <50 when diagnosed with colon cancer"
      FHSTYP8    ="Sister/sisters had esophageal cancer"
      FHSMAN08   ="Number of sisters diagnosed with esophageal cancer"
      FHSAGE08   ="Number of sisters <50 when diagnosed with esophageal cancer"
      FHSTYP9    ="Sister/sisters had gall bladder cancer"
      FHSMAN09   ="Number of sisters diagnosed with gall bladder cancer"
      FHSAGE09   ="Number of sisters <50 when diagnosed with gall bladder cancer
"
      FHSTYP10   ="Sister/sisters had kidney cancer"
      FHSMAN10   ="Number of sisters diagnosed with kidney cancer"
      FHSAGE10   ="Number of sisters <50 when diagnosed with kidney cancer"
      FHSTYP11   ="Sister/sisters had larynx-windpipe cancer"
      FHSMAN11   ="Number of sisters diagnosed with larynx-windpipe cancer"
      FHSAGE11   =
"Number of sisters <50 when diagnosed with larynx-windpipe cancer"
      FHSTYP12   ="Sister/sisters had leukemia"
      FHSMAN12   ="Number of sisters diagnosed with leukemia"
      FHSAGE12   ="Number of sisters <50 when diagnosed with leukemia"
      FHSTYP13   ="Sister/sisters had liver cancer"
      FHSMAN13   ="Number of sisters diagnosed with liver cancer"
      FHSAGE13   ="Number of sisters <50 when diagnosed with liver cancer"
      FHSTYP14   ="Sister/sisters had lung cancer"
      FHSMAN14   ="Number of sisters diagnosed with lung cancer"
      FHSAGE14   ="Number of sisters <50 when diagnosed with lung cancer"
      FHSTYP15   ="Sister/sisters had lymphoma"
      FHSMAN15   ="Number of sisters diagnosed with lymphoma"
      FHSAGE15   ="Number of sisters <50 when diagnosed with lymphoma"
      FHSTYP16   ="Sister/sisters had melanoma"
      FHSMAN16   ="Number of sisters diagnosed with melanoma"
      FHSAGE16   ="Number of sisters <50 when diagnosed with melanoma"
      FHSTYP17   ="Sister/sisters had mouth/tongue/lip cancer"
      FHSMAN17   ="Number of sisters diagnosed with mouth/tongue/lip cancer"
      FHSAGE17   =
"Number of sisters <50 when diagnosed with mouth/tongue/lip cancer"
      FHSTYP18   ="Sister/sisters had ovarian cancer"
      FHSMAN18   ="Number of sisters diagnosed with ovarian cancer"
      FHSAGE18   ="Number of sisters <50 when diagnosed with ovarian cancer"
      FHSTYP19   ="Sister/sisters had pancreatic cancer"
      FHSMAN19   ="Number of sisters diagnosed with pancreatic cancer"
      FHSAGE19   ="Number of sisters <50 when diagnosed with pancreatic cancer"
      FHSTYP21   ="Sister/sisters had rectal cancer"
      FHSMAN21   ="Number of sisters diagnosed with rectal cancer"
      FHSAGE21   ="Number of sisters <50 when diagnosed with rectal cancer"
      FHSTYP22   ="Sister/sisters had skin (non-melanoma) cancer"
      FHSMAN22   ="Number of sisters diagnosed with skin (non-melanoma) cancer"
      FHSAGE22   =
"Number of sisters <50 when diagnosed with skin (non-melanoma) cancer"
      FHSTYP23   ="Sister/sisters had skin (DK what kind) cancer"
      FHSMAN23   ="Number of sisters diagnosed with skin (DK what kind) cancer"
      FHSAGE23   =
"Number of sisters <50 when diagnosed with skin (DK what kind) cancer"
      FHSTYP24   ="Sister/sisters had soft tissue (muscle or fat) cancer"
      FHSMAN24   =
"Number of sisters diagnosed with soft tissue (muscle or fat) cancer"
      FHSAGE24   =
"Number of sisters <50 when diagnosed with soft tissue (muscle or fat) cancer"
      FHSTYP25   ="Sister/sisters had stomach cancer"
      FHSMAN25   ="Number of sisters diagnosed with stomach cancer"
      FHSAGE25   ="Number of sisters <50 when diagnosed with stomach cancer"
      FHSTYP27   ="Sister/sisters had throat-pharynx cancer"
      FHSMAN27   ="Number of sisters diagnosed with throat-pharynx cancer"
      FHSAGE27   =
"Number of sisters <50 when diagnosed with throat-pharynx cancer"
      FHSTYP28   ="Sister/sisters had thyroid cancer"
      FHSMAN28   ="Number of sisters diagnosed with thyroid cancer"
      FHSAGE28   ="Number of sisters <50 when diagnosed with thyroid cancer"
      FHSTYP29   ="Sister/sisters had uterine cancer"
      FHSMAN29   ="Number of sisters diagnosed with uterine cancer"
      FHSAGE29   ="Number of sisters <50 when diagnosed with uterine cancer"
      FHSTYP30   ="Sister/sisters had other kind of cancer"
      FHSMAN30   ="Number of sisters diagnosed with other kind of cancer"
      FHSAGE30   =
"Number of sisters <50 when diagnosed with other kind of cancer"
      FHSTYP31   ="Sister/sisters had more than 3 kinds of cancer"
      FHNNUM     ="Number of biological sons"
      FHNCAN     ="Number of sons who ever had cancer"
      FHNTYP1    ="Son/sons had bladder cancer"
      FHNMAN01   ="Number of sons diagnosed with bladder cancer"
      FHNAGE01   ="Number of sons <50 when diagnosed with bladder cancer"
      FHNTYP2    ="Son/sons had blood cancer"
      FHNMAN02   ="Number of sons diagnosed with blood cancer"
      FHNAGE02   ="Number of sons <50 when diagnosed with blood cancer"
      FHNTYP3    ="Son/sons had bone cancer"
      FHNMAN03   ="Number of sons diagnosed with bone cancer"
      FHNAGE03   ="Number of sons <50 when diagnosed with bone cancer"
      FHNTYP4    ="Son/sons had brain cancer"
      FHNMAN04   ="Number of sons diagnosed with brain cancer"
      FHNAGE04   ="Number of sons <50 when diagnosed with brain cancer"
      FHNTYP5    ="Son/sons had breast cancer"
      FHNMAN05   ="Number of sons diagnosed with breast cancer"
      FHNAGE05   ="Number of sons <50 when diagnosed with breast cancer"
      FHNTYP7    ="Son/sons had colon cancer"
      FHNMAN07   ="Number of sons diagnosed with colon cancer"
      FHNAGE07   ="Number of sons <50 when diagnosed with colon cancer"
      FHNTYP8    ="Son/sons had esophageal cancer"
      FHNMAN08   ="Number of sons diagnosed with esophageal cancer"
      FHNAGE08   ="Number of sons <50 when diagnosed with esophageal cancer"
      FHNTYP9    ="Son/sons had gall bladder cancer"
      FHNMAN09   ="Number of sons diagnosed with gall bladder cancer"
      FHNAGE09   ="Number of sons <50 when diagnosed with gall bladder cancer"
      FHNTYP10   ="Son/sons had kidney cancer"
      FHNMAN10   ="Number of sons diagnosed with kidney cancer"
      FHNAGE10   ="Number of sons <50 when diagnosed with kidney cancer"
      FHNTYP11   ="Son/sons had larynx-windpipe cancer"
      FHNMAN11   ="Number of sons diagnosed with larynx-windpipe cancer"
      FHNAGE11   ="Number of sons <50 when diagnosed with larynx-windpipe cancer
"
      FHNTYP12   ="Son/sons had leukemia"
      FHNMAN12   ="Number of sons diagnosed with leukemia"
      FHNAGE12   ="Number of sons <50 when diagnosed with leukemia"
      FHNTYP13   ="Son/sons had liver cancer"
      FHNMAN13   ="Number of sons diagnosed with liver cancer"
      FHNAGE13   ="Number of sons <50 when diagnosed with liver cancer"
      FHNTYP14   ="Son/sons had lung cancer"
      FHNMAN14   ="Number of sons diagnosed with lung cancer"
      FHNAGE14   ="Number of sons <50 when diagnosed with lung cancer"
      FHNTYP15   ="Son/sons had lymphoma"
      FHNMAN15   ="Number of sons diagnosed with lymphoma"
      FHNAGE15   ="Number of sons <50 when diagnosed with lymphoma"
      FHNTYP16   ="Son/sons had melanoma"
      FHNMAN16   ="Number of sons diagnosed with melanoma"
      FHNAGE16   ="Number of sons <50 when diagnosed with melanoma"
      FHNTYP17   ="Son/sons had mouth/tongue/lip cancer"
      FHNMAN17   ="Number of sons diagnosed with mouth/tongue/lip cancer"
      FHNAGE17   =
"Number of sons <50 when diagnosed with mouth/tongue/lip cancer"
      FHNTYP19   ="Son/sons had pancreatic cancer"
      FHNMAN19   ="Number of sons diagnosed with pancreatic cancer"
      FHNAGE19   ="Number of sons <50 when diagnosed with pancreatic cancer"
      FHNTYP20   ="Son/sons had prostate cancer"
      FHNMAN20   ="Number of sons diagnosed with prostate cancer"
      FHNAGE20   ="Number of sons <50 when diagnosed with prostate cancer"
      FHNTYP21   ="Son/sons had rectal cancer"
      FHNMAN21   ="Number of sons diagnosed with rectal cancer"
      FHNAGE21   ="Number of sons <50 when diagnosed with rectal cancer"
      FHNTYP22   ="Son/sons had skin (non-melanoma) cancer"
      FHNMAN22   ="Number of sons diagnosed with skin (non-melanoma) cancer"
      FHNAGE22   =
"Number of sons <50 when diagnosed with skin (non-melanoma) cancer"
      FHNTYP23   ="Son/sons had skin (DK what kind) cancer"
      FHNMAN23   ="Number of sons diagnosed with skin (DK what kind) cancer"
      FHNAGE23   =
"Number of sons <50 when diagnosed with skin (DK what kind) cancer"
      FHNTYP24   ="Son/sons had soft tissue (muscle or fat) cancer"
      FHNMAN24   =
"Number of sons diagnosed with soft tissue (muscle or fat) cancer"
      FHNAGE24   =
"Number of sons <50 when diagnosed with soft tissue (muscle or fat) cancer"
      FHNTYP25   ="Son/sons had stomach cancer"
      FHNMAN25   ="Number of sons diagnosed with stomach cancer"
      FHNAGE25   ="Number of sons <50 when diagnosed with stomach cancer"
      FHNTYP26   ="Son/sons had testicular cancer"
      FHNMAN26   ="Number of sons diagnosed with testicular cancer"
      FHNAGE26   ="Number of sons <50 when diagnosed with testicular cancer"
      FHNTYP27   ="Son/sons had throat-pharynx cancer"
      FHNMAN27   ="Number of sons diagnosed with throat-pharynx cancer"
      FHNAGE27   ="Number of sons <50 when diagnosed with throat-pharynx cancer"
      FHNTYP28   ="Son/sons had thyroid cancer"
      FHNMAN28   ="Number of sons diagnosed with thyroid cancer"
      FHNAGE28   ="Number of sons <50 when diagnosed with thyroid cancer"
      FHNTYP30   ="Son/sons had other kind of cancer"
      FHNMAN30   ="Number of sons diagnosed with other kind of cancer"
      FHNAGE30   ="Number of sons <50 when diagnosed with other kind of cancer"
      FHNTYP31   ="Son/sons had more than 2 kinds of cancer"
      FHDNUM     ="Number of biological daughters"
      FHDCAN     ="Number of daughters who ever had cancer"
      FHDTYP1    ="Daughter/daughters had bladder cancer"
      FHDMAN01   ="Number of daughters diagnosed with bladder cancer"
      FHDAGE01   ="Number of daughters <50 when diagnosed with bladder cancer"
      FHDTYP2    ="Daughter/daughters had blood cancer"
      FHDMAN02   ="Number of daughters diagnosed with blood cancer"
      FHDAGE02   ="Number of daughters <50 when diagnosed with blood cancer"
      FHDTYP3    ="Daughter/daughters had bone cancer"
      FHDMAN03   ="Number of daughters diagnosed with bone cancer"
      FHDAGE03   ="Number of daughters <50 when diagnosed with bone cancer"
      FHDTYP4    ="Daughter/daughters had brain cancer"
      FHDMAN04   ="Number of daughters diagnosed with brain cancer"
      FHDAGE04   ="Number of daughters <50 when diagnosed with brain cancer"
      FHDTYP5    ="Daughter/daughters had breast cancer"
      FHDMAN05   ="Number of daughters diagnosed with breast cancer"
      FHDAGE05   ="Number of daughters <50 when diagnosed with breast cancer"
      FHDTYP6    ="Daughter/daughters had cervical cancer"
      FHDMAN06   ="Number of daughters diagnosed with cervical cancer"
      FHDAGE06   ="Number of daughters <50 when diagnosed with cervical cancer"
      FHDTYP7    ="Daughter/daughters had colon cancer"
      FHDMAN07   ="Number of daughters diagnosed with colon cancer"
      FHDAGE07   ="Number of daughters <50 when diagnosed with colon cancer"
      FHDTYP8    ="Daughter/daughters had esophageal cancer"
      FHDMAN08   ="Number of daughters diagnosed with esophageal cancer"
      FHDAGE08   ="Number of daughters <50 when diagnosed with esophageal cancer
"
      FHDTYP9    ="Daughter/daughters had gall bladder cancer"
      FHDMAN09   ="Number of daughters diagnosed with gall bladder cancer"
      FHDAGE09   =
"Number of daughters <50 when diagnosed with gall bladder cancer"
      FHDTYP10   ="Daughter/daughters had kidney cancer"
      FHDMAN10   ="Number of daughters diagnosed with kidney cancer"
      FHDAGE10   ="Number of daughters <50 when diagnosed with kidney cancer"
      FHDTYP11   ="Daughter/daughters had larynx-windpipe cancer"
      FHDMAN11   ="Number of daughters diagnosed with larynx-windpipe cancer"
      FHDAGE11   =
"Number of daughters <50 when diagnosed with larynx-windpipe cancer"
      FHDTYP12   ="Daughter/daughters had leukemia"
      FHDMAN12   ="Number of daughters diagnosed with leukemia"
      FHDAGE12   ="Number of daughters <50 when diagnosed with leukemia"
      FHDTYP13   ="Daughter/daughters had liver cancer"
      FHDMAN13   ="Number of daughters diagnosed with liver cancer"
      FHDAGE13   ="Number of daughters <50 when diagnosed with liver cancer"
      FHDTYP14   ="Daughter/daughters had lung cancer"
      FHDMAN14   ="Number of daughters diagnosed with lung cancer"
      FHDAGE14   ="Number of daughters <50 when diagnosed with lung cancer"
      FHDTYP15   ="Daughter/daughters had lymphoma"
      FHDMAN15   ="Number of daughters diagnosed with lymphoma"
      FHDAGE15   ="Number of daughters <50 when diagnosed with lymphoma"
      FHDTYP16   ="Daughter/daughters had melanoma"
      FHDMAN16   ="Number of daughters diagnosed with melanoma"
      FHDAGE16   ="Number of daughters <50 when diagnosed with melanoma"
      FHDTYP17   ="Daughter/daughters had mouth/tongue/lip cancer"
      FHDMAN17   ="Number of daughters diagnosed with mouth/tongue/lip cancer"
      FHDAGE17   =
"Number of daughters <50 when diagnosed with mouth/tongue/lip cancer"
      FHDTYP18   ="Daughter/daughters had ovarian cancer"
      FHDMAN18   ="Number of daughters diagnosed with ovarian cancer"
      FHDAGE18   ="Number of daughters <50 when diagnosed with ovarian cancer"
      FHDTYP19   ="Daughter/daughters had pancreatic cancer"
      FHDMAN19   ="Number of daughters diagnosed with pancreatic cancer"
      FHDAGE19   ="Number of daughters <50 when diagnosed with pancreatic cancer
"
      FHDTYP21   ="Daughter/daughters had rectal cancer"
      FHDMAN21   ="Number of daughters diagnosed with rectal cancer"
      FHDAGE21   ="Number of daughters <50 when diagnosed with rectal cancer"
      FHDTYP22   ="Daughter/daughters had skin (non-melanoma) cancer"
      FHDMAN22   ="Number of daughters diagnosed with skin (non-melanoma) cancer
"
      FHDAGE22   =
"Number of daughters <50 when diagnosed with skin (non-melanoma) cancer"
      FHDTYP23   ="Daughter/daughters had skin (DK what kind) cancer"
      FHDMAN23   ="Number of daughters diagnosed with skin (DK what kind) cancer
"
      FHDAGE23   =
"Number of daughters <50 when diagnosed with skin (DK what kind) cancer"
      FHDTYP24   ="Daughter/daughters had soft tissue (muscle or fat) cancer"
      FHDMAN24   =
"Number of daughters diagnosed with soft tissue (muscle or fat) cancer"
      FHDAGE24   =
"Number of daughters <50 when diagnosed with soft tissue (muscle or fat) cancer"
      FHDTYP25   ="Daughter/daughters had stomach cancer"
      FHDMAN25   ="Number of daughters diagnosed with stomach cancer"
      FHDAGE25   ="Number of daughters <50 when diagnosed with stomach cancer"
      FHDTYP27   ="Daughter/daughters had throat-pharynx cancer"
      FHDMAN27   ="Number of daughters diagnosed with throat-pharynx cancer"
      FHDAGE27   =
"Number of daughters <50 when diagnosed with throat-pharynx cancer"
      FHDTYP28   ="Daughter/daughters had thyroid cancer"
      FHDMAN28   ="Number of daughters diagnosed with thyroid cancer"
      FHDAGE28   ="Number of daughters <50 when diagnosed with thyroid cancer"
      FHDTYP29   ="Daughter/daughters had uterine cancer"
      FHDMAN29   ="Number of daughters diagnosed with uterine cancer"
      FHDAGE29   ="Number of daughters <50 when diagnosed with uterine cancer"
      FHDTYP30   ="Daughter/daughters had other kind of cancer"
      FHDMAN30   ="Number of daughters diagnosed with other kind of cancer"
      FHDAGE30   =
"Number of daughters <50 when diagnosed with other kind of cancer"
      FHDTYP31   ="Daughter/daughters had more than 2 kinds of cancer"

      /* NAI LABELS */

      QOL        ="Reported quality of life"
      QOLPH      ="Reported physical health status"
      QOLMH      ="Reported mental health status"
      QOLSAR     =
"Reported satisfaction with social activities and relationships"
      COUSAR     ="Rating of how well carry out social activities"
      COEPA      ="Ability to carry out everyday physical activities"
      BEP7D      ="How often bothered by emotional problems in past 7 days"
      RF7D       ="Average rating of fatigue in past 7 days"
      RP7D       ="Average rating of pain in past 7 days"
      CCBG10Y    ="Chance of cancer coming back/getting worse over next 10 years
"
      WCCBGW     ="How often worry cancer will come back/get worse"
      RECUR      ="Told cancer had come back"
      MRRYR      ="Year of most recent recurrence"
      TRETMRC1   ="Treatment for most recent cancer: Surgery to remove the tumor
"
      TRETMRC2   ="Treatment for most recent cancer: Radiation"
      TRETMRC3   ="Treatment for most recent cancer: Chemotherapy"
      TRETMRC4   ="Treatment for most recent cancer: Hormonal treatments"
      TRETMRC5   =
"Treatment for most recent cancer: Bone marrow or stem cell transplant"
      TRETMRC6   ="Treatment for most recent cancer: No treatment"
      TRETMRC7   ="Treatment for most recent cancer: Other"
      TMRCSPEC   ="Other specified treatment for most recent cancer"
      TRETBC     ="Received cancer treatment in the last 12 months"
      CIAT       ="Currently in active treatment"
      NFOC       ="Now cancer free"
      TRETDOC    =
"Received single written document describing all cancer treatments received"
      FUADVEV    =
"Received advice from a health care professional about routine cancer check-ups 
after completing cancer treatment"
      FUADVFMT   =
"Advice written down, printed on paper, or provided in an electronic format"
      HICT       =
"Had health insurance that paid for all/part of cancer treatment"
      HPCAEROP   =
"Health professional spoke about how cancer may affect emotions/relationships"
      HPIDATT    =
"Liked it if doctor initiated a discussion about how cancer may affect emotions/
relationships"
      HPMETESN   =
"Satisfaction with how well health professional met emotional/social needs relat
ed to cancer"
      ACDPCSG    =
"Received professional counseling/joined support group after cancer diagnosis"
      MRNPCSG    =
"Main reason did not get professional counseling/join support group"
      RCSGSPEC   =
"Other reason for not getting professional counseling/joining support group"
      DKPCSG     =
"Interested in receiving professional counseling/joining support group if known 
about it"
      CTRSCT     =
"Participated in research study/clinical trial as part of cancer treatment"
      DHIBC      ="Ever denied health/life insurance because of cancer"
      CCFP       ="Degree cancer caused financial problems"
   ;

   * ASSOCIATE VARIABLES WITH FORMAT VALUES;
   *    (PUT ASTERISK (*) BEFORE WORD "FORMAT"
        IN NEXT STATEMENT TO PREVENT FORMAT
        ASSOCIATIONS BEING STORED WITH DATA SET);
   FORMAT

      /* IDN FORMAT ASSOCIATIONS */

      RECTYPE   CAP001X.   SRVY_YR   CAP002X.   HHX       $GROUPC.
      INTV_QRT  CAP004X.   ASSIGNWK  CAP005X.   WTIA_SA   GROUPN.
      WTFA_SA   GROUPN.

      /* UCF FORMAT ASSOCIATIONS */

      REGION    CAP010X.

      /* HHC FORMAT ASSOCIATIONS */

      SEX       CAP013X.   HISPAN_I  CAP014X.   RACERPI2  CAP015X.
      MRACRPI2  CAP016X.   MRACBPI2  CAP017X.   AGE_P     CAP018X.
      COMPSTAT  CAP019X.

      /* FID FORMAT ASSOCIATIONS */

      R_MARITL  CAP020X.

      /* NAC FORMAT ASSOCIATIONS */

      SPSPEAK   CAP021X.   CEREALNO  CAP022X.   CEREALTP  CAP023X.
      CERTYP    $CAP024X.  CERTYPN   CAP025X.   CERTPSP   $CAP026X.
      CERTYP2   CAP027X.   CERTYP3   $CAP024X.  CERTYP3N  CAP025X.
      CERTP3SP  $CAP026X.  MILKNO    CAP022X.   MILKTP    CAP023X.
      MILKTYP   CAP033X.   SODANO    CAP022X.   SODATP    CAP023X.
      FRJUICNO  CAP022X.   FRJUICTP  CAP023X.   COFFEENO  CAP022X.
      COFFEETP  CAP023X.   SPORDRNO  CAP022X.   SPORDRTP  CAP023X.
      FRTDRNO   CAP022X.   FRTDRTP   CAP023X.   FRUITNO   CAP022X.
      FRUITTP   CAP023X.   SALADNO   CAP022X.   SALADTP   CAP023X.
      FRIESNO   CAP022X.   FRIESTP   CAP023X.   POTATONO  CAP022X.
      POTATOTP  CAP023X.   BEANSNO   CAP022X.   BEANSTP   CAP023X.
      BRRICENO  CAP022X.   BRRICETP  CAP023X.   OVEGNO    CAP022X.
      OVEGTP    CAP023X.   SALSANO   CAP022X.   SALSATP   CAP023X.
      PIZZANO   CAP022X.   PIZZATP   CAP023X.   TOMSAUNO  CAP022X.
      TOMSAUTP  CAP023X.   CHEESENO  CAP022X.   CHEESETP  CAP023X.
      CHEESTYP  CAP066X.   REDMETNO  CAP022X.   REDMETTP  CAP023X.
      PROMETNO  CAP022X.   PROMETTP  CAP023X.   BREADNO   CAP022X.
      BREADTP   CAP023X.   CANDYNO   CAP022X.   CANDYTP   CAP023X.
      DONUTNO   CAP022X.   DONUTTP   CAP023X.   COOKIENO  CAP022X.
      COOKIETP  CAP023X.   ICECRNO   CAP022X.   ICECRTP   CAP023X.
      POPCNNO   CAP022X.   POPCNTP   CAP023X.   VITMIN    CAP027X.
      VITMULT   CAP027X.   VITMULD   CAP085X.   CALCA     CAP027X.
      CALCD     CAP085X.   VITD      CAP027X.   VITDM     CAP085X.
      VITDWHY   CAP090X.   VITDSPEC  $CAP091X.

      /* NAD FORMAT ASSOCIATIONS */

      AD11A     CAP092X.   AD12A     CAP085X.   AD13NO    CAP025X.
      AD13TP    CAP095X.   AD14A     CAP027X.   AD15A     CAP085X.
      AD16NO    CAP025X.   AD16TP    CAP095X.   SITWDAY   CAP100X.
      SITWEND   CAP100X.   MDEXER    CAP102X.

      /* NAE FORMAT ASSOCIATIONS */

      MENTHOLF  CAP103X.   NUMCIGA   CAP104X.   NUMCVAR   CAP105X.
      FQUITA_1  CAP027X.   FQUITA_2  CAP027X.   FQUITA_3  CAP027X.
      FQUITA_4  CAP027X.   FQUITA_5  CAP027X.   FQUITB_1  CAP027X.
      FQUITB_2  CAP027X.   FQUITB_3  CAP027X.   MENTHOL   CAP103X.
      CSQEV     CAP027X.   CQUITA_1  CAP027X.   CQUITA_2  CAP027X.
      CQUITA_3  CAP027X.   CQUITA_4  CAP027X.   CQUITA_5  CAP027X.
      CQUITB_1  CAP027X.   CQUITB_2  CAP027X.   CQUITB_3  CAP027X.
      QWANT     CAP027X.   CIGEV1    CAP027X.   CIGEV50   CAP027X.
      CIGCUR    CAP127X.   CIG30D    CAP100X.   SNUFFEV   CAP027X.
      SNUFEV20  CAP027X.   SNUFFCUR  CAP127X.   SNUFF30D  CAP100X.
      CHEWEV    CAP027X.   CHEWEV20  CAP027X.   CHEWCUR   CAP127X.
      CHEW30D   CAP100X.   CHEWTYP   CAP137X.   CHTYPOTH  $CAP091X.
      MDTOB2    CAP027X.   HPTOB21   CAP140X.   HPTOB22   CAP140X.
      HPTOB23   CAP140X.   HPTOB24   CAP140X.   HPTOB25   CAP140X.
      HPTOTH    $CAP091X.  LIVINTRO  CAP027X.   LIVSMOKE  CAP147X.
      LVDYSMOK  CAP148X.   LIVEBTH   CAP027X.   SMKPREG   CAP027X.
      SMKLST    CAP027X.   QUTWK     CAP027X.   MTHQUIT   CAP153X.
      STSMOK    CAP154X.

      /* NAF FORMAT ASSOCIATIONS */

      SUN1HR    CAP155X.   SUNTAN    CAP156X.   SUN1_SHA  CAP157X.
      SUN1_CAP  CAP157X.   SUN_HAT1  CAP157X.   SUN2_LGS  CAP157X.
      SUN2_LGP  CAP157X.   SUN2_SCR  CAP157X.   SPF       CAP163X.
      SPFSCALE  CAP164X.   NBURN     CAP165X.   SNONCE    CAP027X.
      SNNUM1    CAP025X.   SKNX      CAP027X.   RSKX1_MT  CAP169X.
      RSKX1_YR  CAP170X.   RSKX1N    CAP171X.   RSKX1T    CAP172X.
      RSKX2     CAP173X.   RSKX3A    CAP174X.   RSKX3B    CAP174X.
      SKINREAS  CAP176X.   MENSTAGE  CAP177X.   MENSTILL  CAP027X.
      MENLAST   CAP179X.   BIRTHEV   CAP027X.   BIRTHNUM  CAP181X.
      BIRTHAGE  CAP085X.   BIRTHAG2  CAP183X.   PAPHAD1   CAP027X.
      PAPFRST1  CAP085X.   PAP6YR1   CAP186X.   RPAP1_M1  CAP169X.
      RPAP1_Y1  CAP170X.   RPAP1N1   CAP171X.   RPAP1T1   CAP172X.
      RPAP21    CAP173X.   RPAP3A1   CAP174X.   RPAP3B1   CAP174X.
      PAPREA1   CAP176X.   PRESULT   CAP195X.   PAPABN3   CAP027X.
      PAPADDE1  CAP027X.   PAPTRT1   CAP027X.   PNOTFOL   CAP199X.
      PAPNOT1   CAP200X.   MDRECP1   CAP102X.   PREMIND   CAP027X.
      HYST      CAP027X.   RHYS1_MT  CAP169X.   RHYS1_YR  CAP170X.
      RHYS1N    CAP171X.   RHYS1T    CAP172X.   RHYS2     CAP173X.
      RHYST3A   CAP173X.   RHYST3B   CAP173X.   OVARIES   CAP027X.
      OVARAGE   CAP025X.   HPVHRD    CAP027X.   HPVHAD    CAP027X.
      SHHPVHRD  CAP027X.   SHTHPV    CAP216X.   SHHPVDOS  CAP217X.
      HPV_MT    CAP169X.   HPV_YR    CAP170X.   HPVN      CAP171X.
      HPVT      CAP172X.   HPV2      CAP222X.   HPV3A     CAP222X.
      HPVINT    CAP027X.   HPVNOT    CAP225X.   HPVCOST   CAP027X.
      HPVLOCST  CAP027X.   MAMHAD    CAP027X.   MAMAGE    CAP229X.
      MAMREA    CAP230X.   MAM6YR    CAP186X.   RMAM1_MT  CAP169X.
      RMAM1_YR  CAP170X.   RMAM1N    CAP171X.   RMAM1T    CAP172X.
      RMAM2     CAP173X.   RMAM3A    CAP173X.   RMAM3B    CAP173X.
      MAMREAS   CAP176X.   MAMABN1   CAP027X.   MFOLLOW   CAP027X.
      MNOTFOL   CAP242X.   MAMMODE   CAP243X.   MAMCAN1   CAP027X.
      MFOUND    CAP245X.   MFOUND2   $CAP091X.  LUMPEV2   CAP247X.
      LUMPNUM2  CAP171X.   MAMNOT    CAP249X.   MDRECMAM  CAP102X.
      CBEHAD    CAP027X.   RCBE1_MT  CAP169X.   RCBE1_YR  CAP170X.
      RCBE1N    CAP171X.   RCBE1T    CAP172X.   RCBE2     CAP173X.
      RCBE3A    CAP173X.   RCBE3B    CAP173X.   MRIHAD    CAP027X.
      MRI_MT    CAP169X.   MRI_YR    CAP170X.   MRIN      CAP171X.
      MRIT      CAP172X.   MRI2      CAP173X.   MRI3A     CAP173X.
      MRIREA    CAP266X.   CHESTX    CAP027X.   CHESTREA  CAP268X.
      CAT12     CAP027X.   CATCHEST  CAP270X.   CATLUNG   CAP268X.
      ASPIRIN   CAP027X.   ASPIR3M   CAP027X.   ADVIL     CAP027X.
      ADVIL3M   CAP027X.   PROPECIA  CAP027X.   PROPMTHS  CAP027X.
      PROPREAS  CAP278X.   MEDHRT1   CAP027X.   HRTEVER   CAP027X.
      HRTSTOP   CAP281X.   MEDTAMX1  CAP027X.   TAMMAIN   CAP283X.
      MEDRALX1  CAP027X.   RALXREAS  CAP285X.   MEDBC1    CAP027X.
      PSAREC    CAP027X.   PSAHAD    CAP027X.   RPSA1_MT  CAP169X.
      RPSA1_YR  CAP170X.   RPSA1N    CAP171X.   RPSA1T    CAP172X.
      RPSA2     CAP173X.   RPSA3A    CAP173X.   RPSA3B    CAP173X.
      PSAREAS   CAP176X.   PSAAGE1   CAP297X.   PSA5YR    CAP186X.
      PSAADV    CAP027X.   PSADISAV  CAP027X.   PSAEXP    CAP027X.
      COLHAD    CAP027X.   COL_MT    CAP169X.   COL_YR    CAP170X.
      COLN      CAP171X.   COLT      CAP172X.   COL2      CAP307X.
      COL3A     CAP307X.   COL3B     CAP307X.   COLREAS   CAP310X.
      SIGHAD    CAP027X.   SIG_MT    CAP169X.   SIG_YR    CAP170X.
      SIGN      CAP171X.   SIGT      CAP172X.   SIG2      CAP307X.
      SIG3A     CAP307X.   SIG3B     CAP307X.   SIGREAS   CAP310X.
      CTHEARD   CAP027X.   CTHADEV   CAP027X.   CT_MT     CAP169X.
      CT_YR     CAP170X.   CTN       CAP171X.   CTT       CAP172X.
      CT2       CAP307X.   CT3A      CAP307X.   CTREAS    CAP328X.
      POLYP     CAP027X.   HFOBHAD   CAP027X.   RHFO1_MT  CAP169X.
      RHFO1_YR  CAP170X.   RHFO1N    CAP171X.   RHFO1T    CAP172X.
      RHFO2     CAP307X.   RHFOB3A   CAP307X.   RHFOB3B   CAP307X.
      HFOBREA1  CAP176X.   HFOBABN1  CAP027X.   HFOBTST1  CAP140X.
      HFOBTST2  CAP140X.   HFOBTST3  CAP140X.   HFOBTST4  CAP140X.
      HFOBTST5  CAP140X.   HFOBTST0  CAP140X.   HFONOTDO  CAP027X.
      FOBHAD    CAP027X.   RFOB1_MT  CAP169X.   RFOB1_YR  CAP170X.
      RFOB1N    CAP171X.   RFOB1T    CAP172X.   RFOB2     CAP307X.
      ROFOB3A   CAP353X.   ROFOB3B   CAP353X.   RFOBREAS  CAP176X.
      COLPROB   CAP027X.   COLTEST   CAP027X.   COLKIND1  CAP358X.
      COLKIND2  CAP358X.   COLKIND3  CAP358X.   COLKIND4  CAP358X.
      COLKIND5  CAP358X.   COLNOT    CAP363X.

      /* NAG FORMAT ASSOCIATIONS */

      GTHEARD   CAP027X.   GTPOSS    CAP027X.   GTADVISE  CAP027X.
      GTGRISK   CAP027X.   GTBRE     CAP027X.   GTOVA     CAP027X.
      GTCOL     CAP027X.   GTOTH     CAP027X.   GTRSKOTH  $CAP091X.
      GTRSK_MT  CAP169X.   GTRSK_YR  CAP170X.   GTRSKN    CAP171X.
      GTRSKT    CAP172X.   GTINSURE  CAP027X.   GTCCOM    CAP378X.
      GTCCLOM   CAP379X.   GTCBOM    CAP380X.

      /* NAH FORMAT ASSOCIATIONS */

      FHFCAN    CAP381X.   FHFTYP1   CAP140X.   FHFAGE01  CAP027X.
      FHFTYP2   CAP140X.   FHFAGE02  CAP027X.   FHFTYP3   CAP140X.
      FHFAGE03  CAP027X.   FHFTYP4   CAP140X.   FHFAGE04  CAP027X.
      FHFTYP5   CAP140X.   FHFAGE05  CAP027X.   FHFTYP7   CAP140X.
      FHFAGE07  CAP027X.   FHFTYP8   CAP140X.   FHFAGE08  CAP027X.
      FHFTYP9   CAP140X.   FHFAGE09  CAP027X.   FHFTYP10  CAP140X.
      FHFAGE10  CAP027X.   FHFTYP11  CAP140X.   FHFAGE11  CAP027X.
      FHFTYP12  CAP140X.   FHFAGE12  CAP027X.   FHFTYP13  CAP140X.
      FHFAGE13  CAP027X.   FHFTYP14  CAP140X.   FHFAGE14  CAP027X.
      FHFTYP15  CAP140X.   FHFAGE15  CAP027X.   FHFTYP16  CAP140X.
      FHFAGE16  CAP027X.   FHFTYP17  CAP140X.   FHFAGE17  CAP027X.
      FHFTYP19  CAP140X.   FHFAGE19  CAP027X.   FHFTYP20  CAP140X.
      FHFAGE20  CAP027X.   FHFTYP21  CAP140X.   FHFAGE21  CAP027X.
      FHFTYP22  CAP140X.   FHFAGE22  CAP027X.   FHFTYP23  CAP140X.
      FHFAGE23  CAP027X.   FHFTYP24  CAP140X.   FHFAGE24  CAP027X.
      FHFTYP25  CAP140X.   FHFAGE25  CAP027X.   FHFTYP26  CAP140X.
      FHFAGE26  CAP027X.   FHFTYP27  CAP140X.   FHFAGE27  CAP027X.
      FHFTYP28  CAP140X.   FHFAGE28  CAP027X.   FHFTYP30  CAP140X.
      FHFAGE30  CAP027X.   FHFTYP31  CAP140X.   FHMCAN    CAP437X.
      FHMTYP1   CAP140X.   FHMAGE01  CAP027X.   FHMTYP2   CAP140X.
      FHMAGE02  CAP027X.   FHMTYP3   CAP140X.   FHMAGE03  CAP027X.
      FHMTYP4   CAP140X.   FHMAGE04  CAP027X.   FHMTYP5   CAP140X.
      FHMAGE05  CAP027X.   FHMTYP6   CAP140X.   FHMAGE06  CAP027X.
      FHMTYP7   CAP140X.   FHMAGE07  CAP027X.   FHMTYP8   CAP140X.
      FHMAGE08  CAP027X.   FHMTYP9   CAP140X.   FHMAGE09  CAP027X.
      FHMTYP10  CAP140X.   FHMAGE10  CAP027X.   FHMTYP11  CAP140X.
      FHMAGE11  CAP027X.   FHMTYP12  CAP140X.   FHMAGE12  CAP027X.
      FHMTYP13  CAP140X.   FHMAGE13  CAP027X.   FHMTYP14  CAP140X.
      FHMAGE14  CAP027X.   FHMTYP15  CAP140X.   FHMAGE15  CAP027X.
      FHMTYP16  CAP140X.   FHMAGE16  CAP027X.   FHMTYP17  CAP140X.
      FHMAGE17  CAP027X.   FHMTYP18  CAP140X.   FHMAGE18  CAP027X.
      FHMTYP19  CAP140X.   FHMAGE19  CAP027X.   FHMTYP21  CAP140X.
      FHMAGE21  CAP027X.   FHMTYP22  CAP140X.   FHMAGE22  CAP027X.
      FHMTYP23  CAP140X.   FHMAGE23  CAP027X.   FHMTYP24  CAP140X.
      FHMAGE24  CAP027X.   FHMTYP25  CAP140X.   FHMAGE25  CAP027X.
      FHMTYP27  CAP140X.   FHMAGE27  CAP027X.   FHMTYP28  CAP140X.
      FHMAGE28  CAP027X.   FHMTYP29  CAP140X.   FHMAGE29  CAP027X.
      FHMTYP30  CAP140X.   FHMAGE30  CAP027X.   FHMTYP31  CAP140X.
      FHBNUM    CAP495X.   FHBCAN    CAP495X.   FHBTYP1   CAP140X.
      FHBMAN01  CAP498X.   FHBAGE01  CAP495X.   FHBTYP2   CAP140X.
      FHBMAN02  CAP498X.   FHBAGE02  CAP495X.   FHBTYP3   CAP140X.
      FHBMAN03  CAP498X.   FHBAGE03  CAP495X.   FHBTYP4   CAP140X.
      FHBMAN04  CAP498X.   FHBAGE04  CAP495X.   FHBTYP5   CAP140X.
      FHBMAN05  CAP498X.   FHBAGE05  CAP495X.   FHBTYP7   CAP140X.
      FHBMAN07  CAP498X.   FHBAGE07  CAP495X.   FHBTYP8   CAP140X.
      FHBMAN08  CAP498X.   FHBAGE08  CAP495X.   FHBTYP9   CAP140X.
      FHBMAN09  CAP498X.   FHBAGE09  CAP495X.   FHBTYP10  CAP140X.
      FHBMAN10  CAP498X.   FHBAGE10  CAP495X.   FHBTYP11  CAP140X.
      FHBMAN11  CAP498X.   FHBAGE11  CAP495X.   FHBTYP12  CAP140X.
      FHBMAN12  CAP498X.   FHBAGE12  CAP495X.   FHBTYP13  CAP140X.
      FHBMAN13  CAP498X.   FHBAGE13  CAP495X.   FHBTYP14  CAP140X.
      FHBMAN14  CAP498X.   FHBAGE14  CAP495X.   FHBTYP15  CAP140X.
      FHBMAN15  CAP498X.   FHBAGE15  CAP495X.   FHBTYP16  CAP140X.
      FHBMAN16  CAP498X.   FHBAGE16  CAP495X.   FHBTYP17  CAP140X.
      FHBMAN17  CAP498X.   FHBAGE17  CAP495X.   FHBTYP19  CAP140X.
      FHBMAN19  CAP498X.   FHBAGE19  CAP495X.   FHBTYP20  CAP140X.
      FHBMAN20  CAP498X.   FHBAGE20  CAP495X.   FHBTYP21  CAP140X.
      FHBMAN21  CAP498X.   FHBAGE21  CAP495X.   FHBTYP22  CAP140X.
      FHBMAN22  CAP498X.   FHBAGE22  CAP495X.   FHBTYP23  CAP140X.
      FHBMAN23  CAP498X.   FHBAGE23  CAP495X.   FHBTYP24  CAP140X.
      FHBMAN24  CAP498X.   FHBAGE24  CAP495X.   FHBTYP25  CAP140X.
      FHBMAN25  CAP498X.   FHBAGE25  CAP495X.   FHBTYP26  CAP140X.
      FHBMAN26  CAP498X.   FHBAGE26  CAP495X.   FHBTYP27  CAP140X.
      FHBMAN27  CAP498X.   FHBAGE27  CAP495X.   FHBTYP28  CAP140X.
      FHBMAN28  CAP498X.   FHBAGE28  CAP495X.   FHBTYP30  CAP140X.
      FHBMAN30  CAP498X.   FHBAGE30  CAP495X.   FHBTYP31  CAP140X.
      FHSNUM    CAP495X.   FHSCAN    CAP495X.   FHSTYP1   CAP140X.
      FHSMAN01  CAP498X.   FHSAGE01  CAP495X.   FHSTYP2   CAP140X.
      FHSMAN02  CAP498X.   FHSAGE02  CAP495X.   FHSTYP3   CAP140X.
      FHSMAN03  CAP498X.   FHSAGE03  CAP495X.   FHSTYP4   CAP140X.
      FHSMAN04  CAP498X.   FHSAGE04  CAP495X.   FHSTYP5   CAP140X.
      FHSMAN05  CAP498X.   FHSAGE05  CAP495X.   FHSTYP6   CAP140X.
      FHSMAN06  CAP498X.   FHSAGE06  CAP495X.   FHSTYP7   CAP140X.
      FHSMAN07  CAP498X.   FHSAGE07  CAP495X.   FHSTYP8   CAP140X.
      FHSMAN08  CAP498X.   FHSAGE08  CAP495X.   FHSTYP9   CAP140X.
      FHSMAN09  CAP498X.   FHSAGE09  CAP495X.   FHSTYP10  CAP140X.
      FHSMAN10  CAP498X.   FHSAGE10  CAP495X.   FHSTYP11  CAP140X.
      FHSMAN11  CAP498X.   FHSAGE11  CAP495X.   FHSTYP12  CAP140X.
      FHSMAN12  CAP498X.   FHSAGE12  CAP495X.   FHSTYP13  CAP140X.
      FHSMAN13  CAP498X.   FHSAGE13  CAP495X.   FHSTYP14  CAP140X.
      FHSMAN14  CAP498X.   FHSAGE14  CAP495X.   FHSTYP15  CAP140X.
      FHSMAN15  CAP498X.   FHSAGE15  CAP495X.   FHSTYP16  CAP140X.
      FHSMAN16  CAP498X.   FHSAGE16  CAP495X.   FHSTYP17  CAP140X.
      FHSMAN17  CAP498X.   FHSAGE17  CAP495X.   FHSTYP18  CAP140X.
      FHSMAN18  CAP498X.   FHSAGE18  CAP495X.   FHSTYP19  CAP140X.
      FHSMAN19  CAP498X.   FHSAGE19  CAP495X.   FHSTYP21  CAP140X.
      FHSMAN21  CAP498X.   FHSAGE21  CAP495X.   FHSTYP22  CAP140X.
      FHSMAN22  CAP498X.   FHSAGE22  CAP495X.   FHSTYP23  CAP140X.
      FHSMAN23  CAP498X.   FHSAGE23  CAP495X.   FHSTYP24  CAP140X.
      FHSMAN24  CAP498X.   FHSAGE24  CAP495X.   FHSTYP25  CAP140X.
      FHSMAN25  CAP498X.   FHSAGE25  CAP495X.   FHSTYP27  CAP140X.
      FHSMAN27  CAP498X.   FHSAGE27  CAP495X.   FHSTYP28  CAP140X.
      FHSMAN28  CAP498X.   FHSAGE28  CAP495X.   FHSTYP29  CAP140X.
      FHSMAN29  CAP498X.   FHSAGE29  CAP495X.   FHSTYP30  CAP140X.
      FHSMAN30  CAP498X.   FHSAGE30  CAP495X.   FHSTYP31  CAP140X.
      FHNNUM    CAP666X.   FHNCAN    CAP495X.   FHNTYP1   CAP140X.
      FHNMAN01  CAP498X.   FHNAGE01  CAP495X.   FHNTYP2   CAP140X.
      FHNMAN02  CAP498X.   FHNAGE02  CAP495X.   FHNTYP3   CAP140X.
      FHNMAN03  CAP498X.   FHNAGE03  CAP495X.   FHNTYP4   CAP140X.
      FHNMAN04  CAP498X.   FHNAGE04  CAP495X.   FHNTYP5   CAP140X.
      FHNMAN05  CAP498X.   FHNAGE05  CAP495X.   FHNTYP7   CAP140X.
      FHNMAN07  CAP498X.   FHNAGE07  CAP495X.   FHNTYP8   CAP140X.
      FHNMAN08  CAP498X.   FHNAGE08  CAP495X.   FHNTYP9   CAP140X.
      FHNMAN09  CAP498X.   FHNAGE09  CAP495X.   FHNTYP10  CAP140X.
      FHNMAN10  CAP498X.   FHNAGE10  CAP495X.   FHNTYP11  CAP140X.
      FHNMAN11  CAP498X.   FHNAGE11  CAP495X.   FHNTYP12  CAP140X.
      FHNMAN12  CAP498X.   FHNAGE12  CAP495X.   FHNTYP13  CAP140X.
      FHNMAN13  CAP498X.   FHNAGE13  CAP495X.   FHNTYP14  CAP140X.
      FHNMAN14  CAP498X.   FHNAGE14  CAP495X.   FHNTYP15  CAP140X.
      FHNMAN15  CAP498X.   FHNAGE15  CAP495X.   FHNTYP16  CAP140X.
      FHNMAN16  CAP498X.   FHNAGE16  CAP495X.   FHNTYP17  CAP140X.
      FHNMAN17  CAP498X.   FHNAGE17  CAP495X.   FHNTYP19  CAP140X.
      FHNMAN19  CAP498X.   FHNAGE19  CAP495X.   FHNTYP20  CAP140X.
      FHNMAN20  CAP498X.   FHNAGE20  CAP495X.   FHNTYP21  CAP140X.
      FHNMAN21  CAP498X.   FHNAGE21  CAP495X.   FHNTYP22  CAP140X.
      FHNMAN22  CAP498X.   FHNAGE22  CAP495X.   FHNTYP23  CAP140X.
      FHNMAN23  CAP498X.   FHNAGE23  CAP495X.   FHNTYP24  CAP140X.
      FHNMAN24  CAP498X.   FHNAGE24  CAP495X.   FHNTYP25  CAP140X.
      FHNMAN25  CAP498X.   FHNAGE25  CAP495X.   FHNTYP26  CAP140X.
      FHNMAN26  CAP498X.   FHNAGE26  CAP495X.   FHNTYP27  CAP140X.
      FHNMAN27  CAP498X.   FHNAGE27  CAP495X.   FHNTYP28  CAP140X.
      FHNMAN28  CAP498X.   FHNAGE28  CAP495X.   FHNTYP30  CAP140X.
      FHNMAN30  CAP498X.   FHNAGE30  CAP495X.   FHNTYP31  CAP140X.
      FHDNUM    CAP495X.   FHDCAN    CAP495X.   FHDTYP1   CAP140X.
      FHDMAN01  CAP498X.   FHDAGE01  CAP495X.   FHDTYP2   CAP140X.
      FHDMAN02  CAP498X.   FHDAGE02  CAP495X.   FHDTYP3   CAP140X.
      FHDMAN03  CAP498X.   FHDAGE03  CAP495X.   FHDTYP4   CAP140X.
      FHDMAN04  CAP498X.   FHDAGE04  CAP495X.   FHDTYP5   CAP140X.
      FHDMAN05  CAP498X.   FHDAGE05  CAP495X.   FHDTYP6   CAP140X.
      FHDMAN06  CAP498X.   FHDAGE06  CAP495X.   FHDTYP7   CAP140X.
      FHDMAN07  CAP498X.   FHDAGE07  CAP495X.   FHDTYP8   CAP140X.
      FHDMAN08  CAP498X.   FHDAGE08  CAP495X.   FHDTYP9   CAP140X.
      FHDMAN09  CAP498X.   FHDAGE09  CAP495X.   FHDTYP10  CAP140X.
      FHDMAN10  CAP498X.   FHDAGE10  CAP495X.   FHDTYP11  CAP140X.
      FHDMAN11  CAP498X.   FHDAGE11  CAP495X.   FHDTYP12  CAP140X.
      FHDMAN12  CAP498X.   FHDAGE12  CAP495X.   FHDTYP13  CAP140X.
      FHDMAN13  CAP498X.   FHDAGE13  CAP495X.   FHDTYP14  CAP140X.
      FHDMAN14  CAP498X.   FHDAGE14  CAP495X.   FHDTYP15  CAP140X.
      FHDMAN15  CAP498X.   FHDAGE15  CAP495X.   FHDTYP16  CAP140X.
      FHDMAN16  CAP498X.   FHDAGE16  CAP495X.   FHDTYP17  CAP140X.
      FHDMAN17  CAP498X.   FHDAGE17  CAP495X.   FHDTYP18  CAP140X.
      FHDMAN18  CAP498X.   FHDAGE18  CAP495X.   FHDTYP19  CAP140X.
      FHDMAN19  CAP498X.   FHDAGE19  CAP495X.   FHDTYP21  CAP140X.
      FHDMAN21  CAP498X.   FHDAGE21  CAP495X.   FHDTYP22  CAP140X.
      FHDMAN22  CAP498X.   FHDAGE22  CAP495X.   FHDTYP23  CAP140X.
      FHDMAN23  CAP498X.   FHDAGE23  CAP495X.   FHDTYP24  CAP140X.
      FHDMAN24  CAP498X.   FHDAGE24  CAP495X.   FHDTYP25  CAP140X.
      FHDMAN25  CAP498X.   FHDAGE25  CAP495X.   FHDTYP27  CAP140X.
      FHDMAN27  CAP498X.   FHDAGE27  CAP495X.   FHDTYP28  CAP140X.
      FHDMAN28  CAP498X.   FHDAGE28  CAP495X.   FHDTYP29  CAP140X.
      FHDMAN29  CAP498X.   FHDAGE29  CAP495X.   FHDTYP30  CAP140X.
      FHDMAN30  CAP498X.   FHDAGE30  CAP495X.   FHDTYP31  CAP140X.

      /* NAI FORMAT ASSOCIATIONS */

      QOL       CAP837X.   QOLPH     CAP837X.   QOLMH     CAP837X.
      QOLSAR    CAP837X.   COUSAR    CAP837X.   COEPA     CAP842X.
      BEP7D     CAP843X.   RF7D      CAP844X.   RP7D      CAP085X.
      CCBG10Y   CAP846X.   WCCBGW    CAP847X.   RECUR     CAP027X.
      MRRYR     CAP183X.   TRETMRC1  CAP358X.   TRETMRC2  CAP358X.
      TRETMRC3  CAP358X.   TRETMRC4  CAP358X.   TRETMRC5  CAP358X.
      TRETMRC6  CAP358X.   TRETMRC7  CAP358X.   TMRCSPEC  $CAP091X.
      TRETBC    CAP027X.   CIAT      CAP027X.   NFOC      CAP027X.
      TRETDOC   CAP027X.   FUADVEV   CAP027X.   FUADVFMT  CAP027X.
      HICT      CAP027X.   HPCAEROP  CAP027X.   HPIDATT   CAP027X.
      HPMETESN  CAP867X.   ACDPCSG   CAP027X.   MRNPCSG   CAP869X.
      RCSGSPEC  $CAP091X.  DKPCSG    CAP027X.   CTRSCT    CAP027X.
      DHIBC     CAP027X.   CCFP      CAP874X.;
RUN;

PROC CONTENTS DATA=NHIS.CANCERXX;
   TITLE1 'CONTENTS OF THE 2010 NHIS Sample Adult Cancer FILE';

PROC FREQ DATA=NHIS.CANCERXX NOTITLE;
   TABLES RECTYPE/LIST MISSING;
   TITLE1 'FREQUENCY REPORT FOR 2010 NHIS Sample Adult Cancer FILE';
   TITLE2 '(WEIGHTED)';
   WEIGHT WTFA_SA;

PROC FREQ DATA=NHIS.CANCERXX NOTITLE;
   TABLES RECTYPE/LIST MISSING;
   TITLE1 'FREQUENCY REPORT FOR 2010 NHIS Sample Adult Cancer FILE';
   TITLE2 '(UNWEIGHTED)';

* USER NOTE: TO SEE UNFORMATTED VALUES IN PROCEDURES, ADD THE
             STATEMENT: FORMAT _ALL_;
RUN;
