using Meshing
using Base.Test
using GeometryTypes

# Produce a level set function that is a noisy version of the distance from
# the origin (such that level sets are noisy spheres).
#
# The noise should exercise marching tetrahedra's ability to produce a water-
# tight surface in all cases (unlike standard marching cubes).
#
N = 10
sigma = 1.0
distance = Float32[ sqrt(Float32(i*i+j*j+k*k)) for i = -N:N, j = -N:N, k = -N:N ]
distance = distance + sigma*rand(2*N+1,2*N+1,2*N+1)

# Extract an isosurface.
#
lambda = N-2*sigma # isovalue

msh = HomogenousMesh(distance,lambda)


let
    s2 = SignedDistanceField(HyperRectangle(Vec(0,0,0.),Vec(1,1,1.))) do v
        sqrt(sum(v*v)) - 1 # sphere
    end

    msh = HomogenousMesh(s2)
    @test length(vertices(msh)) == 973
    @test length(faces(msh)) == 1830
end
