*ribiosBase*: the base package of the ribios suite
===

*Deprecated: please use [ribiosUtils](https://github.com/Accio/ribiosUtils) instead*

## Background

This package contains header files (`inst/include`) and C files (`src`). They are modified from the Bioinfo-C library (internal code name BIOS library).

From 2020.02.07, the source files are moved to `ribiosUtils`. It will replace the functionality of `ribiosBase` to provide header files and source files in Bioinfo-C to the R programming environment.

## Installation

Run following commands in R console:

```R
devtools::install_github("Accio/ribiosBase")
```

