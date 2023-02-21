#!/bin/bash

set -ex

cd $(dirname $(dirname $(realpath "$0")))

EMAIL="nicholas.j.santos@gmail.com"

dpkg-scanpackages --multiversion . > Packages
gzip -k -f Packages

apt-ftparchive release . > Release
gpg --default-key "${EMAIL}" -abs -o - Release > Release.gpg
gpg --default-key "${EMAIL}" --clearsign -o - Release > InRelease
