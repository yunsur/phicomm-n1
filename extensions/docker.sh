function pre_install_distribution_specific__docker() {
	display_alert "Adding Docker repository and authentication key" "/etc/apt/sources.list.d/docker.list" "info"

	# apt-key add is getting deprecated
	APT_VERSION=$(chroot "${basedir}" /bin/bash -c "apt --version | cut -d\" \" -f2")
	if linux-version compare "${APT_VERSION}" ge 2.4.1; then
		# add docker key
		mkdir -p "${basedir}"/usr/share/keyrings
		# change to binary form
		gpg --dearmor < "${SRC}"/config/docker.key > "${basedir}"/usr/share/keyrings/docker.gpg
		SIGNED_BY="[signed-by=/usr/share/keyrings/docker.gpg] "
	else
		# use old method for compatibility reasons
		cp "${SRC}"/config/docker.key "${basedir}"
		chroot "${basedir}" /bin/bash -c "cat docker.key | apt-key add - > /dev/null 2>&1"
	fi

	if [[ $DOWNLOAD_MIRROR == "china" ]]; then
		echo "deb [arch=$ARCH] ${SIGNED_BY}https://mirrors.tuna.tsinghua.edu.cn/docker-ce/linux/debian $RELEASE stable" > "${basedir}"/etc/apt/sources.list.d/docker.list
	else
		echo "deb [arch=$ARCH] ${SIGNED_BY}https://download.docker.com/linux/debian $RELEASE stable" > "${basedir}"/etc/apt/sources.list.d/docker.list
	fi
}
