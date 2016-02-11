include("init.jl")
init8500()


@testset "loads" begin 

@test loads(:First) == 1
@test loads(:Next) == 2
@test loads(:Idx) == 2
@test loads(:Idx, loads(:Idx)) == 0
@test loads(:Count) == 1177
@test loads(:Class) == 1
@test loads(:Class, loads(:Class)) == 0
@test loads(:Model) == 1
@test loads(:Model, loads(:Model)) == 0
@test loads(:NumCust) == 1
@test loads(:NumCust, loads(:NumCust)) == 0
@test loads(:Status) == 0
@test loads(:Status, loads(:Status)) == 0
@test loads(:IsDelta) == false
@test loads(:IsDelta, loads(:IsDelta)) == 0
@test loads(:kW) ≈ 5.84
@test loads(:kW, loads(:kW)) ≈ 0.0
@test loads(:kV) ≈ 0.208
@test loads(:kV, loads(:kV)) ≈ 0.0
@test loads(:kvar) ≈ 1.4636419662242575
@test loads(:kvar, loads(:kvar)) ≈ 0.0
@test loads(:PF) ≈ 0.97
@test loads(:PF, loads(:PF)) ≈ 0.0
@test loads(:PctMean) ≈ 50.0
@test loads(:PctMean, loads(:PctMean)) ≈ 0.0
@test loads(:PctStdDev) ≈ 10.0
@test loads(:PctStdDev, loads(:PctStdDev)) ≈ 0.0
@test loads(:AllocationFactor) ≈ 0.5
@test loads(:AllocationFactor, loads(:AllocationFactor)) ≈ 0.0
@test loads(:CFactor) ≈ 4.0
@test loads(:CFactor, loads(:CFactor)) ≈ 0.0
@test loads(:CVRwatts) ≈ 1.0
@test loads(:CVRwatts, loads(:CVRwatts)) ≈ 0.0
@test loads(:CVRvars) ≈ 2.0
@test loads(:CVRvars, loads(:CVRvars)) ≈ 0.0
@test loads(:kVABase) ≈ 6.020618556701031
@test loads(:kVABase, loads(:kVABase)) ≈ 0.0
@test loads(:kWh) ≈ 0.0
@test loads(:kWh, loads(:kWh)) ≈ 0.0
@test loads(:kWhDays) ≈ 30.0
@test loads(:kWhDays, loads(:kWhDays)) ≈ 0.0
@test loads(:Rneut) ≈ -1.0
@test loads(:Rneut, loads(:Rneut)) ≈ 0.0
@test loads(:Vmaxpu) ≈ 1.05
@test loads(:Vmaxpu, loads(:Vmaxpu)) ≈ 0.0
@test loads(:VminEmerg) ≈ 0.0
@test loads(:VminEmerg, loads(:VminEmerg)) ≈ 0.0
@test loads(:VminNorm) ≈ 0.0
@test loads(:VminNorm, loads(:VminNorm)) ≈ 0.0
@test loads(:Vminpu) ≈ 0.88
@test loads(:Vminpu, loads(:Vminpu)) ≈ 0.0
@test loads(:XfkVA) ≈ 0.0
@test loads(:XfkVA, loads(:XfkVA)) ≈ 0.0
@test loads(:Xneut) ≈ 0.0
@test loads(:Xneut, loads(:Xneut)) ≈ 0.0
@test loads(:puSeriesRL) ≈ 50.0
@test loads(:puSeriesRL, loads(:puSeriesRL)) ≈ 0.0
@test loads(:RelWeighting) ≈ 1.0
@test loads(:RelWeighting, loads(:RelWeighting)) ≈ 0.0
@test loads(:Name) == "138237b0"
@test loads(:Name, loads(:Name)) == ""
@test loads(:CVRCurve) == ""
@test loads(:CVRCurve, loads(:CVRCurve)) == ""
@test loads(:Daily) == ""
@test loads(:Daily, loads(:Daily)) == ""
@test loads(:Duty) == ""
@test loads(:Duty, loads(:Duty)) == ""
@test loads(:Spectrum) == "defaultload"
@test loads(:Spectrum, loads(:Spectrum)) == ""
@test loads(:Yearly) == ""
@test loads(:Yearly, loads(:Yearly)) == ""
@test loads(:Growth) == ""
@test loads(:Growth, loads(:Growth)) == ""
@test loads(:AllNames)[end] == "2224500658a0"
@test loads(:ZipV) == Float64[]
# @test loads(:ZipV, loads(:ZipV))

end # testset

