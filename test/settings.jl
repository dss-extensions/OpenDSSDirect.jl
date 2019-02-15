
init8500()


@testset "Settings" begin

@test Settings.AllowDuplicates() == 0
@test Settings.AllowDuplicates(Settings.AllowDuplicates()) == nothing
@test Settings.ZoneLock() == 0
@test Settings.ZoneLock(Settings.ZoneLock()) == nothing
@test Settings.CktModel() == 0
@test Settings.CktModel() == OpenDSSDirect.Lib.CktModels_Multiphase
@test Settings.CktModel(0) == nothing
@test Settings.CktModel(OpenDSSDirect.Lib.CktModels_Multiphase) == nothing
@test Settings.Trapezoidal() == 0
@test Settings.Trapezoidal(Settings.Trapezoidal()) == nothing
@test Settings.AllocationFactors(1.0) == nothing
@test Settings.NormVminpu() ≋ 0.95
@test Settings.NormVminpu(Settings.NormVminpu()) == nothing
@test Settings.NormVmaxpu() ≋ 1.05
@test Settings.NormVmaxpu(Settings.NormVmaxpu()) == nothing
@test Settings.EmergVminpu() ≋ 0.9
@test Settings.EmergVminpu(Settings.EmergVminpu()) == nothing
@test Settings.EmergVmaxpu() ≋ 1.08
@test Settings.EmergVmaxpu(Settings.EmergVmaxpu()) == nothing
@test Settings.UEWeight() ≋ 1.0
@test Settings.UEWeight(Settings.UEWeight()) == nothing
@test Settings.LossWeight() ≋ 1.0
@test Settings.LossWeight(Settings.LossWeight()) == nothing
@test Settings.PriceSignal() ≋ 25.0
@test Settings.PriceSignal(Settings.PriceSignal()) == nothing
@test Settings.AutoBusList() == ""
@test Settings.AutoBusList(Settings.AutoBusList()) == nothing
@test Settings.PriceCurve() == ""
@test Settings.PriceCurve(Settings.PriceCurve()) == nothing
@test Settings.UERegs() == [10]
@test Settings.UERegs(Settings.UERegs()) == nothing
@test Settings.LossRegs() == [13]
@test Settings.LossRegs(Settings.LossRegs()) == nothing
@test Settings.VoltageBases() == [115.0,12.47,0.48,0.208]
@test Settings.VoltageBases(Settings.VoltageBases()) == nothing

end # testset

