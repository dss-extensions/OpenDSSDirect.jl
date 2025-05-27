module Fuse
using ..Enums.SetterFlags: SetterFlagsT
using ..Enums: FuseAction, FuseState
using ..TCC_Curve: TCC_CurveObj
import Base: convert
using ..Common
using ..CircuitElement
using DocStringExtensions
@template (FUNCTIONS, METHODS) = """
                                 $(TYPEDSIGNATURES)
                                 $(DOCSTRING)
                                 """


const _cls_name = "Fuse"
const _cls_idx = 34

module _PropertyIndex
const MonitoredObj = Int32(1)
const MonitoredTerm = Int32(2)
const SwitchedObj = Int32(3)
const SwitchedTerm = Int32(4)
const FuseCurve = Int32(5)
const RatedCurrent = Int32(6)
const Delay = Int32(7)
const Action = Int32(8)
const Normal = Int32(9)
const State = Int32(10)
const BaseFreq = Int32(11)
const Enabled = Int32(12)
const Like = Int32(13)
end

struct FuseObj <: AbstractControlElement
    ptr::Ptr{Cvoid}
    dss::DSSContext
end
export FuseObj
Common._wrap_dss_obj(::Val{_cls_idx}, ptr::Ptr{Cvoid}, dss::DSSContext) = FuseObj(ptr, dss)
const Obj = FuseObj

function Base.show(io::IO, obj::FuseObj) 
    name = obj_get_str(obj, obj.dss.capi.Obj_GetFullName)
    print(name)
end


include("dss_object.jl")


"""
Full object name of the circuit element, typically a line, transformer, load, or generator, to which the Fuse is connected. This is the "monitored" element. There is no default; must be specified.

Name: `MonitoredObj`

(Getter)
"""
function MonitoredObj_str(obj::Obj)::String
    obj_get_str(obj, _PropertyIndex.MonitoredObj)
end

"""
Full object name of the circuit element, typically a line, transformer, load, or generator, to which the Fuse is connected. This is the "monitored" element. There is no default; must be specified.

Name: `MonitoredObj`

(Setter)
"""
function MonitoredObj_str(obj::Obj, value::String, flags::SetterFlagsT=SetterFlagsT(0))
    obj_set_str(obj, _PropertyIndex.MonitoredObj, value, flags)
end

"""
Full object name of the circuit element, typically a line, transformer, load, or generator, to which the Fuse is connected. This is the "monitored" element. There is no default; must be specified.

Name: `MonitoredObj`

(Getter)
"""
function MonitoredObj(obj)::DSSObj
    obj_get_obj(obj,_PropertyIndex.MonitoredObj)
end

"""
Full object name of the circuit element, typically a line, transformer, load, or generator, to which the Fuse is connected. This is the "monitored" element. There is no default; must be specified.

Name: `MonitoredObj`

(Setter)
"""
function MonitoredObj(obj::Obj, value::DSSObj, flags::SetterFlagsT=SetterFlagsT(0))
    obj_set_obj(obj, _PropertyIndex.MonitoredObj, value, flags)
end

"""
Full object name of the circuit element, typically a line, transformer, load, or generator, to which the Fuse is connected. This is the "monitored" element. There is no default; must be specified.

Name: `MonitoredObj`

(Setter)
"""
function MonitoredObj(obj::Obj, value::String, flags::SetterFlagsT=SetterFlagsT(0))
    obj_set_str(obj, _PropertyIndex.MonitoredObj, value, flags)
end

"""
Number of the terminal of the circuit element to which the Fuse is connected. 1 or 2, typically.

Name: `MonitoredTerm`
Default: 1

(Getter)
"""
function MonitoredTerm(obj::Obj)::Int32
    obj_get_int32(obj, _PropertyIndex.MonitoredTerm)
end

"""
Number of the terminal of the circuit element to which the Fuse is connected. 1 or 2, typically.

Name: `MonitoredTerm`
Default: 1

(Setter)
"""
function MonitoredTerm(obj::Obj, value::Int32, flags::SetterFlagsT=SetterFlagsT(0))
    obj_set_int32(obj, _PropertyIndex.MonitoredTerm, value, flags)
