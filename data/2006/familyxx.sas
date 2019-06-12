*********************************************************************
 MAY 31, 2007  7:18 AM
 
 This is an example of a SAS program that creates a SAS
 file from the 2006 NHIS Public Use FAMILYXX.DAT ASCII file
 
 This is stored in FAMILYXX.SAS
*********************************************************************;

* USER NOTE: PLACE NEXT STATEMENT IN SUBSEQUENT PROGRAMS;
LIBNAME  NHIS     "C:\NHIS2006";

* USER NOTE: PLACE NEXT STATEMENT IN SUBSEQUENT PROGRAMS
             IF YOU ALLOW PROGRAM TO PERMANENTLY STORE FORMATS;
LIBNAME  LIBRARY  "C:\NHIS2006";

FILENAME ASCIIDAT 'C:\NHIS2006\FAMILYXX.dat';

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
      40                 = "40 Sample Child"
      60                 = "60 Family"
      70                 = "70 Injury/Poisoning Episode"
      75                 = "75 Injury/Poisoning Verbatim"
   ;
   VALUE FAP002X
      OTHER              = "Survey Year"
   ;
   VALUE FAP006X
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
      00                 = "00 One week or less"
      01                 = "01 More than one week, up to two weeks"
      02                 = "02 More than two weeks, up to three weeks"
      97                 = "97 Refused"
      98                 = "98 Not ascertained"
      99                 = "99 Don't know"
   ;
   VALUE FAP013X
      97                 = "97 Refused"
      98                 = "98 Not ascertained"
      99                 = "99 Don't know"
   ;
   VALUE FAP016X
      1                  = "1 Gave telephone number"
      7                  = "7 Refused"
      8                  = "8 Not ascertained"
      9                  = "9 Don't know"
   ;
   VALUE FAP019X
      997                = "997 Refused"
      998                = "998 Not ascertained"
      999                = "999 Don't know"
   ;
   VALUE FAP020X
      000                = "000 None"
      997                = "997 Refused"
      998                = "998 Not ascertained"
      999                = "999 Don't know"
   ;
   VALUE FAP021X
      1                  = "1 English"
      2                  = "2 Spanish"
      3                  = "3 English and Spanish"
      4                  = "4 Other"
      8                  = "8 Not ascertained"
   ;
   VALUE FAP025X
      1                  = "1 One adult, no child(ren) under 18"
      2                  = "2 Multiple adults, no child(ren) under 18"
      3                  = "3 One adult, 1+ child(ren) under 18"
      4                  = "4 Multiple adults, 1+ child(ren) under 18"
      9                  = "9 Unknown"
   ;
   VALUE FAP026X
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
   VALUE FAP027X
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
   VALUE FAP028X
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
   VALUE FAP092X
      01                 = "01 0-$4999"
      02                 = "02 $5000-$9999"
      03                 = "03 $10000-$14999"
      04                 = "04 $15000-$19999"
      05                 = "05 $20000-$24999"
      06                 = "06 $25000-$34999"
      07                 = "07 $35000-$44999"
      08                 = "08 $45000-$54999"
      09                 = "09 $55000-$64999"
      10                 = "10 $65000-$74999"
      11                 = "11 $75000 and over"
      12                 = "12 $20000 or more (no detail)"
      13                 = "13 Less than $20000 (no detail)"
      97                 = "97 Refused"
      98                 = "98 Not ascertained"
      99                 = "99 Don't know"
   ;
   VALUE FAP093X
      01                 = "01 Under .50"
      02                 = "02 .50 to .74"
      03                 = "03 .75 to .99"
      04                 = "04 1.00 to 1.24"
      05                 = "05 1.25 to 1.49"
      06                 = "06 1.50 to 1.74"
      07                 = "07 1.75 to 1.99"
      08                 = "08 2.00 to 2.49"
      09                 = "09 2.50 to 2.99"
      10                 = "10 3.00 to 3.49"
      11                 = "11 3.50 to 3.99"
      12                 = "12 4.00 to 4.49"
      13                 = "13 4.50 to 4.99"
      14                 = "14 5.00 and over"
      96                 = "96 Undefinable"
      99                 = "99 Unknown"
   ;
   VALUE FAP094X
      1                  = "1 Owned or being bought"
      2                  = "2 Rented"
      3                  = "3 Other arrangement"
      7                  = "7 Refused"
      8                  = "8 Not ascertained"
      9                  = "9 Don't know"
   ;

