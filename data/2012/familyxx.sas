*********************************************************************
 MAY 16, 2013 10:21 AM
 
 This is an example of a SAS program that creates a SAS
 file from the 2012 NHIS Public Use FAMILYXX.DAT ASCII file
 
 This is stored in FAMILYXX.SAS
*********************************************************************;

* USER NOTE: PLACE NEXT STATEMENT IN SUBSEQUENT PROGRAMS;
LIBNAME  NHIS     "C:\NHIS2012";

* USER NOTE: PLACE NEXT STATEMENT IN SUBSEQUENT PROGRAMS
             IF YOU ALLOW PROGRAM TO PERMANENTLY STORE FORMATS;
LIBNAME  LIBRARY  "C:\NHIS2012";

FILENAME ASCIIDAT 'C:\NHIS2012\FAMILYXX.dat';

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
   VALUE FAP001X
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
   VALUE FAP002X
      .                   = '.'
      OTHER              = "Survey Year"
   ;
   VALUE FAP006X
      .                   = '.'
      OTHER              = "Completion Year"
      9998               = "9998 Not ascertained"
   ;
   VALUE FAP007X
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
      98                 = "98 Not ascertained"
   ;
   VALUE FAP008X
      1                  = "1 Gave telephone number"
      2                  = "2 No telephone"
      7                  = "7 Refused"
      8                  = "8 Not ascertained"
      9                  = "9 Don't know"
   ;
   VALUE FAP009X
      1                  = "1 Yes"
      2                  = "2 No"
      7                  = "7 Refused"
      8                  = "8 Not ascertained"
      9                  = "9 Don't know"
   ;
   VALUE FAP011X
      000                = "000 Less than 1 week"
      997                = "997 Refused"
      998                = "998 Not ascertained"
      999                = "999 Don't know"
   ;
   VALUE FAP013X
      97                 = "97 Refused"
      98                 = "98 Not ascertained"
      99                 = "99 Don't know"
   ;
   VALUE FAP015X
      1                  = "1 All or almost all calls received on cell phones"
      2                  = 
"2 Some received on cell phones and some on regular phones"
      3                  = "3 Very few or none on cell phones"
      7                  = "7 Refused"
      8                  = "8 Not ascertained"
      9                  = "9 Don't know"
   ;
   VALUE FAP016X
      1                  = "1 English"
      2                  = "2 Spanish"
      3                  = "3 English and Spanish"
      4                  = "4 Other"
      8                  = "8 Not ascertained"
   ;
   VALUE FAP020X
      1                  = "1 One adult, no child(ren) under 18"
      2                  = "2 Multiple adults, no child(ren) under 18"
      3                  = "3 One adult, 1+ child(ren) under 18"
      4                  = "4 Multiple adults, 1+ child(ren) under 18"
      9                  = "9 Unknown"
   ;
   VALUE FAP021X
      11                 = "11 Living alone"
      12                 = "12 Living with roommate(s)"
      21                 = "21 Married couple"
      22                 = "22 Unmarried couple"
      23                 = "23 All other adult-only families"
      31                 = 
"31 Mother and biological or non-biological child(ren) only"
      32                 = 
"32 Father and biological or non-biological child(ren) only"
      33                 = "33 All other single-adult and child(ren) families"
      41                 = 
"41 Married or unmarried parents with biological/adoptive child(ren) only"
      42                 = 
"42 Parent (biological or adoptive), step parent, and child(ren) only"
      43                 = 
"43 Parent (biological or adoptive), cohabiting partner, and child(ren) only"
      44                 = 
"44 At least 1 (biological or adoptive) parent and 1+ child(ren), and other rela
ted adults"
      45                 = 
"45 Other related and/or unrelated adults, 1+ child(ren), no biological or adopt
ive parent(s)"
      99                 = "99 Unknown"
   ;
   VALUE FAP022X
      11                 = "11 Living alone"
      12                 = "12 Living with roommate(s)"
      21                 = "21 Married couple"
      22                 = "22 Unmarried couple"
      23                 = "23 All other adult-only families"
      31                 = 
"31 Mother and biological or non-biological child(ren) only"
      32                 = 
