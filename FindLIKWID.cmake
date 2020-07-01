# Try to find LIKWID headers and libraries.
#
# Usage of this module as follows:
#
#     find_package(LIKWID)
#
# Variables used by this module, they can change the default behaviour and need
# to be set before calling find_package:
#
#  LIKWID_PREFIX         Set this variable to the root installation of
#                      libvariorum if the module has problems finding the
#                      proper installation path.
#
# Variables defined by this module:
#
#  LIKWID_FOUND              System has LIKWID libraries and headers
#  LIKWID_LIBRARIES          The LIKWID library
#  LIKWID_INCLUDE_DIRS       The location of LIKWID headers

find_path(LIKWID_PREFIX
    NAMES include/likwid.h
)

find_library(LIKWID_LIBRARIES
    # Pick the static library first for easier run-time linking.
    NAMES liblikwid likwid
    HINTS ${LIKWID_PREFIX}/lib
)

find_path(LIKWID_INCLUDE_DIRS
    NAMES likwid.h
    HINTS ${LIKWID_PREFIX}/include
)

include(FindPackageHandleStandardArgs)
find_package_handle_standard_args(LIKWID DEFAULT_MSG
    LIKWID_LIBRARIES
    LIKWID_INCLUDE_DIRS
)

mark_as_advanced(
    LIKWID_PREFIX_DIRS
    LIKWID_LIBRARIES
    LIKWID_INCLUDE_DIRS
)
