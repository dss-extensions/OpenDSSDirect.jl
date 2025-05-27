module GICTransformer
using ..Enums.SetterFlags: SetterFlagsT
using ..Enums: GICTransformerType
using ..XYcurve: XYcurveObj
import Base: convert
using ..Common
using ..CircuitElement
using ..PDElement
using DocStringExtensions
@template (FUNCTIONS, METHODS) = """
                                 $(TYPEDSIGNATURES)
                                 $(DOCSTRING)
                                 """


const _cls_name = "GICTransformer"
const _cls_idx = 46

module _PropertyIndex
const BusH = Int32(1)
const BusNH = Int32(2)
const BusX = Int32(3)
const BusNX = Int32(4)
const Phases = Int32(5)
const Type = Int32(6)
const R1 = Int32(7)
const R2 = Int32(8)
const kVLL1 = Int32(9)
const kVLL2 = Int32(10)
const MVA = Int32(11)
const VarCurve = Int32(12)
const pctR1 = Int32(13)
const pctR2 = Int32(14)
const K = Int32(15)
const NormAmps = Int32(16)
const EmergAmps = Int32(17)
const FaultRate = Int32(18)
const pctPerm = Int32(19)
const Repair = Int32(20)
const BaseFreq = Int32(21)
const Enabled = Int32(22)
const Like = Int32(23)
end

struct GICTransformerObj <: AbstractPDElement
    ptr::Ptr{Cvoid}
    dss::DSSContext
end
export GICTransformerObj
Common._wrap_dss_obj(::Val{_cls_idx}, ptr::Ptr{Cvoid}, dss::DSSContext) = GICTransformerObj(ptr, dss)
const Obj = GICTransformerObj

function Base.show(io::IO, obj::GICTransformerObj) 
    name = obj_get_str(obj, obj.dss.capi.Obj_GetFullName)
    print(name)
end


include("dss_object.jl")


"""
Name of High-side(H) bus. Examples:
BusH=busname
BusH=busname.1.2.3

Name: `BusH`

(Getter)
"""
function BusH(obj::Obj)::String
    obj_get_str(obj, _PropertyIndex.BusH)
end

"""
Name of High-side(H) bus. Examples:
BusH=busname
BusH=busname.1.2.3

Name: `BusH`

(Setter)
"""
function BusH(obj::Obj, value::String, flags::SetterFlagsT=SetterFlagsT(0))
    obj_set_str(obj, _PropertyIndex.BusH, value, flags)
end

"""
Name of Neutral bus for H, or first, winding. Defaults to all phases connected to H-side bus, node 0, if not specified and transformer type is either GSU or YY. (Shunt Wye Connection to ground reference)For Auto, this is automatically set to the X bus.

Name: `BusNH`

(Getter)
"""
function BusNH(obj::Obj)::String
    obj_get_str(obj, _PropertyIndex.BusNH)
end

"""
Name of Neutral bus for H, or first, winding. Defaults to all phases connected to H-side bus, node 0, if not specified and transformer type is either GSU or YY. (Shunt Wye Connection to ground reference)For Auto, this is automatically set to the X bus.

Name: `BusNH`

(Setter)
"""
function BusNH(obj::Obj, value::String, flags::SetterFlagsT=SetterFlagsT(0))
    obj_set_str(obj, _PropertyIndex.BusNH, value, flags)
end

"""
Name of Low-side(X) bus, if type=Auto or YY. 

Name: `BusX`

(Getter)
"""
function BusX(obj::Obj)::String
    obj_get_str(obj, _PropertyIndex.BusX)
end

"""
Name of Low-side(X) bus, if type=Auto or YY. 

Name: `BusX`

(Setter)
"""
function BusX(obj::Obj, value::String, flags::SetterFlagsT=SetterFlagsT(0))
    obj_set_str(obj, _PropertyIndex.BusX, value, flags)
end

"""
Name of Neutral bus for X, or Second, winding. Defaults to all phases connected to X-side bus, node 0, if not specified. (Shunt Wye Connection to ground reference)

Name: `BusNX`

(Getter)
"""
function BusNX(obj::Obj)::String
    obj_get_str(obj, _PropertyIndex.BusNX)
end