"32 Father and biological or non-biological child(ren) only"
      33                 = "33 All other single-adult and child(ren) families"
      41                 = 
"41 Married parents with biological/adoptive child(ren) only"
      42                 = "42 Cohabiting parent(s) with child(ren) only"
      43                 = 
"43 Parent (biological or adoptive), step parent, and child(ren) only"
      44                 = 
"44 At least 1 (biological or adoptive) parent and 1+ child(ren), and other rela
ted adults"
      45                 = 
"45 Other related and/or unrelated adults, 1+ child(ren), no biological or adopt
ive parent(s)"
      99                 = "99 Unknown"
   ;
   VALUE FAP023X
      01                 = "01 Less than/equal to 8th grade"
      02                 = "02 9-12th grade, no high school diploma"
      03                 = "03 GED recipient"
      04                 = "04 High school graduate"
      05                 = "05 Some college, no degree"
      06                 = "06 AA degree, technical or vocational"
      07                 = "07 AA degree, academic program"
      08                 = "08 Bachelor's degree (BA, BS, AB, BBA)"
      09                 = "09 Master's, professional, or doctoral degree"
      97                 = "97 Refused"
      98                 = "98 Not ascertained"
      99                 = "99 Don't know"
   ;
   VALUE FAP045X
      1                  = "1 Often true"
      2                  = "2 Sometimes true"
      3                  = "3 Never true"
      7                  = "7 Refused"
      8                  = "8 Not ascertained"
      9                  = "9 Don't know"
   ;
   VALUE FAP055X
      99                 = "99 Unknown"
   ;
   VALUE FAP056X
      1                  = "1 High food security (raw score 0)"
      2                  = "2 Marginal food security (raw score 1-2)"
      3                  = "3 Low food security (raw score 3-5)"
      4                  = "4 Very low food security (raw score 6-10)"
      9                  = "9 Unknown"
   ;
   VALUE FAP057X
      1                  = 
"1 Food secure (high or marginal food security, raw score 0-2)"
      2                  = "2 Low food security (raw score 3-5)"
      3                  = "3 Very low food security (raw score 6-10)"
      9                  = "9 Unknown"
   ;
   VALUE FAP085X
      1                  = "1 Very confident"
      2                  = "2 Somewhat confident"
      3                  = "3 Not too confident"
      4                  = "4 Not confident at all"
      7                  = "7 Refused"
      8                  = "8 Not ascertained"
      9                  = "9 Don't know"
   ;
   VALUE FAP086X
      0                  = "0 Zero"
      1                  = "1 Less than $500"
      2                  = "2 $500-$1,999"
      3                  = "3 $2,000-$2,999"
      4                  = "4 $3,000-$4,999"
      5                  = "5 $5,000 or more"
      7                  = "7 Refused"
      8                  = "8 Not ascertained"
      9                  = "9 Don't know"
   ;
   VALUE FAP119X
      1                  = "1 Family income data collected differently"
   ;
   VALUE FAP120X
      01                 = "01 $0 - $34,999"
      02                 = "02 $35,000 - $49,999"
      03                 = "03 $50,000 - $74,999"
      04                 = "04 $75,000 - $99,999"
      05                 = "05 $100,000 and over"
      06                 = "06 $0 - $49,999 (no further detail)"
      07                 = "07 $50,000 and over (no further detail)"
      08                 = "08 $50,000 - $99,999 (no further detail)"
      99                 = "99 Unknown"
   ;
   VALUE FAP121X
      01                 = "01 $0 - $34,999"
      02                 = "02 $35,000 - $74,999"
      03                 = "03 $75,000 - $99,999"
      04                 = "04 $100,000 and over"
      96                 = "96 Undefined"
      99                 = "99 Unknown"
   ;
   VALUE FAP122X
      01                 = "01 Under 0.50"
      02                 = "02 0.50 - 0.74"
      03                 = "03 0.75 - 0.99"
      04                 = "04 1.00 - 1.24"
      05                 = "05 1.25 - 1.49"
      06                 = "06 1.50 - 1.74"
      07                 = "07 1.75 - 1.99"
      08                 = "08 2.00 - 2.49"
      09                 = "09 2.50 - 2.99"
      10                 = "10 3.00 - 3.49"
      11                 = "11 3.50 - 3.99"
      12                 = "12 4.00 - 4.49"
      13                 = "13 4.50 - 4.99"
      14                 = "14 5.00 and over"
      15                 = "15 Less than 1.00 (no further detail)"
      16                 = "16 1.00 - 1.99 (no further detail)"
      17                 = "17 2.00 and over (no further detail)"
      96                 = "96 Undefinable"
      99                 = "99 Unknown"
   ;
   VALUE FAP123X
      01                 = "01 Under 0.50"
      02                 = "02 0.50 - 0.74"
      03                 = "03 0.75 - 0.99"
      04                 = "04 1.00 - 1.24"
      05                 = "05 1.25 - 1.49"
      06                 = "06 1.50 - 1.74"
      07                 = "07 1.75 - 1.99"
      08                 = "08 2.00 - 2.49"
      09                 = "09 2.50 - 2.99"
      10                 = "10 3.00 - 3.49"
      11                 = "11 3.50 - 3.99"
      12                 = "12 4.00 - 4.49"
      13                 = "13 4.50 - 4.99"
      14                 = "14 5.00 and over"
      15                 = "15 Less than 1.00 (no further detail)"
      16                 = "16 1.00 - 1.99 (no further detail)"
      17                 = "17 2.00 - 3.99 (no further detail)"
      18                 = "18 4.00 and over (no further detail)"
      96                 = "96 Undefinable"
      99                 = "99 Unknown"
   ;
   VALUE FAP124X
      1                  = "1 Owned or being bought"
      2                  = "2 Rented"
      3                  = "3 Other arrangement"
      7                  = "7 Refused"
      8                  = "8 Not ascertained"
      9                  = "9 Don't know"
   ;