end

"""
Name of circuit element switch that the Fuse controls. Specify the full object name. Defaults to the same as the Monitored element. This is the "controlled" element.

Name: `SwitchedObj`

(Getter)
"""
function SwitchedObj_str(obj::Obj)::String
    obj_get_str(obj, _PropertyIndex.SwitchedObj)
end

"""
Name of circuit element switch that the Fuse controls. Specify the full object name. Defaults to the same as the Monitored element. This is the "controlled" element.

Name: `SwitchedObj`

(Setter)
"""
function SwitchedObj_str(obj::Obj, value::String, flags::SetterFlagsT=SetterFlagsT(0))
    obj_set_str(obj, _PropertyIndex.SwitchedObj, value, flags)
end

"""
Name of circuit element switch that the Fuse controls. Specify the full object name. Defaults to the same as the Monitored element. This is the "controlled" element.

Name: `SwitchedObj`

(Getter)
"""
function SwitchedObj(obj)::DSSObj
    obj_get_obj(obj,_PropertyIndex.SwitchedObj)
end

"""
Name of circuit element switch that the Fuse controls. Specify the full object name. Defaults to the same as the Monitored element. This is the "controlled" element.

Name: `SwitchedObj`

(Setter)
"""
function SwitchedObj(obj::Obj, value::DSSObj, flags::SetterFlagsT=SetterFlagsT(0))
    obj_set_obj(obj, _PropertyIndex.SwitchedObj, value, flags)
end

"""
Name of circuit element switch that the Fuse controls. Specify the full object name. Defaults to the same as the Monitored element. This is the "controlled" element.

Name: `SwitchedObj`

(Setter)
"""
function SwitchedObj(obj::Obj, value::String, flags::SetterFlagsT=SetterFlagsT(0))
    obj_set_str(obj, _PropertyIndex.SwitchedObj, value, flags)
end

"""
Number of the terminal of the controlled element in which the switch is controlled by the Fuse. 1 or 2, typically.  Default is 1.  Assumes all phases of the element have a fuse of this type.

Name: `SwitchedTerm`
Default: 1

(Getter)
"""
function SwitchedTerm(obj::Obj)::Int32
    obj_get_int32(obj, _PropertyIndex.SwitchedTerm)
end

"""
Number of the terminal of the controlled element in which the switch is controlled by the Fuse. 1 or 2, typically.  Default is 1.  Assumes all phases of the element have a fuse of this type.

Name: `SwitchedTerm`
Default: 1

(Setter)
"""
function SwitchedTerm(obj::Obj, value::Int32, flags::SetterFlagsT=SetterFlagsT(0))
    obj_set_int32(obj, _PropertyIndex.SwitchedTerm, value, flags)
end

"""
Name of the TCC Curve object that determines the fuse blowing.  Must have been previously defined as a TCC_Curve object. Default is "Tlink". Multiplying the current values in the curve by the "RatedCurrent" value gives the actual current.

Name: `FuseCurve`
Default: tlink

(Getter)
"""
function FuseCurve_str(obj::Obj)::String
    obj_get_str(obj, _PropertyIndex.FuseCurve)
end

"""
Name of the TCC Curve object that determines the fuse blowing.  Must have been previously defined as a TCC_Curve object. Default is "Tlink". Multiplying the current values in the curve by the "RatedCurrent" value gives the actual current.

Name: `FuseCurve`
Default: tlink

(Setter)
"""
function FuseCurve_str(obj::Obj, value::String, flags::SetterFlagsT=SetterFlagsT(0))
    obj_set_str(obj, _PropertyIndex.FuseCurve, value, flags)
end

"""
Name of the TCC Curve object that determines the fuse blowing.  Must have been previously defined as a TCC_Curve object. Default is "Tlink". Multiplying the current values in the curve by the "RatedCurrent" value gives the actual current.

Name: `FuseCurve`
Default: tlink

(Getter)
"""
function FuseCurve(obj)::Union{TCC_CurveObj, Nothing}
    obj_get_obj(obj,_PropertyIndex.FuseCurve, TCC_CurveObj)
