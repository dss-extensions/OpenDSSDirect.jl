module Storages

using DocStringExtensions

using ..Lib
using ..Utils

@template (FUNCTIONS, METHODS) = """
                                 $(TYPEDSIGNATURES)
                                 $(DOCSTRING)
                                """


"""
Array of names of all Storage objects.
"""
function AllNames(dss::DSSContext)::Vector{String}
    return get_string_array(Lib.Storages_Get_AllNames, dss.ctx)
end
AllNames() = AllNames(DSS_DEFAULT_CTX)

"""
Gets the name of the active Storage object.
"""
function Name(dss::DSSContext)::String
    return get_string(@checked Lib.Storages_Get_Name(dss.ctx))
end
Name() = Name(DSS_DEFAULT_CTX)

"""
Sets a Storage object active by name.
"""
function Name(dss::DSSContext, Value::String)
    @checked Lib.Storages_Set_Name(dss.ctx, Cstring(pointer(Value)))
end
Name(Value::String) = Name(DSS_DEFAULT_CTX, Value)

"""
Number of Storage Objects in Active Circuit
"""
function Count(dss::DSSContext)::Int
    return @checked Lib.Storages_Get_Count(dss.ctx)
end
Count() = Count(DSS_DEFAULT_CTX)

"""
Sets first Storage to be active.
Returns 0 if none.
"""
function First(dss::DSSContext)::Int
    return @checked Lib.Storages_Get_First(dss.ctx)
end
First() = First(DSS_DEFAULT_CTX)

"""
Sets next Storage to be active.
Returns 0 if no more.
"""
function Next(dss::DSSContext)::Int
    return @checked Lib.Storages_Get_Next(dss.ctx)
end
Next() = Next(DSS_DEFAULT_CTX)

"""
Returns the index of the current active Storage (1-based)

(Getter)
"""
function Idx(dss::DSSContext)::Int
    return @checked Lib.Storages_Get_idx(dss.ctx)
end
Idx() = Idx(DSS_DEFAULT_CTX)

"""
Activate Storage by index (1-based)

(Setter)
"""
function Idx(dss::DSSContext, Value::Int)
    @checked Lib.Storages_Set_idx(dss.ctx, Value)
end
Idx(Value::Int) = Idx(DSS_DEFAULT_CTX, Value)

"""
Per unit state of charge

(Getter)
"""
function puSOC(dss::DSSContext)::Float64
    return @checked Lib.Storages_Get_puSOC(dss.ctx)
end
puSOC() = puSOC(DSS_DEFAULT_CTX)

"""
Per unit state of charge

(Setter)
"""
function puSOC(dss::DSSContext, Value::Float64)
    @checked Lib.Storages_Set_puSOC(dss.ctx, Value)
end
puSOC(Value::Float64) = puSOC(DSS_DEFAULT_CTX, Value)

"""
Get state: 0=Idling; 1=Discharging; -1=Charging;

Related enumeration: StorageStates
"""
function State(dss::DSSContext)::Lib.StorageStates
    return @checked Lib.Storages_Get_State(dss.ctx)
end
State() = State(DSS_DEFAULT_CTX)

"""
Set state: 0=Idling; 1=Discharging; -1=Charging;

Related enumeration: StorageStates
"""
function State(dss::DSSContext, Value::Union{Lib.StorageStates,Int})
    @checked Lib.Storages_Set_State(dss.ctx, Value)
end
State(Value::Union{Lib.StorageStates,Int}) = State(DSS_DEFAULT_CTX, Value)

"""
Array of Storage energy meter register names

See also the enum `GeneratorRegisters`.
"""
function RegisterNames(dss::DSSContext)::Vector{String}
    return get_string_array(Lib.Storages_Get_RegisterNames, dss.ctx)
end
RegisterNames() = RegisterNames(DSS_DEFAULT_CTX)

"""
Array of values in Storage registers.
"""
function RegisterValues(dss::DSSContext)::Vector{Float64}
    return get_float64_array(Lib.Storages_Get_RegisterValues, dss.ctx)
end
RegisterValues() = RegisterValues(DSS_DEFAULT_CTX)

"""
Requested kvar value.

Final kvar is subjected to the inverter ratings. Sets inverter to operate in constant kvar mode.

(Getter)
"""
function kvar(dss::DSSContext)::Float64
    return @checked Lib.Storages_Get_kvar(dss.ctx)
end
kvar() = kvar(DSS_DEFAULT_CTX)

"""
Requested kvar value.

Final kvar is subjected to the inverter ratings. Sets inverter to operate in constant kvar mode.

(Setter)
"""
function kvar(dss::DSSContext, Value::Float64)
    @checked Lib.Storages_Set_kvar(dss.ctx, Value)
