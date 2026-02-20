module LineGeometry
using ..Enums.SetterFlags: SetterFlagsT
using ..Enums: LengthUnit, LineType as LineTypeEnum
using ..CNData: CNDataObj
using ..LineSpacing: LineSpacingObj
using ..TSData: TSDataObj
import Base: convert
using ..Common
using DocStringExtensions
@template (FUNCTIONS, METHODS) = """
                                 $(TYPEDSIGNATURES)
                                 $(DOCSTRING)
                                 """


const _cls_name = "LineGeometry"
const _cls_idx = 13

module _PropertyIndex
const NConds = Int32(1)
const NPhases = Int32(2)
const Cond = Int32(3)
const Wire = Int32(4)
const X = Int32(5)
const H = Int32(6)
const Units = Int32(7)
const NormAmps = Int32(8)
const EmergAmps = Int32(9)
const Reduce = Int32(10)
const Spacing = Int32(11)
const Wires = Int32(12)
const CNCable = Int32(13)
const TSCable = Int32(14)
const CNCables = Int32(15)
const TSCables = Int32(16)
const Seasons = Int32(17)
const Ratings = Int32(18)
const LineType = Int32(19)
const Conductors = Int32(20)
const Like = Int32(21)
end

struct LineGeometryObj <: AbstractDSSObj
    ptr::Ptr{Cvoid}
    dss::DSSContext
end
export LineGeometryObj
Common._wrap_dss_obj(::Val{_cls_idx}, ptr::Ptr{Cvoid}, dss::DSSContext) = LineGeometryObj(ptr, dss)
const Obj = LineGeometryObj

function Base.show(io::IO, obj::LineGeometryObj) 
    name = obj_get_str(obj, obj.dss.capi.Obj_GetFullName)
    print(name)
end


include("dss_object.jl")


"""
Number of conductors in this geometry. Triggers memory allocations. Define first!

Name: `NConds`
Default: 0

(Getter)
"""
function NConds(obj::Obj)::Int32
    obj_get_int32(obj, _PropertyIndex.NConds)
end

"""
Number of conductors in this geometry. Triggers memory allocations. Define first!

Name: `NConds`
Default: 0

(Setter)
"""
function NConds(obj::Obj, value::Int32, flags::SetterFlagsT=SetterFlagsT(0))
    obj_set_int32(obj, _PropertyIndex.NConds, value, flags)
end

"""
Number of phases. All other conductors are considered neutrals and might be reduced out.

Name: `NPhases`
Default: 0

(Getter)
"""
function NPhases(obj::Obj)::Int32
    obj_get_int32(obj, _PropertyIndex.NPhases)
end

"""
Number of phases. All other conductors are considered neutrals and might be reduced out.

Name: `NPhases`
Default: 0

(Setter)
"""
function NPhases(obj::Obj, value::Int32, flags::SetterFlagsT=SetterFlagsT(0))
    obj_set_int32(obj, _PropertyIndex.NPhases, value, flags)
end

"""
x coordinate.

Name: `X`

(Getter)
"""
function X(obj::Obj)::Vector{Float64}
    obj_get_float64s(obj, _PropertyIndex.X)
end

"""
x coordinate.

Name: `X`

(Setter)
"""
function X(obj::Obj, value::Vector{Float64}, flags::SetterFlagsT=SetterFlagsT(0))
    obj_get_float64s(obj, _PropertyIndex.X, value, flags)
end

"""
Height of conductor.

Name: `H`

(Getter)
"""
function H(obj::Obj)::Vector{Float64}
    obj_get_float64s(obj, _PropertyIndex.H)
end

"""
Height of conductor.

Name: `H`

(Setter)
"""
function H(obj::Obj, value::Vector{Float64}, flags::SetterFlagsT=SetterFlagsT(0))
    obj_get_float64s(obj, _PropertyIndex.H, value, flags)
end

"""
Units for x and h. Initial default is "ft", but defaults to last unit defined

Name: `Units`

(Getter)
"""
function Units(obj)::Vector{LengthUnit.T}
    LengthUnit.T.(obj_get_int32s(obj, _PropertyIndex.Units))
end

"""
Units for x and h. Initial default is "ft", but defaults to last unit defined

Name: `Units`

(Setter)
"""
function Units(obj::Obj, value::Vector{String}, flags::SetterFlagsT=SetterFlagsT(0))
    obj_set_strs(obj, _PropertyIndex.Units, value, flags)
end

"""
Units for x and h. Initial default is "ft", but defaults to last unit defined

Name: `Units`

(Setter)
"""
function Units(obj::Obj, value::Union{Vector{Int},Vector{LengthUnit.T}}, flags::SetterFlagsT=SetterFlagsT(0))
    obj_set_int32s(obj, _PropertyIndex.Units, Int32.(value), flags)
