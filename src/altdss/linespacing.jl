module LineSpacing
using ..Enums.SetterFlags: SetterFlagsT
using ..Enums: LengthUnit
import Base: convert
using ..Common
using DocStringExtensions
@template (FUNCTIONS, METHODS) = """
                                 $(TYPEDSIGNATURES)
                                 $(DOCSTRING)
                                 """


const _cls_name = "LineSpacing"
const _cls_idx = 12

module _PropertyIndex
const NConds = Int32(1)
const NPhases = Int32(2)
const X = Int32(3)
const H = Int32(4)
const Units = Int32(5)
const Detailed = Int32(6)
const EqDistPhPh = Int32(7)
const EqDistPhN = Int32(8)
const AvgPhaseHeight = Int32(9)
const AvgNeutralHeight = Int32(10)
const Like = Int32(11)
end

struct LineSpacingObj <: AbstractDSSObj
    ptr::Ptr{Cvoid}
    dss::DSSContext
end
export LineSpacingObj
Common._wrap_dss_obj(::Val{_cls_idx}, ptr::Ptr{Cvoid}, dss::DSSContext) = LineSpacingObj(ptr, dss)
const Obj = LineSpacingObj

function Base.show(io::IO, obj::LineSpacingObj) 
    name = obj_get_str(obj, obj.dss.capi.Obj_GetFullName)
    print(name)
end


include("dss_object.jl")


"""
Number of wires in this geometry. Triggers memory allocations. Define first!

Name: `NConds`

(Getter)
"""
function NConds(obj::Obj)::Int32
    obj_get_int32(obj, _PropertyIndex.NConds)
end

"""
Number of wires in this geometry. Triggers memory allocations. Define first!

Name: `NConds`

(Setter)
"""
function NConds(obj::Obj, value::Int32, flags::SetterFlagsT=SetterFlagsT(0))
    obj_set_int32(obj, _PropertyIndex.NConds, value, flags)
end

"""
Number of retained phase conductors. If less than the number of wires, list the retained phase coordinates first.

Name: `NPhases`
Default: 3

(Getter)
"""
function NPhases(obj::Obj)::Int32
    obj_get_int32(obj, _PropertyIndex.NPhases)
end

"""
Number of retained phase conductors. If less than the number of wires, list the retained phase coordinates first.

Name: `NPhases`
Default: 3

(Setter)
"""
function NPhases(obj::Obj, value::Int32, flags::SetterFlagsT=SetterFlagsT(0))
    obj_set_int32(obj, _PropertyIndex.NPhases, value, flags)
end

"""
Array of wire X coordinates.

Name: `X`
Default: [0.0, 0.0, 0.0]

(Getter)
"""
function X(obj::Obj)::Vector{Float64}
    obj_get_float64s(obj, _PropertyIndex.X)
end

"""
Array of wire X coordinates.

Name: `X`
Default: [0.0, 0.0, 0.0]

(Setter)
"""
function X(obj::Obj, value::Vector{Float64}, flags::SetterFlagsT=SetterFlagsT(0))
    obj_get_float64s(obj, _PropertyIndex.X, value, flags)
end

"""
Array of wire Heights.

Name: `H`
Default: [0.0, 0.0, 0.0]

(Getter)
"""
function H(obj::Obj)::Vector{Float64}
    obj_get_float64s(obj, _PropertyIndex.H)
end

"""
Array of wire Heights.

Name: `H`
Default: [0.0, 0.0, 0.0]

(Setter)
"""
function H(obj::Obj, value::Vector{Float64}, flags::SetterFlagsT=SetterFlagsT(0))
    obj_get_float64s(obj, _PropertyIndex.H, value, flags)
end

"""
Units for x and h. Initial default is "ft", but defaults to last unit defined

Name: `Units`
Default: ft

(Getter)
"""
function Units(obj::Obj)::LengthUnit.T
    LengthUnit.T(obj_get_int32(obj, _PropertyIndex.Units))
end

