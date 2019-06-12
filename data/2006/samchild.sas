*********************************************************************
 JUNE 22, 2007  8:30 AM
 
 This is an example of a SAS program that creates a SAS
 file from the 2006 NHIS Public Use SAMCHILD.DAT ASCII file
 
 This is stored in SAMCHILD.SAS
*********************************************************************;

* USER NOTE: PLACE NEXT STATEMENT IN SUBSEQUENT PROGRAMS;
LIBNAME  NHIS     "C:\NHIS2006";

* USER NOTE: PLACE NEXT STATEMENT IN SUBSEQUENT PROGRAMS
             IF YOU ALLOW PROGRAM TO PERMANENTLY STORE FORMATS;
LIBNAME  LIBRARY  "C:\NHIS2006";

FILENAME ASCIIDAT 'C:\NHIS2006\SAMCHILD.dat';

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
   VALUE SCP001X
      10                 = "10 Household"
      20                 = "20 Person"
      30                 = "30 Sample Adult"
      31                 = "31 Sample Adult Cancer"
      40                 = "40 Sample Child"
      60                 = "60 Family"
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
      "98"               = "98 Not Ascertained"
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
      1                  = "1 Yes"
      2                  = "2 No"
      7                  = "7 Refused"
      8                  = "8 Not ascertained"
      9                  = "9 Don't know"
   ;
   VALUE SCP029X
      1                  = "1 Mentioned"
      2                  = "2 Not mentioned"
      7                  = "7 Refused"
      8                  = "8 Not ascertained"
      9                  = "9 Don't know"
   ;
   VALUE SCP039X
      1                  = "1 Yes"
      2                  = "2 No"
      7                  = "7 Refused"
      9                  = "9 Don't know"
   ;
   VALUE SCP063X
      1                  = "1 Better"
      2                  = "2 Worse"
      3                  = "3 About the same"
      7                  = "7 Refused"
      8                  = "8 Not ascertained"
      9                  = "9 Don't know"
   ;
   VALUE SCP064X
      000                = "000 None"
      996                = "996 Did not go to school"
      997                = "997 Refused"
      998                = "998 Not ascertained"
      999                = "999 Don't know"
   ;
   VALUE SCP067X
      1                  = "1 Good"
      2                  = "2 A little trouble"
      3                  = "3 A lot of trouble"
      4                  = "4 Deaf"
      7                  = "7 Refused"
      8                  = "8 Not ascertained"
      9                  = "9 Don't know"
   ;
   VALUE SCP075X
      0                  = "0 Not true"
      1                  = "1 Sometimes true"
      2                  = "2 Often true"
      7                  = "7 Refused"
      8                  = "8 Not ascertained"
      9                  = "9 Don't know"
   ;
   VALUE SCP076X
      99                 = "99 Unknown"
   ;
   VALUE SCP079X
      1                  = "1 Yes"
      2                  = "2 There is NO place"
      3                  = "3 There is MORE THAN ONE place"
      7                  = "7 Refused"
      8                  = "8 Not ascertained"
      9                  = "9 Don't know"
   ;
   VALUE SCP080X
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
   VALUE SCP082X
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
   VALUE SCP095X
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
   VALUE SCP112X
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
   VALUE SCP114X
      97                 = "97 Refused"
      98                 = "98 Not ascertained"
      99                 = "99 Don't know"
   ;
   VALUE SCP115X
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
   VALUE SCP118X
      95                 = "95 95+ times"
      97                 = "97 Refused"
      98                 = "98 Not ascertained"
      99                 = "99 Don't know"
   ;
   VALUE SCP121X
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
   VALUE SCP122X
      .                   = '.'
      OTHER              = "Year"
      9997               = "9997 Refused"
      9998               = "9998 Not ascertained"
      9999               = "9999 Don't know"
   ;
   VALUE SCP126X
      0                  = "0 Not true"
      1                  = "1 Somewhat true"
      2                  = "2 Certainly true"
      7                  = "7 Refused"
      8                  = "8 Not ascertained"
      9                  = "9 Don't know"
   ;
   VALUE SCP131X
      0                  = "0 No"
      1                  = "1 Yes, minor difficulties"
      2                  = "2 Yes, definite difficulties"
      3                  = "3 Yes, severe difficulties"
      7                  = "7 Refused"
      8                  = "8 Not ascertained"
      9                  = "9 Don't know"
   ;
   VALUE SCP133X
      1                  = "1 In the past 6 months"
      2                  = "2 7 to 12 months ago"
      3                  = "3 More than 12 months ago"
      7                  = "7 Refused"
      8                  = "8 Not ascertained"
      9                  = "9 Don't know"
   ;

