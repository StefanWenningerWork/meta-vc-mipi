FILESEXTRAPATHS:prepend := "${THISDIR}/${PN}/:"

SRC_URI += "file://0001-Added-VC-MIPI-CSI-2-driver.patch"
SRC_URI += "file://0001-Improve-default-settings-in-vc_mipi_dewarp_template..patch"
SRC_URI += "file://0001-Fix-vc-mipi-setup.sh-to-be-more-generic-and-usable-o.patch"

FILES_SOLIBS_VERSIONED += " \
    ${libdir}/libvc-mipi.so \
"

do_install:append() {
    install -m 0755 ${S}/imx/vc-mipi-setup.sh ${D}/opt/imx8-isp/bin
}

RDEPENDS:${PN} += "bash" 