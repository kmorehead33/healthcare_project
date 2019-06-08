*********************************************************************
 MAY 22, 2018  2:08 PM
 
 This is an example of a SAS program that creates a SAS
 file from the 2017 NHIS Public Use SAMCHILD.DAT ASCII file
 
 This is stored in SAMCHILD.SAS
*********************************************************************;

* USER NOTE: PLACE NEXT STATEMENT IN SUBSEQUENT PROGRAMS;
LIBNAME  NHIS     "C:\NHIS2017";

* USER NOTE: PLACE NEXT STATEMENT IN SUBSEQUENT PROGRAMS
             IF YOU ALLOW PROGRAM TO PERMANENTLY STORE FORMATS;
LIBNAME  LIBRARY  "C:\NHIS2017";

FILENAME ASCIIDAT 'C:\NHIS2017\SAMCHILD.dat';

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
      38                 = "38 Functioning and Disability"
      40                 = "40 Sample Child"
      60                 = "60 Family"
      63                 = "63 Family Disability Questions"
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
      1                  = "1 Parent (Biological, adoptive, or step)"
      2                  = "2 Grandparent"
      3                  = "3 Aunt/Uncle"
      4                  = "4 Brother"
      5                  = "5 Other relative or other non-relative"
      7                  = "7 Refused"
      8                  = "8 Not ascertained"
      9                  = "9 Don't know"
   ;
   VALUE SCP021X
      1                  = 
"1 Started Sample Child Core 2+ weeks after the initial interview"
      2                  = 
"2 Started Sample Child Core less than 2 weeks after the initial interview"
   ;
   VALUE SCP022X
      1                  = 
"1 Families selected to receive AFD (sample adults) section"
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
   VALUE SCP040X
      1                  = "1 Mentioned"
      2                  = "2 Not mentioned"
      7                  = "7 Refused"
      8                  = "8 Not ascertained"
      9                  = "9 Don't know"
   ;
   VALUE SCP049X
      1                  = "1 Yes"
      2                  = "2 No"
      7                  = "7 Refused"
      9                  = "9 Don't know"
   ;
   VALUE SCP073X
      1                  = "1 Better"
      2                  = "2 Worse"
      3                  = "3 About the same"
      7                  = "7 Refused"
      8                  = "8 Not ascertained"
      9                  = "9 Don't know"
   ;
   VALUE SCP074X
      000                = "000 None"
      996                = "996 Did not go to school"
      997                = "997 Refused"
      998                = "998 Not ascertained"
      999                = "999 Don't know"
   ;
   VALUE SCP077X
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
   VALUE SCP081X
      1                  = "1 In the last 12 months"
      2                  = "2 In the last 13-24 months"
      3                  = "3 Over 24 months"
      7                  = "7 Refused"
      8                  = "8 Not ascertained"
      9                  = "9 Don't know"
   ;
   VALUE SCP086X
      1                  = "1 Always"
      2                  = "2 Most of the time"
      3                  = "3 Some of the time"
      4                  = "4 None of the time"
      7                  = "7 Refused"
      8                  = "8 Not ascertained"
      9                  = "9 Don't know"
   ;
   VALUE SCP092X
      99                 = "99 Unknown"
   ;
   VALUE SCP093X
      0                  = "0 Not true"
      1                  = "1 Sometimes true"
      2                  = "2 Often true"
      7                  = "7 Refused"
      8                  = "8 Not ascertained"
      9                  = "9 Don't know"
   ;
   VALUE SCP096X
      1                  = "1 Yes"
      2                  = "2 There is NO place"
      3                  = "3 There is MORE THAN ONE place"
      7                  = "7 Refused"
      8                  = "8 Not ascertained"
      9                  = "9 Don't know"
   ;
   VALUE SCP097X
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
   VALUE SCP099X
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
   VALUE SCP103X
      1                  = "1 Yes"
      2                  = "2 No"
      7                  = "7 Refused"
      8                  = "8 Not ascertained"
      9                  = "9 Don’t know"
   ;
   VALUE SCP120X
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
   VALUE SCP137X
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
   VALUE SCP149X
      97                 = "97 Refused"
      98                 = "98 Not ascertained"
      99                 = "99 Don't know"
   ;
   VALUE SCP150X
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
   VALUE SCP153X
      07                 = "07 7+ times"
      97                 = "97 Refused"
      98                 = "98 Not ascertained"
      99                 = "99 Don't know"
   ;
   VALUE SCP155X
      0                  = "0 Not true"
      1                  = "1 Somewhat true"
      2                  = "2 Certainly true"
      7                  = "7 Refused"
      8                  = "8 Not ascertained"
      9                  = "9 Don't know"
   ;
   VALUE SCP160X
      0                  = "0 No"
      1                  = "1 Yes, minor difficulties"
      2                  = "2 Yes, definite difficulties"
      3                  = "3 Yes, severe difficulties"
      7                  = "7 Refused"
      8                  = "8 Not ascertained"
      9                  = "9 Don't know"
   ;
   VALUE SCP162X
      1                  = "1 1 vaccination or dose"
      2                  = "2 2 or more vaccination doses"
      7                  = "7 Refused"
      8                  = "8 Not ascertained"
      9                  = "9 Don't know"
   ;
   VALUE SCP163X
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
   VALUE SCP164X
      .                   = '.'
      OTHER              = "Year"
      9997               = "9997 Refused"
      9998               = "9998 Not ascertained"
      9999               = "9999 Don't know"
   ;
   VALUE SCP165X
      1                  = "1 Flu shot"
      2                  = "2 Flu nasal spray (spray, mist or drop in nose)"
      7                  = "7 Refused"
      8                  = "8 Not ascertained"
      9                  = "9 Don't know"
   ;

