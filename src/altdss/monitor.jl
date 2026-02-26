module Monitor
using ..Enums.SetterFlags: SetterFlagsT
using ..Enums: MonitorAction
import Base: convert
using ..Common
using ..CircuitElement
using DocStringExtensions
@template (FUNCTIONS, METHODS) = """
                                 $(TYPEDSIGNATURES)
                                 $(DOCSTRING)
                                 """


const _cls_name = "Monitor"
const _cls_idx = 48

module _PropertyIndex
const Element = Int32(1)
const Terminal = Int32(2)
const Mode = Int32(3)
const Action = Int32(4)
const Residual = Int32(5)
const VIPolar = Int32(6)
const PPolar = Int32(7)
const BaseFreq = Int32(8)
const Enabled = Int32(9)
const Like = Int32(10)
end

struct MonitorObj <: AbstractMeterElement
    ptr::Ptr{Cvoid}
    dss::DSSContext
end
export MonitorObj
Common._wrap_dss_obj(::Val{_cls_idx}, ptr::Ptr{Cvoid}, dss::DSSContext) = MonitorObj(ptr, dss)
const Obj = MonitorObj

function Base.show(io::IO, obj::MonitorObj) 
    name = obj_get_str(obj, obj.dss.capi.Obj_GetFullName)
    print(name)
end


include("dss_object.jl")
include("monitor_extras.jl")


"""
Name (Full Object name) of element to which the monitor is connected.

Name: `Element`
Default: Vsource.source

(Getter)
"""
function Element_str(obj::Obj)::String
    obj_get_str(obj, _PropertyIndex.Element)
end

"""
Name (Full Object name) of element to which the monitor is connected.

Name: `Element`
Default: Vsource.source

(Setter)
"""
function Element_str(obj::Obj, value::String, flags::SetterFlagsT=SetterFlagsT(0))
    obj_set_str(obj, _PropertyIndex.Element, value, flags)
end

"""
Name (Full Object name) of element to which the monitor is connected.

Name: `Element`
Default: Vsource.source

(Getter)
"""
function Element(obj)::DSSObj
    obj_get_obj(obj,_PropertyIndex.Element)
end

"""
Name (Full Object name) of element to which the monitor is connected.

Name: `Element`
Default: Vsource.source

(Setter)
"""
function Element(obj::Obj, value::DSSObj, flags::SetterFlagsT=SetterFlagsT(0))
    obj_set_obj(obj, _PropertyIndex.Element, value, flags)
end

"""
Name (Full Object name) of element to which the monitor is connected.

Name: `Element`
Default: Vsource.source

(Setter)
"""
function Element(obj::Obj, value::String, flags::SetterFlagsT=SetterFlagsT(0))
    obj_set_str(obj, _PropertyIndex.Element, value, flags)
end

"""
Number of the terminal of the circuit element to which the monitor is connected. 1 or 2, typically. For monitoring states, attach monitor to terminal 1.

Name: `Terminal`
Default: 1

(Getter)
"""
function Terminal(obj::Obj)::Int32
    obj_get_int32(obj, _PropertyIndex.Terminal)
end

"""
Number of the terminal of the circuit element to which the monitor is connected. 1 or 2, typically. For monitoring states, attach monitor to terminal 1.

Name: `Terminal`
Default: 1

(Setter)
"""
function Terminal(obj::Obj, value::Int32, flags::SetterFlagsT=SetterFlagsT(0))
    obj_set_int32(obj, _PropertyIndex.Terminal, value, flags)
end

