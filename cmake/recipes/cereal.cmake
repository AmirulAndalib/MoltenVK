# cereal (https://github.com/USCiLab/cereal)
# License: BSD-3-Clause
if(TARGET cereal::cereal)
    return()
endif()

message(STATUS "External: creating target 'cereal::cereal'")

# Read Git commit hash from ExternalRevisions file
file(READ "${PROJECT_SOURCE_DIR}/ExternalRevisions/cereal_repo_revision" CEREAL_COMMIT_HASH)
string(STRIP "${CEREAL_COMMIT_HASH}" CEREAL_COMMIT_HASH)

include(CPM)
CPMAddPackage("gh:USCiLab/cereal#${CEREAL_COMMIT_HASH}")
CPMAddPackage(
  NAME cereal
  GITHUB_REPOSITORY USCiLab/cereal
  GIT_TAG ${CEREAL_COMMIT_HASH}
  GIT_SHALLOW TRUE
  SYSTEM TRUE
  OPTIONS
    "BUILD_DOC OFF"
    "BUILD_SANDBOX OFF"
    "SKIP_PERFORMANCE_COMPARISON ON"
)