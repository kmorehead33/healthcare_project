*********************************************************************
 JUNE 8, 2009 11:24 AM
 
 This is an example of a SAS program that creates a SAS
 file from the 2008 NHIS Public Use SAMCHILD.DAT ASCII file
 
 This is stored in SAMCHILD.SAS
*********************************************************************;

* USER NOTE: PLACE NEXT STATEMENT IN SUBSEQUENT PROGRAMS;
LIBNAME  NHIS     "C:\NHIS2008";

* USER NOTE: PLACE NEXT STATEMENT IN SUBSEQUENT PROGRAMS
             IF YOU ALLOW PROGRAM TO PERMANENTLY STORE FORMATS;
LIBNAME  LIBRARY  "C:\NHIS2008";

FILENAME ASCIIDAT 'C:\NHIS2008\SAMCHILD.dat';

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
      30                 = "30 Sample Adult"
      31                 = "31 Sample Adult Cancer"
      40                 = "40 Sample Child"
      60                 = "60 Family"
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
      97                 = "97 Refused"
      98                 = "98 Not ascertained"
      99                 = "99 Don't know"
   ;
   VALUE SCP022X
      97                 = "97 Refused"
      98                 = "98 Not ascertained"
      99                 = "99 Don't know"
   ;
   VALUE SCP023X
      9997               = "9997 Refused"
      9998               = "9998 Not ascertained"
      9999               = "9999 Don't know"
   ;
   VALUE SCP024X
      96                 = "96 Not available"
      97                 = "97 Refused"
      98                 = "98 Not ascertained"
      99                 = "99 Unknown"
   ;
   VALUE SCP025X
      996                = "996 Not available"
      997                = "997 Refused"
      998                = "998 Not ascertained"
      999                = "999 Unknown"
   ;
   VALUE SCP026X
      9995               = "9995 99.95+"
      9999               = "9999 Unknown"
   ;
   VALUE SCP027X
      1                  = "1 Yes"
      2                  = "2 No"
      7                  = "7 Refused"
      8                  = "8 Not ascertained"
      9                  = "9 Don't know"
   ;
   VALUE SCP032X
      1                  = "1 Mentioned"
      2                  = "2 Not mentioned"
      7                  = "7 Refused"
      8                  = "8 Not ascertained"
      9                  = "9 Don't know"
   ;
   VALUE SCP042X
      1                  = "1 Yes"
      2                  = "2 No"
      7                  = "7 Refused"
      9                  = "9 Don't know"
   ;
   VALUE SCP049X
      1                  = "1 Yes"
      2                  = "2 No"
      3                  = "3 Still in the hospital"
      7                  = "7 Refused"
      8                  = "8 Not ascertained"
      9                  = "9 Don't know"
   ;
   VALUE SCP050X
      995                = "995 Child was home schooled"
      996                = 
