#!/bin/bash

usage() {
	echo "Usage: $0 [options]"
	echo ""
	echo "Builds of flashes package."
	echo ""
	echo "Supported options:"
        echo "-h, --help                Show this help text"
        echo "-b, --build               Build"
        echo "-f, --flash               Flash"
}

build() {
#     source /opt/fslc-xwayland/4.0/environment-setup-armv8a-fslc-linux
#     export KERNEL_SOURCE_DIR=/home/peter/drivers/variscite/kirkstone/local_repos/linux-imx
#     ./build-all-vvcam.sh
}

flash() {
	scp sensor/vc-mipi-vvcam/vc-mipi-vvcam.ko root@imx8mp-var-dart:/lib/modules/5.15.71-imx8mp+g4798216bf2d2/extra/sensor/vc-mipi-vvcam
	# scp -r modules/vc-mipi-vvcam.ko root@imx8mp-var-dart:/lib/modules/5.15.71-imx8mp+gf51d27653df0/extra/sensor/vc-mipi-vvcam
}

while [ $# != 0 ] ; do
	option="$1"
	shift

	case "${option}" in
    -b|--build)
		build
		;;
    -f|--flash)
		flash
		;;
	-h|--help)
		usage
		exit 0
		;;
	*)
		echo "Unknown option ${option}"
		exit 1
		;;
	esac
done