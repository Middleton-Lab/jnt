# jnt #

[![Build Status](https://travis-ci.org/kmiddleton/jnt.png?branch=master)](https://travis-ci.org/kmiddleton/jnt)

An R package to carry out the Johnson-Neyman Technique for ANCOVA
data. Find areas of non-significant slope differences.

# Installation #

You can install the most recent version directly from github using
`install_github()` from the
[devtools package](https://github.com/hadley/devtools).

```R
require(devtools)
install_github("kmiddleton/jnt")
```

Note that if you are using Windows, you will first need to install Rtools. Start at <http://www.murdoch-sutherland.com/Rtools/> and follow the links to CRAN. 

# References #

D'Alonzo KT. 2004. The Johnson-Neyman Procedure as an alternative
to ANCOVA. *Western Journal of Nursing Research* 26:804-812.

Hunka S, Leighton J (1997) Defining Johnson-Neyman regions of
significance in three-covariate ANCOVA using Mathematica. *Journal of
Educational and Behavioral Statistics* 22: 361-387.

Johnson PO, Neyman J (1936) Tests of certain linear hypotheses and
their application to some educational problems. *Statistical Research
Memoirs* 1:57-93.

Koenker RH, Hansen CW. 1942. Steps for the application of the
Johnson-Neyman Technique: A sample analysis. *Journal of Experimental
Education* 10:164-173.

White CR (2003) Allometric analysis beyond heterogenous regression
slopes: Use of the Johnson-Neyman Technique in comparative
biology. *Physiol Biochem Zool* 76: 135-140.

# Examples #

White CR (2003) The influence of foraging mode and arid adaptation on
the basal metabolic rates of burrowing mammals. *Physiol Biochem Zool*
76: 122-134.

    example(White.1)

Lavin SR, Karasov WH, Ives AR, Middleton KM, Garland T, Jr (2008)
Morphometrics of the avian small intestine compared with that of
nonflying mammals: A phylogenetic approach. *Physiol Biochem Zool* 81:
526-550.

    example(Lavin.1)
