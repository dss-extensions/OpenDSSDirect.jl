include("init.jl")
init8500()

dss("""
    New Energymeter.m1 Line.ln5815900-1 1
    set mode=yearly number=2
    solve
    Redirect  Fuses.dss
""")

@testset "Meters" begin 

@test Meters.First() == 1
@test Meters.Next() == 0
@test Meters.Reset() == 0
@test Meters.ResetAll() == 0
@test Meters.Sample() == 0
@test Meters.Save() == 0
@test Meters.MeteredTerminal() == 1
@test Meters.MeteredTerminal(Meters.MeteredTerminal()) == 0
@test Meters.DIFilesAreOpen() == 0
# # # @test Meters.SampleAll() == 0    # ERROR
@test Meters.SaveAll() == 0
@test Meters.OpenAllDIFiles() == 0
@test Meters.CloseAllDIFiles() == 0
# # # @test Meters.CountEndElements() == 0    # ERROR
@test Meters.Count() == 1
@test Meters.CountBranches() == 4881
@test Meters.SequenceList() == 1
@test Meters.SequenceList(Meters.SequenceList()) == 0
# @test Meters.DoReliabilityCalc(0) == 0
@test Meters.SeqListSize() == 4881
@test Meters.TotalCustomers() == 0
@test Meters.NumSections() == 0
@test Meters.SetActiveSection(1) == 0
@test Meters.OCPDeviceType() == 0
@test Meters.NumSectionCustomers() == 0
@test Meters.NumSectionBranches() == 0
@test Meters.SectSeqidx() == 0
@test Meters.SectTotalCust() == 0
@test Meters.SAIFI() ≋ 0.0
@test Meters.SAIFIkW() ≋ 0.0
@test Meters.SAIDI() ≋ 0.0
@test Meters.CustInterrupts() ≋ 0.0
@test Meters.AvgRepairTime() ≋ 0.0
@test Meters.FaultRateXRepairHrs() ≋ 0.0
@test Meters.SumBranchFltRates() ≋ 0.0
# @test Meters.TotalCustomers() == 1177
# @test Meters.NumSections() == 30
# @test Meters.SetActiveSection(1) == 0
# @test Meters.OCPDeviceType() == 1
# @test Meters.NumSectionCustomers() == 28
# @test Meters.NumSectionBranches() == 105
# @test Meters.SectSeqidx() == 21
# @test Meters.SectTotalCust() == 28
# @test Meters.SAIFI() ≋ 9.875348385699192
# @test Meters.SAIFIkW() ≋ 9.171172946672693
# @test Meters.SAIDI() ≋ 29.62604515709752
# @test Meters.CustInterrupts() ≋ 11623.28504996795
# @test Meters.AvgRepairTime() ≋ 2.9999999999999987
# @test Meters.FaultRateXRepairHrs() ≋ 2372.91137653651
# @test Meters.SumBranchFltRates() ≋ 790.9704588455037
@test Meters.Name() == "m1"
@test Meters.Name(Meters.Name()) == "0"
@test Meters.MeteredElement() == "line.ln5815900-1"
@test Meters.MeteredElement(Meters.MeteredElement()) == "0"
@test Meters.AllNames() == Any[]
@test Meters.RegisterNames() == Any[]
# @show Meters.RegisterValues(Meters.RegisterValues())
@test Meters.Totals() == Any[]
@test Meters.PeakCurrent() == Any[]
# @show Meters.PeakCurrent(Meters.PeakCurrent())
@test Meters.CalcCurrent() == Any[]
# @show Meters.CalcCurrent(Meters.CalcCurrent())
@test Meters.AllocFactors() == Any[]
# @show Meters.AllocFactors(Meters.AllocFactors())
# @show Meters.AllEndElements()
# # # @show Meters.AllBranchesInZone()    # ERROR

end # testset