"""
Name of Neutral bus for X, or Second, winding. Defaults to all phases connected to X-side bus, node 0, if not specified. (Shunt Wye Connection to ground reference)

Name: `BusNX`

(Setter)
"""
function BusNX(obj::Obj, value::String, flags::SetterFlagsT=SetterFlagsT(0))
    obj_set_str(obj, _PropertyIndex.BusNX, value, flags)
end

"""
Number of Phases.

Name: `Phases`
Default: 3

(Getter)
"""
function Phases(obj::Obj)::Int32
    obj_get_int32(obj, _PropertyIndex.Phases)
end

"""
Number of Phases.

Name: `Phases`
Default: 3

(Setter)
"""
function Phases(obj::Obj, value::Int32, flags::SetterFlagsT=SetterFlagsT(0))
    obj_set_int32(obj, _PropertyIndex.Phases, value, flags)
end

"""
Type of transformer.

Name: `Type`
Default: GSU

(Getter)
"""
function Type(obj::Obj)::GICTransformerType.T
    GICTransformerType.T(obj_get_int32(obj, _PropertyIndex.Type))
end

"""
Type of transformer.

Name: `Type`
Default: GSU

(Setter)
"""
function Type(obj::Obj, value::String, flags::SetterFlagsT=SetterFlagsT(0))
    obj_set_str(obj, _PropertyIndex.Type, value, flags)
end

"""
Type of transformer.

Name: `Type`
Default: GSU

(Setter)
"""
function Type(obj::Obj, value::Union{Int,GICTransformerType.T}, flags::SetterFlagsT=SetterFlagsT(0))
    obj_set_int32(obj, _PropertyIndex.Type, Int32(value), flags)
end

"""
Type of transformer.

Name: `Type`
Default: GSU

(Getter)
"""
function Type_str(obj::Obj)::String
    obj_get_str(obj, _PropertyIndex.Type)
end

"""
Type of transformer.

Name: `Type`
Default: GSU

(Setter)
"""
function Type_str(obj::Obj, value::String, flags::SetterFlagsT=SetterFlagsT(0))
    Type(obj, value, flags)
end

"""
Resistance, each phase, for H winding, (Series winding, if Auto).

Name: `R1`
Units: Ω
Default: 5.0

(Getter)
"""
function R1(obj::Obj)::Float64
    obj_get_float64(obj, _PropertyIndex.R1)
end

"""
Resistance, each phase, for H winding, (Series winding, if Auto).

Name: `R1`
Units: Ω
Default: 5.0

(Setter)
"""
function R1(obj::Obj, value::Float64, flags::SetterFlagsT=SetterFlagsT(0))
    obj_set_float64(obj, _PropertyIndex.R1, value, flags)
end

"""
Resistance, each phase, ohms for X winding, (Common winding, if Auto).

Name: `R2`
Units: Ω
Default: 0.38088000000000005

(Getter)
"""
function R2(obj::Obj)::Float64
    obj_get_float64(obj, _PropertyIndex.R2)
end

"""
Resistance, each phase, ohms for X winding, (Common winding, if Auto).

Name: `R2`
Units: Ω
Default: 0.38088000000000005

(Setter)
"""
function R2(obj::Obj, value::Float64, flags::SetterFlagsT=SetterFlagsT(0))
    obj_set_float64(obj, _PropertyIndex.R2, value, flags)
end

"""
Optional. Voltage LL rating for H winding (winding 1). Required if you are going to export vars for power flow analysis or enter winding resistances in percent.

Name: `kVLL1`
Units: kV
Default: 500.0

(Getter)
"""
function kVLL1(obj::Obj)::Float64
    obj_get_float64(obj, _PropertyIndex.kVLL1)
end

"""
Optional. Voltage LL rating for H winding (winding 1). Required if you are going to export vars for power flow analysis or enter winding resistances in percent.

Name: `kVLL1`
Units: kV
Default: 500.0

(Setter)
"""
function kVLL1(obj::Obj, value::Float64, flags::SetterFlagsT=SetterFlagsT(0))
    obj_set_float64(obj, _PropertyIndex.kVLL1, value, flags)
end

"""
Optional. Voltage LL rating for X winding (winding 2). Required if you are going to export vars for power flow analysis or enter winding resistances in percent..

Name: `kVLL2`
Units: kV
Default: 138.0

(Getter)
"""
function kVLL2(obj::Obj)::Float64
    obj_get_float64(obj, _PropertyIndex.kVLL2)
end

