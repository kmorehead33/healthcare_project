*********************************************************************
 JUNE 12, 2013  8:27 AM
 
 This is an example of a SAS program that creates a SAS
 file from the 2012 NHIS Public Use SAMCHILD.DAT ASCII file
 
 This is stored in SAMCHILD.SAS
*********************************************************************;

* USER NOTE: PLACE NEXT STATEMENT IN SUBSEQUENT PROGRAMS;
LIBNAME  NHIS     "C:\NHIS2012";

* USER NOTE: PLACE NEXT STATEMENT IN SUBSEQUENT PROGRAMS
             IF YOU ALLOW PROGRAM TO PERMANENTLY STORE FORMATS;
LIBNAME  LIBRARY  "C:\NHIS2012";

FILENAME ASCIIDAT 'C:\NHIS2012\SAMCHILD.dat';

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
   VALUE SCP001X
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
   VALUE SCP002X
      .                   = '.'
      OTHER              = "Survey Year"
   ;
   VALUE SCP004X
      1                  = "1 Quarter 1"
      2                  = "2 Quarter 2"
      3                  = "3 Quarter 3"
      4                  = "4 Quarter 4"
   ;
   VALUE SCP005X
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
   VALUE SCP010X
      1                  = "1 Northeast"
      2                  = "2 Midwest"
      3                  = "3 South"
      4                  = "4 West"
   ;
   VALUE SCP013X
      1                  = "1 Male"
      2                  = "2 Female"
   ;
   VALUE SCP014X
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
   VALUE SCP015X
      01                 = "01 White only"
      02                 = "02 Black/African American only"
      03                 = "03 AIAN only"
      04                 = "04 Asian only"
      05                 = "05 Race group not releasable (See file layout)"
      06                 = "06 Multiple race"
   ;
   VALUE SCP016X
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
   VALUE SCP017X
      01                 = "01 White"
      02                 = "02 Black/African American"
      03                 = "03 Indian (American) (includes Eskimo, Aleut)"
      06                 = "06 Chinese"
      07                 = "07 Filipino"
      12                 = "12 Asian Indian"
      16                 = "16 Other race (See file layout)"
      17                 = "17 Multiple race, no primary race selected"
   ;
   VALUE SCP018X
      00                 = "00 Under 1 year"
      85                 = "85 85+ years"
   ;
   VALUE $SCP019X
      "96"               = "96 No person available"
      "98"               = "98 Not ascertained"
   ;
   VALUE SCP020X
      01                 = "01 Parent (Biological, adoptive, or step)"
      02                 = "02 Grandparent"
      03                 = "03 Aunt/Uncle"
      04                 = "04 Brother/Sister"
      05                 = "05 Other relative"
      06                 = "06 Legal guardian"
      07                 = "07 Foster parent"
      08                 = "08 Other non-relative"
      97                 = "97 Refused"
      98                 = "98 Not ascertained"
      99                 = "99 Don't know"
   ;
   VALUE SCP021X
      1                  = 
"1 Started Sample Child Core 2+ weeks after the initial interview"
      2                  = 
"2 Started Sample Child Core less than 2 weeks after the initial interview"
   ;
   VALUE SCP022X
      1                  = 
"1 Families selected to receive ADB (sample adults) and CDB (sample children 1-1
7 years) sections"
      2                  = 
"2 Families selected to receive FDB (all persons 1 year and older) section"
   ;
   VALUE SCP023X
      018                = "018 18 ounces or less"
      193                = "193 193+ ounces"
      997                = "997 Refused"
      998                = "998 Not ascertained"
      999                = "999 Don't know"
   ;
   VALUE SCP024X
      0500               = "0500 500 grams or less"
      5485               = "5485 5485+ grams"
      9997               = "9997 Refused"
      9998               = "9998 Not ascertained"
      9999               = "9999 Don't know"
   ;
   VALUE SCP025X
      96                 = "96 Not available"
      97                 = "97 Refused"
      98                 = "98 Not ascertained"
      99                 = "99 Unknown"
   ;
   VALUE SCP026X
      996                = "996 Not available"
      997                = "997 Refused"
      998                = "998 Not ascertained"
      999                = "999 Unknown"
   ;
   VALUE SCP027X
      9995               = "9995 99.95+"
      9999               = "9999 Unknown"
   ;
   VALUE SCP028X
      1                  = "1 Yes"
      2                  = "2 No"
      7                  = "7 Refused"
      8                  = "8 Not ascertained"
      9                  = "9 Don't know"
   ;
   VALUE SCP033X
      1                  = "1 Mentioned"
      2                  = "2 Not mentioned"
      7                  = "7 Refused"
      8                  = "8 Not ascertained"
      9                  = "9 Don't know"
   ;
   VALUE SCP043X
      1                  = "1 Yes"
      2                  = "2 No"
      7                  = "7 Refused"
      9                  = "9 Don't know"
   ;
   VALUE SCP091X
      1                  = "1 Better"
      2                  = "2 Worse"
      3                  = "3 About the same"
      7                  = "7 Refused"
      8                  = "8 Not ascertained"
      9                  = "9 Don't know"
   ;
   VALUE SCP092X
      000                = "000 None"
      996                = "996 Did not go to school"
      997                = "997 Refused"
      998                = "998 Not ascertained"
      999                = "999 Don't know"
   ;
   VALUE SCP095X
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
   VALUE SCP103X
      0                  = "0 Not true"
      1                  = "1 Sometimes true"
      2                  = "2 Often true"
      7                  = "7 Refused"
      8                  = "8 Not ascertained"
      9                  = "9 Don't know"
   ;
   VALUE SCP104X
      99                 = "99 Unknown"
   ;
   VALUE SCP112X
      1                  = "1 Yes"
      2                  = "2 There is NO place"
      3                  = "3 There is MORE THAN ONE place"
      7                  = "7 Refused"
      8                  = "8 Not ascertained"
      9                  = "9 Don't know"
   ;
   VALUE SCP113X
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
   VALUE SCP115X
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
   VALUE SCP118X
      1                  = "1 Mentioned"
      2                  = "2 Not mentioned"
      7                  = "7 Refused"
      8                  = "8 Not ascertained"
      9                  = "9 Don’t know"
   ;
   VALUE SCP128X
      1                  = "1 Yes"
      2                  = "2 No"
      7                  = "7 Refused"
      8                  = "8 Not ascertained"
      9                  = "9 Don’t know"
   ;
   VALUE SCP145X
      0                  = "0 Never"
      1                  = "1 6 months or less"
      2                  = "2 More than 6 months, but not more than 1 year ago"
      3                  = "3 More than 1 year, but not more than 2 years ago"
      4                  = "4 More than 2 years, but not more than 5 years ago"
      5                  = "5 More than 5 years ago"
      7                  = "7 Refused"
      8                  = "8 Not ascertained"
      9                  = "9 Don't know"
   ;
   VALUE SCP162X
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
   VALUE SCP171X
      1                  = "1 Yes"
      2                  = "2 No"
      7                  = "7 Refused"
      8                  = "8 Not ascertained"
      9                  = "9 Don’t' know"
   ;
   VALUE SCP182X
      97                 = "97 Refused"
      98                 = "98 Not ascertained"
      99                 = "99 Don't know"
   ;
   VALUE SCP183X
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
   VALUE SCP186X
      95                 = "95 95+ times"
      97                 = "97 Refused"
      98                 = "98 Not ascertained"
      99                 = "99 Don't know"
   ;
   VALUE SCP188X
      01                 = "01 6 to 8 months"
      02                 = "02 9 to 11 months"
      03                 = "03 12 to 14 months"
      04                 = "04 15 to 17 months"
      05                 = "05 18 to 23 months"
      06                 = "06 24 months (2 years) or later"
      07                 = "07 Cannot talk"
      97                 = "97 Refused"
      98                 = "98 Not ascertained"
      99                 = "99 Don't know"
   ;
   VALUE SCP242X
      1                  = "1 No problem"
      2                  = "2 A small problem"
      3                  = "3 A moderate problem"
      4                  = "4 A big problem"
      5                  = "5 A very big problem"
      7                  = "7 Refused"
      8                  = "8 Not ascertained"
      9                  = "9 Don't know"
   ;
   VALUE SCP294X
      01                 = "01 6 to 8 months"
      02                 = "02 9 to 11 months"
      03                 = "03 12 to 14 months"
      04                 = "04 15 to 17 months"
      05                 = "05 18 to 23 months"
      06                 = "06 24 months (2 years) or later"
      07                 = "07 Cannot walk"
      97                 = "97 Refused"
      98                 = "98 Not ascertained"
      99                 = "99 Don't know"
   ;
   VALUE SCP319X
      0                  = "0 Not true"
      1                  = "1 Somewhat true"
      2                  = "2 Certainly true"
      7                  = "7 Refused"
      8                  = "8 Not ascertained"
      9                  = "9 Don't know"
   ;
   VALUE SCP324X
      0                  = "0 No"
      1                  = "1 Yes, minor difficulties"
      2                  = "2 Yes, definite difficulties"
      3                  = "3 Yes, severe difficulties"
      7                  = "7 Refused"
      8                  = "8 Not ascertained"
      9                  = "9 Don't know"
   ;
   VALUE SCP327X
      1                  = "1 A lot"
      2                  = "2 Some"
      3                  = "3 A little"
      7                  = "7 Refused"
      8                  = "8 Not ascertained"
      9                  = "9 Don't know"
   ;
   VALUE SCP328X
      1                  = "1 Less than a month"
      2                  = "2 1-5 months"
      3                  = "3 6 to 12 months"
      4                  = "4 Over a year"
      7                  = "7 Refused"
      8                  = "8 Not ascertained"
      9                  = "9 Don’t know"
   ;
   VALUE SCP330X
      1                  = "1 Not at all"
      2                  = "2 A little"
      3                  = "3 Some"
      4                  = "4 A lot"
      7                  = "7 Refused"
      8                  = "8 Not ascertained"
      9                  = "9 Don't know"
   ;
   VALUE SCP337X
      1                  = "1 Day School"
      2                  = "2 Overnight School"
      7                  = "7 Refused"
      8                  = "8 Not ascertained"
      9                  = "9 Don't know"
   ;
   VALUE SCP367X
      1                  = "1 Mentioned"
      2                  = "2 Not ascertained"
      7                  = "7 Refused"
      8                  = "8 Not ascertained"
      9                  = "9 Don’t know"
   ;
   VALUE SCP396X
      1                  = "1 Mentioned"
      2                  = "2 Not mentioned"
      7                  = "7 Refused"
      8                  = "8 Not ascertained"
      9                  = "9 Don’t' know"
   ;
   VALUE SCP419X
      1                  = "1 Mentioned"
      2                  = "2 Not mentioned"
      7                  = "7 Refused"
      8                  = "8 Not mentioned"
      9                  = "9 Don’t know"
   ;
   VALUE SCP425X
      01                 = 
"01 Child welfare/social services/family and child services agency"
      02                 = "02 School or educational system"
      03                 = "03 Mental health agency"
      04                 = "04 Private mental health professional"
      05                 = "05 Juvenile justice agency or court system"
      06                 = "06 Private insurance service"
      07                 = "07 Family or friend"
      08                 = "08 Pediatrician or other family doctor"
      09                 = "09 Family or youth advocacy groups"
      10                 = "10 Other"
      97                 = "97 Refused"
      98                 = "98 Not ascertained"
      99                 = "99 Don't know"
   ;
   VALUE SCP426X
      1                  = "1 Not at all"
      2                  = "2 A little"
      3                  = "3 Some"
      4                  = "4 A lot"
      7                  = "7 Refused"
      8                  = "8 Not ascertained"
      9                  = "9 Don’t know"
   ;
   VALUE SCP451X
      1                  = "1 1 vaccination or dose"
      2                  = "2 2 or more vaccination doses"
      7                  = "7 Refused"
      8                  = "8 Not ascertained"
      9                  = "9 Don't know"
   ;
   VALUE SCP452X
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
   VALUE SCP453X
      .                   = '.'
      OTHER              = "Year"
      9997               = "9997 Refused"
      9998               = "9998 Not ascertained"
      9999               = "9999 Don't know"
   ;
   VALUE SCP454X
      1                  = "1 Flu shot"
      2                  = "2 Flu nasal spray (spray, mist or drop in nose)"
      7                  = "7 Refused"
      8                  = "8 Not ascertained"
      9                  = "9 Don't know"
   ;

