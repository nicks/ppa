#!/bin/bash

set -ex

cd $(dirname $(dirname $(realpath "$0")))

EMAIL="nicholas.j.santos@gmail.com"

# For reasons I don't understand, Packages
# and Releases need different root directories.
# Maybe related to using a path in nick-santos.list?
dpkg-scanpackages --multiversion dists/stable > dists/stable/Packages
gzip -k -f dists/stable/Packages

cd dists/stable
apt-ftparchive release . > Release
gpg --default-key "${EMAIL}" -abs -o - Release > Release.gpg
gpg --default-key "${EMAIL}" --clearsign -o - Release > InRelease
