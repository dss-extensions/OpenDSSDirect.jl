
init8500()


@testset "Capacitors" begin 

@test Capacitors.First() == 1
@test Capacitors.Next() == 2
@test Capacitors.Count() == 10
@test Capacitors.NumSteps() == 1
@test Capacitors.NumSteps(Capacitors.NumSteps()) == 0
@test Capacitors.IsDelta() == false
@test Capacitors.IsDelta(Capacitors.IsDelta()) == 0
@test Capacitors.AddStep() == 0
@test Capacitors.SubtractStep() == 0
@test Capacitors.AvailableSteps() == 1
@test Capacitors.Open() == 0
@test Capacitors.Close() == 0
@test Capacitors.kV() ≋ 7.2
@test Capacitors.kV(Capacitors.kV()) ≋ 0.0
@test Capacitors.kvar() ≋ 300.0
@test Capacitors.kvar(Capacitors.kvar()) ≋ 0.0
@test Capacitors.Name() == "capbank2b"
@test Capacitors.Name(Capacitors.Name()) == "0"
@test Capacitors.AllNames()[end] == "capbank3"
@test Capacitors.States() == [1]

end # testset