DATA NHIS.FAMILYXX;
   * CREATE A SAS DATA SET;
   INFILE ASCIIDAT PAD LRECL=176;

   * DEFINE LENGTH OF ALL VARIABLES;

   LENGTH

      /* IDN LENGTHS */

      RECTYPE    3   SRVY_YR    4   HHX      $ 6   FMX      $ 2
      WTFA_FAM   8

      /* FRT LENGTHS */

      FINT_Y_P   4   FINT_M_P   3

      /* COV LENGTHS */

      TELN_FLG   3   INSIDE     3   NOSERV     3   HOWLNGWK   3

      /* REC LENGTHS */

      TELCEL     3   WRKCEL     3   VCELNUM    3   CURWRK     3
      TELH_FLG   3   TELDIRC    3   RNOSERV    3   RH1LNGDY   4
      RH2LNGDY   4

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
      INCGRP     3   RAT_CAT    3   HOUSEOWN   3   FGAH       3
      FSSAPLYN   3   FSSAPLCT   3   FSDAPLYN   3   FSDAPLCT   3
      FFDSTYN    3   FFDSTCT    3   FWICYN     3   FWICCT     3 ;

   * INPUT ALL VARIABLES;

   INPUT

      /* IDN LOCATIONS */

      RECTYPE       1 -   2    SRVY_YR       3 -   6
      HHX      $    7 -  12    FMX      $   13 -  14
      WTFA_FAM     15 -  20

      /* FRT LOCATIONS */

      FINT_Y_P     21 -  24    FINT_M_P     25 -  26


      /* COV LOCATIONS */

      TELN_FLG     27 -  27    INSIDE       28 -  28
      NOSERV       29 -  29    HOWLNGWK     30 -  31


      /* REC LOCATIONS */

      TELCEL       32 -  32    WRKCEL       33 -  34
      VCELNUM      35 -  35    CURWRK       36 -  36
      TELH_FLG     37 -  37    TELDIRC      38 -  38
      RNOSERV      39 -  39    RH1LNGDY     40 -  42
      RH2LNGDY     43 -  45

      /* BCK LOCATIONS */

      FLNGINTV     46 -  46

      /* MFM LOCATIONS */

      FM_SIZE      47 -  48    FM_KIDS      49 -  50
      FM_ELDR      51 -  52    FM_TYPE      53 -  53
      FM_STRCP     54 -  55    FM_STRP      56 -  57
      FM_EDUC1     58 -  59

      /* FHS LOCATIONS */

      FCHLMYN      60 -  60    FCHLMCT      61 -  62
      FSPEDYN      63 -  63    FSPEDCT      64 -  65
      FLAADLYN     66 -  66    FLAADLCT     67 -  68
      FLIADLYN     69 -  69    FLIADLCT     70 -  71
      FWKLIMYN     72 -  72    FWKLIMCT     73 -  74
      FWALKYN      75 -  75    FWALKCT      76 -  77
      FREMEMYN     78 -  78    FREMEMCT     79 -  80
      FANYLYN      81 -  81    FANYLCT      82 -  83
      FHSTATEX     84 -  85    FHSTATVG     86 -  87
      FHSTATG      88 -  89    FHSTATFR     90 -  91
      FHSTATPR     92 -  93

      /* FAU LOCATIONS */

      FDMEDYN      94 -  94    FDMEDCT      95 -  96
      FNMEDYN      97 -  97    FNMEDCT      98 -  99
      FHOSP2YN    100 - 100    FHOSP2CT    101 - 102
      FHCHMYN     103 - 103    FHCHMCT     104 - 105
      FHCPHRYN    106 - 106    FHCPHRCT    107 - 108
      FHCDVYN     109 - 109    FHCDVCT     110 - 111
      F10DVYN     112 - 112    F10DVCT     113 - 114

      /* FSD LOCATIONS */

      FHDSTCT     115 - 116    FDGLWCT1    117 - 118
      FDGLWCT2    119 - 120    FWRKLWCT    121 - 122

      /* FIN LOCATIONS */

      FSALYN      123 - 123    FSALCT      124 - 125
      FSEINCYN    126 - 126    FSEINCCT    127 - 128
      FSSRRYN     129 - 129    FSSRRCT     130 - 131
      FPENSYN     132 - 132    FPENSCT     133 - 134
      FOPENSYN    135 - 135    FOPENSCT    136 - 137
      FSSIYN      138 - 138    FSSICT      139 - 140
      FTANFYN     141 - 141    FTANFCT     142 - 143
      FOWBENYN    144 - 144    FOWBENCT    145 - 146
      FINTR1YN    147 - 147    FINTR1CT    148 - 149
      FDIVDYN     150 - 150    FDIVDCT     151 - 152
      FCHSPYN     153 - 153    FCHSPCT     154 - 155
      FINCOTYN    156 - 156    FINCOTCT    157 - 158
      INCGRP      159 - 160    RAT_CAT     161 - 162
      HOUSEOWN    163 - 163    FGAH        164 - 164
      FSSAPLYN    165 - 165    FSSAPLCT    166 - 167
      FSDAPLYN    168 - 168    FSDAPLCT    169 - 170
      FFDSTYN     171 - 171    FFDSTCT     172 - 173
      FWICYN      174 - 174    FWICCT      175 - 176;

   * DEFINE VARIABLE LABELS;

   LABEL

      /* IDN LABELS */

      RECTYPE    ="File type identifier"
      SRVY_YR    ="Year of National Health Interview Survey"
      HHX        ="HH identifier"
      FMX        ="Family #"
      WTFA_FAM   ="Weight - Final Annual"

      /* FRT LABELS */

      FINT_Y_P   ="Year Interview Completed - Year"
      FINT_M_P   ="Date of Interview - Month"

      /* COV LABELS */

      TELN_FLG   ="Supplied telephone number"
      INSIDE     ="Working phone inside home"
      NOSERV     ="Without telephone service past 12 months"
      HOWLNGWK   ="Number of weeks w/o telephone service"

      /* REC LABELS */

      TELCEL     ="Have a working cell phone"
      WRKCEL     ="Number of working cell phones"
      VCELNUM    ="Is this your cell phone number"
      CURWRK     ="Working phone inside home"
      TELH_FLG   ="Telephone number"
      TELDIRC    ="Number mentioned/listed in directory"
      RNOSERV    ="Without telephone service past 12 months"
      RH1LNGDY   ="Number of days without phone service (noncellular)"
      RH2LNGDY   =