DATA NHIS.FAMILYXX;
   * CREATE A SAS DATA SET;
   INFILE ASCIIDAT PAD LRECL=219;

   * DEFINE LENGTH OF ALL VARIABLES;

   LENGTH

      /* IDN LENGTHS */

      RECTYPE    3   SRVY_YR    4   HHX      $ 6   FMX      $ 2
      WTFA_FAM   8

      /* FRT LENGTHS */

      FINT_Y_P   4   FINT_M_P   3

      /* COV LENGTHS */

      TELN_FLG   3   CURWRKN    3   RNOSERVN   3   RHLNGDY    4
      TELCELN    3   WRKCELN    3   CELLOUT    3   PHONEUSE   3

      /* BCK LENGTHS */

      FLNGINTV   3

      /* MFM LENGTHS */

      FM_SIZE    3   FM_KIDS    3   FM_ELDR    3   FM_TYPE    3
      FM_STRCP   3   FM_STRP    3   FM_EDUC1   3

      /* FHS LENGTHS */

      FCHLMYN    3   FCHLMCT    3   FSPEDYN    3   FSPEDCT    3
      FLAADLYN   3   FLAADLCT   3   FLIADLYN   3   FLIADLCT   3
      FWKLIMYN   3   FWKLIMCT   3   FWALKYN    3   FWALKCT    3
      FREMEMYN   3   FREMEMCT   3   FANYLYN    3   FANYLCT    3
      FHSTATEX   3   FHSTATVG   3   FHSTATG    3   FHSTATFR   3
      FHSTATPR   3

      /* FFS LENGTHS */

      FSRUNOUT   3   FSLAST     3   FSBALANC   3   FSSKIP     3
      FSSKDAYS   3   FSLESS     3   FSHUNGRY   3   FSWEIGHT   3
      FSNOTEAT   3   FSNEDAYS   3   FSRAW      3   FSSTATD    3
      FSSTAT     3

      /* FAU LENGTHS */

      FDMEDYN    3   FDMEDCT    3   FNMEDYN    3   FNMEDCT    3
      FHOSP2YN   3   FHOSP2CT   3   FHCHMYN    3   FHCHMCT    3
      FHCPHRYN   3   FHCPHRCT   3   FHCDVYN    3   FHCDVCT    3
      F10DVYN    3   F10DVCT    3

      /* FHI LENGTHS */

      FHICOVYN   3   FHICOVCT   3   FHIPRVCT   3   FHISINCT   3
      FHICARCT   3   FHICADCT   3   FHICHPCT   3   FHIMILCT   3
      FHIIHSCT   3   FHIPUBCT   3   FHIOGVCT   3   FPRCOOH    3
      FHIEBCCT   3   COVCONF    3   FHICOST    3   FMEDBILL   3
      FMEDBPAY   3   FMEDBNOP   3   FSAF       3

      /* FSD LENGTHS */

      FHDSTCT    3   FDGLWCT1   3   FDGLWCT2   3   FWRKLWCT   3

      /* FIN LENGTHS */

      FSALYN     3   FSALCT     3   FSEINCYN   3   FSEINCCT   3
      FSSRRYN    3   FSSRRCT    3   FPENSYN    3   FPENSCT    3
      FOPENSYN   3   FOPENSCT   3   FSSIYN     3   FSSICT     3
      FTANFYN    3   FTANFCT    3   FOWBENYN   3   FOWBENCT   3
      FINTR1YN   3   FINTR1CT   3   FDIVDYN    3   FDIVDCT    3
      FCHSPYN    3   FCHSPCT    3   FINCOTYN   3   FINCOTCT   3
      FINCFLG    3   INCGRP2    3   INCGRP3    3   RAT_CAT2   3
      RAT_CAT3   3   HOUSEOWN   3   FGAH       3   FSSAPLYN   3
      FSSAPLCT   3   FSDAPLYN   3   FSDAPLCT   3   FSNAP      3
      FSNAPMYR   3   FWICYN     3   FWICCT     3 ;

   * INPUT ALL VARIABLES;

   INPUT

      /* IDN LOCATIONS */

      RECTYPE       1 -   2    SRVY_YR       3 -   6
      HHX      $    7 -  12    FMX      $   13 -  14
      WTFA_FAM     15 -  20

      /* FRT LOCATIONS */

      FINT_Y_P     21 -  24    FINT_M_P     25 -  26


      /* COV LOCATIONS */

      TELN_FLG     27 -  27    CURWRKN      28 -  28
      RNOSERVN     29 -  29    RHLNGDY      30 -  32
      TELCELN      33 -  33    WRKCELN      34 -  35
      CELLOUT      36 -  36    PHONEUSE     37 -  37


      /* BCK LOCATIONS */

      FLNGINTV     38 -  38

      /* MFM LOCATIONS */

      FM_SIZE      39 -  40    FM_KIDS      41 -  42
      FM_ELDR      43 -  44    FM_TYPE      45 -  45
      FM_STRCP     46 -  47    FM_STRP      48 -  49
      FM_EDUC1     50 -  51

      /* FHS LOCATIONS */

      FCHLMYN      52 -  52    FCHLMCT      53 -  54
      FSPEDYN      55 -  55    FSPEDCT      56 -  57
      FLAADLYN     58 -  58    FLAADLCT     59 -  60
      FLIADLYN     61 -  61    FLIADLCT     62 -  63
      FWKLIMYN     64 -  64    FWKLIMCT     65 -  66
      FWALKYN      67 -  67    FWALKCT      68 -  69
      FREMEMYN     70 -  70    FREMEMCT     71 -  72
      FANYLYN      73 -  73    FANYLCT      74 -  75
      FHSTATEX     76 -  77    FHSTATVG     78 -  79
      FHSTATG      80 -  81    FHSTATFR     82 -  83
      FHSTATPR     84 -  85

      /* FFS LOCATIONS */

      FSRUNOUT     86 -  86    FSLAST       87 -  87
      FSBALANC     88 -  88    FSSKIP       89 -  89
      FSSKDAYS     90 -  91    FSLESS       92 -  92
      FSHUNGRY     93 -  93    FSWEIGHT     94 -  94
      FSNOTEAT     95 -  95    FSNEDAYS     96 -  97
      FSRAW        98 -  99    FSSTATD     100 - 100
      FSSTAT      101 - 101

      /* FAU LOCATIONS */

      FDMEDYN     102 - 102    FDMEDCT     103 - 104
      FNMEDYN     105 - 105    FNMEDCT     106 - 107
      FHOSP2YN    108 - 108    FHOSP2CT    109 - 110
      FHCHMYN     111 - 111    FHCHMCT     112 - 113
      FHCPHRYN    114 - 114    FHCPHRCT    115 - 116
      FHCDVYN     117 - 117    FHCDVCT     118 - 119
      F10DVYN     120 - 120    F10DVCT     121 - 122

      /* FHI LOCATIONS */

      FHICOVYN    123 - 123    FHICOVCT    124 - 125
      FHIPRVCT    126 - 127    FHISINCT    128 - 129
      FHICARCT    130 - 131    FHICADCT    132 - 133
      FHICHPCT    134 - 135    FHIMILCT    136 - 137
      FHIIHSCT    138 - 139    FHIPUBCT    140 - 141
      FHIOGVCT    142 - 143    FPRCOOH     144 - 144
      FHIEBCCT    145 - 146    COVCONF     147 - 147
      FHICOST     148 - 148    FMEDBILL    149 - 149
      FMEDBPAY    150 - 150    FMEDBNOP    151 - 151
      FSAF        152 - 152

      /* FSD LOCATIONS */

      FHDSTCT     153 - 154    FDGLWCT1    155 - 156
      FDGLWCT2    157 - 158    FWRKLWCT    159 - 160

      /* FIN LOCATIONS */

      FSALYN      161 - 161    FSALCT      162 - 163
      FSEINCYN    164 - 164    FSEINCCT    165 - 166
      FSSRRYN     167 - 167    FSSRRCT     168 - 169
      FPENSYN     170 - 170    FPENSCT     171 - 172
      FOPENSYN    173 - 173    FOPENSCT    174 - 175
      FSSIYN      176 - 176    FSSICT      177 - 178
      FTANFYN     179 - 179    FTANFCT     180 - 181
      FOWBENYN    182 - 182    FOWBENCT    183 - 184
      FINTR1YN    185 - 185    FINTR1CT    186 - 187
      FDIVDYN     188 - 188    FDIVDCT     189 - 190
      FCHSPYN     191 - 191    FCHSPCT     192 - 193
      FINCOTYN    194 - 194    FINCOTCT    195 - 196
      FINCFLG     197 - 197    INCGRP2     198 - 199
      INCGRP3     200 - 201    RAT_CAT2    202 - 203
      RAT_CAT3    204 - 205    HOUSEOWN    206 - 206
      FGAH        207 - 207    FSSAPLYN    208 - 208
      FSSAPLCT    209 - 210    FSDAPLYN    211 - 211
      FSDAPLCT    212 - 213    FSNAP       214 - 214
      FSNAPMYR    215 - 216    FWICYN      217 - 217
      FWICCT      218 - 219;

   * DEFINE VARIABLE LABELS;

   LABEL

      /* IDN LABELS */

      RECTYPE    ="File type identifier"
      SRVY_YR    ="Year of National Health Interview Survey"
      HHX        ="Household Number"
      FMX        ="Family Number"
      WTFA_FAM   ="Weight - Final Annual"

      /* FRT LABELS */

      FINT_Y_P   ="Year Interview Completed - Year"
      FINT_M_P   ="Date of Interview - Month"

      /* COV LABELS */

      TELN_FLG   ="Supplied telephone number"
      CURWRKN    ="Working phone inside home"
      RNOSERVN   ="Without telephone service in the past 12 months"
      RHLNGDY    ="Number of days without telephone service"
      TELCELN    ="Working cell phone in family"
      WRKCELN    ="Number of working cell phones"
      CELLOUT    ="Working cell during land-line outage"
      PHONEUSE   ="Received calls cell/landline/both"

      /* BCK LABELS */

      FLNGINTV   ="Language of Interview"

      /* MFM LABELS */

      FM_SIZE    ="Size of family"
      FM_KIDS    ="# family members under 18 years of age"
      FM_ELDR    ="# family members aged 65 and older"
      FM_TYPE    ="Family type"
      FM_STRCP   ="Family Structure"
      FM_STRP    ="Family Structure"
      FM_EDUC1   ="Education of adult with highest education in family"

      /* FHS LABELS */

      FCHLMYN    ="Any children under age 5 in family with play limitations?"
      FCHLMCT    ="# children under age 5 in family with play limitations"
      FSPEDYN    ="Any children in family receive Special Education/EIS?"
      FSPEDCT    ="# children in family receiving Special Education/EIS"
      FLAADLYN   ="Any family member need help with an ADL?"
      FLAADLCT   ="# family members needing help with an ADL"
      FLIADLYN   ="Any family member need help with an IADL?"
      FLIADLCT   ="# family members needing help with an IADL"
      FWKLIMYN   =
