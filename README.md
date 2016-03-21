# Fenics Recipes (with build on Centos 7)
This is README on my fork. Original readme is [here](source_readme.md).

Clone repo, ``cd`` into it.

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
