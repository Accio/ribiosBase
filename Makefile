## AUTOMATICALLY GENERATED FROM TEMPLATE (Mo Jul  8 20:50:58 CEST 2019). DO NOT EDIT IT MANUALLY!
################################################################################
##
##  Makefile
##      Author: Jitao David Zhang <jitao_david.zhang@roche.com>
##	    F. Hoffmann-La Roche AG
##      Description: Makefile for building distributions etc.
##
################################################################################
R:=R
R_CC=`${R} CMD config CC`
R_CFLAGS=`${R} CMD config CFLAGS`
R_CPICFLAGS=`${R} CMD config CPICFLAGS`
R_CPPFLAGS=`${R} CMD config --cppflags`
R_LDFLAGS=`${R} CMD config --ldflags`

roxygenise:
	@echo '====== roxygenize ======'	
	@(${R} -q -e "library(devtools);load_all();document('.')")
	@echo ' '

test:
	@echo '====== test ======'
	@(${R} -q -e "library(devtools);test('.')")
	@echo 

doVignettes:
	@echo "====== vignettes ======"
	@(${R} -q -e "library(devtools); devtools::build_vignettes()")
	@echo ' '

build: roxygenise
	@echo '====== Building Distribution ======'
	@(${R} -q -e "library(devtools); devtools::build()")
	@echo '====== Building finished ======'
	@echo ' '

install: roxygenise static
	@echo '====== Installing Package ======'
	@(${R} -q -e "library(devtools); devtools::install(reload=FALSE, quick=FALSE, build=TRUE, upgrade=FALSE)")
	@echo '====== Installing finished ======'
	@echo ' '

check: roxygenise
	@echo '====== Checking Package ======'
	@(${R} -q -e "library(devtools);check('.', check_dir=\"..\")")
	@echo '====== Checking finished ======'
	@echo ' '

compile:src/*.c
	@echo '====== Compile source files ======'
	cd src; for cfile in *.c; do \
	echo "Compiling $$cfile"; \
	${R_CC} ${R_CPPFLAGS} ${R_CFLAGS} ${R_CPICFLAGS} -I ../inst/include -c $${cfile}; \
	done
	@echo '====== compiling finished ======'

static: compile
	@echo '====== Compile the static library  ======'
	@(cd src; ar rcs ../inst/lib/ribiosBase.a *.o)

clean:
	@echo '====== Cleaning Package ======'
	@(rm -f inst/lib/ribiosBase.a src/*.o src/*.so src/*.dll src/*.rds)
	@(find . -type f -name "*~" -exec rm '{}' \;)
	@(find . -type f -name ".Rhistory" -exec rm '{}' \;)
	@echo ' '
