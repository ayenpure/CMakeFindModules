# Try to find OMP headers and libraries.
#
# Usage of this module as follows:
#
#     find_package(OMP)
#
# Variables used by this module, they can change the default behaviour and need
# to be set before calling find_package:
#
#  OMP_PREFIX         Set this variable to the root installation of
#                      libpapi if the module has problems finding the
#                      proper installation path.
#
# Variables defined by this module:
#
#  OMP_FOUND              System has OMP libraries and headers
#  OMP_LIBRARIES          The OMP library
#  OMP_INCLUDE_DIRS       The location of OMP headers

find_path(OMP_PREFIX
    NAMES include lib
    NO_DEFAULT_PATH
#    DOC "Path to the root directory of the OMP installation"
)

find_path(OMP_INCLUDE_DIR
    NAMES omp.h
    HINTS ${OMP_PREFIX}/include
#    DOC "Path to the OMP include directory [should autocomplete given prefix]"
)

find_library(OMP NAMES omp libomp HINTS ${OMP_PREFIX}/lib)

include(FindPackageHandleStandardArgs)
find_package_handle_standard_args(OMP DEFAULT_MSG
  OMP OMP_INCLUDE_DIR
)

mark_as_advanced(
    OMP_PREFIX OMP OMP_INCLUDE_DIR
)

set(OMP_INCLUDE ${OMP_INCLUDE_DIR})
set(OMP_LIBRARY ${OMP})
