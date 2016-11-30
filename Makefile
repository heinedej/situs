#####
# Makefile for Situs 2.8
#####

SRC_DIR	= .
BIN_DIR = ../bin
SHELL = /bin/sh

#####
# FFTW Definitions
#####

# FFTDIR = ../fftw3
FFTLIB = /usr/lib/libfftw3.a
# FFTWREV = fftw-3.3.4
# FFTWMAKEFILE = $(FFTDIR)/$(FFTWREV)/Makefile


#####
# name (directory path) of compiler to be used
#####

CC         = gcc
CXX        = g++

#####
# any extra compiler and linker options (see the compiler man page)
#####

CFLAGS     = -O3 -w 
XFLAGS     = -O3 -w 
LFLAGS     = -lm 

#####
# enable POSIX thread support (comment out if not supported)
#####

SMP        = -D_SMP_ -DMAX_NUM_THREADS=16
SMPLIB     = -lpthread

#####
# enable OPENMP thread support (comment out if not supported)
#####

OMP        = -fopenmp
OMPLIB     = -lgomp 

#####
# Situs files
#####

SITUS_C	= map2map.c volhist.c voldiff.c \
			quanvol.c quanpdb.c pdb2sax.c \
			pdb2vol.c vol2pdb.c colores.c \
			voledit.c collage.c pdbsymm.c eul2pdb.c \
			qplasty.c volaver.c volmult.c

SITUS_CPP = matchpt.cpp voltrac.cpp volfltr.cpp

SITUS_EXEC = $(SITUS_C:.c=) $(SITUS_CPP:.cpp=)

#####
# misc commands
#####

CD = cd
RM = rm -f
MV = mv
CP = cp
MAKE = make
OBJ_FILES = $(wildcard *.o)

#####
# main makefile rules
#####

default: all

all: $(SITUS_EXEC)

map2map:	map2map.o lib_err.o lib_vwk.o lib_vec.o lib_std.o lib_vio.o
	$(CC) map2map.o lib_vio.o lib_vwk.o lib_vec.o  lib_std.o lib_err.o $(LFLAGS) -o map2map

volhist:	volhist.o lib_err.o lib_std.o lib_vwk.o lib_vec.o lib_vio.o 
	$(CC) volhist.o lib_vio.o lib_std.o lib_err.o lib_vwk.o lib_vec.o $(LFLAGS) -o volhist

voldiff:	voldiff.o lib_err.o lib_vwk.o lib_vec.o lib_std.o lib_vio.o  
	$(CC) voldiff.o lib_err.o lib_vwk.o lib_vec.o lib_std.o lib_vio.o $(LFLAGS) -o voldiff

volaver:	volaver.o lib_err.o lib_vwk.o lib_vec.o lib_std.o lib_vio.o 
	$(CC) volaver.o lib_err.o lib_vwk.o lib_vec.o lib_std.o lib_vio.o $(LFLAGS) -o volaver

volmult:	volmult.o lib_err.o lib_vwk.o lib_vec.o lib_std.o lib_vio.o  
	$(CC) volmult.o lib_err.o lib_vwk.o lib_vec.o lib_std.o lib_vio.o $(LFLAGS) -o volmult

quanvol:	quanvol.o lib_err.o lib_pio.o lib_std.o lib_rnd.o lib_vec.o lib_vwk.o lib_vio.o
	$(CC) quanvol.o lib_vio.o lib_pio.o lib_std.o lib_rnd.o lib_vec.o lib_vwk.o lib_err.o $(LFLAGS) -o quanvol

voledit:	voledit.o lib_err.o lib_std.o lib_vwk.o lib_vec.o lib_vio.o  
	$(CC) voledit.o lib_vio.o lib_std.o lib_vwk.o lib_vec.o lib_err.o $(LFLAGS) -o voledit

quanpdb:	quanpdb.o lib_err.o lib_vio.o lib_pwk.o lib_std.o lib_vwk.o lib_vec.o lib_eul.o lib_rnd.o lib_vio.o
	$(CC) quanpdb.o lib_err.o lib_std.o lib_pio.o lib_pwk.o lib_vwk.o lib_vec.o lib_vio.o lib_eul.o lib_rnd.o $(LFLAGS) -o quanpdb

pdb2sax:	pdb2sax.o lib_err.o lib_pio.o lib_std.o lib_vec.o
	$(CC) pdb2sax.o lib_err.o lib_std.o lib_pio.o lib_vec.o $(LFLAGS) -o pdb2sax

pdb2vol:	pdb2vol.o lib_err.o lib_pio.o lib_pwk.o lib_std.o lib_vwk.o lib_vec.o lib_eul.o lib_vio.o 
	$(CC) pdb2vol.o lib_err.o lib_std.o lib_pio.o lib_pwk.o lib_vwk.o lib_vec.o lib_vio.o lib_eul.o $(LFLAGS) -o pdb2vol

