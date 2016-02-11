include("init.jl")
init8500()


@testset "regcontrols" begin 

@test regcontrols(:First) == 1
@test regcontrols(:Next) == 2
@test regcontrols(:TapWinding) == 2
@test regcontrols(:TapWinding, regcontrols(:TapWinding)) == 0
@test regcontrols(:Winding) == 2
@test regcontrols(:Winding, regcontrols(:Winding)) == 0
@test regcontrols(:IsReversible) == 0
@test regcontrols(:IsReversible, regcontrols(:IsReversible)) == 0
@test regcontrols(:IsInverseTime) == 0
@test regcontrols(:IsInverseTime, regcontrols(:IsInverseTime)) == 0
@test regcontrols(:MaxTapChange) == 16
@test regcontrols(:MaxTapChange, regcontrols(:MaxTapChange)) == 0
@test regcontrols(:Count) == 12
@test regcontrols(:TapNumber) == 2
@test regcontrols(:TapNumber, regcontrols(:TapNumber)) == 0
@test regcontrols(:CTPrimary) ≈ 300.0
@test regcontrols(:CTPrimary, regcontrols(:CTPrimary)) ≈ 0.0
@test regcontrols(:PTRatio) ≈ 60.0
@test regcontrols(:PTRatio, regcontrols(:PTRatio)) ≈ 0.0
@test regcontrols(:ForwardR) ≈ 0.0
@test regcontrols(:ForwardR, regcontrols(:ForwardR)) ≈ 0.0
@test regcontrols(:ForwardX) ≈ 0.0
@test regcontrols(:ForwardX, regcontrols(:ForwardX)) ≈ 0.0
@test regcontrols(:ReverseR) ≈ 0.0
@test regcontrols(:ReverseR, regcontrols(:ReverseR)) ≈ 0.0
@test regcontrols(:ReverseX) ≈ 0.0
@test regcontrols(:ReverseX, regcontrols(:ReverseX)) ≈ 0.0
@test regcontrols(:Delay) ≈ 15.0
@test regcontrols(:Delay, regcontrols(:Delay)) ≈ 0.0
@test regcontrols(:TapDelay) ≈ 2.0
@test regcontrols(:TapDelay, regcontrols(:TapDelay)) ≈ 0.0
@test regcontrols(:VoltageLimit) ≈ 0.0
@test regcontrols(:VoltageLimit, regcontrols(:VoltageLimit)) ≈ 0.0
@test regcontrols(:ForwardBand) ≈ 2.0
@test regcontrols(:ForwardBand, regcontrols(:ForwardBand)) ≈ 0.0
@test regcontrols(:ForwardVreg) ≈ 126.5
@test regcontrols(:ForwardVreg, regcontrols(:ForwardVreg)) ≈ 0.0
@test regcontrols(:ReverseBand) ≈ 3.0
@test regcontrols(:ReverseBand, regcontrols(:ReverseBand)) ≈ 0.0
@test regcontrols(:ReverseVreg) ≈ 120.0
@test regcontrols(:ReverseVreg, regcontrols(:ReverseVreg)) ≈ 0.0
@test regcontrols(:Name) == "feeder_regb"
@test regcontrols(:Name, regcontrols(:Name)) == ""
@test regcontrols(:MonitoredBus) == ""
@test regcontrols(:MonitoredBus, regcontrols(:MonitoredBus)) == ""
@test regcontrols(:Transformer) == "feeder_regb"
@test regcontrols(:Transformer, regcontrols(:Transformer)) == ""
@test regcontrols(:AllNames)[end] == "vreg4_c"

end # testset

