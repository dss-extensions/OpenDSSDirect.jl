include("init.jl")
init8500()


@testset "Settings" begin 

@test Settings.AllowDuplicates() == 0
@test Settings.AllowDuplicates(Settings.AllowDuplicates()) == 0
@test Settings.ZoneLock() == 0
@test Settings.ZoneLock(Settings.ZoneLock()) == 0
@test Settings.CktModel() == 1
@test Settings.CktModel(Settings.CktModel()) == 0
@test Settings.Trapezoidal() == 0
@test Settings.Trapezoidal(Settings.Trapezoidal()) == 0
@test Settings.AllocationFactors(1.0) ≋ 0.0
@test Settings.NormVminpu() ≋ 0.95
@test Settings.NormVminpu(Settings.NormVminpu()) ≋ 0.0
@test Settings.NormVmaxpu() ≋ 1.05
@test Settings.NormVmaxpu(Settings.NormVmaxpu()) ≋ 0.0
@test Settings.EmergVminpu() ≋ 0.9
@test Settings.EmergVminpu(Settings.EmergVminpu()) ≋ 0.0
@test Settings.EmergVmaxpu() ≋ 1.08
@test Settings.EmergVmaxpu(Settings.EmergVmaxpu()) ≋ 0.0
@test Settings.UEWeight() ≋ 1.0
@test Settings.UEWeight(Settings.UEWeight()) ≋ 0.0
@test Settings.LossWeight() ≋ 1.0
@test Settings.LossWeight(Settings.LossWeight()) ≋ 0.0
@test Settings.PriceSignal() ≋ 25.0
@test Settings.PriceSignal(Settings.PriceSignal()) ≋ 0.0
@test Settings.AutoBusList() == ""
@test Settings.AutoBusList(Settings.AutoBusList()) == ""
@test Settings.PriceCurve() == ""
# @test Settings.PriceCurve(Settings.PriceCurve()) == ""
@test Settings.UERegs() == [10]
# @test Settings.UERegs(Settings.UERegs())
@test Settings.LossRegs() == [13]
# @test Settings.LossRegs(Settings.LossRegs())
@test Settings.VoltageBases() == [115.0,12.47,0.48,0.208]
# @test Settings.VoltageBases(Settings.VoltageBases())

end # testset