DATA NHIS.SAMCHILD;
   * CREATE A SAS DATA SET;
   INFILE ASCIIDAT PAD LRECL=253;

   * DEFINE LENGTH OF ALL VARIABLES;

   LENGTH

      /* IDN LENGTHS */

      RECTYPE    3   SRVY_YR    4   HHX      $ 6   INTV_QRT   3
      INTV_MON   3   FMX      $ 2   FPX      $ 2   WTIA_SC    8
      WTFA_SC    8

      /* UCF LENGTHS */

      REGION     3   PSTRAT     4   PPSU       4

      /* HHC LENGTHS */

      SEX        3   HISPAN_I   3   RACERPI2   3   MRACRPI2   3
      MRACBPI2   3   AGE_P      3

      /* CID LENGTHS */

      CSRESPNO $ 2   CSRELTVP   3   LATEINTC   3

      /* FDB LENGTHS */

      FDRN_FLG   3

      /* CHS LENGTHS */

      TOTOZ_P    4   BWTGRM_P   4   CHGHT_TC   3   CWGHT_TC   4
      BMI_SC     4   AMR1R      3   AODD1      3   AMR1RN     3
      AODD1N     3   ADD2       3   AMR2R      3   AUTISM     3
      AODD2      3   ADD2N      3   AMR2RN     3   AUTISMN    3
      AODD2N     3   CCONDRR1   3   CCONDRR2   3   CCONDRR3   3
      CCONDRR4   3   CCONDRR5   3   CCONDRR6   3   CCONDRR7   3
      CCONDRR8   3   CCONDRR9   3   CPOX       3   CPOX12MO   3
      CASHMEV    3   CASSTILL   3   CASHYR     3   CASERYR1   3
      HAYF1      3   RALLG1     3   DALLG1     3   SALLG1     3
      DIARH1     3   ANEMIA1    3   EARINF1    3   SEIZE1     3
      HAYF2      3   RALLG2     3   DALLG2     3   SALLG2     3
      DIARH2     3   ANEMIA2    3   FHEAD      3   EARINF2    3
      SEIZE2     3   STUTTER    3   CHSTATYR   3   SCHDAYR1   4
      CCOLD2W    3   CINTIL2W   3   CHEARST1   3   CVISION    3
      CBLIND     3   CVISTST    3   CVISLT     3   CVISGLAS   3
      CVISDIST   3   CVISREAD   3   CVISACT    3   CVISPROT   3
      IHSPEQ     3   IHMOB      3   IHMOBYR    3   PROBRX     3
      LEARND     3   MHIBOY2    3   CMHAGM15   3   MHIGRL2    3
      CMHAGF15   3

      /* CAU LENGTHS */

      CUSUALPL   3   CPLKIND    3   CHCPLROU   3   CHCPLKND   3
      CHCCHGYR   3   CHCCHGHI   3   CPRVTRYR   3   CPRVTRFD   3
      CDRNANP    3   CDRNAI     3   CHCDLYR1   3   CHCDLYR2   3
      CHCDLYR3   3   CHCDLYR4   3   CHCDLYR5   3   CHCAFYR    3
      CHCAFYRN   3   CHCAFYRF   3   CHCAFYR1   3   CHCAFYR2   3
      CHCAFYR3   3   CHCAFYR4   3   CHCAFYR5   3   CHCAFYR6   3
      CDNLONGR   3   CHCSYR11   3   CHCSYR12   3   CHCSYR13   3
      CHCSYR14   3   CHCSYR1    3   CHCSYR2    3   CHCSYR3    3
      CHCSYR4    3   CHCSYR5    3   CHCSYR6    3   CHCSYR7    3
      CHCSYR81   3   CHCSYR82   3   CHCSYR10   3   CHCSYREM   3
      CHPXYR_C   3   CHERNOY2   3   CERVISND   3   CERHOS     3
      CERREA1R   3   CERREA2R   3   CERREA3R   3   CERREA4R   3
      CERREA5R   3   CERREA6R   3   CERREA7R   3   CERREA8R   3
      CHCHYR     3   CHCHMOYR   3   CHCHNOY2   3   CHCNOYR2   3
      CSRGYR     3   RSRGNOYP   3   CMDLONGR   3

      /* CMB LENGTHS */

      RSCL2_C2   3   RSCL2_E2   3   RSCL3_E3   3   RSCL5_P5   3
      RSCL5_H5   3   RSCL6      3

      /* CFI LENGTHS */

      CSHFLU12   3   CSHFLUNM   3   CSHFLUM1   3   CSHFLUY1   4
      CSHSPFL1   3   CSHFLUM2   3   CSHFLUY2   4   CSHSPFL2   3

      /* CCH LENGTHS */

      CNAT_USM   3   CCHE_USM   3   CTRD_USM   3   CTR_US11   3
      CTR_US12   3   CTR_US13   3   CTR_US14   3   CTR_US15   3
      CTR_US16   3   CHOM_USM   3   CMBOU_MN   3   CMBOU_MD   3
      CMBOU_SP   3   CMBOU_IM   3   CMBOU_PR   3   CYTQU_YG   3
      CYTQ_BTY   3   CYTQ_MDY   3   CYTQU_TA   3   CYTQ_BTT   3
      CYTQ_MDT   3   CYTQU_QG   3   CYTQ_BTQ   3   CYTQ_MDQ   3 ;

   * INPUT ALL VARIABLES;

   INPUT

      /* IDN LOCATIONS */

      RECTYPE       1 -   2    SRVY_YR       3 -   6
      HHX      $    7 -  12    INTV_QRT     13 -  13
      INTV_MON     14 -  15    FMX      $   16 -  17
      FPX      $   18 -  19    WTIA_SC      20 -  26 .1
      WTFA_SC      27 -  32

      /* UCF LOCATIONS */

      REGION       33 -  33    PSTRAT       34 -  36
      PPSU         37 -  39

      /* HHC LOCATIONS */

      SEX          40 -  40    HISPAN_I     41 -  42
      RACERPI2     43 -  44    MRACRPI2     45 -  46
      MRACBPI2     47 -  48    AGE_P        49 -  50


      /* CID LOCATIONS */

      CSRESPNO $   51 -  52    CSRELTVP     53 -  53
      LATEINTC     54 -  54

      /* FDB LOCATIONS */

      FDRN_FLG     55 -  55

      /* CHS LOCATIONS */

      TOTOZ_P      56 -  58    BWTGRM_P     59 -  62
      CHGHT_TC     63 -  64    CWGHT_TC     65 -  67
      BMI_SC       68 -  71    AMR1R        72 -  72
      AODD1        73 -  73    AMR1RN       74 -  74
      AODD1N       75 -  75    ADD2         76 -  76
      AMR2R        77 -  77    AUTISM       78 -  78
      AODD2        79 -  79    ADD2N        80 -  80
      AMR2RN       81 -  81    AUTISMN      82 -  82
      AODD2N       83 -  83    CCONDRR1     84 -  84
      CCONDRR2     85 -  85    CCONDRR3     86 -  86
      CCONDRR4     87 -  87    CCONDRR5     88 -  88
      CCONDRR6     89 -  89    CCONDRR7     90 -  90
      CCONDRR8     91 -  91    CCONDRR9     92 -  92
      CPOX         93 -  93    CPOX12MO     94 -  94
      CASHMEV      95 -  95    CASSTILL     96 -  96
      CASHYR       97 -  97    CASERYR1     98 -  98
      HAYF1        99 -  99    RALLG1      100 - 100
      DALLG1      101 - 101    SALLG1      102 - 102
      DIARH1      103 - 103    ANEMIA1     104 - 104
      EARINF1     105 - 105    SEIZE1      106 - 106
      HAYF2       107 - 107    RALLG2      108 - 108
      DALLG2      109 - 109    SALLG2      110 - 110
      DIARH2      111 - 111    ANEMIA2     112 - 112
      FHEAD       113 - 113    EARINF2     114 - 114
      SEIZE2      115 - 115    STUTTER     116 - 116
      CHSTATYR    117 - 117    SCHDAYR1    118 - 120
      CCOLD2W     121 - 121    CINTIL2W    122 - 122
      CHEARST1    123 - 123    CVISION     124 - 124
      CBLIND      125 - 125    CVISTST     126 - 126
      CVISLT      127 - 127    CVISGLAS    128 - 128
      CVISDIST    129 - 129    CVISREAD    130 - 130
      CVISACT     131 - 131    CVISPROT    132 - 132
      IHSPEQ      133 - 133    IHMOB       134 - 134
      IHMOBYR     135 - 135    PROBRX      136 - 136
      LEARND      137 - 137    MHIBOY2     138 - 139
      CMHAGM15    140 - 140    MHIGRL2     141 - 142
      CMHAGF15    143 - 143

      /* CAU LOCATIONS */

      CUSUALPL    144 - 144    CPLKIND     145 - 145
      CHCPLROU    146 - 146    CHCPLKND    147 - 147
      CHCCHGYR    148 - 148    CHCCHGHI    149 - 149
      CPRVTRYR    150 - 150    CPRVTRFD    151 - 151
      CDRNANP     152 - 152    CDRNAI      153 - 153
      CHCDLYR1    154 - 154    CHCDLYR2    155 - 155
      CHCDLYR3    156 - 156    CHCDLYR4    157 - 157
      CHCDLYR5    158 - 158    CHCAFYR     159 - 159
      CHCAFYRN    160 - 160    CHCAFYRF    161 - 161
      CHCAFYR1    162 - 162    CHCAFYR2    163 - 163
      CHCAFYR3    164 - 164    CHCAFYR4    165 - 165
      CHCAFYR5    166 - 166    CHCAFYR6    167 - 167
      CDNLONGR    168 - 168    CHCSYR11    169 - 169
      CHCSYR12    170 - 170    CHCSYR13    171 - 171
      CHCSYR14    172 - 172    CHCSYR1     173 - 173
      CHCSYR2     174 - 174    CHCSYR3     175 - 175
      CHCSYR4     176 - 176    CHCSYR5     177 - 177
      CHCSYR6     178 - 178    CHCSYR7     179 - 179
      CHCSYR81    180 - 180    CHCSYR82    181 - 181
      CHCSYR10    182 - 182    CHCSYREM    183 - 183
      CHPXYR_C    184 - 184    CHERNOY2    185 - 186
      CERVISND    187 - 187    CERHOS      188 - 188
      CERREA1R    189 - 189    CERREA2R    190 - 190
      CERREA3R    191 - 191    CERREA4R    192 - 192
      CERREA5R    193 - 193    CERREA6R    194 - 194
      CERREA7R    195 - 195    CERREA8R    196 - 196
      CHCHYR      197 - 197    CHCHMOYR    198 - 199
      CHCHNOY2    200 - 201    CHCNOYR2    202 - 203
      CSRGYR      204 - 204    RSRGNOYP    205 - 206
      CMDLONGR    207 - 207

      /* CMB LOCATIONS */

      RSCL2_C2    208 - 208    RSCL2_E2    209 - 209
      RSCL3_E3    210 - 210    RSCL5_P5    211 - 211
      RSCL5_H5    212 - 212    RSCL6       213 - 213


      /* CFI LOCATIONS */

      CSHFLU12    214 - 214    CSHFLUNM    215 - 215
      CSHFLUM1    216 - 217    CSHFLUY1    218 - 221
      CSHSPFL1    222 - 222    CSHFLUM2    223 - 224
      CSHFLUY2    225 - 228    CSHSPFL2    229 - 229


      /* CCH LOCATIONS */

      CNAT_USM    230 - 230    CCHE_USM    231 - 231
      CTRD_USM    232 - 232    CTR_US11    233 - 233
      CTR_US12    234 - 234    CTR_US13    235 - 235
      CTR_US14    236 - 236    CTR_US15    237 - 237
      CTR_US16    238 - 238    CHOM_USM    239 - 239
      CMBOU_MN    240 - 240    CMBOU_MD    241 - 241
      CMBOU_SP    242 - 242    CMBOU_IM    243 - 243
      CMBOU_PR    244 - 244    CYTQU_YG    245 - 245
      CYTQ_BTY    246 - 246    CYTQ_MDY    247 - 247
      CYTQU_TA    248 - 248    CYTQ_BTT    249 - 249
      CYTQ_MDT    250 - 250    CYTQU_QG    251 - 251
      CYTQ_BTQ    252 - 252    CYTQ_MDQ    253 - 253
