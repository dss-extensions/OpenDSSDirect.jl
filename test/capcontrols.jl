include("init.jl")
init8500()


@testset "CapControls" begin 

@test CapControls.First() == 1
@test CapControls.Next() == 2
@test CapControls.Mode() == 2
@test CapControls.Mode(CapControls.Mode()) == 0
@test CapControls.MonitoredTerm() == 1
@test CapControls.MonitoredTerm(CapControls.MonitoredTerm()) == 0
@test CapControls.UseVoltOverride()
@test CapControls.UseVoltOverride(CapControls.UseVoltOverride()) == 0
@test CapControls.Count() == 9
@test CapControls.CTRatio() ≈ 1.0
@test CapControls.CTRatio(CapControls.CTRatio()) ≈ 0.0
@test CapControls.PTRatio() ≈ 1.0
@test CapControls.PTRatio(CapControls.PTRatio()) ≈ 0.0
@test CapControls.ONSetting() ≈ 150.0
@test CapControls.ONSetting(CapControls.ONSetting()) ≈ 0.0
@test CapControls.OFFSetting() ≈ -225.0 
@test CapControls.OFFSetting(CapControls.OFFSetting()) ≈ 0.0
@test CapControls.Vmax() ≈ 7740.0
@test CapControls.Vmax(CapControls.Vmax()) ≈ 0.0
@test CapControls.Vmin() ≈ 7110.0
@test CapControls.Vmin(CapControls.Vmin()) ≈ 0.0
@test CapControls.Delay() ≈ 101.0
@test CapControls.Delay(CapControls.Delay()) ≈ 0.0
@test CapControls.DelayOff() ≈ 101.0
@test CapControls.DelayOff(CapControls.DelayOff()) ≈ 0.0
@test CapControls.Name() == "capbank2b_ctrl"
@test CapControls.Name(CapControls.Name()) == "0"
@test CapControls.Capacitor() == "capbank2b"
@test CapControls.Capacitor(CapControls.Capacitor()) == "0"
@test CapControls.MonitoredObj() == "line.cap_1b"
@test CapControls.MonitoredObj(CapControls.MonitoredObj()) == "0"
@test CapControls.AllNames()[end] == "capbank0c_ctrl"

end # testset