module CapControls

using DocStringExtensions

using ..Lib
using ..Utils

@template (FUNCTIONS, METHODS) = """
                                 $(TYPEDSIGNATURES)
                                 $(DOCSTRING)
                                 """


"""Array of names of all CapControl objects."""
function AllNames(dss::DSSContext)::Vector{String}
    return get_string_array(Lib.CapControls_Get_AllNames, dss.ctx)
end
AllNames() = AllNames(DSS_DEFAULT_CTX)

"""Gets the name of the active CapControl object."""
function Name(dss::DSSContext)::String
    return get_string(@checked Lib.CapControls_Get_Name(dss.ctx))
end
Name() = Name(DSS_DEFAULT_CTX)

"""Sets a CapControl object active by name."""
function Name(dss::DSSContext, Value::String)
    @checked Lib.CapControls_Set_Name(dss.ctx, Cstring(pointer(Value)))
end
Name(Value::String) = Name(DSS_DEFAULT_CTX, Value)

"""Number of CapControl Objects in Active Circuit"""
function Count(dss::DSSContext)::Int
    return @checked Lib.CapControls_Get_Count(dss.ctx)
end
Count() = Count(DSS_DEFAULT_CTX)

"""
Sets first CapControl to be active.
Returns 0 if none.
    """
function First(dss::DSSContext)::Int
    return @checked Lib.CapControls_Get_First(dss.ctx)
end
First() = First(DSS_DEFAULT_CTX)

"""
Sets next CapControl to be active.
Returns 0 if no more.
"""
function Next(dss::DSSContext)::Int
    return @checked Lib.CapControls_Get_Next(dss.ctx)
end
Next() = Next(DSS_DEFAULT_CTX)

"""
Returns the index of the current active CapControl (1-based)

(Getter)
"""
function Idx(dss::DSSContext)::Int
    return @checked Lib.CapControls_Get_idx(dss.ctx)
end
Idx() = Idx(DSS_DEFAULT_CTX)

"""
Activate CapControl by index (1-based)

(Setter)
"""
function Idx(dss::DSSContext, Value::Int)
    @checked Lib.CapControls_Set_idx(dss.ctx, Value)
end
Idx(Value::Int) = Idx(DSS_DEFAULT_CTX, Value)

"""
Force a reset of this CapControl.

Original COM help: https://opendss.epri.com/Reset.html
"""
function Reset(dss::DSSContext)
    @checked Lib.CapControls_Reset(dss.ctx)
end
Reset() = Reset(DSS_DEFAULT_CTX)

"""
Transducer ratio from primary current to control current.

Original COM help: https://opendss.epri.com/CTratio.html

(Getter)
"""
function CTRatio(dss::DSSContext)::Float64
    return @checked Lib.CapControls_Get_CTratio(dss.ctx)
end
CTRatio() = CTRatio(DSS_DEFAULT_CTX)

"""
Transducer ratio from primary current to control current.

Original COM help: https://opendss.epri.com/CTratio.html

(Setter)
"""
function CTRatio(dss::DSSContext, Value::Float64)
    @checked Lib.CapControls_Set_CTratio(dss.ctx, Value)
end
CTRatio(Value::Float64) = CTRatio(DSS_DEFAULT_CTX, Value)

"""
Name of the Capacitor that is controlled.

Original COM help: https://opendss.epri.com/Capacitor.html

(Getter)
"""
function Capacitor(dss::DSSContext)::String
    return get_string(@checked Lib.CapControls_Get_Capacitor(dss.ctx))
end
Capacitor() = Capacitor(DSS_DEFAULT_CTX)

"""
Name of the Capacitor that is controlled.

Original COM help: https://opendss.epri.com/Capacitor.html

(Setter)
"""
function Capacitor(dss::DSSContext, Value::String)
    @checked Lib.CapControls_Set_Capacitor(dss.ctx, Cstring(pointer(Value)))
end
Capacitor(Value::String) = Capacitor(DSS_DEFAULT_CTX, Value)

"""
Dead time after capacitor is turned OFF before it can be turned back ON for the active CapControl.

Default is 300 sec.

Original COM help: https://opendss.epri.com/DeadTime.html

(Getter)
"""
function DeadTime(dss::DSSContext)::Float64
    return @checked Lib.CapControls_Get_DeadTime(dss.ctx)
end
DeadTime() = DeadTime(DSS_DEFAULT_CTX)

