*********************************************************************
 MAY 22, 2008  9:59 AM
 
 This is an example of a SAS program that creates a SAS
 file from the 2007 NHIS Public Use FAMILYXX.DAT ASCII file
 
 This is stored in FAMILYXX.SAS
*********************************************************************;

* USER NOTE: PLACE NEXT STATEMENT IN SUBSEQUENT PROGRAMS;
LIBNAME  NHIS     "C:\NHIS2007";

* USER NOTE: PLACE NEXT STATEMENT IN SUBSEQUENT PROGRAMS
             IF YOU ALLOW PROGRAM TO PERMANENTLY STORE FORMATS;
LIBNAME  LIBRARY  "C:\NHIS2007";

FILENAME ASCIIDAT 'C:\NHIS2007\FAMILYXX.dat';

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
   VALUE FAP001X
      10                 = "10 Household"
      20                 = "20 Person"
      30                 = "30 Sample Adult"
      31                 = "31 Sample Adult Cancer"
      34                 = "34 Adult Alternative Medicine"
      40                 = "40 Sample Child"
      44                 = "44 Child Alternative Medicine"
      60                 = "60 Family"
      70                 = "70 Injury/Poisoning Episode"
      75                 = "75 Injury/Poisoning Verbatim"
   ;
   VALUE FAP002X
      .                   = '.'
      OTHER              = "Survey Year"
   ;
   VALUE FAP006X
      97                 = "97 Refused"
      99                 = "99 Don't know"
   ;
   VALUE FAP007X
      .                   = '.'
      OTHER              = "Completion Year"
      9998               = "9998 Not ascertained"
   ;
   VALUE FAP008X
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
   VALUE FAP009X
      1                  = "1 Gave telephone number"
      2                  = "2 No telephone"
      7                  = "7 Refused"
      8                  = "8 Not ascertained"
      9                  = "9 Don't know"
   ;
   VALUE FAP010X
      1                  = "1 Yes"
      2                  = "2 No"
      7                  = "7 Refused"
      8                  = "8 Not ascertained"
      9                  = "9 Don't know"
   ;
   VALUE FAP012X
      000                = "000 Less than 1 week"
      997                = "997 Refused"
      998                = "998 Not ascertained"
      999                = "999 Don't know"
   ;
   VALUE FAP014X
      97                 = "97 Refused"
      98                 = "98 Not ascertained"
      99                 = "99 Don't know"
   ;
   VALUE FAP016X
      1                  = "1 All or almost all calls received on cell phones"
      2                  = 
"2 Some received on cell phones and some on regular phones"
      3                  = "3 Very few or none on cell phones"
      7                  = "7 Refused"
      8                  = "8 Not ascertained"
      9                  = "9 Don't know"
   ;
   VALUE FAP017X
      1                  = "1 English"
      2                  = "2 Spanish"
      3                  = "3 English and Spanish"
      4                  = "4 Other"
      8                  = "8 Not ascertained"
   ;
   VALUE FAP021X
      1                  = "1 One adult, no child(ren) under 18"
      2                  = "2 Multiple adults, no child(ren) under 18"
      3                  = "3 One adult, 1+ child(ren) under 18"
      4                  = "4 Multiple adults, 1+ child(ren) under 18"
      9                  = "9 Unknown"
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
   VALUE FAP023X
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
   VALUE FAP024X
      01                 = "01 Less/equal to 8th grade"
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
   VALUE FAP088X
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
   VALUE FAP089X
      01                 = "01 $0 - $34,999"
      02                 = "02 $35,000 - $74,999"
      03                 = "03 $75,000 - $99,999"
      04                 = "04 $100,000 and over"
      96                 = "96 Undefined"
      99                 = "99 Unknown"
   ;
   VALUE FAP090X
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
   VALUE FAP091X
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
   VALUE FAP092X
      1                  = "1 Owned or being bought"
      2                  = "2 Rented"
      3                  = "3 Other arrangement"
      7                  = "7 Refused"
      8                  = "8 Not ascertained"
      9                  = "9 Don't know"
   ;

