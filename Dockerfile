FROM centos:7
MAINTAINER Rafal Skolasinski <r.j.skolasinski@gmail.com>

USER root
RUN yum install -y bzip2 wget
RUN yum groupinstall -y "Development Tools"

RUN wget https://repo.continuum.io/archive/Anaconda3-2.5.0-Linux-x86_64.sh
#
RUN /bin/bash Anaconda3-2.5.0-Linux-x86_64.sh -b
RUN rm Anaconda3-2.5.0-Linux-x86_64.sh

RUN echo 'export PATH="/root/anaconda3/bin:$PATH"' > /root/.bashrc
ENV PATH /root/anaconda3/bin:$PATH
RUN conda install -y conda-build

RUN mkdir /recipes
ADD eigen3 /recipes/eigen3
ADD swig /recipes/swig
ADD petsc /recipes/petsc
ADD petsc4py /recipes/petsc4py
ADD slepc /recipes/slepc
ADD instant /recipes/instant
ADD ufl /recipes/ufl
ADD fiat /recipes/fiat
ADD ffc /recipes/ffc
ADD dolfin /recipes/dolfin
ADD fenics /recipes/fenics

WORKDIR /recipes/
RUN conda build eigen3 swig petsc petsc4py slepc instant ufl fiat ffc dolfin fenics --python 2.7


RUN mkdir /output
ADD copy.sh /recipes/

CMD ["/bin/sh", "copy.sh"]
