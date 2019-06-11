*********************************************************************
 MAY 18, 2011  9:09 AM
 
 This is an example of a SAS program that creates a SAS
 file from the 2010 NHIS Public Use SAMCHILD.DAT ASCII file
 
 This is stored in SAMCHILD.SAS
*********************************************************************;

* USER NOTE: PLACE NEXT STATEMENT IN SUBSEQUENT PROGRAMS;
LIBNAME  NHIS     "C:\NHIS2010";

* USER NOTE: PLACE NEXT STATEMENT IN SUBSEQUENT PROGRAMS
             IF YOU ALLOW PROGRAM TO PERMANENTLY STORE FORMATS;
LIBNAME  LIBRARY  "C:\NHIS2010";

FILENAME ASCIIDAT 'C:\NHIS2010\SAMCHILD.dat';

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
      38                 = "38 Quality of Life"
      40                 = "40 Sample Child"
      60                 = "60 Family"
      63                 = "63 Disability Questions Tests 2010"
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
   VALUE SCP066X
      1                  = "1 Better"
      2                  = "2 Worse"
      3                  = "3 About the same"
      7                  = "7 Refused"
      8                  = "8 Not ascertained"
      9                  = "9 Don't know"
   ;
   VALUE SCP067X
      000                = "000 None"
      996                = "996 Did not go to school"
      997                = "997 Refused"
      998                = "998 Not ascertained"
      999                = "999 Don't know"
   ;
   VALUE SCP070X
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
   VALUE SCP078X
      0                  = "0 Not true"
      1                  = "1 Sometimes true"
      2                  = "2 Often true"
      7                  = "7 Refused"
      8                  = "8 Not ascertained"
      9                  = "9 Don't know"
   ;
   VALUE SCP079X
      99                 = "99 Unknown"
   ;
   VALUE SCP082X
      1                  = "1 Yes"
      2                  = "2 There is NO place"
      3                  = "3 There is MORE THAN ONE place"
      7                  = "7 Refused"
      8                  = "8 Not ascertained"
      9                  = "9 Don't know"
   ;
   VALUE SCP083X
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
   VALUE SCP085X
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
   VALUE SCP098X
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
   VALUE SCP115X
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
   VALUE SCP117X
      97                 = "97 Refused"
      98                 = "98 Not ascertained"
      99                 = "99 Don't know"
   ;
   VALUE SCP118X
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
   VALUE SCP121X
      95                 = "95 95+ times"
      97                 = "97 Refused"
      98                 = "98 Not ascertained"
      99                 = "99 Don't know"
   ;
   VALUE SCP123X
      01                 = "01 Get a severe sunburn with blisters"
      02                 = "02 Have a moderate sunburn with peeling"
      03                 = "03 Burn mildly with some or no darkening/tanning"
      04                 = "04 Turn darker without sunburn"
      05                 = "05 Nothing would happen to skin"
      06                 = "06 Do not go out in the sun"
      07                 = "07 Other"
      97                 = "97 Refused"
      98                 = "98 Not ascertained"
      99                 = "99 Don't know"
   ;
   VALUE SCP124X
      01                 = "01 Very dark or deeply tanned"
      02                 = "02 Dark/moderately tanned"
      03                 = "03 A little dark/mildly tanned"
      04                 = "04 Freckled but still light skinned"
      05                 = 
