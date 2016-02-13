include("init.jl")
init8500()


@testset "Loads" begin 

@test Loads.First() == 1
@test Loads.Next() == 2
@test Loads.Idx() == 2
@test Loads.Idx(Loads.Idx()) == 0
@test Loads.Count() == 1177
@test Loads.Class() == 1
@test Loads.Class(Loads.Class()) == 0
@test Loads.Model() == 1
@test Loads.Model(Loads.Model()) == 0
@test Loads.NumCust() == 1
@test Loads.NumCust(Loads.NumCust()) == 0
@test Loads.Status() == 0
@test Loads.Status(Loads.Status()) == 0
@test Loads.IsDelta() == false
@test Loads.IsDelta(Loads.IsDelta()) == 0
@test Loads.kW() ≈ 5.84
@test Loads.kW(Loads.kW()) ≈ 0.0
@test Loads.kV() ≈ 0.208
@test Loads.kV(Loads.kV()) ≈ 0.0
@test Loads.kvar() ≈ 1.4636419662242575
@test Loads.kvar(Loads.kvar()) ≈ 0.0
@test Loads.PF() ≈ 0.97
@test Loads.PF(Loads.PF()) ≈ 0.0
@test Loads.PctMean() ≈ 50.0
@test Loads.PctMean(Loads.PctMean()) ≈ 0.0
@test Loads.PctStdDev() ≈ 10.0
@test Loads.PctStdDev(Loads.PctStdDev()) ≈ 0.0
@test Loads.AllocationFactor() ≈ 0.5
@test Loads.AllocationFactor(Loads.AllocationFactor()) ≈ 0.0
@test Loads.CFactor() ≈ 4.0
@test Loads.CFactor(Loads.CFactor()) ≈ 0.0
@test Loads.CVRwatts() ≈ 1.0
@test Loads.CVRwatts(Loads.CVRwatts()) ≈ 0.0
@test Loads.CVRvars() ≈ 2.0
@test Loads.CVRvars(Loads.CVRvars()) ≈ 0.0
@test Loads.kVABase() ≈ 6.020618556701031
@test Loads.kVABase(Loads.kVABase()) ≈ 0.0
@test Loads.kWh() ≈ 0.0
@test Loads.kWh(Loads.kWh()) ≈ 0.0
@test Loads.kWhDays() ≈ 30.0
@test Loads.kWhDays(Loads.kWhDays()) ≈ 0.0
@test Loads.Rneut() ≈ -1.0
@test Loads.Rneut(Loads.Rneut()) ≈ 0.0
@test Loads.Vmaxpu() ≈ 1.05
@test Loads.Vmaxpu(Loads.Vmaxpu()) ≈ 0.0
@test Loads.VminEmerg() ≈ 0.0
@test Loads.VminEmerg(Loads.VminEmerg()) ≈ 0.0
@test Loads.VminNorm() ≈ 0.0
@test Loads.VminNorm(Loads.VminNorm()) ≈ 0.0
@test Loads.Vminpu() ≈ 0.88
@test Loads.Vminpu(Loads.Vminpu()) ≈ 0.0
@test Loads.XfkVA() ≈ 0.0
@test Loads.XfkVA(Loads.XfkVA()) ≈ 0.0
@test Loads.Xneut() ≈ 0.0
@test Loads.Xneut(Loads.Xneut()) ≈ 0.0
@test Loads.puSeriesRL() ≈ 50.0
@test Loads.puSeriesRL(Loads.puSeriesRL()) ≈ 0.0
@test Loads.RelWeighting() ≈ 1.0
@test Loads.RelWeighting(Loads.RelWeighting()) ≈ 0.0
@test Loads.Name() == "138237b0"
@test Loads.Name(Loads.Name()) == ""
@test Loads.CVRCurve() == ""
@test Loads.CVRCurve(Loads.CVRCurve()) == ""
@test Loads.Daily() == ""
@test Loads.Daily(Loads.Daily()) == ""
@test Loads.Duty() == ""
@test Loads.Duty(Loads.Duty()) == ""
@test Loads.Spectrum() == "defaultload"
@test Loads.Spectrum(Loads.Spectrum()) == ""
@test Loads.Yearly() == ""
@test Loads.Yearly(Loads.Yearly()) == ""
@test Loads.Growth() == ""
@test Loads.Growth(Loads.Growth()) == ""
@test Loads.AllNames()[end] == "2224500658a0"
@test Loads.ZipV() == Float64[]
# @test Loads.ZipV(Loads.ZipV())

end # testset