"996 child did not go to day care, preschool, school, or work"
      997                = "997 Refused"
      998                = "998 Not ascertained"
      999                = "999 Don't know"
   ;
   VALUE SCP062X
      1                  = "1 Yes"
      2                  = "2 No"
      3                  = "3 Was told no changes needed"
      7                  = "7 Refused"
      8                  = "8 Not ascertained"
      9                  = "9 Don't know"
   ;
   VALUE SCP063X
      0                  = "0 None"
      1                  = "1 A little"
      2                  = "2 Some"
      3                  = "3 Most"
      4                  = "4 All"
      7                  = "7 Refused"
      8                  = "8 Not ascertained"
      9                  = "9 Don't know"
   ;
   VALUE SCP082X
      1                  = "1 Better"
      2                  = "2 Worse"
      3                  = "3 About the same"
      7                  = "7 Refused"
      8                  = "8 Not ascertained"
      9                  = "9 Don't know"
   ;
   VALUE SCP083X
      000                = "000 None"
      996                = "996 Did not go to school"
      997                = "997 Refused"
      998                = "998 Not ascertained"
      999                = "999 Don't know"
   ;
   VALUE SCP086X
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
   VALUE SCP090X
      1                  = "1 In the last 12 months"
      2                  = "2 In the last 13-24 months"
      3                  = "3 Over 24 months"
      7                  = "7 Refused"
      8                  = "8 Not ascertained"
      9                  = "9 Don't know"
   ;
   VALUE SCP095X
      1                  = "1 Always"
      2                  = "2 Most of the time"
      3                  = "3 Some of the time"
      4                  = "4 None of the time"
      7                  = "7 Refused"
      8                  = "8 Not ascertained"
      9                  = "9 Don't know"
   ;
   VALUE SCP101X
      0                  = "0 Not true"
      1                  = "1 Sometimes true"
      2                  = "2 Often true"
      7                  = "7 Refused"
      8                  = "8 Not ascertained"
      9                  = "9 Don't know"
   ;
   VALUE SCP102X
      99                 = "99 Unknown"
   ;
   VALUE SCP105X
      1                  = "1 Yes"
      2                  = "2 There is NO place"
      3                  = "3 There is MORE THAN ONE place"
      7                  = "7 Refused"
      8                  = "8 Not ascertained"
      9                  = "9 Don't know"
   ;
   VALUE SCP106X
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
   VALUE SCP108X
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
   VALUE SCP121X
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
   VALUE SCP138X
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
   VALUE SCP140X
      97                 = "97 Refused"
      98                 = "98 Not ascertained"
      99                 = "99 Don't know"
   ;
   VALUE SCP141X
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
   VALUE SCP144X
      95                 = "95 95+ times"
      97                 = "97 Refused"
      98                 = "98 Not ascertained"
      99                 = "99 Don't know"
   ;
   VALUE SCP147X
      997                = "997 Refused"
      998                = "998 Not ascertained"
      999                = "999 Don't know"
   ;
   VALUE SCP148X
      1                  = "1 Very good"
      2                  = "2 Good"
      3                  = "3 Fair"
      4                  = "4 Poor"
      7                  = "7 Refused"
      8                  = "8 Not ascertained"
      9                  = "9 Don't know"
   ;
   VALUE SCP149X
      1                  = "1 Better"
      2                  = "2 Same"
      3                  = "3 Not as good"
      7                  = "7 Refused"
      8                  = "8 Not ascertained"
      9                  = "9 Don't know"
   ;
   VALUE SCP150X
      1                  = "1 Often"
      2                  = "2 Sometimes"
      3                  = "3 Rarely"
      4                  = "4 Never"
      7                  = "7 Refused"
      8                  = "8 Not ascertained"
      9                  = "9 Don't know"
   ;
   VALUE SCP151X
      01                 = "01 None to less than 1 hour"
      02                 = "02 1 hour, less than 3 hours"
      03                 = "03 3 hours, less than 5 hours"
      04                 = "04 5 hours, less than 7 hours"
      05                 = "05 7 or more hours"
      06                 = "06 Doesn't go to school"
      07                 = "07 Did not have this type of dental care"
      97                 = "97 Refused"
      98                 = "98 Not ascertained"
      99                 = "99 Don't know"
   ;
   VALUE SCP153X
      01                 = "01 None or less than 1 hour"
      02                 = "02 1 hour, less than 3 hours"
      03                 = "03 3 hours, less than 5 hours"
      04                 = "04 5 hours, less than 7 hours"
      05                 = "05 7 or more hours"
      06                 = "06 Doesn't go to school"
      07                 = "07 did not have this type of dental care"
      97                 = "97 Refused"
      98                 = "98 Not ascertained"
      99                 = "99 Don't know"
   ;
   VALUE SCP168X
      1                  = "1 Dentist"
      2                  = "2 Medical doctor"
      3                  = "3 Both"
      7                  = "7 Refused"
      8                  = "8 Not ascertained"
      9                  = "9 Don't know"
   ;
   VALUE SCP176X
      1                  = "1 Yes"
      2                  = "2 No"
      3                  = "3 Doesn't go to school"
      7                  = "7 Refused"
      8                  = "8 Not ascertained"
      9                  = "9 Don't know"
   ;
   VALUE SCP177X
      1                  = "1 Yes"
      2                  = "2 No"
      3                  = "3 Doesn't work"
      7                  = "7 Refused"
      8                  = "8 Not ascertained"
      9                  = "9 Don't know"
   ;
   VALUE SCP182X
      0                  = "0 No"
      1                  = "1 Yes, minor difficulties"
      2                  = "2 Yes, definite difficulties"
      3                  = "3 Yes, severe difficulties"
      7                  = "7 Refused"
      8                  = "8 Not ascertained"
      9                  = "9 Don't know"
   ;
   VALUE SCP184X
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
   VALUE SCP185X
      .                   = '.'
      OTHER              = "Year"
      9997               = "9997 Refused"
      9998               = "9998 Not ascertained"
      9999               = "9999 Don't know"
   ;
   VALUE SCP190X
      1                  = "1 Yes"
      2                  = "2 No"
      3                  = "3 Doctor refused when asked"
      7                  = "7 Refused"
      8                  = "8 Not ascertained"
      9                  = "9 Don't know"
   ;
   VALUE SCP191X
      96                 = "96 All shots"
      97                 = "97 Refused"
      98                 = "98 Not ascertained"
      99                 = "99 Don't know"
   ;
   VALUE SCP193X
      01                 = "01 Does not need vaccine"
      02                 = "02 Not sexually active"
      03                 = "03 Too expensive"
      04                 = "04 Too young for vaccine"
      05                 = "05 Doctor didn't recommend it"
      06                 = "06 Worried about safety of vaccine"
      07                 = "07 Don't know where to get vaccine"
      08                 = "08 My spouse/family member is against it"
      09                 = "09 Don't know enough about vaccine"
      10                 = "10 Already has HPV"
      11                 = "11 Other"
      97                 = "97 Refused"
      98                 = "98 Not ascertained"
      99                 = "99 Don't know"
   ;

