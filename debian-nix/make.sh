#!/usr/bin/env bash
set -ueo pipefail
dateTime(){ date -u '+%Y-%m-%dT%H:%M:%SZ'; }
rundir=$(cd -P -- "$(dirname -- "$0")" && printf '%s\n' "$(pwd -P)")
cd "$rundir"

# {make.sh user}

CONTAINER_NAME="nixos"
IMAGE_NAME="${CONTAINER_NAME}"
IMAGE_REPO="me/${IMAGE_NAME}"
IMAGE_TAG="latest"

# Examples
run:build(){
  run:docker:build
}
run:docker:build () {
  docker build -t "${IMAGE_REPO}:${IMAGE_TAG}"  .
}
run:docker(){
  docker run -ti --name "${CONTAINER_NAME}" "${IMAGE_REPO}:${IMAGE_TAG}"
}

# {make.sh common}

run:help(){
  set +x
  echo "Commands:"
  declare -F | awk '/^declare -f run:/ { printf("  %s\n", substr($0,16)); }'
  exit 1
}
[ -z "${1:-}" ] && run:help
cmd=$1
shift
set -x
run:"$cmd" "$@"

