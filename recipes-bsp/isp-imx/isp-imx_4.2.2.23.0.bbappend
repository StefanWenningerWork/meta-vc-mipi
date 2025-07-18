FILESEXTRAPATHS:prepend := "${THISDIR}/${PN}/:"

LIC_FILES_CHKSUM += "file://EULA;md5=5a0bf11f745e68024f37b4724a5364fe"

SRC_URI += "file://EULA"

unpack_EULA() {
    install -m 0644 ${WORKDIR}/EULA ${S}/EULA
}

do_unpack:append() {
    bb.build.exec_func('unpack_EULA', d)
}