end

"""
Name of the TCC Curve object that determines the fuse blowing.  Must have been previously defined as a TCC_Curve object. Default is "Tlink". Multiplying the current values in the curve by the "RatedCurrent" value gives the actual current.

Name: `FuseCurve`
Default: tlink

(Setter)
"""
function FuseCurve(obj::Obj, value::Union{TCC_CurveObj, Nothing}, flags::SetterFlagsT=SetterFlagsT(0))
    obj_set_obj(obj, _PropertyIndex.FuseCurve, value, flags)
end

"""
Name of the TCC Curve object that determines the fuse blowing.  Must have been previously defined as a TCC_Curve object. Default is "Tlink". Multiplying the current values in the curve by the "RatedCurrent" value gives the actual current.

Name: `FuseCurve`
Default: tlink

(Setter)
"""
function FuseCurve(obj::Obj, value::String, flags::SetterFlagsT=SetterFlagsT(0))
    obj_set_str(obj, _PropertyIndex.FuseCurve, value, flags)
end

"""
Multiplier or actual phase amps for the phase TCC curve.

Name: `RatedCurrent`
Default: 1.0

(Getter)
"""
function RatedCurrent(obj::Obj)::Float64
    obj_get_float64(obj, _PropertyIndex.RatedCurrent)
end

"""
Multiplier or actual phase amps for the phase TCC curve.

Name: `RatedCurrent`
Default: 1.0

(Setter)
"""
function RatedCurrent(obj::Obj, value::Float64, flags::SetterFlagsT=SetterFlagsT(0))
    obj_set_float64(obj, _PropertyIndex.RatedCurrent, value, flags)
end

"""
Fixed delay time added to Fuse blowing time determined from the TCC curve. Used to represent fuse clearing time or any other delay.

Name: `Delay`
Units: s
Default: 0.0

(Getter)
"""
function Delay(obj::Obj)::Float64
    obj_get_float64(obj, _PropertyIndex.Delay)
end

"""
Fixed delay time added to Fuse blowing time determined from the TCC curve. Used to represent fuse clearing time or any other delay.

Name: `Delay`
Units: s
Default: 0.0

(Setter)
"""
function Delay(obj::Obj, value::Float64, flags::SetterFlagsT=SetterFlagsT(0))
    obj_set_float64(obj, _PropertyIndex.Delay, value, flags)
end

"""
DEPRECATED. See "State" property.

**Deprecated:** Use "State" property instead.

Name: `Action`
"""
function Action(obj::Obj, value::Union{Int,FuseAction.T}, flags::SetterFlagsT=SetterFlagsT(0))
    obj_set_int32(obj, _PropertyIndex.Action, Int32(value), flags)
end

"""
DEPRECATED. See "State" property.

**Deprecated:** Use "State" property instead.

Name: `Action`
"""
function Action(obj::Obj, value::String, flags::SetterFlagsT=SetterFlagsT(0))
    obj_set_str(obj, _PropertyIndex.Action, value)
end

"""Shortcut to Action(FuseAction.close)"""
function close(obj::Obj, flags::SetterFlagsT=SetterFlagsT(0))
    obj_set_int32(obj, _PropertyIndex.Action, FuseAction.T.close, flags)
end

"""Shortcut to Action(FuseAction.open)"""
function open(obj::Obj, flags::SetterFlagsT=SetterFlagsT(0))
    obj_set_int32(obj, _PropertyIndex.Action, FuseAction.T.open, flags)
end

"""
ARRAY of strings {Open | Closed} representing the Normal state of the fuse in each phase of the controlled element. The fuse reverts to this state for reset, change of mode, etc. Defaults to "State" if not specifically declared.

Name: `Normal`

(Getter)
"""
function Normal(obj)::Vector{FuseState.T}
    FuseState.T.(obj_get_int32s(obj, _PropertyIndex.Normal))
end

