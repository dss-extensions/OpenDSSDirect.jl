
init8500()

OpenDSSDirect.Text.Command("""
New Relay.SubBreaker Line.ln5815900-1 1  PhaseCurve=D GroundCurve=A PhaseTrip=600 GroundTrip=600
new TCC_Curve.101 npts=8 c_array=(1.0   1.5   1.7   2.0   2.5   3.0   6.0   10.0)
~                        t_array=(0.140 0.036 0.025 0.022 0.018 0.016 0.015 0.015)
new TCC_Curve.133 npts=7 c_array=(1.0  10.0  15.0  25.0  35.0  50.0  100.0)
~                        t_array=(14.0 0.16  0.09  0.052 0.042 0.039 0.039)
new Recloser.A monitoredobj=Line.LN5587291-1 monitoredterm=1 switchedobj=Line.LN5587291-1 switchedterm=1 delay=0.042
~ numfast=1 phasefast=101 phasedelayed=133 phasetrip=200 tdphfast=1 tdphdelayed=1
~ shots=4 recloseintervals=(2, 2, 5)
new Recloser.B like=A monitoredobj=Line.LN5860423-1 monitoredterm=1 switchedobj=Line.LN5860423-1 switchedterm=1
""")

@testset "Reclosers" begin

@test Reclosers.Count() == 2
@test Reclosers.First() == 1
@test Reclosers.Next() == 2
@test Reclosers.MonitoredTerm() == 1
@test Reclosers.MonitoredTerm(Reclosers.MonitoredTerm()) == nothing
@test Reclosers.SwitchedTerm() == 1
@test Reclosers.SwitchedTerm(Reclosers.SwitchedTerm()) == nothing
@test Reclosers.NumFast() == 1
@test Reclosers.NumFast(Reclosers.NumFast()) == nothing
@test Reclosers.Shots() == 4
@test Reclosers.Shots(Reclosers.Shots()) == nothing
@test Reclosers.Open() == nothing
@test Reclosers.Close() == nothing
@test Reclosers.Idx() == 2
@test Reclosers.Idx(Reclosers.Idx()) == nothing
@test Reclosers.PhaseTrip() ≋ 200.0
@test Reclosers.PhaseTrip(Reclosers.PhaseTrip()) == nothing
@test Reclosers.PhaseInst() ≋ 0.0
@test Reclosers.PhaseInst(Reclosers.PhaseInst()) == nothing
@test Reclosers.GroundTrip() ≋ 1.0
@test Reclosers.GroundTrip(Reclosers.GroundTrip()) == nothing
@test Reclosers.GroundInst() ≋ 0.0
@test Reclosers.GroundInst(Reclosers.GroundInst()) == nothing
@test Reclosers.Name() == "b"
@test Reclosers.Name(Reclosers.Name()) == nothing
@test Reclosers.MonitoredObj() == "line.ln5860423-1"
@test Reclosers.MonitoredObj(Reclosers.MonitoredObj()) == nothing
@test Reclosers.SwitchedObj() == "line.ln5860423-1"
@test Reclosers.SwitchedObj(Reclosers.SwitchedObj()) == nothing
@test Reclosers.AllNames() == ["a", "b"]
@test Reclosers.RecloseIntervals() ≋ [2.0,2.0,5.0]

arr = String[]
for i in OpenDSSDirect.EachMember(Reclosers); push!(arr, Reclosers.Name()); end
for (i, n) in enumerate(OpenDSSDirect.EachMember(Reclosers, Reclosers.Name))
    @test n == arr[i]
end
@test arr == Reclosers.AllNames()
@test length(arr) == length(OpenDSSDirect.EachMember(Reclosers))


end # testset