"Any family member have work limitations due to a health problem?"
      FWKLIMCT   =
"# family members with work limitations due to a health problem"
      FWALKYN    ="Any family member have difficulty walking without equipment?"
      FWALKCT    ="# family members having difficulty walking without equipment"
      FREMEMYN   ="Any family member limited by difficulty remembering?"
      FREMEMCT   ="# family members with difficulty remembering"
      FANYLYN    ="Is any family member limited in ANY WAY?"
      FANYLCT    ="# of family members with ANY limitation"
      FHSTATEX   ="# family members in excellent health"
      FHSTATVG   ="# family members in very good health"
      FHSTATG    ="# family members in good health"
      FHSTATFR   ="# family members in fair health"
      FHSTATPR   ="# family members in poor health"

      /* FFS LABELS */

      FSRUNOUT   ="Worried food would run out before got money to buy more"
      FSLAST     ="Food did not last before had money to get more"
      FSBALANC   ="Could not afford to eat balanced meals"
      FSSKIP     ="Cut size or skipped meals because not enough money"
      FSSKDAYS   ="Number of days cut size or skipped meals"
      FSLESS     ="Eat less than felt should because not enough money"
      FSHUNGRY   ="Hungry but did not eat because not enough money"
      FSWEIGHT   ="Lose weight because not enough money for food"
      FSNOTEAT   ="Not eat for a whole day because not enough money for food"
      FSNEDAYS   ="Number of days did not eat"
      FSRAW      ="Raw score on the 30-day food security scale"
      FSSTATD    =
