include("init.jl")
init8500()


@testset "vsources" begin 

@test vsources(:Count) == 1
@test vsources(:First) == 1
@test vsources(:Next) == 0
@test vsources(:Phases) == 3
@test vsources(:Phases, vsources(:Phases)) == 0
@test vsources(:BasekV) ≈ 115.0
@test vsources(:BasekV, vsources(:BasekV)) ≈ 0.0
@test vsources(:PU) ≈ 1.05
@test vsources(:PU, vsources(:PU)) ≈ 0.0
@test vsources(:AngleDeg) ≈ 0.0
@test vsources(:AngleDeg, vsources(:AngleDeg)) ≈ 0.0
@test vsources(:Frequency) ≈ 60.0
@test vsources(:Frequency, vsources(:Frequency)) ≈ 0.0
@test vsources(:Name) == "source"
@test vsources(:Name, vsources(:Name)) == ""
@test vsources(:AllNames) == ["source"]

end # testset

