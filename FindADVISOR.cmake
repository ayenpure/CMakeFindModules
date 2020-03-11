# Try to find ADVISOR headers and libraries.
#
# Usage of this module as follows:
#
#     find_package(ADVISOR)
#
# Variables used by this module, they can change the default behaviour and need
# to be set before calling find_package:
#
#  ADVISOR_PREFIX      Set this variable to the root installation of
#                      intel advisor if the module has problems finding the
#                      proper installation path.
#
# Variables defined by this module:
#
#  ADVISOR_FOUND              System has ADVISOR libraries and headers
#  ADVISOR_LIBRARIES          The ADVISOR library
#  ADVISOR_INCLUDE_DIR       The location of ADVISOR headers

find_path(ADVISOR_PREFIX
    NAMES include/advisor-annotate.h
)

# Don't know which libraries are required.

find_library(ADVISOR_LIBRARIES
    # Pick the static library first for easier run-time linking.
    NAMES libadvisor.so libadvisor.a advisor
    HINTS ${ADVISOR_PREFIX}/lib64
)

find_path(ADVISOR_INCLUDE_DIR
    NAMES advisor-annotate.h
    HINTS ${ADVISOR_PREFIX}/include
)

include(FindPackageHandleStandardArgs)
find_package_handle_standard_args(ADVISOR DEFAULT_MSG
    ADVISOR_LIBRARIES
    ADVISOR_INCLUDE_DIR
)

mark_as_advanced(
    ADVISOR_PREFIX
    ADVISOR_LIBRARIES
    ADVISOR_INCLUDE_DIR
)
