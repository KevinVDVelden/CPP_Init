configuration {}

local STACKLESS = PROJECT_THIRD_PARTY_DIR .. "stackless/"
includedirs ( STACKLESS .. "Include/")
includedirs ( STACKLESS .. "Stackless/")
includedirs ( STACKLESS .. "PC/" )

libdirs { STACKLESS .. "PCbuild/" }

configuration { "Release" }
	links "python33"
	postbuildcommands { "cp " .. STACKLESS .. "/PCbuild/python33.dll " .. PROJECT_DIR .. "/Release"  }
configuration { "Debug" }
	links "python33_d"
	postbuildcommands { "cp " .. STACKLESS .. "/PCbuild/python33_d.dll " .. PROJECT_DIR .. "/Debug" }