DATA NHIS.FAMILYXX;
   * CREATE A SAS DATA SET;
   INFILE ASCIIDAT PAD LRECL=174;

   * DEFINE LENGTH OF ALL VARIABLES;

   LENGTH

      /* IDN LENGTHS */

      RECTYPE    3   SRVY_YR    4   HHX      $ 6   FMX      $ 2
      WTFA_FAM   8

      /* HHC LENGTHS */

      PCNT       3

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

      /* FAU LENGTHS */

      FDMEDYN    3   FDMEDCT    3   FNMEDYN    3   FNMEDCT    3
      FHOSP2YN   3   FHOSP2CT   3   FHCHMYN    3   FHCHMCT    3
      FHCPHRYN   3   FHCPHRCT   3   FHCDVYN    3   FHCDVCT    3
      F10DVYN    3   F10DVCT    3

      /* FSD LENGTHS */

      FHDSTCT    3   FDGLWCT1   3   FDGLWCT2   3   FWRKLWCT   3

      /* FIN LENGTHS */

      FSALYN     3   FSALCT     3   FSEINCYN   3   FSEINCCT   3
      FSSRRYN    3   FSSRRCT    3   FPENSYN    3   FPENSCT    3
      FOPENSYN   3   FOPENSCT   3   FSSIYN     3   FSSICT     3
      FTANFYN    3   FTANFCT    3   FOWBENYN   3   FOWBENCT   3
      FINTR1YN   3   FINTR1CT   3   FDIVDYN    3   FDIVDCT    3
      FCHSPYN    3   FCHSPCT    3   FINCOTYN   3   FINCOTCT   3
      INCGRP2    3   INCGRP3    3   RAT_CAT2   3   RAT_CAT3   3
      HOUSEOWN   3   FGAH       3   FSSAPLYN   3   FSSAPLCT   3
      FSDAPLYN   3   FSDAPLCT   3   FFDSTYN    3   FFDSTCT    3
      FWICYN     3   FWICCT     3 ;

   * INPUT ALL VARIABLES;

   INPUT

      /* IDN LOCATIONS */

      RECTYPE       1 -   2    SRVY_YR       3 -   6
      HHX      $    7 -  12    FMX      $   13 -  14
      WTFA_FAM     15 -  20

      /* HHC LOCATIONS */

      PCNT         21 -  22

      /* FRT LOCATIONS */

      FINT_Y_P     23 -  26    FINT_M_P     27 -  28


      /* COV LOCATIONS */

      TELN_FLG     29 -  29    CURWRKN      30 -  30
      RNOSERVN     31 -  31    RHLNGDY      32 -  34
      TELCELN      35 -  35    WRKCELN      36 -  37
      CELLOUT      38 -  38    PHONEUSE     39 -  39


      /* BCK LOCATIONS */

      FLNGINTV     40 -  40

      /* MFM LOCATIONS */

      FM_SIZE      41 -  42    FM_KIDS      43 -  44
      FM_ELDR      45 -  46    FM_TYPE      47 -  47
      FM_STRCP     48 -  49    FM_STRP      50 -  51
      FM_EDUC1     52 -  53

      /* FHS LOCATIONS */

      FCHLMYN      54 -  54    FCHLMCT      55 -  56
      FSPEDYN      57 -  57    FSPEDCT      58 -  59
      FLAADLYN     60 -  60    FLAADLCT     61 -  62
      FLIADLYN     63 -  63    FLIADLCT     64 -  65
      FWKLIMYN     66 -  66    FWKLIMCT     67 -  68
      FWALKYN      69 -  69    FWALKCT      70 -  71
      FREMEMYN     72 -  72    FREMEMCT     73 -  74
      FANYLYN      75 -  75    FANYLCT      76 -  77
      FHSTATEX     78 -  79    FHSTATVG     80 -  81
      FHSTATG      82 -  83    FHSTATFR     84 -  85
      FHSTATPR     86 -  87

      /* FAU LOCATIONS */

      FDMEDYN      88 -  88    FDMEDCT      89 -  90
      FNMEDYN      91 -  91    FNMEDCT      92 -  93
      FHOSP2YN     94 -  94    FHOSP2CT     95 -  96
      FHCHMYN      97 -  97    FHCHMCT      98 -  99
      FHCPHRYN    100 - 100    FHCPHRCT    101 - 102
      FHCDVYN     103 - 103    FHCDVCT     104 - 105
      F10DVYN     106 - 106    F10DVCT     107 - 108

      /* FSD LOCATIONS */

      FHDSTCT     109 - 110    FDGLWCT1    111 - 112
      FDGLWCT2    113 - 114    FWRKLWCT    115 - 116

      /* FIN LOCATIONS */

      FSALYN      117 - 117    FSALCT      118 - 119
      FSEINCYN    120 - 120    FSEINCCT    121 - 122
      FSSRRYN     123 - 123    FSSRRCT     124 - 125
      FPENSYN     126 - 126    FPENSCT     127 - 128
      FOPENSYN    129 - 129    FOPENSCT    130 - 131
      FSSIYN      132 - 132    FSSICT      133 - 134
      FTANFYN     135 - 135    FTANFCT     136 - 137
      FOWBENYN    138 - 138    FOWBENCT    139 - 140
      FINTR1YN    141 - 141    FINTR1CT    142 - 143
      FDIVDYN     144 - 144    FDIVDCT     145 - 146
      FCHSPYN     147 - 147    FCHSPCT     148 - 149
      FINCOTYN    150 - 150    FINCOTCT    151 - 152
      INCGRP2     153 - 154    INCGRP3     155 - 156
      RAT_CAT2    157 - 158    RAT_CAT3    159 - 160
      HOUSEOWN    161 - 161    FGAH        162 - 162
      FSSAPLYN    163 - 163    FSSAPLCT    164 - 165
      FSDAPLYN    166 - 166    FSDAPLCT    167 - 168
      FFDSTYN     169 - 169    FFDSTCT     170 - 171
      FWICYN      172 - 172    FWICCT      173 - 174;

   * DEFINE VARIABLE LABELS;

   LABEL

      /* IDN LABELS */

      RECTYPE    ="File type identifier"
      SRVY_YR    ="Year of National Health Interview Survey"
      HHX        ="HH identifier"
      FMX        ="Family #"
      WTFA_FAM   ="Weight - Final Annual"

      /* HHC LABELS */

      PCNT       ="Count of undeleted persons in the family"

      /* FRT LABELS */

      FINT_Y_P   ="Year Interview Completed - Year"
      FINT_M_P   ="Date of Interview - Month"

      /* COV LABELS */

      TELN_FLG   ="Supplied telephone number"
      CURWRKN    ="Working phone inside home"
      RNOSERVN   ="Without telephone service in the past 12 months"
      RHLNGDY    ="How long without service"
      TELCELN    ="Working cell phone in family"
      WRKCELN    ="Number of working cell phones"
      CELLOUT    ="Working cell during land-line outtage"
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

      FCHLMYN    ="Any kids under age 5 in family w/play limitations?"
      FCHLMCT    ="# kids under age 5 in family w/play limitations?"
      FSPEDYN    ="Any children in family receive Special Education/EIS?"
      FSPEDCT    ="# children in family receive Special Education/EIS?"
      FLAADLYN   ="Does any family member need help w/ADL?"
      FLAADLCT   ="# family members needing help w/ADL"
      FLIADLYN   ="Any family member need help w/chores, etc.?"
      FLIADLCT   ="# family members need help w/chores, etc."
      FWKLIMYN   ="Anyone with work limitations due to health problem?"
      FWKLIMCT   ="# fam members w/ work lim (hlth)"
      FWALKYN    ="Any members have difficulty walking w/o equipment?"
      FWALKCT    ="# fam members having difficulty walking w/o equipment"
      FREMEMYN   ="Any member limited by difficulty remembering?"
      FREMEMCT   ="# fam members w/dificulty remembering"
      FANYLYN    ="Is any family member limited in ANY WAY?"
      FANYLCT    ="Number of family members w/ ANY limitation"
      FHSTATEX   ="# fam members in excellent health"
      FHSTATVG   ="# family members in very good health"
      FHSTATG    ="# family members in good health"
      FHSTATFR   ="# family members in fair health"
      FHSTATPR   ="# family members in poor health"

      /* FAU LABELS */

      FDMEDYN    ="Any family member delay medical care, 12m?"
      FDMEDCT    ="# of family members for whom medical care was delayed 12m"
      FNMEDYN    ="Any family member need and not get medical care 12m?"
      FNMEDCT    =
