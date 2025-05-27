module WireData
using ..Enums.SetterFlags: SetterFlagsT
using ..Enums: LengthUnit
import Base: convert
using ..Common
using DocStringExtensions
@template (FUNCTIONS, METHODS) = """
                                 $(TYPEDSIGNATURES)
                                 $(DOCSTRING)
                                 """


const _cls_name = "WireData"
const _cls_idx = 9

module _PropertyIndex
const RDC = Int32(1)
const RAC = Int32(2)
const RUnits = Int32(3)
const GMRAC = Int32(4)
const GMRUnits = Int32(5)
const Radius = Int32(6)
const RadUnits = Int32(7)
const NormAmps = Int32(8)
const EmergAmps = Int32(9)
const Diam = Int32(10)
const Seasons = Int32(11)
const Ratings = Int32(12)
const CapRadius = Int32(13)
const Like = Int32(14)
end

struct WireDataObj <: AbstractConductorData
    ptr::Ptr{Cvoid}
    dss::DSSContext
end
export WireDataObj
Common._wrap_dss_obj(::Val{_cls_idx}, ptr::Ptr{Cvoid}, dss::DSSContext) = WireDataObj(ptr, dss)
const Obj = WireDataObj

function Base.show(io::IO, obj::WireDataObj) 
    name = obj_get_str(obj, obj.dss.capi.Obj_GetFullName)
    print(name)
end


include("dss_object.jl")


"""
WireData.rdc

Name: `RDC`
Units: Ω/[length_unit]

(Getter)
"""
function RDC(obj::Obj)::Float64
    obj_get_float64(obj, _PropertyIndex.RDC)
end

"""
WireData.rdc

Name: `RDC`
Units: Ω/[length_unit]

(Setter)
"""
function RDC(obj::Obj, value::Float64, flags::SetterFlagsT=SetterFlagsT(0))
    obj_set_float64(obj, _PropertyIndex.RDC, value, flags)
end

"""
Resistance at 60 Hz per unit length. Defaults to \$1.02 × Rdc\$ if not specified.

Name: `RAC`

(Getter)
"""
function RAC(obj::Obj)::Float64
    obj_get_float64(obj, _PropertyIndex.RAC)
end

"""
Resistance at 60 Hz per unit length. Defaults to \$1.02 × Rdc\$ if not specified.

Name: `RAC`

(Setter)
"""
function RAC(obj::Obj, value::Float64, flags::SetterFlagsT=SetterFlagsT(0))
    obj_set_float64(obj, _PropertyIndex.RAC, value, flags)
end

"""
Length units for resistance: ohms per {mi|kft|km|m|Ft|in|cm|mm} Default=none.

Name: `RUnits`
Default: none

(Getter)
"""
function RUnits(obj::Obj)::LengthUnit.T
    LengthUnit.T(obj_get_int32(obj, _PropertyIndex.RUnits))
end

"""
Length units for resistance: ohms per {mi|kft|km|m|Ft|in|cm|mm} Default=none.

Name: `RUnits`
Default: none

(Setter)
"""
function RUnits(obj::Obj, value::String, flags::SetterFlagsT=SetterFlagsT(0))
    obj_set_str(obj, _PropertyIndex.RUnits, value, flags)
end

"""
Length units for resistance: ohms per {mi|kft|km|m|Ft|in|cm|mm} Default=none.

Name: `RUnits`
Default: none

(Setter)
"""
function RUnits(obj::Obj, value::Union{Int,LengthUnit.T}, flags::SetterFlagsT=SetterFlagsT(0))
    obj_set_int32(obj, _PropertyIndex.RUnits, Int32(value), flags)
end

"""
Length units for resistance: ohms per {mi|kft|km|m|Ft|in|cm|mm} Default=none.

Name: `RUnits`
Default: none

(Getter)
"""
function RUnits_str(obj::Obj)::String
    obj_get_str(obj, _PropertyIndex.RUnits)
end

