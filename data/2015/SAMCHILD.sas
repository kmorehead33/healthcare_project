*********************************************************************
 JUNE 10, 2016  2:45 PM
 
 This is an example of a SAS program that creates a SAS
 file from the 2015 NHIS Public Use SAMCHILD.DAT ASCII file
 
 This is stored in SAMCHILD.SAS
*********************************************************************;

* USER NOTE: PLACE NEXT STATEMENT IN SUBSEQUENT PROGRAMS;
LIBNAME  NHIS     "C:\NHIS2015";

* USER NOTE: PLACE NEXT STATEMENT IN SUBSEQUENT PROGRAMS
             IF YOU ALLOW PROGRAM TO PERMANENTLY STORE FORMATS;
LIBNAME  LIBRARY  "C:\NHIS2015";

FILENAME ASCIIDAT 'C:\NHIS2015\SAMCHILD.dat';

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
   VALUE SCP034X
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
      99                 = "99 Unknown"
   ;
   VALUE SCP080X
      0                  = "0 Not true"
      1                  = "1 Sometimes true"
      2                  = "2 Often true"
      7                  = "7 Refused"
      8                  = "8 Not ascertained"
      9                  = "9 Don't know"
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
   VALUE SCP090X
      1                  = "1 Yes"
      2                  = "2 No"
      7                  = "7 Refused"
      8                  = "8 Not ascertained"
      9                  = "9 Don’t know"
   ;
   VALUE SCP107X
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
   VALUE SCP124X
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
   VALUE SCP136X
      97                 = "97 Refused"
      98                 = "98 Not ascertained"
      99                 = "99 Don't know"
   ;
   VALUE SCP137X
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
      95                 = "95 95+ times"
      97                 = "97 Refused"
      98                 = "98 Not ascertained"
      99                 = "99 Don't know"
   ;
   VALUE SCP142X
      0                  = "0 Not true"
      1                  = "1 Somewhat true"
      2                  = "2 Certainly true"
      7                  = "7 Refused"
      8                  = "8 Not ascertained"
      9                  = "9 Don't know"
   ;
   VALUE SCP147X
      0                  = "0 No"
      1                  = "1 Yes, minor difficulties"
      2                  = "2 Yes, definite difficulties"
      3                  = "3 Yes, severe difficulties"
      7                  = "7 Refused"
      8                  = "8 Not ascertained"
      9                  = "9 Don't know"
   ;
   VALUE SCP149X
      1                  = "1 1 vaccination or dose"
      2                  = "2 2 or more vaccination doses"
      7                  = "7 Refused"
      8                  = "8 Not ascertained"
      9                  = "9 Don't know"
   ;
   VALUE SCP150X
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
   VALUE SCP151X
      .                   = '.'
      OTHER              = "Year"
      9997               = "9997 Refused"
      9998               = "9998 Not ascertained"
      9999               = "9999 Don't know"
   ;
   VALUE SCP152X
      1                  = "1 Flu shot"
      2                  = "2 Flu nasal spray (spray, mist or drop in nose)"
      7                  = "7 Refused"
      8                  = "8 Not ascertained"
      9                  = "9 Don't know"
   ;

