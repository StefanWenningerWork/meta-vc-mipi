# Copyright 2024-2025 Vision Components GmbH
DESCRIPTION = "Test and example application to use v4l2 cameras"
LICENSE = "MIT"
LIC_FILES_CHKSUM = "file://${COREBASE}/meta/files/common-licenses/MIT;md5=0835ade698e0bcf8506ecda2f7b4f302"
SECTION = "utils"

FILESEXTRAPATHS:prepend = "${THISDIR}/${PN}:"

SRC_URI += "git://github.com/pmliquify/v4l2-test.git;protocol=https;branch=develop"
SRCREV = "${AUTOREV}"

SRC_URI += "file://test.sh"

S = "${WORKDIR}/git"

inherit cmake

do_install:append() {
    install -d ${D}${ROOT_HOME}
    install -m 0755 ${WORKDIR}/test.sh ${D}${ROOT_HOME}
}

FILES:${PN}:append = " ${ROOT_HOME}/test.sh"
RDEPENDS:${PN} += "bash"