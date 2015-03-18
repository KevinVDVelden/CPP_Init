function os.capture(cmd, raw)
    local f = assert(io.popen(cmd, 'r'))
    local s = assert(f:read('*a'))
    f:close()
    if raw then return s end
    s = string.gsub(s, '^%s+', '')
    s = string.gsub(s, '%s+$', '')
    s = string.gsub(s, '[\n\r]+', ' ')
    return s
end

solution "Explosives"
    location "build"
    local MAKECOMMAND = os.capture( "cygpath -m " .. os.capture( "which make" ) )
    local PWD = os.capture( "cygpath -m " .. os.capture( "pwd" ) )

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
        "_SCL_SECURE=0",
        "_SECURE_SCL=0",
        "_SCL_SECURE_NO_WARNINGS",
        "_CRT_SECURE_NO_WARNINGS",
        "_CRT_SECURE_NO_DEPRECATE",
        "BOOST_ALL_NO_LIB",
    }
    buildoptions {
        "/Oy-", -- Suppresses creation of frame pointers on the call stack.
    }

    defines {
        "APPLICATIONDIR_SUBPATH_COUNT=1"
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
        includedirs ( "src" )


	configuration { "Release" }
		targetdir( PROJECT_DIR .. "/Release" )

        prebuildcommands { MAKECOMMAND .. " -f Build.make release" }
        postbuildcommands { MAKECOMMAND .. " -f Build.make release_post" }

	configuration { "Debug" }
		targetdir( PROJECT_DIR .. "/Debug" )

        prebuildcommands { "cd " .. PWD .. " && " .. MAKECOMMAND .. " -f Build.make debug" }
        postbuildcommands { "cd " .. PWD .. " && " .. MAKECOMMAND .. " -f Build.make debug_post" }

    configuration { "*" }
        debugdir ( PROJECT_DIR )