"""
Bitmask integer designating the values the monitor is to capture: 

- 0: Voltages and currents at designated terminal
- 1: Powers at designated terminal
- 2: Tap Position (Transformer Device only)
- 3: State Variables (PCElements only)
- 4: Flicker level and severity index (Pst) for voltages. No adders apply. Flicker level at simulation time step, Pst at 10-minute time step.
- 5: Solution variables (Iterations, etc).
- 6: Capacitor Switching (Capacitors only)
- 7: Storage state vars (Storage device only)
- 8: All winding currents (Transformer device only)
- 9: Losses, watts and var (of monitored device)
- 10: All Winding voltages (Transformer device only)
- 11: All terminal node voltages and line currents of monitored device
- 12: All terminal node voltages LL and line currents of monitored device

Normally, these would be actual phasor quantities from solution.  
Combine with adders below to achieve other results for terminal quantities:

- +16: Sequence quantities
- +32: Magnitude only
- +64: Positive sequence only or average of all phases

Mix adders to obtain desired results. For example:

- `Mode=112` will save positive sequence voltage and current magnitudes only (`112=(64 + 32 + 16 + 0)`)
- `Mode=48`  will save all sequence voltages and currents, but magnitude only (`48=(32 + 16 + 0)`).

See also the monitor properties `VIPolar` and `PPolar` for options to control if complex values are reported in polar or rectangular forms.

Name: `Mode`
Default: 0

(Getter)
"""
function Mode(obj::Obj)::Int32
    obj_get_int32(obj, _PropertyIndex.Mode)
end

"""
Bitmask integer designating the values the monitor is to capture: 

- 0: Voltages and currents at designated terminal
- 1: Powers at designated terminal
- 2: Tap Position (Transformer Device only)
- 3: State Variables (PCElements only)
- 4: Flicker level and severity index (Pst) for voltages. No adders apply. Flicker level at simulation time step, Pst at 10-minute time step.
- 5: Solution variables (Iterations, etc).
- 6: Capacitor Switching (Capacitors only)
- 7: Storage state vars (Storage device only)
- 8: All winding currents (Transformer device only)
- 9: Losses, watts and var (of monitored device)
- 10: All Winding voltages (Transformer device only)
- 11: All terminal node voltages and line currents of monitored device
- 12: All terminal node voltages LL and line currents of monitored device

Normally, these would be actual phasor quantities from solution.  
Combine with adders below to achieve other results for terminal quantities:

- +16: Sequence quantities
- +32: Magnitude only
- +64: Positive sequence only or average of all phases

Mix adders to obtain desired results. For example:

- `Mode=112` will save positive sequence voltage and current magnitudes only (`112=(64 + 32 + 16 + 0)`)
- `Mode=48`  will save all sequence voltages and currents, but magnitude only (`48=(32 + 16 + 0)`).

See also the monitor properties `VIPolar` and `PPolar` for options to control if complex values are reported in polar or rectangular forms.

Name: `Mode`
Default: 0

(Setter)
"""
function Mode(obj::Obj, value::Int32, flags::SetterFlagsT=SetterFlagsT(0))
    obj_set_int32(obj, _PropertyIndex.Mode, value, flags)
end

"""
{Clear | Save | Take | Process}
(C)lears or (S)aves current buffer.
(T)ake action takes a sample.
(P)rocesses the data taken so far (e.g. Pst for mode 4).

Note that monitors are automatically reset (cleared) when the Set Mode= command is issued. Otherwise, the user must explicitly reset all monitors (reset monitors command) or individual monitors with the Clear action.

Name: `Action`
"""
function Action(obj::Obj, value::Union{Int,MonitorAction.T}, flags::SetterFlagsT=SetterFlagsT(0))
    obj_set_int32(obj, _PropertyIndex.Action, Int32(value), flags)
end

"""
{Clear | Save | Take | Process}
(C)lears or (S)aves current buffer.
(T)ake action takes a sample.
(P)rocesses the data taken so far (e.g. Pst for mode 4).

Note that monitors are automatically reset (cleared) when the Set Mode= command is issued. Otherwise, the user must explicitly reset all monitors (reset monitors command) or individual monitors with the Clear action.

Name: `Action`
"""
function Action(obj::Obj, value::String, flags::SetterFlagsT=SetterFlagsT(0))
    obj_set_str(obj, _PropertyIndex.Action, value)
end

"""Shortcut to Action(MonitorAction.Clear)"""
function Clear(obj::Obj, flags::SetterFlagsT=SetterFlagsT(0))
    obj_set_int32(obj, _PropertyIndex.Action, MonitorAction.T.Clear, flags)
end

"""Shortcut to Action(MonitorAction.Save)"""
function Save(obj::Obj, flags::SetterFlagsT=SetterFlagsT(0))
    obj_set_int32(obj, _PropertyIndex.Action, MonitorAction.T.Save, flags)
end

