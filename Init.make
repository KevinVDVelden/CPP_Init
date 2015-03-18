include Config.make

init: sln $(INIT_TASKS)

init_sln: $(INIT_TASKS)

sln:
	$(GENIE) $(INIT_TYPE)

build: $(BUILD_TASKS)
	$(call build,.,build/Explosives.sln)

clean: $(CLEAN_TASKS)
	$(GENIE) clean