DATA NHIS.SAMCHILD;
   * CREATE A SAS DATA SET;
   INFILE ASCIIDAT PAD LRECL=266;

   * DEFINE LENGTH OF ALL VARIABLES;

   LENGTH

      /* IDN LENGTHS */

      RECTYPE    3   SRVY_YR    4   HHX      $ 6   INTV_QRT   3
      ASSIGNWK   3   FMX      $ 2   FPX      $ 2   WTIA_SC    8
      WTFA_SC    8

      /* UCF LENGTHS */

      REGION     3   STRAT_P    4   PSU_P      3

      /* HHC LENGTHS */

      SEX        3   HISPAN_I   3   RACERPI2   3   MRACRPI2   3
      MRACBPI2   3   AGE_P      3

      /* CID LENGTHS */

      CSRESPNO $ 2   CSRELTIV   3

      /* CHS LENGTHS */

      BWGTLB     3   BWGTOZ     3   BWGTMGR    4   CHGHT_TC   3
      CWGHT_TC   4   BMI_SC     4   AMR1       3   AODD1      3
      ADD2       3   AMR2       3   AODD2      3   CCONDL01   3
      CCONDL02   3   CCONDL03   3   CCONDL04   3   CCONDL05   3
      CCONDL06   3   CCONDL07   3   CCONDL08   3   CCONDL09   3
      CCONDL10   3   CPOX       3   CPOX12MO   3   CASHMEV    3
      CASSTILL   3   CASHYR     3   CASMERYR   3   CASMHSP    3
      CASMMC     3   CWZMSWK    4   CWZPIN     3   CASMINST   3
      CASMPMED   3   CASMCAN    3   CASMED     3   CASMDTP    3
      CASWMP     3   CASCLASS   3   CAS_REC    3   CAS_RES    3
      CAS_MON    3   CAPENVLN   3   CAPENVDO   3   HAYF1      3
      RALLG1     3   DALLG1     3   SALLG1     3   DIARH1     3
      ANEMIA1    3   EARINF1    3   SEIZE1     3   HAYF2      3
      RALLG2     3   DALLG2     3   SALLG2     3   DIARH2     3
      ANEMIA2    3   FHEAD      3   EARINF2    3   SEIZE2     3
      STUTTER    3   CHSTATYR   3   SCHDAYR1   4   CCOLD2W    3
      CINTIL2W   3   CHEARST1   3   CVISION    3   CBLIND     3
      CVISTST    3   CVISLT     3   CVISGLAS   3   CVISDIST   3
      CVISREAD   3   CVISACT    3   CVISPROT   3   IHSPEQ     3
      IHMOB      3   IHMOBYR    3   PROBRX     3   LEARND     3
      CMHAGM15   3   MHIBOY2    3   CMHAGF15   3   MHIGRL2    3

      /* CAU LENGTHS */

      CUSUALPL   3   CPLKIND    3   CHCPLROU   3   CHCPLKND   3
      CHCCHGYR   3   CHCCHGHI   3   CHCDLYR1   3   CHCDLYR2   3
      CHCDLYR3   3   CHCDLYR4   3   CHCDLYR5   3   CHCAFYR    3
      CHCAFYR1   3   CHCAFYR2   3   CHCAFYR3   3   CHCAFYR4   3
      CDNLONGR   3   CHCSYR11   3   CHCSYR12   3   CHCSYR13   3
      CHCSYR14   3   CHCSYR1    3   CHCSYR2    3   CHCSYR3    3
      CHCSYR4    3   CHCSYR5    3   CHCSYR6    3   CHCSYR7    3
      CHCSYR81   3   CHCSYR82   3   CHCSYR10   3   CHCSYREM   3
      CHPXYR_C   3   CHERNOY2   3   CHCHYR     3   CHCHMOYR   3
      CHCHNOY2   3   CHCNOYR2   3   CSRGYR     3   RSRGNOYR   3
      CMDLONGR   3   CSNLAMP    3   CSNNUM     4

      /* COH LENGTHS */

      COCOND     3   COBTWS     3   COEMB      3   COREAS_1   3
      COREAS_2   3   COREAS_3   3   COREAS_4   3   CPROB_01   3
      CPROB_02   3   CPROB_03   3   CPROB_04   3   CPROB_05   3
      CPROB_06   3   CPROB_07   3   CPROB_08   3   CPROB_09   3
      CPROB_10   3   CPROB_11   3   CPROB_12   3   CODENT1    3
      CODENT2    3   CNODEN_1   3   CNODEN_2   3   CNODEN_3   3
      CNODEN_4   3   CNODEN_5   3   CNODEN_6   3   CNODEN_7   3
      COINT_1    3   COINT_2    3   COINT_3    3   COINT_4    3
      COINT_5    3   COINT_6    3

      /* CMB LENGTHS */

      RSCL6      3

      /* CFI LENGTHS */

      CSHFLUYR   3   CSHFLU_M   3   CSHFLU_Y   4   CSPFLUYR   3
      CSPFLU_M   3   CSPFLU_Y   4

      /* CHP LENGTHS */

      CHPVHRD    3   CSHTHPV    3   CSHHPVDS   3   CHPVREC    3
      CHPVNOT    3   CHPVCOST   3   CHPVLOC    3 ;

   * INPUT ALL VARIABLES;

   INPUT

      /* IDN LOCATIONS */

      RECTYPE       1 -   2    SRVY_YR       3 -   6
      HHX      $    7 -  12    INTV_QRT     13 -  13
      ASSIGNWK     14 -  15    FMX      $   16 -  17
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


      /* CHS LOCATIONS */

      BWGTLB       54 -  55    BWGTOZ       56 -  57
      BWGTMGR      58 -  61    CHGHT_TC     62 -  63
      CWGHT_TC     64 -  66    BMI_SC       67 -  70
      AMR1         71 -  71    AODD1        72 -  72
      ADD2         73 -  73    AMR2         74 -  74
      AODD2        75 -  75    CCONDL01     76 -  76
      CCONDL02     77 -  77    CCONDL03     78 -  78
      CCONDL04     79 -  79    CCONDL05     80 -  80
      CCONDL06     81 -  81    CCONDL07     82 -  82
      CCONDL08     83 -  83    CCONDL09     84 -  84
      CCONDL10     85 -  85    CPOX         86 -  86
      CPOX12MO     87 -  87    CASHMEV      88 -  88
      CASSTILL     89 -  89    CASHYR       90 -  90
      CASMERYR     91 -  91    CASMHSP      92 -  92
      CASMMC       93 -  93    CWZMSWK      94 -  96
      CWZPIN       97 -  97    CASMINST     98 -  98
      CASMPMED     99 -  99    CASMCAN     100 - 100
      CASMED      101 - 101    CASMDTP     102 - 102
      CASWMP      103 - 103    CASCLASS    104 - 104
      CAS_REC     105 - 105    CAS_RES     106 - 106
      CAS_MON     107 - 107    CAPENVLN    108 - 108
      CAPENVDO    109 - 109    HAYF1       110 - 110
      RALLG1      111 - 111    DALLG1      112 - 112
      SALLG1      113 - 113    DIARH1      114 - 114
      ANEMIA1     115 - 115    EARINF1     116 - 116
      SEIZE1      117 - 117    HAYF2       118 - 118
      RALLG2      119 - 119    DALLG2      120 - 120
      SALLG2      121 - 121    DIARH2      122 - 122
      ANEMIA2     123 - 123    FHEAD       124 - 124
      EARINF2     125 - 125    SEIZE2      126 - 126
      STUTTER     127 - 127    CHSTATYR    128 - 128
      SCHDAYR1    129 - 131    CCOLD2W     132 - 132
      CINTIL2W    133 - 133    CHEARST1    134 - 134
      CVISION     135 - 135    CBLIND      136 - 136
      CVISTST     137 - 137    CVISLT      138 - 138
      CVISGLAS    139 - 139    CVISDIST    140 - 140
      CVISREAD    141 - 141    CVISACT     142 - 142
      CVISPROT    143 - 143    IHSPEQ      144 - 144
      IHMOB       145 - 145    IHMOBYR     146 - 146
      PROBRX      147 - 147    LEARND      148 - 148
      CMHAGM15    149 - 149    MHIBOY2     150 - 151
      CMHAGF15    152 - 152    MHIGRL2     153 - 154


      /* CAU LOCATIONS */

      CUSUALPL    155 - 155    CPLKIND     156 - 156
      CHCPLROU    157 - 157    CHCPLKND    158 - 158
      CHCCHGYR    159 - 159    CHCCHGHI    160 - 160
      CHCDLYR1    161 - 161    CHCDLYR2    162 - 162
      CHCDLYR3    163 - 163    CHCDLYR4    164 - 164
      CHCDLYR5    165 - 165    CHCAFYR     166 - 166
      CHCAFYR1    167 - 167    CHCAFYR2    168 - 168
      CHCAFYR3    169 - 169    CHCAFYR4    170 - 170
      CDNLONGR    171 - 171    CHCSYR11    172 - 172
      CHCSYR12    173 - 173    CHCSYR13    174 - 174
      CHCSYR14    175 - 175    CHCSYR1     176 - 176
      CHCSYR2     177 - 177    CHCSYR3     178 - 178
      CHCSYR4     179 - 179    CHCSYR5     180 - 180
      CHCSYR6     181 - 181    CHCSYR7     182 - 182
      CHCSYR81    183 - 183    CHCSYR82    184 - 184
      CHCSYR10    185 - 185    CHCSYREM    186 - 186
      CHPXYR_C    187 - 187    CHERNOY2    188 - 189
      CHCHYR      190 - 190    CHCHMOYR    191 - 192
      CHCHNOY2    193 - 194    CHCNOYR2    195 - 196
      CSRGYR      197 - 197    RSRGNOYR    198 - 199
      CMDLONGR    200 - 200    CSNLAMP     201 - 201
      CSNNUM      202 - 204

      /* COH LOCATIONS */

      COCOND      205 - 205    COBTWS      206 - 206
      COEMB       207 - 207    COREAS_1    208 - 209
      COREAS_2    210 - 211    COREAS_3    212 - 213
      COREAS_4    214 - 215    CPROB_01    216 - 216
      CPROB_02    217 - 217    CPROB_03    218 - 218
      CPROB_04    219 - 219    CPROB_05    220 - 220
      CPROB_06    221 - 221    CPROB_07    222 - 222
      CPROB_08    223 - 223    CPROB_09    224 - 224
      CPROB_10    225 - 225    CPROB_11    226 - 226
      CPROB_12    227 - 227    CODENT1     228 - 228
      CODENT2     229 - 229    CNODEN_1    230 - 230
      CNODEN_2    231 - 231    CNODEN_3    232 - 232
      CNODEN_4    233 - 233    CNODEN_5    234 - 234
      CNODEN_6    235 - 235    CNODEN_7    236 - 236
      COINT_1     237 - 237    COINT_2     238 - 238
      COINT_3     239 - 239    COINT_4     240 - 240
      COINT_5     241 - 241    COINT_6     242 - 242


      /* CMB LOCATIONS */

      RSCL6       243 - 243

      /* CFI LOCATIONS */

      CSHFLUYR    244 - 244    CSHFLU_M    245 - 246
      CSHFLU_Y    247 - 250    CSPFLUYR    251 - 251
      CSPFLU_M    252 - 253    CSPFLU_Y    254 - 257


      /* CHP LOCATIONS */

      CHPVHRD     258 - 258    CSHTHPV     259 - 259
      CSHHPVDS    260 - 261    CHPVREC     262 - 262
      CHPVNOT     263 - 264    CHPVCOST    265 - 265
      CHPVLOC     266 - 266;

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

      /* CHS LABELS */

      BWGTLB     ="Birth weight in pounds"
      BWGTOZ     ="Birth weight in ounces"
      BWGTMGR    ="Birth weight in grams"
      CHGHT_TC   ="Total current height in inches (truncated)"
      CWGHT_TC   ="Current weight in pounds (truncated)"
      BMI_SC     ="Body Mass Index (BMI)"
      AMR1       ="Ever told SC had mental retardation"
      AODD1      ="Ever told SC had other developmental delay"
      ADD2       ="Ever told SC had ADHD/ADD"
      AMR2       ="Ever told SC had mental retardation"
      AODD2      ="Ever told SC had other developmental delay"
      CCONDL01   ="Ever told SC had Down syndrome"
      CCONDL02   ="Ever told SC had cerebral palsy"
      CCONDL03   ="Ever told SC had muscular dystrophy"
      CCONDL04   ="Ever told SC had cystic fibrosis"
      CCONDL05   ="Ever told SC had sickle cell anemia"
      CCONDL06   ="Ever told SC had autism"
      CCONDL07   ="Ever told SC had diabetes"
      CCONDL08   ="Ever told SC had arthritis"
      CCONDL09   ="Ever told SC had congenital heart disease"
      CCONDL10   ="Ever told SC had other heart condition"
      CPOX       ="Ever had chickenpox"
      CPOX12MO   ="Chickenpox, past 12 m"
      CASHMEV    ="Ever been told SC had asthma"
      CASSTILL   ="Still have asthma"
      CASHYR     ="Had an asthma episode/attack, past 12 m"
      CASMERYR   ="Had visit to ER due to asthma, past 12 m"
      CASMHSP    ="Stayed overnight in a hospital because of asthma, past 12 m"
      CASMMC     =