DATA NHIS.SAMCHILD;
   * CREATE A SAS DATA SET;
   INFILE ASCIIDAT PAD LRECL=529;

   * DEFINE LENGTH OF ALL VARIABLES;

   LENGTH

      /* IDN LENGTHS */

      RECTYPE    3   SRVY_YR    4   HHX      $ 6   INTV_QRT   3
      INTV_MON   3   FMX      $ 2   FPX      $ 2   WTIA_SC    8
      WTFA_SC    8

      /* UCF LENGTHS */

      REGION     3   STRAT_P    4   PSU_P      3

      /* HHC LENGTHS */

      SEX        3   HISPAN_I   3   RACERPI2   3   MRACRPI2   3
      MRACBPI2   3   AGE_P      3

      /* CID LENGTHS */

      CSRESPNO $ 2   CSRELTIV   3   LATEINTC   3

      /* FDB LENGTHS */

      FDRN_FLG   3

      /* CHS LENGTHS */

      TOTOZ_P    4   BWTGRM_P   4   CHGHT_TC   3   CWGHT_TC   4
      BMI_SC     4   AMR1R      3   AODD1      3   ADD2       3
      AMR2R      3   AODD2      3   CCONDL01   3   CCONDL02   3
      CCONDL03   3   CCONDL04   3   CCONDL05   3   CCONDL6R   3
      CCONDL07   3   CCONDL08   3   CCONDL09   3   CCONDL10   3
      CPOX       3   CPOX12MO   3   CASHMEV    3   CASSTILL   3
      CASHYR     3   CASERYR1   3   CHPYR      3   CHYPMED    3
      CCHLYR     3   CFLUPNYR   3   CCONMED    3   CSINYR     3
      CSTREPYR   3   HAYF1      3   RALLG1     3   DALLG1     3
      SALLG1     3   DIARH1     3   ANEMIA1    3   EARINF1    3
      SEIZE1     3   HAYF2      3   RALLG2     3   DALLG2     3
      SALLG2     3   DIARH2     3   ANEMIA2    3   FHEAD      3
      EARINF2    3   SEIZE2     3   STUTTER    3   CHEADYR    3
      CABDOMYR   3   CJNTSYMP   3   CPAINECK   3   CPAINLB    3
      CMUSCLYR   3   CSPNYR     3   CDENYR     3   CPNOTHYR   3
      COVRWTYR   3   CTHOTHYR   3   CFEVRYR    3   CCOLDYR    3
      CNAUSYR    3   CFATIGYR   3   CFATYR     3   CINSYR     3
      CHSTATYR   3   SCHDAYR1   4   CCOLD2W    3   CINTIL2W   3
      CHEARST1   3   CVISION    3   CBLIND     3   IHSPEQ     3
      IHMOB      3   IHMOBYR    3   PROBRX     3   LEARND     3
      CMHAGM15   3   MHIBOY2    3   CMHAGF15   3   MHIGRL2    3
      CDEPRSYR   3   CANXNWYR   3   CSTRESYR   3   MENSTYR    3
      CGYNYR     3

      /* CAU LENGTHS */

      CUSUALPL   3   CPLKIND    3   CHCPLROU   3   CHCPLKND   3
      CHCCHGYR   3   CHCCHGHI   3   CNOUSPL1   3   CNOUSPL2   3
      CNOUSPL3   3   CNOUSPL4   3   CNOUSPL5   3   CNOUSPL6   3
      CNOUSPL7   3   CNOUSPL8   3   CNOUSPL9   3   CPRVTRYR   3
      CPRVTRFD   3   CDRNANP    3   CDRNAI     3   CHCDLYR1   3
      CHCDLYR2   3   CHCDLYR3   3   CHCDLYR4   3   CHCDLYR5   3
      CHCAFYR    3   CHCAFYRN   3   CHCAFYRF   3   CHCAFYR1   3
      CHCAFYR2   3   CHCAFYR3   3   CHCAFYR4   3   CHCAFYR5   3
      CHCAFYR6   3   CDNLONGR   3   CHCSYR11   3   CHCSYR12   3
      CHCSYR13   3   CHCSYR14   3   CHCSYR1    3   CHCSYR2    3
      CHCSYR3    3   CHCSYR4    3   CHCSYR5    3   CHCSYR6    3
      CHCSYR7    3   CHCSYR81   3   CHCSYR82   3   CHCSYR10   3
      CHCSYREM   3   CHPXYR_C   3   CHERNOY2   3   CERVISND   3
      CERHOS     3   CERREAS1   3   CERREA1R   3   CERREAS2   3
      CERREA2R   3   CERREAS3   3   CERREA3R   3   CERREAS4   3
      CERREA4R   3   CERREAS5   3   CERREA5R   3   CERREAS6   3
      CERREA6R   3   CERREAS7   3   CERREA7R   3   CERREAS8   3
      CERREA8R   3   CHCHYR     3   CHCHMOYR   3   CHCHNOY2   3
      CHCNOYR2   3   CSRGYR     3   RSRGNOYR   3   CMDLONGR   3

      /* CCD LENGTHS */

      CVSLWRD    3   CVSLVYR    3   CVSLSWYR   3   CVSLSPYR   3
      CVSLLGYR   3   CVSLEVER   3   CVSLDG     3   CVSLDGT1   3
      CVSLDGT2   3   CVSLDGT3   3   CVSLDGT4   3   CVSLVD01   3
      CVSLVD02   3   CVSLVD03   3   CVSLVD04   3   CVSLVD05   3
      CVSLVD06   3   CVSLVD07   3   CVSLVD08   3   CVSLVD09   3
      CVSLVD10   3   CVSLVD11   3   CVSLSW01   3   CVSLSW02   3
      CVSLSW03   3   CVSLSW04   3   CVSLSW05   3   CVSLSW06   3
      CVSLSW07   3   CVSLSW08   3   CVSLSW09   3   CVSLSP01   3
      CVSLSP02   3   CVSLSP03   3   CVSLSP04   3   CVSLSP05   3
      CVSLSP06   3   CVSLSP07   3   CVSLSP08   3   CVSLSP09   3
      CVSLSP10   3   CVSLLG01   3   CVSLLG02   3   CVSLLG03   3
      CVSLLG04   3   CVSLLG05   3   CVSLLG06   3   CVSLLG07   3
      CVSLLG08   3   CVSLLG09   3   CVSLVAG    3   CVSLSWAG   3
      CVSLSPAG   3   CVSLLGAG   3   CVSLVPB    3   CVSLSWPB   3
      CVSLSPPB   3   CVSLLGPB   3   CVSLVSP    3   CVSLVPE    3
      CVSLSWSP   3   CVSLSWPE   3   CVSLSPSP   3   CVSLSPPE   3
      CVSLLGSP   3   CVSLLGPE   3   CVSVP01    3   CVSVP02    3
      CVSVP03    3   CVSVP04    3   CVSVP05    3   CVSVP06    3
      CVSVP07    3   CVSVP08    3   CVSVP09    3   CVSVP10    3
      CVSSWP01   3   CVSSWP02   3   CVSSWP03   3   CVSSWP04   3
      CVSSWP05   3   CVSSWP06   3   CVSSWP07   3   CVSSWP08   3
      CVSSWP09   3   CVSSWP10   3   CVSSPP01   3   CVSSPP02   3
      CVSSPP03   3   CVSSPP04   3   CVSSPP05   3   CVSSPP06   3
      CVSSPP07   3   CVSSPP08   3   CVSSPP09   3   CVSSPP10   3
      CVSLGP01   3   CVSLGP02   3   CVSLGP03   3   CVSLGP04   3
      CVSLGP05   3   CVSLGP06   3   CVSLGP07   3   CVSLGP08   3
      CVSLGP09   3   CVSLGP10   3

      /* CBL LENGTHS */

      CBALWLK    3   CBALLIMB   3   CBALVRTG   3   CBALSTED   3
      CBALMOTR   3   CBALFALL   3   CBALPASS   3   CBALOTH    3
      CBALDGHP   3   CBALDG01   3   CBALDG02   3   CBALDG03   3
      CBALDG04   3   CBALDG05   3   CBALDG06   3   CBALDG07   3
      CBALDG08   3   CBALDG09   3   CBALDG10   3   CBALDG11   3
      CBALDG12   3   CBALPART   3   CBALPROB   3   CBALHPYR   3
      CBALTRET   3

      /* CMB LENGTHS */

      RSCL2_C2   3   RSCL2_E2   3   RSCL3_E3   3   RSCL5_P5   3
      RSCL5_H5   3   RSCL6      3

      /* CMS LENGTHS */

      DIFF6M     3   DIFFINTF   3   DIFFDEG    3   DIFFLNG    3
      PRESCP6M   3   PRESHELP   3   PMEDPED    3   PMEDPSY    3
      PMEDNEU    3   PMEDOTHR   3   NSDUH21    3   NSDUH3     3
      NSDUH31    3   NSDUH321   3   NSDUH322   3   NSDUH323   3
      NSDUH324   3   NSDUH325   3   NSDUH4     3   NSDUH51R   3
      NSDUH52R   3   NSDUH53R   3   NSDUH54R   3   NSDUH55R   4
      TRTWRE1R   3   TRTWH11R   3   TRTWH12R   3   TRTWH13R   3
      TRTWH14R   3   TRTWH16R   3   TRTMHP11   3   TRTMHP12   3
      TRTMHP13   3   TRTMHP14   3   TRTWRE2R   3   TRTWH21R   3
      TRTWH22R   3   TRTWH23R   3   TRTWH24R   3   TRTWH25R   3
      TRTWH26R   3   TRTMHP21   3   TRTMHP22   3   TRTMHP23   3
      TRTMHP24   3   TRTWRE3R   3   TRTWH31R   3   TRTWH32R   3
      TRTWH33R   3   TRTWH34R   3   TRTWH35R   3   TRTWH36R   3
      TRTMHP31   3   TRTMHP32   3   TRTMHP33   3   TRTMHP34   3
      TRTWRE4R   3   TRTWH41R   3   TRTWH42R   3   TRTWH43R   3
      TRTWH44R   3   TRTWH45R   3   TRTWH46R   3   TRTMHP41   3
      TRTMHP42   3   TRTMHP43   3   TRTMHP44   3   TRTWRE5R   3
      TRTWH51R   3   TRTWH52R   3   TRTWH53R   3   TRTWH54R   3
      TRTWH55R   3   TRTWH56R   3   TRTMHP51   3   TRTMHP52   3
      TRTMHP53   3   TRTMHP54   3   TRTWRE6R   3   TRTWH61R   3
      TRTWH62R   3   TRTWH63R   3   TRTWH64R   3   TRTWH65R   3
      TRTWH66R   3   TRTMHP61   3   TRTMHP62   3   TRTMHP63   3
      TRTMHP64   3   OVRNT6MR   3   OVERWH1R   3   OVERWH2R   3
      OVERWH3R   3   OVERWH4R   3   OVERWH5R   3   OVERWH6R   3
      OVERWH7R   3   SH1        3   SH2        3   CASEM6M    3
      CASEMWHO   3   TRETHELP   3   TRPYPHIR   3   TRPYSCHR   3
      TRPYSLFR   3   TRPYMEDR   3   TRPYCHPR   3   TRPYMILR   3
      TRPYSHPR   3   TRPYIHSR   3   TRPYOTHR   3   TRTFREER   3
      TRTNEED1   3   NTRCOSTR   3   NTRLOCR    3   NTRNEXPR   3
      NTRFEARR   3   NTRLOSER   3   NTRSAYR    3   NTRWAITR   3
      NTRTRANR   3   NTRINCVR   3   NTRFARR    3   NTRCHNOR   3
      NTROTHR    3

      /* CFI LENGTHS */

      CSHFLU12   3   CSHFLUNM   3   CSHFLUM1   3   CSHFLUY1   4
      CSHSPFL1   3   CSHFLUM2   3   CSHFLUY2   4   CSHSPFL2   3 ;

   * INPUT ALL VARIABLES;

   INPUT

      /* IDN LOCATIONS */

      RECTYPE       1 -   2    SRVY_YR       3 -   6
      HHX      $    7 -  12    INTV_QRT     13 -  13
      INTV_MON     14 -  15    FMX      $   16 -  17
      FPX      $   18 -  19    WTIA_SC      20 -  26 .1
      WTFA_SC      27 -  32

      /* UCF LOCATIONS */

      REGION       33 -  33    STRAT_P      34 -  36
      PSU_P        37 -  38

      /* HHC LOCATIONS */

      SEX          39 -  39    HISPAN_I     40 -  41
      RACERPI2     42 -  43    MRACRPI2     44 -  45
      MRACBPI2     46 -  47    AGE_P        48 -  49


      /* CID LOCATIONS */

      CSRESPNO $   50 -  51    CSRELTIV     52 -  53
      LATEINTC     54 -  54

      /* FDB LOCATIONS */

      FDRN_FLG     55 -  55

      /* CHS LOCATIONS */

      TOTOZ_P      56 -  58    BWTGRM_P     59 -  62
      CHGHT_TC     63 -  64    CWGHT_TC     65 -  67
      BMI_SC       68 -  71    AMR1R        72 -  72
      AODD1        73 -  73    ADD2         74 -  74
      AMR2R        75 -  75    AODD2        76 -  76
      CCONDL01     77 -  77    CCONDL02     78 -  78
      CCONDL03     79 -  79    CCONDL04     80 -  80
      CCONDL05     81 -  81    CCONDL6R     82 -  82
      CCONDL07     83 -  83    CCONDL08     84 -  84
      CCONDL09     85 -  85    CCONDL10     86 -  86
      CPOX         87 -  87    CPOX12MO     88 -  88
      CASHMEV      89 -  89    CASSTILL     90 -  90
      CASHYR       91 -  91    CASERYR1     92 -  92
      CHPYR        93 -  93    CHYPMED      94 -  94
      CCHLYR       95 -  95    CFLUPNYR     96 -  96
      CCONMED      97 -  97    CSINYR       98 -  98
      CSTREPYR     99 -  99    HAYF1       100 - 100
      RALLG1      101 - 101    DALLG1      102 - 102
      SALLG1      103 - 103    DIARH1      104 - 104
      ANEMIA1     105 - 105    EARINF1     106 - 106
      SEIZE1      107 - 107    HAYF2       108 - 108
      RALLG2      109 - 109    DALLG2      110 - 110
      SALLG2      111 - 111    DIARH2      112 - 112
      ANEMIA2     113 - 113    FHEAD       114 - 114
      EARINF2     115 - 115    SEIZE2      116 - 116
      STUTTER     117 - 117    CHEADYR     118 - 118
      CABDOMYR    119 - 119    CJNTSYMP    120 - 120
      CPAINECK    121 - 121    CPAINLB     122 - 122
      CMUSCLYR    123 - 123    CSPNYR      124 - 124
      CDENYR      125 - 125    CPNOTHYR    126 - 126
      COVRWTYR    127 - 127    CTHOTHYR    128 - 128
      CFEVRYR     129 - 129    CCOLDYR     130 - 130
      CNAUSYR     131 - 131    CFATIGYR    132 - 132
      CFATYR      133 - 133    CINSYR      134 - 134
      CHSTATYR    135 - 135    SCHDAYR1    136 - 138
      CCOLD2W     139 - 139    CINTIL2W    140 - 140
      CHEARST1    141 - 141    CVISION     142 - 142
      CBLIND      143 - 143    IHSPEQ      144 - 144
      IHMOB       145 - 145    IHMOBYR     146 - 146
      PROBRX      147 - 147    LEARND      148 - 148
      CMHAGM15    149 - 149    MHIBOY2     150 - 151
      CMHAGF15    152 - 152    MHIGRL2     153 - 154
      CDEPRSYR    155 - 155    CANXNWYR    156 - 156
      CSTRESYR    157 - 157    MENSTYR     158 - 158
      CGYNYR      159 - 159

      /* CAU LOCATIONS */

      CUSUALPL    160 - 160    CPLKIND     161 - 161
      CHCPLROU    162 - 162    CHCPLKND    163 - 163
      CHCCHGYR    164 - 164    CHCCHGHI    165 - 165
      CNOUSPL1    166 - 166    CNOUSPL2    167 - 167
      CNOUSPL3    168 - 168    CNOUSPL4    169 - 169
      CNOUSPL5    170 - 170    CNOUSPL6    171 - 171
      CNOUSPL7    172 - 172    CNOUSPL8    173 - 173
      CNOUSPL9    174 - 174    CPRVTRYR    175 - 175
      CPRVTRFD    176 - 176    CDRNANP     177 - 177
      CDRNAI      178 - 178    CHCDLYR1    179 - 179
      CHCDLYR2    180 - 180    CHCDLYR3    181 - 181
      CHCDLYR4    182 - 182    CHCDLYR5    183 - 183
      CHCAFYR     184 - 184    CHCAFYRN    185 - 185
      CHCAFYRF    186 - 186    CHCAFYR1    187 - 187
      CHCAFYR2    188 - 188    CHCAFYR3    189 - 189
      CHCAFYR4    190 - 190    CHCAFYR5    191 - 191
      CHCAFYR6    192 - 192    CDNLONGR    193 - 193
      CHCSYR11    194 - 194    CHCSYR12    195 - 195
      CHCSYR13    196 - 196    CHCSYR14    197 - 197
      CHCSYR1     198 - 198    CHCSYR2     199 - 199
      CHCSYR3     200 - 200    CHCSYR4     201 - 201
      CHCSYR5     202 - 202    CHCSYR6     203 - 203
      CHCSYR7     204 - 204    CHCSYR81    205 - 205
      CHCSYR82    206 - 206    CHCSYR10    207 - 207
      CHCSYREM    208 - 208    CHPXYR_C    209 - 209
      CHERNOY2    210 - 211    CERVISND    212 - 212
      CERHOS      213 - 213    CERREAS1    214 - 214
      CERREA1R    215 - 215    CERREAS2    216 - 216
      CERREA2R    217 - 217    CERREAS3    218 - 218
      CERREA3R    219 - 219    CERREAS4    220 - 220
      CERREA4R    221 - 221    CERREAS5    222 - 222
      CERREA5R    223 - 223    CERREAS6    224 - 224
      CERREA6R    225 - 225    CERREAS7    226 - 226
      CERREA7R    227 - 227    CERREAS8    228 - 228
      CERREA8R    229 - 229    CHCHYR      230 - 230
      CHCHMOYR    231 - 232    CHCHNOY2    233 - 234
      CHCNOYR2    235 - 236    CSRGYR      237 - 237
      RSRGNOYR    238 - 239    CMDLONGR    240 - 240


      /* CCD LOCATIONS */

      CVSLWRD     241 - 242    CVSLVYR     243 - 243
      CVSLSWYR    244 - 244    CVSLSPYR    245 - 245
      CVSLLGYR    246 - 246    CVSLEVER    247 - 247
      CVSLDG      248 - 248    CVSLDGT1    249 - 249
      CVSLDGT2    250 - 250    CVSLDGT3    251 - 251
      CVSLDGT4    252 - 252    CVSLVD01    253 - 253
      CVSLVD02    254 - 254    CVSLVD03    255 - 255
      CVSLVD04    256 - 256    CVSLVD05    257 - 257
      CVSLVD06    258 - 258    CVSLVD07    259 - 259
      CVSLVD08    260 - 260    CVSLVD09    261 - 261
      CVSLVD10    262 - 262    CVSLVD11    263 - 263
      CVSLSW01    264 - 264    CVSLSW02    265 - 265
      CVSLSW03    266 - 266    CVSLSW04    267 - 267
      CVSLSW05    268 - 268    CVSLSW06    269 - 269
      CVSLSW07    270 - 270    CVSLSW08    271 - 271
      CVSLSW09    272 - 272    CVSLSP01    273 - 273
      CVSLSP02    274 - 274    CVSLSP03    275 - 275
      CVSLSP04    276 - 276    CVSLSP05    277 - 277
      CVSLSP06    278 - 278    CVSLSP07    279 - 279
      CVSLSP08    280 - 280    CVSLSP09    281 - 281
      CVSLSP10    282 - 282    CVSLLG01    283 - 283
      CVSLLG02    284 - 284    CVSLLG03    285 - 285
      CVSLLG04    286 - 286    CVSLLG05    287 - 287
      CVSLLG06    288 - 288    CVSLLG07    289 - 289
      CVSLLG08    290 - 290    CVSLLG09    291 - 291
      CVSLVAG     292 - 293    CVSLSWAG    294 - 295
      CVSLSPAG    296 - 297    CVSLLGAG    298 - 299
      CVSLVPB     300 - 300    CVSLSWPB    301 - 301
      CVSLSPPB    302 - 302    CVSLLGPB    303 - 303
      CVSLVSP     304 - 304    CVSLVPE     305 - 305
      CVSLSWSP    306 - 306    CVSLSWPE    307 - 307
      CVSLSPSP    308 - 308    CVSLSPPE    309 - 309
      CVSLLGSP    310 - 310    CVSLLGPE    311 - 311
      CVSVP01     312 - 312    CVSVP02     313 - 313
      CVSVP03     314 - 314    CVSVP04     315 - 315
      CVSVP05     316 - 316    CVSVP06     317 - 317
      CVSVP07     318 - 318    CVSVP08     319 - 319
      CVSVP09     320 - 320    CVSVP10     321 - 321
      CVSSWP01    322 - 322    CVSSWP02    323 - 323
      CVSSWP03    324 - 324    CVSSWP04    325 - 325
      CVSSWP05    326 - 326    CVSSWP06    327 - 327
      CVSSWP07    328 - 328    CVSSWP08    329 - 329
      CVSSWP09    330 - 330    CVSSWP10    331 - 331
      CVSSPP01    332 - 332    CVSSPP02    333 - 333
      CVSSPP03    334 - 334    CVSSPP04    335 - 335
      CVSSPP05    336 - 336    CVSSPP06    337 - 337
      CVSSPP07    338 - 338    CVSSPP08    339 - 339
      CVSSPP09    340 - 340    CVSSPP10    341 - 341
      CVSLGP01    342 - 342    CVSLGP02    343 - 343
      CVSLGP03    344 - 344    CVSLGP04    345 - 345
      CVSLGP05    346 - 346    CVSLGP06    347 - 347
      CVSLGP07    348 - 348    CVSLGP08    349 - 349
      CVSLGP09    350 - 350    CVSLGP10    351 - 351


      /* CBL LOCATIONS */

      CBALWLK     352 - 353    CBALLIMB    354 - 354
      CBALVRTG    355 - 355    CBALSTED    356 - 356
      CBALMOTR    357 - 357    CBALFALL    358 - 358
      CBALPASS    359 - 359    CBALOTH     360 - 360
      CBALDGHP    361 - 361    CBALDG01    362 - 362
      CBALDG02    363 - 363    CBALDG03    364 - 364
      CBALDG04    365 - 365    CBALDG05    366 - 366
      CBALDG06    367 - 367    CBALDG07    368 - 368
      CBALDG08    369 - 369    CBALDG09    370 - 370
      CBALDG10    371 - 371    CBALDG11    372 - 372
      CBALDG12    373 - 373    CBALPART    374 - 374
      CBALPROB    375 - 375    CBALHPYR    376 - 376
      CBALTRET    377 - 377

      /* CMB LOCATIONS */

      RSCL2_C2    378 - 378    RSCL2_E2    379 - 379
      RSCL3_E3    380 - 380    RSCL5_P5    381 - 381
      RSCL5_H5    382 - 382    RSCL6       383 - 383


      /* CMS LOCATIONS */

      DIFF6M      384 - 384    DIFFINTF    385 - 385
      DIFFDEG     386 - 386    DIFFLNG     387 - 387
      PRESCP6M    388 - 388    PRESHELP    389 - 389
      PMEDPED     390 - 390    PMEDPSY     391 - 391
      PMEDNEU     392 - 392    PMEDOTHR    393 - 393
      NSDUH21     394 - 394    NSDUH3      395 - 395
      NSDUH31     396 - 396    NSDUH321    397 - 397
      NSDUH322    398 - 398    NSDUH323    399 - 399
      NSDUH324    400 - 400    NSDUH325    401 - 401
      NSDUH4      402 - 402    NSDUH51R    403 - 403
      NSDUH52R    404 - 404    NSDUH53R    405 - 405
      NSDUH54R    406 - 406    NSDUH55R    407 - 411
      TRTWRE1R    412 - 412    TRTWH11R    413 - 413
      TRTWH12R    414 - 414    TRTWH13R    415 - 415
      TRTWH14R    416 - 416    TRTWH16R    417 - 417
      TRTMHP11    418 - 418    TRTMHP12    419 - 419
      TRTMHP13    420 - 420    TRTMHP14    421 - 421
      TRTWRE2R    422 - 422    TRTWH21R    423 - 423
      TRTWH22R    424 - 424    TRTWH23R    425 - 425
      TRTWH24R    426 - 426    TRTWH25R    427 - 427
      TRTWH26R    428 - 428    TRTMHP21    429 - 429
      TRTMHP22    430 - 430    TRTMHP23    431 - 431
      TRTMHP24    432 - 432    TRTWRE3R    433 - 433
      TRTWH31R    434 - 434    TRTWH32R    435 - 435
      TRTWH33R    436 - 436    TRTWH34R    437 - 437
      TRTWH35R    438 - 438    TRTWH36R    439 - 439
      TRTMHP31    440 - 440    TRTMHP32    441 - 441
      TRTMHP33    442 - 442    TRTMHP34    443 - 443
      TRTWRE4R    444 - 444    TRTWH41R    445 - 445
      TRTWH42R    446 - 446    TRTWH43R    447 - 447
      TRTWH44R    448 - 448    TRTWH45R    449 - 449
      TRTWH46R    450 - 450    TRTMHP41    451 - 451
      TRTMHP42    452 - 452    TRTMHP43    453 - 453
      TRTMHP44    454 - 454    TRTWRE5R    455 - 455
      TRTWH51R    456 - 456    TRTWH52R    457 - 457
      TRTWH53R    458 - 458    TRTWH54R    459 - 459
      TRTWH55R    460 - 460    TRTWH56R    461 - 461
      TRTMHP51    462 - 462    TRTMHP52    463 - 463
      TRTMHP53    464 - 464    TRTMHP54    465 - 465
      TRTWRE6R    466 - 466    TRTWH61R    467 - 467
      TRTWH62R    468 - 468    TRTWH63R    469 - 469
      TRTWH64R    470 - 470    TRTWH65R    471 - 471
      TRTWH66R    472 - 472    TRTMHP61    473 - 473
      TRTMHP62    474 - 474    TRTMHP63    475 - 475
      TRTMHP64    476 - 476    OVRNT6MR    477 - 477
      OVERWH1R    478 - 478    OVERWH2R    479 - 479
      OVERWH3R    480 - 480    OVERWH4R    481 - 481
      OVERWH5R    482 - 482    OVERWH6R    483 - 483
      OVERWH7R    484 - 484    SH1         485 - 485
      SH2         486 - 486    CASEM6M     487 - 487
      CASEMWHO    488 - 489    TRETHELP    490 - 490
      TRPYPHIR    491 - 491    TRPYSCHR    492 - 492
      TRPYSLFR    493 - 493    TRPYMEDR    494 - 494
      TRPYCHPR    495 - 495    TRPYMILR    496 - 496
      TRPYSHPR    497 - 497    TRPYIHSR    498 - 498
      TRPYOTHR    499 - 499    TRTFREER    500 - 500
      TRTNEED1    501 - 501    NTRCOSTR    502 - 502
      NTRLOCR     503 - 503    NTRNEXPR    504 - 504
      NTRFEARR    505 - 505    NTRLOSER    506 - 506
      NTRSAYR     507 - 507    NTRWAITR    508 - 508
      NTRTRANR    509 - 509    NTRINCVR    510 - 510
      NTRFARR     511 - 511    NTRCHNOR    512 - 512
      NTROTHR     513 - 513

      /* CFI LOCATIONS */

      CSHFLU12    514 - 514    CSHFLUNM    515 - 515
      CSHFLUM1    516 - 517    CSHFLUY1    518 - 521
      CSHSPFL1    522 - 522    CSHFLUM2    523 - 524
      CSHFLUY2    525 - 528    CSHSPFL2    529 - 529
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
      WTIA_SC    ="Weight - Interim Annual"
      WTFA_SC    ="Weight - Final Annual"

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

      /* CID LABELS */

      CSRESPNO   ="Person # of available SC respondent"
      CSRELTIV   ="Person's relationship to child"
      LATEINTC   ="Late Sample Child interviews"

      /* FDB LABELS */

      FDRN_FLG   ="Disability Questions Test flag"

      /* CHS LABELS */

      TOTOZ_P    ="Total birth weight in ounces for public use"
      BWTGRM_P   ="Birth weight in grams for public use"
      CHGHT_TC   ="Total current height in inches (truncated)"
      CWGHT_TC   ="Current weight in pounds (truncated)"
      BMI_SC     ="Body Mass Index (BMI)"
      AMR1R      =
