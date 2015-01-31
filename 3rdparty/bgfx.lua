configuration {}

local BGFX = PROJECT_THIRD_PARTY_DIR .. "bgfx/"
includedirs ( BGFX .. "include/" )
includedirs ( BGFX .. "3rdparty/" )

libdirs { BGFX .. ".build/win32_vs2013/bin/" }

links "psapi"

configuration { "Release" }
    links "bgfxRelease"

configuration { "Debug" }
    links "bgfxDebug"

configuration { "vs*" }
    linkoptions {
        "/ignore:4199",
    }
