
init8500()

OpenDSSDirect.Text.Command("""
    New Monitor.m1 Line.ln5815900-1 1
    solve
""")

@testset "Monitors" begin

@test Monitors.First() == 1
@test Monitors.Next() == 0
@test Monitors.Idx() == 1
@test_throws OpenDSSDirect.OpenDSSDirectException Monitors.Idx(0)
@test Monitors.Idx() == 1
@test Monitors.Idx(1) === nothing
@test Monitors.Idx() == 1
@test Monitors.Reset() === nothing
@test Monitors.ResetAll() === nothing
@test Monitors.Sample() === nothing
@test Monitors.Save() === nothing
# @test Monitors.Show() === nothing
@test Monitors.Mode() == 0
@test Monitors.Mode() == OpenDSSDirect.Lib.MonitorModes_VI
@test Monitors.Mode(0) === nothing
@test Monitors.Mode(OpenDSSDirect.Lib.MonitorModes_VI | OpenDSSDirect.Lib.MonitorModes_PosOnly) === nothing
@test Monitors.Mode() == OpenDSSDirect.Lib.MonitorModes_VI | OpenDSSDirect.Lib.MonitorModes_PosOnly
@test Monitors.Mode(OpenDSSDirect.Lib.MonitorModes_VI) === nothing
@test Monitors.Mode() == OpenDSSDirect.Lib.MonitorModes_VI
@test Monitors.SampleCount() == 0
@test Monitors.SampleAll() === nothing
@test Monitors.SaveAll() === nothing
@test Monitors.Count() == 1
@test Monitors.Process() === nothing
@test Monitors.ProcessAll() === nothing
@test Monitors.FileVersion() == 1
@test Monitors.NumChannels() == 12
@test Monitors.Terminal() == 1
@test Monitors.Terminal(Monitors.Terminal()) === nothing
@test occursin("IEEE8500_Mon_m1", Monitors.FileName())
@test Monitors.Name() == "m1"
@test Monitors.Name(Monitors.Name()) === nothing
@test Monitors.Element() == "line.ln5815900-1"
@test Monitors.Element(Monitors.Element()) === nothing
@test Monitors.AllNames() == ["m1"]

# In 2021, the header was removed from the bytestream (following the official OpenDSS implementation)
@test Monitors.ByteStream() == Int8[-20, -86, 0, 0, 1, 0, 0, 0, 12, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0]

@test Monitors.Channel(1) == Float64[0.0] #TODO: better test -- solve in daily mode, capture a sample channel
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

