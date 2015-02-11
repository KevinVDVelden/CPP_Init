solution "Explosives"
    location "build"

    flags {
        "StaticRuntime",
        "NoPCH",
        "NativeWChar",
        "NoRTTI",
        "NoExceptions",
        "Symbols",
    }
    defines {
        "WIN32",
        "_WIN32",
        "_HAS_EXCEPTIONS=0",
        "_HAS_ITERATOR_DEBUGGING=0",
        "_SCL_SECURE=0",
        "_SECURE_SCL=0",
        "_SCL_SECURE_NO_WARNINGS",
        "_CRT_SECURE_NO_WARNINGS",
        "_CRT_SECURE_NO_DEPRECATE",
    }
    buildoptions {
        "/Oy-", -- Suppresses creation of frame pointers on the call stack.
    }

    configurations { "Debug", "Release" }

    language "C++"

    PROJECT_DIR = (path.getabsolute(".") .. "/")
    PROJECT_BUILD_DIR = (PROJECT_DIR .. ".build/" )
    PROJECT_THIRD_PARTY_DIR = (PROJECT_DIR .. "3rdparty/" )

	include_lua = os.matchfiles( PROJECT_THIRD_PARTY_DIR .. "*.lua" )
	for k,v in pairs( include_lua ) do
		dofile( v )
	end

    project "Explosives"
        kind "WindowedApp"
        location "build"

        configuration {}

        files  { "src/**.cpp", "src/**.h" }


	configuration { "Release" }
		targetdir( PROJECT_DIR .. "/Release" )
	configuration { "Debug" }
		targetdir( PROJECT_DIR .. "/Debug" )
