# -*- cmake -*-
include(Prebuilt)

if (NOT STANDALONE)
  use_prebuilt_binary(vivox)
  if (LINUX)
    use_prebuilt_binary(libuuid)
    use_prebuilt_binary(fontconfig)
  endif (LINUX)
endif(NOT STANDALONE)

