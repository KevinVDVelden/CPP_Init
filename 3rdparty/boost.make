INIT_TASKS+=boost_sln
BUILD_TASKS+=boost
CLEAN_TASKS+=boost_clean

BOOST_DIR=$(THIRDPARTY_DIR)boost/
BOOST_SLN=PCBuild/pcbuild.sln

$(BOOST_DIR)/project-config.jam: $(BOOST_DIR)
	cp $(THIRDPARTY_DIR)/boost.jam $(BOOST_DIR)/project-config.jam

$(BOOST_DIR): 
	( cd $(THIRDPARTY_DIR) && [ -f boost.tar.bz2 ] || wget 'http://downloads.sourceforge.net/project/boost/boost/1.57.0/boost_1_57_0.tar.bz2?r=http%3A%2F%2Fsourceforge.net%2Fprojects%2Fboost%2Ffiles%2Fboost%2F1.57.0%2F&ts=1426451236&use_mirror=heanet' -O boost.tar.bz2)
	( cd $(THIRDPARTY_DIR) && rm -rf boost/ )
	( cd $(THIRDPARTY_DIR) && tar xfj boost.tar.bz2 )
	( cd $(THIRDPARTY_DIR) && mv boost_1_57_0/ boost/ )
	( cd $(THIRDPARTY_DIR)/boost/ && chmod +x ./bootstrap.bat )
	( cd $(THIRDPARTY_DIR)/boost/ && ./bootstrap.bat )

boost_sln: $(BOOST_DIR)

boost: boost_sln
	cp $(THIRDPARTY_DIR)/boost.jam $(BOOST_DIR)/project-config.jam
	( cd $(BOOST_DIR) && ./b2 link=static runtime-link=static variant=debug,release runtime-debugging=off,on -j 8 --with-python )

boost_clean:
	( rm -rfv $(BOOST_DIR) )

