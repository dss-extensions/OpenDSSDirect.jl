include("init.jl")
init8500()


@testset "settings" begin 

@test settings(:AllowDuplicates) == 0
@test settings(:AllowDuplicates, settings(:AllowDuplicates)) == 0
@test settings(:ZoneLock) == 0
@test settings(:ZoneLock, settings(:ZoneLock)) == 0
@test settings(:CktModel) == 1
@test settings(:CktModel, settings(:CktModel)) == 0
@test settings(:Trapezoidal) == 0
@test settings(:Trapezoidal, settings(:Trapezoidal)) == 0
@test settings(:AllocationFactors, 1.0) ≈ 0.0
@test settings(:NormVminpu) ≈ 0.95
@test settings(:NormVminpu, settings(:NormVminpu)) ≈ 0.0
@test settings(:NormVmaxpu) ≈ 1.05
@test settings(:NormVmaxpu, settings(:NormVmaxpu)) ≈ 0.0
@test settings(:EmergVminpu) ≈ 0.9
@test settings(:EmergVminpu, settings(:EmergVminpu)) ≈ 0.0
@test settings(:EmergVmaxpu) ≈ 1.08
@test settings(:EmergVmaxpu, settings(:EmergVmaxpu)) ≈ 0.0
@test settings(:UEWeight) ≈ 1.0
@test settings(:UEWeight, settings(:UEWeight)) ≈ 0.0
@test settings(:LossWeight) ≈ 1.0
@test settings(:LossWeight, settings(:LossWeight)) ≈ 0.0
@test settings(:PriceSignal) ≈ 25.0
@test settings(:PriceSignal, settings(:PriceSignal)) ≈ 0.0
@test settings(:AutoBusList) == ""
@test settings(:AutoBusList, settings(:AutoBusList)) == ""
@test settings(:PriceCurve) == ""
# @test settings(:PriceCurve, settings(:PriceCurve)) == ""
@test settings(:UERegs) == [10]
# @test settings(:UERegs, settings(:UERegs))
@test settings(:LossRegs) == [13]
# @test settings(:LossRegs, settings(:LossRegs))
@test settings(:VoltageBases) == [115.0,12.47,0.48,0.208]
# @test settings(:VoltageBases, settings(:VoltageBases))

end # testset

