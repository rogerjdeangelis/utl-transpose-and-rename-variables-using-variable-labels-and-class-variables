Transpose and rename variables using variable labels and class variables

github
https://tinyurl.com/yd32d4g8
https://github.com/rogerjdeangelis/utl-transpose-and-rename-variables-using-variable-labels-and-class-variables

see SAS Forum
https://tinyurl.com/ybevjtb8
https://communities.sas.com/t5/SAS-Procedures/RENAMING-variables-with-labels-when-labels-are-identical/m-p/505633

data_null_ profile
https://communities.sas.com/t5/user/viewprofilepage/user-id/15410

Clever double transpose by
Solution by
Data_null_

INPUT
=====

Solution by
Data_null_

Clever double transpose


Up to 40 obs WORK.HAVE total obs=6

Labels  "RGNA" 'RDNB"
          X      Y      DEP      YEAR

         200    300    SUMMER    2016
         100     40    SUMMER    2015
         800    600    SUMMER    2014

         500    500    WINTER    2016
         140    140    WINTER    2015
          80     60    WINTER    2014


VARIABLE   LABEL

 X         RGNA    * use these labels as a prefix
 Y         RGNB    for x and y


EXAMPLE OUTPUT
---------------

           RGNA_    RGNB_    RGNA_    RGNB_    RGNA_    RGNB_
  DEP       2016     2016     2015     2015     2014     2014

 SUMMER     200      300      100       40      800      600
 WINTER     500      500      140      140       80       60


PROCESS
=======

proc transpose data=have out=havXpo label=region;
   by dep descending year;
   var x y;
run;

proc transpose data=havXpo out=want(drop=_name_) delim=_;
   by dep;
   var col1;
   id region year;
run;

*                _              _       _
 _ __ ___   __ _| | _____    __| | __ _| |_ __ _
| '_ ` _ \ / _` | |/ / _ \  / _` |/ _` | __/ _` |
| | | | | | (_| |   <  __/ | (_| | (_| | || (_| |
|_| |_| |_|\__,_|_|\_\___|  \__,_|\__,_|\__\__,_|

;

see SAS Forum
https://tinyurl.com/ybevjtb8
https://communities.sas.com/t5/SAS-Procedures/RENAMING-variables-with-labels-when-labels-are-identical/m-p/505633

data_null_ profile
https://communities.sas.com/t5/user/viewprofilepage/user-id/15410

data have;
label x='RGNA' y='RGNB'; FORMAT DEP $8.;
DEP="SUMMER" ; x=200 ; Y=300; Year=2016; output;
DEP="SUMMER"; x=100; Y=40;Year=2015; output;
DEP="SUMMER"; x=800; Y=600; Year=2014; output;
DEP="WINTER" ; x=500 ; Y=500; Year=2016; output;
DEP="WINTER"; x=140; Y=140;Year=2015; output;
DEP="WINTER"; x=80; Y=60; Year=2014; output;
run;



