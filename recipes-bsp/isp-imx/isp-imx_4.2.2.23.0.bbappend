FILESEXTRAPATHS:prepend := "${THISDIR}/${PN}/:"

LIC_FILES_CHKSUM += "file://EULA;md5=5a0bf11f745e68024f37b4724a5364fe"

SRC_URI += "file://0001-Added-VC-MIPI-CSI-2-driver.patch"
SRC_URI += "file://0001-Improve-default-settings-in-vc_mipi_dewarp_template..patch"
SRC_URI += "file://EULA"

unpack_EULA() {
    install -m 0644 ${WORKDIR}/EULA ${S}/EULA
}

do_unpack:append() {
    bb.build.exec_func('unpack_EULA', d)
}

FILES_SOLIBS_VERSIONED += " \
    ${libdir}/libvc-mipi.so \
"

do_install:append() {
    install -m 0755 ${S}/imx/vc-mipi-setup.sh ${D}/opt/imx8-isp/bin
}

RDEPENDS:${PN} += "bash" 