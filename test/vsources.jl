include("init.jl")
init8500()


@testset "Vsources" begin 

@test Vsources.Count() == 1
@test Vsources.First() == 1
@test Vsources.Next() == 0
@test Vsources.Phases() == 3
@test Vsources.Phases(Vsources.Phases()) == 0
@test Vsources.BasekV() ≋ 115.0
@test Vsources.BasekV(Vsources.BasekV()) ≋ 0.0
@test Vsources.PU() ≋ 1.05
@test Vsources.PU(Vsources.PU()) ≋ 0.0
@test Vsources.AngleDeg() ≋ 0.0
@test Vsources.AngleDeg(Vsources.AngleDeg()) ≋ 0.0
@test Vsources.Frequency() ≋ 60.0
@test Vsources.Frequency(Vsources.Frequency()) ≋ 0.0
@test Vsources.Name() == "source"
@test Vsources.Name(Vsources.Name()) == ""
@test Vsources.AllNames() == ["source"]

end # testset