"Number of days without phone service (noncellular) due to weather/other natural
 disasters"

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

      FCHLMYN    ="Any kids under age 5 in fam w/play lim?"
      FCHLMCT    ="# kids under age 5 in fam w/play lim"
      FSPEDYN    ="Any children in fam rec Spec Ed/EIS?"
      FSPEDCT    ="# children in fam rec Spec Ed/EIS"
      FLAADLYN   ="Does any fam member need help w/ADL?"
      FLAADLCT   ="# fam members needing help w/ADL"
      FLIADLYN   ="Any fam member need help w/chores, etc.?"
      FLIADLCT   ="# fam members need help w/chores, etc."
      FWKLIMYN   ="Anyone with work lim due to hlth prob?"
      FWKLIMCT   ="# fam members w/ work lim (hlth)"
      FWALKYN    ="Any members have dif walking w/o equip?"
      FWALKCT    ="# fam members having dif walk w/o equip"
      FREMEMYN   ="Any member limited by dif remembering?"
      FREMEMCT   ="# fam members w/ dif remembering"
      FANYLYN    ="Is any fam member limited in ANY WAY?"
      FANYLCT    ="Number of fam members w/ ANY limitation"
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

      FHDSTCT    ="# of children le 17 in Head Start"
      FDGLWCT1   ="# fam members working last week"
      FDGLWCT2   ="# fam members looking for work last week"
      FWRKLWCT   ="# fam members work full time last week"

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
      INCGRP     ="Total combined family income (grouped)"
      RAT_CAT    ="Ratio of fam inc to poverty threshold"
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

      /* FRT FORMAT ASSOCIATIONS */

      FINT_Y_P  FAP006X.   FINT_M_P  FAP007X.

      /* COV FORMAT ASSOCIATIONS */

      TELN_FLG  FAP008X.   INSIDE    FAP009X.   NOSERV    FAP009X.
      HOWLNGWK  FAP011X.

      /* REC FORMAT ASSOCIATIONS */

      TELCEL    FAP009X.   WRKCEL    FAP013X.   VCELNUM   FAP009X.
      CURWRK    FAP009X.   TELH_FLG  FAP016X.   TELDIRC   FAP009X.
      RNOSERV   FAP009X.   RH1LNGDY  FAP019X.   RH2LNGDY  FAP020X.

      /* BCK FORMAT ASSOCIATIONS */

      FLNGINTV  FAP021X.

      /* MFM FORMAT ASSOCIATIONS */

      FM_TYPE   FAP025X.   FM_STRCP  FAP026X.   FM_STRP   FAP027X.
      FM_EDUC1  FAP028X.

      /* FHS FORMAT ASSOCIATIONS */

      FCHLMYN   FAP009X.   FSPEDYN   FAP009X.   FLAADLYN  FAP009X.
      FLIADLYN  FAP009X.   FWKLIMYN  FAP009X.   FWALKYN   FAP009X.
      FREMEMYN  FAP009X.   FANYLYN   FAP009X.

      /* FAU FORMAT ASSOCIATIONS */

      FDMEDYN   FAP009X.   FNMEDYN   FAP009X.   FHOSP2YN  FAP009X.
      FHCHMYN   FAP009X.   FHCPHRYN  FAP009X.   FHCDVYN   FAP009X.
      F10DVYN   FAP009X.

      /* FSD FORMAT ASSOCIATIONS */



      /* FIN FORMAT ASSOCIATIONS */

      FSALYN    FAP009X.   FSEINCYN  FAP009X.   FSSRRYN   FAP009X.
      FPENSYN   FAP009X.   FOPENSYN  FAP009X.   FSSIYN    FAP009X.
      FTANFYN   FAP009X.   FOWBENYN  FAP009X.   FINTR1YN  FAP009X.
      FDIVDYN   FAP009X.   FCHSPYN   FAP009X.   FINCOTYN  FAP009X.
      INCGRP    FAP092X.   RAT_CAT   FAP093X.   HOUSEOWN  FAP094X.
      FGAH      FAP009X.   FSSAPLYN  FAP009X.   FSDAPLYN  FAP009X.
      FFDSTYN   FAP009X.   FWICYN    FAP009X.;
RUN;

PROC CONTENTS DATA=NHIS.FAMILYXX;
   TITLE1 'CONTENTS OF THE 2006 NHIS Family FILE';

PROC FREQ DATA=NHIS.FAMILYXX NOTITLE;
   TABLES RECTYPE/LIST MISSING;
   TITLE1 'FREQUENCY REPORT FOR 2006 NHIS Family FILE';
   TITLE2 '(WEIGHTED)';
   WEIGHT WTFA_FAM;

PROC FREQ DATA=NHIS.FAMILYXX NOTITLE;
   TABLES RECTYPE/LIST MISSING;
   TITLE1 'FREQUENCY REPORT FOR 2006 NHIS Family FILE';
   TITLE2 '(UNWEIGHTED)';

* USER NOTE: TO SEE UNFORMATTED VALUES IN PROCEDURES, ADD THE
             STATEMENT: FORMAT _ALL_;
RUN;