DATA NHIS.SAMCHILD;
   * CREATE A SAS DATA SET;
   INFILE ASCIIDAT PAD LRECL=198;

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

      BWGTLB     3   BWGTOZ     3   BWGTMGR    4   AMR1       3
      AODD1      3   ADD2       3   AMR2       3   AODD2      3
      CONDL1     3   CONDL2     3   CONDL3     3   CONDL4     3
      CONDL5     3   CONDL6     3   CONDL7     3   CONDL8     3
      CONDL9     3   CONDL10    3   CPOX       3   CPOX12MO   3
      CASHMEV    3   CASSTILL   3   CASHYR     3   CASMERYR   3
      HAYF1      3   RALLG1     3   DALLG1     3   SALLG1     3
      DIARH1     3   ANEMIA1    3   EARINF1    3   SEIZE1     3
      HAYF2      3   RALLG2     3   DALLG2     3   SALLG2     3
      DIARH2     3   ANEMIA2    3   FHEAD      3   EARINF2    3
      SEIZE2     3   STUTTER    3   CHSTATYR   3   SCHDAYR1   4
      CCOLD2W    3   CINTIL2W   3   CHEARST    3   CVISION    3
      CBLIND     3   IHSPEQ     3   IHMOB      3   IHMOBYR    3
      PROBRX     3   LEARND     3   CMHAGM15   3   MHIBOY2    3
      CMHAGF15   3   MHIGRL2    3

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

      /* CFI LENGTHS */

      CSHFLUYR   3   CSHFLU_M   3   CSHFLU_Y   4   CSPFLUYR   3
      CSPFLU_M   3   CSPFLU_Y   4

      /* CMB LENGTHS */

      RSCL2_C2   3   RSCL2_E2   3   RSCL3_E3   3   RSCL5_P5   3
      RSCL5_H5   3   RSCL6      3

      /* CMS LENGTHS */

      SEEDIFF    3   MRVSEE     3   MEDDIFF    3   MRVMED     3
      MEDWHY     3   TRETDIFF   3   MRVTRET    3   TRETWHR1   3
      TRETWHR2   3   TRETWHR3   3   TRETWHR4   3   TRETWHR5   3 ;

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
      BWGTMGR      58 -  61    AMR1         62 -  62
      AODD1        63 -  63    ADD2         64 -  64
      AMR2         65 -  65    AODD2        66 -  66
      CONDL1       67 -  67    CONDL2       68 -  68
      CONDL3       69 -  69    CONDL4       70 -  70
      CONDL5       71 -  71    CONDL6       72 -  72
      CONDL7       73 -  73    CONDL8       74 -  74
      CONDL9       75 -  75    CONDL10      76 -  76
      CPOX         77 -  77    CPOX12MO     78 -  78
      CASHMEV      79 -  79    CASSTILL     80 -  80
      CASHYR       81 -  81    CASMERYR     82 -  82
      HAYF1        83 -  83    RALLG1       84 -  84
      DALLG1       85 -  85    SALLG1       86 -  86
      DIARH1       87 -  87    ANEMIA1      88 -  88
      EARINF1      89 -  89    SEIZE1       90 -  90
      HAYF2        91 -  91    RALLG2       92 -  92
      DALLG2       93 -  93    SALLG2       94 -  94
      DIARH2       95 -  95    ANEMIA2      96 -  96
      FHEAD        97 -  97    EARINF2      98 -  98
      SEIZE2       99 -  99    STUTTER     100 - 100
      CHSTATYR    101 - 101    SCHDAYR1    102 - 104
      CCOLD2W     105 - 105    CINTIL2W    106 - 106
      CHEARST     107 - 107    CVISION     108 - 108
      CBLIND      109 - 109    IHSPEQ      110 - 110
      IHMOB       111 - 111    IHMOBYR     112 - 112
      PROBRX      113 - 113    LEARND      114 - 114
      CMHAGM15    115 - 115    MHIBOY2     116 - 117
      CMHAGF15    118 - 118    MHIGRL2     119 - 120


      /* CAU LOCATIONS */

      CUSUALPL    121 - 121    CPLKIND     122 - 122
      CHCPLROU    123 - 123    CHCPLKND    124 - 124
      CHCCHGYR    125 - 125    CHCCHGHI    126 - 126
      CHCDLYR1    127 - 127    CHCDLYR2    128 - 128
      CHCDLYR3    129 - 129    CHCDLYR4    130 - 130
      CHCDLYR5    131 - 131    CHCAFYR     132 - 132
      CHCAFYR1    133 - 133    CHCAFYR2    134 - 134
      CHCAFYR3    135 - 135    CHCAFYR4    136 - 136
      CDNLONGR    137 - 137    CHCSYR11    138 - 138
      CHCSYR12    139 - 139    CHCSYR13    140 - 140
      CHCSYR14    141 - 141    CHCSYR1     142 - 142
      CHCSYR2     143 - 143    CHCSYR3     144 - 144
      CHCSYR4     145 - 145    CHCSYR5     146 - 146
      CHCSYR6     147 - 147    CHCSYR7     148 - 148
      CHCSYR81    149 - 149    CHCSYR82    150 - 150
      CHCSYR10    151 - 151    CHCSYREM    152 - 152
      CHPXYR_C    153 - 153    CHERNOY2    154 - 155
      CHCHYR      156 - 156    CHCHMOYR    157 - 158
      CHCHNOY2    159 - 160    CHCNOYR2    161 - 162
      CSRGYR      163 - 163    RSRGNOYR    164 - 165
      CMDLONGR    166 - 166

      /* CFI LOCATIONS */

      CSHFLUYR    167 - 167    CSHFLU_M    168 - 169
      CSHFLU_Y    170 - 173    CSPFLUYR    174 - 174
      CSPFLU_M    175 - 176    CSPFLU_Y    177 - 180


      /* CMB LOCATIONS */

      RSCL2_C2    181 - 181    RSCL2_E2    182 - 182
      RSCL3_E3    183 - 183    RSCL5_P5    184 - 184
      RSCL5_H5    185 - 185    RSCL6       186 - 186


      /* CMS LOCATIONS */

      SEEDIFF     187 - 187    MRVSEE      188 - 188
      MEDDIFF     189 - 189    MRVMED      190 - 190
      MEDWHY      191 - 191    TRETDIFF    192 - 192
      MRVTRET     193 - 193    TRETWHR1    194 - 194
      TRETWHR2    195 - 195    TRETWHR3    196 - 196
      TRETWHR4    197 - 197    TRETWHR5    198 - 198
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

      BWGTLB     ="Birth weight  (lb)"
      BWGTOZ     ="Birth weight (oz)"
      BWGTMGR    ="Birth weight (grams)"
      AMR1       ="Ever told SC had mental retardation"
      AODD1      ="Ever told SC had other developmental delay"
      ADD2       ="Ever told SC had ADHD/ADD"
      AMR2       ="Ever told SC had mental retardation"
      AODD2      ="Ever told SC had other developmental delay"
      CONDL1     ="Ever told SC had Down syndrome"
      CONDL2     ="Ever told SC had cerebral palsy"
      CONDL3     ="Ever told SC had muscular dystrophy"
      CONDL4     ="Ever told SC had cystic fibrosis"
      CONDL5     ="Ever told SC had sickle cell anemia"
      CONDL6     ="Ever told SC had autism"
      CONDL7     ="Ever told SC had diabetes"
      CONDL8     ="Ever told SC had arthritis"
      CONDL9     ="Ever told SC had congenital heart disease"
      CONDL10    ="Ever told SC had other heart condition"
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
      CCOLD2W    ="Had a head/chest cold those 2 weeks"
      CINTIL2W   ="Had stomach illness with vomiting/diarrhea, 2 weeks"
      CHEARST    ="Hearing without hearing aid"
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

      /* CFI LABELS */

      CSHFLUYR   ="Flu shot past 12 m"
      CSHFLU_M   ="Month of most recent flu shot"
      CSHFLU_Y   ="Year of most recent flu shot"
      CSPFLUYR   ="Flu nasal spray past 12 m"
      CSPFLU_M   ="Month of most recent flu nasal vaccine"
      CSPFLU_Y   ="Year of most recent flu nasal vaccine"

      /* CMB LABELS */

      RSCL2_C2   ="Well behaved/does what requested, past 6 m"
      RSCL2_E2   ="Many worries/often seems worried, past 6 m"
      RSCL3_E3   ="Unhappy/depressed/tearful, past 6 m"
      RSCL5_P5   ="Gets along better w/adults than children/youth, past 6 m"
      RSCL5_H5   ="Good attention/completes chores, homework, past 6 m"
      RSCL6      ="Difficulties w/emotions/concentration/behavior/getting along"

      /* CMS LABELS */

      SEEDIFF    ="See/Talk to provider about difficulties"
      MRVSEE     ="Most recent conversation/visit about difficulties"
      MEDDIFF    ="Medication ever prescribed for difficulties"
      MRVMED     ="Most recent medication prescribed"
      MEDWHY     =