"Health professional talk with you about long term management of asthma"
      CWZMSWK    ="# DAYS of school/work missed because of asthma, past 12 m"
      CWZPIN     ="EVER used a PRESCRIPTION inhaler"
      CASMINST   ="Has health professional shown SC how to use inhaler"
      CASMPMED   =
"Used PRESCRIPTION inhaler THAT YOU BREATHE IN THROUGH YOUR MOUTH, that gives QU
ICK relief from asthma symptoms, past 3 m"
      CASMCAN    =
"Used more than three canisters of this type of inhaler, past 3 m."
      CASMED     =
"EVER taken the preventive kind of ASTHMA medicine everyday to protect lungs and
 keep from having attacks"
      CASMDTP    ="NOW taking this medication daily or almost daily"
      CASWMP     ="Doctor EVER give an asthma action plan"
      CASCLASS   ="EVER took a course/class on how to manage asthma"
      CAS_REC    =
"Doctor EVER taught parent how to recognize early signs of an asthma episode"
      CAS_RES    =
"Doctor EVER taught parent how to respond to episodes of asthma"
      CAS_MON    =
"Doctor EVER taught parent how to monitor peak flow for daily therapy"
      CAPENVLN   =
"Doctor EVER advised to change things in home to improve asthma"
      CAPENVDO   ="Amount of doctor's advice followed"
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
      CVISTST    ="EVER had vision tested by a doctor"
      CVISLT     ="When was vision last tested"
      CVISGLAS   ="Wear eyeglasses or contact lenses"
      CVISDIST   =
