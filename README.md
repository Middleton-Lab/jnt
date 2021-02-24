# jnt #

<!-- badges: start -->
  [![R-CMD-check](https://github.com/Middleton-Lab/jnt/workflows/R-CMD-check/badge.svg)](https://github.com/Middleton-Lab/jnt/actions)
<!-- badges: end -->

An R package to carry out the Johnson-Neyman Technique for ANCOVA
data. Find areas of non-significant slope differences.

# Installation #

You can install the most recent version directly from github using
`install_github()` from the `remotes` package.

```R
remotes::install_github("kmiddleton/jnt")
```

Note that if you are using Windows, you might first need to install [Rtools](https://cran.rstudio.com/bin/windows/Rtools/).

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