"Detailed family-level food security status on the 30-day food security scale"
      FSSTAT     ="Family-level food security status on the 30-day food security
"

      /* FAU LABELS */

      FDMEDYN    ="Any family member delay seeking medical care, 12m?"
      FDMEDCT    ="# of family members for whom medical care was delayed, 12m"
      FNMEDYN    ="Any family member need and not get medical care, 12m?"
      FNMEDCT    =
"# of family members who needed and did not get medical care, 12m"
      FHOSP2YN   ="Any family member in hospital overnight, 12m?"
      FHOSP2CT   ="# of family members in hospital overnight, 12m"
      FHCHMYN    ="Any family member receive home care, 2wk?"
      FHCHMCT    ="# of family members who received home care, 2wk"
      FHCPHRYN   =
"Any family member get advice/test results over the phone, 2wk?"
      FHCPHRCT   =
"# of family members who got advice/test results over the phone, 2wk"
      FHCDVYN    ="Any family member have an office visit, etc., 2wk"
      FHCDVCT    ="# of family members who had an office visit, etc., 2wk"
      F10DVYN    ="Any family member receive care 10+ times, 12m?"
      F10DVCT    ="# of family members who received care 10+ times, 12m"

      /* FHI LABELS */

      FHICOVYN   ="Any family member have health insurance coverage?"
      FHICOVCT   ="Number of family members with health insurance coverage"
      FHIPRVCT   =