end
kvar(Value::Float64) = kvar(DSS_DEFAULT_CTX, Value)

"""
Time of day in fractional hours (0230 = 2.5) at which Storage element will automatically go into charge state.

(Getter)
"""
function TimeChargeTrig(dss::DSSContext)::Float64
    return @checked Lib.Storages_Get_TimeChargeTrig(dss.ctx)
end
TimeChargeTrig() = TimeChargeTrig(DSS_DEFAULT_CTX)

"""
Time of day in fractional hours (0230 = 2.5) at which Storage element will automatically go into charge state.

(Setter)
"""
function TimeChargeTrig(dss::DSSContext, Value::Float64)
    @checked Lib.Storages_Set_TimeChargeTrig(dss.ctx, Value)
end
TimeChargeTrig(Value::Float64) = TimeChargeTrig(DSS_DEFAULT_CTX, Value)

"""
Get/set the requested kW value. Final kW is subjected to the inverter ratings.

(Getter)
"""
function kW(dss::DSSContext)::Float64
    return @checked Lib.Storages_Get_kW(dss.ctx)
end
kW() = kW(DSS_DEFAULT_CTX)

"""
Get/set the requested kW value. Final kW is subjected to the inverter ratings.

(Setter)
"""
function kW(dss::DSSContext, Value::Float64)
    @checked Lib.Storages_Set_kW(dss.ctx, Value)
end
kW(Value::Float64) = kW(DSS_DEFAULT_CTX, Value)

"""
Tolerance (%) for the closed loop controller of the inverter

(Getter)
"""
function PITol(dss::DSSContext)::Float64
    return @checked Lib.Storages_Get_PITol(dss.ctx)
end
PITol() = PITol(DSS_DEFAULT_CTX)

"""
Tolerance (%) for the closed loop controller of the inverter

(Setter)
"""
function PITol(dss::DSSContext, Value::Float64)
    @checked Lib.Storages_Set_PITol(dss.ctx, Value)
end
PITol(Value::Float64) = PITol(DSS_DEFAULT_CTX, Value)

"""
Dispatch trigger value for charging the Storage.

(Getter)
"""
function ChargeTrigger(dss::DSSContext)::Float64
    return @checked Lib.Storages_Get_ChargeTrigger(dss.ctx)
end
ChargeTrigger() = ChargeTrigger(DSS_DEFAULT_CTX)

"""
Dispatch trigger value for charging the Storage.

(Setter)
"""
function ChargeTrigger(dss::DSSContext, Value::Float64)
    @checked Lib.Storages_Set_ChargeTrigger(dss.ctx, Value)
end
ChargeTrigger(Value::Float64) = ChargeTrigger(DSS_DEFAULT_CTX, Value)

"""
Indicates if the reactive power generation/absorption does not respect the inverter status

(Getter)
"""
function VarFollowInverter(dss::DSSContext)::Float64
    return @checked Lib.Storages_Get_VarFollowInverter(dss.ctx)
end
VarFollowInverter() = VarFollowInverter(DSS_DEFAULT_CTX)

"""
Indicates if the reactive power generation/absorption does not respect the inverter status

(Setter)
"""
function VarFollowInverter(dss::DSSContext, Value::Float64)
    @checked Lib.Storages_Set_VarFollowInverter(dss.ctx, Value)
end
VarFollowInverter(Value::Float64) = VarFollowInverter(DSS_DEFAULT_CTX, Value)

"""
Requested PF value.

(Getter)
"""
function PF(dss::DSSContext)::Float64
    return @checked Lib.Storages_Get_PF(dss.ctx)
end
PF() = PF(DSS_DEFAULT_CTX)

"""
Requested PF value.

(Setter)
"""
function PF(dss::DSSContext, Value::Float64)
    @checked Lib.Storages_Set_PF(dss.ctx, Value)
end
PF(Value::Float64) = PF(DSS_DEFAULT_CTX, Value)

"""
Percentage efficiency for CHARGING the Storage element.

(Getter)
"""
function EffCharge(dss::DSSContext)::Float64
    return @checked Lib.Storages_Get_EffCharge(dss.ctx)
end
EffCharge() = EffCharge(DSS_DEFAULT_CTX)

"""
Percentage efficiency for CHARGING the Storage element.

(Setter)
"""
function EffCharge(dss::DSSContext, Value::Float64)
    @checked Lib.Storages_Set_EffCharge(dss.ctx, Value)
