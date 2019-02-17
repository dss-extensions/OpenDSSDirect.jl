
dir = init8500()
fuses = joinpath(dir, "Fuses.dss") |> normpath
OpenDSSDirect.Text.Command("Redirect $fuses")

@testset "Fuses" begin

@test Fuses.Count() == 30
@test Fuses.First() == 1
@test Fuses.Next() == 2
@test Fuses.MonitoredTerm() == 1
@test Fuses.MonitoredTerm(Fuses.MonitoredTerm()) == nothing
@test Fuses.Open() == nothing
@test Fuses.Close() == nothing
@test Fuses.IsBlown() == false
@test Fuses.Idx() == 2
@test Fuses.Idx(Fuses.Idx()) == nothing
@test Fuses.NumPhases() == 1
@test Fuses.RatedCurrent() ≋ 10.0
@test Fuses.RatedCurrent(Fuses.RatedCurrent()) == nothing
@test Fuses.Name() == "ln6409873-1"
@test Fuses.Name(Fuses.Name()) == nothing
@test Fuses.MonitoredObj() == "line.ln6409873-1"
@test Fuses.MonitoredObj(Fuses.MonitoredObj()) == nothing
@test Fuses.SwitchedObj() == "line.ln6409873-1"
@test Fuses.SwitchedObj(Fuses.SwitchedObj()) == nothing
@test Fuses.TCCCurve() == "tlink"
@test Fuses.TCCCurve(Fuses.TCCCurve()) == nothing
@test Fuses.AllNames()[end] == "ln6991377-9"

arr = String[]
for i in OpenDSSDirect.EachMember(Fuses); push!(arr, Fuses.Name()); end
for (i, n) in enumerate(OpenDSSDirect.EachMember(Fuses, Fuses.Name))
    @test n == arr[i]
end
@test arr == Fuses.AllNames()
@test length(arr) == length(OpenDSSDirect.EachMember(Fuses))

end # testset

