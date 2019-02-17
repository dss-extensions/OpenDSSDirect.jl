
init8500()


@testset "Capacitors" begin

@test Capacitors.First() == 1
@test Capacitors.Next() == 2
@test Capacitors.Count() == 10
@test Capacitors.NumSteps() == 1
@test Capacitors.NumSteps(Capacitors.NumSteps()) == nothing
@test Capacitors.IsDelta() == false
@test Capacitors.IsDelta(Capacitors.IsDelta()) == nothing
@test Capacitors.AddStep() == 0
@test Capacitors.SubtractStep() == 0
@test Capacitors.AvailableSteps() == 1
@test Capacitors.Open() == nothing
@test Capacitors.Close() == nothing
@test Capacitors.kV() ≋ 7.2
@test Capacitors.kV(Capacitors.kV()) == nothing
@test Capacitors.kvar() ≋ 300.0
@test Capacitors.kvar(Capacitors.kvar()) == nothing
@test Capacitors.Name() == "capbank2b"
@test Capacitors.Name(Capacitors.Name()) == nothing
@test Capacitors.AllNames()[end] == "capbank3"
@test Capacitors.States() == [1]
@test Capacitors.States(Capacitors.States()) == nothing

arr = String[]
for i in OpenDSSDirect.EachMember(Capacitors); push!(arr, Capacitors.Name()); end
for (i, n) in enumerate(OpenDSSDirect.EachMember(Capacitors, Capacitors.Name))
    @test n == arr[i]
end
@test arr == Capacitors.AllNames()
@test length(arr) == length(OpenDSSDirect.EachMember(Capacitors))

end # testset
