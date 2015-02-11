INIT_TASKS+=glfw_sln
CLEAN_TASKS+=glfw_clean
BUILD_TASKS+=glfw

GLFW_DIR=$(THIRDPARTY_DIR)glfw/
GLFW_SLN=GLFW.sln

glfw: glfw_sln
	$(call build,$(GLFW_DIR),$(GLFW_SLN))

glfw_sln:
	( cd $(GLFW_DIR) && cmake . -DUSE_MSVC_RUNTIME_LIBRARY_DLL=Off )

glfw_clean:
	$(call clean,$(GLFW_DIR),$(GLFW_SLN)


