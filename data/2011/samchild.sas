*********************************************************************
 MAY 24, 2012  8:43 AM
 
 This is an example of a SAS program that creates a SAS
 file from the 2011 NHIS Public Use SAMCHILD.DAT ASCII file
 
 This is stored in SAMCHILD.SAS
*********************************************************************;

* USER NOTE: PLACE NEXT STATEMENT IN SUBSEQUENT PROGRAMS;
LIBNAME  NHIS     "C:\NHIS2011";

* USER NOTE: PLACE NEXT STATEMENT IN SUBSEQUENT PROGRAMS
             IF YOU ALLOW PROGRAM TO PERMANENTLY STORE FORMATS;
LIBNAME  LIBRARY  "C:\NHIS2011";

FILENAME ASCIIDAT 'C:\NHIS2011\SAMCHILD.dat';

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
      38                 = "38 Functioning and Disability"
      39                 = "39 Adult Disability Questions Test"
      40                 = "40 Sample Child"
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
"2 Families selected to receive FDB (all persons 1 year and older) and AFD (samp
le adults) sections"
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
   VALUE SCP067X
      1                  = "1 Better"
      2                  = "2 Worse"
      3                  = "3 About the same"
      7                  = "7 Refused"
      8                  = "8 Not ascertained"
      9                  = "9 Don't know"
   ;
   VALUE SCP068X
      000                = "000 None"
      996                = "996 Did not go to school"
      997                = "997 Refused"
      998                = "998 Not ascertained"
      999                = "999 Don't know"
   ;
   VALUE SCP071X
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
   VALUE SCP079X
      0                  = "0 Not true"
      1                  = "1 Sometimes true"
      2                  = "2 Often true"
      7                  = "7 Refused"
      8                  = "8 Not ascertained"
      9                  = "9 Don't know"
   ;
   VALUE SCP080X
      99                 = "99 Unknown"
   ;
   VALUE SCP083X
      1                  = "1 Yes"
      2                  = "2 There is NO place"
      3                  = "3 There is MORE THAN ONE place"
      7                  = "7 Refused"
      8                  = "8 Not ascertained"
      9                  = "9 Don't know"
   ;
   VALUE SCP084X
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
   VALUE SCP086X
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
   VALUE SCP089X
      1                  = "1 Mentioned"
      2                  = "2 Not mentioned"
      7                  = "7 Refused"
      8                  = "8 Not ascertained"
      9                  = "9 Don’t know"
   ;
   VALUE SCP099X
      1                  = "1 Yes"
      2                  = "2 No"
      7                  = "7 Refused"
      8                  = "8 Not ascertained"
      9                  = "9 Don’t know"
   ;
   VALUE SCP116X
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
   VALUE SCP133X
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
   VALUE SCP139X
      1                  = "1 Yes"
      2                  = "2 No"
      7                  = "7 Refused"
      8                  = "8 Not ascertained"
      9                  = "9 Don’t' know"
   ;
   VALUE SCP145X
      97                 = "97 Refused"
      98                 = "98 Not ascertained"
      99                 = "99 Don't know"
   ;
   VALUE SCP146X
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
   VALUE SCP149X
      95                 = "95 95+ times"
      97                 = "97 Refused"
      98                 = "98 Not ascertained"
      99                 = "99 Don't know"
   ;
   VALUE SCP151X
      0                  = "0 Not true"
      1                  = "1 Somewhat true"
      2                  = "2 Certainly true"
      7                  = "7 Refused"
      8                  = "8 Not ascertained"
      9                  = "9 Don't know"
   ;
   VALUE SCP156X
      0                  = "0 No"
      1                  = "1 Yes, minor difficulties"
      2                  = "2 Yes, definite difficulties"
      3                  = "3 Yes, severe difficulties"
      7                  = "7 Refused"
      8                  = "8 Not ascertained"
      9                  = "9 Don't know"
   ;
   VALUE SCP159X
      1                  = "1 A lot"
      2                  = "2 Some"
      3                  = "3 A little"
      7                  = "7 Refused"
      8                  = "8 Not ascertained"
      9                  = "9 Don't know"
   ;
   VALUE SCP160X
      1                  = "1 Less than a month"
      2                  = "2 1-5 months"
      3                  = "3 6 to 12 months"
      4                  = "4 Over a year"
      7                  = "7 Refused"
      8                  = "8 Not ascertained"
      9                  = "9 Don’t know"
   ;
   VALUE SCP162X
      1                  = "1 Not at all"
      2                  = "2 A little"
      3                  = "3 Some"
      4                  = "4 A lot"
      7                  = "7 Refused"
      8                  = "8 Not ascertained"
      9                  = "9 Don't know"
   ;
   VALUE SCP169X
      1                  = "1 Day School"
      2                  = "2 Overnight School"
      7                  = "7 Refused"
      8                  = "8 Not ascertained"
      9                  = "9 Don't know"
   ;
   VALUE SCP199X
      1                  = "1 Mentioned"
      2                  = "2 Not ascertained"
      7                  = "7 Refused"
      8                  = "8 Not ascertained"
      9                  = "9 Don’t know"
   ;
   VALUE SCP228X
      1                  = "1 Mentioned"
      2                  = "2 Not mentioned"
      7                  = "7 Refused"
      8                  = "8 Not ascertained"
      9                  = "9 Don’t' know"
   ;
   VALUE SCP251X
      1                  = "1 Mentioned"
      2                  = "2 Not mentioned"
      7                  = "7 Refused"
      8                  = "8 Not mentioned"
      9                  = "9 Don’t know"
   ;
   VALUE SCP257X
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
   VALUE SCP258X
      1                  = "1 Not at all"
      2                  = "2 A little"
      3                  = "3 Some"
      4                  = "4 A lot"
      7                  = "7 Refused"
      8                  = "8 Not ascertained"
      9                  = "9 Don’t know"
   ;
   VALUE SCP283X
      1                  = "1 vaccination or dose"
      2                  = "2 2 or more vaccination doses"
      7                  = "7 Refused"
      8                  = "8 Not ascertained"
      9                  = "9 Don't know"
   ;
   VALUE SCP284X
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
   VALUE SCP285X
      .                   = '.'
      OTHER              = "Year"
      9997               = "9997 Refused"
      9998               = "9998 Not ascertained"
      9999               = "9999 Don't know"
   ;
   VALUE SCP286X
      1                  = "1 Flu shot"
      2                  = "2 Flu nasal spray (spray, mist or drop in nose)"
      7                  = "7 Refused"
      8                  = "8 Not ascertained"
      9                  = "9 Don't know"
   ;

