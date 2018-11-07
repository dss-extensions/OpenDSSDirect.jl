
init8500()

dss("""
    New Monitor.m1 Line.ln5815900-1 1
    solve
""")

@testset "Monitors" begin 

@test Monitors.First() == 1
@test Monitors.Next() == 0
@test Monitors.Reset() == 0
@test Monitors.ResetAll() == 0
@test Monitors.Sample() == 0
@test Monitors.Save() == 0
@test Monitors.Show() == 0
@test Monitors.Mode() == 0
@test Monitors.Mode(Monitors.Mode()) == 0
@test Monitors.SampleCount() == 0
@test Monitors.SampleAll() == 0
@test Monitors.SaveAll() == 0
@test Monitors.Count() == 1
@test Monitors.Process() == 0
@test Monitors.ProcessAll() == 0
# @test Monitors.FileVersion() == 0     # win32 FAILURE
@test Monitors.NumChannels() == 12
@test Monitors.Terminal() == 1
@test Monitors.Terminal(Monitors.Terminal()) == 0
@test occursin("IEEE8500_Mon_m1", Monitors.FileName())
@test Monitors.Name() == "m1"
@test Monitors.Name(Monitors.Name()) == "0"
@test Monitors.Element() == "line.ln5815900-1"
@test Monitors.Element(Monitors.Element()) == "0"
@test Monitors.AllNames() == ["m1"]
@test Monitors.ByteStream() == nothing
@test Monitors.DblHourS()[1] == " V1"
@test Monitors.DblHour() ≋ [0.0]
@test Monitors.DblFreqS() ≋ [0.0]
@test Monitors.DblFreq() ≋ [0.0]

end # testset