"Ever told SC had an intellectual disability also known as mental retardation"
      AODD1      ="Ever told SC had other developmental delay"
      ADD2       ="Ever told SC had ADHD/ADD"
      AMR2R      =
"Ever told SC had an intellectual disability also known as mental retardation"
      AODD2      ="Ever told SC had other developmental delay"
      CCONDL01   ="Ever told SC had Down syndrome"
      CCONDL02   ="Ever told SC had cerebral palsy"
      CCONDL03   ="Ever told SC had muscular dystrophy"
      CCONDL04   ="Ever told SC had cystic fibrosis"
      CCONDL05   ="Ever told SC had sickle cell anemia"
      CCONDL6R   ="Ever told SC had autism/autism spectrum disorder"
      CCONDL07   ="Ever told SC had diabetes"
      CCONDL08   ="Ever told SC had arthritis"
      CCONDL09   ="Ever told SC had congenital heart disease"
      CCONDL10   ="Ever told SC had other heart condition"
      CPOX       ="Ever had chickenpox"
      CPOX12MO   ="Chickenpox, past 12 m"
      CASHMEV    ="Ever been told SC had asthma"
      CASSTILL   ="Still have asthma"
      CASHYR     ="Had an asthma episode/attack, past 12 m"
      CASERYR1   ="Had visit to ER due to asthma, past 12 m"
      CHPYR      ="Ever told SC had hypertension, past 12 m"
      CHYPMED    ="Took prescription medication for hypertension"
      CCHLYR     ="Told SC had high cholesterol, past 12 m"
      CFLUPNYR   ="Told SC had influenza or pneumonia, past 12 m"
      CCONMED    ="Told SC had constipation requiring medication, past 12 m"
      CSINYR     ="Told SC had sinusitis, past 12 m"
      CSTREPYR   ="Told SC had strep throat or tonsillitis, past 12 m"
      HAYF1      ="Had hay fever, past 12 m"
      RALLG1     ="Had respiratory allergy, past 12 m"
      DALLG1     ="Had food/digestive allergy, past 12 m"
      SALLG1     ="Had eczema/skin allergy, past 12 m"
      DIARH1     ="Had frequent diarrhea/colitis, past 12 m"
      ANEMIA1    ="Had anemia, past 12 m"
      EARINF1    ="Had 3+ ear infections, past 12 m"
      SEIZE1     ="Had seizures, past 12 m"
      HAYF2      ="Had hay fever, past 12 m"
      RALLG2     ="Had respiratory allergy, past 12 m"
      DALLG2     ="Had food/digestive allergy, past 12 m"
      SALLG2     ="Had eczema/skin allergy, past 12 m"
      DIARH2     ="Had frequent diarrhea/colitis, past 12 m"
      ANEMIA2    ="Had anemia, past 12 m"
      FHEAD      ="Had frequent headaches/migraines, past 12 m"
      EARINF2    ="Had 3+ ear infections, past 12 m"
      SEIZE2     ="Had seizures, past 12 m"
      STUTTER    ="Stuttered/stammered, past 12 m"
      CHEADYR    ="Had recurring headache other than migraine, past 12 m"
      CABDOMYR   ="Had abdominal pain, past 12 m"
      CJNTSYMP   ="Had pain, aching, or stiffness, in/around joint, past 30 days