"Number of family members with private health insurance coverage"
      FHISINCT   ="Number of family members with single service plans"
      FHICARCT   ="Number of family members with Medicare"
      FHICADCT   ="Number of family members with Medicaid"
      FHICHPCT   ="Number of family members with SCHIP"
      FHIMILCT   =
"Number of family members with Military health insurance coverage"
      FHIIHSCT   ="Number of family members with Indian Health Service coverage"
      FHIPUBCT   =
"Number of family members with other state-sponsored health plan"
      FHIOGVCT   ="Number of family members with other government health plan"
      FPRCOOH    ="Any persons covered living outside of the household"
      FHIEBCCT   ="Number of family members with employer based coverage"
      COVCONF    ="Confidence in obtaining affordable coverage"
      FHICOST    ="Cost of family medical/dental care in the past 12 months"
      FMEDBILL   ="Problems paying or unable to pay any medical bills"
      FMEDBPAY   ="Medical bills being paid off over time"
      FMEDBNOP   ="Unable to pay medical bills"
      FSAF       ="Family has a Flexible Spending Account"

      /* FSD LABELS */

      FHDSTCT    ="# of children in family currently or ever in Head Start"
      FDGLWCT1   ="# family members working last week"
      FDGLWCT2   ="# family members looking for work last week"
      FWRKLWCT   ="# family members working full time last week"

      /* FIN LABELS */

      FSALYN     ="Any family member receive income from wages or salary?"
      FSALCT     ="# family members receiving income from wages or salary"
      FSEINCYN   ="Any family member receive income from self-employment?"
      FSEINCCT   ="# family members receiving income from self-employment"
      FSSRRYN    =
