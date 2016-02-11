include("init.jl")
init8500()

dss("""
    New Energymeter.m1 Line.ln5815900-1 1
    set mode=yearly number=2
    solve
    Redirect  Fuses.dss
""")

@testset "meters" begin 

@test meters(:First) == 1
@test meters(:Next) == 0
@test meters(:Reset) == 0
@test meters(:ResetAll) == 0
@test meters(:Sample) == 0
@test meters(:Save) == 0
@test meters(:MeteredTerminal) == 1
@test meters(:MeteredTerminal, meters(:MeteredTerminal)) == 0
@test meters(:DIFilesAreOpen) == 0
# # # @test meters(:SampleAll) == 0    # ERROR
@test meters(:SaveAll) == 0
@test meters(:OpenAllDIFiles) == 0
@test meters(:CloseAllDIFiles) == 0
# # # @test meters(:CountEndElements) == 0    # ERROR
@test meters(:Count) == 1
@test meters(:CountBranches) == 4881
@test meters(:SequenceList) == 1
@test meters(:SequenceList, meters(:SequenceList)) == 0
# @test meters(:DoReliabilityCalc, 0) == 0
@test meters(:SeqListSize) == 4881
@test meters(:TotalCustomers) == 0
@test meters(:NumSections) == 0
@test meters(:SetActiveSection, 1) == 0
@test meters(:OCPDeviceType) == 0
@test meters(:NumSectionCustomers) == 0
@test meters(:NumSectionBranches) == 0
@test meters(:SectSeqidx) == 0
@test meters(:SectTotalCust) == 0
@test meters(:SAIFI) ≈ 0.0
@test meters(:SAIFIkW) ≈ 0.0
@test meters(:SAIDI) ≈ 0.0
@test meters(:CustInterrupts) ≈ 0.0
@test meters(:AvgRepairTime) ≈ 0.0
@test meters(:FaultRateXRepairHrs) ≈ 0.0
@test meters(:SumBranchFltRates) ≈ 0.0
# @test meters(:TotalCustomers) == 1177
# @test meters(:NumSections) == 30
# @test meters(:SetActiveSection, 1) == 0
# @test meters(:OCPDeviceType) == 1
# @test meters(:NumSectionCustomers) == 28
# @test meters(:NumSectionBranches) == 105
# @test meters(:SectSeqidx) == 21
# @test meters(:SectTotalCust) == 28
# @test meters(:SAIFI) ≈ 9.875348385699192
# @test meters(:SAIFIkW) ≈ 9.171172946672693
# @test meters(:SAIDI) ≈ 29.62604515709752
# @test meters(:CustInterrupts) ≈ 11623.28504996795
# @test meters(:AvgRepairTime) ≈ 2.9999999999999987
# @test meters(:FaultRateXRepairHrs) ≈ 2372.91137653651
# @test meters(:SumBranchFltRates) ≈ 790.9704588455037
@test meters(:Name) == "m1"
@test meters(:Name, meters(:Name)) == "0"
@test meters(:MeteredElement) == "line.ln5815900-1"
@test meters(:MeteredElement, meters(:MeteredElement)) == "0"
@test meters(:AllNames) == Any[]
@test meters(:RegisterNames) == Any[]
# @show meters(:RegisterValues, meters(:RegisterValues))
@test meters(:Totals) == Any[]
@test meters(:PeakCurrent) == Any[]
# @show meters(:PeakCurrent, meters(:PeakCurrent))
@test meters(:CalcCurrent) == Any[]
# @show meters(:CalcCurrent, meters(:CalcCurrent))
@test meters(:AllocFactors) == Any[]
# @show meters(:AllocFactors, meters(:AllocFactors))
# @show meters(:AllEndElements)
# # # @show meters(:AllBranchesInZone)    # ERROR

end # testset