"05 Burned repeatedly with little or no darkening or tanning--still light skinne
d"
      06                 = "06 Don't go out in the sun"
      07                 = "07 Other"
      97                 = "97 Refused"
      98                 = "98 Not ascertained"
      99                 = "99 Don't know"
   ;
   VALUE SCP127X
      997                = "997 Refused"
      998                = "998 Not ascertained"
      999                = "999 Don't know"
   ;
   VALUE SCP128X
      0                  = "0 Not true"
      1                  = "1 Somewhat true"
      2                  = "2 Certainly true"
      7                  = "7 Refused"
      8                  = "8 Not ascertained"
      9                  = "9 Don't know"
   ;
   VALUE SCP133X
      0                  = "0 No"
      1                  = "1 Yes, minor difficulties"
      2                  = "2 Yes, definite difficulties"
      3                  = "3 Yes, severe difficulties"
      7                  = "7 Refused"
      8                  = "8 Not ascertained"
      9                  = "9 Don't know"
   ;
   VALUE SCP136X
      1                  = "1 A lot"
      2                  = "2 Some"
      3                  = "3 A little"
      4                  = "4 None"
      7                  = "7 Refused"
      8                  = "8 Not ascertained"
      9                  = "9 Don't know"
   ;
   VALUE SCP144X
      1                  = "1 Mentioned"
      2                  = "2 Not mentioned"
      7                  = "7 Refused"
      8                  = "8 Not ascertained"
      9                  = "9 Don’t know"
   ;
   VALUE SCP214X
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
   VALUE SCP225X
      1                  = "1 Not true"
      2                  = "2 Somewhat true"
      3                  = "3 Certainly true"
      7                  = "7 Refused"
      8                  = "8 Not ascertained"
      9                  = "9 Don't know"
   ;
   VALUE SCP239X
      1                  = "1 vaccination or dose"
      2                  = "2 2 or more vaccination doses"
      7                  = "7 Refused"
      8                  = "8 Not ascertained"
      9                  = "9 Don't know"
   ;
   VALUE SCP240X
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
   VALUE SCP241X
      .                   = '.'
      OTHER              = "Year"
      9997               = "9997 Refused"
      9998               = "9998 Not ascertained"
      9999               = "9999 Don't know"
   ;
   VALUE SCP242X
      1                  = "1 Flu shot"
      2                  = "2 Flu nasal spray (spray, mist or drop in nose)"
      7                  = "7 Refused"
      8                  = "8 Not ascertained"
      9                  = "9 Don't know"
   ;
   VALUE SCP261X
      1                  = "1 Yes"
      2                  = "2 No"
      3                  = "3 Doctor refused when asked"
      7                  = "7 Refused"
      8                  = "8 Not ascertained"
      9                  = "9 Don't know"
   ;
   VALUE SCP262X
      96                 = "96 All shots"
      97                 = "97 Refused"
      98                 = "98 Not ascertained"
      99                 = "99 Don't know"
   ;
   VALUE SCP265X
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
   INFILE ASCIIDAT PAD LRECL=352;

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
      CASSTILL   3   CASHYR     3   CASERYR1   3   HAYF1      3
      RALLG1     3   DALLG1     3   SALLG1     3   DIARH1     3
      ANEMIA1    3   EARINF1    3   SEIZE1     3   HAYF2      3
      RALLG2     3   DALLG2     3   SALLG2     3   DIARH2     3
      ANEMIA2    3   FHEAD      3   EARINF2    3   SEIZE2     3
      STUTTER    3   CHSTATYR   3   SCHDAYR1   4   CCOLD2W    3
      CINTIL2W   3   CHEARST1   3   CVISION    3   CBLIND     3
      IHSPEQ     3   IHMOB      3   IHMOBYR    3   PROBRX     3
      LEARND     3   CMHAGM15   3   MHIBOY2    3   CMHAGF15   3
      MHIGRL2    3

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
      CMDLONGR   3   CSUN1HR    3   CSUNTAN    3   CNBURN     3
      CSNLAMP    3   CSNNUM     4

      /* CMB LENGTHS */

      RSCL2_C2   3   RSCL2_E2   3   RSCL3_E3   3   RSCL5_P5   3
      RSCL5_H5   3   RSCL6      3

      /* CMS LENGTHS */

      DIFF6M     3   DIFFINTF   3   DIFFDEG    3   PRESCP6M   3
      PMEDPED    3   PMEDPSY    3   PMEDOTH    3   NSDUH2     3
      NSDUH3     3   NSDUH4     3   NSDUH51    3   NSDUH52    3
      NSDUH53    3   NSDUH54    3   NSDUH55    3   TRETWRE1   3
      TRETWH11   3   TRETWH12   3   TRETWH13   3   TRETWH14   3
      TRETWH15   3   TRETWH16   3   TRETWH17   3   TRETWH18   3
      TRETWRE2   3   TRETWH21   3   TRETWH22   3   TRETWH23   3
      TRETWH24   3   TRETWH25   3   TRETWH26   3   TRETWH27   3
      TRETWH28   3   TRETWRE3   3   TRETWH31   3   TRETWH32   3
      TRETWH33   3   TRETWH34   3   TRETWH35   3   TRETWH36   3
      TRETWH37   3   TRETWH38   3   TRETWRE4   3   TRETWH41   3
      TRETWH42   3   TRETWH43   3   TRETWH44   3   TRETWH45   3
      TRETWH46   3   TRETWH47   3   TRETWH48   3   TRETWRE5   3
      TRETWH51   3   TRETWH52   3   TRETWH53   3   TRETWH54   3
      TRETWH55   3   TRETWH56   3   TRETWH57   3   TRETWH58   3
      TRETWRE6   3   TRETWH61   3   TRETWH62   3   TRETWH63   3
      TRETWH64   3   TRETWH65   3   TRETWH66   3   TRETWH67   3
      TRETWH68   3   OVERNT6M   3   OVERWH1    3   OVERWH2    3
      OVERWH3    3   OVERWH4    3   OVERWH5    3   OVERWH6    3
      OVERWH7    3   SH1        3   SH2        3   CASEM6M    3
      CASEMWHO   3   TRPAYPHI   3   TRPAYSCH   3   TRPAYSLF   3
      TRPAYMED   3   TRPAYCHP   3   TRPAYMIL   3   TRPAYSHP   3
      TRPAYIHS   3   TRPAYOTH   3   TRETFREE   3   TRETNEED   3
      NTRTCOST   3   NTRTLOC    3   NTRTNEXP   3   NTRTFEAR   3
      NTRTLOSE   3   NTRTSAY    3   NTRTWAIT   3   NTRTTRAN   3
      NTRTINCV   3   NTRTFAR    3   NTRTCHNO   3   NTRTOTH    3

      /* CFI LENGTHS */

      CH1N1_1    3   CH1N1_2    3   CH1N1_3M   3   CH1N1_4Y   4
      CH1N1_5    3   CH1N1_6M   3   CH1N1_7Y   4   CH1N1_8    3
      CSHFLUYR   3   CSHFLU_M   3   CSHFLU_Y   4   CSPFLUYR   3
      CSPFLU_M   3   CSPFLU_Y   4   CSHFLU12   3   CSHFLUNM   3
      CSHFLUM1   3   CSHFLUY1   4   CSHSPFL1   3   CSHFLUM2   3
      CSHFLUY2   4   CSHSPFL2   3

      /* CHP LENGTHS */

      CHPVHRD    3   CSHTHPV    3   CSHHPVDS   3   HPVAGE     3
      CHPVREC    3   CHPVNOT    3   CHPVCOST   3   CHPVLOC    3 ;

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
      CASERYR1     91 -  91    HAYF1        92 -  92
      RALLG1       93 -  93    DALLG1       94 -  94
      SALLG1       95 -  95    DIARH1       96 -  96
      ANEMIA1      97 -  97    EARINF1      98 -  98
      SEIZE1       99 -  99    HAYF2       100 - 100
      RALLG2      101 - 101    DALLG2      102 - 102
      SALLG2      103 - 103    DIARH2      104 - 104
      ANEMIA2     105 - 105    FHEAD       106 - 106
      EARINF2     107 - 107    SEIZE2      108 - 108
      STUTTER     109 - 109    CHSTATYR    110 - 110
      SCHDAYR1    111 - 113    CCOLD2W     114 - 114
      CINTIL2W    115 - 115    CHEARST1    116 - 116
      CVISION     117 - 117    CBLIND      118 - 118
      IHSPEQ      119 - 119    IHMOB       120 - 120
      IHMOBYR     121 - 121    PROBRX      122 - 122
      LEARND      123 - 123    CMHAGM15    124 - 124
      MHIBOY2     125 - 126    CMHAGF15    127 - 127
      MHIGRL2     128 - 129

      /* CAU LOCATIONS */

      CUSUALPL    130 - 130    CPLKIND     131 - 131
      CHCPLROU    132 - 132    CHCPLKND    133 - 133
      CHCCHGYR    134 - 134    CHCCHGHI    135 - 135
      CHCDLYR1    136 - 136    CHCDLYR2    137 - 137
      CHCDLYR3    138 - 138    CHCDLYR4    139 - 139
      CHCDLYR5    140 - 140    CHCAFYR     141 - 141
      CHCAFYR1    142 - 142    CHCAFYR2    143 - 143
      CHCAFYR3    144 - 144    CHCAFYR4    145 - 145
      CDNLONGR    146 - 146    CHCSYR11    147 - 147
      CHCSYR12    148 - 148    CHCSYR13    149 - 149
      CHCSYR14    150 - 150    CHCSYR1     151 - 151
      CHCSYR2     152 - 152    CHCSYR3     153 - 153
      CHCSYR4     154 - 154    CHCSYR5     155 - 155
      CHCSYR6     156 - 156    CHCSYR7     157 - 157
      CHCSYR81    158 - 158    CHCSYR82    159 - 159
      CHCSYR10    160 - 160    CHCSYREM    161 - 161
      CHPXYR_C    162 - 162    CHERNOY2    163 - 164
      CHCHYR      165 - 165    CHCHMOYR    166 - 167
      CHCHNOY2    168 - 169    CHCNOYR2    170 - 171
      CSRGYR      172 - 172    RSRGNOYR    173 - 174
      CMDLONGR    175 - 175    CSUN1HR     176 - 177
      CSUNTAN     178 - 179    CNBURN      180 - 180
      CSNLAMP     181 - 181    CSNNUM      182 - 184


      /* CMB LOCATIONS */

      RSCL2_C2    185 - 185    RSCL2_E2    186 - 186
      RSCL3_E3    187 - 187    RSCL5_P5    188 - 188
      RSCL5_H5    189 - 189    RSCL6       190 - 190


      /* CMS LOCATIONS */

      DIFF6M      191 - 191    DIFFINTF    192 - 192
      DIFFDEG     193 - 193    PRESCP6M    194 - 194
      PMEDPED     195 - 195    PMEDPSY     196 - 196
      PMEDOTH     197 - 197    NSDUH2      198 - 198
      NSDUH3      199 - 199    NSDUH4      200 - 200
      NSDUH51     201 - 201    NSDUH52     202 - 202
      NSDUH53     203 - 203    NSDUH54     204 - 204
      NSDUH55     205 - 205    TRETWRE1    206 - 206
      TRETWH11    207 - 207    TRETWH12    208 - 208
      TRETWH13    209 - 209    TRETWH14    210 - 210
      TRETWH15    211 - 211    TRETWH16    212 - 212
      TRETWH17    213 - 213    TRETWH18    214 - 214
      TRETWRE2    215 - 215    TRETWH21    216 - 216
      TRETWH22    217 - 217    TRETWH23    218 - 218
      TRETWH24    219 - 219    TRETWH25    220 - 220
      TRETWH26    221 - 221    TRETWH27    222 - 222
      TRETWH28    223 - 223    TRETWRE3    224 - 224
      TRETWH31    225 - 225    TRETWH32    226 - 226
      TRETWH33    227 - 227    TRETWH34    228 - 228
      TRETWH35    229 - 229    TRETWH36    230 - 230
      TRETWH37    231 - 231    TRETWH38    232 - 232
      TRETWRE4    233 - 233    TRETWH41    234 - 234
      TRETWH42    235 - 235    TRETWH43    236 - 236
      TRETWH44    237 - 237    TRETWH45    238 - 238
      TRETWH46    239 - 239    TRETWH47    240 - 240
      TRETWH48    241 - 241    TRETWRE5    242 - 242
      TRETWH51    243 - 243    TRETWH52    244 - 244
      TRETWH53    245 - 245    TRETWH54    246 - 246
      TRETWH55    247 - 247    TRETWH56    248 - 248
      TRETWH57    249 - 249    TRETWH58    250 - 250
      TRETWRE6    251 - 251    TRETWH61    252 - 252
      TRETWH62    253 - 253    TRETWH63    254 - 254
      TRETWH64    255 - 255    TRETWH65    256 - 256
      TRETWH66    257 - 257    TRETWH67    258 - 258
      TRETWH68    259 - 259    OVERNT6M    260 - 260
      OVERWH1     261 - 261    OVERWH2     262 - 262
      OVERWH3     263 - 263    OVERWH4     264 - 264
      OVERWH5     265 - 265    OVERWH6     266 - 266
      OVERWH7     267 - 267    SH1         268 - 268
      SH2         269 - 269    CASEM6M     270 - 270
      CASEMWHO    271 - 272    TRPAYPHI    273 - 273
      TRPAYSCH    274 - 274    TRPAYSLF    275 - 275
      TRPAYMED    276 - 276    TRPAYCHP    277 - 277
      TRPAYMIL    278 - 278    TRPAYSHP    279 - 279
      TRPAYIHS    280 - 280    TRPAYOTH    281 - 281
      TRETFREE    282 - 282    TRETNEED    283 - 283
      NTRTCOST    284 - 284    NTRTLOC     285 - 285
      NTRTNEXP    286 - 286    NTRTFEAR    287 - 287
      NTRTLOSE    288 - 288    NTRTSAY     289 - 289
      NTRTWAIT    290 - 290    NTRTTRAN    291 - 291
      NTRTINCV    292 - 292    NTRTFAR     293 - 293
      NTRTCHNO    294 - 294    NTRTOTH     295 - 295


      /* CFI LOCATIONS */

      CH1N1_1     296 - 296    CH1N1_2     297 - 297
      CH1N1_3M    298 - 299    CH1N1_4Y    300 - 303
      CH1N1_5     304 - 304    CH1N1_6M    305 - 306
      CH1N1_7Y    307 - 310    CH1N1_8     311 - 311
      CSHFLUYR    312 - 312    CSHFLU_M    313 - 314
      CSHFLU_Y    315 - 318    CSPFLUYR    319 - 319
      CSPFLU_M    320 - 321    CSPFLU_Y    322 - 325
      CSHFLU12    326 - 326    CSHFLUNM    327 - 327
      CSHFLUM1    328 - 329    CSHFLUY1    330 - 333
      CSHSPFL1    334 - 334    CSHFLUM2    335 - 336
      CSHFLUY2    337 - 340    CSHSPFL2    341 - 341


      /* CHP LOCATIONS */

      CHPVHRD     342 - 342    CSHTHPV     343 - 343
      CSHHPVDS    344 - 345    HPVAGE      346 - 347
      CHPVREC     348 - 348    CHPVNOT     349 - 350
      CHPVCOST    351 - 351    CHPVLOC     352 - 352
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
      CSUN1HR    ="Skin condition after 1 hr sun exposure without protection"
      CSUNTAN    ="Skin condition after repeated sun exposure without protection
