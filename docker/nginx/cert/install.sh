#!/bin/bash

CUR_DIR=$(realpath "$(dirname "${BASH_SOURCE:-$0}")")

function acme_cert() {
    local domain_name="${1:-unknown.cc}"
    local domain_mail="${2:-unknown@unknown.com}"
    pushd "$CUR_DIR"
    git clone https://github.com/acmesh-official/acme.sh.git
    cd ./acme.sh
    ./acme.sh --install -m ${domain_mail}
    . ~/.acme.sh/acme.sh.env
    acme.sh --issue -d ${domain_name} --standalone
    mkdir ${domain_name}
    acme.sh --install-cert -d ${domain_name} --key-file ./${domain_name}/key.pem --fullchain-file ./${domain_name}/crt.pem --reloadcmd "service nginx force-reload"
    popd
}

main "$@"
