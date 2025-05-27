module ESPVLControl
using ..Enums.SetterFlags: SetterFlagsT
using ..Enums: ESPVLControlType
import Base: convert
using ..Common
using ..CircuitElement
using DocStringExtensions
@template (FUNCTIONS, METHODS) = """
                                 $(TYPEDSIGNATURES)
                                 $(DOCSTRING)
                                 """


const _cls_name = "ESPVLControl"
const _cls_idx = 39

module _PropertyIndex
const Element = Int32(1)
const Terminal = Int32(2)
const Type = Int32(3)
const kWBand = Int32(4)
const kvarLimit = Int32(5)
const LocalControlList = Int32(6)
const LocalControlWeights = Int32(7)
const PVSystemList = Int32(8)
const PVSystemWeights = Int32(9)
const StorageList = Int32(10)
const StorageWeights = Int32(11)
const BaseFreq = Int32(12)
const Enabled = Int32(13)
const Like = Int32(14)
end

struct ESPVLControlObj <: AbstractControlElement
    ptr::Ptr{Cvoid}
    dss::DSSContext
end
export ESPVLControlObj
Common._wrap_dss_obj(::Val{_cls_idx}, ptr::Ptr{Cvoid}, dss::DSSContext) = ESPVLControlObj(ptr, dss)
const Obj = ESPVLControlObj

function Base.show(io::IO, obj::ESPVLControlObj) 
    name = obj_get_str(obj, obj.dss.capi.Obj_GetFullName)
    print(name)
end


include("dss_object.jl")


"""
Full object name of the circuit element, typically a line or transformer, which the control is monitoring.

Name: `Element`

(Getter)
"""
function Element_str(obj::Obj)::String
    obj_get_str(obj, _PropertyIndex.Element)
end

"""
Full object name of the circuit element, typically a line or transformer, which the control is monitoring.

Name: `Element`

(Setter)
"""
function Element_str(obj::Obj, value::String, flags::SetterFlagsT=SetterFlagsT(0))
    obj_set_str(obj, _PropertyIndex.Element, value, flags)
end

"""
Full object name of the circuit element, typically a line or transformer, which the control is monitoring.

Name: `Element`

(Getter)
"""
function Element(obj)::DSSObj
    obj_get_obj(obj,_PropertyIndex.Element)
end

"""
Full object name of the circuit element, typically a line or transformer, which the control is monitoring.

Name: `Element`

(Setter)
"""
function Element(obj::Obj, value::DSSObj, flags::SetterFlagsT=SetterFlagsT(0))
    obj_set_obj(obj, _PropertyIndex.Element, value, flags)
end

"""
Full object name of the circuit element, typically a line or transformer, which the control is monitoring.

Name: `Element`

(Setter)
"""
function Element(obj::Obj, value::String, flags::SetterFlagsT=SetterFlagsT(0))
    obj_set_str(obj, _PropertyIndex.Element, value, flags)
end

"""
Number of the terminal of the circuit element to which the ESPVLControl control is connected. 1 or 2, typically. Make sure you have the direction on the power matching the sign of kWLimit.

Name: `Terminal`
Default: 1

(Getter)
"""
function Terminal(obj::Obj)::Int32
    obj_get_int32(obj, _PropertyIndex.Terminal)
end

"""
Number of the terminal of the circuit element to which the ESPVLControl control is connected. 1 or 2, typically. Make sure you have the direction on the power matching the sign of kWLimit.

Name: `Terminal`
Default: 1

(Setter)
"""
function Terminal(obj::Obj, value::Int32, flags::SetterFlagsT=SetterFlagsT(0))
    obj_set_int32(obj, _PropertyIndex.Terminal, value, flags)
end

"""
Type of controller.  1= System Controller; 2= Local controller. 

Name: `Type`
Default: None

(Getter)
"""
function Type(obj::Obj)::ESPVLControlType.T
    ESPVLControlType.T(obj_get_int32(obj, _PropertyIndex.Type))
end

"""
Type of controller.  1= System Controller; 2= Local controller. 

Name: `Type`
Default: None

(Setter)
"""
function Type(obj::Obj, value::String, flags::SetterFlagsT=SetterFlagsT(0))
    obj_set_str(obj, _PropertyIndex.Type, value, flags)
end

"""
Type of controller.  1= System Controller; 2= Local controller. 

Name: `Type`
Default: None

(Setter)
"""
function Type(obj::Obj, value::Union{Int,ESPVLControlType.T}, flags::SetterFlagsT=SetterFlagsT(0))
    obj_set_int32(obj, _PropertyIndex.Type, Int32(value), flags)
