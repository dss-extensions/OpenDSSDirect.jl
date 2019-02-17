
init8500()


@testset "RegControls" begin

@test RegControls.First() == 1
@test RegControls.Next() == 2
@test RegControls.TapWinding() == 2
@test RegControls.TapWinding(RegControls.TapWinding()) == nothing
@test RegControls.Winding() == 2
@test RegControls.Winding(RegControls.Winding()) == nothing
@test RegControls.IsReversible() == 0
@test RegControls.IsReversible(RegControls.IsReversible()) == nothing
@test RegControls.IsInverseTime() == 0
@test RegControls.IsInverseTime(RegControls.IsInverseTime()) == nothing
@test RegControls.MaxTapChange() == 16
@test RegControls.MaxTapChange(RegControls.MaxTapChange()) == nothing
@test RegControls.Count() == 12
@test RegControls.TapNumber() == 2
@test RegControls.TapNumber(RegControls.TapNumber()) == nothing
@test RegControls.CTPrimary() ≋ 300.0
@test RegControls.CTPrimary(RegControls.CTPrimary()) == nothing
@test RegControls.PTRatio() ≋ 60.0
@test RegControls.PTRatio(RegControls.PTRatio()) == nothing
@test RegControls.ForwardR() ≋ 0.0
@test RegControls.ForwardR(RegControls.ForwardR()) == nothing
@test RegControls.ForwardX() ≋ 0.0
@test RegControls.ForwardX(RegControls.ForwardX()) == nothing
@test RegControls.ReverseR() ≋ 0.0
@test RegControls.ReverseR(RegControls.ReverseR()) == nothing
@test RegControls.ReverseX() ≋ 0.0
@test RegControls.ReverseX(RegControls.ReverseX()) == nothing
@test RegControls.Delay() ≋ 15.0
@test RegControls.Delay(RegControls.Delay()) == nothing
@test RegControls.TapDelay() ≋ 2.0
@test RegControls.TapDelay(RegControls.TapDelay()) == nothing
@test RegControls.VoltageLimit() ≋ 0.0
@test RegControls.VoltageLimit(RegControls.VoltageLimit()) == nothing
@test RegControls.ForwardBand() ≋ 2.0
@test RegControls.ForwardBand(RegControls.ForwardBand()) == nothing
@test RegControls.ForwardVreg() ≋ 126.5
@test RegControls.ForwardVreg(RegControls.ForwardVreg()) == nothing
@test RegControls.ReverseBand() ≋ 3.0
@test RegControls.ReverseBand(RegControls.ReverseBand()) == nothing
@test RegControls.ReverseVreg() ≋ 120.0
@test RegControls.ReverseVreg(RegControls.ReverseVreg()) == nothing
@test RegControls.Name() == "feeder_regb"
@test RegControls.Name(RegControls.Name()) == nothing
@test RegControls.MonitoredBus() == ""
@test RegControls.MonitoredBus(RegControls.MonitoredBus()) == nothing
@test RegControls.Transformer() == "feeder_regb"
@test RegControls.Transformer(RegControls.Transformer()) == nothing
@test RegControls.AllNames()[end] == "vreg4_c"

arr = String[]
for i in OpenDSSDirect.EachMember(RegControls); push!(arr, RegControls.Name()); end
for (i, n) in enumerate(OpenDSSDirect.EachMember(RegControls, RegControls.Name))
    @test n == arr[i]
end
@test arr == RegControls.AllNames()
@test length(arr) == length(OpenDSSDirect.EachMember(RegControls))


end # testset