"
      CPAINECK   ="Had neck pain, past 12 m"
      CPAINLB    ="Had lower back pain, past 12 m"
      CMUSCLYR   ="Had other muscle or bone pain, past 12 m"
      CSPNYR     ="Had severe sprains or strains, past 12 m"
      CDENYR     ="Had dental pain, past 12 m"
      CPNOTHYR   ="Had other chronic pain, past 12 m"
      COVRWTYR   ="Had problems with being overweight, past 12 m"
      CTHOTHYR   ="Had sore throat other than strep or tonsillitis, past 12 m"
      CFEVRYR    ="Had fever more than one day, past 12 m"
      CCOLDYR    ="Had head or chest cold, past 12 m"
      CNAUSYR    ="Had nausea and/or vomiting, past 12 m"
      CFATIGYR   ="Had fatigue or lack of energy more than three days, past 12 m
"
      CFATYR     ="Regularly had excessive sleepiness during the day, past 12 m"
      CINSYR     ="Regularly had insomnia or trouble sleeping, past 12 m"
      CHSTATYR   ="Health better, worse, or about the same"
      SCHDAYR1   ="Days missed due to illness/injury, past 12 m"
      CCOLD2W    ="Had a head/chest cold, 2 week reference period"
      CINTIL2W   =
"Had stomach illness with vomiting/diarrhea, 2 week reference period"
      CHEARST1   ="Hearing without hearing aid"
      CVISION    ="Trouble seeing"
      CBLIND     ="Blind/unable to see at all"
      IHSPEQ     ="Need special equipment due to impairment/health problem"
      IHMOB      ="Impairment/health problem limit crawl/walk/run/play"
      IHMOBYR    ="Impairment/health problem lasted/will last 12+ m"
      PROBRX     ="Taken RX medication for 3+ m"
      LEARND     ="Ever told SC had a learning disability"
      CMHAGM15   ="Been unhappy/depressed, past 2 m"
      MHIBOY2    ="Mental health indicator (MHI) scale score"
      CMHAGF15   ="Been unhappy/depressed, past 2 m"
      MHIGRL2    ="Mental health indicator (MHI) scale score"
      CDEPRSYR   ="Told SC had depression, past 12 m"
      CANXNWYR   ="Frequently felt anxious, nervous, or worried, past 12 m"
      CSTRESYR   ="Frequently felt stressed, past 12 m"
      MENSTYR    =