"Any family member receive Social Security or Railroad Retirement income?"
      FSSRRCT    =
"# family members receiving Social Security or Railroad Retirement income"
      FPENSYN    =
"Any family members receive disability pensions (See file layout)"
      FPENSCT    =
"# family members receiving disability pensions (See file layout)"
      FOPENSYN   =
"Any family member receive other survivor or retirement pensions?"
      FOPENSCT   =
"# family members receiving other survivor or retirement pension"
      FSSIYN     ="Any family member receive income from SSI?"
      FSSICT     ="# of family members receiving income from SSI"
      FTANFYN    =
"Any family member receive income from a state or county welfare program?"
      FTANFCT    =
"# of family members receiving income from a state or county welfare program"
      FOWBENYN   ="Any family member receive other kind of welfare assistance?"
      FOWBENCT   =
"# of family members receiving other kind of welfare assistance"
      FINTR1YN   =
"Any family member receive income from interest bearing accounts, funds, etc.?"
      FINTR1CT   =
"# of family members receiving income from interest bearing accounts, funds, etc
."
      FDIVDYN    ="Any family member receive dividends from stocks, etc.?"
      FDIVDCT    ="# of family members receiving dividends from stocks, etc."
      FCHSPYN    ="Any family member receive child support income?"
      FCHSPCT    ="# of family members for whom child support was received"
      FINCOTYN   ="Any family member receive income from any other source?"
      FINCOTCT   ="# of family members receiving income from any other source"
      FINCFLG    =
"Flag indicating difference in how family income data were collected"
      INCGRP2    ="Total combined family income (grouped)"
      INCGRP3    ="Total combined family income (grouped)"
      RAT_CAT2   ="Ratio of family income to the poverty threshold"
      RAT_CAT3   ="Ratio of family income to the poverty threshold"
      HOUSEOWN   ="Home tenure status"
      FGAH       ="Paying lower rent due to government program"
      FSSAPLYN   ="Any family member ever apply for SSI?"
      FSSAPLCT   ="# family members ever applying for SSI"
      FSDAPLYN   ="Any family member ever apply for SSDI?"
      FSDAPLCT   ="# family members ever applying for SSDI"
      FSNAP      =
"Any family member receive food stamp/SNAP benefits last calendar year?"
      FSNAPMYR   =