;

   * DEFINE VARIABLE LABELS;

   LABEL

      /* IDN LABELS */

      RECTYPE    ="File type identifier"
      SRVY_YR    ="Year of National Health Interview Survey"
      HHX        ="Household Number"
      INTV_QRT   ="Interview Quarter"
      INTV_MON   ="Assignment/Interview Month"
      FMX        ="Family Number"
      FPX        ="Person Number (Within family)"
      WTIA_SC    ="Weight - Interim Annual"
      WTFA_SC    ="Weight - Final Annual"

      /* UCF LABELS */

      REGION     ="Region"
      PSTRAT     ="Pseudo-stratum for public-use file variance estimation"
      PPSU       ="Pseudo-PSU for public-use file variance estimation"

      /* HHC LABELS */

      SEX        ="Sex"
      HISPAN_I   ="Hispanic subgroup detail"
      RACERPI2   ="OMB groups w/multiple race"
      MRACRPI2   ="Race coded to single/multiple race group"
      MRACBPI2   ="Race coded to single/multiple race group"
      AGE_P      ="Age"

      /* CID LABELS */

      CSRESPNO   ="Person # of available SC respondent"
      CSRELTVP   ="Person's relationship to child"
      LATEINTC   ="Late Sample Child interviews"

      /* FDB LABELS */

      FDRN_FLG   ="Disability Questions flag"

      /* CHS LABELS */

      TOTOZ_P    ="Total birth weight in ounces for public use"
      BWTGRM_P   ="Birth weight in grams for public use"
      CHGHT_TC   ="Total current height in inches (truncated)"
      CWGHT_TC   ="Current weight in pounds (truncated)"
      BMI_SC     ="Body Mass Index (BMI)"
      AMR1R      =
