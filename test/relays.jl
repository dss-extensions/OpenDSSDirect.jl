
init8500()

OpenDSSDirect.Text.Command("""
New Relay.SubBreaker Line.ln5815900-1 1  PhaseCurve=D GroundCurve=A PhaseTrip=600 GroundTrip=600
""")

@testset "Relays" begin

@test Relays.Count() == 1
@test Relays.First() == 1
@test Relays.Next() == 0
@test Relays.MonitoredTerm() == 1
@test Relays.MonitoredTerm(Relays.MonitoredTerm()) == nothing
@test Relays.SwitchedTerm() == 1
@test Relays.SwitchedTerm(Relays.SwitchedTerm()) == nothing
@test Relays.Idx() == 1
@test Relays.Idx(Relays.Idx()) == nothing
@test Relays.Name() == "subbreaker"
@test Relays.Name(Relays.Name()) == nothing
@test Relays.MonitoredObj() == "line.ln5815900-1"
@test Relays.MonitoredObj(Relays.MonitoredObj()) == nothing
@test Relays.SwitchedObj() == "line.ln5815900-1"
@test Relays.SwitchedObj(Relays.SwitchedObj()) == nothing
@test Relays.AllNames() == ["subbreaker"]

arr = String[]
for i in OpenDSSDirect.EachMember(Relays); push!(arr, Relays.Name()); end
for (i, n) in enumerate(OpenDSSDirect.EachMember(Relays, Relays.Name))
    @test n == arr[i]
end
@test arr == Relays.AllNames()
@test length(arr) == length(OpenDSSDirect.EachMember(Relays))

end # testset

