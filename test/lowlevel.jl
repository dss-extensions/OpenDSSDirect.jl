include("$(dirname(@__FILE__))/../examples/low-level-solver.jl")

isclose(x, y) = maximum(abs.(x - y) ./ abs.(x)) < 0.0006
howclose(x, y) = maximum(abs.(x - y) ./ abs.(x))

@testset "lowlevel" begin

v1, v2, v3 = testnormalsolution()

# @show howclose(v1, v2)
# @show howclose(v2, v3)

@test isclose(v1, v2)
@test isclose(v2, v3)

v₁, v₂ = testsnap()

@show howclose(v₁, v₂)    # Not close right now
@test_broken isclose(v₁, v₂)    # Not close right now

end # testset
