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
    NAMES include bin lib
    PATHS /usr/local/likwid
#   DOC "Path to the root directory of the LIKWID installation"
)

find_path(LIKWID_INCLUDE_DIR
    NAMES likwid.h
    HINTS ${LIKWID_PREFIX}/include
#    DOC "Path to the LIKWID include directory [should autocomplete given prefix]"
)

find_library(LIKWIDHW-LOC NAMES likwid-hwloc liblikwid-hwloc HINTS ${LIKWID_PREFIX}/lib)
find_library(LIKWIDLUA    NAMES likwid-lua liblikwid-lua HINTS ${LIKWID_PREFIX}/lib)
find_library(LIKWIDPIN    NAMES likwidpin liblikwidpin HINTS ${LIKWID_PREFIX}/lib)
find_library(LIKWID       NAMES likwid  liblikwid HINTS ${LIKWID_PREFIX}/lib)

include(FindPackageHandleStandardArgs)
find_package_handle_standard_args(LIKWID DEFAULT_MSG
  LIKWIDHW-LOC LIKWIDLUA LIKWIDPIN LIKWID LIKWID_INCLUDE_DIR
)

mark_as_advanced(
    LIKWID_PREFIX FLOW COMMON PARAMS RENDER VDC WASP LIKWID_INCLUDE_DIR
)

set(LIKWID_INCLUDE_DIRS ${LIKWID_INCLUDE_DIR})
set(LIKWID_LIBRARIES ${LIKWIDHW-LOC} ${LIKWIDLUA} ${LIKWIDPIN} ${LIKWID})
