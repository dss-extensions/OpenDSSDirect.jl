include("init.jl")
init8500()

dss("""
New Relay.SubBreaker Line.ln5815900-1 1  PhaseCurve=D GroundCurve=A PhaseTrip=600 GroundTrip=600
""")

@testset "relays" begin 

@test relays(:Count) == 1
@test relays(:First) == 1
@test relays(:Next) == 0
@test relays(:MonitoredTerm) == 1
@test relays(:MonitoredTerm, relays(:MonitoredTerm)) == 0
@test relays(:SwitchedTerm) == 1
@test relays(:SwitchedTerm, relays(:SwitchedTerm)) == 0
@test relays(:Idx) == 1
@test relays(:Idx, relays(:Idx)) == 0
@test relays(:Name) == "subbreaker"
@test relays(:Name, relays(:Name)) == ""
@test relays(:MonitoredObj) == "line.ln5815900-1"
@test relays(:MonitoredObj, relays(:MonitoredObj)) == ""
@test relays(:SwitchedObj) == "line.ln5815900-1"
@test relays(:SwitchedObj, relays(:SwitchedObj)) == ""
@test relays(:AllNames) == ["subbreaker"]

end # testset

