configuration {}

local BOOST = PROJECT_THIRD_PARTY_DIR .. "boost/"
includedirs ( BOOST )

libdirs { BOOST .. "stage/lib/" }

defines {
    "BOOST_ALL_STATIC_LINK",
    "BOOST_PYTHON_STATIC_LIB",
}

configuration { "debug" }
    links "libboost_python3-vc120-mt-sd-1_57"

configuration { "release" }
    links "libboost_python3-vc120-mt-s-1_57"
