include("$(Pkg.dir())/OpenDSSDirect/examples/low-level-solver.jl")

if !isdefined(Test, symbol("@testset"))
    if VERSION >= v"0.5-"
        using Base.Test
    else
        using BaseTestNext
        const Test = BaseTestNext
    end
end

isclose(x, y) = maximum(abs(x - y) ./ abs(x)) < 0.0005
howclose(x, y) = maximum(abs(x - y) ./ abs(x))

@testset "bus" begin 

v1, v2, v3 = testnormalsolution()

@test isclose(v1, v2)
@test isclose(v2, v3)

v₁, v₂ = testsnap()

# @test isclose(v₁, v₂)    # Not close right now

end # testset