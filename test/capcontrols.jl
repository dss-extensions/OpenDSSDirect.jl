
init8500()


@testset "CapControls" begin

@test CapControls.First() == 1
@test CapControls.Next() == 2
@test CapControls.Mode() == 2
@test CapControls.Mode() == OpenDSSDirect.Lib.CapControlModes_KVAR
@test CapControls.Mode(2) == nothing
@test CapControls.Mode(OpenDSSDirect.Lib.CapControlModes_KVAR) == nothing
@test CapControls.MonitoredTerm() == 1
@test CapControls.MonitoredTerm(CapControls.MonitoredTerm()) == nothing
@test CapControls.UseVoltOverride()
@test CapControls.UseVoltOverride(CapControls.UseVoltOverride()) == nothing
@test CapControls.Count() == 9
@test CapControls.CTRatio() ≋ 1.0
@test CapControls.CTRatio(CapControls.CTRatio()) == nothing
@test CapControls.PTRatio() ≋ 1.0
@test CapControls.PTRatio(CapControls.PTRatio()) == nothing
@test CapControls.ONSetting() ≋ 150.0
@test CapControls.ONSetting(CapControls.ONSetting()) == nothing
@test CapControls.OFFSetting() ≋ -225.0
@test CapControls.OFFSetting(CapControls.OFFSetting()) == nothing
@test CapControls.Vmax() ≋ 7740.0
@test CapControls.Vmax(CapControls.Vmax()) == nothing
@test CapControls.Vmin() ≋ 7110.0
@test CapControls.Vmin(CapControls.Vmin()) == nothing
@test CapControls.Delay() ≋ 101.0
@test CapControls.Delay(CapControls.Delay()) == nothing
@test CapControls.DelayOff() ≋ 101.0
@test CapControls.DelayOff(CapControls.DelayOff()) == nothing
@test CapControls.Name() == "capbank2b_ctrl"
@test CapControls.Name(CapControls.Name()) == nothing
@test CapControls.Capacitor() == "capbank2b"
@test CapControls.Capacitor(CapControls.Capacitor()) == nothing
@test CapControls.MonitoredObj() == "line.cap_1b"
@test CapControls.MonitoredObj(CapControls.MonitoredObj()) == nothing
@test CapControls.AllNames()[end] == "capbank0c_ctrl"

arr = String[]
for i in OpenDSSDirect.EachMember(CapControls); push!(arr, CapControls.Name()); end
for (i, n) in enumerate(OpenDSSDirect.EachMember(CapControls, CapControls.Name))
    @test n == arr[i]
end
@test arr == CapControls.AllNames()
@test length(arr) == length(OpenDSSDirect.EachMember(CapControls))

end # testset
