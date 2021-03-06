#!/usr/bin/env bash
set -ueo pipefail
dateTime(){ date -u '+%Y-%m-%dT%H:%M:%SZ'; }
rundir=$(cd -P -- "$(dirname -- "$0")" && printf '%s\n' "$(pwd -P)")
cd "$rundir"

# {make.sh user}

IMAGE_REPO="me"

run:build (){
  run:build:debian-interactive
  run:build:debian-nix
  run:build:debian-zsh
}

run:build:debian-interactive(){
  docker pull debian:11
  cd "$rundir"/debian-interactive
  docker build -t "${IMAGE_REPO}/debian-interactive:11" -t "mdebi" .
}
run:build:debian-nix () {
  cd "$rundir"/debian-nix
  docker build -t "${IMAGE_REPO}/debian-nix:11" -t "mdebn" .
}
run:build:debian-zsh () {
  cd "$rundir"/debian-zsh
  docker build -t "${IMAGE_REPO}/debian-zsh:11" -t "mdebz" .
}

run:docker(){
  docker run -ti --name "${CONTAINER_NAME}" "${IMAGE_REPO}:${IMAGE_TAG}"
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

