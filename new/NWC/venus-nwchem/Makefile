# On Xeon cluster chemdynm
# This makefile is for nwchem-5.0 using Infiniband with infiniband libraries (IB_LIB)

# GET NWCHEM COMPILER FLAGS SET

include $(NWCHEM_TOP)/src/config/makefile.h
#FOPTIONS += -I/mscf/home/bert/Spain/Codigo_VenusNWChem-latest
#include /home/ulourde/nwchem-4.7-new/nwchem-4.7/src/config/makefile.h

# CHOICE OF TARGET_QM: NWCHEM

TARGET_QM = NWCHEM

QM = QMCALC.o STUBS_LINK.o
ifeq ($(TARGET_QM),NWCHEM)
QM = QMCALC.o NWCHEM_LINK.o 
endif

VEN=    ADAMSM.o ANGVEL.o AXT.o BAREXC.o CENMAS.o CUBEND.o\
	DANGLE.o DMBE.o DVDQ.o EBOND.o EIGN.o\
	EIGOUT.o ENERGY.o ENMODE.o vFDATE.o FGMTRX.o\
	FINAL.o FINLNJ.o FMTRX.o GAMA.o GFINAL.o MPATHO.o\
	GHOST.o GINROT.o GLPAR.o GPATH.o GRCONV.o GWRITE.o HALPHA.o\
	HBEND.o HEXP.o HFD.o HNONB.o\
	HOMOQP.o HTAU.o INITEBK.o INITQP.o LENJ.o LEPS1.o LEPS2.o\
	LMEXCT.o LMODE.o MORSE.o MPATH.o NMODE.o ORTHAN.o PARSN2.o\
	PARTI.o POTEN.o RAND0.o RAND1.o RANDST.o READPT.o RELAX.o ROTATE.o\
	ROTEN.o ROTN.o RUNGEK.o RYDBG.o SELECT.o STRET.o SURF.o SYBMOL.o\
	VETEST.o TETRA.o THRMAN.o VENUS.o VRR.o\
	VRT.o VSN2.o VTT.o WEBOND.o WENMOD.o WLBOND.o STATPT.o\
	HEIGHT.o CPUSEC.o RADAU.o SYMPLE.o\
        lnb.o thermo.o thermbath.o gasdev.o\
        CRCO6.o POTENZ.o hessint.o verlet.o

OBJS=$(VEN) $(QM)

ven_nw.e:	$(OBJS)

	$(FC) $(FOPTIONS) $(FDEBUG) $(OBJS) -L$(NWCHEM_TOP)/lib/$(NWCHEM_TARGET) -L$(NWCHEM_TOP)/src/tools/install/lib -o $@ $(NWCHEM_TOP)/src/stubs.o   `cat libs.txt`
#	$(FC) $(FOPTIONS) $(FDEBUG) $(OBJS) -L$(NWCHEM_TOP)/lib/$(NWCHEM_TARGET) -L$(NWCHEM_TOP)/src/tools/install/lib -o $@ $(NWCHEM_TOP)/src/stubs.o $(LIBS) -lgeninterface -lnwcutil -lnwctask -lccsd -lmcscf -lselci -lmp2 -lmoints -lstepper -ldriver -loptim -lnwdft -lgradients -lcphf -lesp -lddscf -lguess -lhessian -lvib -lnwcutil -lrimp2 -lproperty -lnwints -ldplot -lvscf -letrans -ltce -lbq -lcons -lnwcutil -lga -lpeigs -lperfm -lcons -lbq -lnwcutil ${MLIB_LDFLAGS} -llapack -lblas -larmci $(LIBMPI)

clean:
	rm -f *.o
	rm -f ven_nw.e
