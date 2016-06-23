# Fenics Recipes (with build on Centos 7)
This is README on my fork. Original readme is [here](source_readme.md).

Clone repo, ``cd`` into it.
=======
[![No Maintenance Intended](http://unmaintained.tech/badge.svg)](http://unmaintained.tech/)

This repository contains conda recipes for the FEniCS libraries.
The recipes work with conda-build, the build system created for
the Anaconda Python distribution.

**Note**: These recipes are no longer maintained and
[outstanding bugs](https://github.com/Juanlu001/fenics-recipes/issues)
are no longer being fixed. Please check out any of the
[project forks](https://github.com/Juanlu001/fenics-recipes/network)
and [this mailing list thread](https://groups.google.com/d/msg/fenics-support/jWuLkc9VdOE/DcXgmg1nAAAJ)
for more information.

## Installation from binstar (Linux 64bit)

Packages are generated for linux-64 in the juanlu001 binstar channel.
To install them, just type:

`$ conda install fenics --channel juanlu001`

**Note**: These binaries are portable across Linux distributions but
are compiled without VTK support. If you want plotting capabilities,
please consider local building.

## Local building

The recipes allow for building the packages locally, for later
fast installation or even redistribution.
>>>>>>> upstream/master

## Compilation inside docker iamge
Build docker image with:
```
docker build --tag "build" .
```
Building docker image includes compilation of
```
eigen3 swig petsc petsc4py slepc instant ufl fiat ffc dolfin fenics
```

Start container with:
```
docker run --name build -v ${PWD}:/output build
```
This will create ``linux-64`` folder in ``fenics-recipes`` directory and remove
it if it existed before.


You may need to fix permisions on newly created folder:
```
sudo chown -R $(id -u):$(id -u) linux-64
```
Note: you need ``sudo`` to run docker anyway

Now container can be removed with:
```
docker rm build
```


## Installing built packages
Built packages should be present in ``linux-64`` folder.
To install ``fenics`` from it:
```
conda index linux-64/
conda install -c file://${PWD}  fenics
```

## Running built docker image interactively
```
docker run -it build bash
```