"
      CNBURN     ="Had sunburn, past 12 months"
      CSNLAMP    ="Used indoor tanning device"
      CSNNUM     ="# of times used tanning devices, past 12 months"

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
      PRESCP6M   =
"Medication prescribed for difficulties with emotions, concentration, behavior, 
or getting along with others, past 6 months"
      PMEDPED    =
"Pediatrician or other family doctor first prescribed medication"
      PMEDPSY    =
"Psychiatrist, psychologist or other mental health professional first prescribed
 medication"
      PMEDOTH    ="Someone else first prescribed medication"
      NSDUH2     ="Treatment or counseling from school personnel, past 6 months"
      NSDUH3     =
"Attend school for students with difficulties with emotions, concentration, beha
vior, past 6 months"
      NSDUH4     =
"Participate in school program for students with difficulties with emotions, con
centration, behavior, past 6 months"
      NSDUH51    =
"School teacher provided treatment or counseling in school program"
      NSDUH52    =
"Special Ed teacher provided treatment or counseling in school program"
      NSDUH53    =
"School counselor, psychologist, nurse or social worker provided treatment or co
unseling in school program"
      NSDUH54    =
"School speech, occupational or physical therapist provided treatment or counsel
ing in school program"
      NSDUH55    =
"Other school official provided treatment or counseling in school program"
      TRETWRE1   =
