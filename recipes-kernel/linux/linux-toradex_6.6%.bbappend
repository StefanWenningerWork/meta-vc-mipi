FILESEXTRAPATHS:prepend := "${THISDIR}/${PN}:"

SRC_URI += "file://0002-media-imx8-Added-missing-pixelformats.patch"
SRC_URI += "file://0003-media-imx8-Fixed-missing-pixelformat-negotiation-bet.patch"
SRC_URI += "file://0004-media-imx8-Added-v4l2-controls-to-csis-driver-for-ad.patch"