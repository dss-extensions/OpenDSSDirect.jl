include("init.jl")
init8500()
dss("Redirect  Fuses.dss")


@testset "Fuses" begin 

@test Fuses.Count() == 30
@test Fuses.First() == 1
@test Fuses.Next() == 2
@test Fuses.MonitoredTerm() == 1
@test Fuses.MonitoredTerm(Fuses.MonitoredTerm()) == 0
@test Fuses.Open() == 0
@test Fuses.Close() == 0
@test Fuses.IsBlown() == 0
@test Fuses.Idx() == 30
@test Fuses.Idx(Fuses.Idx()) == 0
@test Fuses.NumPhases() == 1
@test Fuses.RatedCurrent() ≈ 10.0
@test Fuses.RatedCurrent(Fuses.RatedCurrent()) ≈ 0.0
@test Fuses.Name() == "ln6991377-9"
@test Fuses.Name(Fuses.Name()) == ""
@test Fuses.MonitoredObj() == "line.ln6991377-9"
@test Fuses.MonitoredObj(Fuses.MonitoredObj()) == ""
@test Fuses.SwitchedObj() == "line.ln6991377-9"
@test Fuses.SwitchedObj(Fuses.SwitchedObj()) == ""
@test Fuses.TCCCurve() == "tlink"
@test Fuses.TCCCurve(Fuses.TCCCurve()) == ""
@test Fuses.AllNames()[end] == "ln6991377-9"

end # testset