"Eyeglasses/contact lenses to read street signs/see in the distance"
      CVISREAD   =
"Eyeglasses or contact lenses to read books, write, to see well up close?"
      CVISACT    =
"Participate in sports/other activities that can cause eye injury"
      CVISPROT   ="Use of eye protection"
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
      CPLKIND    ="Place to go when sick (most often)"
      CHCPLROU   ="USUALLY go there for routine/preventive care"
      CHCPLKND   ="Place USUALLY go for routine/preventive care"
      CHCCHGYR   ="Change health care place, past 12 m"
      CHCCHGHI   ="Change related to health insurance"
      CHCDLYR1   ="Couldn't get through on phone, past 12 m"
      CHCDLYR2   ="Couldn't get appointment soon enough, past 12 m"
      CHCDLYR3   ="Wait too long in doctor's office, past 12 m"
      CHCDLYR4   ="Not open when you could go, past 12 m"
      CHCDLYR5   ="No transportation, past 12 m"
      CHCAFYR    ="Can't afford prescription medicine, past 12 m"
      CHCAFYR1   ="Can't afford prescription medicine, past 12 m"
      CHCAFYR2   ="Can't afford mental care/counseling, past 12 m"
      CHCAFYR3   ="Can't afford dental care, past 12 m"
      CHCAFYR4   ="Can't afford eyeglasses, past 12 m"
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
      CHCHYR     ="Received home care from health professional, past 12 m"
      CHCHMOYR   ="# of months of home care, past 12 m"
      CHCHNOY2   ="Total number of home visits"
      CHCNOYR2   ="Total number of office visits, past 12 m"
      CSRGYR     ="Had surgery/surgical procedure, past 12 m"
      RSRGNOYR   ="# of outpatient surgeries, past 12 m"
      CMDLONGR   ="Time since last seen/talked to health professional"
      CSNLAMP    ="Used indoor tanning device EVEN ONE TIME, past 12 m"
      CSNNUM     ="# times used indoor tanning device, past 12 m"

      /* COH LABELS */

      COCOND     ="Description of condition of mouth and teeth"
      COBTWS     ="Condition of mouth and teeth compared to others same age"
      COEMB      =
