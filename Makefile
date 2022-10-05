# -*- MakeFile -*-
# X=Y Variable used with $(X)

BINARY=main
CODEDIRS=. lib
INCDIRS=. ./include/

UNAME := $(shell uname -s)

ifeq ($(UNAME), Darwin) #Darwin = MacOS
	CC=g++
else
# TODO
endif
## boost location /usr/local/include/
OPT=-O3
# generate files that encode make rules for the .h dependencies
DEPFLAGS=-MP -MD
# automatically add the -I onto each include directory
CFLAGS=-Wall --std=c++20 -Wextra -g $(foreach D,$(INCDIRS), -I$(D)) $(OPT) $(DEPFLAGS)
CPPFLAGS= ##C PreProcessor
LDFLAGS=-L/usr/local/Cellar/boost/1.79.0_2/include  ##Linker directroy of library -L
LDLIBS=   ##Linker libraries -l
CFILES=$(foreach D, $(CODEDIRS),$(wildcard $(D)/*.cpp))

OBJECTS=$(patsubst %.cpp,%.o,$(CFILES))
DEPFILES=$(patsubst %.cpp,%.d,$(CFILES))

#target: dependencies
#	action



all: $(BINARY)

$(BINARY): $(OBJECTS)
	$(CC) -o $@ $^


## $< first element of dependencies
## $^ all elements of dependencies
## $@ target
%.o:%.cpp
	$(CC) $(CFLAGS) -c -o $@ $^ $(LDFLAGS)

reduce:
	rm -f $(OBJECTS) $(DEPFILES)

clean:
	rm -f $(BINARY) $(OBJECTS) $(DEPFILES)

distribute: clean
	tar zcvf dist.tgz *

diff:
	$(info The status of the repository, and the volume of per-file changes:)
	@git status
	@git diff --stat


-include $(DEPFILES)
