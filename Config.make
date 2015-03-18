#Configuration
PROJECT_DIR=$(shell pwd)
THIRDPARTY_DIR=$(PROJECT_DIR)/3rdparty/

#Magic
PLATFORM=Unknown
EXECUTABLE_EXTENSION=
INIT_TYPE=make

define build =
( cd $(1) && $(MAKE) $(2) )
endef

define clean =
( cd $(1) && $(MAKE) clean )
endef

ifeq ($(OS),Windows_NT)
	PLATFORM=windows
	EXECUTABLE_EXTENSION=.exe
	INIT_TYPE=vs2013
	BUILD_COMMAND=MSBuild.exe /maxcpucount

	MSBUILD=MSBuild.exe /maxcpucount

override define build =
( cd $(1) && $(MSBUILD) /p:Configuration=Release $(2) || true )
( cd $(1) && $(MSBUILD) /p:Configuration=Debug $(2) || true )
endef
override define clean =
( cd $(1) && $(MSBUILD) /t:Clean /p:Configuration=Release $(2) || true )
endef
else
	UNAME_S := $(shell uname -s)
	ifeq ($(UNAME_S),Linux)
		PLATFORM=linux
	endif
	ifeq ($(UNAME_S),Darwin)
		PLATFORM=darwin
	endif
endif

GENIE=$(shell pwd)/tools/genie/$(PLATFORM)/genie$(EXECUTABLE_EXTENSION)

INIT_TASKS=
BUILD_TASKS=
CLEAN_TASKS=

include $(THIRDPARTY_DIR)/*.make
