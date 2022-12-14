module CapControls

using DocStringExtensions

using ..Lib
using ..Utils

@template (FUNCTIONS, METHODS) = """
                                 $(TYPEDSIGNATURES)
                                 $(DOCSTRING)
                                 """

"""Reset Capacitor Controls"""
function Reset(dss::DSSContext)
    @checked Lib.CapControls_Reset(dss.ctx)
end
Reset() = Reset(DSS_DEFAULT_CTX)

"""Array of strings with all CapControl names."""
function AllNames(dss::DSSContext)::Vector{String}
    return get_string_array(Lib.CapControls_Get_AllNames, dss.ctx)
end
AllNames() = AllNames(DSS_DEFAULT_CTX)

"""Transducer ratio from pirmary current to control current. (Getter)"""
function CTRatio(dss::DSSContext)::Float64
    return @checked Lib.CapControls_Get_CTratio(dss.ctx)
end
CTRatio() = CTRatio(DSS_DEFAULT_CTX)

"""Transducer ratio from pirmary current to control current. (Setter)"""
function CTRatio(dss::DSSContext, Value::Float64)
    @checked Lib.CapControls_Set_CTratio(dss.ctx, Value)
end
CTRatio(Value::Float64) = CTRatio(DSS_DEFAULT_CTX, Value)

"""Name of the Capacitor that is controlled. (Getter)"""
function Capacitor(dss::DSSContext)::String
    return get_string(@checked Lib.CapControls_Get_Capacitor(dss.ctx))
end
Capacitor() = Capacitor(DSS_DEFAULT_CTX)

"""Name of the Capacitor that is controlled. (Setter)"""
function Capacitor(dss::DSSContext, Value::String)
    @checked Lib.CapControls_Set_Capacitor(dss.ctx, Cstring(pointer(Value)))
end
Capacitor(Value::String) = Capacitor(DSS_DEFAULT_CTX, Value)

"""Number of CapControls in Active Circuit"""
function Count(dss::DSSContext)::Int
    return @checked Lib.CapControls_Get_Count(dss.ctx)
end
Count() = Count(DSS_DEFAULT_CTX)

"""Dead Time for Capacitor Control (Getter)"""
function DeadTime(dss::DSSContext)::Float64
    return @checked Lib.CapControls_Get_DeadTime(dss.ctx)
end
DeadTime() = DeadTime(DSS_DEFAULT_CTX)

"""Dead Time for Capacitor Control (Setter)"""
function DeadTime(dss::DSSContext, Value::Float64)
    @checked Lib.CapControls_Set_DeadTime(dss.ctx, Value)
end
DeadTime(Value::Float64) = DeadTime(DSS_DEFAULT_CTX, Value)

"""Time delay [s] to switch on after arming.  Control may reset before actually switching. (Getter)"""
function Delay(dss::DSSContext)::Float64
    return @checked Lib.CapControls_Get_Delay(dss.ctx)
end
Delay() = Delay(DSS_DEFAULT_CTX)

"""Time delay [s] to switch on after arming.  Control may reset before actually switching. (Setter)"""
function Delay(dss::DSSContext, Value::Float64)
    @checked Lib.CapControls_Set_Delay(dss.ctx, Value)
end
Delay(Value::Float64) = Delay(DSS_DEFAULT_CTX, Value)

"""Time delay [s] before switching off a step. Control may reset before actually switching. (Getter)"""
function DelayOff(dss::DSSContext)::Float64
    return @checked Lib.CapControls_Get_DelayOff(dss.ctx)
end
DelayOff() = DelayOff(DSS_DEFAULT_CTX)

"""Time delay [s] before switching off a step. Control may reset before actually switching. (Setter)"""
function DelayOff(dss::DSSContext, Value::Float64)
    @checked Lib.CapControls_Set_DelayOff(dss.ctx, Value)
end
DelayOff(Value::Float64) = DelayOff(DSS_DEFAULT_CTX, Value)

"""Sets the first CapControl as active. Return 0 if none."""
function First(dss::DSSContext)::Int
    return @checked Lib.CapControls_Get_First(dss.ctx)
end
First() = First(DSS_DEFAULT_CTX)

"""Type of automatic controller. (Getter)"""
function Mode(dss::DSSContext)::Lib.CapControlModes
    return @checked Lib.CapControls_Get_Mode(dss.ctx)
end
Mode() = Mode(DSS_DEFAULT_CTX)

"""Type of automatic controller. (Setter)"""
function Mode(dss::DSSContext, Value::Union{Int,Lib.CapControlModes})
    Value = convert(Lib.CapControlModes, Value)
    @checked Lib.CapControls_Set_Mode(dss.ctx, Value)
end
Mode(Value::Union{Int,Lib.CapControlModes}) = Mode(DSS_DEFAULT_CTX, Value)

"""Full name of the element that PT and CT are connected to. (Getter)"""
function MonitoredObj(dss::DSSContext)::String
    return get_string(@checked Lib.CapControls_Get_MonitoredObj(dss.ctx))
end
MonitoredObj() = MonitoredObj(DSS_DEFAULT_CTX)

"""Full name of the element that PT and CT are connected to. (Setter)"""
function MonitoredObj(dss::DSSContext, Value::String)
    @checked Lib.CapControls_Set_MonitoredObj(dss.ctx, Cstring(pointer(Value)))
end
MonitoredObj(Value::String) = MonitoredObj(DSS_DEFAULT_CTX, Value)

