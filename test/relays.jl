include("init.jl")
init8500()

dss("""
New Relay.SubBreaker Line.ln5815900-1 1  PhaseCurve=D GroundCurve=A PhaseTrip=600 GroundTrip=600
""")

@testset "Relays" begin 

@test Relays.Count() == 1
@test Relays.First() == 1
@test Relays.Next() == 0
@test Relays.MonitoredTerm() == 1
@test Relays.MonitoredTerm(Relays.MonitoredTerm()) == 0
@test Relays.SwitchedTerm() == 1
@test Relays.SwitchedTerm(Relays.SwitchedTerm()) == 0
@test Relays.Idx() == 1
@test Relays.Idx(Relays.Idx()) == 0
@test Relays.Name() == "subbreaker"
@test Relays.Name(Relays.Name()) == ""
@test Relays.MonitoredObj() == "line.ln5815900-1"
@test Relays.MonitoredObj(Relays.MonitoredObj()) == ""
@test Relays.SwitchedObj() == "line.ln5815900-1"
@test Relays.SwitchedObj(Relays.SwitchedObj()) == ""
@test Relays.AllNames() == ["subbreaker"]

end # testset

