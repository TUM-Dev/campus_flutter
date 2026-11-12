#!/bin/sh
set -eu

CRASHLYTICS_DIR="${BUILD_DIR%/Build/*}/SourcePackages/checkouts/firebase-ios-sdk/Crashlytics"

# Firebase's standard build-phase script uploads the Runner symbols.
"${CRASHLYTICS_DIR}/run"

# Flutter's AOT symbols are separate from Runner and are absent in debug builds.
FLUTTER_DSYM="${DWARF_DSYM_FOLDER_PATH}/App.framework.dSYM"
if [ -d "${FLUTTER_DSYM}" ]; then
  "${CRASHLYTICS_DIR}/upload-symbols" --build-phase --validate \
    -gsp "${TARGET_BUILD_DIR}/${UNLOCALIZED_RESOURCES_FOLDER_PATH}/GoogleService-Info.plist" \
    -p ios "${FLUTTER_DSYM}"
  "${CRASHLYTICS_DIR}/upload-symbols" --build-phase \
    -gsp "${TARGET_BUILD_DIR}/${UNLOCALIZED_RESOURCES_FOLDER_PATH}/GoogleService-Info.plist" \
    -p ios "${FLUTTER_DSYM}"
fi