"Number of months family received food stamps/SNAP benefits, last calendar year"
      FWICYN     ="Any family member receiving WIC benefits?"
      FWICCT     ="# family members receiving WIC benefits"
   ;

   * ASSOCIATE VARIABLES WITH FORMAT VALUES;
   *    (PUT ASTERISK (*) BEFORE WORD "FORMAT"
        IN NEXT STATEMENT TO PREVENT FORMAT
        ASSOCIATIONS BEING STORED WITH DATA SET);
   FORMAT

      /* IDN FORMAT ASSOCIATIONS */

      RECTYPE   FAP001X.   SRVY_YR   FAP002X.   HHX       $GROUPC.
      WTFA_FAM  GROUPN.

      /* FRT FORMAT ASSOCIATIONS */

      FINT_Y_P  FAP006X.   FINT_M_P  FAP007X.

      /* COV FORMAT ASSOCIATIONS */

      TELN_FLG  FAP008X.   CURWRKN   FAP009X.   RNOSERVN  FAP009X.
      RHLNGDY   FAP011X.   TELCELN   FAP009X.   WRKCELN   FAP013X.
      CELLOUT   FAP009X.   PHONEUSE  FAP015X.

      /* BCK FORMAT ASSOCIATIONS */

      FLNGINTV  FAP016X.

      /* MFM FORMAT ASSOCIATIONS */

      FM_TYPE   FAP020X.   FM_STRCP  FAP021X.   FM_STRP   FAP022X.
      FM_EDUC1  FAP023X.

      /* FHS FORMAT ASSOCIATIONS */

      FCHLMYN   FAP009X.   FSPEDYN   FAP009X.   FLAADLYN  FAP009X.
      FLIADLYN  FAP009X.   FWKLIMYN  FAP009X.   FWALKYN   FAP009X.
      FREMEMYN  FAP009X.   FANYLYN   FAP009X.

      /* FFS FORMAT ASSOCIATIONS */

      FSRUNOUT  FAP045X.   FSLAST    FAP045X.   FSBALANC  FAP045X.
      FSSKIP    FAP009X.   FSSKDAYS  FAP013X.   FSLESS    FAP009X.
      FSHUNGRY  FAP009X.   FSWEIGHT  FAP009X.   FSNOTEAT  FAP009X.
      FSNEDAYS  FAP013X.   FSRAW     FAP055X.   FSSTATD   FAP056X.
      FSSTAT    FAP057X.

      /* FAU FORMAT ASSOCIATIONS */

      FDMEDYN   FAP009X.   FNMEDYN   FAP009X.   FHOSP2YN  FAP009X.
      FHCHMYN   FAP009X.   FHCPHRYN  FAP009X.   FHCDVYN   FAP009X.
      F10DVYN   FAP009X.

      /* FHI FORMAT ASSOCIATIONS */

      FHICOVYN  FAP009X.   FPRCOOH   FAP009X.   COVCONF   FAP085X.
      FHICOST   FAP086X.   FMEDBILL  FAP009X.   FMEDBPAY  FAP009X.
      FMEDBNOP  FAP009X.   FSAF      FAP009X.

      /* FSD FORMAT ASSOCIATIONS */



      /* FIN FORMAT ASSOCIATIONS */

      FSALYN    FAP009X.   FSEINCYN  FAP009X.   FSSRRYN   FAP009X.
      FPENSYN   FAP009X.   FOPENSYN  FAP009X.   FSSIYN    FAP009X.
      FTANFYN   FAP009X.   FOWBENYN  FAP009X.   FINTR1YN  FAP009X.
      FDIVDYN   FAP009X.   FCHSPYN   FAP009X.   FINCOTYN  FAP009X.
      FINCFLG   FAP119X.   INCGRP2   FAP120X.   INCGRP3   FAP121X.
      RAT_CAT2  FAP122X.   RAT_CAT3  FAP123X.   HOUSEOWN  FAP124X.
      FGAH      FAP009X.   FSSAPLYN  FAP009X.   FSDAPLYN  FAP009X.
      FSNAP     FAP009X.   FSNAPMYR  FAP013X.   FWICYN    FAP009X.;
RUN;

PROC CONTENTS DATA=NHIS.FAMILYXX;
   TITLE1 'CONTENTS OF THE 2012 NHIS Family FILE';

PROC FREQ DATA=NHIS.FAMILYXX NOTITLE;
   TABLES RECTYPE/LIST MISSING;
   TITLE1 'FREQUENCY REPORT FOR 2012 NHIS Family FILE';
   TITLE2 '(WEIGHTED)';
   WEIGHT WTFA_FAM;

PROC FREQ DATA=NHIS.FAMILYXX NOTITLE;
   TABLES RECTYPE/LIST MISSING;
   TITLE1 'FREQUENCY REPORT FOR 2012 NHIS Family FILE';
   TITLE2 '(UNWEIGHTED)';

* USER NOTE: TO SEE UNFORMATTED VALUES IN PROCEDURES, ADD THE
             STATEMENT: FORMAT _ALL_;
RUN;
