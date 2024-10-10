# API

## Quick Start - isosurface

Given 3D levelset data such as a CT scan, we can do:

```julia
using Meshing

A = rand(50,50,50) # 3D Matrix

points,faces = isosurface(A)
```

An iso-level is specified within the algorithm specification as follows:

```julia
using Meshing

A = rand(50,50,50) # 3D Matrix

points,faces = isosurface(A, MarchingCubes(iso=1))
```

## Isosurface

`isosurface` is the common and generic API for isosurface extraction with any type of abstract vector/vertex/face type.

```@docs
isosurface
```

## Meshing Algorithms

Two meshing algorithms exist:

* `MarchingCubes()`
* `MarchingTetrahedra()`

Each takes optional `iso` and `eps` parameters, e.g. `MarchingCubes(iso=0.0,eps=1e-6)`.

Here `iso` controls the offset for the boundary detection. By default this is set to 0. `eps` is the detection tolerance for a voxel edge intersection.

Users must construct an algorithm type and use it as an argument to a GeometryTypes mesh call or `isosurface` call.

Visual Comparison:
From left: Marching Cubes, Naive Surface Nets, Marching Tetrahedra

![comparison](./img/comparison.png)

```@docs
MarchingCubes
MarchingTetrahedra
Meshing.AbstractMeshingAlgorithm
```
