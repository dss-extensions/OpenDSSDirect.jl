module CapControls

using DocStringExtensions

using ..Lib
using ..Utils

@template (FUNCTIONS, METHODS) = """
                                 $(TYPEDSIGNATURES)
                                 $(DOCSTRING)
                                 """

"""Reset Capacitor Controls"""
function Reset()
    @checked Lib.CapControls_Reset(C_NULL_CTX)
end

"""Array of strings with all CapControl names."""
function AllNames()::Vector{String}
    return get_string_array(Lib.CapControls_Get_AllNames, C_NULL_CTX)
end

"""Transducer ratio from pirmary current to control current. (Getter)"""
function CTRatio()::Float64
    return @checked Lib.CapControls_Get_CTratio(C_NULL_CTX)
end

"""Transducer ratio from pirmary current to control current. (Setter)"""
function CTRatio(Value::Float64)
    @checked Lib.CapControls_Set_CTratio(C_NULL_CTX, Value)
end

"""Name of the Capacitor that is controlled. (Getter)"""
function Capacitor()::String
    return get_string(@checked Lib.CapControls_Get_Capacitor(C_NULL_CTX))
end

"""Name of the Capacitor that is controlled. (Setter)"""
function Capacitor(Value::String)
    @checked Lib.CapControls_Set_Capacitor(C_NULL_CTX, Cstring(pointer(Value)))
end

"""Number of CapControls in Active Circuit"""
function Count()::Int
    return @checked Lib.CapControls_Get_Count(C_NULL_CTX)
end

"""Dead Time for Capacitor Control (Getter)"""
function DeadTime()::Float64
    return @checked Lib.CapControls_Get_DeadTime(C_NULL_CTX)
end

"""Dead Time for Capacitor Control (Setter)"""
function DeadTime(Value::Float64)
    @checked Lib.CapControls_Set_DeadTime(C_NULL_CTX, Value)
end

"""Time delay [s] to switch on after arming.  Control may reset before actually switching. (Getter)"""
function Delay()::Float64
    return @checked Lib.CapControls_Get_Delay(C_NULL_CTX)
end

"""Time delay [s] to switch on after arming.  Control may reset before actually switching. (Setter)"""
function Delay(Value::Float64)
    @checked Lib.CapControls_Set_Delay(C_NULL_CTX, Value)
end

"""Time delay [s] before switching off a step. Control may reset before actually switching. (Getter)"""
function DelayOff()::Float64
    return @checked Lib.CapControls_Get_DelayOff(C_NULL_CTX)
end

"""Time delay [s] before switching off a step. Control may reset before actually switching. (Setter)"""
function DelayOff(Value::Float64)
    @checked Lib.CapControls_Set_DelayOff(C_NULL_CTX, Value)
end

"""Sets the first CapControl as active. Return 0 if none."""
function First()::Int
    return @checked Lib.CapControls_Get_First(C_NULL_CTX)
end

"""Type of automatic controller. (Getter)"""
function Mode()::Lib.CapControlModes
    return @checked Lib.CapControls_Get_Mode(C_NULL_CTX)
end

"""Type of automatic controller. (Setter)"""
function Mode(Value::Union{Int,Lib.CapControlModes})
    Value = convert(Lib.CapControlModes, Value)
    @checked Lib.CapControls_Set_Mode(C_NULL_CTX, Value)
end

"""Full name of the element that PT and CT are connected to. (Getter)"""
function MonitoredObj()::String
    return get_string(@checked Lib.CapControls_Get_MonitoredObj(C_NULL_CTX))
end

"""Full name of the element that PT and CT are connected to. (Setter)"""
function MonitoredObj(Value::String)
    @checked Lib.CapControls_Set_MonitoredObj(C_NULL_CTX, Cstring(pointer(Value)))
end

"""Terminal number on the element that PT and CT are connected to. (Getter)"""
function MonitoredTerm()::Int
    return @checked Lib.CapControls_Get_MonitoredTerm(C_NULL_CTX)
end

"""Terminal number on the element that PT and CT are connected to. (Setter)"""
function MonitoredTerm(Value::Int)
    @checked Lib.CapControls_Set_MonitoredTerm(C_NULL_CTX, Value)
end

"""Sets a CapControl active by name. (Getter)"""
function Name()::String
    return get_string(@checked Lib.CapControls_Get_Name(C_NULL_CTX))
end

"""Sets a CapControl active by name. (Setter)"""
function Name(Value::String)
    @checked Lib.CapControls_Set_Name(C_NULL_CTX, Cstring(pointer(Value)))
end

"""Gets the next CapControl in the circut. Returns 0 if none."""
function Next()::Int
    return @checked Lib.CapControls_Get_Next(C_NULL_CTX)
end

"""Threshold to switch off a step. See Mode for units. (Getter)"""
function OFFSetting()::Int
    return @checked Lib.CapControls_Get_OFFSetting(C_NULL_CTX)
end

"""Threshold to switch off a step. See Mode for units. (Setter)"""
function OFFSetting(Value::Int)
    @checked Lib.CapControls_Set_OFFSetting(C_NULL_CTX, Value)
end

"""Threshold to arm or switch on a step.  See Mode for units. (Getter)"""
function ONSetting()::Int
    return @checked Lib.CapControls_Get_ONSetting(C_NULL_CTX)
end

"""Threshold to arm or switch on a step.  See Mode for units. (Setter)"""
function ONSetting(Value::Int)
    @checked Lib.CapControls_Set_ONSetting(C_NULL_CTX, Value)
end

"""Transducer ratio from primary feeder to control voltage. (Getter)"""
function PTRatio()::Float64
    return @checked Lib.CapControls_Get_PTratio(C_NULL_CTX)
end

"""Transducer ratio from primary feeder to control voltage. (Setter)"""
function PTRatio(Value::Float64)
    @checked Lib.CapControls_Set_PTratio(C_NULL_CTX, Value)
end

"""Enables Vmin and Vmax to override the control Mode (Getter)"""
function UseVoltOverride()::Bool
    return @checked(Lib.CapControls_Get_UseVoltOverride(C_NULL_CTX)) != 0
end

"""Enables Vmin and Vmax to override the control Mode (Setter)"""
function UseVoltOverride(Value::Bool)
    @checked Lib.CapControls_Set_UseVoltOverride(C_NULL_CTX, Value ? 1 : 0)
end

"""With VoltOverride, swtich off whenever PT voltage exceeds this level. (Getter)"""
function Vmax()::Float64
    return @checked Lib.CapControls_Get_Vmax(C_NULL_CTX)
end

"""With VoltOverride, swtich off whenever PT voltage exceeds this level. (Setter)"""
function Vmax(Value::Float64)
    @checked Lib.CapControls_Set_Vmax(C_NULL_CTX, Value)
end

"""With VoltOverride, switch ON whenever PT voltage drops below this level. (Getter)"""
function Vmin()::Float64
    return @checked Lib.CapControls_Get_Vmin(C_NULL_CTX)
end

"""With VoltOverride, switch ON whenever PT voltage drops below this level. (Setter)"""
function Vmin(Value::Float64)
    @checked Lib.CapControls_Set_Vmin(C_NULL_CTX, Value)
end

"""CapControl Index (Getter)"""
function Idx()::Int
    return @checked Lib.CapControls_Get_idx(C_NULL_CTX)
end

"""CapControl Index (Setter)"""
function Idx(Value::Int)
    @checked Lib.CapControls_Set_idx(C_NULL_CTX, Value)
end

end
