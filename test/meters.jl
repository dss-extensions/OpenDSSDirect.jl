
OpenDSSDirect.Text.Command("clear")

dir = init8500()

OpenDSSDirect.Text.Command("""
    New Energymeter.m1 Line.ln5815900-1 1
    set mode=yearly number=2
    solve
    Redirect "$(joinpath(dir, "Fuses.dss"))"
""")

@testset "Meters" begin

# Make sure there is no pending error
@test Error.Number() == 0

@test Meters.First() == 1
@test Meters.Next() == 0
@test Meters.Save() == nothing
@test Meters.Reset() == nothing
@test Meters.ResetAll() == nothing
@test Meters.Sample() == nothing
@test Meters.SampleAll() == nothing
@test Meters.MeteredTerminal() == 1
@test Meters.MeteredTerminal(Meters.MeteredTerminal()) == nothing
@test Meters.DIFilesAreOpen() == 0

# This is invalid, should end in error
@test Meters.NumSectionCustomers() == 0
@test Error.Number() != 0

@test Meters.AllBranchesInZone() == []
@test Error.Number() != 0

OpenDSSDirect.Text.Command("MakeBusList")

@test Meters.CountEndElements() == 2410
@test Meters.AllEndElements()[1] == "Transformer.t226195333c"
@test Meters.AllBranchesInZone()[1] == "Line.ln5815900-1"
@test Meters.SaveAll() == nothing
@test Meters.OpenAllDIFiles() == nothing
@test Meters.CloseAllDIFiles() == nothing
@test Meters.Count() == 1
@test Meters.CountBranches() == 4881
@test Meters.SequenceList() == 1
@test Meters.SequenceList(Meters.SequenceList()) == nothing

@test Meters.DoReliabilityCalc(false) == nothing
@test Meters.TotalCustomers() == 1177
@test Meters.NumSections() == 30
@test Meters.SetActiveSection(1) == nothing
@test Error.Number() == 0


@test Meters.OCPDeviceType() == 1
@test Meters.NumSectionCustomers() == 28
@test Meters.NumSectionBranches() == 105
@test Meters.SectSeqidx() == 21
@test Meters.SectTotalCust() == 28
@test Meters.SAIFI() ≋ 9.875348385699192
@test Meters.SAIFIkW() ≋ 9.171172946672693
@test Meters.SAIDI() ≋ 29.62604515709752
@test Meters.CustInterrupts() ≋ 11623.28504996795
@test Meters.AvgRepairTime() ≋ 2.9999999999999987
@test Meters.FaultRateXRepairHrs() ≋ 2372.91137653651
@test Meters.SumBranchFltRates() ≋ 790.9704588455037

@test Meters.SeqListSize() == 4881
@test Meters.Name() == "m1"
@test Meters.Name(Meters.Name()) == nothing
@test Meters.MeteredElement() == "line.ln5815900-1"
@test Meters.MeteredElement(Meters.MeteredElement()) == nothing
@test Meters.AllNames()[1] == "m1"
@test Meters.RegisterNames()[1] == "kWh"
@test Meters.RegisterValues()[1] ≋ 23830.586235396186

# Value updated as of OpenDSS 7.6.5.86, SVN rev 2463, electricdss-src d867ca306d2448ba03d7bb28699fa4ecec94119c
@test Meters.Totals()[1] ≋ 23830.586235396186
@test Meters.PeakCurrent()[1] ≋ 400.0
@test Meters.PeakCurrent(Meters.PeakCurrent()) == nothing
@test 1 + Meters.CalcCurrent()[1] ≋ 1 + 0.0
@test Meters.CalcCurrent(Meters.CalcCurrent()) == nothing
@test 1 + Meters.AllocFactors()[1] ≋ 1 + 0.0
@test Meters.AllocFactors(Meters.AllocFactors()) == nothing


arr = String[]
for i in OpenDSSDirect.EachMember(Meters); push!(arr, Meters.Name()); end
for (i, n) in enumerate(OpenDSSDirect.EachMember(Meters, Meters.Name))
    @test n == arr[i]
end
@test arr == Meters.AllNames()
@test length(arr) == length(OpenDSSDirect.EachMember(Meters))


end # testset

