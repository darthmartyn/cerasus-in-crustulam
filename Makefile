clean:
	ENV_PREFIX=$(HOME)/morello-sdp EXEDIR=$(HOME)/morello-sdp/home/adacore/pike gprclean -q -ws -P demo.gpr

build: clean
	ENV_PREFIX=$(HOME)/morello-sdp EXEDIR=$(HOME)/morello-sdp/home/adacore/pike gprbuild -p -P demo.gpr