end

"""
Units for x and h. Initial default is "ft", but defaults to last unit defined

Name: `Units`

(Getter)
"""
function Units_str(obj::Obj)::Vector{String}
    obj_get_strs(obj, _PropertyIndex.Units)
end

"""
Units for x and h. Initial default is "ft", but defaults to last unit defined

Name: `Units`

(Setter)
"""
function Units_str(obj::Obj, value::Vector{String}, flags::SetterFlagsT=SetterFlagsT(0))
    Units(obj, value, flags)
end

"""
Normal ampacity, amperes for the line. Defaults to first conductor if not specified.

Name: `NormAmps`
Default: 0.0

(Getter)
"""
function NormAmps(obj::Obj)::Float64
    obj_get_float64(obj, _PropertyIndex.NormAmps)
end

"""
Normal ampacity, amperes for the line. Defaults to first conductor if not specified.

Name: `NormAmps`
Default: 0.0

(Setter)
"""
function NormAmps(obj::Obj, value::Float64, flags::SetterFlagsT=SetterFlagsT(0))
    obj_set_float64(obj, _PropertyIndex.NormAmps, value, flags)
end

"""
Emergency ampacity, amperes. Defaults to first conductor if not specified.

Name: `EmergAmps`
Default: 0.0

(Getter)
"""
function EmergAmps(obj::Obj)::Float64
    obj_get_float64(obj, _PropertyIndex.EmergAmps)
end

"""
Emergency ampacity, amperes. Defaults to first conductor if not specified.

Name: `EmergAmps`
Default: 0.0

(Setter)
"""
function EmergAmps(obj::Obj, value::Float64, flags::SetterFlagsT=SetterFlagsT(0))
    obj_set_float64(obj, _PropertyIndex.EmergAmps, value, flags)
end

"""
Reduce to Nphases (Kron Reduction). Reduce out neutrals.

Name: `Reduce`
Default: False

(Getter)
"""
function Reduce(obj::Obj)::Bool
    return obj_get_bool(obj, _PropertyIndex.Reduce)
end

"""
Reduce to Nphases (Kron Reduction). Reduce out neutrals.

Name: `Reduce`
Default: False

(Setter)
"""
function Reduce(obj::Obj, value::Bool, flags::SetterFlagsT=SetterFlagsT(0))
    obj_set_bool(obj, _PropertyIndex.Reduce, value, flags)
end

"""
Reference to a LineSpacing for use in a line constants calculation.
Alternative to x, h, and units. MUST BE PREVIOUSLY DEFINED.
Must match "nconds" as previously defined for this geometry.
Must be used in conjunction with the Wires property.

Name: `Spacing`

(Getter)
"""
function Spacing_str(obj::Obj)::String
    obj_get_str(obj, _PropertyIndex.Spacing)
end

"""
Reference to a LineSpacing for use in a line constants calculation.
Alternative to x, h, and units. MUST BE PREVIOUSLY DEFINED.
Must match "nconds" as previously defined for this geometry.
Must be used in conjunction with the Wires property.

Name: `Spacing`

(Setter)
"""
function Spacing_str(obj::Obj, value::String, flags::SetterFlagsT=SetterFlagsT(0))
    obj_set_str(obj, _PropertyIndex.Spacing, value, flags)
end

"""
Reference to a LineSpacing for use in a line constants calculation.
Alternative to x, h, and units. MUST BE PREVIOUSLY DEFINED.
Must match "nconds" as previously defined for this geometry.
Must be used in conjunction with the Wires property.

Name: `Spacing`

(Getter)
"""
function Spacing(obj)::Union{LineSpacingObj, Nothing}
    obj_get_obj(obj,_PropertyIndex.Spacing, LineSpacingObj)
end

"""
Reference to a LineSpacing for use in a line constants calculation.
Alternative to x, h, and units. MUST BE PREVIOUSLY DEFINED.
Must match "nconds" as previously defined for this geometry.
Must be used in conjunction with the Wires property.

Name: `Spacing`

(Setter)
"""
function Spacing(obj::Obj, value::Union{LineSpacingObj, Nothing}, flags::SetterFlagsT=SetterFlagsT(0))
    obj_set_obj(obj, _PropertyIndex.Spacing, value, flags)
end

"""
Reference to a LineSpacing for use in a line constants calculation.
Alternative to x, h, and units. MUST BE PREVIOUSLY DEFINED.
Must match "nconds" as previously defined for this geometry.
Must be used in conjunction with the Wires property.

Name: `Spacing`

(Setter)
"""
function Spacing(obj::Obj, value::String, flags::SetterFlagsT=SetterFlagsT(0))
    obj_set_str(obj, _PropertyIndex.Spacing, value, flags)
