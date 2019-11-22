#! /usr/bin/env bash
# http://redsymbol.net/articles/unofficial-bash-strict-mode/
set -euox pipefail
IFS=$'\n\t'

function usage {
    cat << EOF
Usage: $0 <url> <node-name> <authentication>

Example:
    $0 http://localhost:8080 foobar admin:6e2d443b51884e46b434248c6504ba48
EOF
exit 1

}

if [[ -z ${1:-} ]]; then
    usage
fi
url=$1

if [[ -z ${2:-} ]]; then
    usage
fi
node=$2

if [[ -z ${3:-} ]]; then
    usage
fi
auth=$3

if [[ ! -f agent.jar ]]; then
    wget --quiet $url/jnlpJars/agent.jar
fi

if ! command -v java; then
    echo 'Error, java not found'
    exit 1
fi

secret=$(curl -u $auth $url/computer/$node/slave-agent.jnlp | sed "s/.*<application-desc main-class=\"hudson.remoting.jnlp.Main\"><argument>\([a-z0-9]*\).*/\1/")
java -jar agent.jar -jnlpUrl $url/computer/$node/slave-agent.jnlp -workDir "/tmp/foo" -secret $secret


exit 0
