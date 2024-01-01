#!/bin/bash

set -ex

cd $(dirname $(dirname $(realpath "$0")))

EMAIL="nicholas.j.santos@gmail.com"

dpkg-scanpackages --multiversion . > dists/stable/Packages
gzip -k -f dists/stable/Packages

apt-ftparchive release . > dists/stable/Release
gpg --default-key "${EMAIL}" -abs -o - dists/stable/Release > dists/stable/Release.gpg
gpg --default-key "${EMAIL}" --clearsign -o - dists/stable/Release > dists/stable/InRelease
