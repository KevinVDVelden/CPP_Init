INIT_TASKS+=bgfx_sln
BUILD_TASKS+=bgfx
CLEAN_TASKS+=bgfx_clean

BGFX_DIR=$(THIRDPARTY_DIR)bgfx/
BGFX_SLN=.build/projects/vs2013/bgfx.sln

bgfx: bgfx_sln
	$(call build,$(BGFX_DIR),$(BGFX_SLN))

bgfx_sln:
	( cd $(BGFX_DIR) && $(GENIE) --with-tools $(INIT_TYPE) )

bgfx_clean:
	$(call clean,$(BGFX_DIR),$(BGFX_SLN))
	( cd $(BGFX_DIR) && rm -frv .build/ )