"Medication prescribed for concentration/hyperactivity/impulsivity"
      TRETDIFF   ="Received treatment or help for difficulties"
      MRVTRET    ="Most recent treatment/help received"
      TRETWHR1   ="Treatment/help at pediatric/general medical care practice"
      TRETWHR2   ="Treatment/help at mental health private practice"
      TRETWHR3   ="Treatment/help at mental health clinic/center"
      TRETWHR4   ="Treatment/help at child's school"
      TRETWHR5   ="Treatment/help at other place"
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
      AMR1      SCP024X.   AODD1     SCP024X.   ADD2      SCP024X.
      AMR2      SCP024X.   AODD2     SCP024X.   CONDL1    SCP029X.
      CONDL2    SCP029X.   CONDL3    SCP029X.   CONDL4    SCP029X.
      CONDL5    SCP029X.   CONDL6    SCP029X.   CONDL7    SCP029X.
      CONDL8    SCP029X.   CONDL9    SCP029X.   CONDL10   SCP029X.
      CPOX      SCP039X.   CPOX12MO  SCP024X.   CASHMEV   SCP024X.
      CASSTILL  SCP024X.   CASHYR    SCP024X.   CASMERYR  SCP024X.
      HAYF1     SCP024X.   RALLG1    SCP024X.   DALLG1    SCP024X.
      SALLG1    SCP024X.   DIARH1    SCP024X.   ANEMIA1   SCP024X.
      EARINF1   SCP024X.   SEIZE1    SCP024X.   HAYF2     SCP024X.
      RALLG2    SCP024X.   DALLG2    SCP024X.   SALLG2    SCP024X.
      DIARH2    SCP024X.   ANEMIA2   SCP024X.   FHEAD     SCP024X.
      EARINF2   SCP024X.   SEIZE2    SCP024X.   STUTTER   SCP024X.
      CHSTATYR  SCP063X.   SCHDAYR1  SCP064X.   CCOLD2W   SCP024X.
      CINTIL2W  SCP024X.   CHEARST   SCP067X.   CVISION   SCP024X.
      CBLIND    SCP024X.   IHSPEQ    SCP024X.   IHMOB     SCP024X.
      IHMOBYR   SCP024X.   PROBRX    SCP024X.   LEARND    SCP024X.
      CMHAGM15  SCP075X.   MHIBOY2   SCP076X.   CMHAGF15  SCP075X.
      MHIGRL2   SCP076X.

      /* CAU FORMAT ASSOCIATIONS */

      CUSUALPL  SCP079X.   CPLKIND   SCP080X.   CHCPLROU  SCP024X.
      CHCPLKND  SCP082X.   CHCCHGYR  SCP024X.   CHCCHGHI  SCP024X.
      CHCDLYR1  SCP024X.   CHCDLYR2  SCP024X.   CHCDLYR3  SCP024X.
      CHCDLYR4  SCP024X.   CHCDLYR5  SCP024X.   CHCAFYR   SCP024X.
      CHCAFYR1  SCP024X.   CHCAFYR2  SCP024X.   CHCAFYR3  SCP024X.
      CHCAFYR4  SCP024X.   CDNLONGR  SCP095X.   CHCSYR11  SCP024X.
      CHCSYR12  SCP024X.   CHCSYR13  SCP024X.   CHCSYR14  SCP024X.
      CHCSYR1   SCP024X.   CHCSYR2   SCP024X.   CHCSYR3   SCP024X.
      CHCSYR4   SCP024X.   CHCSYR5   SCP024X.   CHCSYR6   SCP024X.
      CHCSYR7   SCP024X.   CHCSYR81  SCP024X.   CHCSYR82  SCP024X.
      CHCSYR10  SCP024X.   CHCSYREM  SCP024X.   CHPXYR_C  SCP024X.
      CHERNOY2  SCP112X.   CHCHYR    SCP024X.   CHCHMOYR  SCP114X.
      CHCHNOY2  SCP115X.   CHCNOYR2  SCP112X.   CSRGYR    SCP024X.
      RSRGNOYR  SCP118X.   CMDLONGR  SCP095X.

      /* CFI FORMAT ASSOCIATIONS */

      CSHFLUYR  SCP024X.   CSHFLU_M  SCP121X.   CSHFLU_Y  SCP122X.
      CSPFLUYR  SCP024X.   CSPFLU_M  SCP121X.   CSPFLU_Y  SCP122X.

      /* CMB FORMAT ASSOCIATIONS */

      RSCL2_C2  SCP126X.   RSCL2_E2  SCP126X.   RSCL3_E3  SCP126X.
      RSCL5_P5  SCP126X.   RSCL5_H5  SCP126X.   RSCL6     SCP131X.

      /* CMS FORMAT ASSOCIATIONS */

      SEEDIFF   SCP024X.   MRVSEE    SCP133X.   MEDDIFF   SCP024X.
      MRVMED    SCP133X.   MEDWHY    SCP024X.   TRETDIFF  SCP024X.
      MRVTRET   SCP133X.   TRETWHR1  SCP029X.   TRETWHR2  SCP029X.
      TRETWHR3  SCP029X.   TRETWHR4  SCP029X.   TRETWHR5  SCP029X.;
RUN;

PROC CONTENTS DATA=NHIS.SAMCHILD;
   TITLE1 'CONTENTS OF THE 2006 NHIS Sample Child FILE';

PROC FREQ DATA=NHIS.SAMCHILD NOTITLE;
   TABLES RECTYPE/LIST MISSING;
   TITLE1 'FREQUENCY REPORT FOR 2006 NHIS Sample Child FILE';
   TITLE2 '(WEIGHTED)';
   WEIGHT WTFA_SC;

PROC FREQ DATA=NHIS.SAMCHILD NOTITLE;
   TABLES RECTYPE/LIST MISSING;
   TITLE1 'FREQUENCY REPORT FOR 2006 NHIS Sample Child FILE';
   TITLE2 '(UNWEIGHTED)';

* USER NOTE: TO SEE UNFORMATTED VALUES IN PROCEDURES, ADD THE
             STATEMENT: FORMAT _ALL_;
RUN;
