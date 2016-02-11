include("init.jl")
init8500()
dss("Redirect  Fuses.dss")


@testset "fuses" begin 

@test fuses(:Count) == 30
@test fuses(:First) == 1
@test fuses(:Next) == 2
@test fuses(:MonitoredTerm) == 1
@test fuses(:MonitoredTerm, fuses(:MonitoredTerm)) == 0
@test fuses(:Open) == 0
@test fuses(:Close) == 0
@test fuses(:IsBlown) == 0
@test fuses(:Idx) == 30
@test fuses(:Idx, fuses(:Idx)) == 0
@test fuses(:NumPhases) == 1
@test fuses(:RatedCurrent) ≈ 10.0
@test fuses(:RatedCurrent, fuses(:RatedCurrent)) ≈ 0.0
@test fuses(:Name) == "ln6991377-9"
@test fuses(:Name, fuses(:Name)) == ""
@test fuses(:MonitoredObj) == "line.ln6991377-9"
@test fuses(:MonitoredObj, fuses(:MonitoredObj)) == ""
@test fuses(:SwitchedObj) == "line.ln6991377-9"
@test fuses(:SwitchedObj, fuses(:SwitchedObj)) == ""
@test fuses(:TCCCurve) == "tlink"
@test fuses(:TCCCurve, fuses(:TCCCurve)) == ""
@test fuses(:AllNames)[end] == "ln6991377-9"

end # testset