"Treatment or counseling provided at daycare, child care, or play group, past 6 
months"
      TRETWH11   =
"School counselor, school nurse or school social worker provided treatment or co
unseling at daycare, child care, or play group"
      TRETWH12   =
"Speech, occupational or physical therapist provided treatment or counseling at 
daycare, child care, or play group"
      TRETWH13   =
"Psychiatrist, psychologist, social worker, psychiatric nurse provided treatment
 or counseling at daycare, child care, or play group"
      TRETWH14   =
"Pediatrician or family doctor provided treatment or counseling at daycare, chil
d care, or play group"
      TRETWH15   =
"Acupuncturist, massage therapist, chiropractor provided treatment or counseling
 at daycare, child care, or play group"
      TRETWH16   =
"Religious or spiritual counselor provided treatment or counseling at daycare, c
hild care, or play group"
      TRETWH17   =
"Probation or juvenile corrections officer or court counselor provided treatment
 or counseling at daycare, child care, or play group"
      TRETWH18   =
"Other source provided treatment or counseling at daycare, child care, or play g
roup"
      TRETWRE2   =
"Treatment or counseling provided in an office, clinic or community center, past
 6 months"
      TRETWH21   =
"School counselor, school nurse or school social worker provided treatment or co
unseling in an office, clinic or community center"
      TRETWH22   =