"""
Dead time after capacitor is turned OFF before it can be turned back ON for the active CapControl.

Default is 300 sec.

Original COM help: https://opendss.epri.com/DeadTime.html

(Setter)
"""
function DeadTime(dss::DSSContext, Value::Float64)
    @checked Lib.CapControls_Set_DeadTime(dss.ctx, Value)
end
DeadTime(Value::Float64) = DeadTime(DSS_DEFAULT_CTX, Value)

"""
Time delay [s] to switch on after arming.  Control may reset before actually switching.

Original COM help: https://opendss.epri.com/Delay.html

(Getter)
"""
function Delay(dss::DSSContext)::Float64
    return @checked Lib.CapControls_Get_Delay(dss.ctx)
end
Delay() = Delay(DSS_DEFAULT_CTX)

"""
Time delay [s] to switch on after arming.  Control may reset before actually switching.

Original COM help: https://opendss.epri.com/Delay.html

(Setter)
"""
function Delay(dss::DSSContext, Value::Float64)
    @checked Lib.CapControls_Set_Delay(dss.ctx, Value)
end
Delay(Value::Float64) = Delay(DSS_DEFAULT_CTX, Value)

"""
Time delay [s] before switching off a step. Control may reset before actually switching.

Original COM help: https://opendss.epri.com/DelayOff.html

(Getter)
"""
function DelayOff(dss::DSSContext)::Float64
    return @checked Lib.CapControls_Get_DelayOff(dss.ctx)
end
DelayOff() = DelayOff(DSS_DEFAULT_CTX)

"""
Time delay [s] before switching off a step. Control may reset before actually switching.

Original COM help: https://opendss.epri.com/DelayOff.html

(Setter)
"""
function DelayOff(dss::DSSContext, Value::Float64)
    @checked Lib.CapControls_Set_DelayOff(dss.ctx, Value)
end
DelayOff(Value::Float64) = DelayOff(DSS_DEFAULT_CTX, Value)

"""
Type of automatic controller.

Original COM help: https://opendss.epri.com/Mode.html

(Getter)
"""
function Mode(dss::DSSContext)::Lib.CapControlModes
    return @checked Lib.CapControls_Get_Mode(dss.ctx)
end
Mode() = Mode(DSS_DEFAULT_CTX)

"""
Type of automatic controller.

Original COM help: https://opendss.epri.com/Mode.html

(Setter)
"""
function Mode(dss::DSSContext, Value::Union{Int,Lib.CapControlModes})
    Value = convert(Lib.CapControlModes, Value)
    @checked Lib.CapControls_Set_Mode(dss.ctx, Value)
end
Mode(Value::Union{Int,Lib.CapControlModes}) = Mode(DSS_DEFAULT_CTX, Value)

"""
Full name of the element that PT and CT are connected to.

Original COM help: https://opendss.epri.com/MonitoredObj.html

(Getter)
"""
function MonitoredObj(dss::DSSContext)::String
    return get_string(@checked Lib.CapControls_Get_MonitoredObj(dss.ctx))
end
MonitoredObj() = MonitoredObj(DSS_DEFAULT_CTX)

"""
Full name of the element that PT and CT are connected to.

Original COM help: https://opendss.epri.com/MonitoredObj.html

(Setter)
"""
function MonitoredObj(dss::DSSContext, Value::String)
    @checked Lib.CapControls_Set_MonitoredObj(dss.ctx, Cstring(pointer(Value)))
end
MonitoredObj(Value::String) = MonitoredObj(DSS_DEFAULT_CTX, Value)

"""
Terminal number on the element that PT and CT are connected to.

Original COM help: https://opendss.epri.com/MonitoredTerm.html

(Getter)
"""
function MonitoredTerm(dss::DSSContext)::Int
    return @checked Lib.CapControls_Get_MonitoredTerm(dss.ctx)
end
MonitoredTerm() = MonitoredTerm(DSS_DEFAULT_CTX)

"""
Terminal number on the element that PT and CT are connected to.

Original COM help: https://opendss.epri.com/MonitoredTerm.html

(Setter)
"""
function MonitoredTerm(dss::DSSContext, Value::Int)
    @checked Lib.CapControls_Set_MonitoredTerm(dss.ctx, Value)
end
MonitoredTerm(Value::Int) = MonitoredTerm(DSS_DEFAULT_CTX, Value)

"""
Threshold to switch off a step. See Mode for units.

Original COM help: https://opendss.epri.com/OFFSetting.html

(Getter)
"""
function OFFSetting(dss::DSSContext)::Int
    return @checked Lib.CapControls_Get_OFFSetting(dss.ctx)