"""Shortcut to Action(MonitorAction.TakeSample)"""
function TakeSample(obj::Obj, flags::SetterFlagsT=SetterFlagsT(0))
    obj_set_int32(obj, _PropertyIndex.Action, MonitorAction.T.TakeSample, flags)
end

"""Shortcut to Action(MonitorAction.Process)"""
function Process(obj::Obj, flags::SetterFlagsT=SetterFlagsT(0))
    obj_set_int32(obj, _PropertyIndex.Action, MonitorAction.T.Process, flags)
end

"""Shortcut to Action(MonitorAction.Reset)"""
function Reset(obj::Obj, flags::SetterFlagsT=SetterFlagsT(0))
    obj_set_int32(obj, _PropertyIndex.Action, MonitorAction.T.Reset, flags)
end

"""
Include Residual cbannel (sum of all phases) for voltage and current. Does not apply to sequence quantity modes or power modes.

Name: `Residual`
Default: False

(Getter)
"""
function Residual(obj::Obj)::Bool
    return obj_get_bool(obj, _PropertyIndex.Residual)
end

"""
Include Residual cbannel (sum of all phases) for voltage and current. Does not apply to sequence quantity modes or power modes.

Name: `Residual`
Default: False

(Setter)
"""
function Residual(obj::Obj, value::Bool, flags::SetterFlagsT=SetterFlagsT(0))
    obj_set_bool(obj, _PropertyIndex.Residual, value, flags)
end

"""
Report voltage and current in polar form (Mag/Angle). (default)  Otherwise, it will be real and imaginary.

Name: `VIPolar`
Default: True

(Getter)
"""
function VIPolar(obj::Obj)::Bool
    return obj_get_bool(obj, _PropertyIndex.VIPolar)
end

"""
Report voltage and current in polar form (Mag/Angle). (default)  Otherwise, it will be real and imaginary.

Name: `VIPolar`
Default: True

(Setter)
"""
function VIPolar(obj::Obj, value::Bool, flags::SetterFlagsT=SetterFlagsT(0))
    obj_set_bool(obj, _PropertyIndex.VIPolar, value, flags)
end

"""
Report power in Apparent power, S, in polar form (Mag/Angle).(default)  Otherwise, is P and Q

Name: `PPolar`
Default: True

(Getter)
"""
function PPolar(obj::Obj)::Bool
    return obj_get_bool(obj, _PropertyIndex.PPolar)
end

"""
Report power in Apparent power, S, in polar form (Mag/Angle).(default)  Otherwise, is P and Q

Name: `PPolar`
Default: True

(Setter)
"""
function PPolar(obj::Obj, value::Bool, flags::SetterFlagsT=SetterFlagsT(0))
    obj_set_bool(obj, _PropertyIndex.PPolar, value, flags)
end

"""
Base Frequency for ratings.

Name: `BaseFreq`
Units: Hz

(Getter)
"""
function BaseFreq(obj::Obj)::Float64
    obj_get_float64(obj, _PropertyIndex.BaseFreq)
end

"""
Base Frequency for ratings.

Name: `BaseFreq`
Units: Hz

(Setter)
"""
function BaseFreq(obj::Obj, value::Float64, flags::SetterFlagsT=SetterFlagsT(0))
    obj_set_float64(obj, _PropertyIndex.BaseFreq, value, flags)
end

"""
Indicates whether this element is enabled.

Name: `Enabled`
Default: True

(Getter)
"""
function Enabled(obj::Obj)::Bool
    return obj_get_bool(obj, _PropertyIndex.Enabled)
end

"""
Indicates whether this element is enabled.

Name: `Enabled`
Default: True

(Setter)
"""
function Enabled(obj::Obj, value::Bool, flags::SetterFlagsT=SetterFlagsT(0))
    obj_set_bool(obj, _PropertyIndex.Enabled, value, flags)
end

"""
Make like another object, e.g.:

New Capacitor.C2 like=c1  ...

**Deprecated:** `Like` has been deprecated since at least 2021, see https://sourceforge.net/p/electricdss/discussion/861977/thread/8b59d21eb6/#b57c/f668

Name: `Like`
"""
function Like(obj::Obj, value::String)
    obj_set_str(obj, _PropertyIndex.Like, value)
end

end # module Monitor
export Monitor