end
EffCharge(Value::Float64) = EffCharge(DSS_DEFAULT_CTX, Value)

"""
Current limit per phase for the IBR when operating in GFM mode.

(Getter)
"""
function AmpLimit(dss::DSSContext)::Float64
    return @checked Lib.Storages_Get_AmpLimit(dss.ctx)
end
AmpLimit() = AmpLimit(DSS_DEFAULT_CTX)

"""
Current limit per phase for the IBR when operating in GFM mode.

(Setter)
"""
function AmpLimit(dss::DSSContext, Value::Float64)
    @checked Lib.Storages_Set_AmpLimit(dss.ctx, Value)
end
AmpLimit(Value::Float64) = AmpLimit(DSS_DEFAULT_CTX, Value)

"""
Indicates the voltage level (%) respect to the base voltage level for which the Inverter will operate.

(Getter)
"""
function SafeVoltage(dss::DSSContext)::Float64
    return @checked Lib.Storages_Get_SafeVoltage(dss.ctx)
end
SafeVoltage() = SafeVoltage(DSS_DEFAULT_CTX)

"""
Indicates the voltage level (%) respect to the base voltage level for which the Inverter will operate.

(Setter)
"""
function SafeVoltage(dss::DSSContext, Value::Float64)
    @checked Lib.Storages_Set_SafeVoltage(dss.ctx, Value)
end
SafeVoltage(Value::Float64) = SafeVoltage(DSS_DEFAULT_CTX, Value)

"""
Percentage efficiency for DISCHARGING the Storage element.

(Getter)
"""
function EffDischarge(dss::DSSContext)::Float64
    return @checked Lib.Storages_Get_EffDischarge(dss.ctx)
end
EffDischarge() = EffDischarge(DSS_DEFAULT_CTX)

"""
Percentage efficiency for DISCHARGING the Storage element.

(Setter)
"""
function EffDischarge(dss::DSSContext, Value::Float64)
    @checked Lib.Storages_Set_EffDischarge(dss.ctx, Value)
end
EffDischarge(Value::Float64) = EffDischarge(DSS_DEFAULT_CTX, Value)

"""
Limits current magnitude to Vminpu value for both 1-phase and 3-phase Storage similar to Generator Model 7.
For 3-phase, limits the positive-sequence current but not the negative-sequence."

(Getter)
"""
function LimitCurrent(dss::DSSContext)::Float64
    return @checked Lib.Storages_Get_LimitCurrent(dss.ctx)
end
LimitCurrent() = LimitCurrent(DSS_DEFAULT_CTX)

"""
Limits current magnitude to Vminpu value for both 1-phase and 3-phase Storage similar to Generator Model 7.
For 3-phase, limits the positive-sequence current but not the negative-sequence."

(Setter)
"""
function LimitCurrent(dss::DSSContext, Value::Float64)
    @checked Lib.Storages_Set_LimitCurrent(dss.ctx, Value)
end
LimitCurrent(Value::Float64) = LimitCurrent(DSS_DEFAULT_CTX, Value)

"""
Proportional gain for the PI controller within the inverter.
Use it to modify the controller response in dynamics simulation mode.

(Getter)
"""
function Kp(dss::DSSContext)::Float64
    return @checked Lib.Storages_Get_Kp(dss.ctx)
end
Kp() = Kp(DSS_DEFAULT_CTX)

"""
Proportional gain for the PI controller within the inverter.
Use it to modify the controller response in dynamics simulation mode.

(Setter)
"""
function Kp(dss::DSSContext, Value::Float64)
    @checked Lib.Storages_Set_Kp(dss.ctx, Value)
end
Kp(Value::Float64) = Kp(DSS_DEFAULT_CTX, Value)

"""
Rated Storage capacity in kWh.

(Getter)
"""
function kWhRated(dss::DSSContext)::Float64
    return @checked Lib.Storages_Get_kWhRated(dss.ctx)
end
kWhRated() = kWhRated(DSS_DEFAULT_CTX)

"""
Rated Storage capacity in kWh.

(Setter)
"""
function kWhRated(dss::DSSContext, Value::Float64)
    @checked Lib.Storages_Set_kWhRated(dss.ctx, Value)
end
kWhRated(Value::Float64) = kWhRated(DSS_DEFAULT_CTX, Value)

"""
Use it for fine tuning the current limiter when active.

(Getter)
"""
function AmpLimitGain(dss::DSSContext)::Float64
    return @checked Lib.Storages_Get_AmpLimitGain(dss.ctx)
end
AmpLimitGain() = AmpLimitGain(DSS_DEFAULT_CTX)