end

"""
Defines the number of ratings to be defined for the wire, to be used only when defining seasonal ratings using the "Ratings" property. Defaults to first conductor if not specified.

Name: `Seasons`

(Getter)
"""
function Seasons(obj::Obj)::Int32
    obj_get_int32(obj, _PropertyIndex.Seasons)
end

"""
Defines the number of ratings to be defined for the wire, to be used only when defining seasonal ratings using the "Ratings" property. Defaults to first conductor if not specified.

Name: `Seasons`

(Setter)
"""
function Seasons(obj::Obj, value::Int32, flags::SetterFlagsT=SetterFlagsT(0))
    obj_set_int32(obj, _PropertyIndex.Seasons, value, flags)
end

"""
An array of ratings to be used when the seasonal ratings flag is True. It can be used to insert
multiple ratings to change during a QSTS simulation to evaluate different ratings in lines. Defaults to first conductor if not specified.

Name: `Ratings`
Default: [0.0]

(Getter)
"""
function Ratings(obj::Obj)::Vector{Float64}
    obj_get_float64s(obj, _PropertyIndex.Ratings)
end

"""
An array of ratings to be used when the seasonal ratings flag is True. It can be used to insert
multiple ratings to change during a QSTS simulation to evaluate different ratings in lines. Defaults to first conductor if not specified.

Name: `Ratings`
Default: [0.0]

(Setter)
"""
function Ratings(obj::Obj, value::Vector{Float64}, flags::SetterFlagsT=SetterFlagsT(0))
    obj_get_float64s(obj, _PropertyIndex.Ratings, value, flags)
end

"""
Code designating the type of line.
OpenDSS currently does not use this internally. For whatever purpose the user defines.

Name: `LineType`
Default: oh

(Getter)
"""
function LineType(obj::Obj)::LineTypeEnum.T
    LineTypeEnum.T(obj_get_int32(obj, _PropertyIndex.LineType))
end

"""
Code designating the type of line.
OpenDSS currently does not use this internally. For whatever purpose the user defines.

Name: `LineType`
Default: oh

(Setter)
"""
function LineType(obj::Obj, value::String, flags::SetterFlagsT=SetterFlagsT(0))
    obj_set_str(obj, _PropertyIndex.LineType, value, flags)
end

"""
Code designating the type of line.
OpenDSS currently does not use this internally. For whatever purpose the user defines.

Name: `LineType`
Default: oh

(Setter)
"""
function LineType(obj::Obj, value::Union{Int,LineTypeEnum.T}, flags::SetterFlagsT=SetterFlagsT(0))
    obj_set_int32(obj, _PropertyIndex.LineType, Int32(value), flags)
end

"""
Code designating the type of line.
OpenDSS currently does not use this internally. For whatever purpose the user defines.

Name: `LineType`
Default: oh

(Getter)
"""
function LineType_str(obj::Obj)::String
    obj_get_str(obj, _PropertyIndex.LineType)
end

"""
Code designating the type of line.
OpenDSS currently does not use this internally. For whatever purpose the user defines.

Name: `LineType`
Default: oh

(Setter)
"""
function LineType_str(obj::Obj, value::String, flags::SetterFlagsT=SetterFlagsT(0))
    LineType(obj, value, flags)
end

"""
LineGeometry.conductors

Name: `Conductors`

(Getter)
"""
function Conductors_str(obj::Obj)::Vector{String}
    obj_get_strs(obj, _PropertyIndex.Conductors)
end

"""
LineGeometry.conductors

Name: `Conductors`

(Setter)
"""
function Conductors_str(obj::Obj, value::Vector{String}, flags::SetterFlagsT=SetterFlagsT(0))
    obj_set_strs(obj, _PropertyIndex.Conductors, value, flags)
end

"""
LineGeometry.conductors

Name: `Conductors`

(Getter)
"""
function Conductors(obj::Obj)::Vector{Union{AbstractConductorData, Nothing}}
    obj_get_objs(obj, _PropertyIndex.Conductors)
end

"""
LineGeometry.conductors

Name: `Conductors`

(Setter)
"""
function Conductors(obj::Obj, value::Vector{String}, flags::SetterFlagsT=SetterFlagsT(0))
    obj_set_strs(obj, _PropertyIndex.Conductors, value, flags)
end

"""
LineGeometry.conductors

Name: `Conductors`

(Setter)
"""
function Conductors(obj::Obj, value::Vector{Union{AbstractConductorData, Nothing}}, flags::SetterFlagsT=SetterFlagsT(0))
    obj_set_objs(obj, _PropertyIndex.Conductors, value, flags)
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

end # module LineGeometry
export LineGeometry
