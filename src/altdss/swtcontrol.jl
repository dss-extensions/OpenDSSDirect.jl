module SwtControl
using ..Enums.SetterFlags: SetterFlagsT
using ..Enums: SwtControlState
import Base: convert
using ..Common
using ..CircuitElement
using DocStringExtensions
@template (FUNCTIONS, METHODS) = """
                                 $(TYPEDSIGNATURES)
                                 $(DOCSTRING)
                                 """


const _cls_name = "SwtControl"
const _cls_idx = 35

module _PropertyIndex
const SwitchedObj = Int32(1)
const SwitchedTerm = Int32(2)
const Action = Int32(3)
const Lock = Int32(4)
const Delay = Int32(5)
const Normal = Int32(6)
const State = Int32(7)
const Reset = Int32(8)
const BaseFreq = Int32(9)
const Enabled = Int32(10)
const Like = Int32(11)
end

struct SwtControlObj <: AbstractControlElement
    ptr::Ptr{Cvoid}
    dss::DSSContext
end
export SwtControlObj
Common._wrap_dss_obj(::Val{_cls_idx}, ptr::Ptr{Cvoid}, dss::DSSContext) = SwtControlObj(ptr, dss)
const Obj = SwtControlObj

function Base.show(io::IO, obj::SwtControlObj) 
    name = obj_get_str(obj, obj.dss.capi.Obj_GetFullName)
    print(name)
end


include("dss_object.jl")


"""
Name of circuit element switch that the SwtControl operates. Specify the full object class and name.

Name: `SwitchedObj`

(Getter)
"""
function SwitchedObj_str(obj::Obj)::String
    obj_get_str(obj, _PropertyIndex.SwitchedObj)
end

"""
Name of circuit element switch that the SwtControl operates. Specify the full object class and name.

Name: `SwitchedObj`

(Setter)
"""
function SwitchedObj_str(obj::Obj, value::String, flags::SetterFlagsT=SetterFlagsT(0))
    obj_set_str(obj, _PropertyIndex.SwitchedObj, value, flags)
end

"""
Name of circuit element switch that the SwtControl operates. Specify the full object class and name.

Name: `SwitchedObj`

(Getter)
"""
function SwitchedObj(obj)::DSSObj
    obj_get_obj(obj,_PropertyIndex.SwitchedObj)
end

"""
Name of circuit element switch that the SwtControl operates. Specify the full object class and name.

Name: `SwitchedObj`

(Setter)
"""
function SwitchedObj(obj::Obj, value::DSSObj, flags::SetterFlagsT=SetterFlagsT(0))
    obj_set_obj(obj, _PropertyIndex.SwitchedObj, value, flags)
end

"""
Name of circuit element switch that the SwtControl operates. Specify the full object class and name.

Name: `SwitchedObj`

(Setter)
"""
function SwitchedObj(obj::Obj, value::String, flags::SetterFlagsT=SetterFlagsT(0))
    obj_set_str(obj, _PropertyIndex.SwitchedObj, value, flags)
end

"""
Terminal number of the controlled element switch. 1 or 2, typically.

Name: `SwitchedTerm`
Default: 1

(Getter)
"""
function SwitchedTerm(obj::Obj)::Int32
    obj_get_int32(obj, _PropertyIndex.SwitchedTerm)
end

"""
Terminal number of the controlled element switch. 1 or 2, typically.

Name: `SwitchedTerm`
Default: 1

(Setter)
"""
function SwitchedTerm(obj::Obj, value::Int32, flags::SetterFlagsT=SetterFlagsT(0))
    obj_set_int32(obj, _PropertyIndex.SwitchedTerm, value, flags)
end

"""
Delayed action. Sends CTRL_LOCK or CTRL_UNLOCK message to control queue. After delay time, controlled switch is locked in its present open / close state or unlocked. Switch will not respond to either manual (Action) or automatic (APIs) control or internal OpenDSS Reset when locked.

Name: `Lock`
Default: False

(Getter)
"""
function Lock(obj::Obj)::Bool
    return obj_get_bool(obj, _PropertyIndex.Lock)
end

"""
Delayed action. Sends CTRL_LOCK or CTRL_UNLOCK message to control queue. After delay time, controlled switch is locked in its present open / close state or unlocked. Switch will not respond to either manual (Action) or automatic (APIs) control or internal OpenDSS Reset when locked.

Name: `Lock`
Default: False

(Setter)
"""
function Lock(obj::Obj, value::Bool, flags::SetterFlagsT=SetterFlagsT(0))
    obj_set_bool(obj, _PropertyIndex.Lock, value, flags)
