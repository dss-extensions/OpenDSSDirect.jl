include("init.jl")
init8500()


@testset "RegControls" begin 

@test RegControls.First() == 1
@test RegControls.Next() == 2
@test RegControls.TapWinding() == 2
@test RegControls.TapWinding(RegControls.TapWinding()) == 0
@test RegControls.Winding() == 2
@test RegControls.Winding(RegControls.Winding()) == 0
@test RegControls.IsReversible() == 0
@test RegControls.IsReversible(RegControls.IsReversible()) == 0
@test RegControls.IsInverseTime() == 0
@test RegControls.IsInverseTime(RegControls.IsInverseTime()) == 0
@test RegControls.MaxTapChange() == 16
@test RegControls.MaxTapChange(RegControls.MaxTapChange()) == 0
@test RegControls.Count() == 12
@test RegControls.TapNumber() == 2
@test RegControls.TapNumber(RegControls.TapNumber()) == 0
@test RegControls.CTPrimary() ≈ 300.0
@test RegControls.CTPrimary(RegControls.CTPrimary()) ≈ 0.0
@test RegControls.PTRatio() ≈ 60.0
@test RegControls.PTRatio(RegControls.PTRatio()) ≈ 0.0
@test RegControls.ForwardR() ≈ 0.0
@test RegControls.ForwardR(RegControls.ForwardR()) ≈ 0.0
@test RegControls.ForwardX() ≈ 0.0
@test RegControls.ForwardX(RegControls.ForwardX()) ≈ 0.0
@test RegControls.ReverseR() ≈ 0.0
@test RegControls.ReverseR(RegControls.ReverseR()) ≈ 0.0
@test RegControls.ReverseX() ≈ 0.0
@test RegControls.ReverseX(RegControls.ReverseX()) ≈ 0.0
@test RegControls.Delay() ≈ 15.0
@test RegControls.Delay(RegControls.Delay()) ≈ 0.0
@test RegControls.TapDelay() ≈ 2.0
@test RegControls.TapDelay(RegControls.TapDelay()) ≈ 0.0
@test RegControls.VoltageLimit() ≈ 0.0
@test RegControls.VoltageLimit(RegControls.VoltageLimit()) ≈ 0.0
@test RegControls.ForwardBand() ≈ 2.0
@test RegControls.ForwardBand(RegControls.ForwardBand()) ≈ 0.0
@test RegControls.ForwardVreg() ≈ 126.5
@test RegControls.ForwardVreg(RegControls.ForwardVreg()) ≈ 0.0
@test RegControls.ReverseBand() ≈ 3.0
@test RegControls.ReverseBand(RegControls.ReverseBand()) ≈ 0.0
@test RegControls.ReverseVreg() ≈ 120.0
@test RegControls.ReverseVreg(RegControls.ReverseVreg()) ≈ 0.0
@test RegControls.Name() == "feeder_regb"
@test RegControls.Name(RegControls.Name()) == ""
@test RegControls.MonitoredBus() == ""
@test RegControls.MonitoredBus(RegControls.MonitoredBus()) == ""
@test RegControls.Transformer() == "feeder_regb"
@test RegControls.Transformer(RegControls.Transformer()) == ""
@test RegControls.AllNames()[end] == "vreg4_c"

end # testset