"""
Units for x and h. Initial default is "ft", but defaults to last unit defined

Name: `Units`
Default: ft

(Setter)
"""
function Units(obj::Obj, value::String, flags::SetterFlagsT=SetterFlagsT(0))
    obj_set_str(obj, _PropertyIndex.Units, value, flags)
end

"""
Units for x and h. Initial default is "ft", but defaults to last unit defined

Name: `Units`
Default: ft

(Setter)
"""
function Units(obj::Obj, value::Union{Int,LengthUnit.T}, flags::SetterFlagsT=SetterFlagsT(0))
    obj_set_int32(obj, _PropertyIndex.Units, Int32(value), flags)
end

"""
Units for x and h. Initial default is "ft", but defaults to last unit defined

Name: `Units`
Default: ft

(Getter)
"""
function Units_str(obj::Obj)::String
    obj_get_str(obj, _PropertyIndex.Units)
end

"""
Units for x and h. Initial default is "ft", but defaults to last unit defined

Name: `Units`
Default: ft

(Setter)
"""
function Units_str(obj::Obj, value::String, flags::SetterFlagsT=SetterFlagsT(0))
    Units(obj, value, flags)
end

"""
LineSpacing.detailed

Name: `Detailed`
Default: True

(Getter)
"""
function Detailed(obj::Obj)::Bool
    return obj_get_bool(obj, _PropertyIndex.Detailed)
end

"""
LineSpacing.detailed

Name: `Detailed`
Default: True

(Setter)
"""
function Detailed(obj::Obj, value::Bool, flags::SetterFlagsT=SetterFlagsT(0))
    obj_set_bool(obj, _PropertyIndex.Detailed, value, flags)
end

"""
LineSpacing.eqdistphph

Name: `EqDistPhPh`
Default: 0.0

(Getter)
"""
function EqDistPhPh(obj::Obj)::Float64
    obj_get_float64(obj, _PropertyIndex.EqDistPhPh)
end

"""
LineSpacing.eqdistphph

Name: `EqDistPhPh`
Default: 0.0

(Setter)
"""
function EqDistPhPh(obj::Obj, value::Float64, flags::SetterFlagsT=SetterFlagsT(0))
    obj_set_float64(obj, _PropertyIndex.EqDistPhPh, value, flags)
end

"""
LineSpacing.eqdistphn

Name: `EqDistPhN`
Default: 0.0

(Getter)
"""
function EqDistPhN(obj::Obj)::Float64
    obj_get_float64(obj, _PropertyIndex.EqDistPhN)
end

"""
LineSpacing.eqdistphn

Name: `EqDistPhN`
Default: 0.0

(Setter)
"""
function EqDistPhN(obj::Obj, value::Float64, flags::SetterFlagsT=SetterFlagsT(0))
    obj_set_float64(obj, _PropertyIndex.EqDistPhN, value, flags)
end

"""
LineSpacing.avgphaseheight

Name: `AvgPhaseHeight`
Default: 0.0

(Getter)
"""
function AvgPhaseHeight(obj::Obj)::Float64
    obj_get_float64(obj, _PropertyIndex.AvgPhaseHeight)
end

"""
LineSpacing.avgphaseheight

Name: `AvgPhaseHeight`
Default: 0.0

(Setter)
"""
function AvgPhaseHeight(obj::Obj, value::Float64, flags::SetterFlagsT=SetterFlagsT(0))
    obj_set_float64(obj, _PropertyIndex.AvgPhaseHeight, value, flags)
end

"""
LineSpacing.avgneutralheight

Name: `AvgNeutralHeight`
Default: 0.0

(Getter)
"""
function AvgNeutralHeight(obj::Obj)::Float64
    obj_get_float64(obj, _PropertyIndex.AvgNeutralHeight)
end

"""
LineSpacing.avgneutralheight

Name: `AvgNeutralHeight`
Default: 0.0

(Setter)
"""
function AvgNeutralHeight(obj::Obj, value::Float64, flags::SetterFlagsT=SetterFlagsT(0))
    obj_set_float64(obj, _PropertyIndex.AvgNeutralHeight, value, flags)
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

end # module LineSpacing
export LineSpacing