DATA NHIS.SAMCHILD;
   * CREATE A SAS DATA SET;
   INFILE ASCIIDAT PAD LRECL=355;

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
      CASHYR     3   CASERYR1   3   HAYF1      3   RALLG1     3
      DALLG1     3   SALLG1     3   DIARH1     3   ANEMIA1    3
      EARINF1    3   SEIZE1     3   HAYF2      3   RALLG2     3
      DALLG2     3   SALLG2     3   DIARH2     3   ANEMIA2    3
      FHEAD      3   EARINF2    3   SEIZE2     3   STUTTER    3
      CHSTATYR   3   SCHDAYR1   4   CCOLD2W    3   CINTIL2W   3
      CHEARST1   3   CVISION    3   CBLIND     3   IHSPEQ     3
      IHMOB      3   IHMOBYR    3   PROBRX     3   LEARND     3
      CMHAGM15   3   MHIBOY2    3   CMHAGF15   3   MHIGRL2    3

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
      CERHOS     3   CERREAS1   3   CERREAS2   3   CERREAS3   3
      CERREAS4   3   CERREAS5   3   CERREAS6   3   CERREAS7   3
      CERREAS8   3   CHCHYR     3   CHCHMOYR   3   CHCHNOY2   3
      CHCNOYR2   3   CSRGYR     3   RSRGNOYR   3   CMDLONGR   3

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
      HAYF1        93 -  93    RALLG1       94 -  94
      DALLG1       95 -  95    SALLG1       96 -  96
      DIARH1       97 -  97    ANEMIA1      98 -  98
      EARINF1      99 -  99    SEIZE1      100 - 100
      HAYF2       101 - 101    RALLG2      102 - 102
      DALLG2      103 - 103    SALLG2      104 - 104
      DIARH2      105 - 105    ANEMIA2     106 - 106
      FHEAD       107 - 107    EARINF2     108 - 108
      SEIZE2      109 - 109    STUTTER     110 - 110
      CHSTATYR    111 - 111    SCHDAYR1    112 - 114
      CCOLD2W     115 - 115    CINTIL2W    116 - 116
      CHEARST1    117 - 117    CVISION     118 - 118
      CBLIND      119 - 119    IHSPEQ      120 - 120
      IHMOB       121 - 121    IHMOBYR     122 - 122
      PROBRX      123 - 123    LEARND      124 - 124
      CMHAGM15    125 - 125    MHIBOY2     126 - 127
      CMHAGF15    128 - 128    MHIGRL2     129 - 130


      /* CAU LOCATIONS */

      CUSUALPL    131 - 131    CPLKIND     132 - 132
      CHCPLROU    133 - 133    CHCPLKND    134 - 134
      CHCCHGYR    135 - 135    CHCCHGHI    136 - 136
      CNOUSPL1    137 - 137    CNOUSPL2    138 - 138
      CNOUSPL3    139 - 139    CNOUSPL4    140 - 140
      CNOUSPL5    141 - 141    CNOUSPL6    142 - 142
      CNOUSPL7    143 - 143    CNOUSPL8    144 - 144
      CNOUSPL9    145 - 145    CPRVTRYR    146 - 146
      CPRVTRFD    147 - 147    CDRNANP     148 - 148
      CDRNAI      149 - 149    CHCDLYR1    150 - 150
      CHCDLYR2    151 - 151    CHCDLYR3    152 - 152
      CHCDLYR4    153 - 153    CHCDLYR5    154 - 154
      CHCAFYR     155 - 155    CHCAFYRN    156 - 156
      CHCAFYRF    157 - 157    CHCAFYR1    158 - 158
      CHCAFYR2    159 - 159    CHCAFYR3    160 - 160
      CHCAFYR4    161 - 161    CHCAFYR5    162 - 162
      CHCAFYR6    163 - 163    CDNLONGR    164 - 164
      CHCSYR11    165 - 165    CHCSYR12    166 - 166
      CHCSYR13    167 - 167    CHCSYR14    168 - 168
      CHCSYR1     169 - 169    CHCSYR2     170 - 170
      CHCSYR3     171 - 171    CHCSYR4     172 - 172
      CHCSYR5     173 - 173    CHCSYR6     174 - 174
      CHCSYR7     175 - 175    CHCSYR81    176 - 176
      CHCSYR82    177 - 177    CHCSYR10    178 - 178
      CHCSYREM    179 - 179    CHPXYR_C    180 - 180
      CHERNOY2    181 - 182    CERVISND    183 - 183
      CERHOS      184 - 184    CERREAS1    185 - 185
      CERREAS2    186 - 186    CERREAS3    187 - 187
      CERREAS4    188 - 188    CERREAS5    189 - 189
      CERREAS6    190 - 190    CERREAS7    191 - 191
      CERREAS8    192 - 192    CHCHYR      193 - 193
      CHCHMOYR    194 - 195    CHCHNOY2    196 - 197
      CHCNOYR2    198 - 199    CSRGYR      200 - 200
      RSRGNOYR    201 - 202    CMDLONGR    203 - 203


      /* CMB LOCATIONS */

      RSCL2_C2    204 - 204    RSCL2_E2    205 - 205
      RSCL3_E3    206 - 206    RSCL5_P5    207 - 207
      RSCL5_H5    208 - 208    RSCL6       209 - 209


      /* CMS LOCATIONS */

      DIFF6M      210 - 210    DIFFINTF    211 - 211
      DIFFDEG     212 - 212    DIFFLNG     213 - 213
      PRESCP6M    214 - 214    PRESHELP    215 - 215
      PMEDPED     216 - 216    PMEDPSY     217 - 217
      PMEDNEU     218 - 218    PMEDOTHR    219 - 219
      NSDUH21     220 - 220    NSDUH3      221 - 221
      NSDUH31     222 - 222    NSDUH321    223 - 223
      NSDUH322    224 - 224    NSDUH323    225 - 225
      NSDUH324    226 - 226    NSDUH325    227 - 227
      NSDUH4      228 - 228    NSDUH51R    229 - 229
      NSDUH52R    230 - 230    NSDUH53R    231 - 231
      NSDUH54R    232 - 232    NSDUH55R    233 - 237
      TRTWRE1R    238 - 238    TRTWH11R    239 - 239
      TRTWH12R    240 - 240    TRTWH13R    241 - 241
      TRTWH14R    242 - 242    TRTWH16R    243 - 243
      TRTMHP11    244 - 244    TRTMHP12    245 - 245
      TRTMHP13    246 - 246    TRTMHP14    247 - 247
      TRTWRE2R    248 - 248    TRTWH21R    249 - 249
      TRTWH22R    250 - 250    TRTWH23R    251 - 251
      TRTWH24R    252 - 252    TRTWH25R    253 - 253
      TRTWH26R    254 - 254    TRTMHP21    255 - 255
      TRTMHP22    256 - 256    TRTMHP23    257 - 257
      TRTMHP24    258 - 258    TRTWRE3R    259 - 259
      TRTWH31R    260 - 260    TRTWH32R    261 - 261
      TRTWH33R    262 - 262    TRTWH34R    263 - 263
      TRTWH35R    264 - 264    TRTWH36R    265 - 265
      TRTMHP31    266 - 266    TRTMHP32    267 - 267
      TRTMHP33    268 - 268    TRTMHP34    269 - 269
      TRTWRE4R    270 - 270    TRTWH41R    271 - 271
      TRTWH42R    272 - 272    TRTWH43R    273 - 273
      TRTWH44R    274 - 274    TRTWH45R    275 - 275
      TRTWH46R    276 - 276    TRTMHP41    277 - 277
      TRTMHP42    278 - 278    TRTMHP43    279 - 279
      TRTMHP44    280 - 280    TRTWRE5R    281 - 281
      TRTWH51R    282 - 282    TRTWH52R    283 - 283
      TRTWH53R    284 - 284    TRTWH54R    285 - 285
      TRTWH55R    286 - 286    TRTWH56R    287 - 287
      TRTMHP51    288 - 288    TRTMHP52    289 - 289
      TRTMHP53    290 - 290    TRTMHP54    291 - 291
      TRTWRE6R    292 - 292    TRTWH61R    293 - 293
      TRTWH62R    294 - 294    TRTWH63R    295 - 295
      TRTWH64R    296 - 296    TRTWH65R    297 - 297
      TRTWH66R    298 - 298    TRTMHP61    299 - 299
      TRTMHP62    300 - 300    TRTMHP63    301 - 301
      TRTMHP64    302 - 302    OVRNT6MR    303 - 303
      OVERWH1R    304 - 304    OVERWH2R    305 - 305
      OVERWH3R    306 - 306    OVERWH4R    307 - 307
      OVERWH5R    308 - 308    OVERWH6R    309 - 309
      OVERWH7R    310 - 310    SH1         311 - 311
      SH2         312 - 312    CASEM6M     313 - 313
      CASEMWHO    314 - 315    TRETHELP    316 - 316
      TRPYPHIR    317 - 317    TRPYSCHR    318 - 318
      TRPYSLFR    319 - 319    TRPYMEDR    320 - 320
      TRPYCHPR    321 - 321    TRPYMILR    322 - 322
      TRPYSHPR    323 - 323    TRPYIHSR    324 - 324
      TRPYOTHR    325 - 325    TRTFREER    326 - 326
      TRTNEED1    327 - 327    NTRCOSTR    328 - 328
      NTRLOCR     329 - 329    NTRNEXPR    330 - 330
      NTRFEARR    331 - 331    NTRLOSER    332 - 332
      NTRSAYR     333 - 333    NTRWAITR    334 - 334
      NTRTRANR    335 - 335    NTRINCVR    336 - 336
      NTRFARR     337 - 337    NTRCHNOR    338 - 338
      NTROTHR     339 - 339

      /* CFI LOCATIONS */

      CSHFLU12    340 - 340    CSHFLUNM    341 - 341
      CSHFLUM1    342 - 343    CSHFLUY1    344 - 347
      CSHSPFL1    348 - 348    CSHFLUM2    349 - 350
      CSHFLUY2    351 - 354    CSHSPFL2    355 - 355
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
      CERREAS2   ="Doctor's office or clinic was not open"
      CERREAS3   ="Health provider advised ER visit"
      CERREAS4   ="Problem too serious for doctor's office or clinic"
      CERREAS5   ="Only a hospital could help"
      CERREAS6   ="ER is closest provider"
      CERREAS7   ="ER provides most of child's medical care"
      CERREAS8   ="Arrived by ambulance or other emergency vehicle"
      CHCHYR     ="Received home care from health professional, past 12 m"
      CHCHMOYR   ="# of months of home care, past 12 m"
      CHCHNOY2   ="Total number of home visits"
      CHCNOYR2   ="Total number of office visits, past 12 m"
      CSRGYR     ="Had surgery/surgical procedure, past 12 m"
      RSRGNOYR   ="# of outpatient surgeries, past 12 m"
      CMDLONGR   ="Time since last seen/talked to health professional"

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
      CASHYR    SCP028X.   CASERYR1  SCP028X.   HAYF1     SCP028X.
      RALLG1    SCP028X.   DALLG1    SCP028X.   SALLG1    SCP028X.
      DIARH1    SCP028X.   ANEMIA1   SCP028X.   EARINF1   SCP028X.
      SEIZE1    SCP028X.   HAYF2     SCP028X.   RALLG2    SCP028X.
      DALLG2    SCP028X.   SALLG2    SCP028X.   DIARH2    SCP028X.
      ANEMIA2   SCP028X.   FHEAD     SCP028X.   EARINF2   SCP028X.
      SEIZE2    SCP028X.   STUTTER   SCP028X.   CHSTATYR  SCP067X.
      SCHDAYR1  SCP068X.   CCOLD2W   SCP028X.   CINTIL2W  SCP028X.
      CHEARST1  SCP071X.   CVISION   SCP028X.   CBLIND    SCP028X.
      IHSPEQ    SCP028X.   IHMOB     SCP028X.   IHMOBYR   SCP028X.
      PROBRX    SCP028X.   LEARND    SCP028X.   CMHAGM15  SCP079X.
      MHIBOY2   SCP080X.   CMHAGF15  SCP079X.   MHIGRL2   SCP080X.

      /* CAU FORMAT ASSOCIATIONS */

      CUSUALPL  SCP083X.   CPLKIND   SCP084X.   CHCPLROU  SCP028X.
      CHCPLKND  SCP086X.   CHCCHGYR  SCP028X.   CHCCHGHI  SCP028X.
      CNOUSPL1  SCP089X.   CNOUSPL2  SCP089X.   CNOUSPL3  SCP089X.
      CNOUSPL4  SCP089X.   CNOUSPL5  SCP089X.   CNOUSPL6  SCP089X.
      CNOUSPL7  SCP089X.   CNOUSPL8  SCP089X.   CNOUSPL9  SCP089X.
      CPRVTRYR  SCP028X.   CPRVTRFD  SCP099X.   CDRNANP   SCP028X.
      CDRNAI    SCP028X.   CHCDLYR1  SCP028X.   CHCDLYR2  SCP028X.
      CHCDLYR3  SCP028X.   CHCDLYR4  SCP028X.   CHCDLYR5  SCP028X.
      CHCAFYR   SCP028X.   CHCAFYRN  SCP028X.   CHCAFYRF  SCP028X.
      CHCAFYR1  SCP028X.   CHCAFYR2  SCP028X.   CHCAFYR3  SCP028X.
      CHCAFYR4  SCP028X.   CHCAFYR5  SCP028X.   CHCAFYR6  SCP028X.
      CDNLONGR  SCP116X.   CHCSYR11  SCP028X.   CHCSYR12  SCP028X.
      CHCSYR13  SCP028X.   CHCSYR14  SCP028X.   CHCSYR1   SCP028X.
      CHCSYR2   SCP028X.   CHCSYR3   SCP028X.   CHCSYR4   SCP028X.
      CHCSYR5   SCP028X.   CHCSYR6   SCP028X.   CHCSYR7   SCP028X.
      CHCSYR81  SCP028X.   CHCSYR82  SCP028X.   CHCSYR10  SCP028X.
      CHCSYREM  SCP028X.   CHPXYR_C  SCP028X.   CHERNOY2  SCP133X.
      CERVISND  SCP028X.   CERHOS    SCP028X.   CERREAS1  SCP099X.
      CERREAS2  SCP099X.   CERREAS3  SCP028X.   CERREAS4  SCP139X.
      CERREAS5  SCP028X.   CERREAS6  SCP099X.   CERREAS7  SCP099X.
      CERREAS8  SCP099X.   CHCHYR    SCP028X.   CHCHMOYR  SCP145X.
      CHCHNOY2  SCP146X.   CHCNOYR2  SCP133X.   CSRGYR    SCP028X.
      RSRGNOYR  SCP149X.   CMDLONGR  SCP116X.

      /* CMB FORMAT ASSOCIATIONS */

      RSCL2_C2  SCP151X.   RSCL2_E2  SCP151X.   RSCL3_E3  SCP151X.
      RSCL5_P5  SCP151X.   RSCL5_H5  SCP151X.   RSCL6     SCP156X.

      /* CMS FORMAT ASSOCIATIONS */

      DIFF6M    SCP028X.   DIFFINTF  SCP028X.   DIFFDEG   SCP159X.
      DIFFLNG   SCP160X.   PRESCP6M  SCP028X.   PRESHELP  SCP162X.
      PMEDPED   SCP028X.   PMEDPSY   SCP028X.   PMEDNEU   SCP028X.
      PMEDOTHR  SCP028X.   NSDUH21   SCP028X.   NSDUH3    SCP028X.
      NSDUH31   SCP169X.   NSDUH321  SCP033X.   NSDUH322  SCP089X.
      NSDUH323  SCP033X.   NSDUH324  SCP089X.   NSDUH325  SCP033X.
      NSDUH4    SCP028X.   NSDUH51R  SCP033X.   NSDUH52R  SCP033X.
      NSDUH53R  SCP033X.   NSDUH54R  SCP089X.   NSDUH55R  SCP089X.
      TRTWRE1R  SCP099X.   TRTWH11R  SCP089X.   TRTWH12R  SCP089X.
      TRTWH13R  SCP033X.   TRTWH14R  SCP089X.   TRTWH16R  SCP089X.
      TRTMHP11  SCP089X.   TRTMHP12  SCP033X.   TRTMHP13  SCP089X.
      TRTMHP14  SCP033X.   TRTWRE2R  SCP028X.   TRTWH21R  SCP089X.
      TRTWH22R  SCP089X.   TRTWH23R  SCP089X.   TRTWH24R  SCP089X.
      TRTWH25R  SCP089X.   TRTWH26R  SCP089X.   TRTMHP21  SCP089X.
      TRTMHP22  SCP199X.   TRTMHP23  SCP089X.   TRTMHP24  SCP089X.
      TRTWRE3R  SCP028X.   TRTWH31R  SCP033X.   TRTWH32R  SCP089X.
      TRTWH33R  SCP089X.   TRTWH34R  SCP089X.   TRTWH35R  SCP089X.
      TRTWH36R  SCP089X.   TRTMHP31  SCP089X.   TRTMHP32  SCP089X.
      TRTMHP33  SCP089X.   TRTMHP34  SCP089X.   TRTWRE4R  SCP099X.
      TRTWH41R  SCP089X.   TRTWH42R  SCP089X.   TRTWH43R  SCP033X.
      TRTWH44R  SCP089X.   TRTWH45R  SCP089X.   TRTWH46R  SCP089X.
      TRTMHP41  SCP089X.   TRTMHP42  SCP033X.   TRTMHP43  SCP089X.
      TRTMHP44  SCP089X.   TRTWRE5R  SCP099X.   TRTWH51R  SCP089X.
      TRTWH52R  SCP089X.   TRTWH53R  SCP089X.   TRTWH54R  SCP228X.
      TRTWH55R  SCP089X.   TRTWH56R  SCP089X.   TRTMHP51  SCP089X.
      TRTMHP52  SCP033X.   TRTMHP53  SCP089X.   TRTMHP54  SCP089X.
      TRTWRE6R  SCP099X.   TRTWH61R  SCP089X.   TRTWH62R  SCP033X.
      TRTWH63R  SCP089X.   TRTWH64R  SCP089X.   TRTWH65R  SCP089X.
      TRTWH66R  SCP089X.   TRTMHP61  SCP089X.   TRTMHP62  SCP089X.
      TRTMHP63  SCP033X.   TRTMHP64  SCP089X.   OVRNT6MR  SCP099X.
      OVERWH1R  SCP089X.   OVERWH2R  SCP089X.   OVERWH3R  SCP089X.
      OVERWH4R  SCP033X.   OVERWH5R  SCP251X.   OVERWH6R  SCP089X.
      OVERWH7R  SCP089X.   SH1       SCP028X.   SH2       SCP028X.
      CASEM6M   SCP028X.   CASEMWHO  SCP257X.   TRETHELP  SCP258X.
      TRPYPHIR  SCP099X.   TRPYSCHR  SCP099X.   TRPYSLFR  SCP099X.
      TRPYMEDR  SCP028X.   TRPYCHPR  SCP099X.   TRPYMILR  SCP099X.
      TRPYSHPR  SCP099X.   TRPYIHSR  SCP028X.   TRPYOTHR  SCP099X.
      TRTFREER  SCP099X.   TRTNEED1  SCP099X.   NTRCOSTR  SCP099X.
      NTRLOCR   SCP099X.   NTRNEXPR  SCP099X.   NTRFEARR  SCP099X.
      NTRLOSER  SCP099X.   NTRSAYR   SCP099X.   NTRWAITR  SCP028X.
      NTRTRANR  SCP099X.   NTRINCVR  SCP099X.   NTRFARR   SCP099X.
      NTRCHNOR  SCP099X.   NTROTHR   SCP099X.

      /* CFI FORMAT ASSOCIATIONS */

      CSHFLU12  SCP028X.   CSHFLUNM  SCP283X.   CSHFLUM1  SCP284X.
      CSHFLUY1  SCP285X.   CSHSPFL1  SCP286X.   CSHFLUM2  SCP284X.
      CSHFLUY2  SCP285X.   CSHSPFL2  SCP286X.;
RUN;

PROC CONTENTS DATA=NHIS.SAMCHILD;
   TITLE1 'CONTENTS OF THE 2011 NHIS Sample Child FILE';

PROC FREQ DATA=NHIS.SAMCHILD NOTITLE;
   TABLES RECTYPE/LIST MISSING;
   TITLE1 'FREQUENCY REPORT FOR 2011 NHIS Sample Child FILE';
   TITLE2 '(WEIGHTED)';
   WEIGHT WTFA_SC;

PROC FREQ DATA=NHIS.SAMCHILD NOTITLE;
   TABLES RECTYPE/LIST MISSING;
   TITLE1 'FREQUENCY REPORT FOR 2011 NHIS Sample Child FILE';
   TITLE2 '(UNWEIGHTED)';

* USER NOTE: TO SEE UNFORMATTED VALUES IN PROCEDURES, ADD THE
             STATEMENT: FORMAT _ALL_;
RUN;
