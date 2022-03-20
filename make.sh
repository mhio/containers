#!/usr/bin/env bash
set -ueo pipefail
dateTime(){ date -u '+%Y-%m-%dT%H:%M:%SZ'; }
rundir=$(cd -P -- "$(dirname -- "$0")" && printf '%s\n' "$(pwd -P)")
cd "$rundir"

# {make.sh user}

IMAGE_REPO="me"

run:build (){
  run:build:debian-interactive
}

run:build:debian-interactive(){
  cd "$rundir"/debian-interactive
  docker build -t "${IMAGE_REPO}/debian-interactive:11" -t "${IMAGE_REPO}/debiani" .
}

run:docker () {
  docker run \
   --interactive --tty \
   --env DEBUG=true \
   --rm \
   --name "${CONTAINER_NAME}" \
   "${IMAGE_REPO}:${IMAGE_TAG}" \
   "$@"
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

