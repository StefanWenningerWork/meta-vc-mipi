FILESEXTRAPATHS:prepend := "${THISDIR}/${PN}:"

SRC_URI += "file://make.sh"

unpack() {
    install -m 0755 ${WORKDIR}/make.sh ${S}
}

do_unpack:append() {
    bb.build.exec_func('unpack', d)
}