vol2pdb:	vol2pdb.o lib_err.o lib_pio.o lib_std.o lib_vwk.o lib_vec.o lib_vio.o
	$(CC) vol2pdb.o lib_err.o lib_std.o lib_pio.o lib_vwk.o lib_vec.o lib_vio.o $(LFLAGS) -o vol2pdb

pdbsymm:	pdbsymm.o lib_err.o lib_pio.o lib_std.o lib_vwk.o lib_vec.o lib_vio.o
	$(CC) pdbsymm.o lib_err.o lib_std.o lib_vio.o lib_vwk.o lib_vec.o lib_pio.o $(LFLAGS) -o pdbsymm

eul2pdb:	eul2pdb.o lib_std.o lib_err.o lib_pio.o lib_pwk.o lib_eul.o lib_vec.o lib_vwk.o
	$(CC) eul2pdb.o lib_std.o lib_err.o lib_pio.o lib_pwk.o lib_eul.o lib_vec.o lib_vwk.o $(LFLAGS) -o eul2pdb

qplasty:	qplasty.o  lib_err.o lib_std.o lib_pio.o lib_vec.o
	$(CC) qplasty.o lib_err.o lib_std.o lib_pio.o lib_vec.o $(LFLAGS) -o qplasty

collage:	collage.o lib_std.o lib_pio.o lib_vwk.o lib_vec.o lib_rnd.o lib_pwk.o lib_pow.o lib_err.o lib_eul.o lib_tim.o lib_smp.o lib_vio.o 
	$(CC) collage.o lib_std.o lib_pio.o lib_vio.o lib_vwk.o lib_vec.o lib_rnd.o lib_pwk.o lib_pow.o lib_err.o lib_eul.o lib_tim.o lib_smp.o $(LFLAGS) $(SMPLIB) -o collage

colores:	colores.o lib_std.o lib_pio.o lib_vwk.o lib_vec.o lib_rnd.o lib_pwk.o lib_pow.o lib_err.o lib_eul.o lib_tim.o lib_smp.o lib_vio.o $(FFTLIB)
	$(CC) colores.o lib_std.o lib_pio.o lib_vio.o lib_vwk.o lib_vec.o lib_rnd.o lib_pwk.o lib_pow.o lib_err.o lib_eul.o lib_tim.o lib_smp.o $(FFTLIB) $(SMPLIB) $(OMPLIB) $(LFLAGS) -o colores

matchpt:	matchpt.o lib_mpt.o 
	$(CXX) matchpt.o lib_mpt.o lib_vio.o lib_pio.o lib_vwk.o lib_vec.o lib_std.o lib_err.o $(LFLAGS) $(OMPLIB) -o matchpt

voltrac:	voltrac.o lib_sba.o lib_svt.o	
	$(CXX) voltrac.o lib_sba.o lib_svt.o lib_vio.o lib_pio.o lib_vwk.o lib_vec.o lib_std.o lib_err.o $(LFLAGS) $(OMPLIB) $(SMPLIB) -o voltrac

volfltr:	volfltr.o lib_sba.o lib_svt.o	
	$(CXX) volfltr.o lib_sba.o lib_svt.o lib_vio.o lib_vwk.o lib_vec.o lib_std.o lib_err.o $(LFLAGS) $(OMPLIB) $(SMPLIB) -o volfltr

.PHONY:		clean veryclean 

install:	$(SITUS_EXEC)
	if ! test -d $(BIN_DIR); \
	then \
	  mkdir $(BIN_DIR); \
	fi
	$(CP) $(SITUS_EXEC) $(BIN_DIR)

clean:
	$(RM) $(OBJ_FILES) $(SITUS_EXEC)
	if test -e $(FFTDIR)/$(FFTWREV)/Makefile; \
	then \
	  $(MAKE) -C $(FFTDIR)/$(FFTWREV) clean; \
	fi

veryclean:	clean
	if test -d  $(BIN_DIR); \
	then \
	  $(CD) $(BIN_DIR) && $(RM) $(SITUS_EXEC); \
	fi
	if test -e  $(FFTDIR)/$(FFTWREV)/Makefile; \
	then \
	  $(MAKE) -C $(FFTDIR)/$(FFTWREV) distclean; \
	fi
	$(RM) -r $(FFTDIR)/lib $(FFTDIR)/bin $(FFTDIR)/include \
		$(FFTDIR)/share

.c.o:	situs.h
	$(CC) $(CFLAGS) $(SMP) $(OMP) -c $(SRC_DIR)/$<

.cpp.o:	situs.h
	$(CXX) $(XFLAGS) $(SMP) $(OMP) -c $(SRC_DIR)/$<
