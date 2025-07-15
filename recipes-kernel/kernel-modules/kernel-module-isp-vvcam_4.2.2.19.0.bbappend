FILESEXTRAPATHS:prepend := "${THISDIR}/${PN}:"

SRC_URI += "\
    file://0001-Added-Vision-Components-MIPI-CSI-2-driver.patch;patchdir=../.. \
    git://github.com/VC-MIPI-modules/vc_mipi_nxp.git;protocol=https;branch=develop;name=vc_mipi_nxp;destsuffix=vc_mipi_nxp \
    git://github.com/VC-MIPI-modules/vc_mipi_core.git;protocol=https;branch=nxp/develop;name=vc_mipi_core;destsuffix=vc_mipi_core \
"

SRCREV_vc_mipi_nxp = "${AUTOREV}"
SRCREV_vc_mipi_core = "${AUTOREV}"
SRCREV_FORMAT = "vc_mipi_nxp_vc_mipi_core"

DRV_DIR = "${S}/sensor/vc-mipi-vvcam"

unpack_driver() {
    install -d ${DRV_DIR}
    install -m 0644 ${WORKDIR}/vc_mipi_nxp/src/vc_mipi_camera.c ${DRV_DIR}
    install -m 0644 ${WORKDIR}/vc_mipi_core/vc_mipi_core.c ${DRV_DIR}
    install -m 0644 ${WORKDIR}/vc_mipi_core/vc_mipi_core.h ${DRV_DIR}
    install -m 0644 ${WORKDIR}/vc_mipi_core/vc_mipi_modules.c ${DRV_DIR}
    install -m 0644 ${WORKDIR}/vc_mipi_core/vc_mipi_modules.h ${DRV_DIR}
}

do_unpack:append() {
    bb.build.exec_func('unpack_driver', d)
}