"""
ARRAY of strings {Open | Closed} representing the Normal state of the fuse in each phase of the controlled element. The fuse reverts to this state for reset, change of mode, etc. Defaults to "State" if not specifically declared.

Name: `Normal`

(Setter)
"""
function Normal(obj::Obj, value::Vector{String}, flags::SetterFlagsT=SetterFlagsT(0))
    obj_set_strs(obj, _PropertyIndex.Normal, value, flags)
end

"""
ARRAY of strings {Open | Closed} representing the Normal state of the fuse in each phase of the controlled element. The fuse reverts to this state for reset, change of mode, etc. Defaults to "State" if not specifically declared.

Name: `Normal`

(Setter)
"""
function Normal(obj::Obj, value::Union{Vector{Int},Vector{FuseState.T}}, flags::SetterFlagsT=SetterFlagsT(0))
    obj_set_int32s(obj, _PropertyIndex.Normal, Int32.(value), flags)
end

"""
ARRAY of strings {Open | Closed} representing the Normal state of the fuse in each phase of the controlled element. The fuse reverts to this state for reset, change of mode, etc. Defaults to "State" if not specifically declared.

Name: `Normal`

(Getter)
"""
function Normal_str(obj::Obj)::Vector{String}
    obj_get_strs(obj, _PropertyIndex.Normal)
end

"""
ARRAY of strings {Open | Closed} representing the Normal state of the fuse in each phase of the controlled element. The fuse reverts to this state for reset, change of mode, etc. Defaults to "State" if not specifically declared.

Name: `Normal`

(Setter)
"""
function Normal_str(obj::Obj, value::Vector{String}, flags::SetterFlagsT=SetterFlagsT(0))
    Normal(obj, value, flags)
end

"""
ARRAY of strings {Open | Closed} representing the Actual state of the fuse in each phase of the controlled element. Upon setting, immediately forces state of fuse(s). Simulates manual control on Fuse. Defaults to Closed for all phases.

Name: `State`
Default: ['closed', 'closed', 'closed']

(Getter)
"""
function State(obj)::Vector{FuseState.T}
    FuseState.T.(obj_get_int32s(obj, _PropertyIndex.State))
end

"""
ARRAY of strings {Open | Closed} representing the Actual state of the fuse in each phase of the controlled element. Upon setting, immediately forces state of fuse(s). Simulates manual control on Fuse. Defaults to Closed for all phases.

Name: `State`
Default: ['closed', 'closed', 'closed']

(Setter)
"""
function State(obj::Obj, value::Vector{String}, flags::SetterFlagsT=SetterFlagsT(0))
    obj_set_strs(obj, _PropertyIndex.State, value, flags)
end

"""
ARRAY of strings {Open | Closed} representing the Actual state of the fuse in each phase of the controlled element. Upon setting, immediately forces state of fuse(s). Simulates manual control on Fuse. Defaults to Closed for all phases.

Name: `State`
Default: ['closed', 'closed', 'closed']

(Setter)
"""
function State(obj::Obj, value::Union{Vector{Int},Vector{FuseState.T}}, flags::SetterFlagsT=SetterFlagsT(0))
    obj_set_int32s(obj, _PropertyIndex.State, Int32.(value), flags)
end

"""
ARRAY of strings {Open | Closed} representing the Actual state of the fuse in each phase of the controlled element. Upon setting, immediately forces state of fuse(s). Simulates manual control on Fuse. Defaults to Closed for all phases.

Name: `State`
Default: ['closed', 'closed', 'closed']

(Getter)
"""
function State_str(obj::Obj)::Vector{String}
    obj_get_strs(obj, _PropertyIndex.State)
end

"""
ARRAY of strings {Open | Closed} representing the Actual state of the fuse in each phase of the controlled element. Upon setting, immediately forces state of fuse(s). Simulates manual control on Fuse. Defaults to Closed for all phases.

Name: `State`
Default: ['closed', 'closed', 'closed']

(Setter)
"""
function State_str(obj::Obj, value::Vector{String}, flags::SetterFlagsT=SetterFlagsT(0))
    State(obj, value, flags)
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

end # module Fuse
export Fuse