"""Terminal number on the element that PT and CT are connected to. (Getter)"""
function MonitoredTerm(dss::DSSContext)::Int
    return @checked Lib.CapControls_Get_MonitoredTerm(dss.ctx)
end
MonitoredTerm() = MonitoredTerm(DSS_DEFAULT_CTX)

"""Terminal number on the element that PT and CT are connected to. (Setter)"""
function MonitoredTerm(dss::DSSContext, Value::Int)
    @checked Lib.CapControls_Set_MonitoredTerm(dss.ctx, Value)
end
MonitoredTerm(Value::Int) = MonitoredTerm(DSS_DEFAULT_CTX, Value)

"""Sets a CapControl active by name. (Getter)"""
function Name(dss::DSSContext)::String
    return get_string(@checked Lib.CapControls_Get_Name(dss.ctx))
end
Name() = Name(DSS_DEFAULT_CTX)

"""Sets a CapControl active by name. (Setter)"""
function Name(dss::DSSContext, Value::String)
    @checked Lib.CapControls_Set_Name(dss.ctx, Cstring(pointer(Value)))
end
Name(Value::String) = Name(DSS_DEFAULT_CTX, Value)

"""Gets the next CapControl in the circut. Returns 0 if none."""
function Next(dss::DSSContext)::Int
    return @checked Lib.CapControls_Get_Next(dss.ctx)
end
Next() = Next(DSS_DEFAULT_CTX)

"""Threshold to switch off a step. See Mode for units. (Getter)"""
function OFFSetting(dss::DSSContext)::Int
    return @checked Lib.CapControls_Get_OFFSetting(dss.ctx)
end
OFFSetting() = OFFSetting(DSS_DEFAULT_CTX)

"""Threshold to switch off a step. See Mode for units. (Setter)"""
function OFFSetting(dss::DSSContext, Value::Int)
    @checked Lib.CapControls_Set_OFFSetting(dss.ctx, Value)
end
OFFSetting(Value::Int) = OFFSetting(DSS_DEFAULT_CTX, Value)

"""Threshold to arm or switch on a step.  See Mode for units. (Getter)"""
function ONSetting(dss::DSSContext)::Int
    return @checked Lib.CapControls_Get_ONSetting(dss.ctx)
end
ONSetting() = ONSetting(DSS_DEFAULT_CTX)

"""Threshold to arm or switch on a step.  See Mode for units. (Setter)"""
function ONSetting(dss::DSSContext, Value::Int)
    @checked Lib.CapControls_Set_ONSetting(dss.ctx, Value)
end
ONSetting(Value::Int) = ONSetting(DSS_DEFAULT_CTX, Value)

"""Transducer ratio from primary feeder to control voltage. (Getter)"""
function PTRatio(dss::DSSContext)::Float64
    return @checked Lib.CapControls_Get_PTratio(dss.ctx)
end
PTRatio() = PTRatio(DSS_DEFAULT_CTX)

"""Transducer ratio from primary feeder to control voltage. (Setter)"""
function PTRatio(dss::DSSContext, Value::Float64)
    @checked Lib.CapControls_Set_PTratio(dss.ctx, Value)
end
PTRatio(Value::Float64) = PTRatio(DSS_DEFAULT_CTX, Value)

"""Enables Vmin and Vmax to override the control Mode (Getter)"""
function UseVoltOverride(dss::DSSContext)::Bool
    return @checked(Lib.CapControls_Get_UseVoltOverride(dss.ctx)) != 0
end
UseVoltOverride() = UseVoltOverride(DSS_DEFAULT_CTX)

"""Enables Vmin and Vmax to override the control Mode (Setter)"""
function UseVoltOverride(dss::DSSContext, Value::Bool)
    @checked Lib.CapControls_Set_UseVoltOverride(dss.ctx, Value ? 1 : 0)
end
UseVoltOverride(Value::Bool) = UseVoltOverride(DSS_DEFAULT_CTX, Value)

"""With VoltOverride, swtich off whenever PT voltage exceeds this level. (Getter)"""
function Vmax(dss::DSSContext)::Float64
    return @checked Lib.CapControls_Get_Vmax(dss.ctx)
end
Vmax() = Vmax(DSS_DEFAULT_CTX)

"""With VoltOverride, swtich off whenever PT voltage exceeds this level. (Setter)"""
function Vmax(dss::DSSContext, Value::Float64)
    @checked Lib.CapControls_Set_Vmax(dss.ctx, Value)
end
Vmax(Value::Float64) = Vmax(DSS_DEFAULT_CTX, Value)

"""With VoltOverride, switch ON whenever PT voltage drops below this level. (Getter)"""
function Vmin(dss::DSSContext)::Float64
    return @checked Lib.CapControls_Get_Vmin(dss.ctx)
end
Vmin() = Vmin(DSS_DEFAULT_CTX)

"""With VoltOverride, switch ON whenever PT voltage drops below this level. (Setter)"""
function Vmin(dss::DSSContext, Value::Float64)
    @checked Lib.CapControls_Set_Vmin(dss.ctx, Value)
end
Vmin(Value::Float64) = Vmin(DSS_DEFAULT_CTX, Value)

"""CapControl Index (Getter)"""
function Idx(dss::DSSContext)::Int
    return @checked Lib.CapControls_Get_idx(dss.ctx)
end
Idx() = Idx(DSS_DEFAULT_CTX)

"""CapControl Index (Setter)"""
function Idx(dss::DSSContext, Value::Int)
    @checked Lib.CapControls_Set_idx(dss.ctx, Value)
end
Idx(Value::Int) = Idx(DSS_DEFAULT_CTX, Value)

end