"Speech, occupational or physical therapist provided treatment or counseling in 
an office, clinic or community center"
      TRETWH23   =
"Psychiatrist, psychologist, social worker, psychiatric nurse provided treatment
 or counseling in an office, clinic or community center"
      TRETWH24   =
"Pediatrician or family doctor provided treatment or counseling in an office, cl
inic or community center"
      TRETWH25   =
"Acupuncturist, massage therapist, chiropractor provided treatment or counseling
 in an office, clinic or community center"
      TRETWH26   =
"Religious or spiritual counselor provided treatment or counseling in an office,
 clinic or community center"
      TRETWH27   =
"Probation or juvenile corrections officer or court counselor provided treatment
 or counseling in an office, clinic or community center"
      TRETWH28   =
"Other source provided treatment or counseling in an office, clinic or community
 center"
      TRETWRE3   ="Treatment or counseling provided in home"
      TRETWH31   =
"School counselor, school nurse or school social worker provided treatment or co
unseling in home"
      TRETWH32   =
"Speech, occupational or physical therapist provided treatment or counseling in 
home"
      TRETWH33   =
"Psychiatrist, psychologist, social worker, psychiatric nurse provided treatment
 or counseling in home"
      TRETWH34   =
"Pediatrician or family doctor provided treatment or counseling in home"
      TRETWH35   =
"Acupuncturist, massage therapist, chiropractor provided treatment or counseling
 in home"
      TRETWH36   =
"Religious or spiritual counselor provided treatment or counseling in home"
      TRETWH37   =
"Probation or juvenile corrections officer or court counselor provided treatment
 or counseling in home"
      TRETWH38   ="Other source provided treatment or counseling in home"
      TRETWRE4   =
"Treatment or counseling provided in hospital ER, crisis center, or shelter, pas
t 6 months"
      TRETWH41   =
"School counselor, school nurse or school social worker provided treatment or co
unseling in hospital ER, crisis center, or emergency shelter"
      TRETWH42   =
"Speech, occupational or physical therapist provided treatment or counseling in 
hospital ER, crisis center, or emergency shelter"
      TRETWH43   =
"Psychiatrist, psychologist, social worker, psychiatric nurse provided treatment
 or counseling in hospital ER, crisis center, or emergency shelter"
      TRETWH44   =
"Pediatrician or family doctor provided treatment or counseling in hospital ER, 
crisis center, or emergency shelter"
      TRETWH45   =
"Acupuncturist, massage therapist, chiropractor provided treatment or counseling
 in hospital ER, crisis center, or emergency shelter"
      TRETWH46   =
"Religious or spiritual counselor provided treatment or counseling in hospital E
R, crisis center, or emergency shelter"
      TRETWH47   =
"Probation or juvenile corrections officer or court counselor provided treatment
 or counseling in hospital ER, crisis center, or emergency shelter"
      TRETWH48   =
"Other source provided treatment or counseling in hospital ER, crisis center, or
 emergency shelter"
      TRETWRE5   =
"Treatment or counseling provided in hospital or community day program, past 6 m
onths"
      TRETWH51   =
"School counselor, school nurse or school social worker provided treatment or co
unseling in hospital or community day program"
      TRETWH52   =
"Speech, occupational or physical therapist provided treatment or counseling in 
hospital or community day program"
      TRETWH53   =
"Psychiatrist, psychologist, social worker, psychiatric nurse provided treatment
 or counseling in hospital or community day program"
      TRETWH54   =
"Pediatrician or family doctor provided treatment or counseling in hospital or c
ommunity day program"
      TRETWH55   =
"Acupuncturist, massage therapist, chiropractor provided treatment or counseling
 in hospital or community day program"
      TRETWH56   =
"Religious or spiritual counselor provided treatment or counseling in hospital o
r community day program"
      TRETWH57   =
"Probation or juvenile corrections officer or court counselor provided treatment
 or counseling in hospital or community day program"
      TRETWH58   =
"Other source provided treatment or counseling in hospital or community day prog
ram"
      TRETWRE6   =