"# of family members who needed and did not get medical care 12m"
      FHOSP2YN   ="Any family member in hospital overnight, 12m?"
      FHOSP2CT   ="# of family members in hospital overnight, 12m"
      FHCHMYN    ="Any family member receive home care, 2 wk?"
      FHCHMCT    ="# of family members who received home care, 2 wk"
      FHCPHRYN   =
"Any family member get advice/test results over the phone, 2wk?"
      FHCPHRCT   =
"# of family members who got advice/test results over the phone, 2 wk"
      FHCDVYN    ="Any family member have an office visit, etc. 2 wk"
      FHCDVCT    ="# of family members who had an office visit, etc. 2 wk"
      F10DVYN    ="Any family member receive care 10+ times, 12m?"
      F10DVCT    ="# of family members who received care 10+ times, 12m"

      /* FSD LABELS */

      FHDSTCT    ="# of children less than 17 in Head Start"
      FDGLWCT1   ="# family members working last week"
      FDGLWCT2   ="# family members looking for work last week"
      FWRKLWCT   ="# family members work full time last week"

      /* FIN LABELS */

      FSALYN     ="Any family member received income from wages/salary"
      FSALCT     ="# family members received income from wages/salary"
      FSEINCYN   ="Any family member received income from self-employment"
      FSEINCCT   ="# family members received income from self-employment"
      FSSRRYN    =
