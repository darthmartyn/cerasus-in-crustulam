EXE=/home/adacore
ENV=ENV_PREFIX=$(HOME)/morello-sdp
MORELLO=-XEXEDIR=$(HOME)/morello-sdp$(EXE) --target=morello-freebsd15
HOST=-XEXEDIR=$(PWD)

clean-target:
	$(ENV) gprclean -q -ws $(MORELLO) -P demo.gpr

build-target: clean-target
	$(ENV) gprbuild -p $(MORELLO) -P demo.gpr

target: build-target
	ssh adacore@10.17.0.10 $(EXE)/demo

clean-host:
	gprclean -q -ws $(HOST) -P demo.gpr

build-host: clean-host
	gprbuild -p $(HOST) -P demo.gpr

host: build-host
	$(PWD)/demo