"Had menstrual problems or premenstrual syndrome (PMS), past 12 m"
      CGYNYR     ="Had gynecologic problems, past 12 m"

      /* CAU LABELS */

      CUSUALPL   ="Place USUALLY go when sick"
      CPLKIND    ="Type of place to go when sick (most often)"
      CHCPLROU   ="USUALLY go there for routine/preventive care"
      CHCPLKND   ="Type of place USUALLY go for routine/preventive care"
      CHCCHGYR   ="Change health care place, past 12 m"
      CHCCHGHI   ="Change related to health insurance"
      CNOUSPL1   ="Doesn't need doctor/No problems"
      CNOUSPL2   ="Doesn't like/trust/believe in doctors"
      CNOUSPL3   ="Doesn't know where to go"
      CNOUSPL4   ="Previous doctor not available/moved"
      CNOUSPL5   ="Too expensive/no insurance/cost"
      CNOUSPL6   ="Speak a different language"
      CNOUSPL7   ="No care available/Care too far away, inconvenient"
      CNOUSPL8   ="Put it off/Didn't get around to it"
      CNOUSPL9   ="Other reason child not have usual source of medical care"
      CPRVTRYR   ="Trouble finding a general doctor to see child"
      CPRVTRFD   ="Able to find general doctor to see child"
      CDRNANP    ="Doctor's office not accept child as new patient"
      CDRNAI     ="Doctor's office not accept child's health insurance"
      CHCDLYR1   ="Couldn't get through on phone, past 12 m"
      CHCDLYR2   ="Couldn't get appointment soon enough, past 12 m"
      CHCDLYR3   ="Wait too long in doctor's office, past 12 m"
      CHCDLYR4   ="Not open when you could go, past 12 m"
      CHCDLYR5   ="No transportation, past 12 m"
      CHCAFYR    ="Can't afford prescription medicine, past 12 m"
      CHCAFYRN   ="Can't afford to see a specialist, past 12 m"
      CHCAFYRF   ="Can't afford follow-up care, past 12 m"
      CHCAFYR1   ="Can't afford prescription medicine, past 12 m"
      CHCAFYR2   ="Can't afford mental care/counseling, past 12 m"
      CHCAFYR3   ="Can't afford dental care, past 12 m"
      CHCAFYR4   ="Can't afford eyeglasses, past 12 m"
      CHCAFYR5   ="Can't afford to see a specialist, past 12 m"
      CHCAFYR6   ="Can't afford follow-up care, past 12 m"
      CDNLONGR   ="Time since last saw dentist"
      CHCSYR11   ="Seen/talked to eye doctor, past 12 m"
      CHCSYR12   ="Seen/talked to foot doctor, past 12 m"
      CHCSYR13   ="Seen/talked to therapist (PT/OT/etc), past 12 m"
      CHCSYR14   ="Seen/talked to a NP/PA, past 12 m"
      CHCSYR1    ="Seen/talked to mental health professional, past 12 m"
      CHCSYR2    ="Seen/talked to eye doctor, past 12 m"
      CHCSYR3    ="Seen/talked to foot doctor, past 12 m"
      CHCSYR4    ="Seen/talked to chiropractor, past 12 m"
      CHCSYR5    ="Seen/talked to therapist (PT/OT/etc), past 12 m"
      CHCSYR6    ="Seen/talked to NP/PA/midwife, past 12 m"
      CHCSYR7    ="Seen/talked to obstetrician/gynecologist, past 12 m"
      CHCSYR81   ="Seen/talked to a medical specialist, past 12 m"
      CHCSYR82   ="Seen/talked to a general doctor, past 12 m"
      CHCSYR10   ="Doctor treats both children and adults"
      CHCSYREM   ="Seen/talked to doctor for emotional/behavioral problem"
      CHPXYR_C   ="Had well-child checkup, past 12 m"
      CHERNOY2   ="# times in ER/ED, past 12 m"
      CERVISND   ="Most recent ER visit at night or on weekend"
      CERHOS     ="Hospital admission was result of most recent ER visit"
      CERREAS1   ="Didn't have another place to go"
      CERREA1R   ="Didn't have another place to go"
      CERREAS2   ="Doctor's office or clinic was not open"
      CERREA2R   ="Doctor's office or clinic was not open"
      CERREAS3   ="Health provider advised ER visit"
      CERREA3R   ="Health provider advised ER visit"
      CERREAS4   ="Problem too serious for doctor's office or clinic"
      CERREA4R   ="Problem too serious for doctor's office or clinic"
      CERREAS5   ="Only a hospital could help"
      CERREA5R   ="Only a hospital could help"
      CERREAS6   ="ER is closest provider"
      CERREA6R   ="ER is closest provider"
      CERREAS7   ="ER provides most of child's medical care"
      CERREA7R   ="ER provides most of child's medical care"
      CERREAS8   ="Arrived by ambulance or other emergency vehicle"
      CERREA8R   ="Arrived by ambulance or other emergency vehicle"
      CHCHYR     ="Received home care from health professional, past 12 m"
      CHCHMOYR   ="# of months of home care, past 12 m"
      CHCHNOY2   ="Total number of home visits"
      CHCNOYR2   ="Total number of office visits, past 12 m"
      CSRGYR     ="Had surgery/surgical procedure, past 12 m"
      RSRGNOYR   ="# of outpatient surgeries, past 12 m"
      CMDLONGR   ="Time since last seen/talked to health professional"

      /* CCD LABELS */

      CVSLWRD    ="Age first words spoken"
      CVSLVYR    ="Voice problem lasting 1+ weeks, past 12 months"
      CVSLSWYR   ="Swallowing problem lasting 1+ weeks, past 12 months"
      CVSLSPYR   ="Speech problem lasting 1+ weeks, past 12 months"
      CVSLLGYR   ="Language learning problem lasting 1+ weeks, past 12 months"
      CVSLEVER   =
"Ever had voice, swallowing, speech, or language problem lasting 1+ weeks"
      CVSLDG     =
"Ever given diagnosis for voice, swallowing, speech, or language problem"
      CVSLDGT1   ="Given diagnosis for voice problem"
      CVSLDGT2   ="Given diagnosis for swallowing problem"
      CVSLDGT3   ="Given diagnosis for speech problem"
      CVSLDGT4   ="Given diagnosis for language problem"
      CVSLVD01   ="Laryngitis causes voice problem"
      CVSLVD02   ="Head/neck injury causes voice problem"
      CVSLVD03   ="Allergies or airborne irritants cause voice problems"
      CVSLVD04   ="Tissue damage in throat causes voice problems"
      CVSLVD05   ="Laryngeal growths cause voice problems"
      CVSLVD06   ="Cancer in head, neck or throat causes voice problems"
      CVSLVD07   ="Neurological problem causes voice problems"
      CVSLVD08   ="Congenital malformation/birth defect causes voice problems"
      CVSLVD09   ="Gastroesophageal reflux causes voice problems"
      CVSLVD10   ="Prescription medication causes voice problems"
      CVSLVD11   ="Something else causes voice problems"
      CVSLSW01   ="Neurological problem causes swallowing problem"
      CVSLSW02   ="Head/neck injury causes swallowing problem"
      CVSLSW03   ="Tissue damage in throat causes swallowing problems"
      CVSLSW04   =
"Congenital malformation/birth defect causes swallowing problems"
      CVSLSW05   ="Genetic syndrome causes swallowing problems"
      CVSLSW06   ="Cancer in head, neck or throat causes swallowing problems"
      CVSLSW07   ="Asthma causes swallowing problems"
      CVSLSW08   ="Prescription medication causes swallowing problems"
      CVSLSW09   ="Something else causes swallowing problems"
      CVSLSP01   ="Hearing loss or deafness causes speech problem"
      CVSLSP02   ="Developmental speech sound disorder causes speech problem"
      CVSLSP03   ="Stuttering causes speech problems"
      CVSLSP04   ="Congenital malformation/birth defect causes speech problems"
      CVSLSP05   ="Genetic syndrome causes speech problems"
      CVSLSP06   ="Neurological disease causes speech problems"
      CVSLSP07   ="Head/neck injury causes speech problems"
      CVSLSP08   ="Cancer in head, neck or throat causes speech problems"
      CVSLSP09   ="Prescription medication causes speech problems"
      CVSLSP10   ="Something else causes speech problems"
      CVSLLG01   ="Hearing loss or deafness causes language problem"
      CVSLLG02   ="Genetic syndrome causes language problems"
      CVSLLG03   ="Intellectual disability causes language problems"
      CVSLLG04   ="Autism spectrum disorder causes language problems"
      CVSLLG05   =
"Developmental language-learning disorder causes language problems"
      CVSLLG06   ="Head injury, traumatic brain injury causes language problems"
      CVSLLG07   ="Other neurological problem causes language problems"
      CVSLLG08   ="Prescription medication causes language problems"
      CVSLLG09   ="Something else causes language problems"
      CVSLVAG    ="Age first had any voice problems"
      CVSLSWAG   ="Age first had swallowing problems"
      CVSLSPAG   ="Age first had speech problems"
      CVSLLGAG   ="Age first had language problems"
      CVSLVPB    ="How much of a voice problem, past 12 months"
      CVSLSWPB   ="How much of a swallowing problem, past 12 months"
      CVSLSPPB   ="How much of a speech problem, past 12 months"
      CVSLLGPB   ="How much of a language problem, past 12 months"
      CVSLVSP    ="Received voice services, past 12 months"
      CVSLVPE    ="Received voice services, ever"
      CVSLSWSP   ="Received swallowing services, past 12 months"
      CVSLSWPE   ="Received swallowing services, ever"
      CVSLSPSP   ="Received speech services, past 12 months"
      CVSLSPPE   ="Received speech services, ever"
      CVSLLGSP   ="Received language services, past 12 months"
      CVSLLGPE   ="Received language services, ever"
      CVSVP01    ="Speech-language pathologist provided voice services"
      CVSVP02    ="Early intervention specialist provided voice services"
      CVSVP03    ="Occupational/physical therapist provided voice services"
      CVSVP04    ="Ear, nose, throat doctor provided voice services"
      CVSVP05    ="Audiologist or hearing aid specialist provided voice services
"
      CVSVP06    =
"Pediatrician or family practice doctor provided voice services"
      CVSVP07    ="Neurologist or other specialist provided voice services"
      CVSVP08    ="Nutritionist or dietician provided voice services"
      CVSVP09    ="Psychiatrist or psychologist provided voice services"
      CVSVP10    ="Someone else provided voice services"
      CVSSWP01   ="Speech-language pathologist provided swallowing services"
      CVSSWP02   ="Early intervention specialist provided swallowing services"
      CVSSWP03   ="Occupational/physical therapist provided swallowing services"
      CVSSWP04   ="Ear, nose, throat doctor provided swallowing services"
      CVSSWP05   =
"Audiologist or hearing aid specialist provided swallowing services"
      CVSSWP06   =
"Pediatrician or family practice doctor provided swallowing services"
      CVSSWP07   ="Neurologist or other specialist provided swallowing services"
      CVSSWP08   ="Nutritionist or dietician provided swallowing services"
      CVSSWP09   ="Psychiatrist or psychologist provided swallowing services"
      CVSSWP10   ="Someone else provided swallowing services"
      CVSSPP01   ="Speech-language pathologist provided speech services"
      CVSSPP02   ="Early intervention specialist provided speech services"
      CVSSPP03   ="Occupational/physical therapist provided speech services"
      CVSSPP04   ="Ear, nose, throat doctor provided speech services"
      CVSSPP05   =
"Audiologist or hearing aid specialist provided speech services"
      CVSSPP06   =