"""
Length units for resistance: ohms per {mi|kft|km|m|Ft|in|cm|mm} Default=none.

Name: `RUnits`
Default: none

(Setter)
"""
function RUnits_str(obj::Obj, value::String, flags::SetterFlagsT=SetterFlagsT(0))
    RUnits(obj, value, flags)
end

"""
GMR at 60 Hz. Defaults to \$0.7788 × radius\$ if not specified.

Name: `GMRAC`

(Getter)
"""
function GMRAC(obj::Obj)::Float64
    obj_get_float64(obj, _PropertyIndex.GMRAC)
end

"""
GMR at 60 Hz. Defaults to \$0.7788 × radius\$ if not specified.

Name: `GMRAC`

(Setter)
"""
function GMRAC(obj::Obj, value::Float64, flags::SetterFlagsT=SetterFlagsT(0))
    obj_set_float64(obj, _PropertyIndex.GMRAC, value, flags)
end

"""
Units for GMR.

Name: `GMRUnits`
Default: none

(Getter)
"""
function GMRUnits(obj::Obj)::LengthUnit.T
    LengthUnit.T(obj_get_int32(obj, _PropertyIndex.GMRUnits))
end

"""
Units for GMR.

Name: `GMRUnits`
Default: none

(Setter)
"""
function GMRUnits(obj::Obj, value::String, flags::SetterFlagsT=SetterFlagsT(0))
    obj_set_str(obj, _PropertyIndex.GMRUnits, value, flags)
end

"""
Units for GMR.

Name: `GMRUnits`
Default: none

(Setter)
"""
function GMRUnits(obj::Obj, value::Union{Int,LengthUnit.T}, flags::SetterFlagsT=SetterFlagsT(0))
    obj_set_int32(obj, _PropertyIndex.GMRUnits, Int32(value), flags)
end

"""
Units for GMR.

Name: `GMRUnits`
Default: none

(Getter)
"""
function GMRUnits_str(obj::Obj)::String
    obj_get_str(obj, _PropertyIndex.GMRUnits)
end

"""
Units for GMR.

Name: `GMRUnits`
Default: none

(Setter)
"""
function GMRUnits_str(obj::Obj, value::String, flags::SetterFlagsT=SetterFlagsT(0))
    GMRUnits(obj, value, flags)
end

"""
Outside radius of conductor. Defaults to GMR/0.7788 if not specified.

Name: `Radius`

(Getter)
"""
function Radius(obj::Obj)::Float64
    obj_get_float64(obj, _PropertyIndex.Radius)
end

"""
Outside radius of conductor. Defaults to GMR/0.7788 if not specified.

Name: `Radius`

(Setter)
"""
function Radius(obj::Obj, value::Float64, flags::SetterFlagsT=SetterFlagsT(0))
    obj_set_float64(obj, _PropertyIndex.Radius, value, flags)
end

"""
Units for outside radius.

Name: `RadUnits`
Default: none

(Getter)
"""
function RadUnits(obj::Obj)::LengthUnit.T
    LengthUnit.T(obj_get_int32(obj, _PropertyIndex.RadUnits))
end

"""
Units for outside radius.

Name: `RadUnits`
Default: none

(Setter)
"""
function RadUnits(obj::Obj, value::String, flags::SetterFlagsT=SetterFlagsT(0))
    obj_set_str(obj, _PropertyIndex.RadUnits, value, flags)
end

"""
Units for outside radius.

Name: `RadUnits`
Default: none

(Setter)
"""
function RadUnits(obj::Obj, value::Union{Int,LengthUnit.T}, flags::SetterFlagsT=SetterFlagsT(0))
    obj_set_int32(obj, _PropertyIndex.RadUnits, Int32(value), flags)
end

"""
Units for outside radius.

Name: `RadUnits`
Default: none

(Getter)
"""
function RadUnits_str(obj::Obj)::String
    obj_get_str(obj, _PropertyIndex.RadUnits)
end

"""
Units for outside radius.

Name: `RadUnits`
Default: none

(Setter)
"""
function RadUnits_str(obj::Obj, value::String, flags::SetterFlagsT=SetterFlagsT(0))
    RadUnits(obj, value, flags)