"Treatment or counseling provided in any other place, past 6 months"
      TRETWH61   =
"School counselor, school nurse or school social worker provided treatment or co
unseling in any other place"
      TRETWH62   =
"Speech, occupational or physical therapist provided treatment or counseling in 
any other place"
      TRETWH63   =
"Psychiatrist, psychologist, social worker, psychiatric nurse provided treatment
 or counseling in any other place"
      TRETWH64   =
"Pediatrician or family doctor provided treatment or counseling in any other pla
ce"
      TRETWH65   =
"Acupuncturist, massage therapist, chiropractor provided treatment or counseling
 in any other place"
      TRETWH66   =
"Religious or spiritual counselor provided treatment or counseling in any other 
place"
      TRETWH67   =
"Probation or juvenile corrections officer or court counselor provided treatment
 or counseling in any other place"
      TRETWH68   =
"Other source provided treatment or counseling in any other place"
      OVERNT6M   =
"Overnight or longer stay in facility for difficulties with emotions, concentrat
ion, or behavior, past 6 months"
      OVERWH1    =
"Stayed overnight in a hospital for difficulties with emotions, concentration, o
r behavior"
      OVERWH2    =
"Stayed overnight in a residential treatment center for difficulties with emotio
ns, concentration, or behavior"
      OVERWH3    =
"Stayed overnight in a foster care or therapeutic foster care home for difficult
ies with emotions, concentration, or behavior"
      OVERWH4    =
"Stayed overnight in a juvenile detention center, prison or jail for difficultie
s with emotions, concentration, or behavior"
      OVERWH5    =
"Stayed overnight in a group home for difficulties with emotions, concentration,
 or behavior"
      OVERWH6    =
"Stayed overnight in a homeless shelter for difficulties with emotions, concentr
ation, or behavior"
      OVERWH7    =
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
      TRPAYPHI   ="Private health insurance paid for treatment or counseling"
      TRPAYSCH   ="School system paid for treatment or counseling"
      TRPAYSLF   ="Family paid for treatment or counseling"
      TRPAYMED   ="Medicaid paid for treatment or counseling"
      TRPAYCHP   ="State SCHIP/CHIP paid for treatment or counseling"
      TRPAYMIL   ="Military health care paid for treatment or counseling"
      TRPAYSHP   =
"Medicare or other government plan paid for treatment or counseling"
      TRPAYIHS   ="Indian Health Service paid for treatment or counseling"
      TRPAYOTH   ="Some other source paid for treatment or counseling"
      TRETFREE   ="All treatment or counseling was received free"
      TRETNEED   =
"Needed treatment or counseling for difficulties with emotions, concentration, o
r behavior, past 6 months, but did not get it"
      NTRTCOST   =
"Didn't get treatment or counseling because it was too expensive"
      NTRTLOC    =
"Didn't get treatment or counseling because didn't know where to go"
      NTRTNEXP   =
"Didn't get treatment or counseling because had negative experience previously"
      NTRTFEAR   =
"Didn't get treatment or counseling because afraid or dislike counselors"
      NTRTLOSE   =
"Didn't get treatment or counseling because afraid child would be removed from h
ome or lose custody"
      NTRTSAY    =
"Didn't get treatment or counseling because afraid of family/friends opinion"
      NTRTWAIT   =
"Didn't get treatment or counseling because it was a long wait time for appointm
ent"
      NTRTTRAN   =
"Didn't get treatment or counseling because had no way to get there"
      NTRTINCV   =
"Didn't get treatment or counseling because services were too inconvenient to us
e"
      NTRTFAR    =
"Didn't get treatment or counseling because services were too far away"
      NTRTCHNO   =
