include("init.jl")
init8500()


@testset "capcontrols" begin 

@test capcontrols(:First) == 1
@test capcontrols(:Next) == 2
@test capcontrols(:Mode) == 2
@test capcontrols(:Mode, capcontrols(:Mode)) == 0
@test capcontrols(:MonitoredTerm) == 1
@test capcontrols(:MonitoredTerm, capcontrols(:MonitoredTerm)) == 0
@test capcontrols(:UseVoltOverride)
@test capcontrols(:UseVoltOverride, capcontrols(:UseVoltOverride)) == 0
@test capcontrols(:Count) == 9
@test capcontrols(:CTRatio) ≈ 1.0
@test capcontrols(:CTRatio, capcontrols(:CTRatio)) ≈ 0.0
@test capcontrols(:PTRatio) ≈ 1.0
@test capcontrols(:PTRatio, capcontrols(:PTRatio)) ≈ 0.0
@test capcontrols(:ONSetting) ≈ 150.0
@test capcontrols(:ONSetting, capcontrols(:ONSetting)) ≈ 0.0
@test capcontrols(:OFFSetting) ≈ -225.0 
@test capcontrols(:OFFSetting, capcontrols(:OFFSetting)) ≈ 0.0
@test capcontrols(:Vmax) ≈ 7740.0
@test capcontrols(:Vmax, capcontrols(:Vmax)) ≈ 0.0
@test capcontrols(:Vmin) ≈ 7110.0
@test capcontrols(:Vmin, capcontrols(:Vmin)) ≈ 0.0
@test capcontrols(:Delay) ≈ 101.0
@test capcontrols(:Delay, capcontrols(:Delay)) ≈ 0.0
@test capcontrols(:DelayOff) ≈ 101.0
@test capcontrols(:DelayOff, capcontrols(:DelayOff)) ≈ 0.0
@test capcontrols(:Name) == "capbank2b_ctrl"
@test capcontrols(:Name, capcontrols(:Name)) == "0"
@test capcontrols(:Capacitor) == "capbank2b"
@test capcontrols(:Capacitor, capcontrols(:Capacitor)) == "0"
@test capcontrols(:MonitoredObj) == "line.cap_1b"
@test capcontrols(:MonitoredObj, capcontrols(:MonitoredObj)) == "0"
@test capcontrols(:AllNames)[end] == "capbank0c_ctrl"

end # testset