"Self-conscious or embarrassed because of teeth or mouth, past 6 m."
      COREAS_1   ="Hours school missed for emergency dental care, past 6 m."
      COREAS_2   =
"Hours school missed for planned routine dental or orthodontic care, past 6 m."
      COREAS_3   =
"Hours school missed for tooth whitening or other cosmetic procedures, past 6 m.
"
      COREAS_4   =
"Hours school missed for taking someone else to a dental appointment, past 6 m."
      CPROB_01   ="Problem with toothache or sensitive teeth, past 6 m."
      CPROB_02   ="Problem with pain in jaw joint, past 6 m."
      CPROB_03   ="Problem with sores in mouth, past 6 m."
      CPROB_04   ="Problem with bleeding gums, past 6 m."
      CPROB_05   ="Problem with crooked teeth, past 6 m."
      CPROB_06   ="Problem with broken or missing teeth, past 6 m."
      CPROB_07   ="Problem with stained or discolored teeth, past 6 m."
      CPROB_08   ="Problem with loose teeth not due to an injury, past 6 m."
      CPROB_09   ="Problem with decayed teeth or cavities, past 6 m."
      CPROB_10   ="Problem with broken or missing fillings, past 6 m."
      CPROB_11   ="Problem with bad breath, past 6 m."
      CPROB_12   ="Problem with dry mouth, past 6 m."
      CODENT1    =