"Didn't get treatment or counseling because child did not want to go."
      NTRTOTH    ="Didn't get treatment or counseling for some other reason"

      /* CFI LABELS */

      CH1N1_1    ="H1N1 flu vaccination, since October 2009"
      CH1N1_2    ="Number of H1N1 flu vaccinations, since October 2009"
      CH1N1_3M   ="Month of first H1N1 flu vaccination"
      CH1N1_4Y   ="Year of first H1N1 flu vaccination"
      CH1N1_5    ="Administration method for first dose of H1N1 flu vaccine"
      CH1N1_6M   ="Month of second H1N1 flu vaccination"
      CH1N1_7Y   ="Year of second H1N1 flu vaccination"
      CH1N1_8    ="Administration method for second dose of H1N1 flu vaccine"
      CSHFLUYR   ="Seasonal flu shot, past 12 m"
      CSHFLU_M   ="Month of most recent seasonal flu shot"
      CSHFLU_Y   ="Year of most recent seasonal flu shot"
      CSPFLUYR   ="Seasonal flu nasal spray, past 12 m"
      CSPFLU_M   ="Month of most recent seasonal flu nasal spray"
      CSPFLU_Y   ="Year of most recent seasonal flu nasal spray"
      CSHFLU12   ="Flu vaccination, past 12 m"
      CSHFLUNM   ="Number of flu vaccines, past 12 m"
      CSHFLUM1   ="Month of most recent flu vaccine"
      CSHFLUY1   ="Year of most recent flu vaccine"
      CSHSPFL1   ="Administration method most recent flu vaccine"
      CSHFLUM2   ="Month of next most recent flu vaccine"
      CSHFLUY2   ="Year of next most recent flu vaccine"
      CSHSPFL2   ="Administration method next most recent flu vaccine"

      /* CHP LABELS */

      CHPVHRD    ="Ever heard vaccine for cervical cancer"
      CSHTHPV    ="Ever had HPV shot?"
      CSHHPVDS   ="Number of HPV shots received"
      HPVAGE     ="Age at first HPV shot"
      CHPVREC    ="Get HPV shot if recommended"
      CHPVNOT    ="Main reason why SC would not receive HPV vaccine"
      CHPVCOST   ="Get HPV vaccine if cost was $360-$500."
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
      CASSTILL  SCP027X.   CASHYR    SCP027X.   CASERYR1  SCP027X.
      HAYF1     SCP027X.   RALLG1    SCP027X.   DALLG1    SCP027X.
      SALLG1    SCP027X.   DIARH1    SCP027X.   ANEMIA1   SCP027X.
      EARINF1   SCP027X.   SEIZE1    SCP027X.   HAYF2     SCP027X.
      RALLG2    SCP027X.   DALLG2    SCP027X.   SALLG2    SCP027X.
      DIARH2    SCP027X.   ANEMIA2   SCP027X.   FHEAD     SCP027X.
      EARINF2   SCP027X.   SEIZE2    SCP027X.   STUTTER   SCP027X.
      CHSTATYR  SCP066X.   SCHDAYR1  SCP067X.   CCOLD2W   SCP027X.
      CINTIL2W  SCP027X.   CHEARST1  SCP070X.   CVISION   SCP027X.
      CBLIND    SCP027X.   IHSPEQ    SCP027X.   IHMOB     SCP027X.
      IHMOBYR   SCP027X.   PROBRX    SCP027X.   LEARND    SCP027X.
      CMHAGM15  SCP078X.   MHIBOY2   SCP079X.   CMHAGF15  SCP078X.
      MHIGRL2   SCP079X.

      /* CAU FORMAT ASSOCIATIONS */

      CUSUALPL  SCP082X.   CPLKIND   SCP083X.   CHCPLROU  SCP027X.
      CHCPLKND  SCP085X.   CHCCHGYR  SCP027X.   CHCCHGHI  SCP027X.
      CHCDLYR1  SCP027X.   CHCDLYR2  SCP027X.   CHCDLYR3  SCP027X.
      CHCDLYR4  SCP027X.   CHCDLYR5  SCP027X.   CHCAFYR   SCP027X.
      CHCAFYR1  SCP027X.   CHCAFYR2  SCP027X.   CHCAFYR3  SCP027X.
      CHCAFYR4  SCP027X.   CDNLONGR  SCP098X.   CHCSYR11  SCP027X.
      CHCSYR12  SCP027X.   CHCSYR13  SCP027X.   CHCSYR14  SCP027X.
      CHCSYR1   SCP027X.   CHCSYR2   SCP027X.   CHCSYR3   SCP027X.
      CHCSYR4   SCP027X.   CHCSYR5   SCP027X.   CHCSYR6   SCP027X.
      CHCSYR7   SCP027X.   CHCSYR81  SCP027X.   CHCSYR82  SCP027X.
      CHCSYR10  SCP027X.   CHCSYREM  SCP027X.   CHPXYR_C  SCP027X.
      CHERNOY2  SCP115X.   CHCHYR    SCP027X.   CHCHMOYR  SCP117X.
      CHCHNOY2  SCP118X.   CHCNOYR2  SCP115X.   CSRGYR    SCP027X.
      RSRGNOYR  SCP121X.   CMDLONGR  SCP098X.   CSUN1HR   SCP123X.
      CSUNTAN   SCP124X.   CNBURN    SCP027X.   CSNLAMP   SCP027X.
      CSNNUM    SCP127X.

      /* CMB FORMAT ASSOCIATIONS */

      RSCL2_C2  SCP128X.   RSCL2_E2  SCP128X.   RSCL3_E3  SCP128X.
      RSCL5_P5  SCP128X.   RSCL5_H5  SCP128X.   RSCL6     SCP133X.

      /* CMS FORMAT ASSOCIATIONS */

      DIFF6M    SCP027X.   DIFFINTF  SCP027X.   DIFFDEG   SCP136X.
      PRESCP6M  SCP027X.   PMEDPED   SCP027X.   PMEDPSY   SCP027X.
      PMEDOTH   SCP027X.   NSDUH2    SCP027X.   NSDUH3    SCP027X.
      NSDUH4    SCP027X.   NSDUH51   SCP144X.   NSDUH52   SCP144X.
      NSDUH53   SCP144X.   NSDUH54   SCP144X.   NSDUH55   SCP144X.
      TRETWRE1  SCP027X.   TRETWH11  SCP144X.   TRETWH12  SCP144X.
      TRETWH13  SCP144X.   TRETWH14  SCP144X.   TRETWH15  SCP144X.
      TRETWH16  SCP144X.   TRETWH17  SCP144X.   TRETWH18  SCP144X.
      TRETWRE2  SCP027X.   TRETWH21  SCP144X.   TRETWH22  SCP144X.
      TRETWH23  SCP144X.   TRETWH24  SCP144X.   TRETWH25  SCP144X.
      TRETWH26  SCP144X.   TRETWH27  SCP144X.   TRETWH28  SCP144X.
      TRETWRE3  SCP027X.   TRETWH31  SCP144X.   TRETWH32  SCP144X.
      TRETWH33  SCP144X.   TRETWH34  SCP144X.   TRETWH35  SCP144X.
      TRETWH36  SCP144X.   TRETWH37  SCP144X.   TRETWH38  SCP144X.
      TRETWRE4  SCP027X.   TRETWH41  SCP144X.   TRETWH42  SCP144X.
      TRETWH43  SCP144X.   TRETWH44  SCP144X.   TRETWH45  SCP144X.
      TRETWH46  SCP144X.   TRETWH47  SCP144X.   TRETWH48  SCP144X.
      TRETWRE5  SCP027X.   TRETWH51  SCP144X.   TRETWH52  SCP144X.
      TRETWH53  SCP144X.   TRETWH54  SCP144X.   TRETWH55  SCP144X.
      TRETWH56  SCP144X.   TRETWH57  SCP144X.   TRETWH58  SCP144X.
      TRETWRE6  SCP027X.   TRETWH61  SCP144X.   TRETWH62  SCP144X.
      TRETWH63  SCP144X.   TRETWH64  SCP144X.   TRETWH65  SCP144X.
      TRETWH66  SCP144X.   TRETWH67  SCP144X.   TRETWH68  SCP144X.
      OVERNT6M  SCP027X.   OVERWH1   SCP144X.   OVERWH2   SCP144X.
      OVERWH3   SCP144X.   OVERWH4   SCP144X.   OVERWH5   SCP144X.
      OVERWH6   SCP144X.   OVERWH7   SCP144X.   SH1       SCP027X.
      SH2       SCP027X.   CASEM6M   SCP027X.   CASEMWHO  SCP214X.
      TRPAYPHI  SCP027X.   TRPAYSCH  SCP027X.   TRPAYSLF  SCP027X.
      TRPAYMED  SCP027X.   TRPAYCHP  SCP027X.   TRPAYMIL  SCP027X.
      TRPAYSHP  SCP027X.   TRPAYIHS  SCP027X.   TRPAYOTH  SCP027X.
      TRETFREE  SCP027X.   TRETNEED  SCP225X.   NTRTCOST  SCP027X.
      NTRTLOC   SCP027X.   NTRTNEXP  SCP027X.   NTRTFEAR  SCP027X.
      NTRTLOSE  SCP027X.   NTRTSAY   SCP027X.   NTRTWAIT  SCP027X.
      NTRTTRAN  SCP027X.   NTRTINCV  SCP027X.   NTRTFAR   SCP027X.
      NTRTCHNO  SCP027X.   NTRTOTH   SCP027X.

      /* CFI FORMAT ASSOCIATIONS */

      CH1N1_1   SCP027X.   CH1N1_2   SCP239X.   CH1N1_3M  SCP240X.
      CH1N1_4Y  SCP241X.   CH1N1_5   SCP242X.   CH1N1_6M  SCP240X.
      CH1N1_7Y  SCP241X.   CH1N1_8   SCP242X.   CSHFLUYR  SCP027X.
      CSHFLU_M  SCP240X.   CSHFLU_Y  SCP241X.   CSPFLUYR  SCP027X.
      CSPFLU_M  SCP240X.   CSPFLU_Y  SCP241X.   CSHFLU12  SCP027X.
      CSHFLUNM  SCP239X.   CSHFLUM1  SCP240X.   CSHFLUY1  SCP241X.
      CSHSPFL1  SCP242X.   CSHFLUM2  SCP240X.   CSHFLUY2  SCP241X.
      CSHSPFL2  SCP242X.

      /* CHP FORMAT ASSOCIATIONS */

      CHPVHRD   SCP027X.   CSHTHPV   SCP261X.   CSHHPVDS  SCP262X.
      HPVAGE    SCP117X.   CHPVREC   SCP027X.   CHPVNOT   SCP265X.
      CHPVCOST  SCP027X.   CHPVLOC   SCP027X.;
RUN;

PROC CONTENTS DATA=NHIS.SAMCHILD;
   TITLE1 'CONTENTS OF THE 2010 NHIS Sample Child FILE';

PROC FREQ DATA=NHIS.SAMCHILD NOTITLE;
   TABLES RECTYPE/LIST MISSING;
   TITLE1 'FREQUENCY REPORT FOR 2010 NHIS Sample Child FILE';
   TITLE2 '(WEIGHTED)';
   WEIGHT WTFA_SC;

PROC FREQ DATA=NHIS.SAMCHILD NOTITLE;
   TABLES RECTYPE/LIST MISSING;
   TITLE1 'FREQUENCY REPORT FOR 2010 NHIS Sample Child FILE';
   TITLE2 '(UNWEIGHTED)';

* USER NOTE: TO SEE UNFORMATTED VALUES IN PROCEDURES, ADD THE
             STATEMENT: FORMAT _ALL_;
RUN;