"Ever told SC had an intellectual disability also known as mental retardation"
      AODD1      ="Ever told SC had other developmental delay"
      AMR1RN     =
"SC currently has intellectual disability also known as mental retardation"
      AODD1N     ="SC currently has other developmental delay"
      ADD2       ="Ever told SC had ADHD/ADD"
      AMR2R      =
"Ever told SC had an intellectual disability also known as mental retardation"
      AUTISM     =
"Ever told SC had autism, Asperger's, PDD or autism spectrum disorder"
      AODD2      ="Ever told SC had other developmental delay"
      ADD2N      ="SC currently has ADHD/ADD"
      AMR2RN     =
"SC currently has intellectual disability also known as mental retardation"
      AUTISMN    =
"SC currently has autism, Asperger's, PDD or autism spectrum disorder"
      AODD2N     ="SC currently has other developmental delay"
      CCONDRR1   ="Ever told SC had Down syndrome"
      CCONDRR2   ="Ever told SC had cerebral palsy"
      CCONDRR3   ="Ever told SC had muscular dystrophy"
      CCONDRR4   ="Ever told SC had cystic fibrosis"
      CCONDRR5   ="Ever told SC had sickle cell anemia"
      CCONDRR6   ="Ever told SC had diabetes"
      CCONDRR7   ="Ever told SC had arthritis"
      CCONDRR8   ="Ever told SC had congenital heart disease"
      CCONDRR9   ="Ever told SC had other heart condition"
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
"Had stomach illness with vomiting/diarrhea,   2 week reference period"
      CHEARST1   ="Hearing without a hearing aid"
      CVISION    ="Trouble seeing"
      CBLIND     ="Blind/unable to see at all"
      CVISTST    ="EVER had vision tested by a doctor"
      CVISLT     ="When was vision last tested"
      CVISGLAS   ="Wear eyeglasses or contact lenses"
      CVISDIST   =