"Saw either dentist or medical doctor for dental problems, past 6 m."
      CODENT2    ="Which one seen, a dentist or a medical doctor, past 6 m."
      CNODEN_1   ="Not important to see dentist for problem, past 6 m."
      CNODEN_2   ="Dental problem went away, past 6 m."
      CNODEN_3   ="Couldn’t afford/no insurance for dental problem, past 6 m."
      CNODEN_4   ="No transportation to dentist, past 6 m."
      CNODEN_5   ="Afraid to see a dentist for problem, past 6 m."
      CNODEN_6   ="Waiting for dental appointment, past 6 m."
      CNODEN_7   ="Didn't think dentist could fix problem, past 6 m."
      COINT_1    ="Dental problem interfered with school or school activities"
      COINT_2    ="Dental problem interfered with work"
      COINT_3    ="Dental problem interfered with eating"
      COINT_4    ="Dental problem interfered with sleeping"
      COINT_5    ="Dental problem interfered with social activities"
      COINT_6    ="Dental problem interfered with usual activities at home"

      /* CMB LABELS */

      RSCL6      ="Difficulties w/emotions/concentration/behavior/getting along"

      /* CFI LABELS */

      CSHFLUYR   ="Flu shot past 12 m"
      CSHFLU_M   ="Month of most recent flu shot"
      CSHFLU_Y   ="Year of most recent flu shot"
      CSPFLUYR   ="Flu nasal spray past 12 m"
      CSPFLU_M   ="Month of most recent flu nasal vaccine"
      CSPFLU_Y   ="Year of most recent flu nasal vaccine"

      /* CHP LABELS */

      CHPVHRD    ="Ever heard of vaccine for cervical cancer"
      CSHTHPV    ="Ever had HPV vaccine or shot"
      CSHHPVDS   ="Number of HPV shots received"
      CHPVREC    ="Get HPV shot if recommended"
      CHPVNOT    ="Main reason why SC would not receive HPV vaccine"
      CHPVCOST   ="Get HPV vaccine if cost was $360-$500"
      CHPVLOC    ="Would SC get HPV vaccine if it were free/at a lower cost"
   ;

   * ASSOCIATE VARIABLES WITH FORMAT VALUES;
   *    (PUT ASTERISK (*) BEFORE WORD "FORMAT"
        IN NEXT STATEMENT TO PREVENT FORMAT
        ASSOCIATIONS BEING STORED WITH DATA SET);
   FORMAT

      /* IDN FORMAT ASSOCIATIONS */

      RECTYPE   SCP001X.   SRVY_YR   SCP002X.   HHX       $GROUPC.
      INTV_QRT  SCP004X.   ASSIGNWK  SCP005X.   WTIA_SC   GROUPN.
      WTFA_SC   GROUPN.

      /* UCF FORMAT ASSOCIATIONS */

      REGION    SCP010X.

      /* HHC FORMAT ASSOCIATIONS */

      SEX       SCP013X.   HISPAN_I  SCP014X.   RACERPI2  SCP015X.
      MRACRPI2  SCP016X.   MRACBPI2  SCP017X.   AGE_P     SCP018X.

      /* CID FORMAT ASSOCIATIONS */

      CSRESPNO  $SCP019X.  CSRELTIV  SCP020X.

      /* CHS FORMAT ASSOCIATIONS */

      BWGTLB    SCP021X.   BWGTOZ    SCP022X.   BWGTMGR   SCP023X.
      CHGHT_TC  SCP024X.   CWGHT_TC  SCP025X.   BMI_SC    SCP026X.
      AMR1      SCP027X.   AODD1     SCP027X.   ADD2      SCP027X.
      AMR2      SCP027X.   AODD2     SCP027X.   CCONDL01  SCP032X.
      CCONDL02  SCP032X.   CCONDL03  SCP032X.   CCONDL04  SCP032X.
      CCONDL05  SCP032X.   CCONDL06  SCP032X.   CCONDL07  SCP032X.
      CCONDL08  SCP032X.   CCONDL09  SCP032X.   CCONDL10  SCP032X.
      CPOX      SCP042X.   CPOX12MO  SCP027X.   CASHMEV   SCP027X.
      CASSTILL  SCP027X.   CASHYR    SCP027X.   CASMERYR  SCP027X.
      CASMHSP   SCP027X.   CASMMC    SCP049X.   CWZMSWK   SCP050X.
      CWZPIN    SCP027X.   CASMINST  SCP027X.   CASMPMED  SCP027X.
      CASMCAN   SCP027X.   CASMED    SCP027X.   CASMDTP   SCP027X.
      CASWMP    SCP027X.   CASCLASS  SCP027X.   CAS_REC   SCP027X.
      CAS_RES   SCP027X.   CAS_MON   SCP027X.   CAPENVLN  SCP062X.
      CAPENVDO  SCP063X.   HAYF1     SCP027X.   RALLG1    SCP027X.
      DALLG1    SCP027X.   SALLG1    SCP027X.   DIARH1    SCP027X.
      ANEMIA1   SCP027X.   EARINF1   SCP027X.   SEIZE1    SCP027X.
      HAYF2     SCP027X.   RALLG2    SCP027X.   DALLG2    SCP027X.
      SALLG2    SCP027X.   DIARH2    SCP027X.   ANEMIA2   SCP027X.
      FHEAD     SCP027X.   EARINF2   SCP027X.   SEIZE2    SCP027X.
      STUTTER   SCP027X.   CHSTATYR  SCP082X.   SCHDAYR1  SCP083X.
      CCOLD2W   SCP027X.   CINTIL2W  SCP027X.   CHEARST1  SCP086X.
      CVISION   SCP027X.   CBLIND    SCP027X.   CVISTST   SCP027X.
      CVISLT    SCP090X.   CVISGLAS  SCP027X.   CVISDIST  SCP027X.
      CVISREAD  SCP027X.   CVISACT   SCP027X.   CVISPROT  SCP095X.
      IHSPEQ    SCP027X.   IHMOB     SCP027X.   IHMOBYR   SCP027X.
      PROBRX    SCP027X.   LEARND    SCP027X.   CMHAGM15  SCP101X.
      MHIBOY2   SCP102X.   CMHAGF15  SCP101X.   MHIGRL2   SCP102X.

      /* CAU FORMAT ASSOCIATIONS */

      CUSUALPL  SCP105X.   CPLKIND   SCP106X.   CHCPLROU  SCP027X.
      CHCPLKND  SCP108X.   CHCCHGYR  SCP027X.   CHCCHGHI  SCP027X.
      CHCDLYR1  SCP027X.   CHCDLYR2  SCP027X.   CHCDLYR3  SCP027X.
      CHCDLYR4  SCP027X.   CHCDLYR5  SCP027X.   CHCAFYR   SCP027X.
      CHCAFYR1  SCP027X.   CHCAFYR2  SCP027X.   CHCAFYR3  SCP027X.
      CHCAFYR4  SCP027X.   CDNLONGR  SCP121X.   CHCSYR11  SCP027X.
      CHCSYR12  SCP027X.   CHCSYR13  SCP027X.   CHCSYR14  SCP027X.
      CHCSYR1   SCP027X.   CHCSYR2   SCP027X.   CHCSYR3   SCP027X.
      CHCSYR4   SCP027X.   CHCSYR5   SCP027X.   CHCSYR6   SCP027X.
      CHCSYR7   SCP027X.   CHCSYR81  SCP027X.   CHCSYR82  SCP027X.
      CHCSYR10  SCP027X.   CHCSYREM  SCP027X.   CHPXYR_C  SCP027X.
      CHERNOY2  SCP138X.   CHCHYR    SCP027X.   CHCHMOYR  SCP140X.
      CHCHNOY2  SCP141X.   CHCNOYR2  SCP138X.   CSRGYR    SCP027X.
      RSRGNOYR  SCP144X.   CMDLONGR  SCP121X.   CSNLAMP   SCP027X.
      CSNNUM    SCP147X.

      /* COH FORMAT ASSOCIATIONS */

      COCOND    SCP148X.   COBTWS    SCP149X.   COEMB     SCP150X.
      COREAS_1  SCP151X.   COREAS_2  SCP151X.   COREAS_3  SCP153X.
      COREAS_4  SCP153X.   CPROB_01  SCP027X.   CPROB_02  SCP027X.
      CPROB_03  SCP027X.   CPROB_04  SCP027X.   CPROB_05  SCP027X.
      CPROB_06  SCP027X.   CPROB_07  SCP027X.   CPROB_08  SCP027X.
      CPROB_09  SCP027X.   CPROB_10  SCP027X.   CPROB_11  SCP027X.
      CPROB_12  SCP027X.   CODENT1   SCP027X.   CODENT2   SCP168X.
      CNODEN_1  SCP027X.   CNODEN_2  SCP027X.   CNODEN_3  SCP027X.
      CNODEN_4  SCP027X.   CNODEN_5  SCP027X.   CNODEN_6  SCP027X.
      CNODEN_7  SCP027X.   COINT_1   SCP176X.   COINT_2   SCP177X.
      COINT_3   SCP027X.   COINT_4   SCP027X.   COINT_5   SCP027X.
      COINT_6   SCP027X.

      /* CMB FORMAT ASSOCIATIONS */

      RSCL6     SCP182X.

      /* CFI FORMAT ASSOCIATIONS */

      CSHFLUYR  SCP027X.   CSHFLU_M  SCP184X.   CSHFLU_Y  SCP185X.
      CSPFLUYR  SCP027X.   CSPFLU_M  SCP184X.   CSPFLU_Y  SCP185X.

      /* CHP FORMAT ASSOCIATIONS */

      CHPVHRD   SCP027X.   CSHTHPV   SCP190X.   CSHHPVDS  SCP191X.
      CHPVREC   SCP027X.   CHPVNOT   SCP193X.   CHPVCOST  SCP027X.
      CHPVLOC   SCP027X.;
RUN;

PROC CONTENTS DATA=NHIS.SAMCHILD;
   TITLE1 'CONTENTS OF THE 2008 NHIS Sample Child FILE';

PROC FREQ DATA=NHIS.SAMCHILD NOTITLE;
   TABLES RECTYPE/LIST MISSING;
   TITLE1 'FREQUENCY REPORT FOR 2008 NHIS Sample Child FILE';
   TITLE2 '(WEIGHTED)';
   WEIGHT WTFA_SC;

PROC FREQ DATA=NHIS.SAMCHILD NOTITLE;
   TABLES RECTYPE/LIST MISSING;
   TITLE1 'FREQUENCY REPORT FOR 2008 NHIS Sample Child FILE';
   TITLE2 '(UNWEIGHTED)';

* USER NOTE: TO SEE UNFORMATTED VALUES IN PROCEDURES, ADD THE
             STATEMENT: FORMAT _ALL_;
RUN;
