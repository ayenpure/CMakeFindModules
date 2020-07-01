# Try to find VAPOR headers and libraries.
#
# Usage of this module as follows:
#
#     find_package(VAPOR)
#
# Variables used by this module, they can change the default behaviour and need
# to be set before calling find_package:
#
#  VAPOR_PREFIX         Set this variable to the root installation of
#                      libpapi if the module has problems finding the
#                      proper installation path.
#
# Variables defined by this module:
#
#  VAPOR_FOUND              System has VAPOR libraries and headers
#  VAPOR_LIBRARIES          The VAPOR library
#  VAPOR_INCLUDE_DIRS       The location of VAPOR headers

find_path(VAPOR_PREFIX
    NAMES include/vapor/
)

find_library(VAPOR_LIBRARIES
    # Pick the static library first for easier run-time linking.
    NAMES libpapi papi libpfm pfm
    HINTS ${VAPOR_PREFIX}/lib
)

find_path(VAPOR_INCLUDE_DIRS
    NAMES vapor/Advection.h
    HINTS ${VAPOR_PREFIX}/include
)

include(FindPackageHandleStandardArgs)
find_package_handle_standard_args(VAPOR DEFAULT_MSG
    VAPOR_LIBRARIES
    VAPOR_INCLUDE_DIRS
)

mark_as_advanced(
    VAPOR_PREFIX
    VAPOR_LIBRARIES
    VAPOR_INCLUDE_DIRS
)
