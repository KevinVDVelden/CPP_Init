configuration {}

local BX = PROJECT_THIRD_PARTY_DIR .. "bx/"
includedirs ( BX .. "include" )

configuration { "vs*" }
    linkoptions {
        "/ignore:4199",
    }

    includedirs ( BX .. "include/compat/msvc" )
