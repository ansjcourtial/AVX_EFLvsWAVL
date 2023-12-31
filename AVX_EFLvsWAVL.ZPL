! AVX_EFLvsWAVL.zpl
!
! This demonstration macro computes 
! the focal length per wavlength and print it on console.
! for feeding the advanced focal length parameters of 
! AVXCELERATE Camera model


FORMAT 12.5
SETSYSTEMPROPERTY 201, 8
SETSYSTEMPROPERTY 202, 1, 0.390
SETSYSTEMPROPERTY 202, 2, 0.4274
SETSYSTEMPROPERTY 202, 3, 0.464
SETSYSTEMPROPERTY 202, 4, 0.5023
SETSYSTEMPROPERTY 202, 5, 0.5397
SETSYSTEMPROPERTY 202, 6, 0.5771
SETSYSTEMPROPERTY 202, 7, 0.6146
SETSYSTEMPROPERTY 202, 8, 0.652
UPDATE

PRINT "---------------------------"
PRINT "-- GET EFL vs WAVELENGTH --" 
PRINT "---------------------------" 
PRINT ""
PRINT "	WAVL: wavelength in nanometers"
PRINT "	EFL: effective focal length in ", 
lengthUnit = UNIT()
IF (lengthUnit == 0) THEN PRINT "millimeters"
IF (lengthUnit == 1) THEN PRINT "centimeters"
IF (lengthUnit == 2) THEN PRINT "inches"
IF (lengthUnit == 3) THEN PRINT "meters"
ENDIF

PRINT ""
PRINT "WAVL, EFL"                

numsteps = 8
FOR i = 1, numsteps, 1
	SETSYSTEMPROPERTY 200, i
	UPDATE
	GETSYSTEMDATA 1
	PRINT WAVL(PWAV())*1000, "," , VEC1(7) 
NEXT