"Pediatrician or family practice doctor provided speech services"
      CVSSPP07   ="Neurologist or other specialist provided speech services"
      CVSSPP08   ="Nutritionist or dietician provided speech services"
      CVSSPP09   ="Psychiatrist or psychologist provided speech services"
      CVSSPP10   ="Someone else provided speech services"
      CVSLGP01   ="Speech-language pathologist provided language services"
      CVSLGP02   ="Early intervention specialist provided language services"
      CVSLGP03   ="Occupational/physical therapist provided language services"
      CVSLGP04   ="Ear, nose, throat doctor provided language services"
      CVSLGP05   =
"Audiologist or hearing aid specialist provided language services"
      CVSLGP06   =
"Pediatrician or family practice doctor provided language services"
      CVSLGP07   ="Neurologist or other specialist provided language services"
      CVSLGP08   ="Nutritionist or dietician provided language services"
      CVSLGP09   ="Psychiatrist or psychologist provided language services"
      CVSLGP10   ="Someone else provided language services"

      /* CBL LABELS */

      CBALWLK    ="Age at first steps without support"
      CBALLIMB   ="Had problems standing, walking, using arms or legs"
      CBALVRTG   ="Bothered by episodes of vertigo, past 12 months"
      CBALSTED   ="Bothered by episodes of poor balance, past 12 months"
      CBALMOTR   ="Bothered by episodes of poor coordination, past 12 months"
      CBALFALL   ="Bothered by episodes of frequent falls, past 12 months"
      CBALPASS   =
"Bothered by episodes of light-headedness, fainting, feeling about to pass out, 
past 12 months"
      CBALOTH    =
"Bothered by episodes of other balance or dizziness problem, past 12 months"
      CBALDGHP   ="Ever given diagnosis for dizziness or balance problem"
      CBALDG01   ="Ear infection causes balance or dizziness problem"
      CBALDG02   =
"Vision problems/blurred vision causes balance or dizziness problem"
      CBALDG03   =
"Positional dizziness or vertigo (BPPV) causes balance or dizziness problem"
      CBALDG04   =
"Severe headaches or migraine cause balance or dizziness problem"
      CBALDG05   =
"Head or neck injury or concussion causes balance or dizziness problem"
      CBALDG06   ="Neurologic disorders cause balance or dizziness problem"
      CBALDG07   =
"Developmental motor coordination disorder causes balance or dizziness problem"
      CBALDG08   ="Ear malformation causes balance or dizziness problem"
      CBALDG09   ="Other genetic problem causes balance or dizziness problem"
      CBALDG10   ="Metabolic problem causes balance or dizziness problem"
      CBALDG11   ="Prescription medication causes balance or dizziness problem"
      CBALDG12   ="Something else causes balance or dizziness problem"
      CBALPART   =
"Dizziness or balance problem interferes with home, school, recreational activit
ies"
      CBALPROB   =
"How problematic was dizziness or balance problem, past 12 months"
      CBALHPYR   =
"Saw health care professional for dizziness or balance problem, past 12 months"
      CBALTRET   =
"Used treatment methods recommended by health care professional for dizziness or
 balance problem, past 12 months"

      /* CMB LABELS */

      RSCL2_C2   ="Well behaved/does what requested, past 6 m"
      RSCL2_E2   ="Many worries/often seems worried, past 6 m"
      RSCL3_E3   ="Unhappy/depressed/tearful, past 6 m"
      RSCL5_P5   ="Gets along better w/adults than children/youth, past 6 m"
      RSCL5_H5   ="Good attention/completes chores, homework, past 6 m"
      RSCL6      ="Difficulties w/emotions/concentration/behavior/getting along"

      /* CMS LABELS */

      DIFF6M     =
"Difficulties with emotions, concentration, behavior, past 6 months"
      DIFFINTF   =
"Difficulties interfere with family, school, or daily activities, past 6 months"
      DIFFDEG    =
"How much difficulties interfere with family, school, or daily activities"
      DIFFLNG    ="How long difficulties have been present"
      PRESCP6M   =
"Medication prescribed for difficulties with emotions, concentration, behavior, 
or getting along with others, past 6 months"
      PRESHELP   ="How much prescribed medicine helped"
      PMEDPED    =
"Pediatrician or other family doctor first prescribed medication"
      PMEDPSY    =
"Psychiatrist, psychologist or other mental health professional first prescribed
 medication"
      PMEDNEU    ="Neurologist first prescribed medication"
      PMEDOTHR   ="Someone else first prescribed medication"
      NSDUH21    ="Treatment or counseling from school personnel, past 6 months"
      NSDUH3     =
"Attend school for students with difficulties with emotions, concentration, beha
vior, past 6 months"
      NSDUH31    ="Attend a special needs day or overnight school, past 6 months
"
      NSDUH321   =
"Special Education teacher provided treatment or counseling in a special needs d
ay school"
      NSDUH322   =
"Other school teacher provided treatment or counseling in a special needs day sc
hool"
      NSDUH323   =
"School counselor, psychologist, nurse or social worker provided treatment or co
unseling in a special needs day school"
      NSDUH324   =
"School speech, occupational or physical therapist provided treatment or counsel
ing in a special needs day school"
      NSDUH325   =
"Other school official provided treatment or counseling in a special needs day s
chool"
      NSDUH4     =
"Participate in school program for students with difficulties with emotions, con
centration, behavior, past 6 months"
      NSDUH51R   =
"Special Ed teacher provided treatment or counseling in school program"
      NSDUH52R   =
"Other school teacher provided treatment or counseling in school program"
      NSDUH53R   =
"School counselor, psychologist, nurse or social worker provided treatment or co
unseling in school program"
      NSDUH54R   =
"School speech, occupational or physical therapist provided treatment or counsel
ing in school program"
      NSDUH55R   =
"Other school official provided treatment or counseling in school program"
      TRTWRE1R   =
"Treatment or counseling provided at daycare, child care, or play group, past 6 
months"
      TRTWH11R   =
"Pediatrician or family doctor provided treatment or counseling at daycare, chil
d care, or play group"
      TRTWH12R   =
"Psychiatrist, psychologist, clinical social worker or psychiatric nurse provide
d treatment or counseling at daycare, child care, or play group"
      TRTWH13R   =
"Speech, occupational or physical therapist provided treatment or counseling at 
daycare, child care, or play group"
      TRTWH14R   =
"Religious or spiritual counselor or advisor provided treatment or counseling at
 daycare, child care, or play group"
      TRTWH16R   =
"Other source provided treatment or counseling at daycare, child care, or play g
roup"
      TRTMHP11   =
"Psychiatrist provided treatment or counseling at daycare, child care, or play g
roup"
      TRTMHP12   =
"Psychologist provided treatment or counseling at daycare, child care, or play g
roup"
      TRTMHP13   =
"Clinical social worker provided treatment or counseling at daycare, child care,
 or play group"
      TRTMHP14   =
"Psychiatric nurse provided treatment or counseling at daycare, child care, or p
lay group"
      TRTWRE2R   =
"Treatment or counseling provided in an office, clinic or community center, past
 6 months"
      TRTWH21R   =
"Pediatrician or family doctor provided treatment or counseling in an office, cl
inic or community center"
      TRTWH22R   =
"Psychiatrist, psychologist, clinical social worker or psychiatric nurse provide
d treatment or counseling in an office, clinic or community center"
      TRTWH23R   =
"Speech, occupational or physical therapist provided treatment or counseling in 
an office, clinic or community center"
      TRTWH24R   =
"Religious or spiritual counselor or advisor provided treatment or counseling in
 an office, clinic or community center"
      TRTWH25R   =
"Probation or juvenile corrections officer or court counselor provided treatment
 or counseling in an office, clinic or community center"
      TRTWH26R   =
"Other source provided treatment or counseling in an office, clinic or community
 center"
      TRTMHP21   =
"Psychiatrist provided treatment or counseling at an office, clinic or community
 center"
      TRTMHP22   =
"Psychologist provided treatment or counseling at an office, clinic or community
 center"
      TRTMHP23   =
"Clinical social worker provided treatment or counseling at an office, clinic or
 community center"
      TRTMHP24   =
"Psychiatric nurse provided treatment or counseling at an office, clinic or comm
unity center"
      TRTWRE3R   =
"Treatment or counseling provided in home by visiting teacher or counselor"
      TRTWH31R   =
"Pediatrician or family doctor provided treatment or counseling in home"
      TRTWH32R   =
"Psychiatrist, psychologist, clinical social worker or psychiatric nurse provide
d treatment or counseling in home"
      TRTWH33R   =
"Speech, occupational or physical therapist provided treatment or counseling in 
home"
      TRTWH34R   =
"Religious or spiritual counselor or advisor provided treatment or counseling in
 home"
      TRTWH35R   =
"Probation or juvenile corrections officer or court counselor provided treatment
 or counseling in home"
      TRTWH36R   ="Other source provided treatment or counseling in home"
      TRTMHP31   ="Psychiatrist provided treatment or counseling at home"
      TRTMHP32   ="Psychologist provided treatment or counseling at home"
      TRTMHP33   =
"Clinical social worker provided treatment or counseling at home"
      TRTMHP34   ="Psychiatric nurse provided treatment or counseling at home"
      TRTWRE4R   =
"Treatment or counseling provided in hospital ER, crisis center, or shelter, pas
t 6 months"
      TRTWH41R   =
"Pediatrician or family doctor provided treatment or counseling in hospital ER, 
crisis center, or emergency shelter"
      TRTWH42R   =
"Psychiatrist, psychologist, clinical social worker or psychiatric nurse provide
d treatment or counseling in hospital ER, crisis center, or emergency shelter"
      TRTWH43R   =
"Speech, occupational or physical therapist provided treatment or counseling in 
hospital ER, crisis center, or shelter"
      TRTWH44R   =
"Religious or spiritual counselor or advisor provided treatment or counseling in
 hospital ER, crisis center, or emergency shelter"
      TRTWH45R   =
"Probation or juvenile corrections officer or court counselor provided treatment
 or counseling in hospital ER, crisis center, or emergency shelter"
      TRTWH46R   =
"Other source provided treatment or counseling in hospital ER, crisis center, or
 emergency shelter"
      TRTMHP41   =
"Psychiatrist provided treatment or counseling at hospital/ER/crisis center/shel
ter"
      TRTMHP42   =
"Psychologist provided treatment or counseling at hospital/ER/crisis center/shel
ter"
      TRTMHP43   =
"Clinical social worker provided treatment or counseling at hospital/ER/crisis c
enter/shelter"
      TRTMHP44   =
"Psychiatric nurse provided treatment or counseling at hospital/ER/crisis center
/shelter"
      TRTWRE5R   =
"Treatment or counseling provided in hospital or community day program, past 6 m
onths"
      TRTWH51R   =
"Pediatrician or family doctor provided treatment or counseling in hospital or c
ommunity day program"
      TRTWH52R   =
"Psychiatrist, psychologist, clinical social worker or psychiatric nurse provide
d treatment or counseling in hospital or community day program"
      TRTWH53R   =
"Speech, occupational or physical therapist provided treatment or counseling in 
hospital or community day program"
      TRTWH54R   =
"Religious or spiritual counselor or advisor provided treatment or counseling in
 hospital or community day program"
      TRTWH55R   =
"Probation or juvenile corrections officer or court counselor provided treatment
 or counseling in hospital or community day program"
      TRTWH56R   =
"Other source provided treatment or counseling in hospital or community day prog
ram"
      TRTMHP51   =
"Psychiatrist provided treatment or counseling at day treatment program in a hos
pital or community"
      TRTMHP52   =
"Psychologist provided treatment or counseling at day treatment program in a hos
pital or community"
      TRTMHP53   =
"Clinical social worker provided treatment or counseling at day treatment progra
m in a hospital or community"
      TRTMHP54   =
"Psychiatric nurse provided treatment or counseling at day treatment program in 
a hospital or community"
      TRTWRE6R   =
"Treatment or counseling provided in any other place, past 6 months"
      TRTWH61R   =
