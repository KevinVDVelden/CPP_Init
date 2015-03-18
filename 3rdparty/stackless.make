INIT_TASKS+=stackless_sln
BUILD_TASKS+=stackless
CLEAN_TASKS+=stackless_clean

STACKLESS_DIR=$(THIRDPARTY_DIR)stackless/
STACKLESS_SLN=PCBuild/pcbuild.sln

$(STACKLESS_DIR):
	( cd $(THIRDPARTY_DIR) && [ -f stackless-335-export.tar.bz2 ] || wget http://www.stackless.com/binaries/stackless-335-export.tar.bz2 )
	( cd $(THIRDPARTY_DIR) && rm -rf stackless/ )
	( cd $(THIRDPARTY_DIR) && tar xfj stackless-335-export.tar.bz2 )
	( cd $(THIRDPARTY_DIR) && mv stackless-335-export/ stackless/ )
	( cd $(THIRDPARTY_DIR)/stackless/ && cat ../stackless.patch | patch -p1 )

ifeq ($(OS),Windows_NT)
stackless_sln: $(STACKLESS_DIR)
else
stackless_sln: $(STACKLESS_DIR)
	( cd $(STACKLESS_DIR) && ./configure --enable-shared --with )
endif

stackless: stackless_sln
	$(call build,$(STACKLESS_DIR),$(STACKLESS_SLN))

stackless_clean:
	( rm -rfv $(STACKLESS_DIR) )

debug_post::
	cp $(STACKLESS_DIR)/PCbuild/python33.dll $(PROJECT_DIR)/Debug/

release_post::
	cp $(STACKLESS_DIR)/PCbuild/python33.dll $(PROJECT_DIR)/Release/
