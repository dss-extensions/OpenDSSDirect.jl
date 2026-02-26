module GenDispatcher
using ..Enums.SetterFlags: SetterFlagsT
import Base: convert
using ..Common
using ..CircuitElement
using DocStringExtensions
@template (FUNCTIONS, METHODS) = """
                                 $(TYPEDSIGNATURES)
                                 $(DOCSTRING)
                                 """


const _cls_name = "GenDispatcher"
const _cls_idx = 29

module _PropertyIndex
const Element = Int32(1)
const Terminal = Int32(2)
const kWLimit = Int32(3)
const kWBand = Int32(4)
const kvarLimit = Int32(5)
const GenList = Int32(6)
const Weights = Int32(7)
const BaseFreq = Int32(8)
const Enabled = Int32(9)
const Like = Int32(10)
end

struct GenDispatcherObj <: AbstractControlElement
    ptr::Ptr{Cvoid}
    dss::DSSContext
end
export GenDispatcherObj
Common._wrap_dss_obj(::Val{_cls_idx}, ptr::Ptr{Cvoid}, dss::DSSContext) = GenDispatcherObj(ptr, dss)
const Obj = GenDispatcherObj

function Base.show(io::IO, obj::GenDispatcherObj) 
    name = obj_get_str(obj, obj.dss.capi.Obj_GetFullName)
    print(name)
end


include("dss_object.jl")


"""
Full object name of the circuit element, typically a line or transformer, which the control is monitoring. There is no default; must be specified.

Name: `Element`

(Getter)
"""
function Element_str(obj::Obj)::String
    obj_get_str(obj, _PropertyIndex.Element)
end

"""
Full object name of the circuit element, typically a line or transformer, which the control is monitoring. There is no default; must be specified.

Name: `Element`

(Setter)
"""
function Element_str(obj::Obj, value::String, flags::SetterFlagsT=SetterFlagsT(0))
    obj_set_str(obj, _PropertyIndex.Element, value, flags)
end

"""
Full object name of the circuit element, typically a line or transformer, which the control is monitoring. There is no default; must be specified.

Name: `Element`

(Getter)
"""
function Element(obj)::DSSObj
    obj_get_obj(obj,_PropertyIndex.Element)
end

"""
Full object name of the circuit element, typically a line or transformer, which the control is monitoring. There is no default; must be specified.

Name: `Element`

(Setter)
"""
function Element(obj::Obj, value::DSSObj, flags::SetterFlagsT=SetterFlagsT(0))
    obj_set_obj(obj, _PropertyIndex.Element, value, flags)
end

"""
Full object name of the circuit element, typically a line or transformer, which the control is monitoring. There is no default; must be specified.

Name: `Element`

(Setter)
"""
function Element(obj::Obj, value::String, flags::SetterFlagsT=SetterFlagsT(0))
    obj_set_str(obj, _PropertyIndex.Element, value, flags)
end

"""
Number of the terminal of the circuit element to which the GenDispatcher control is connected. 1 or 2, typically. Make sure you have the direction on the power matching the sign of kWLimit.

Name: `Terminal`
Default: 1

(Getter)
"""
function Terminal(obj::Obj)::Int32
    obj_get_int32(obj, _PropertyIndex.Terminal)
end

"""
Number of the terminal of the circuit element to which the GenDispatcher control is connected. 1 or 2, typically. Make sure you have the direction on the power matching the sign of kWLimit.

Name: `Terminal`
Default: 1

(Setter)
"""
function Terminal(obj::Obj, value::Int32, flags::SetterFlagsT=SetterFlagsT(0))
    obj_set_int32(obj, _PropertyIndex.Terminal, value, flags)
end

"""
kW Limit for the monitored element. The generators are dispatched to hold the power in band.

Name: `kWLimit`
Default: 8000.0

(Getter)
"""
function kWLimit(obj::Obj)::Float64
    obj_get_float64(obj, _PropertyIndex.kWLimit)
end

"""
kW Limit for the monitored element. The generators are dispatched to hold the power in band.

Name: `kWLimit`
Default: 8000.0

(Setter)
"""
function kWLimit(obj::Obj, value::Float64, flags::SetterFlagsT=SetterFlagsT(0))
    obj_set_float64(obj, _PropertyIndex.kWLimit, value, flags)
end

"""
Bandwidth (kW) of the dead band around the target limit.No dispatch changes are attempted if the power in the monitored terminal stays within this band.

Name: `kWBand`
Default: 100.0

(Getter)
"""
function kWBand(obj::Obj)::Float64
    obj_get_float64(obj, _PropertyIndex.kWBand)
end

"""
Bandwidth (kW) of the dead band around the target limit.No dispatch changes are attempted if the power in the monitored terminal stays within this band.

Name: `kWBand`
Default: 100.0

(Setter)
"""
function kWBand(obj::Obj, value::Float64, flags::SetterFlagsT=SetterFlagsT(0))
    obj_set_float64(obj, _PropertyIndex.kWBand, value, flags)
end

"""
Max kvar to be delivered through the element.  Uses same dead band as kW.

Name: `kvarLimit`
Default: 4000.0

(Getter)
"""
function kvarLimit(obj::Obj)::Float64
    obj_get_float64(obj, _PropertyIndex.kvarLimit)
end

"""
Max kvar to be delivered through the element.  Uses same dead band as kW.

Name: `kvarLimit`
Default: 4000.0

(Setter)
"""
function kvarLimit(obj::Obj, value::Float64, flags::SetterFlagsT=SetterFlagsT(0))
    obj_set_float64(obj, _PropertyIndex.kvarLimit, value, flags)
end

"""
Array list of generators to be dispatched.  If not specified, all generators in the circuit are assumed dispatchable.

Name: `GenList`

(Getter)
"""
function GenList(obj::Obj)::Vector{String}
    obj_get_strs(obj, _PropertyIndex.GenList)
end

"""
Array list of generators to be dispatched.  If not specified, all generators in the circuit are assumed dispatchable.

Name: `GenList`

(Setter)
"""
function GenList(obj::Obj, value::Vector{String}, flags::SetterFlagsT=SetterFlagsT(0))
    obj_set_strs(obj, _PropertyIndex.GenList, value, flags)
end

"""
Array of proportional weights corresponding to each generator in the GenList. The needed kW to get back to center band is dispatched to each generator according to these weights.

Name: `Weights`

(Getter)
"""
function Weights(obj::Obj)::Vector{Float64}
    obj_get_float64s(obj, _PropertyIndex.Weights)
end

"""
Array of proportional weights corresponding to each generator in the GenList. The needed kW to get back to center band is dispatched to each generator according to these weights.

Name: `Weights`

(Setter)
"""
function Weights(obj::Obj, value::Vector{Float64}, flags::SetterFlagsT=SetterFlagsT(0))
    obj_get_float64s(obj, _PropertyIndex.Weights, value, flags)
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

end # module GenDispatcher
export GenDispatcher
