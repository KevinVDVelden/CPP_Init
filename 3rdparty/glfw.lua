configuration {}

local GLFW = PROJECT_THIRD_PARTY_DIR .. "glfw/"
includedirs ( GLFW .. "include/" )

configuration { "Release" }
    libdirs { GLFW .. "src/Release/" }
configuration { "Debug" }
    libdirs { GLFW .. "src/Debug/" }

links "glfw3"
links "opengl32"