"""
Optional. Voltage LL rating for X winding (winding 2). Required if you are going to export vars for power flow analysis or enter winding resistances in percent..

Name: `kVLL2`
Units: kV
Default: 138.0

(Setter)
"""
function kVLL2(obj::Obj, value::Float64, flags::SetterFlagsT=SetterFlagsT(0))
    obj_set_float64(obj, _PropertyIndex.kVLL2, value, flags)
end

"""
Optional. MVA Rating assumed Transformer. Used for computing vars due to GIC and winding resistances if kV and MVA ratings are specified.

Name: `MVA`
Units: MVA
Default: 100.0

(Getter)
"""
function MVA(obj::Obj)::Float64
    obj_get_float64(obj, _PropertyIndex.MVA)
end

"""
Optional. MVA Rating assumed Transformer. Used for computing vars due to GIC and winding resistances if kV and MVA ratings are specified.

Name: `MVA`
Units: MVA
Default: 100.0

(Setter)
"""
function MVA(obj::Obj, value::Float64, flags::SetterFlagsT=SetterFlagsT(0))
    obj_set_float64(obj, _PropertyIndex.MVA, value, flags)
end

"""
Optional. XYCurve object name. Curve is expected as TOTAL pu vars vs pu GIC amps/phase. Vars are in pu of the MVA property. No Default value. Required only if you are going to export vars for power flow analysis. See K property.

Name: `VarCurve`

(Getter)
"""
function VarCurve_str(obj::Obj)::String
    obj_get_str(obj, _PropertyIndex.VarCurve)
end

"""
Optional. XYCurve object name. Curve is expected as TOTAL pu vars vs pu GIC amps/phase. Vars are in pu of the MVA property. No Default value. Required only if you are going to export vars for power flow analysis. See K property.

Name: `VarCurve`

(Setter)
"""
function VarCurve_str(obj::Obj, value::String, flags::SetterFlagsT=SetterFlagsT(0))
    obj_set_str(obj, _PropertyIndex.VarCurve, value, flags)
end

"""
Optional. XYCurve object name. Curve is expected as TOTAL pu vars vs pu GIC amps/phase. Vars are in pu of the MVA property. No Default value. Required only if you are going to export vars for power flow analysis. See K property.

Name: `VarCurve`

(Getter)
"""
function VarCurve(obj)::Union{XYcurveObj, Nothing}
    obj_get_obj(obj,_PropertyIndex.VarCurve, XYcurveObj)
end

"""
Optional. XYCurve object name. Curve is expected as TOTAL pu vars vs pu GIC amps/phase. Vars are in pu of the MVA property. No Default value. Required only if you are going to export vars for power flow analysis. See K property.

Name: `VarCurve`

(Setter)
"""
function VarCurve(obj::Obj, value::Union{XYcurveObj, Nothing}, flags::SetterFlagsT=SetterFlagsT(0))
    obj_set_obj(obj, _PropertyIndex.VarCurve, value, flags)
end

"""
Optional. XYCurve object name. Curve is expected as TOTAL pu vars vs pu GIC amps/phase. Vars are in pu of the MVA property. No Default value. Required only if you are going to export vars for power flow analysis. See K property.

Name: `VarCurve`

(Setter)
"""
function VarCurve(obj::Obj, value::String, flags::SetterFlagsT=SetterFlagsT(0))
    obj_set_str(obj, _PropertyIndex.VarCurve, value, flags)
end

"""
Optional. Percent Resistance, each phase, for H winding (1), (Series winding, if Auto).

Alternative way to enter R1 value. It is the actual resistances in ohmns that matter. MVA and kV should be specified.

Name: `%R1`

(Getter)
"""
function pctR1(obj::Obj)::Float64
    obj_get_float64(obj, _PropertyIndex.pctR1)
end

"""
Optional. Percent Resistance, each phase, for H winding (1), (Series winding, if Auto).

Alternative way to enter R1 value. It is the actual resistances in ohmns that matter. MVA and kV should be specified.

Name: `%R1`

(Setter)
"""
function pctR1(obj::Obj, value::Float64, flags::SetterFlagsT=SetterFlagsT(0))
    obj_set_float64(obj, _PropertyIndex.pctR1, value, flags)
end

"""
Optional. Percent Resistance, each phase, for X winding (2), (Common winding, if Auto).

Alternative way to enter R2 value. It is the actual resistances in ohms that matter. MVA and kV should be specified.

Name: `%R2`

(Getter)
"""
function pctR2(obj::Obj)::Float64
    obj_get_float64(obj, _PropertyIndex.pctR2)