"Pediatrician or family doctor provided treatment or counseling in any other pla
ce"
      TRTWH62R   =
"Psychiatrist, psychologist, clinical social worker or psychiatric nurse provide
d treatment or counseling in any other place"
      TRTWH63R   =
"Speech, occupational or physical therapist provided treatment or counseling in 
any other place"
      TRTWH64R   =
"Religious or spiritual counselor or advisor provided treatment or counseling in
 any other place"
      TRTWH65R   =
"Probation or juvenile corrections officer or court counselor provided treatment
 or counseling in any other place"
      TRTWH66R   =
"Other source provided treatment or counseling in any other place"
      TRTMHP61   =
"Psychiatrist provided treatment or counseling at another place"
      TRTMHP62   =
"Psychologist provided treatment or counseling at another place"
      TRTMHP63   =
"Clinical social worker provided treatment or counseling at another place"
      TRTMHP64   =
"Psychiatric nurse provided treatment or counseling at another place"
      OVRNT6MR   =
"Overnight or longer stay in facility for difficulties with emotions, concentrat
ion, or behavior, past 6 months"
      OVERWH1R   =
"Stayed overnight in a hospital for difficulties with emotions, concentration, o
r behavior"
      OVERWH2R   =
"Stayed overnight in a residential treatment center for difficulties with emotio
ns, concentration, or behavior"
      OVERWH3R   =
"Stayed overnight in a foster care or therapeutic foster care home for difficult
ies with emotions, concentration, or behavior"
      OVERWH4R   =
'Stayed overnight in any type of  juvenile detention center, sometimes called "j
uvie", prison or jail for difficulties with emotions, concentration, or behavior
'
      OVERWH5R   =
"Stayed overnight in a group home for difficulties with emotions, concentration,
 or behavior"
      OVERWH6R   =
"Stayed overnight in a homeless shelter for difficulties with emotions, concentr
ation, or behavior"
      OVERWH7R   =
"Stayed overnight in another place for difficulties with emotions, concentration
, or behavior"
      SH1        =
"Participate in self-help group for children/youth with difficulties with emotio
ns, concentration, or behavior, past 6 months"
      SH2        =
"Use internet to seek treatment or counseling for difficulties with emotions, co
ncentration, or behavior, past 6 months"
      CASEM6M    ="Case management help from individual or agency, past 6 months
"
      CASEMWHO   ="Case management main provider"
      TRETHELP   =
"Amount that treatment or counseling helped child, past 6 months"
      TRPYPHIR   ="Private health insurance paid for treatment or counseling"
      TRPYSCHR   ="School system paid for treatment or counseling"
      TRPYSLFR   ="Family paid for treatment or counseling"
      TRPYMEDR   ="Medicaid paid for treatment or counseling"
      TRPYCHPR   ="State SCHIP/CHIP paid for treatment or counseling"
      TRPYMILR   ="Military health care paid for treatment or counseling"
      TRPYSHPR   =
"Medicare or other government plan paid for treatment or counseling"
      TRPYIHSR   ="Indian Health Service paid for treatment or counseling"
      TRPYOTHR   ="Some other source paid for treatment or counseling"
      TRTFREER   ="All treatment or counseling was received free"
      TRTNEED1   =
"Needed treatment or counseling for difficulties with emotions, concentration, o
r behavior, past 6 months, but did not get it"
      NTRCOSTR   =
"Didn't get treatment or counseling because it was too expensive"
      NTRLOCR    =
"Didn't get treatment or counseling because didn't know where to go"
      NTRNEXPR   =
"Didn't get treatment or counseling because had negative experience previously"
      NTRFEARR   =
"Didn't get treatment or counseling because afraid or dislike counselors"
      NTRLOSER   =
"Didn't get treatment or counseling because afraid child would be removed from h
ome or lose custody"
      NTRSAYR    =
"Didn't get treatment or counseling because afraid of family/friends opinion"
      NTRWAITR   =
"Didn't get treatment or counseling because it was a long wait time for appointm
ent"
      NTRTRANR   =
"Didn't get treatment or counseling because had no way to get there"
      NTRINCVR   =
"Didn't get treatment or counseling because services were too inconvenient to us
e"
      NTRFARR    =
"Didn't get treatment or counseling because services were too far away"
      NTRCHNOR   =
