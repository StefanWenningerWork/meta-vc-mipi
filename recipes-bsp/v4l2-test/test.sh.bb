# Copyright 2024-2025 Vision Components GmbH
DESCRIPTION = "Test script for NXP i.MX8M Plus soms by using v4l2-test"
LICENSE = "MIT"
LIC_FILES_CHKSUM = "file://${COREBASE}/meta/files/common-licenses/MIT;md5=0835ade698e0bcf8506ecda2f7b4f302"
SECTION = "utils"

SRC_URI += "git://github.com/VC-MIPI-modules/vc_mipi_nxp.git;protocol=https;branch=develop"
SRCREV = "${AUTOREV}"

S = "${WORKDIR}/git"

do_install() {
    install -d ${D}${ROOT_HOME}
    install -m 0755 ${S}/scripts/test.sh ${D}${ROOT_HOME}
}

FILES:${PN} = " ${ROOT_HOME}/test.sh"
RDEPENDS:${PN} += "bash"