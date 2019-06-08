*********************************************************************
 MAY 26, 2010  3:30 PM
 
 This is an example of a SAS program that creates a SAS
 file from the 2009 NHIS Public Use INJVERBT.DAT ASCII file
 
 This is stored in INJVERBT.SAS
*********************************************************************;

* USER NOTE: PLACE NEXT STATEMENT IN SUBSEQUENT PROGRAMS;
LIBNAME  NHIS     "C:\NHIS2009";

* USER NOTE: PLACE NEXT STATEMENT IN SUBSEQUENT PROGRAMS
             IF YOU ALLOW PROGRAM TO PERMANENTLY STORE FORMATS;
LIBNAME  LIBRARY  "C:\NHIS2009";

FILENAME ASCIIDAT 'C:\NHIS2009\INJVERBT.dat';

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
   VALUE $VERBAT
      ' '< - HIGH   = "Verbatim Values"
   ;
   VALUE IVP001X
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
   VALUE IVP002X
      .                   = '.'
      OTHER              = "Survey Year"
   ;
   VALUE $IVP006X
      "01"               = "01 First injury or poisoning"
      "02"               = "02 Second injury or poisoning"
      "03"               = "03 Third injury or poisoning"
      "04"               = "04 Fourth injury or poisoning"
      "05"               = "05 Fifth injury or poisoning"
      "06"               = "06 Sixth injury or poisoning"
      "07"               = "07 Seventh injury or poisoning"
      "08"               = "08 Eighth injury or poisoning"
      "09"               = "09 Ninth injury or poisoning"
      "10"               = "10 Tenth injury or poisoning"
   ;

DATA NHIS.INJVERBT;
   * CREATE A SAS DATA SET;
   INFILE ASCIIDAT PAD LRECL=1118;

   * DEFINE LENGTH OF ALL VARIABLES;

   LENGTH

      /* IDN LENGTHS */

      RECTYPE    3   SRVY_YR    4   HHX      $ 6   FMX      $ 2
      FPX      $ 2   IPEPNO   $ 2

      /* FIJ LENGTHS */

      IPHOW    $ 300 IJBODYOS $ 100 IJTYP1OS $ 100 IJTYP2OS $ 100
      IJTYP3OS $ 100 IJTYP4OS $ 100 IPOTHOS  $ 100 PPOISOS  $ 100
      IPWHATOT $ 100 ;

   * INPUT ALL VARIABLES;

   INPUT

      /* IDN LOCATIONS */

      RECTYPE       1 -   2    SRVY_YR       3 -   6
      HHX      $    7 -  12    FMX      $   13 -  14
      FPX      $   15 -  16    IPEPNO   $   17 -  18


      /* FIJ LOCATIONS */

      IPHOW    $   19 - 318    IJBODYOS $  319 - 418
      IJTYP1OS $  419 - 518    IJTYP2OS $  519 - 618
      IJTYP3OS $  619 - 718    IJTYP4OS $  719 - 818
      IPOTHOS  $  819 - 918    PPOISOS  $  919 -1018
      IPWHATOT $ 1019 -1118;

   * DEFINE VARIABLE LABELS;

   LABEL

      /* IDN LABELS */

      RECTYPE    ="File type identifier"
      SRVY_YR    ="Year of National Health Interview Survey"
      HHX        ="HH identifier"
      FMX        ="Family #"
      FPX        ="Person Number (Within family)"
      IPEPNO     ="Injury/Poisoning Episode Number"

      /* FIJ LABELS */

      IPHOW      ="Description of injury/poisoning episode"
      IJBODYOS   ='"Other" parts of the body hurt'
      IJTYP1OS   ='"Other" way first body part was hurt'
      IJTYP2OS   ='"Other" way second body part was hurt'
      IJTYP3OS   ='"Other" way third body part was hurt'
      IJTYP4OS   ='"Other" way fourth body part was hurt'
      IPOTHOS    ='"Other" place received medical care'
      PPOISOS    ='"Other" cause of poisoning episode'
      IPWHATOT   ='"Other" activity at the time of the injury/poisoning episode'
   ;

   * ASSOCIATE VARIABLES WITH FORMAT VALUES;
   *    (PUT ASTERISK (*) BEFORE WORD "FORMAT"
        IN NEXT STATEMENT TO PREVENT FORMAT
        ASSOCIATIONS BEING STORED WITH DATA SET);
   FORMAT

      /* IDN FORMAT ASSOCIATIONS */

      RECTYPE   IVP001X.   SRVY_YR   IVP002X.   HHX       $GROUPC.
      IPEPNO    $IVP006X.

      /* FIJ FORMAT ASSOCIATIONS */

      IPHOW     $VERBAT.   IJBODYOS  $VERBAT.   IJTYP1OS  $VERBAT.
      IJTYP2OS  $VERBAT.   IJTYP3OS  $VERBAT.   IJTYP4OS  $VERBAT.
      IPOTHOS   $VERBAT.   PPOISOS   $VERBAT.   IPWHATOT  $VERBAT.;
RUN;

PROC CONTENTS DATA=NHIS.INJVERBT;
   TITLE1 'CONTENTS OF THE 2009 NHIS Episode Verbatim FILE';

PROC FREQ DATA=NHIS.INJVERBT NOTITLE;
   TABLES RECTYPE/LIST MISSING;
   TITLE1 'FREQUENCY REPORT FOR 2009 NHIS Episode Verbatim FILE';
   TITLE2 '(UNWEIGHTED)';

* USER NOTE: TO SEE UNFORMATTED VALUES IN PROCEDURES, ADD THE
             STATEMENT: FORMAT _ALL_;
RUN;
