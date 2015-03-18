INIT_TASKS+=bx_sln
BUILD_TASKS+=bx
CLEAN_TASKS+=bx_clean

BX_DIR=$(THIRDPARTY_DIR)bx/
BX_SLN=.build/projects/vs2013/bx.sln

bx: bx_sln
	( cd $(THIRDPARTY_DIR)/bx/ && cat ../bx.patch | patch -p1 -N )
	$(call build,$(BX_DIR),$(BX_SLN))

bx_sln:
	( cd $(BX_DIR) && $(GENIE) $(INIT_TYPE) )

bx_clean:
	$(call clean,$(BGFX_DIR),$(BGFX_SLN))
	( cd $(BX_DIR) && rm -frv .build/ )

