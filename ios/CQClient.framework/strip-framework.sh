#!/bin/sh

#  strip-framework.sh
#  CQClient
#
#  Created by Sungmin Kim on 22/08/2019.
#  Copyright © 2019 Callgate. All rights reserved.

if [ "$ACTION" = "install" ]; then

    FRAMEWORK_NAME="CQClient"
    SCRIPT_FILE_NAME="strip-framework.sh"

    cd "${BUILT_PRODUCTS_DIR}/${FRAMEWORKS_FOLDER_PATH}/${FRAMEWORK_NAME}.framework"

    # Remove invalid architecture...
    ARCHS="$(lipo -info "${FRAMEWORK_NAME}" | rev | cut -d ':' -f1 | rev)"
    for ARCH in ${ARCHS}; do
        if ! [[ "${VALID_ARCHS}" == *"$ARCH"* ]]; then
            echo "removing ${ARCH}..."
            lipo -remove "${ARCH}" -output "${FRAMEWORK_NAME}" "${FRAMEWORK_NAME}" || exit 1
            rm -f "./Modules/${FRAMEWORK_NAME}.swiftmodule/${ARCH}*"
        fi
    done

    # Remove script file from framework...
    if [ -f ${SCRIPT_FILE_NAME} ]; then
        echo "removing ${SCRIPT_FILE_NAME}..."
        rm -rf "${SCRIPT_FILE_NAME}"
    fi

    # resign framework...
    /usr/bin/codesign --force --sign ${EXPANDED_CODE_SIGN_IDENTITY} ${OTHER_CODE_SIGN_FLAGS} --preserve-metadata=identifier,entitlements,flags "${BUILT_PRODUCTS_DIR}/${FRAMEWORKS_FOLDER_PATH}/${FRAMEWORK_NAME}.framework"

fi