"Eyeglasses/contact lenses to read street signs/see in the distance"
      CVISREAD   =
"Eyeglasses or contact lenses to read books, write, to see well up close"
      CVISACT    =
"Participate in sports/other activities that can cause eye injury"
      CVISPROT   ="Use eye protection"
      IHSPEQ     ="Need special equipment due to impairment/health problem"
      IHMOB      ="Impairment/health problem limit crawl/walk/run/play"
      IHMOBYR    ="Impairment/health problem lasted/will last 12+ m"
      PROBRX     ="Taken RX medication for 3+ m"
      LEARND     ="Ever told SC had a learning disability"
      MHIBOY2    ="Mental health indicator (MHI) scale score"
      CMHAGM15   ="Been unhappy/depressed, past 2 m"
      MHIGRL2    ="Mental health indicator (MHI) scale score"
      CMHAGF15   ="Been unhappy/depressed, past 2 m"

      /* CAU LABELS */

      CUSUALPL   ="Place USUALLY go when sick"
      CPLKIND    ="Type of place to go when sick (most often)"
      CHCPLROU   ="USUALLY go there for routine/preventive care"
      CHCPLKND   ="Type of place USUALLY go for routine/preventive care"
      CHCCHGYR   ="Change health care place, past 12 m"
      CHCCHGHI   ="Change related to health insurance"
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
      CERREA1R   ="Didn't have another place to go"
      CERREA2R   ="Doctor's office or clinic was not open"
      CERREA3R   ="Health provider advised ER visit"
      CERREA4R   ="Problem too serious for doctor's office or clinic"
      CERREA5R   ="Only a hospital could help"
      CERREA6R   ="ER is closest provider"
      CERREA7R   ="ER provides most of child's medical care"
      CERREA8R   ="Arrived by ambulance or other emergency vehicle"
      CHCHYR     ="Received home care from health professional, past 12 m"
      CHCHMOYR   ="# of months of home care, past 12 m"
      CHCHNOY2   ="Total number of home visits"
      CHCNOYR2   ="Total number of office visits, past 12 m"
      CSRGYR     ="Had surgery/surgical procedure, past 12 m"
      RSRGNOYP   ="# of outpatient surgeries, past 12 m"
      CMDLONGR   ="Time since last seen/talked to health professional"

      /* CMB LABELS */

      RSCL2_C2   ="Well behaved/does what requested, past 6 m"
      RSCL2_E2   ="Many worries/often seems worried, past 6 m"
      RSCL3_E3   ="Unhappy/depressed/tearful, past 6 m"
      RSCL5_P5   ="Gets along better w/adults than children/youth, past 6 m"
      RSCL5_H5   ="Good attention/completes chores, homework, past 6 m"
      RSCL6      ="Difficulties w/emotions/concentration/behavior/getting along"

      /* CFI LABELS */

      CSHFLU12   ="Flu vaccination, past 12 m"
      CSHFLUNM   ="Number of flu vaccines, past 12 m"
      CSHFLUM1   ="Month of most recent flu vaccine"
      CSHFLUY1   ="Year of most recent flu vaccine"
      CSHSPFL1   ="Administration method most recent flu vaccine"
      CSHFLUM2   ="Month of next most recent flu vaccine"
      CSHFLUY2   ="Year of next most recent flu vaccine"
      CSHSPFL2   ="Administration method next most recent flu vaccine"

      /* CCH LABELS */

      CNAT_USM   ="Saw a practitioner for naturopathy, past 12 months"
      CCHE_USM   ="Saw a practitioner for chelation therapy past 12 months"
      CTRD_USM   ="Saw a traditional healer, past 12 months"
      CTR_US11   ="Saw Shaman, past 12 months"
      CTR_US12   ="Saw Curandero, Machi or Parchero, past 12 months"
      CTR_US13   ="Saw Yerbero or Hierbista, past 12 months"
      CTR_US14   ="Saw Sobador, past 12 months"
      CTR_US15   ="Saw Native American Healer or Medicine Man, past 12 months"
      CTR_US16   =
