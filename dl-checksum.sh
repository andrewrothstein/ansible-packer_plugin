#!/usr/bin/env sh
DIR=~/Downloads

dl()
{
    local os=$1
    local mirror=$2
    local ver=$3
    local plugin=$4
    local suffix=${5:-".$1"}
    local url=${mirror}/${ver}/packer-${plugin}${suffix}
    local lfile=$DIR/packer-${plugin}.${ver}${suffix}
    if [ ! -e $lfile ];
    then
        wget -q -O $lfile $url
    fi

    printf "    # %s\n" $url
    printf "    %s: sha256:%s\n" $os $(sha256sum $lfile | awk '{print $1}')
}

dl_builder_vsphere()
{
    local plugin=$1
    local ver=$2
    local mirror=https://github.com/jetbrains-infra/packer-builder-vsphere/releases/download

    printf "packer_plugin_name: %s\n" $plugin
    printf "packer_plugin_ver: %s\n" $ver
    printf "packer_plugin_mirror: %s\n" $mirror
    printf "packer_plugin_checksums:\n"
    printf "  %s:\n" $ver
    dl windows $mirror $ver $plugin .exe
    dl linux $mirror $ver $plugin
    dl macos $mirror $ver $plugin
}

dl_builder_vsphere builder-vsphere-clone v2.3
dl_builder_vsphere builder-vsphere-iso v2.3
