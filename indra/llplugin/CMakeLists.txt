# -*- cmake -*-

project(llplugin)

if (WORD_SIZE EQUAL 64)
    set(REQUIRE_PIC)
endif(WORD_SIZE EQUAL 64)

include(00-Common)
include(LLCommon)
include(LLImage)
include(LLMath)
include(LLMessage)
include(LLRender)
include(LLXML)
include(LLWindow)

include_directories(
    ${LLCOMMON_INCLUDE_DIRS}
    ${LLIMAGE_INCLUDE_DIRS}
    ${LLMATH_INCLUDE_DIRS}
    ${LLMESSAGE_INCLUDE_DIRS}
    ${LLRENDER_INCLUDE_DIRS}
    ${LLXML_INCLUDE_DIRS}
    ${LLWINDOW_INCLUDE_DIRS}
    )

set(llplugin_SOURCE_FILES
    llpluginclassmedia.cpp
    llplugininstance.cpp
    llpluginmessage.cpp
    llpluginmessagepipe.cpp
    llpluginprocesschild.cpp
    llpluginprocessparent.cpp
    llpluginsharedmemory.cpp
    )

set(llplugin_HEADER_FILES
    CMakeLists.txt

    llpluginclassmedia.h
    llpluginclassmediaowner.h
    llplugininstance.h
    llpluginmessage.h
    llpluginmessageclasses.h
    llpluginmessagepipe.h
    llpluginprocesschild.h
    llpluginprocessparent.h
    llpluginsharedmemory.h
    )

set_source_files_properties(${llplugin_HEADER_FILES}
                            PROPERTIES HEADER_FILE_ONLY TRUE)

if(WORD_SIZE EQUAL 64)
	if(WINDOWS)
		add_definitions(/FIXED:NO)
	else(WINDOWS) # not windows therefore gcc LINUX and DARWIN
		add_definitions(-fPIC)
	endif(WINDOWS)
endif (WORD_SIZE EQUAL 64)

list(APPEND llplugin_SOURCE_FILES ${llplugin_HEADER_FILES})

add_library (llplugin ${llplugin_SOURCE_FILES})

add_dependencies(llplugin
  prepare
)

add_subdirectory(slplugin)