"Saw other practitioner for traditional medicine, past 12 months"
      CHOM_USM   ="Saw a practitioner for homeopathy, past 12 months"
      CMBOU_MN   ="Used mantra meditation, past 12 months"
      CMBOU_MD   ="Used mindfulness meditation, past 12 months"
      CMBOU_SP   ="Used spiritual meditation, past 12 months"
      CMBOU_IM   ="Used guided imagery, past 12 months"
      CMBOU_PR   ="Used progressive relaxation, past 12 months"
      CYTQU_YG   ="Practiced yoga, past 12 months"
      CYTQ_BTY   ="Does breathing exercises as part of yoga"
      CYTQ_MDY   ="Does meditation as part of yoga"
      CYTQU_TA   ="Practiced Tai Chi, past 12 months"
      CYTQ_BTT   ="Does breathing exercises as part of Tai Chi"
      CYTQ_MDT   ="Does meditation as part of Tai Chi"
      CYTQU_QG   ="Practiced Qi Gong, past 12 months"
      CYTQ_BTQ   ="Does breathing exercises as part of Qi Gong"
      CYTQ_MDQ   ="Does meditation as part of Qi Gong"
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

      CSRESPNO  $SCP019X.  CSRELTVP  SCP020X.   LATEINTC  SCP021X.

      /* FDB FORMAT ASSOCIATIONS */

      FDRN_FLG  SCP022X.

      /* CHS FORMAT ASSOCIATIONS */

      TOTOZ_P   SCP023X.   BWTGRM_P  SCP024X.   CHGHT_TC  SCP025X.
      CWGHT_TC  SCP026X.   BMI_SC    SCP027X.   AMR1R     SCP028X.
      AODD1     SCP028X.   AMR1RN    SCP028X.   AODD1N    SCP028X.
      ADD2      SCP028X.   AMR2R     SCP028X.   AUTISM    SCP028X.
      AODD2     SCP028X.   ADD2N     SCP028X.   AMR2RN    SCP028X.
      AUTISMN   SCP028X.   AODD2N    SCP028X.   CCONDRR1  SCP040X.
      CCONDRR2  SCP040X.   CCONDRR3  SCP040X.   CCONDRR4  SCP040X.
      CCONDRR5  SCP040X.   CCONDRR6  SCP040X.   CCONDRR7  SCP040X.
      CCONDRR8  SCP040X.   CCONDRR9  SCP040X.   CPOX      SCP049X.
      CPOX12MO  SCP028X.   CASHMEV   SCP028X.   CASSTILL  SCP028X.
      CASHYR    SCP028X.   CASERYR1  SCP028X.   HAYF1     SCP028X.
      RALLG1    SCP028X.   DALLG1    SCP028X.   SALLG1    SCP028X.
      DIARH1    SCP028X.   ANEMIA1   SCP028X.   EARINF1   SCP028X.
      SEIZE1    SCP028X.   HAYF2     SCP028X.   RALLG2    SCP028X.
      DALLG2    SCP028X.   SALLG2    SCP028X.   DIARH2    SCP028X.
      ANEMIA2   SCP028X.   FHEAD     SCP028X.   EARINF2   SCP028X.
      SEIZE2    SCP028X.   STUTTER   SCP028X.   CHSTATYR  SCP073X.
      SCHDAYR1  SCP074X.   CCOLD2W   SCP028X.   CINTIL2W  SCP028X.
      CHEARST1  SCP077X.   CVISION   SCP028X.   CBLIND    SCP028X.
      CVISTST   SCP028X.   CVISLT    SCP081X.   CVISGLAS  SCP028X.
      CVISDIST  SCP028X.   CVISREAD  SCP028X.   CVISACT   SCP028X.
      CVISPROT  SCP086X.   IHSPEQ    SCP028X.   IHMOB     SCP028X.
      IHMOBYR   SCP028X.   PROBRX    SCP028X.   LEARND    SCP028X.
      MHIBOY2   SCP092X.   CMHAGM15  SCP093X.   MHIGRL2   SCP092X.
      CMHAGF15  SCP093X.

      /* CAU FORMAT ASSOCIATIONS */

      CUSUALPL  SCP096X.   CPLKIND   SCP097X.   CHCPLROU  SCP028X.
      CHCPLKND  SCP099X.   CHCCHGYR  SCP028X.   CHCCHGHI  SCP028X.
      CPRVTRYR  SCP028X.   CPRVTRFD  SCP103X.   CDRNANP   SCP028X.
      CDRNAI    SCP028X.   CHCDLYR1  SCP028X.   CHCDLYR2  SCP028X.
      CHCDLYR3  SCP028X.   CHCDLYR4  SCP028X.   CHCDLYR5  SCP028X.
      CHCAFYR   SCP028X.   CHCAFYRN  SCP028X.   CHCAFYRF  SCP028X.
      CHCAFYR1  SCP028X.   CHCAFYR2  SCP028X.   CHCAFYR3  SCP028X.
      CHCAFYR4  SCP028X.   CHCAFYR5  SCP028X.   CHCAFYR6  SCP028X.
      CDNLONGR  SCP120X.   CHCSYR11  SCP028X.   CHCSYR12  SCP028X.
      CHCSYR13  SCP028X.   CHCSYR14  SCP028X.   CHCSYR1   SCP028X.
      CHCSYR2   SCP028X.   CHCSYR3   SCP028X.   CHCSYR4   SCP028X.
      CHCSYR5   SCP028X.   CHCSYR6   SCP028X.   CHCSYR7   SCP028X.
      CHCSYR81  SCP028X.   CHCSYR82  SCP028X.   CHCSYR10  SCP028X.
      CHCSYREM  SCP028X.   CHPXYR_C  SCP028X.   CHERNOY2  SCP137X.
      CERVISND  SCP028X.   CERHOS    SCP028X.   CERREA1R  SCP103X.
      CERREA2R  SCP103X.   CERREA3R  SCP028X.   CERREA4R  SCP103X.
      CERREA5R  SCP028X.   CERREA6R  SCP103X.   CERREA7R  SCP103X.
      CERREA8R  SCP103X.   CHCHYR    SCP028X.   CHCHMOYR  SCP149X.
      CHCHNOY2  SCP150X.   CHCNOYR2  SCP137X.   CSRGYR    SCP028X.
      RSRGNOYP  SCP153X.   CMDLONGR  SCP120X.

      /* CMB FORMAT ASSOCIATIONS */

      RSCL2_C2  SCP155X.   RSCL2_E2  SCP155X.   RSCL3_E3  SCP155X.
      RSCL5_P5  SCP155X.   RSCL5_H5  SCP155X.   RSCL6     SCP160X.

      /* CFI FORMAT ASSOCIATIONS */

      CSHFLU12  SCP028X.   CSHFLUNM  SCP162X.   CSHFLUM1  SCP163X.
      CSHFLUY1  SCP164X.   CSHSPFL1  SCP165X.   CSHFLUM2  SCP163X.
      CSHFLUY2  SCP164X.   CSHSPFL2  SCP165X.

      /* CCH FORMAT ASSOCIATIONS */

      CNAT_USM  SCP028X.   CCHE_USM  SCP028X.   CTRD_USM  SCP028X.
      CTR_US11  SCP040X.   CTR_US12  SCP040X.   CTR_US13  SCP040X.
      CTR_US14  SCP040X.   CTR_US15  SCP040X.   CTR_US16  SCP040X.
      CHOM_USM  SCP028X.   CMBOU_MN  SCP028X.   CMBOU_MD  SCP028X.
      CMBOU_SP  SCP028X.   CMBOU_IM  SCP028X.   CMBOU_PR  SCP028X.
      CYTQU_YG  SCP028X.   CYTQ_BTY  SCP028X.   CYTQ_MDY  SCP028X.
      CYTQU_TA  SCP028X.   CYTQ_BTT  SCP028X.   CYTQ_MDT  SCP028X.
      CYTQU_QG  SCP028X.   CYTQ_BTQ  SCP028X.   CYTQ_MDQ  SCP028X.;
RUN;

PROC CONTENTS DATA=NHIS.SAMCHILD;
   TITLE1 'CONTENTS OF THE 2017 NHIS Sample Child FILE';

PROC FREQ DATA=NHIS.SAMCHILD NOTITLE;
   TABLES RECTYPE/LIST MISSING;
   TITLE1 'FREQUENCY REPORT FOR 2017 NHIS Sample Child FILE';
   TITLE2 '(WEIGHTED)';
   WEIGHT WTFA_SC;

PROC FREQ DATA=NHIS.SAMCHILD NOTITLE;
   TABLES RECTYPE/LIST MISSING;
   TITLE1 'FREQUENCY REPORT FOR 2017 NHIS Sample Child FILE';
   TITLE2 '(UNWEIGHTED)';

* USER NOTE: TO SEE UNFORMATTED VALUES IN PROCEDURES, ADD THE
             STATEMENT: FORMAT _ALL_;
RUN;
