*********************************************************************
* APRIL 19, 2011  1:56 PM
*
* THIS IS AN EXAMPLE OF AN SPSS SCRIPT THAT CREATES
* A TEMPORARY SPSS FILE FROM THE
* 2010 NHIS PUBLIC USE familyxx.DAT ASCII FILE
*
* THIS IS STORED IN familyxx.SPS
*********************************************************************

FILE HANDLE TEMP
   /NAME='C:\NHIS2010\familyxx.dat'
   /RECFORM=VARIABLE
   /LRECL=172

DATA LIST FILE=TEMP FIXED RECORDS=1 TABLE /
   RECTYPE     1 -   2       SRVY_YR     3 -   6
   HHX         7 -  12 (A)   FMX        13 -  14 (A)
   WTFA_FAM   15 -  20
   FINT_Y_P   21 -  24       FINT_M_P   25 -  26
   TELN_FLG   27 -  27       CURWRKN    28 -  28
   RNOSERVN   29 -  29       RHLNGDY    30 -  32
   TELCELN    33 -  33       WRKCELN    34 -  35
   CELLOUT    36 -  36       PHONEUSE   37 -  37
   FLNGINTV   38 -  38
   FM_SIZE    39 -  40       FM_KIDS    41 -  42
   FM_ELDR    43 -  44       FM_TYPE    45 -  45
   FM_STRCP   46 -  47       FM_STRP    48 -  49
   FM_EDUC1   50 -  51
   FCHLMYN    52 -  52       FCHLMCT    53 -  54
   FSPEDYN    55 -  55       FSPEDCT    56 -  57
   FLAADLYN   58 -  58       FLAADLCT   59 -  60
   FLIADLYN   61 -  61       FLIADLCT   62 -  63
   FWKLIMYN   64 -  64       FWKLIMCT   65 -  66
   FWALKYN    67 -  67       FWALKCT    68 -  69
   FREMEMYN   70 -  70       FREMEMCT   71 -  72
   FANYLYN    73 -  73       FANYLCT    74 -  75
   FHSTATEX   76 -  77       FHSTATVG   78 -  79
   FHSTATG    80 -  81       FHSTATFR   82 -  83
   FHSTATPR   84 -  85
   FDMEDYN    86 -  86       FDMEDCT    87 -  88
   FNMEDYN    89 -  89       FNMEDCT    90 -  91
   FHOSP2YN   92 -  92       FHOSP2CT   93 -  94
   FHCHMYN    95 -  95       FHCHMCT    96 -  97
   FHCPHRYN   98 -  98       FHCPHRCT   99 - 100
   FHCDVYN   101 - 101       FHCDVCT   102 - 103
   F10DVYN   104 - 104       F10DVCT   105 - 106
   FHDSTCT   107 - 108       FDGLWCT1  109 - 110
   FDGLWCT2  111 - 112       FWRKLWCT  113 - 114
   FSALYN    115 - 115       FSALCT    116 - 117
   FSEINCYN  118 - 118       FSEINCCT  119 - 120
   FSSRRYN   121 - 121       FSSRRCT   122 - 123
   FPENSYN   124 - 124       FPENSCT   125 - 126
   FOPENSYN  127 - 127       FOPENSCT  128 - 129
   FSSIYN    130 - 130       FSSICT    131 - 132
   FTANFYN   133 - 133       FTANFCT   134 - 135
   FOWBENYN  136 - 136       FOWBENCT  137 - 138
   FINTR1YN  139 - 139       FINTR1CT  140 - 141
   FDIVDYN   142 - 142       FDIVDCT   143 - 144
   FCHSPYN   145 - 145       FCHSPCT   146 - 147
   FINCOTYN  148 - 148       FINCOTCT  149 - 150
   INCGRP2   151 - 152       INCGRP3   153 - 154
   RAT_CAT2  155 - 156       RAT_CAT3  157 - 158
   HOUSEOWN  159 - 159       FGAH      160 - 160
   FSSAPLYN  161 - 161       FSSAPLCT  162 - 163
   FSDAPLYN  164 - 164       FSDAPLCT  165 - 166
   FFDSTYN   167 - 167       FFDSTCT   168 - 169
   FWICYN    170 - 170       FWICCT    171 - 172
