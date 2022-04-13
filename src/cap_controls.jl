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
    @checked Lib.CapControls_Reset()
end

"""Array of strings with all CapControl names."""
function AllNames()::Vector{String}
    return get_string_array(Lib.CapControls_Get_AllNames)
end

"""Transducer ratio from pirmary current to control current. (Getter)"""
function CTRatio()::Float64
    return @checked Lib.CapControls_Get_CTratio()
end

"""Transducer ratio from pirmary current to control current. (Setter)"""
function CTRatio(Value::Float64)
    @checked Lib.CapControls_Set_CTratio(Value)
end

"""Name of the Capacitor that is controlled. (Getter)"""
function Capacitor()::String
    return get_string(@checked Lib.CapControls_Get_Capacitor())
end

"""Name of the Capacitor that is controlled. (Setter)"""
function Capacitor(Value::String)
    @checked Lib.CapControls_Set_Capacitor(Cstring(pointer(Value)))
end

"""Number of CapControls in Active Circuit"""
function Count()::Int
    return @checked Lib.CapControls_Get_Count()
end

"""Dead Time for Capacitor Control (Getter)"""
function DeadTime()::Float64
    return @checked Lib.CapControls_Get_DeadTime()
end

"""Dead Time for Capacitor Control (Setter)"""
function DeadTime(Value::Float64)
    @checked Lib.CapControls_Set_DeadTime(Value)
end

"""Time delay [s] to switch on after arming.  Control may reset before actually switching. (Getter)"""
function Delay()::Float64
    return @checked Lib.CapControls_Get_Delay()
end

"""Time delay [s] to switch on after arming.  Control may reset before actually switching. (Setter)"""
function Delay(Value::Float64)
    @checked Lib.CapControls_Set_Delay(Value)
end

"""Time delay [s] before switching off a step. Control may reset before actually switching. (Getter)"""
function DelayOff()::Float64
    return @checked Lib.CapControls_Get_DelayOff()
end

"""Time delay [s] before switching off a step. Control may reset before actually switching. (Setter)"""
function DelayOff(Value::Float64)
    @checked Lib.CapControls_Set_DelayOff(Value)
end

"""Sets the first CapControl as active. Return 0 if none."""
function First()::Int
    return @checked Lib.CapControls_Get_First()
end

"""Type of automatic controller. (Getter)"""
function Mode()::Lib.CapControlModes
    return @checked Lib.CapControls_Get_Mode()
end

"""Type of automatic controller. (Setter)"""
function Mode(Value::Union{Int,Lib.CapControlModes})
    Value = convert(Lib.CapControlModes, Value)
    @checked Lib.CapControls_Set_Mode(Value)
end

"""Full name of the element that PT and CT are connected to. (Getter)"""
function MonitoredObj()::String
    return get_string(@checked Lib.CapControls_Get_MonitoredObj())
end

"""Full name of the element that PT and CT are connected to. (Setter)"""
function MonitoredObj(Value::String)
    @checked Lib.CapControls_Set_MonitoredObj(Cstring(pointer(Value)))
end

"""Terminal number on the element that PT and CT are connected to. (Getter)"""
function MonitoredTerm()::Int
    return @checked Lib.CapControls_Get_MonitoredTerm()
end

"""Terminal number on the element that PT and CT are connected to. (Setter)"""
function MonitoredTerm(Value::Int)
    @checked Lib.CapControls_Set_MonitoredTerm(Value)
end

"""Sets a CapControl active by name. (Getter)"""
function Name()::String
    return get_string(@checked Lib.CapControls_Get_Name())
end

"""Sets a CapControl active by name. (Getter)"""
function Name(Value::String)
    @checked Lib.CapControls_Set_Name(Cstring(pointer(Value)))
end

"""Gets the next CapControl in the circut. Returns 0 if none."""
function Next()::Int
    return @checked Lib.CapControls_Get_Next()
end

"""Threshold to switch off a step. See Mode for units. (Getter)"""
function OFFSetting()::Int
    return @checked Lib.CapControls_Get_OFFSetting()
end

"""Threshold to switch off a step. See Mode for units. (Setter)"""
function OFFSetting(Value::Int)
    @checked Lib.CapControls_Set_OFFSetting(Value)
end

"""Threshold to arm or switch on a step.  See Mode for units. (Getter)"""
function ONSetting()::Int
    return @checked Lib.CapControls_Get_ONSetting()
end

"""Threshold to arm or switch on a step.  See Mode for units. (Setter)"""
function ONSetting(Value::Int)
    @checked Lib.CapControls_Set_ONSetting(Value)
end

"""Transducer ratio from primary feeder to control voltage. (Getter)"""
function PTRatio()::Float64
    return @checked Lib.CapControls_Get_PTratio()
end

"""Transducer ratio from primary feeder to control voltage. (Setter)"""
function PTRatio(Value::Float64)
    @checked Lib.CapControls_Set_PTratio(Value)
end

"""Enables Vmin and Vmax to override the control Mode (Getter)"""
function UseVoltOverride()::Bool
    return @checked(Lib.CapControls_Get_UseVoltOverride()) != 0
end

"""Enables Vmin and Vmax to override the control Mode (Setter)"""
function UseVoltOverride(Value::Bool)
    @checked Lib.CapControls_Set_UseVoltOverride(Value ? 1 : 0)
end

"""With VoltOverride, swtich off whenever PT voltage exceeds this level. (Getter)"""
function Vmax()::Float64
    return @checked Lib.CapControls_Get_Vmax()
end

"""With VoltOverride, swtich off whenever PT voltage exceeds this level. (Setter)"""
function Vmax(Value::Float64)
    @checked Lib.CapControls_Set_Vmax(Value)
end

"""With VoltOverride, switch ON whenever PT voltage drops below this level. (Getter)"""
function Vmin()::Float64
    return @checked Lib.CapControls_Get_Vmin()
end

"""With VoltOverride, switch ON whenever PT voltage drops below this level. (Setter)"""
function Vmin(Value::Float64)
    @checked Lib.CapControls_Set_Vmin(Value)
end

"""CapControl Index (Getter)"""
function Idx()::Int
    return @checked Lib.CapControls_Get_idx()
end

"""CapControl Index (Setter)"""
function Idx(Value::Int)
    @checked Lib.CapControls_Set_idx(Value)
end

end