"Didn't get treatment or counseling because child did not want to go."
      NTROTHR    ="Didn't get treatment or counseling for some other reason"

      /* CFI LABELS */

      CSHFLU12   ="Flu vaccination, past 12 m"
      CSHFLUNM   ="Number of flu vaccines, past 12 m"
      CSHFLUM1   ="Month of most recent flu vaccine"
      CSHFLUY1   ="Year of most recent flu vaccine"
      CSHSPFL1   ="Administration method most recent flu vaccine"
      CSHFLUM2   ="Month of next most recent flu vaccine"
      CSHFLUY2   ="Year of next most recent flu vaccine"
      CSHSPFL2   ="Administration method next most recent flu vaccine"
   ;

   * ASSOCIATE VARIABLES WITH FORMAT VALUES;
   *    (PUT ASTERISK (*) BEFORE WORD "FORMAT"
        IN NEXT STATEMENT TO PREVENT FORMAT
        ASSOCIATIONS BEING STORED WITH DATA SET);
   FORMAT

      /* IDN FORMAT ASSOCIATIONS */

      RECTYPE   SCP001X.   SRVY_YR   SCP002X.   HHX       $GROUPC.
      INTV_QRT  SCP004X.   INTV_MON  SCP005X.   WTIA_SC   GROUPN.
      WTFA_SC   GROUPN.

      /* UCF FORMAT ASSOCIATIONS */

      REGION    SCP010X.

      /* HHC FORMAT ASSOCIATIONS */

      SEX       SCP013X.   HISPAN_I  SCP014X.   RACERPI2  SCP015X.
      MRACRPI2  SCP016X.   MRACBPI2  SCP017X.   AGE_P     SCP018X.

      /* CID FORMAT ASSOCIATIONS */

      CSRESPNO  $SCP019X.  CSRELTIV  SCP020X.   LATEINTC  SCP021X.

      /* FDB FORMAT ASSOCIATIONS */

      FDRN_FLG  SCP022X.

      /* CHS FORMAT ASSOCIATIONS */

      TOTOZ_P   SCP023X.   BWTGRM_P  SCP024X.   CHGHT_TC  SCP025X.
      CWGHT_TC  SCP026X.   BMI_SC    SCP027X.   AMR1R     SCP028X.
      AODD1     SCP028X.   ADD2      SCP028X.   AMR2R     SCP028X.
      AODD2     SCP028X.   CCONDL01  SCP033X.   CCONDL02  SCP033X.
      CCONDL03  SCP033X.   CCONDL04  SCP033X.   CCONDL05  SCP033X.
      CCONDL6R  SCP033X.   CCONDL07  SCP033X.   CCONDL08  SCP033X.
      CCONDL09  SCP033X.   CCONDL10  SCP033X.   CPOX      SCP043X.
      CPOX12MO  SCP028X.   CASHMEV   SCP028X.   CASSTILL  SCP028X.
      CASHYR    SCP028X.   CASERYR1  SCP028X.   CHPYR     SCP028X.
      CHYPMED   SCP028X.   CCHLYR    SCP028X.   CFLUPNYR  SCP028X.
      CCONMED   SCP028X.   CSINYR    SCP028X.   CSTREPYR  SCP028X.
      HAYF1     SCP028X.   RALLG1    SCP028X.   DALLG1    SCP028X.
      SALLG1    SCP028X.   DIARH1    SCP028X.   ANEMIA1   SCP028X.
      EARINF1   SCP028X.   SEIZE1    SCP028X.   HAYF2     SCP028X.
      RALLG2    SCP028X.   DALLG2    SCP028X.   SALLG2    SCP028X.
      DIARH2    SCP028X.   ANEMIA2   SCP028X.   FHEAD     SCP028X.
      EARINF2   SCP028X.   SEIZE2    SCP028X.   STUTTER   SCP028X.
      CHEADYR   SCP028X.   CABDOMYR  SCP028X.   CJNTSYMP  SCP028X.
      CPAINECK  SCP028X.   CPAINLB   SCP028X.   CMUSCLYR  SCP028X.
      CSPNYR    SCP028X.   CDENYR    SCP028X.   CPNOTHYR  SCP028X.
      COVRWTYR  SCP028X.   CTHOTHYR  SCP028X.   CFEVRYR   SCP028X.
      CCOLDYR   SCP028X.   CNAUSYR   SCP028X.   CFATIGYR  SCP028X.
      CFATYR    SCP028X.   CINSYR    SCP028X.   CHSTATYR  SCP091X.
      SCHDAYR1  SCP092X.   CCOLD2W   SCP028X.   CINTIL2W  SCP028X.
      CHEARST1  SCP095X.   CVISION   SCP028X.   CBLIND    SCP028X.
      IHSPEQ    SCP028X.   IHMOB     SCP028X.   IHMOBYR   SCP028X.
      PROBRX    SCP028X.   LEARND    SCP028X.   CMHAGM15  SCP103X.
      MHIBOY2   SCP104X.   CMHAGF15  SCP103X.   MHIGRL2   SCP104X.
      CDEPRSYR  SCP028X.   CANXNWYR  SCP028X.   CSTRESYR  SCP028X.
      MENSTYR   SCP028X.   CGYNYR    SCP028X.

      /* CAU FORMAT ASSOCIATIONS */

      CUSUALPL  SCP112X.   CPLKIND   SCP113X.   CHCPLROU  SCP028X.
      CHCPLKND  SCP115X.   CHCCHGYR  SCP028X.   CHCCHGHI  SCP028X.
      CNOUSPL1  SCP118X.   CNOUSPL2  SCP118X.   CNOUSPL3  SCP118X.
      CNOUSPL4  SCP118X.   CNOUSPL5  SCP118X.   CNOUSPL6  SCP118X.
      CNOUSPL7  SCP118X.   CNOUSPL8  SCP118X.   CNOUSPL9  SCP118X.
      CPRVTRYR  SCP028X.   CPRVTRFD  SCP128X.   CDRNANP   SCP028X.
      CDRNAI    SCP028X.   CHCDLYR1  SCP028X.   CHCDLYR2  SCP028X.
      CHCDLYR3  SCP028X.   CHCDLYR4  SCP028X.   CHCDLYR5  SCP028X.
      CHCAFYR   SCP028X.   CHCAFYRN  SCP028X.   CHCAFYRF  SCP028X.
      CHCAFYR1  SCP028X.   CHCAFYR2  SCP028X.   CHCAFYR3  SCP028X.
      CHCAFYR4  SCP028X.   CHCAFYR5  SCP028X.   CHCAFYR6  SCP028X.
      CDNLONGR  SCP145X.   CHCSYR11  SCP028X.   CHCSYR12  SCP028X.
      CHCSYR13  SCP028X.   CHCSYR14  SCP028X.   CHCSYR1   SCP028X.
      CHCSYR2   SCP028X.   CHCSYR3   SCP028X.   CHCSYR4   SCP028X.
      CHCSYR5   SCP028X.   CHCSYR6   SCP028X.   CHCSYR7   SCP028X.
      CHCSYR81  SCP028X.   CHCSYR82  SCP028X.   CHCSYR10  SCP028X.
      CHCSYREM  SCP028X.   CHPXYR_C  SCP028X.   CHERNOY2  SCP162X.
      CERVISND  SCP028X.   CERHOS    SCP028X.   CERREAS1  SCP128X.
      CERREA1R  SCP128X.   CERREAS2  SCP128X.   CERREA2R  SCP128X.
      CERREAS3  SCP028X.   CERREA3R  SCP028X.   CERREAS4  SCP171X.
      CERREA4R  SCP171X.   CERREAS5  SCP028X.   CERREA5R  SCP028X.
      CERREAS6  SCP128X.   CERREA6R  SCP128X.   CERREAS7  SCP128X.
      CERREA7R  SCP128X.   CERREAS8  SCP128X.   CERREA8R  SCP128X.
      CHCHYR    SCP028X.   CHCHMOYR  SCP182X.   CHCHNOY2  SCP183X.
      CHCNOYR2  SCP162X.   CSRGYR    SCP028X.   RSRGNOYR  SCP186X.
      CMDLONGR  SCP145X.

      /* CCD FORMAT ASSOCIATIONS */

      CVSLWRD   SCP188X.   CVSLVYR   SCP128X.   CVSLSWYR  SCP128X.
      CVSLSPYR  SCP128X.   CVSLLGYR  SCP128X.   CVSLEVER  SCP128X.
      CVSLDG    SCP128X.   CVSLDGT1  SCP033X.   CVSLDGT2  SCP033X.
      CVSLDGT3  SCP033X.   CVSLDGT4  SCP033X.   CVSLVD01  SCP033X.
      CVSLVD02  SCP033X.   CVSLVD03  SCP033X.   CVSLVD04  SCP033X.
      CVSLVD05  SCP033X.   CVSLVD06  SCP033X.   CVSLVD07  SCP033X.
      CVSLVD08  SCP033X.   CVSLVD09  SCP033X.   CVSLVD10  SCP033X.
      CVSLVD11  SCP033X.   CVSLSW01  SCP033X.   CVSLSW02  SCP033X.
      CVSLSW03  SCP033X.   CVSLSW04  SCP033X.   CVSLSW05  SCP033X.
      CVSLSW06  SCP033X.   CVSLSW07  SCP033X.   CVSLSW08  SCP033X.
      CVSLSW09  SCP033X.   CVSLSP01  SCP033X.   CVSLSP02  SCP033X.
      CVSLSP03  SCP033X.   CVSLSP04  SCP033X.   CVSLSP05  SCP033X.
      CVSLSP06  SCP033X.   CVSLSP07  SCP033X.   CVSLSP08  SCP033X.
      CVSLSP09  SCP033X.   CVSLSP10  SCP033X.   CVSLLG01  SCP033X.
      CVSLLG02  SCP033X.   CVSLLG03  SCP033X.   CVSLLG04  SCP033X.
      CVSLLG05  SCP033X.   CVSLLG06  SCP033X.   CVSLLG07  SCP033X.
      CVSLLG08  SCP033X.   CVSLLG09  SCP033X.   CVSLVAG   SCP182X.
      CVSLSWAG  SCP182X.   CVSLSPAG  SCP182X.   CVSLLGAG  SCP182X.
      CVSLVPB   SCP242X.   CVSLSWPB  SCP242X.   CVSLSPPB  SCP242X.
      CVSLLGPB  SCP242X.   CVSLVSP   SCP028X.   CVSLVPE   SCP028X.
      CVSLSWSP  SCP028X.   CVSLSWPE  SCP028X.   CVSLSPSP  SCP028X.
      CVSLSPPE  SCP028X.   CVSLLGSP  SCP028X.   CVSLLGPE  SCP028X.
      CVSVP01   SCP033X.   CVSVP02   SCP033X.   CVSVP03   SCP033X.
      CVSVP04   SCP033X.   CVSVP05   SCP033X.   CVSVP06   SCP033X.
      CVSVP07   SCP033X.   CVSVP08   SCP033X.   CVSVP09   SCP033X.
      CVSVP10   SCP033X.   CVSSWP01  SCP033X.   CVSSWP02  SCP033X.
      CVSSWP03  SCP033X.   CVSSWP04  SCP033X.   CVSSWP05  SCP033X.
      CVSSWP06  SCP033X.   CVSSWP07  SCP033X.   CVSSWP08  SCP033X.
      CVSSWP09  SCP033X.   CVSSWP10  SCP033X.   CVSSPP01  SCP033X.
      CVSSPP02  SCP033X.   CVSSPP03  SCP033X.   CVSSPP04  SCP033X.
      CVSSPP05  SCP033X.   CVSSPP06  SCP033X.   CVSSPP07  SCP033X.
      CVSSPP08  SCP033X.   CVSSPP09  SCP033X.   CVSSPP10  SCP033X.
      CVSLGP01  SCP033X.   CVSLGP02  SCP033X.   CVSLGP03  SCP033X.
      CVSLGP04  SCP033X.   CVSLGP05  SCP033X.   CVSLGP06  SCP033X.
      CVSLGP07  SCP033X.   CVSLGP08  SCP033X.   CVSLGP09  SCP033X.
      CVSLGP10  SCP033X.

      /* CBL FORMAT ASSOCIATIONS */

      CBALWLK   SCP294X.   CBALLIMB  SCP128X.   CBALVRTG  SCP128X.
      CBALSTED  SCP128X.   CBALMOTR  SCP128X.   CBALFALL  SCP128X.
      CBALPASS  SCP128X.   CBALOTH   SCP128X.   CBALDGHP  SCP128X.
      CBALDG01  SCP033X.   CBALDG02  SCP033X.   CBALDG03  SCP033X.
      CBALDG04  SCP033X.   CBALDG05  SCP033X.   CBALDG06  SCP033X.
      CBALDG07  SCP033X.   CBALDG08  SCP033X.   CBALDG09  SCP033X.
      CBALDG10  SCP033X.   CBALDG11  SCP033X.   CBALDG12  SCP033X.
      CBALPART  SCP128X.   CBALPROB  SCP242X.   CBALHPYR  SCP128X.
      CBALTRET  SCP128X.

      /* CMB FORMAT ASSOCIATIONS */

      RSCL2_C2  SCP319X.   RSCL2_E2  SCP319X.   RSCL3_E3  SCP319X.
      RSCL5_P5  SCP319X.   RSCL5_H5  SCP319X.   RSCL6     SCP324X.

      /* CMS FORMAT ASSOCIATIONS */

      DIFF6M    SCP028X.   DIFFINTF  SCP028X.   DIFFDEG   SCP327X.
      DIFFLNG   SCP328X.   PRESCP6M  SCP028X.   PRESHELP  SCP330X.
      PMEDPED   SCP028X.   PMEDPSY   SCP028X.   PMEDNEU   SCP028X.
      PMEDOTHR  SCP028X.   NSDUH21   SCP028X.   NSDUH3    SCP028X.
      NSDUH31   SCP337X.   NSDUH321  SCP033X.   NSDUH322  SCP118X.
      NSDUH323  SCP033X.   NSDUH324  SCP118X.   NSDUH325  SCP033X.
      NSDUH4    SCP028X.   NSDUH51R  SCP033X.   NSDUH52R  SCP033X.
      NSDUH53R  SCP033X.   NSDUH54R  SCP118X.   NSDUH55R  SCP118X.
      TRTWRE1R  SCP128X.   TRTWH11R  SCP118X.   TRTWH12R  SCP118X.
      TRTWH13R  SCP033X.   TRTWH14R  SCP118X.   TRTWH16R  SCP118X.
      TRTMHP11  SCP118X.   TRTMHP12  SCP033X.   TRTMHP13  SCP118X.
      TRTMHP14  SCP033X.   TRTWRE2R  SCP028X.   TRTWH21R  SCP118X.
      TRTWH22R  SCP118X.   TRTWH23R  SCP118X.   TRTWH24R  SCP118X.
      TRTWH25R  SCP118X.   TRTWH26R  SCP118X.   TRTMHP21  SCP118X.
      TRTMHP22  SCP367X.   TRTMHP23  SCP118X.   TRTMHP24  SCP118X.
      TRTWRE3R  SCP028X.   TRTWH31R  SCP033X.   TRTWH32R  SCP118X.
      TRTWH33R  SCP118X.   TRTWH34R  SCP118X.   TRTWH35R  SCP118X.
      TRTWH36R  SCP118X.   TRTMHP31  SCP118X.   TRTMHP32  SCP118X.
      TRTMHP33  SCP118X.   TRTMHP34  SCP118X.   TRTWRE4R  SCP128X.
      TRTWH41R  SCP118X.   TRTWH42R  SCP118X.   TRTWH43R  SCP033X.
      TRTWH44R  SCP118X.   TRTWH45R  SCP118X.   TRTWH46R  SCP118X.
      TRTMHP41  SCP118X.   TRTMHP42  SCP033X.   TRTMHP43  SCP118X.
      TRTMHP44  SCP118X.   TRTWRE5R  SCP128X.   TRTWH51R  SCP118X.
      TRTWH52R  SCP118X.   TRTWH53R  SCP118X.   TRTWH54R  SCP396X.
      TRTWH55R  SCP118X.   TRTWH56R  SCP118X.   TRTMHP51  SCP118X.
      TRTMHP52  SCP033X.   TRTMHP53  SCP118X.   TRTMHP54  SCP118X.
      TRTWRE6R  SCP128X.   TRTWH61R  SCP118X.   TRTWH62R  SCP033X.
      TRTWH63R  SCP118X.   TRTWH64R  SCP118X.   TRTWH65R  SCP118X.
      TRTWH66R  SCP118X.   TRTMHP61  SCP118X.   TRTMHP62  SCP118X.
      TRTMHP63  SCP033X.   TRTMHP64  SCP118X.   OVRNT6MR  SCP128X.
      OVERWH1R  SCP118X.   OVERWH2R  SCP118X.   OVERWH3R  SCP118X.
      OVERWH4R  SCP033X.   OVERWH5R  SCP419X.   OVERWH6R  SCP118X.
      OVERWH7R  SCP118X.   SH1       SCP028X.   SH2       SCP028X.
      CASEM6M   SCP028X.   CASEMWHO  SCP425X.   TRETHELP  SCP426X.
      TRPYPHIR  SCP128X.   TRPYSCHR  SCP128X.   TRPYSLFR  SCP128X.
      TRPYMEDR  SCP028X.   TRPYCHPR  SCP128X.   TRPYMILR  SCP128X.
      TRPYSHPR  SCP128X.   TRPYIHSR  SCP028X.   TRPYOTHR  SCP128X.
      TRTFREER  SCP128X.   TRTNEED1  SCP128X.   NTRCOSTR  SCP128X.
      NTRLOCR   SCP128X.   NTRNEXPR  SCP128X.   NTRFEARR  SCP128X.
      NTRLOSER  SCP128X.   NTRSAYR   SCP128X.   NTRWAITR  SCP028X.
      NTRTRANR  SCP128X.   NTRINCVR  SCP128X.   NTRFARR   SCP128X.
      NTRCHNOR  SCP128X.   NTROTHR   SCP128X.

      /* CFI FORMAT ASSOCIATIONS */

      CSHFLU12  SCP028X.   CSHFLUNM  SCP451X.   CSHFLUM1  SCP452X.
      CSHFLUY1  SCP453X.   CSHSPFL1  SCP454X.   CSHFLUM2  SCP452X.
      CSHFLUY2  SCP453X.   CSHSPFL2  SCP454X.;
RUN;

PROC CONTENTS DATA=NHIS.SAMCHILD;
   TITLE1 'CONTENTS OF THE 2012 NHIS Sample Child FILE';

PROC FREQ DATA=NHIS.SAMCHILD NOTITLE;
   TABLES RECTYPE/LIST MISSING;
   TITLE1 'FREQUENCY REPORT FOR 2012 NHIS Sample Child FILE';
   TITLE2 '(WEIGHTED)';
   WEIGHT WTFA_SC;

PROC FREQ DATA=NHIS.SAMCHILD NOTITLE;
   TABLES RECTYPE/LIST MISSING;
   TITLE1 'FREQUENCY REPORT FOR 2012 NHIS Sample Child FILE';
   TITLE2 '(UNWEIGHTED)';

* USER NOTE: TO SEE UNFORMATTED VALUES IN PROCEDURES, ADD THE
             STATEMENT: FORMAT _ALL_;
RUN;