.

   VARIABLE LABELS
   RECTYPE   "File type identifier"
   SRVY_YR   "Year of National Health Interview Survey"
   HHX       "HH identifier"
   FMX       "Family #"
   WTFA_FAM  "Weight - Final Annual"
   FINT_Y_P  "Year Interview Completed - Year"
   FINT_M_P  "Date of Interview - Month"
   TELN_FLG  "Supplied telephone number"
   CURWRKN   "Working phone inside home"
   RNOSERVN  "Without telephone service in the past 12 months"
   RHLNGDY   "Number of days without telephone service"
   TELCELN   "Working cell phone in family"
   WRKCELN   "Number of working cell phones"
   CELLOUT   "Working cell during land-line outage"
   PHONEUSE  "Received calls cell/landline/both"
   FLNGINTV  "Language of Interview"
   FM_SIZE   "Size of family"
   FM_KIDS   "# family members under 18 years of age"
   FM_ELDR   "# family members aged 65 and older"
   FM_TYPE   "Family type"
   FM_STRCP  "Family Structure"
   FM_STRP   "Family Structure"
   FM_EDUC1  "Education of adult with highest education in family"
   FCHLMYN   "Any children under age 5 in family with play limitations?"
   FCHLMCT   "# children under age 5 in family with play limitations"
   FSPEDYN   "Any children in family receive Special Education/EIS?"
   FSPEDCT   "# children in family receiving Special Education/EIS"
   FLAADLYN  "Any family member need help with an ADL?"
   FLAADLCT  "# family members needing help with an ADL"
   FLIADLYN  "Any family member need help with an IADL?"
   FLIADLCT  "# family members needing help with an IADL"
   FWKLIMYN  "Any family member have work limitations due to a health problem?"
   FWKLIMCT  "# family members with work limitations due to a health problem"
   FWALKYN   "Any family member have difficulty walking without equipment?"
   FWALKCT   "# family members having difficulty walking without equipment"
   FREMEMYN  "Any family member limited by difficulty remembering?"
   FREMEMCT  "# family members with difficulty remembering"
   FANYLYN   "Is any family member limited in ANY WAY?"
   FANYLCT   "# of family members with ANY limitation"
   FHSTATEX  "# family members in excellent health"
   FHSTATVG  "# family members in very good health"
   FHSTATG   "# family members in good health"
   FHSTATFR  "# family members in fair health"
   FHSTATPR  "# family members in poor health"
   FDMEDYN   "Any family member delay seeking medical care, 12m?"
   FDMEDCT   "# of family members for whom medical care was delayed 12m"
   FNMEDYN   "Any family member need and not get medical care 12m?"
   FNMEDCT   "# of family members who needed and did not get medical care 12m"
   FHOSP2YN  "Any family member in hospital overnight, 12m?"
   FHOSP2CT  "# of family members in hospital overnight, 12m"
   FHCHMYN   "Any family member receive home care, 2 wk?"
   FHCHMCT   "# of family members who received home care, 2 wk"
   FHCPHRYN  "Any family member get advice/test results over the phone, 2wk?"
   FHCPHRCT  "# of family members who got advice/test results over the phone, 2 wk"
   FHCDVYN   "Any family member have an office visit, etc. 2 wk"
   FHCDVCT   "# of family members who had an office visit, etc. 2 wk"
   F10DVYN   "Any family member receive care 10+ times, 12m?"
   F10DVCT   "# of family members who received care 10+ times, 12m"
   FHDSTCT   "# of children in family currently or ever in Head Start"
   FDGLWCT1  "# family members working last week"
   FDGLWCT2  "# family members looking for work last week"
   FWRKLWCT  "# family members working full time last week"
   FSALYN    "Any family member receive income from wages or salary?"
   FSALCT    "# family members receiving income from wages or salary?"
   FSEINCYN  "Any family member receive income from self-employment?"
   FSEINCCT  "# family members receiving income from self-employment"
   FSSRRYN   "Any family member receive Social Security or Railroad Retirement income?"
   FSSRRCT   "# family members receiving Social Security or Railroad Retirement income"
   FPENSYN   "Any family members receive disability pensions (See file layout)"
   FPENSCT   "# family members receiving disability pensions (See file layout)"
   FOPENSYN  "Any family member receive other survivor or retirement pensions?"
   FOPENSCT  "# family members receiving other survivor or retirement pension"
   FSSIYN    "Any family member receive income from SSI?"
   FSSICT    "# of family members receiving income from SSI"
   FTANFYN   "Any family member receive income from a state or county welfare program?"
   FTANFCT   "# of family members receiving income from a state or county welfare program"
   FOWBENYN  "Any family member receive other kind of welfare assistance?"
   FOWBENCT  "# of family members receiving other kind of welfare assistance"
   FINTR1YN  "Any family member receive income from interest bearing accounts, funds, etc.?"
   FINTR1CT  "# of family members receiving income from interest bearing accounts, funds, etc."
   FDIVDYN   "Any family member receive dividends from stocks, etc.?"
   FDIVDCT   "# of family members receiving dividends from stocks, etc."
   FCHSPYN   "Any family member receive child support income?"
   FCHSPCT   "# of family members for whom child support was received"
   FINCOTYN  "Any family member receive income from any other source?"
   FINCOTCT  "# of family members receiving income from any other source"
   INCGRP2   "Total combined family income (grouped)"
   INCGRP3   "Total combined family income (grouped)"
   RAT_CAT2  "Ratio of family income to the poverty threshold"
   RAT_CAT3  "Ratio of family income to the poverty threshold"
   HOUSEOWN  "Home tenure status"
   FGAH      "Paying lower rent due to government program"
   FSSAPLYN  "Any family member ever apply for SSI?"
   FSSAPLCT  "# family members ever applying for SSI"
   FSDAPLYN  "Any family member ever apply for SSDI?"
   FSDAPLCT  "# family members ever applying for SSDI"
   FFDSTYN   "Any family member authorized to receive food stamps?"
   FFDSTCT   "# family members authorized to receive food stamps"
   FWICYN    "Any family member receiving WIC benefits?"
   FWICCT    "# family members receiving WIC benefits"
