#! /bin/bash

set -e

function install_tool {
    TOOL=$1
    VERSION=$2

    echo "Installing ${TOOL}-${VERSION}..."

    cd /tmp/
    sudo rm -rf /tmp/${TOOL} /tmp/${TOOL}.zip
    curl -sSL https://releases.hashicorp.com/${TOOL}/${VERSION}/${TOOL}_${VERSION}_linux_amd64.zip -o ${TOOL}.zip
    unzip -o ${TOOL}.zip
    sudo chmod +x ${TOOL}
    sudo mv ${TOOL} /usr/bin/${TOOL}
    sudo mkdir -p /etc/${TOOL}.d
    sudo chmod a+w /etc/${TOOL}.d
    sudo rm -rf /tmp/${TOOL} /tmp/${TOOL}.zip
    echo "Installation of ${TOOL}-${VERSION} is complete"
}

install_tool "nomad" "0.8.7"
install_tool "consul" "1.4.0"
install_tool "vault" "1.0.2"

echo "Installing http-echo"
curl -sSL https://github.com/hashicorp/http-echo/releases/download/v0.2.3/http-echo_0.2.3_linux_amd64.zip -o http-echo.zip
unzip http-echo.zip
sudo mv http-echo /usr/local/bin
