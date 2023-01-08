function fetch_sources_tools__bluez_firmware() {
    fetch_from_repo "https://github.com/RPi-Distro/bluez-firmware.git" "bluez-firmware" "branch:master"
}

function post_family_tweaks__install_bluez_firmware() {
    cp "${SRC}"/cache/sources/bluez-firmware/broadcom/BCM4345C0.hcd "${SDCARD}"/lib/firmware/brcm/BCM4345C0.hcd
    cp "${SDCARD}"/lib/firmware/brcm/brcmfmac43455-sdio.txt "${SDCARD}"/lib/firmware/brcm/brcmfmac43455-sdio.phicomm,n1.txt
    cp "${SDCARD}"/lib/firmware/brcm/brcmfmac43455-sdio.bin "${SDCARD}"/lib/firmware/brcm/brcmfmac43455-sdio.phicomm,n1.bin
}