DATA NHIS.SAMCHILD;
   * CREATE A SAS DATA SET;
   INFILE ASCIIDAT PAD LRECL=215;

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

      CSRESPNO $ 2   CSRELTVP   3   LATEINTC   3

      /* FDB LENGTHS */

      FDRN_FLG   3

      /* CHS LENGTHS */

      TOTOZ_P    4   BWTGRM_P   4   CHGHT_TC   3   CWGHT_TC   4
      BMI_SC     4   AMR1R      3   AODD1      3   ADD2       3
      AMR2R      3   AUTISM     3   AODD2      3   CCONDRR1   3
      CCONDRR2   3   CCONDRR3   3   CCONDRR4   3   CCONDRR5   3
      CCONDRR6   3   CCONDRR7   3   CCONDRR8   3   CCONDRR9   3
      CPOX       3   CPOX12MO   3   CASHMEV    3   CASSTILL   3
      CASHYR     3   CASERYR1   3   HAYF1      3   RALLG1     3
      DALLG1     3   SALLG1     3   DIARH1     3   ANEMIA1    3
      EARINF1    3   SEIZE1     3   HAYF2      3   RALLG2     3
      DALLG2     3   SALLG2     3   DIARH2     3   ANEMIA2    3
      FHEAD      3   EARINF2    3   SEIZE2     3   STUTTER    3
      CHSTATYR   3   SCHDAYR1   4   CCOLD2W    3   CINTIL2W   3
      CHEARST1   3   CVISION    3   CBLIND     3   IHSPEQ     3
      IHMOB      3   IHMOBYR    3   PROBRX     3   LEARND     3
      MHIBOY2    3   CMHAGM15   3   MHIGRL2    3   CMHAGF15   3

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
      CSRGYR     3   RSRGNOYR   3   CMDLONGR   3

      /* CMB LENGTHS */

      RSCL2_C2   3   RSCL2_E2   3   RSCL3_E3   3   RSCL5_P5   3
      RSCL5_H5   3   RSCL6      3

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

      CSRESPNO $   50 -  51    CSRELTVP     52 -  52
      LATEINTC     53 -  53

      /* FDB LOCATIONS */

      FDRN_FLG     54 -  54

      /* CHS LOCATIONS */

      TOTOZ_P      55 -  57    BWTGRM_P     58 -  61
      CHGHT_TC     62 -  63    CWGHT_TC     64 -  66
      BMI_SC       67 -  70    AMR1R        71 -  71
      AODD1        72 -  72    ADD2         73 -  73
      AMR2R        74 -  74    AUTISM       75 -  75
      AODD2        76 -  76    CCONDRR1     77 -  77
      CCONDRR2     78 -  78    CCONDRR3     79 -  79
      CCONDRR4     80 -  80    CCONDRR5     81 -  81
      CCONDRR6     82 -  82    CCONDRR7     83 -  83
      CCONDRR8     84 -  84    CCONDRR9     85 -  85
      CPOX         86 -  86    CPOX12MO     87 -  87
      CASHMEV      88 -  88    CASSTILL     89 -  89
      CASHYR       90 -  90    CASERYR1     91 -  91
      HAYF1        92 -  92    RALLG1       93 -  93
      DALLG1       94 -  94    SALLG1       95 -  95
      DIARH1       96 -  96    ANEMIA1      97 -  97
      EARINF1      98 -  98    SEIZE1       99 -  99
      HAYF2       100 - 100    RALLG2      101 - 101
      DALLG2      102 - 102    SALLG2      103 - 103
      DIARH2      104 - 104    ANEMIA2     105 - 105
      FHEAD       106 - 106    EARINF2     107 - 107
      SEIZE2      108 - 108    STUTTER     109 - 109
      CHSTATYR    110 - 110    SCHDAYR1    111 - 113
      CCOLD2W     114 - 114    CINTIL2W    115 - 115
      CHEARST1    116 - 116    CVISION     117 - 117
      CBLIND      118 - 118    IHSPEQ      119 - 119
      IHMOB       120 - 120    IHMOBYR     121 - 121
      PROBRX      122 - 122    LEARND      123 - 123
      MHIBOY2     124 - 125    CMHAGM15    126 - 126
      MHIGRL2     127 - 128    CMHAGF15    129 - 129


      /* CAU LOCATIONS */

      CUSUALPL    130 - 130    CPLKIND     131 - 131
      CHCPLROU    132 - 132    CHCPLKND    133 - 133
      CHCCHGYR    134 - 134    CHCCHGHI    135 - 135
      CPRVTRYR    136 - 136    CPRVTRFD    137 - 137
      CDRNANP     138 - 138    CDRNAI      139 - 139
      CHCDLYR1    140 - 140    CHCDLYR2    141 - 141
      CHCDLYR3    142 - 142    CHCDLYR4    143 - 143
      CHCDLYR5    144 - 144    CHCAFYR     145 - 145
      CHCAFYRN    146 - 146    CHCAFYRF    147 - 147
      CHCAFYR1    148 - 148    CHCAFYR2    149 - 149
      CHCAFYR3    150 - 150    CHCAFYR4    151 - 151
      CHCAFYR5    152 - 152    CHCAFYR6    153 - 153
      CDNLONGR    154 - 154    CHCSYR11    155 - 155
      CHCSYR12    156 - 156    CHCSYR13    157 - 157
      CHCSYR14    158 - 158    CHCSYR1     159 - 159
      CHCSYR2     160 - 160    CHCSYR3     161 - 161
      CHCSYR4     162 - 162    CHCSYR5     163 - 163
      CHCSYR6     164 - 164    CHCSYR7     165 - 165
      CHCSYR81    166 - 166    CHCSYR82    167 - 167
      CHCSYR10    168 - 168    CHCSYREM    169 - 169
      CHPXYR_C    170 - 170    CHERNOY2    171 - 172
      CERVISND    173 - 173    CERHOS      174 - 174
      CERREA1R    175 - 175    CERREA2R    176 - 176
      CERREA3R    177 - 177    CERREA4R    178 - 178
      CERREA5R    179 - 179    CERREA6R    180 - 180
      CERREA7R    181 - 181    CERREA8R    182 - 182
      CHCHYR      183 - 183    CHCHMOYR    184 - 185
      CHCHNOY2    186 - 187    CHCNOYR2    188 - 189
      CSRGYR      190 - 190    RSRGNOYR    191 - 192
      CMDLONGR    193 - 193

      /* CMB LOCATIONS */

      RSCL2_C2    194 - 194    RSCL2_E2    195 - 195
      RSCL3_E3    196 - 196    RSCL5_P5    197 - 197
      RSCL5_H5    198 - 198    RSCL6       199 - 199


      /* CFI LOCATIONS */

      CSHFLU12    200 - 200    CSHFLUNM    201 - 201
      CSHFLUM1    202 - 203    CSHFLUY1    204 - 207
      CSHSPFL1    208 - 208    CSHFLUM2    209 - 210
      CSHFLUY2    211 - 214    CSHSPFL2    215 - 215
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
      ADD2       ="Ever told SC had ADHD/ADD"
      AMR2R      =
