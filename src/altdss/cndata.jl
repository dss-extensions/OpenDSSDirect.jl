module CNData
using ..Enums.SetterFlags: SetterFlagsT
using ..Enums: LengthUnit
import Base: convert
using ..Common
using DocStringExtensions
@template (FUNCTIONS, METHODS) = """
                                 $(TYPEDSIGNATURES)
                                 $(DOCSTRING)
                                 """


const _cls_name = "CNData"
const _cls_idx = 10

module _PropertyIndex
const k = Int32(1)
const DiaStrand = Int32(2)
const GMRStrand = Int32(3)
const RStrand = Int32(4)
const SemiconLayer = Int32(5)
const EpsR = Int32(6)
const InsLayer = Int32(7)
const DiaIns = Int32(8)
const DiaCable = Int32(9)
const RDC = Int32(10)
const RAC = Int32(11)
const RUnits = Int32(12)
const GMRAC = Int32(13)
const GMRUnits = Int32(14)
const Radius = Int32(15)
const RadUnits = Int32(16)
const NormAmps = Int32(17)
const EmergAmps = Int32(18)
const Diam = Int32(19)
const Seasons = Int32(20)
const Ratings = Int32(21)
const CapRadius = Int32(22)
const Like = Int32(23)
end

struct CNDataObj <: AbstractCableData
    ptr::Ptr{Cvoid}
    dss::DSSContext
end
export CNDataObj
Common._wrap_dss_obj(::Val{_cls_idx}, ptr::Ptr{Cvoid}, dss::DSSContext) = CNDataObj(ptr, dss)
const Obj = CNDataObj

function Base.show(io::IO, obj::CNDataObj) 
    name = obj_get_str(obj, obj.dss.capi.Obj_GetFullName)
    print(name)
end


include("dss_object.jl")


"""
Number of concentric neutral strands

Name: `k`
Default: 2

(Getter)
"""
function k(obj::Obj)::Int32
    obj_get_int32(obj, _PropertyIndex.k)
end

"""
Number of concentric neutral strands

Name: `k`
Default: 2

(Setter)
"""
function k(obj::Obj, value::Int32, flags::SetterFlagsT=SetterFlagsT(0))
    obj_set_int32(obj, _PropertyIndex.k, value, flags)
end

"""
Diameter of a concentric neutral strand; same units as core conductor radius.

Name: `DiaStrand`

(Getter)
"""
function DiaStrand(obj::Obj)::Float64
    obj_get_float64(obj, _PropertyIndex.DiaStrand)
end

"""
Diameter of a concentric neutral strand; same units as core conductor radius.

Name: `DiaStrand`

(Setter)
"""
function DiaStrand(obj::Obj, value::Float64, flags::SetterFlagsT=SetterFlagsT(0))
    obj_set_float64(obj, _PropertyIndex.DiaStrand, value, flags)
end

"""
Geometric mean radius of a concentric neutral strand; same units as core conductor GMR; defaults to \$0.7788 × DiaStrand\$.

Name: `GMRStrand`

(Getter)
"""
function GMRStrand(obj::Obj)::Float64
    obj_get_float64(obj, _PropertyIndex.GMRStrand)
end

"""
Geometric mean radius of a concentric neutral strand; same units as core conductor GMR; defaults to \$0.7788 × DiaStrand\$.

Name: `GMRStrand`

(Setter)
"""
function GMRStrand(obj::Obj, value::Float64, flags::SetterFlagsT=SetterFlagsT(0))
    obj_set_float64(obj, _PropertyIndex.GMRStrand, value, flags)
end

"""
AC resistance of a concentric neutral strand; same units as core conductor resistance.

Name: `RStrand`
Units: Ω/[length_unit]

(Getter)
"""
function RStrand(obj::Obj)::Float64
    obj_get_float64(obj, _PropertyIndex.RStrand)
end

"""
AC resistance of a concentric neutral strand; same units as core conductor resistance.

Name: `RStrand`
Units: Ω/[length_unit]

(Setter)
"""
function RStrand(obj::Obj, value::Float64, flags::SetterFlagsT=SetterFlagsT(0))
    obj_set_float64(obj, _PropertyIndex.RStrand, value, flags)
end

"""
CNData.semiconlayer

Name: `SemiconLayer`
Default: True

(Getter)
"""
function SemiconLayer(obj::Obj)::Bool
    return obj_get_bool(obj, _PropertyIndex.SemiconLayer)
end

"""
CNData.semiconlayer

Name: `SemiconLayer`
Default: True

(Setter)
"""
function SemiconLayer(obj::Obj, value::Bool, flags::SetterFlagsT=SetterFlagsT(0))
    obj_set_bool(obj, _PropertyIndex.SemiconLayer, value, flags)
end

"""
Insulation layer relative permittivity.

Name: `EpsR`
Default: 2.3

(Getter)
"""
function EpsR(obj::Obj)::Float64
    obj_get_float64(obj, _PropertyIndex.EpsR)
end

"""
Insulation layer relative permittivity.

Name: `EpsR`
Default: 2.3

(Setter)
"""
function EpsR(obj::Obj, value::Float64, flags::SetterFlagsT=SetterFlagsT(0))
    obj_set_float64(obj, _PropertyIndex.EpsR, value, flags)
end

"""
Insulation layer thickness; same units as radius. With DiaIns, establishes inner radius for capacitance calculation.

Name: `InsLayer`

(Getter)
"""
function InsLayer(obj::Obj)::Float64
    obj_get_float64(obj, _PropertyIndex.InsLayer)
end

"""
Insulation layer thickness; same units as radius. With DiaIns, establishes inner radius for capacitance calculation.

Name: `InsLayer`

(Setter)
"""
function InsLayer(obj::Obj, value::Float64, flags::SetterFlagsT=SetterFlagsT(0))
    obj_set_float64(obj, _PropertyIndex.InsLayer, value, flags)
end

"""
Diameter over insulation layer; same units as radius. Establishes outer radius for capacitance calculation.

Name: `DiaIns`

(Getter)
"""
function DiaIns(obj::Obj)::Float64
    obj_get_float64(obj, _PropertyIndex.DiaIns)
end

"""
Diameter over insulation layer; same units as radius. Establishes outer radius for capacitance calculation.

Name: `DiaIns`

(Setter)
"""
function DiaIns(obj::Obj, value::Float64, flags::SetterFlagsT=SetterFlagsT(0))
    obj_set_float64(obj, _PropertyIndex.DiaIns, value, flags)
end

"""
Diameter over cable; same units as radius.

Name: `DiaCable`

(Getter)
"""
function DiaCable(obj::Obj)::Float64
    obj_get_float64(obj, _PropertyIndex.DiaCable)
end

"""
Diameter over cable; same units as radius.

Name: `DiaCable`

(Setter)
"""
function DiaCable(obj::Obj, value::Float64, flags::SetterFlagsT=SetterFlagsT(0))
    obj_set_float64(obj, _PropertyIndex.DiaCable, value, flags)
end

"""
CNData.rdc

Name: `RDC`
Units: Ω/[length_unit]

(Getter)
"""
function RDC(obj::Obj)::Float64
    obj_get_float64(obj, _PropertyIndex.RDC)
end

"""
CNData.rdc

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

end # module CNData
export CNData
