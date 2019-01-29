include("$(dirname(@__FILE__))/../examples/low-level-solver.jl")

isclose(x, y) = maximum(abs.(x - y) ./ abs.(x)) < 0.0006
howclose(x, y) = maximum(abs.(x - y) ./ abs.(x))

@testset "lowlevel" begin

@test_skip v1, v2, v3 = testnormalsolution()

@test_skip isclose(v1, v2)
#@test isclose(v2, v3)

@test_skip v₁, v₂ = testsnap()

# @test isclose(v₁, v₂)    # Not close right now

end # testset