end

"""
Optional. Percent Resistance, each phase, for X winding (2), (Common winding, if Auto).

Alternative way to enter R2 value. It is the actual resistances in ohms that matter. MVA and kV should be specified.

Name: `%R2`

(Setter)
"""
function pctR2(obj::Obj, value::Float64, flags::SetterFlagsT=SetterFlagsT(0))
    obj_set_float64(obj, _PropertyIndex.pctR2, value, flags)
end

"""
Mvar K factor. Default way to convert GIC Amps in H winding (winding 1) to Mvar. Commonly-used simple multiplier for estimating Mvar losses for power flow analysis. 

Mvar = K × kvLL × (GIC per phase) / 1000 

Mutually exclusive with using the VarCurve property and pu curves.If you specify this (default), VarCurve is ignored.

Name: `K`
Default: 2.2

(Getter)
"""
function K(obj::Obj)::Float64
    obj_get_float64(obj, _PropertyIndex.K)
end

"""
Mvar K factor. Default way to convert GIC Amps in H winding (winding 1) to Mvar. Commonly-used simple multiplier for estimating Mvar losses for power flow analysis. 

Mvar = K × kvLL × (GIC per phase) / 1000 

Mutually exclusive with using the VarCurve property and pu curves.If you specify this (default), VarCurve is ignored.

Name: `K`
Default: 2.2

(Setter)
"""
function K(obj::Obj, value::Float64, flags::SetterFlagsT=SetterFlagsT(0))
    obj_set_float64(obj, _PropertyIndex.K, value, flags)
end

"""
Normal rated current.

Name: `NormAmps`
Default: 0.0

(Getter)
"""
function NormAmps(obj::Obj)::Float64
    obj_get_float64(obj, _PropertyIndex.NormAmps)
end

"""
Normal rated current.

Name: `NormAmps`
Default: 0.0

(Setter)
"""
function NormAmps(obj::Obj, value::Float64, flags::SetterFlagsT=SetterFlagsT(0))
    obj_set_float64(obj, _PropertyIndex.NormAmps, value, flags)
end

"""
Maximum or emergency current rating.

Name: `EmergAmps`
Default: 0.0

(Getter)
"""
function EmergAmps(obj::Obj)::Float64
    obj_get_float64(obj, _PropertyIndex.EmergAmps)
end

"""
Maximum or emergency current rating.

Name: `EmergAmps`
Default: 0.0

(Setter)
"""
function EmergAmps(obj::Obj, value::Float64, flags::SetterFlagsT=SetterFlagsT(0))
    obj_set_float64(obj, _PropertyIndex.EmergAmps, value, flags)
end

"""
GICTransformer.faultrate

Name: `FaultRate`
Default: 0.0

(Getter)
"""
function FaultRate(obj::Obj)::Float64
    obj_get_float64(obj, _PropertyIndex.FaultRate)
end

"""
GICTransformer.faultrate

Name: `FaultRate`
Default: 0.0

(Setter)
"""
function FaultRate(obj::Obj, value::Float64, flags::SetterFlagsT=SetterFlagsT(0))
    obj_set_float64(obj, _PropertyIndex.FaultRate, value, flags)
end

"""
Percent of failures that become permanent.

Name: `pctPerm`
Default: 100.0

(Getter)
"""
function pctPerm(obj::Obj)::Float64
    obj_get_float64(obj, _PropertyIndex.pctPerm)
end

"""
Percent of failures that become permanent.

Name: `pctPerm`
Default: 100.0

(Setter)
"""
function pctPerm(obj::Obj, value::Float64, flags::SetterFlagsT=SetterFlagsT(0))
    obj_set_float64(obj, _PropertyIndex.pctPerm, value, flags)
end

"""
Hours to repair.

Name: `Repair`
Default: 0.0

(Getter)
"""
function Repair(obj::Obj)::Float64
    obj_get_float64(obj, _PropertyIndex.Repair)
end

"""
Hours to repair.

Name: `Repair`
Default: 0.0

(Setter)
"""
function Repair(obj::Obj, value::Float64, flags::SetterFlagsT=SetterFlagsT(0))
    obj_set_float64(obj, _PropertyIndex.Repair, value, flags)
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

end # module GICTransformer
export GICTransformer
