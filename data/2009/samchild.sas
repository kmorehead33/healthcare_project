*********************************************************************
 APRIL 19, 2010 10:59 AM
 
 This is an example of a SAS program that creates a SAS
 file from the 2009 NHIS Public Use SAMCHILD.DAT ASCII file
 
 This is stored in SAMCHILD.SAS
*********************************************************************;

* USER NOTE: PLACE NEXT STATEMENT IN SUBSEQUENT PROGRAMS;
LIBNAME  NHIS     "C:\NHIS2009";

* USER NOTE: PLACE NEXT STATEMENT IN SUBSEQUENT PROGRAMS
             IF YOU ALLOW PROGRAM TO PERMANENTLY STORE FORMATS;
LIBNAME  LIBRARY  "C:\NHIS2009";

FILENAME ASCIIDAT 'C:\NHIS2009\SAMCHILD.dat';

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
      40                 = "40 Sample Child"
      60                 = "60 Family"
      63                 = "63 Disability Questions Tests 2008/2009"
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
      0                  = "0 No"
      1                  = "1 Yes, minor difficulties"
      2                  = "2 Yes, definite difficulties"
      3                  = "3 Yes, severe difficulties"
      7                  = "7 Refused"
      8                  = "8 Not ascertained"
      9                  = "9 Don't know"
   ;
   VALUE SCP125X
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
   VALUE SCP126X
      .                   = '.'
      OTHER              = "Year"
      9997               = "9997 Refused"
      9998               = "9998 Not ascertained"
      9999               = "9999 Don't know"
   ;

DATA NHIS.SAMCHILD;
   * CREATE A SAS DATA SET;
   INFILE ASCIIDAT PAD LRECL=190;

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
      CASSTILL   3   CASHYR     3   CASMERYR   3   HAYF1      3
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
      CMDLONGR   3

      /* CMB LENGTHS */

      RSCL6      3

      /* CFI LENGTHS */

      CSHFLUYR   3   CSHFLU_M   3   CSHFLU_Y   4   CSPFLUYR   3
      CSPFLU_M   3   CSPFLU_Y   4 ;

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
      CASMERYR     91 -  91    HAYF1        92 -  92
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
      CMDLONGR    175 - 175

      /* CMB LOCATIONS */

      RSCL6       176 - 176

      /* CFI LOCATIONS */

      CSHFLUYR    177 - 177    CSHFLU_M    178 - 179
      CSHFLU_Y    180 - 183    CSPFLUYR    184 - 184
      CSPFLU_M    185 - 186    CSPFLU_Y    187 - 190
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
      CASMERYR   ="Had visit to ER due to asthma, past 12 m"
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

      /* CMB LABELS */

      RSCL6      ="Difficulties w/emotions/concentration/behavior/getting along"

      /* CFI LABELS */

      CSHFLUYR   ="Flu shot past 12 m"
      CSHFLU_M   ="Month of most recent flu shot"
      CSHFLU_Y   ="Year of most recent flu shot"
      CSPFLUYR   ="Flu nasal spray past 12 m"
      CSPFLU_M   ="Month of most recent flu nasal vaccine"
      CSPFLU_Y   ="Year of most recent flu nasal vaccine"
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
      RSRGNOYR  SCP121X.   CMDLONGR  SCP098X.

      /* CMB FORMAT ASSOCIATIONS */

      RSCL6     SCP123X.

      /* CFI FORMAT ASSOCIATIONS */

      CSHFLUYR  SCP027X.   CSHFLU_M  SCP125X.   CSHFLU_Y  SCP126X.
      CSPFLUYR  SCP027X.   CSPFLU_M  SCP125X.   CSPFLU_Y  SCP126X.;
RUN;

PROC CONTENTS DATA=NHIS.SAMCHILD;
   TITLE1 'CONTENTS OF THE 2009 NHIS Sample Child FILE';

PROC FREQ DATA=NHIS.SAMCHILD NOTITLE;
   TABLES RECTYPE/LIST MISSING;
   TITLE1 'FREQUENCY REPORT FOR 2009 NHIS Sample Child FILE';
   TITLE2 '(WEIGHTED)';
   WEIGHT WTFA_SC;

PROC FREQ DATA=NHIS.SAMCHILD NOTITLE;
   TABLES RECTYPE/LIST MISSING;
   TITLE1 'FREQUENCY REPORT FOR 2009 NHIS Sample Child FILE';
   TITLE2 '(UNWEIGHTED)';

* USER NOTE: TO SEE UNFORMATTED VALUES IN PROCEDURES, ADD THE
             STATEMENT: FORMAT _ALL_;
RUN;
