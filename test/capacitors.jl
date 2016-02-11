include("init.jl")
init8500()


@testset "capacitors" begin 

@test capacitors(:First) == 1
@test capacitors(:Next) == 2
@test capacitors(:Count) == 10
@test capacitors(:NumSteps) == 1
@test capacitors(:NumSteps, capacitors(:NumSteps)) == 0
@test capacitors(:IsDelta) == false
@test capacitors(:IsDelta, capacitors(:IsDelta)) == 0
@test capacitors(:AddStep) == 0
@test capacitors(:SubtractStep) == 0
@test capacitors(:AvailableSteps) == 1
@test capacitors(:Open) == 0
@test capacitors(:Close) == 0
@test capacitors(:kV) ≈ 7.2
@test capacitors(:kV, capacitors(:kV)) ≈ 0.0
@test capacitors(:kvar) ≈ 300.0
@test capacitors(:kvar, capacitors(:kvar)) ≈ 0.0
@test capacitors(:Name) == "capbank2b"
@test capacitors(:Name, capacitors(:Name)) == "0"
@test capacitors(:AllNames)[end] == "capbank3"
@test capacitors(:States) == [1]

end # testset