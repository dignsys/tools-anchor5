#!/bin/bash

set -e

argc=$#
PARENT_DIR="${PWD%/*}"
CURRENT_PATH=`dirname $0`
TOOLS_PATH=`readlink -ev $CURRENT_PATH/../bin`
RESULT_DIR=`readlink -ev $CURRENT_PATH/../../result`

BOARD_SOCNAME=s5p4418
BOARD_NAME=anchor5
BOARD_PREFIX=anchor5

function run_by_usb()
{
    if [ ${BOARD_SOCNAME} == "s5p6818" ]; then
        if [ "${BOARD_NAME}" == "artik710-raptor" ]; then
            sudo ${TOOLS_PATH}/usb-downloader -t slsiap \
                 -b ${RESULT_DIR}/bl1-raptor.bin \
                 -a 0xFFFF0000 -j 0xFFFF0000
            sleep 1
            sudo ${TOOLS_PATH}/usb-downloader -t slsiap \
                 -f ${RESULT_DIR}/fip-loader-usb.img -m
        else
            sudo ${TOOLS_PATH}/usb-downloader -t slsiap \
                 -b ${RESULT_DIR}/bl1-${BOARD_PREFIX}.bin \
                 -a 0xFFFF0000 -j 0xFFFF0000
            sleep 1
            sudo ${TOOLS_PATH}/usb-downloader -t slsiap \
                 -f ${RESULT_DIR}/fip-loader-usb.img -m
        fi
    else
        if [ ${BOARD_PREFIX} == "avn" ]; then
            sudo ${TOOLS_PATH}/usb-downloader -t slsiap \
                 -b ${RESULT_DIR}/bl1-${BOARD_PREFIX}.bin \
                 -a 0xFFFF0000 -j 0xFFFF0000
            sleep 1
            sudo ${TOOLS_PATH}/usb-downloader -t slsiap \
                 -f ${RESULT_DIR}/fip-loader-usb.img -m
        else
            echo ${TOOLS_PATH}
            sudo ${TOOLS_PATH}/usb-downloader -t nxp4330 \
                 -b ${RESULT_DIR}/bl1-anchor5.bin \
                 -a 0xFFFF0000 -j 0xFFFF0000
            sleep 3
            sudo ${TOOLS_PATH}/usb-downloader -t nxp4330 \
                 -f ${RESULT_DIR}/fip-loader-usb.img -m
        fi
    fi
}

run_by_usb