.

   VALUE LABELS
   RECTYPE
      10       "Household"
      20       "Person"
      25       "Income Imputation"
      30       "Sample Adult"
      31       "Sample Adult Cancer"
      38       "Quality of Life"
      40       "Sample Child"
      60       "Family"
      63       "Disability Questions Tests 2010"
      65       "Paradata"
      70       "Injury/Poisoning Episode"
      75       "Injury/Poisoning Verbatim"
 / FINT_Y_P
      9998     "Not ascertained"
 / FINT_M_P
      01       "January"
      02       "February"
      03       "March"
      04       "April"
      05       "May"
      06       "June"
      07       "July"
      08       "August"
      09       "September"
      10       "October"
      11       "November"
      12       "December"
      98       "Not ascertained"
 / TELN_FLG
      1        "Gave telephone number"
      2        "No telephone"
      7        "Refused"
      8        "Not ascertained"
      9        "Don't know"
 / CURWRKN
      1        "Yes"
      2        "No"
      7        "Refused"
      8        "Not ascertained"
      9        "Don't know"
 / RNOSERVN
      1        "Yes"
      2        "No"
      7        "Refused"
      8        "Not ascertained"
      9        "Don't know"
 / RHLNGDY
      000      "Less than 1 week"
      997      "Refused"
      998      "Not ascertained"
      999      "Don't know"
 / TELCELN
      1        "Yes"
      2        "No"
      7        "Refused"
      8        "Not ascertained"
      9        "Don't know"
 / WRKCELN
      97       "Refused"
      98       "Not ascertained"
      99       "Don't know"
 / CELLOUT
      1        "Yes"
      2        "No"
      7        "Refused"
      8        "Not ascertained"
      9        "Don't know"
 / PHONEUSE
      1        "All or almost all calls received on cell phones"
      2        "Some received on cell phones and some on regular phones"
      3        "Very few or none on cell phones"
      7        "Refused"
      8        "Not ascertained"
      9        "Don't know"
 / FLNGINTV
      1        "English"
      2        "Spanish"
      3        "English and Spanish"
      4        "Other"
      8        "Not ascertained"
 / FM_TYPE
      1        "One adult, no child(ren) under 18"
      2        "Multiple adults, no child(ren) under 18"
      3        "One adult, 1+ child(ren) under 18"
      4        "Multiple adults, 1+ child(ren) under 18"
      9        "Unknown"
 / FM_STRCP
      11       "Living alone"
      12       "Living with roommate(s)"
      21       "Married couple"
      22       "Unmarried couple"
      23       "All other adult-only families"
      31       "Mother and biological or non-biological child(ren) only"
      32       "Father and biological or non-biological child(ren) only"
      33       "All other single-adult and child(ren) families"
      41       "Married or unmarried parents with biological/adoptive child(ren) only"
      42       "Parent (biological or adoptive), step parent, and child(ren) only"
      43       "Parent (biological or adoptive), cohabiting partner, and child(ren) only"
      44       "At least 1 (biological or adoptive) parent and 1+ child(ren), and other related adults"
      45       "Other related and/or unrelated adults, 1+ child(ren), no biological or adoptive parent(s)"
      99       "Unknown"
 / FM_STRP
      11       "Living alone"
      12       "Living with roommate(s)"
      21       "Married couple"
      22       "Unmarried couple"
      23       "All other adult-only families"
      31       "Mother and biological or non-biological child(ren) only"
      32       "Father and biological or non-biological child(ren) only"
      33       "All other single-adult and child(ren) families"
      41       "Married parents with biological/adoptive child(ren) only"
      42       "Cohabiting parent(s) with child(ren) only"
      43       "Parent (biological or adoptive), step parent, and child(ren) only"
      44       "At least 1 (biological or adoptive) parent and 1+ child(ren), and other related adults"
      45       "Other related and/or unrelated adults, 1+ child(ren), no biological or adoptive parent(s)"
      99       "Unknown"
 / FM_EDUC1
      01       "Less than/equal to 8th grade"
      02       "9-12th grade, no high school diploma"
      03       "GED recipient"
      04       "High school graduate"
      05       "Some college, no degree"
      06       "AA degree, technical or vocational"
      07       "AA degree, academic program"
      08       "Bachelor's degree (BA, BS, AB, BBA)"
      09       "Master's, professional, or doctoral degree"
      97       "Refused"
      98       "Not ascertained"
      99       "Don't know"
 / FCHLMYN
      1        "Yes"
      2        "No"
      7        "Refused"
      8        "Not ascertained"
      9        "Don't know"
 / FSPEDYN
      1        "Yes"
      2        "No"
      7        "Refused"
      8        "Not ascertained"
      9        "Don't know"
 / FLAADLYN
      1        "Yes"
      2        "No"
      7        "Refused"
      8        "Not ascertained"
      9        "Don't know"
 / FLIADLYN
      1        "Yes"
      2        "No"
      7        "Refused"
      8        "Not ascertained"
      9        "Don't know"
 / FWKLIMYN
      1        "Yes"
      2        "No"
      7        "Refused"
      8        "Not ascertained"
      9        "Don't know"
 / FWALKYN
      1        "Yes"
      2        "No"
      7        "Refused"
      8        "Not ascertained"
      9        "Don't know"
 / FREMEMYN
      1        "Yes"
      2        "No"
      7        "Refused"
      8        "Not ascertained"
      9        "Don't know"
 / FANYLYN
      1        "Yes"
      2        "No"
      7        "Refused"
      8        "Not ascertained"
      9        "Don't know"
 / FDMEDYN
      1        "Yes"
      2        "No"
      7        "Refused"
      8        "Not ascertained"
      9        "Don't know"
 / FNMEDYN
      1        "Yes"
      2        "No"
      7        "Refused"
      8        "Not ascertained"
      9        "Don't know"
 / FHOSP2YN
      1        "Yes"
      2        "No"
      7        "Refused"
      8        "Not ascertained"
      9        "Don't know"
 / FHCHMYN
      1        "Yes"
      2        "No"
      7        "Refused"
      8        "Not ascertained"
      9        "Don't know"
 / FHCPHRYN
      1        "Yes"
      2        "No"
      7        "Refused"
      8        "Not ascertained"
      9        "Don't know"
 / FHCDVYN
      1        "Yes"
      2        "No"
      7        "Refused"
      8        "Not ascertained"
      9        "Don't know"
 / F10DVYN
      1        "Yes"
      2        "No"
      7        "Refused"
      8        "Not ascertained"
      9        "Don't know"
 / FSALYN
      1        "Yes"
      2        "No"
      7        "Refused"
      8        "Not ascertained"
      9        "Don't know"
 / FSEINCYN
      1        "Yes"
      2        "No"
      7        "Refused"
      8        "Not ascertained"
      9        "Don't know"
 / FSSRRYN
      1        "Yes"
      2        "No"
      7        "Refused"
      8        "Not ascertained"
      9        "Don't know"
 / FPENSYN
      1        "Yes"
      2        "No"
      7        "Refused"
      8        "Not ascertained"
      9        "Don't know"
 / FOPENSYN
      1        "Yes"
      2        "No"
      7        "Refused"
      8        "Not ascertained"
      9        "Don't know"
 / FSSIYN
      1        "Yes"
      2        "No"
      7        "Refused"
      8        "Not ascertained"
      9        "Don't know"
 / FTANFYN
      1        "Yes"
      2        "No"
      7        "Refused"
      8        "Not ascertained"
      9        "Don't know"
 / FOWBENYN
      1        "Yes"
      2        "No"
      7        "Refused"
      8        "Not ascertained"
      9        "Don't know"
 / FINTR1YN
      1        "Yes"
      2        "No"
      7        "Refused"
      8        "Not ascertained"
      9        "Don't know"
 / FDIVDYN
      1        "Yes"
      2        "No"
      7        "Refused"
      8        "Not ascertained"
      9        "Don't know"
 / FCHSPYN
      1        "Yes"
      2        "No"
      7        "Refused"
      8        "Not ascertained"
      9        "Don't know"
 / FINCOTYN
      1        "Yes"
      2        "No"
      7        "Refused"
      8        "Not ascertained"
      9        "Don't know"
 / INCGRP2
      01       "$0 - $34,999"
      02       "$35,000 - $49,999"
      03       "$50,000 - $74,999"
      04       "$75,000 - $99,999"
      05       "$100,000 and over"
      06       "$0 - $49,999 (no further detail)"
      07       "$50,000 and over (no further detail)"
      08       "$50,000 - $99,999 (no further detail)"
      99       "Unknown"
 / INCGRP3
      01       "$0 - $34,999"
      02       "$35,000 - $74,999"
      03       "$75,000 - $99,999"
      04       "$100,000 and over"
      96       "Undefined"
      99       "Unknown"
 / RAT_CAT2
      01       "Under 0.50"
      02       "0.50 - 0.74"
      03       "0.75 - 0.99"
      04       "1.00 - 1.24"
      05       "1.25 - 1.49"
      06       "1.50 - 1.74"
      07       "1.75 - 1.99"
      08       "2.00 - 2.49"
      09       "2.50 - 2.99"
      10       "3.00 - 3.49"
      11       "3.50 - 3.99"
      12       "4.00 - 4.49"
      13       "4.50 - 4.99"
      14       "5.00 and over"
      15       "Less than 1.00 (no further detail)"
      16       "1.00 - 1.99 (no further detail)"
      17       "2.00 and over (no further detail)"
      96       "Undefinable"
      99       "Unknown"
 / RAT_CAT3
      01       "Under 0.50"
      02       "0.50 - 0.74"
      03       "0.75 - 0.99"
      04       "1.00 - 1.24"
      05       "1.25 - 1.49"
      06       "1.50 - 1.74"
      07       "1.75 - 1.99"
      08       "2.00 - 2.49"
      09       "2.50 - 2.99"
      10       "3.00 - 3.49"
      11       "3.50 - 3.99"
      12       "4.00 - 4.49"
      13       "4.50 - 4.99"
      14       "5.00 and over"
      15       "Less than 1.00 (no further detail)"
      16       "1.00 - 1.99 (no further detail)"
      17       "2.00 - 3.99 (no further detail)"
      18       "4.00 and over (no further detail)"
      96       "Undefinable"
      99       "Unknown"
 / HOUSEOWN
      1        "Owned or being bought"
      2        "Rented"
      3        "Other arrangement"
      7        "Refused"
      8        "Not ascertained"
      9        "Don't know"
 / FGAH
      1        "Yes"
      2        "No"
      7        "Refused"
      8        "Not ascertained"
      9        "Don't know"
 / FSSAPLYN
      1        "Yes"
      2        "No"
      7        "Refused"
      8        "Not ascertained"
      9        "Don't know"
 / FSDAPLYN
      1        "Yes"
      2        "No"
      7        "Refused"
      8        "Not ascertained"
      9        "Don't know"
 / FFDSTYN
      1        "Yes"
      2        "No"
      7        "Refused"
      8        "Not ascertained"
      9        "Don't know"
 / FWICYN
      1        "Yes"
      2        "No"
      7        "Refused"
      8        "Not ascertained"
      9        "Don't know"

FREQUENCIES GENERAL = RECTYPE.
EXECUTE.