end
OFFSetting() = OFFSetting(DSS_DEFAULT_CTX)

"""
Threshold to switch off a step. See Mode for units.

Original COM help: https://opendss.epri.com/OFFSetting.html

(Setter)
"""
function OFFSetting(dss::DSSContext, Value::Int)
    @checked Lib.CapControls_Set_OFFSetting(dss.ctx, Value)
end
OFFSetting(Value::Int) = OFFSetting(DSS_DEFAULT_CTX, Value)

"""
Threshold to arm or switch on a step.  See Mode for units.

Original COM help: https://opendss.epri.com/ONSetting.html

(Getter)
"""
function ONSetting(dss::DSSContext)::Int
    return @checked Lib.CapControls_Get_ONSetting(dss.ctx)
end
ONSetting() = ONSetting(DSS_DEFAULT_CTX)

"""
Threshold to arm or switch on a step.  See Mode for units.

Original COM help: https://opendss.epri.com/ONSetting.html

(Setter)
"""
function ONSetting(dss::DSSContext, Value::Int)
    @checked Lib.CapControls_Set_ONSetting(dss.ctx, Value)
end
ONSetting(Value::Int) = ONSetting(DSS_DEFAULT_CTX, Value)

"""
Transducer ratio from primary feeder to control voltage.

Original COM help: https://opendss.epri.com/PTratio.html

(Getter)
"""
function PTRatio(dss::DSSContext)::Float64
    return @checked Lib.CapControls_Get_PTratio(dss.ctx)
end
PTRatio() = PTRatio(DSS_DEFAULT_CTX)

"""
Transducer ratio from primary feeder to control voltage.

Original COM help: https://opendss.epri.com/PTratio.html

(Setter)
"""
function PTRatio(dss::DSSContext, Value::Float64)
    @checked Lib.CapControls_Set_PTratio(dss.ctx, Value)
end
PTRatio(Value::Float64) = PTRatio(DSS_DEFAULT_CTX, Value)

"""
Enables Vmin and Vmax to override the control Mode

Original COM help: https://opendss.epri.com/UseVoltOverride.html

(Getter)
"""
function UseVoltOverride(dss::DSSContext)::Bool
    return @checked(Lib.CapControls_Get_UseVoltOverride(dss.ctx)) != 0
end
UseVoltOverride() = UseVoltOverride(DSS_DEFAULT_CTX)

"""
Enables Vmin and Vmax to override the control Mode

Original COM help: https://opendss.epri.com/UseVoltOverride.html

(Setter)
"""
function UseVoltOverride(dss::DSSContext, Value::Bool)
    @checked Lib.CapControls_Set_UseVoltOverride(dss.ctx, Value ? 1 : 0)
end
UseVoltOverride(Value::Bool) = UseVoltOverride(DSS_DEFAULT_CTX, Value)

"""
With VoltOverride, swtich off whenever PT voltage exceeds this level.

Original COM help: https://opendss.epri.com/Vmax.html

(Getter)
"""
function Vmax(dss::DSSContext)::Float64
    return @checked Lib.CapControls_Get_Vmax(dss.ctx)
end
Vmax() = Vmax(DSS_DEFAULT_CTX)

"""
With VoltOverride, swtich off whenever PT voltage exceeds this level.

Original COM help: https://opendss.epri.com/Vmax.html

(Setter)
"""
function Vmax(dss::DSSContext, Value::Float64)
    @checked Lib.CapControls_Set_Vmax(dss.ctx, Value)
end
Vmax(Value::Float64) = Vmax(DSS_DEFAULT_CTX, Value)

"""
With VoltOverride, switch ON whenever PT voltage drops below this level.

Original COM help: https://opendss.epri.com/Vmin.html

(Getter)
"""
function Vmin(dss::DSSContext)::Float64
    return @checked Lib.CapControls_Get_Vmin(dss.ctx)
end
Vmin() = Vmin(DSS_DEFAULT_CTX)

"""
With VoltOverride, switch ON whenever PT voltage drops below this level.

Original COM help: https://opendss.epri.com/Vmin.html

(Setter)
"""
function Vmin(dss::DSSContext, Value::Float64)
    @checked Lib.CapControls_Set_Vmin(dss.ctx, Value)
end
Vmin(Value::Float64) = Vmin(DSS_DEFAULT_CTX, Value)

end