end

"""
Operating time delay of the switch.

Name: `Delay`
Units: s
Default: 120.0

(Getter)
"""
function Delay(obj::Obj)::Float64
    obj_get_float64(obj, _PropertyIndex.Delay)
end

"""
Operating time delay of the switch.

Name: `Delay`
Units: s
Default: 120.0

(Setter)
"""
function Delay(obj::Obj, value::Float64, flags::SetterFlagsT=SetterFlagsT(0))
    obj_set_float64(obj, _PropertyIndex.Delay, value, flags)
end

"""
Normal state of the switch. If not Locked, the switch reverts to this state for reset, change of mode, etc. Defaults to first Action or State specified if not specifically declared.

Name: `Normal`
Default: closed

(Getter)
"""
function Normal(obj::Obj)::SwtControlState.T
    SwtControlState.T(obj_get_int32(obj, _PropertyIndex.Normal))
end

"""
Normal state of the switch. If not Locked, the switch reverts to this state for reset, change of mode, etc. Defaults to first Action or State specified if not specifically declared.

Name: `Normal`
Default: closed

(Setter)
"""
function Normal(obj::Obj, value::String, flags::SetterFlagsT=SetterFlagsT(0))
    obj_set_str(obj, _PropertyIndex.Normal, value, flags)
end

"""
Normal state of the switch. If not Locked, the switch reverts to this state for reset, change of mode, etc. Defaults to first Action or State specified if not specifically declared.

Name: `Normal`
Default: closed

(Setter)
"""
function Normal(obj::Obj, value::Union{Int,SwtControlState.T}, flags::SetterFlagsT=SetterFlagsT(0))
    obj_set_int32(obj, _PropertyIndex.Normal, Int32(value), flags)
end

"""
Normal state of the switch. If not Locked, the switch reverts to this state for reset, change of mode, etc. Defaults to first Action or State specified if not specifically declared.

Name: `Normal`
Default: closed

(Getter)
"""
function Normal_str(obj::Obj)::String
    obj_get_str(obj, _PropertyIndex.Normal)
end

"""
Normal state of the switch. If not Locked, the switch reverts to this state for reset, change of mode, etc. Defaults to first Action or State specified if not specifically declared.

Name: `Normal`
Default: closed

(Setter)
"""
function Normal_str(obj::Obj, value::String, flags::SetterFlagsT=SetterFlagsT(0))
    Normal(obj, value, flags)
end

"""
Present state of the switch. Upon setting, immediately forces state of switch.

Name: `State`
Default: None

(Getter)
"""
function State(obj::Obj)::SwtControlState.T
    SwtControlState.T(obj_get_int32(obj, _PropertyIndex.State))
end

"""
Present state of the switch. Upon setting, immediately forces state of switch.

Name: `State`
Default: None

(Setter)
"""
function State(obj::Obj, value::String, flags::SetterFlagsT=SetterFlagsT(0))
    obj_set_str(obj, _PropertyIndex.State, value, flags)
end

"""
Present state of the switch. Upon setting, immediately forces state of switch.

Name: `State`
Default: None

(Setter)
"""
function State(obj::Obj, value::Union{Int,SwtControlState.T}, flags::SetterFlagsT=SetterFlagsT(0))
    obj_set_int32(obj, _PropertyIndex.State, Int32(value), flags)
end

"""
Present state of the switch. Upon setting, immediately forces state of switch.

Name: `State`
Default: None

(Getter)
"""
function State_str(obj::Obj)::String
    obj_get_str(obj, _PropertyIndex.State)
end

"""
Present state of the switch. Upon setting, immediately forces state of switch.

Name: `State`
Default: None

(Setter)
"""
function State_str(obj::Obj, value::String, flags::SetterFlagsT=SetterFlagsT(0))
    State(obj, value, flags)
end

"""
If Yes, forces Reset of switch to Normal state and removes Lock independently of any internal reset command for mode change, etc.

Name: `Reset`
Default: False
"""
function Reset(obj::Obj, value::Bool=true, flags::SetterFlagsT=SetterFlagsT(0))
    obj_set_bool(obj, _PropertyIndex.Reset, value, flags)
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

end # module SwtControl
export SwtControl
