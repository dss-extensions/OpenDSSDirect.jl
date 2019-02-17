
init8500()

OpenDSSDirect.Text.Command("""
    New Monitor.m1 Line.ln5815900-1 1
    solve
""")

@testset "Monitors" begin

@test Monitors.First() == 1
@test Monitors.Next() == 0
@test Monitors.Reset() == nothing
@test Monitors.ResetAll() == nothing
@test Monitors.Sample() == nothing
@test Monitors.Save() == nothing
# @test Monitors.Show() == nothing
@test Monitors.Mode() == 0
@test Monitors.Mode() == OpenDSSDirect.Lib.MonitorModes_VI
@test Monitors.Mode(0) == nothing
@test Monitors.Mode(OpenDSSDirect.Lib.MonitorModes_VI) == nothing
@test Monitors.SampleCount() == 0
@test Monitors.SampleAll() == nothing
@test Monitors.SaveAll() == nothing
@test Monitors.Count() == 1
@test Monitors.Process() == nothing
@test Monitors.ProcessAll() == nothing
@test Monitors.FileVersion() == 1
@test Monitors.NumChannels() == 12
@test Monitors.Terminal() == 1
@test Monitors.Terminal(Monitors.Terminal()) == nothing
@test occursin("IEEE8500_Mon_m1", Monitors.FileName())
@test Monitors.Name() == "m1"
@test Monitors.Name(Monitors.Name()) == nothing
@test Monitors.Element() == "line.ln5815900-1"
@test Monitors.Element(Monitors.Element()) == nothing
@test Monitors.AllNames() == ["m1"]
@test Monitors.ByteStream() == Int8[-20, -86, 0, 0, 1, 0, 0, 0, 12, 0, 0, 0, 0, 0, 0, 0, 104, 111, 117, 114, 44, 32, 116, 40, 115, 101, 99, 41, 44, 32, 86, 49, 44, 32, 86, 65, 110, 103, 108, 101, 49, 44, 32, 86, 50, 44, 32, 86, 65, 110, 103, 108, 101, 50, 44, 32, 86, 51, 44, 32, 86, 65, 110, 103, 108, 101, 51, 44, 32, 73, 49, 44, 32, 73, 65, 110, 103, 108, 101, 49, 44, 32, 73, 50, 44, 32, 73, 65, 110, 103, 108, 101, 50, 44, 32, 73, 51, 44, 32, 73, 65, 110, 103, 108, 101, 51, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0]
# @test Monitors.DblHourS()[1] == " V1"
@test Monitors.DblHour() ≋ [0.0]
# @test Monitors.DblFreqS() ≋ [0.0]
@test Monitors.DblFreq() ≋ [0.0]

arr = String[]
for i in OpenDSSDirect.EachMember(Monitors); push!(arr, Monitors.Name()); end
for (i, n) in enumerate(OpenDSSDirect.EachMember(Monitors, Monitors.Name))
    @test n == arr[i]
end
@test arr == Monitors.AllNames()
@test length(arr) == length(OpenDSSDirect.EachMember(Monitors))



end # testset