"""
Use it for fine tuning the current limiter when active.

(Setter)
"""
function AmpLimitGain(dss::DSSContext, Value::Float64)
    @checked Lib.Storages_Set_AmpLimitGain(dss.ctx, Value)
end
AmpLimitGain(Value::Float64) = AmpLimitGain(DSS_DEFAULT_CTX, Value)

"""
Nominal rated (1.0 per unit) voltage, kV, for Storage element.

(Getter)
"""
function kV(dss::DSSContext)::Float64
    return @checked Lib.Storages_Get_kV(dss.ctx)
end
kV() = kV(DSS_DEFAULT_CTX)

"""
Nominal rated (1.0 per unit) voltage, kV, for Storage element.

(Setter)
"""
function kV(dss::DSSContext, Value::Float64)
    @checked Lib.Storages_Set_kV(dss.ctx, Value)
end
kV(Value::Float64) = kV(DSS_DEFAULT_CTX, Value)

"""
Dispatch trigger value for discharging the Storage.

(Getter)
"""
function DischargeTrigger(dss::DSSContext)::Float64
    return @checked Lib.Storages_Get_DischargeTrigger(dss.ctx)
end
DischargeTrigger() = DischargeTrigger(DSS_DEFAULT_CTX)

"""
Dispatch trigger value for discharging the Storage.

(Setter)
"""
function DischargeTrigger(dss::DSSContext, Value::Float64)
    @checked Lib.Storages_Set_DischargeTrigger(dss.ctx, Value)
end
DischargeTrigger(Value::Float64) = DischargeTrigger(DSS_DEFAULT_CTX, Value)

"""
Inverter nameplate capability (in kVA). Used as the base for Dynamics mode and Harmonics mode values.

(Getter)
"""
function kVA(dss::DSSContext)::Float64
    return @checked Lib.Storages_Get_kVA(dss.ctx)
end
kVA() = kVA(DSS_DEFAULT_CTX)

"""
Inverter nameplate capability (in kVA). Used as the base for Dynamics mode and Harmonics mode values.

(Setter)
"""
function kVA(dss::DSSContext, Value::Float64)
    @checked Lib.Storages_Set_kVA(dss.ctx, Value)
end
kVA(Value::Float64) = kVA(DSS_DEFAULT_CTX, Value)

"""
kW rating of power output. Base for Loadshapes when DispMode=Follow. Sets kVA property if it has not been specified yet.

(Getter)
"""
function kWRated(dss::DSSContext)::Float64
    return @checked Lib.Storages_Get_kWRated(dss.ctx)
end
kWRated() = kWRated(DSS_DEFAULT_CTX)

"""
kW rating of power output. Base for Loadshapes when DispMode=Follow. Sets kVA property if it has not been specified yet.

(Setter)
"""
function kWRated(dss::DSSContext, Value::Float64)
    @checked Lib.Storages_Set_kWRated(dss.ctx, Value)
end
kWRated(Value::Float64) = kWRated(DSS_DEFAULT_CTX, Value)

"""
Control mode for the inverter. It can be one of {GFM = 1 | GFL* = 0}.

(Getter)
"""
function ControlMode(dss::DSSContext)::Float64
    return @checked Lib.Storages_Get_ControlMode(dss.ctx)
end
ControlMode() = ControlMode(DSS_DEFAULT_CTX)

"""
Control mode for the inverter. It can be one of {GFM = 1 | GFL* = 0}.

(Setter)
"""
function ControlMode(dss::DSSContext, Value::Float64)
    @checked Lib.Storages_Set_ControlMode(dss.ctx, Value)
end
ControlMode(Value::Float64) = ControlMode(DSS_DEFAULT_CTX, Value)

"""
Rated voltage (kV) at the input of the inverter while the storage is discharging

(Getter)
"""
function kVDC(dss::DSSContext)::Float64
    return @checked Lib.Storages_Get_kVDC(dss.ctx)
end
kVDC() = kVDC(DSS_DEFAULT_CTX)

"""
Rated voltage (kV) at the input of the inverter while the storage is discharging

(Setter)
"""
function kVDC(dss::DSSContext, Value::Float64)
    @checked Lib.Storages_Set_kVDC(dss.ctx, Value)
end
kVDC(Value::Float64) = kVDC(DSS_DEFAULT_CTX, Value)

"""
(Read only) Indicates whether the inverter entered (Yes) or not (No) into Safe Mode.
"""
function SafeMode(dss::DSSContext)::Float64
    return @checked Lib.Storages_Get_SafeMode(dss.ctx)
end
SafeMode() = SafeMode(DSS_DEFAULT_CTX)

end