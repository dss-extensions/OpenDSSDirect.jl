
init8500()


@testset "Vsources" begin

@test Vsources.Count() == 1
@test Vsources.First() == 1
@test Vsources.Next() == 0
@test Vsources.Phases() == 3
@test Vsources.Phases(Vsources.Phases()) == nothing
@test Vsources.BasekV() ≋ 115.0
@test Vsources.BasekV(Vsources.BasekV()) == nothing
@test Vsources.PU() ≋ 1.05
@test Vsources.PU(Vsources.PU()) == nothing
@test Vsources.AngleDeg() ≋ 0.0
@test Vsources.AngleDeg(Vsources.AngleDeg()) == nothing
@test Vsources.Frequency() ≋ 60.0
@test Vsources.Frequency(Vsources.Frequency()) == nothing
@test Vsources.Name() == "source"
@test Vsources.Name(Vsources.Name()) == nothing
@test Vsources.AllNames() == ["source"]

arr = String[]
for i in OpenDSSDirect.EachMember(Vsources); push!(arr, Vsources.Name()); end
for (i, n) in enumerate(OpenDSSDirect.EachMember(Vsources, Vsources.Name))
    @test n == arr[i]
end
@test arr == Vsources.AllNames()
@test length(arr) == length(OpenDSSDirect.EachMember(Vsources))

end # testset

