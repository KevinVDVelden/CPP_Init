configuration {}

local STACKLESS = PROJECT_THIRD_PARTY_DIR .. "stackless/"
includedirs ( STACKLESS .. "Include/")
includedirs ( STACKLESS .. "Stackless/")
includedirs ( STACKLESS .. "PC/" )

libdirs { STACKLESS .. "PCbuild/" }

configuration { "Release" }
	links "python33"
configuration { "Debug" }
	links "python33_d"
