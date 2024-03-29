INCLUDE(FindPkgConfig)
PKG_CHECK_MODULES(PC_MAXFREQ maxfreq)

FIND_PATH(
    MAXFREQ_INCLUDE_DIRS
    NAMES maxfreq/api.h
    HINTS $ENV{MAXFREQ_DIR}/include
        ${PC_MAXFREQ_INCLUDEDIR}
    PATHS ${CMAKE_INSTALL_PREFIX}/include
          /usr/local/include
          /usr/include
)

FIND_LIBRARY(
    MAXFREQ_LIBRARIES
    NAMES gnuradio-maxfreq
    HINTS $ENV{MAXFREQ_DIR}/lib
        ${PC_MAXFREQ_LIBDIR}
    PATHS ${CMAKE_INSTALL_PREFIX}/lib
          ${CMAKE_INSTALL_PREFIX}/lib64
          /usr/local/lib
          /usr/local/lib64
          /usr/lib
          /usr/lib64
)

INCLUDE(FindPackageHandleStandardArgs)
FIND_PACKAGE_HANDLE_STANDARD_ARGS(MAXFREQ DEFAULT_MSG MAXFREQ_LIBRARIES MAXFREQ_INCLUDE_DIRS)
MARK_AS_ADVANCED(MAXFREQ_LIBRARIES MAXFREQ_INCLUDE_DIRS)