"Any family member received Social Security or Railroad Retirement"
      FSSRRCT    =
"# family members received Social Security or Railroad Retirement"
      FPENSYN    =
"Any family members receive disability pensions (See file layout)"
      FPENSCT    =
"# family members receive disability pensions (See file layout)"
      FOPENSYN   =
"Any family member received other survivor or retirement pensions"
      FOPENSCT   =
"# family members received other survivor or retirement pension"
      FSSIYN     ="Any family member receive income from SSI"
      FSSICT     ="# of family members receive income from SSI"
      FTANFYN    ="Any family member receive income from Welfare/TANF"
      FTANFCT    ="# of family members receive income from Welfare/TANF"
      FOWBENYN   ="Any family member receive income from other Welfare programs"
      FOWBENCT   =
"# of family members receive income from other Welfare programs"
      FINTR1YN   ="Anyone have money . . .that earned interest"
      FINTR1CT   ="# of family members w/ money earning interest"
      FDIVDYN    ="Any family member receive dividends from stocks, etc."
      FDIVDCT    ="# of  family members receive dividends from stocks, etc."
      FCHSPYN    ="Any fam member rec child support inc?"
      FCHSPCT    ="# of family members rec child support inc?"
      FINCOTYN   ="Any fam member rec inc from otr source?"
      FINCOTCT   ="# of family members rec inc from otr source?"
      INCGRP2    ="Total combined family income (grouped)"
      INCGRP3    ="Total combined family income (grouped) - bridge"
      RAT_CAT2   =
"Ratio of family income to the poverty threshold - 3 categories"
      RAT_CAT3   =