"Ever told SC had an intellectual disability also known as mental retardation"
      AUTISM     =
"Ever told SC had autism, Asperger's, pervasive devel or autism spectrum disorde
r"
      AODD2      ="Ever told SC had other developmental delay"
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
      RSRGNOYR   ="# of outpatient surgeries, past 12 m"
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
      AODD1     SCP028X.   ADD2      SCP028X.   AMR2R     SCP028X.
      AUTISM    SCP028X.   AODD2     SCP028X.   CCONDRR1  SCP034X.
      CCONDRR2  SCP034X.   CCONDRR3  SCP034X.   CCONDRR4  SCP034X.
      CCONDRR5  SCP034X.   CCONDRR6  SCP034X.   CCONDRR7  SCP034X.
      CCONDRR8  SCP034X.   CCONDRR9  SCP034X.   CPOX      SCP043X.
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
      PROBRX    SCP028X.   LEARND    SCP028X.   MHIBOY2   SCP079X.
      CMHAGM15  SCP080X.   MHIGRL2   SCP079X.   CMHAGF15  SCP080X.

      /* CAU FORMAT ASSOCIATIONS */

      CUSUALPL  SCP083X.   CPLKIND   SCP084X.   CHCPLROU  SCP028X.
      CHCPLKND  SCP086X.   CHCCHGYR  SCP028X.   CHCCHGHI  SCP028X.
      CPRVTRYR  SCP028X.   CPRVTRFD  SCP090X.   CDRNANP   SCP028X.
      CDRNAI    SCP028X.   CHCDLYR1  SCP028X.   CHCDLYR2  SCP028X.
      CHCDLYR3  SCP028X.   CHCDLYR4  SCP028X.   CHCDLYR5  SCP028X.
      CHCAFYR   SCP028X.   CHCAFYRN  SCP028X.   CHCAFYRF  SCP028X.
      CHCAFYR1  SCP028X.   CHCAFYR2  SCP028X.   CHCAFYR3  SCP028X.
      CHCAFYR4  SCP028X.   CHCAFYR5  SCP028X.   CHCAFYR6  SCP028X.
      CDNLONGR  SCP107X.   CHCSYR11  SCP028X.   CHCSYR12  SCP028X.
      CHCSYR13  SCP028X.   CHCSYR14  SCP028X.   CHCSYR1   SCP028X.
      CHCSYR2   SCP028X.   CHCSYR3   SCP028X.   CHCSYR4   SCP028X.
      CHCSYR5   SCP028X.   CHCSYR6   SCP028X.   CHCSYR7   SCP028X.
      CHCSYR81  SCP028X.   CHCSYR82  SCP028X.   CHCSYR10  SCP028X.
      CHCSYREM  SCP028X.   CHPXYR_C  SCP028X.   CHERNOY2  SCP124X.
      CERVISND  SCP028X.   CERHOS    SCP028X.   CERREA1R  SCP090X.
      CERREA2R  SCP090X.   CERREA3R  SCP028X.   CERREA4R  SCP090X.
      CERREA5R  SCP028X.   CERREA6R  SCP090X.   CERREA7R  SCP090X.
      CERREA8R  SCP090X.   CHCHYR    SCP028X.   CHCHMOYR  SCP136X.
      CHCHNOY2  SCP137X.   CHCNOYR2  SCP124X.   CSRGYR    SCP028X.
      RSRGNOYR  SCP140X.   CMDLONGR  SCP107X.

      /* CMB FORMAT ASSOCIATIONS */

      RSCL2_C2  SCP142X.   RSCL2_E2  SCP142X.   RSCL3_E3  SCP142X.
      RSCL5_P5  SCP142X.   RSCL5_H5  SCP142X.   RSCL6     SCP147X.

      /* CFI FORMAT ASSOCIATIONS */

      CSHFLU12  SCP028X.   CSHFLUNM  SCP149X.   CSHFLUM1  SCP150X.
      CSHFLUY1  SCP151X.   CSHSPFL1  SCP152X.   CSHFLUM2  SCP150X.
      CSHFLUY2  SCP151X.   CSHSPFL2  SCP152X.;
RUN;

PROC CONTENTS DATA=NHIS.SAMCHILD;
   TITLE1 'CONTENTS OF THE 2015 NHIS Sample Child FILE';

PROC FREQ DATA=NHIS.SAMCHILD NOTITLE;
   TABLES RECTYPE/LIST MISSING;
   TITLE1 'FREQUENCY REPORT FOR 2015 NHIS Sample Child FILE';
   TITLE2 '(WEIGHTED)';
   WEIGHT WTFA_SC;

PROC FREQ DATA=NHIS.SAMCHILD NOTITLE;
   TABLES RECTYPE/LIST MISSING;
   TITLE1 'FREQUENCY REPORT FOR 2015 NHIS Sample Child FILE';
   TITLE2 '(UNWEIGHTED)';

* USER NOTE: TO SEE UNFORMATTED VALUES IN PROCEDURES, ADD THE
             STATEMENT: FORMAT _ALL_;
RUN;
