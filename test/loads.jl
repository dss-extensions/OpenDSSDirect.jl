
init8500()


@testset "Loads" begin

@test Loads.First() == 1
@test Loads.Next() == 2
@test Loads.Idx() == 2
@test Loads.Idx(Loads.Idx()) == nothing
@test Loads.Count() == 1177
@test Loads.Class() == 1
@test Loads.Class(Loads.Class()) == nothing
@test Loads.Model() == 1
@test Loads.Model() == OpenDSSDirect.Lib.LoadModels_ConstPQ
@test Loads.Model(1) == nothing
@test Loads.Model(OpenDSSDirect.Lib.LoadModels_ConstPQ) == nothing
@test Loads.NumCust() == 1
@test Loads.NumCust(Loads.NumCust()) == nothing
@test Loads.Status() == 0
@test Loads.Status() == OpenDSSDirect.Lib.LoadStatus_Variable
@test Loads.Status(0) == nothing
@test Loads.Status(OpenDSSDirect.Lib.LoadStatus_Variable) == nothing
@test Loads.IsDelta() == false
@test Loads.IsDelta(Loads.IsDelta()) == nothing
@test Loads.kW() ≋ 5.84
@test Loads.kW(Loads.kW()) == nothing
@test Loads.kV() ≋ 0.208
@test Loads.kV(Loads.kV()) == nothing
@test Loads.kvar() ≋ 1.4636419662242575
@test Loads.kvar(Loads.kvar()) == nothing
@test Loads.PF() ≋ 0.97
@test Loads.PF(Loads.PF()) == nothing
@test Loads.PctMean() ≋ 50.0
@test Loads.PctMean(Loads.PctMean()) == nothing
@test Loads.PctStdDev() ≋ 10.0
@test Loads.PctStdDev(Loads.PctStdDev()) == nothing
@test Loads.AllocationFactor() ≋ 0.5
@test Loads.AllocationFactor(Loads.AllocationFactor()) == nothing
@test Loads.CFactor() ≋ 4.0
@test Loads.CFactor(Loads.CFactor()) == nothing
@test Loads.CVRwatts() ≋ 1.0
@test Loads.CVRwatts(Loads.CVRwatts()) == nothing
@test Loads.CVRvars() ≋ 2.0
@test Loads.CVRvars(Loads.CVRvars()) == nothing
@test Loads.kVABase() ≋ 6.020618556701031
@test Loads.kVABase(Loads.kVABase()) == nothing
@test Loads.kWh() ≋ 0.0
@test Loads.kWh(Loads.kWh()) == nothing
@test Loads.kWhDays() ≋ 30.0
@test Loads.kWhDays(Loads.kWhDays()) == nothing
@test Loads.Rneut() ≋ -1.0
@test Loads.Rneut(Loads.Rneut()) == nothing
@test Loads.Vmaxpu() ≋ 1.05
@test Loads.Vmaxpu(Loads.Vmaxpu()) == nothing
@test Loads.VminEmerg() ≋ 0.0
@test Loads.VminEmerg(Loads.VminEmerg()) == nothing
@test Loads.VminNorm() ≋ 0.0
@test Loads.VminNorm(Loads.VminNorm()) == nothing
@test Loads.Vminpu() ≋ 0.88
@test Loads.Vminpu(Loads.Vminpu()) == nothing
@test Loads.XfkVA() ≋ 0.0
@test Loads.XfkVA(Loads.XfkVA()) == nothing
@test Loads.Xneut() ≋ 0.0
@test Loads.Xneut(Loads.Xneut()) == nothing
@test Loads.puSeriesRL() ≋ 50.0
@test Loads.puSeriesRL(Loads.puSeriesRL()) == nothing
@test Loads.RelWeighting() ≋ 1.0
@test Loads.RelWeighting(Loads.RelWeighting()) == nothing
@test Loads.Name() == "138237b0"
@test Loads.Name(Loads.Name()) == nothing
@test Loads.CVRCurve() == ""
@test Loads.CVRCurve(Loads.CVRCurve()) == nothing
@test Loads.Daily() == ""
@test Loads.Daily(Loads.Daily()) == nothing
@test Loads.Duty() == ""
@test Loads.Duty(Loads.Duty()) == nothing
@test Loads.Spectrum() == "defaultload"
@test Loads.Spectrum(Loads.Spectrum()) == nothing
@test Loads.Yearly() == ""
@test Loads.Yearly(Loads.Yearly()) == nothing
@test Loads.Growth() == ""
@test Loads.Growth(Loads.Growth()) == nothing
@test Loads.AllNames()[end] == "2224500658a0"
@test Loads.ZipV() == Float64[]
@test Loads.ZipV(Float64[1.0, 1.0, 2.0, 2.0, 3.0, 3.0, 4.0]) == nothing
@test Loads.ZipV() ≋ Float64[1.0, 1.0, 2.0, 2.0, 3.0, 3.0, 4.0] # TODO: Does not work for less than 7 elements?

arr = String[]
for i in OpenDSSDirect.EachMember(Loads); push!(arr, Loads.Name()); end
for (i, n) in enumerate(OpenDSSDirect.EachMember(Loads, Loads.Name))
    @test n == arr[i]
end
@test arr == Loads.AllNames()
@test length(arr) == length(OpenDSSDirect.EachMember(Loads))


end # testset

