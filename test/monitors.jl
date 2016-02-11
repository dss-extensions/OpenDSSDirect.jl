include("init.jl")
init8500()

dss("""
    New Monitor.m1 Line.ln5815900-1 1
    solve
""")

@testset "monitors" begin 

@test monitors(:First) == 1
@test monitors(:Next) == 0
@test monitors(:Reset) == 0
@test monitors(:ResetAll) == 0
@test monitors(:Sample) == 0
@test monitors(:Save) == 0
@test monitors(:Show) == 0
@test monitors(:Mode) == 0
@test monitors(:Mode, monitors(:Mode)) == 0
@test monitors(:SampleCount) == 0
@test monitors(:SampleAll) == 0
@test monitors(:SaveAll) == 0
@test monitors(:Count) == 1
@test monitors(:Process) == 0
@test monitors(:ProcessAll) == 0
@test monitors(:FileVersion) == 0
@test monitors(:NumChannels) == 12
@test monitors(:Terminal) == 1
@test monitors(:Terminal, monitors(:Terminal)) == 0
@test contains(monitors(:FileName), "IEEE8500_Mon_m1")
@test monitors(:Name) == "m1"
@test monitors(:Name, monitors(:Name)) == "0"
@test monitors(:Element) == "line.ln5815900-1"
@test monitors(:Element, monitors(:Element)) == "0"
@test monitors(:AllNames) == ["m1"]
@test monitors(:ByteStream) == nothing
@test monitors(:DblHourS)[1] == " V1"
@test monitors(:DblHour) ≈ [0.0]
@test monitors(:DblFreqS) ≈ [0.0]
@test monitors(:DblFreq) ≈ [0.0]

end # testset

