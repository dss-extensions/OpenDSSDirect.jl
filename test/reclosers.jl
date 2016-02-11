include("init.jl")
init8500()

dss("""
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

@testset "reclosers" begin 

@test reclosers(:Count) == 2
@test reclosers(:First) == 1
@test reclosers(:Next) == 2
@test reclosers(:MonitoredTerm) == 1
@test reclosers(:MonitoredTerm, reclosers(:MonitoredTerm)) == 0
@test reclosers(:SwitchedTerm) == 1
@test reclosers(:SwitchedTerm, reclosers(:SwitchedTerm)) == 0
@test reclosers(:NumFast) == 1
@test reclosers(:NumFast, reclosers(:NumFast)) == 0
@test reclosers(:Shots) == 4
@test reclosers(:Shots, reclosers(:Shots)) == 0
@test reclosers(:Open) == 0
@test reclosers(:Close) == 0
@test reclosers(:Idx) == 1
@test reclosers(:Idx, reclosers(:Idx)) == 0
@test reclosers(:PhaseTrip) ≈ 200.0
@test reclosers(:PhaseTrip, reclosers(:PhaseTrip)) ≈ 0.0
@test reclosers(:PhaseInst) ≈ 0.0
@test reclosers(:PhaseInst, reclosers(:PhaseInst)) ≈ 0.0
@test reclosers(:GroundTrip) ≈ 1.0
@test reclosers(:GroundTrip, reclosers(:GroundTrip)) ≈ 0.0
@test reclosers(:GroundInst) ≈ 0.0
@test reclosers(:GroundInst, reclosers(:GroundInst)) ≈ 0.0
@test reclosers(:Name) == "a"
@test reclosers(:Name, reclosers(:Name)) == ""
@test reclosers(:MonitoredObj) == "line.ln5587291-1"
@test reclosers(:MonitoredObj, reclosers(:MonitoredObj)) == ""
@test reclosers(:SwitchedObj) == "line.ln5587291-1"
@test reclosers(:SwitchedObj, reclosers(:SwitchedObj)) == ""
@test reclosers(:AllNames) == ["a", "b"]
@test reclosers(:RecloseIntervals) ≈ [2.0,2.0,5.0]

end # testset

