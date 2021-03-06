#!/bin/bash
topdir=$(dirname `readlink -f $0`)
. $topdir/common.sh

nailgun_deps $WORKSPACE/requirements-eggs.txt

cd docs
make clean
make html
rsync -avz -e ssh --delete _build/html/ fjenkins@fuel-docs.vm.mirantis.net:/home/fjenkins/workspace/fuel-docs.mirantis.com/docs/_build/html/
cd $WORKSPACE