end

"""
Normal ampacity, amperes. Defaults to \$EmergAmps / 1.5\$ if not specified.

Name: `NormAmps`

(Getter)
"""
function NormAmps(obj::Obj)::Float64
    obj_get_float64(obj, _PropertyIndex.NormAmps)
end

"""
Normal ampacity, amperes. Defaults to \$EmergAmps / 1.5\$ if not specified.

Name: `NormAmps`

(Setter)
"""
function NormAmps(obj::Obj, value::Float64, flags::SetterFlagsT=SetterFlagsT(0))
    obj_set_float64(obj, _PropertyIndex.NormAmps, value, flags)
end

"""
Emergency ampacity, amperes. Defaults to \$1.5 × NormAmps\$ if not specified.

Name: `EmergAmps`

(Getter)
"""
function EmergAmps(obj::Obj)::Float64
    obj_get_float64(obj, _PropertyIndex.EmergAmps)
end

"""
Emergency ampacity, amperes. Defaults to \$1.5 × NormAmps\$ if not specified.

Name: `EmergAmps`

(Setter)
"""
function EmergAmps(obj::Obj, value::Float64, flags::SetterFlagsT=SetterFlagsT(0))
    obj_set_float64(obj, _PropertyIndex.EmergAmps, value, flags)
end

"""
Diameter; Alternative method for entering radius.

Name: `Diam`

(Getter)
"""
function Diam(obj::Obj)::Float64
    obj_get_float64(obj, _PropertyIndex.Diam)
end

"""
Diameter; Alternative method for entering radius.

Name: `Diam`

(Setter)
"""
function Diam(obj::Obj, value::Float64, flags::SetterFlagsT=SetterFlagsT(0))
    obj_set_float64(obj, _PropertyIndex.Diam, value, flags)
end

"""
Defines the number of ratings to be defined for the wire, to be used only when defining seasonal ratings using the "Ratings" property.

Name: `Seasons`

(Getter)
"""
function Seasons(obj::Obj)::Int32
    obj_get_int32(obj, _PropertyIndex.Seasons)
end

"""
Defines the number of ratings to be defined for the wire, to be used only when defining seasonal ratings using the "Ratings" property.

Name: `Seasons`

(Setter)
"""
function Seasons(obj::Obj, value::Int32, flags::SetterFlagsT=SetterFlagsT(0))
    obj_set_int32(obj, _PropertyIndex.Seasons, value, flags)
end

"""
An array of ratings to be used when the seasonal ratings flag is True. It can be used to insert
multiple ratings to change during a QSTS simulation to evaluate different ratings in lines.

Name: `Ratings`
Default: [-1.0]

(Getter)
"""
function Ratings(obj::Obj)::Vector{Float64}
    obj_get_float64s(obj, _PropertyIndex.Ratings)
end

"""
An array of ratings to be used when the seasonal ratings flag is True. It can be used to insert
multiple ratings to change during a QSTS simulation to evaluate different ratings in lines.

Name: `Ratings`
Default: [-1.0]

(Setter)
"""
function Ratings(obj::Obj, value::Vector{Float64}, flags::SetterFlagsT=SetterFlagsT(0))
    obj_get_float64s(obj, _PropertyIndex.Ratings, value, flags)
end

"""
Equivalent conductor radius for capacitance calcs. Specify this for bundled conductors. Defaults to same value as radius. Define Diam or Radius property first.

Name: `CapRadius`

(Getter)
"""
function CapRadius(obj::Obj)::Float64
    obj_get_float64(obj, _PropertyIndex.CapRadius)
end

"""
Equivalent conductor radius for capacitance calcs. Specify this for bundled conductors. Defaults to same value as radius. Define Diam or Radius property first.

Name: `CapRadius`

(Setter)
"""
function CapRadius(obj::Obj, value::Float64, flags::SetterFlagsT=SetterFlagsT(0))
    obj_set_float64(obj, _PropertyIndex.CapRadius, value, flags)
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

end # module WireData
export WireData