"Ratio of family income to the poverty threshold - 4 categories"
      HOUSEOWN   ="Home tenure status"
      FGAH       ="Paying lower rent due to gov't program"
      FSSAPLYN   ="Any fam member EVER applied for SSI?"
      FSSAPLCT   ="# fam members EVER applied for SSI"
      FSDAPLYN   ="Any fam member EVER applied for SSDI?"
      FSDAPLCT   ="# fam members EVER applied for SSDI"
      FFDSTYN    ="Any fam member auth to rec food stamps?"
      FFDSTCT    ="# fam members auth to rec food stamps"
      FWICYN     ="Any fam member rec WIC benefits?"
      FWICCT     ="# fam members rec WIC benefits"
   ;

   * ASSOCIATE VARIABLES WITH FORMAT VALUES;
   *    (PUT ASTERISK (*) BEFORE WORD "FORMAT"
        IN NEXT STATEMENT TO PREVENT FORMAT
        ASSOCIATIONS BEING STORED WITH DATA SET);
   FORMAT

      /* IDN FORMAT ASSOCIATIONS */

      RECTYPE   FAP001X.   SRVY_YR   FAP002X.   HHX       $GROUPC.
      WTFA_FAM  GROUPN.

      /* HHC FORMAT ASSOCIATIONS */

      PCNT      FAP006X.

      /* FRT FORMAT ASSOCIATIONS */

      FINT_Y_P  FAP007X.   FINT_M_P  FAP008X.

      /* COV FORMAT ASSOCIATIONS */

      TELN_FLG  FAP009X.   CURWRKN   FAP010X.   RNOSERVN  FAP010X.
      RHLNGDY   FAP012X.   TELCELN   FAP010X.   WRKCELN   FAP014X.
      CELLOUT   FAP010X.   PHONEUSE  FAP016X.

      /* BCK FORMAT ASSOCIATIONS */

      FLNGINTV  FAP017X.

      /* MFM FORMAT ASSOCIATIONS */

      FM_TYPE   FAP021X.   FM_STRCP  FAP022X.   FM_STRP   FAP023X.
      FM_EDUC1  FAP024X.

      /* FHS FORMAT ASSOCIATIONS */

      FCHLMYN   FAP010X.   FSPEDYN   FAP010X.   FLAADLYN  FAP010X.
      FLIADLYN  FAP010X.   FWKLIMYN  FAP010X.   FWALKYN   FAP010X.
      FREMEMYN  FAP010X.   FANYLYN   FAP010X.

      /* FAU FORMAT ASSOCIATIONS */

      FDMEDYN   FAP010X.   FNMEDYN   FAP010X.   FHOSP2YN  FAP010X.
      FHCHMYN   FAP010X.   FHCPHRYN  FAP010X.   FHCDVYN   FAP010X.
      F10DVYN   FAP010X.

      /* FSD FORMAT ASSOCIATIONS */



      /* FIN FORMAT ASSOCIATIONS */

      FSALYN    FAP010X.   FSEINCYN  FAP010X.   FSSRRYN   FAP010X.
      FPENSYN   FAP010X.   FOPENSYN  FAP010X.   FSSIYN    FAP010X.
      FTANFYN   FAP010X.   FOWBENYN  FAP010X.   FINTR1YN  FAP010X.
      FDIVDYN   FAP010X.   FCHSPYN   FAP010X.   FINCOTYN  FAP010X.
      INCGRP2   FAP088X.   INCGRP3   FAP089X.   RAT_CAT2  FAP090X.
      RAT_CAT3  FAP091X.   HOUSEOWN  FAP092X.   FGAH      FAP010X.
      FSSAPLYN  FAP010X.   FSDAPLYN  FAP010X.   FFDSTYN   FAP010X.
      FWICYN    FAP010X.;
RUN;

PROC CONTENTS DATA=NHIS.FAMILYXX;
   TITLE1 'CONTENTS OF THE 2007 NHIS Family FILE';

PROC FREQ DATA=NHIS.FAMILYXX NOTITLE;
   TABLES RECTYPE/LIST MISSING;
   TITLE1 'FREQUENCY REPORT FOR 2007 NHIS Family FILE';
   TITLE2 '(WEIGHTED)';
   WEIGHT WTFA_FAM;

PROC FREQ DATA=NHIS.FAMILYXX NOTITLE;
   TABLES RECTYPE/LIST MISSING;
   TITLE1 'FREQUENCY REPORT FOR 2007 NHIS Family FILE';
   TITLE2 '(UNWEIGHTED)';

* USER NOTE: TO SEE UNFORMATTED VALUES IN PROCEDURES, ADD THE
             STATEMENT: FORMAT _ALL_;
RUN;