end

"""
Type of controller.  1= System Controller; 2= Local controller. 

Name: `Type`
Default: None

(Getter)
"""
function Type_str(obj::Obj)::String
    obj_get_str(obj, _PropertyIndex.Type)
end

"""
Type of controller.  1= System Controller; 2= Local controller. 

Name: `Type`
Default: None

(Setter)
"""
function Type_str(obj::Obj, value::String, flags::SetterFlagsT=SetterFlagsT(0))
    Type(obj, value, flags)
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
Array list of ESPVLControl local controller objects to be dispatched by System Controller. If not specified, all ESPVLControl devices with type=local in the circuit not attached to another controller are assumed to be part of this controller's fleet.

Name: `LocalControlList`

(Getter)
"""
function LocalControlList(obj::Obj)::Vector{String}
    obj_get_strs(obj, _PropertyIndex.LocalControlList)
end

"""
Array list of ESPVLControl local controller objects to be dispatched by System Controller. If not specified, all ESPVLControl devices with type=local in the circuit not attached to another controller are assumed to be part of this controller's fleet.

Name: `LocalControlList`

(Setter)
"""
function LocalControlList(obj::Obj, value::Vector{String}, flags::SetterFlagsT=SetterFlagsT(0))
    obj_set_strs(obj, _PropertyIndex.LocalControlList, value, flags)
end

"""
Array of proportional weights corresponding to each ESPVLControl local controller in the LocalControlList.

Name: `LocalControlWeights`

(Getter)
"""
function LocalControlWeights(obj::Obj)::Vector{Float64}
    obj_get_float64s(obj, _PropertyIndex.LocalControlWeights)
end

"""
Array of proportional weights corresponding to each ESPVLControl local controller in the LocalControlList.

Name: `LocalControlWeights`

(Setter)
"""
function LocalControlWeights(obj::Obj, value::Vector{Float64}, flags::SetterFlagsT=SetterFlagsT(0))
    obj_get_float64s(obj, _PropertyIndex.LocalControlWeights, value, flags)
end

"""
Array list of PVSystem objects to be dispatched by a Local Controller. 

Name: `PVSystemList`

(Getter)
"""
function PVSystemList(obj::Obj)::Vector{String}
    obj_get_strs(obj, _PropertyIndex.PVSystemList)
end

"""
Array list of PVSystem objects to be dispatched by a Local Controller. 

Name: `PVSystemList`

(Setter)
"""
function PVSystemList(obj::Obj, value::Vector{String}, flags::SetterFlagsT=SetterFlagsT(0))
    obj_set_strs(obj, _PropertyIndex.PVSystemList, value, flags)
end

"""
Array of proportional weights corresponding to each PVSystem in the PVSystemList.

Name: `PVSystemWeights`

(Getter)
"""
function PVSystemWeights(obj::Obj)::Vector{Float64}
    obj_get_float64s(obj, _PropertyIndex.PVSystemWeights)
end

"""
Array of proportional weights corresponding to each PVSystem in the PVSystemList.

Name: `PVSystemWeights`

(Setter)
"""
function PVSystemWeights(obj::Obj, value::Vector{Float64}, flags::SetterFlagsT=SetterFlagsT(0))
    obj_get_float64s(obj, _PropertyIndex.PVSystemWeights, value, flags)
end

"""
Array list of Storage objects to be dispatched by Local Controller. 

Name: `StorageList`

(Getter)
"""
function StorageList(obj::Obj)::Vector{String}
    obj_get_strs(obj, _PropertyIndex.StorageList)
end

"""
Array list of Storage objects to be dispatched by Local Controller. 

Name: `StorageList`

(Setter)
"""
function StorageList(obj::Obj, value::Vector{String}, flags::SetterFlagsT=SetterFlagsT(0))
    obj_set_strs(obj, _PropertyIndex.StorageList, value, flags)
end

"""
Array of proportional weights corresponding to each Storage object in the StorageControlList.

Name: `StorageWeights`

(Getter)
"""
function StorageWeights(obj::Obj)::Vector{Float64}
    obj_get_float64s(obj, _PropertyIndex.StorageWeights)
end

"""
Array of proportional weights corresponding to each Storage object in the StorageControlList.

Name: `StorageWeights`

(Setter)
"""
function StorageWeights(obj::Obj, value::Vector{Float64}, flags::SetterFlagsT=SetterFlagsT(0))
    obj_get_float64s(obj, _PropertyIndex.StorageWeights, value, flags)
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

end # module ESPVLControl
export ESPVLControl
