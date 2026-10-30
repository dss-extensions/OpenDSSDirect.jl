module Transformer
using ..Enums.SetterFlags: SetterFlagsT
using ..Enums: Connection, CoreType, PhaseSequence
using ..XfmrCode: XfmrCodeObj
import Base: convert
using ..Common
using ..CircuitElement
using ..PDElement
using DocStringExtensions
@template (FUNCTIONS, METHODS) = """
                                 $(TYPEDSIGNATURES)
                                 $(DOCSTRING)
                                 """


const _cls_name = "Transformer"
const _cls_idx = 20

module _PropertyIndex
const Phases = Int32(1)
const Windings = Int32(2)
const Wdg = Int32(3)
const Bus = Int32(4)
const Conn = Int32(5)
const kV = Int32(6)
const kVA = Int32(7)
const Tap = Int32(8)
const pctR = Int32(9)
const RNeut = Int32(10)
const XNeut = Int32(11)
const Buses = Int32(12)
const Conns = Int32(13)
const kVs = Int32(14)
const kVAs = Int32(15)
const Taps = Int32(16)
const XHL = Int32(17)
const XHT = Int32(18)
const XLT = Int32(19)
const XSCArray = Int32(20)
const Thermal = Int32(21)
const n = Int32(22)
const m = Int32(23)
const FLRise = Int32(24)
const HSRise = Int32(25)
const pctLoadLoss = Int32(26)
const pctNoLoadLoss = Int32(27)
const NormHkVA = Int32(28)
const EmergHkVA = Int32(29)
const Sub = Int32(30)
const MaxTap = Int32(31)
const MinTap = Int32(32)
const NumTaps = Int32(33)
const SubName = Int32(34)
const pctIMag = Int32(35)
const ppm_Antifloat = Int32(36)
const pctRs = Int32(37)
const Bank = Int32(38)
const XfmrCode = Int32(39)
const XRConst = Int32(40)
const X12 = Int32(41)
const X13 = Int32(42)
const X23 = Int32(43)
const LeadLag = Int32(44)
const WdgCurrents = Int32(45)
const Core = Int32(46)
const RDCOhms = Int32(47)
const Seasons = Int32(48)
const Ratings = Int32(49)
const NormAmps = Int32(50)
const EmergAmps = Int32(51)
const FaultRate = Int32(52)
const pctPerm = Int32(53)
const Repair = Int32(54)
const BaseFreq = Int32(55)
const Enabled = Int32(56)
const Like = Int32(57)
end

struct TransformerObj <: AbstractPDElement
    ptr::Ptr{Cvoid}
    dss::DSSContext
end
export TransformerObj
Common._wrap_dss_obj(::Val{_cls_idx}, ptr::Ptr{Cvoid}, dss::DSSContext) = TransformerObj(ptr, dss)
const Obj = TransformerObj

function Base.show(io::IO, obj::TransformerObj) 
    name = obj_get_str(obj, obj.dss.capi.Obj_GetFullName)
    print(name)
end


include("dss_object.jl")
include("transformer_extras.jl")


"""
Number of phases this transformer.

Name: `Phases`
Default: 3

(Getter)
"""
function Phases(obj::Obj)::Int32
    obj_get_int32(obj, _PropertyIndex.Phases)
end

"""
Number of phases this transformer.

Name: `Phases`
Default: 3

(Setter)
"""
function Phases(obj::Obj, value::Int32, flags::SetterFlagsT=SetterFlagsT(0))
    obj_set_int32(obj, _PropertyIndex.Phases, value, flags)
end

"""
Number of windings, this transformers. (Also is the number of terminals) This property triggers memory allocation for the Transformer and will cause other properties to revert to default values.

Name: `Windings`

(Getter)
"""
function Windings(obj::Obj)::Int32
    obj_get_int32(obj, _PropertyIndex.Windings)
end

"""
Number of windings, this transformers. (Also is the number of terminals) This property triggers memory allocation for the Transformer and will cause other properties to revert to default values.

Name: `Windings`

(Setter)
"""
function Windings(obj::Obj, value::Int32, flags::SetterFlagsT=SetterFlagsT(0))
    obj_set_int32(obj, _PropertyIndex.Windings, value, flags)
end

"""
Percent resistance this winding.  (half of total for a 2-winding).

Name: `%R`
Default: [0.2, 0.2]

(Getter)
"""
function pctR(obj::Obj)::Vector{Float64}
    obj_get_float64s(obj, _PropertyIndex.pctR)
end

"""
Percent resistance this winding.  (half of total for a 2-winding).

Name: `%R`
Default: [0.2, 0.2]

(Setter)
"""
function pctR(obj::Obj, value::Vector{Float64}, flags::SetterFlagsT=SetterFlagsT(0))
    obj_get_float64s(obj, _PropertyIndex.pctR, value, flags)
end

"""
Neutral resistance of wye (star)-connected winding in actual ohms. If entered as a negative value, the neutral is assumed to be open, or floating. To solidly ground the neutral, connect the neutral conductor to Node 0 in the Bus property spec for this winding. For example: Bus=MyBusName.1.2.3.0, which is generally the default connection.

Name: `RNeut`
Units: Ω
Default: [-1.0, -1.0]

(Getter)
"""
function RNeut(obj::Obj)::Vector{Float64}
    obj_get_float64s(obj, _PropertyIndex.RNeut)
end

"""
Neutral resistance of wye (star)-connected winding in actual ohms. If entered as a negative value, the neutral is assumed to be open, or floating. To solidly ground the neutral, connect the neutral conductor to Node 0 in the Bus property spec for this winding. For example: Bus=MyBusName.1.2.3.0, which is generally the default connection.

Name: `RNeut`
Units: Ω
Default: [-1.0, -1.0]

(Setter)
"""
function RNeut(obj::Obj, value::Vector{Float64}, flags::SetterFlagsT=SetterFlagsT(0))
    obj_get_float64s(obj, _PropertyIndex.RNeut, value, flags)
end

"""
Neutral reactance of wye(star)-connected winding in actual ohms. May be positive or negative.

Name: `XNeut`
Units: Ω
Default: [0.0, 0.0]

(Getter)
"""
function XNeut(obj::Obj)::Vector{Float64}
    obj_get_float64s(obj, _PropertyIndex.XNeut)
end

"""
Neutral reactance of wye(star)-connected winding in actual ohms. May be positive or negative.

Name: `XNeut`
Units: Ω
Default: [0.0, 0.0]

(Setter)
"""
function XNeut(obj::Obj, value::Vector{Float64}, flags::SetterFlagsT=SetterFlagsT(0))
    obj_get_float64s(obj, _PropertyIndex.XNeut, value, flags)
end

"""
Use this to specify all the bus connections at once using an array. Example:

New Transformer.T1 buses="Hibus, lowbus"

Name: `Buses`

(Getter)
"""
function Buses(obj::Obj)::Vector{String}
    obj_get_strs(obj, _PropertyIndex.Buses)
end

"""
Use this to specify all the bus connections at once using an array. Example:

New Transformer.T1 buses="Hibus, lowbus"

Name: `Buses`

(Setter)
"""
function Buses(obj::Obj, value::Vector{String}, flags::SetterFlagsT=SetterFlagsT(0))
    obj_set_strs(obj, _PropertyIndex.Buses, value, flags)
end

"""
Use this to specify all the Winding connections at once using an array. Example:

New Transformer.T1 buses="Hibus, lowbus" ~ conns=(delta, wye)

Name: `Conns`
Default: ['Wye', 'Wye']

(Getter)
"""
function Conns(obj)::Vector{Connection.T}
    Connection.T.(obj_get_int32s(obj, _PropertyIndex.Conns))
end

"""
Use this to specify all the Winding connections at once using an array. Example:

New Transformer.T1 buses="Hibus, lowbus" ~ conns=(delta, wye)

Name: `Conns`
Default: ['Wye', 'Wye']

(Setter)
"""
function Conns(obj::Obj, value::Vector{String}, flags::SetterFlagsT=SetterFlagsT(0))
    obj_set_strs(obj, _PropertyIndex.Conns, value, flags)
end

"""
Use this to specify all the Winding connections at once using an array. Example:

New Transformer.T1 buses="Hibus, lowbus" ~ conns=(delta, wye)

Name: `Conns`
Default: ['Wye', 'Wye']

(Setter)
"""
function Conns(obj::Obj, value::Union{Vector{Int},Vector{Connection.T}}, flags::SetterFlagsT=SetterFlagsT(0))
    obj_set_int32s(obj, _PropertyIndex.Conns, Int32.(value), flags)
end

"""
Use this to specify all the Winding connections at once using an array. Example:

New Transformer.T1 buses="Hibus, lowbus" ~ conns=(delta, wye)

Name: `Conns`
Default: ['Wye', 'Wye']

(Getter)
"""
function Conns_str(obj::Obj)::Vector{String}
    obj_get_strs(obj, _PropertyIndex.Conns)
end

"""
Use this to specify all the Winding connections at once using an array. Example:

New Transformer.T1 buses="Hibus, lowbus" ~ conns=(delta, wye)

Name: `Conns`
Default: ['Wye', 'Wye']

(Setter)
"""
function Conns_str(obj::Obj, value::Vector{String}, flags::SetterFlagsT=SetterFlagsT(0))
    Conns(obj, value, flags)
end

"""
Use this to specify the kV ratings of all windings at once using an array. Example:

New Transformer.T1 buses="Hibus, lowbus" 
~ conns=(delta, wye)
~ kvs=(115, 12.47)

See kV= property for voltage rules.

Name: `kVs`
Units: kV
Default: [12.47, 12.47]

(Getter)
"""
function kVs(obj::Obj)::Vector{Float64}
    obj_get_float64s(obj, _PropertyIndex.kVs)
end

"""
Use this to specify the kV ratings of all windings at once using an array. Example:

New Transformer.T1 buses="Hibus, lowbus" 
~ conns=(delta, wye)
~ kvs=(115, 12.47)

See kV= property for voltage rules.

Name: `kVs`
Units: kV
Default: [12.47, 12.47]

(Setter)
"""
function kVs(obj::Obj, value::Vector{Float64}, flags::SetterFlagsT=SetterFlagsT(0))
    obj_get_float64s(obj, _PropertyIndex.kVs, value, flags)
end

"""
Use this to specify the kVA ratings of all windings at once using an array.

Name: `kVAs`
Default: [1000.0, 1000.0]

(Getter)
"""
function kVAs(obj::Obj)::Vector{Float64}
    obj_get_float64s(obj, _PropertyIndex.kVAs)
end

"""
Use this to specify the kVA ratings of all windings at once using an array.

Name: `kVAs`
Default: [1000.0, 1000.0]

(Setter)
"""
function kVAs(obj::Obj, value::Vector{Float64}, flags::SetterFlagsT=SetterFlagsT(0))
    obj_get_float64s(obj, _PropertyIndex.kVAs, value, flags)
end

"""
Use this to specify the p.u. tap of all windings at once using an array.

Name: `Taps`
Default: [1.0, 1.0]

(Getter)
"""
function Taps(obj::Obj)::Vector{Float64}
    obj_get_float64s(obj, _PropertyIndex.Taps)
end

"""
Use this to specify the p.u. tap of all windings at once using an array.

Name: `Taps`
Default: [1.0, 1.0]

(Setter)
"""
function Taps(obj::Obj, value::Vector{Float64}, flags::SetterFlagsT=SetterFlagsT(0))
    obj_get_float64s(obj, _PropertyIndex.Taps, value, flags)
end

"""
Use this to specify the percent reactance, H-L (winding 1 to winding 2).  Use for 2- or 3-winding transformers. On the kVA base of winding 1. See also X12.

Name: `XHL`

(Getter)
"""
function XHL(obj::Obj)::Float64
    obj_get_float64(obj, _PropertyIndex.XHL)
end

"""
Use this to specify the percent reactance, H-L (winding 1 to winding 2).  Use for 2- or 3-winding transformers. On the kVA base of winding 1. See also X12.

Name: `XHL`

(Setter)
"""
function XHL(obj::Obj, value::Float64, flags::SetterFlagsT=SetterFlagsT(0))
    obj_set_float64(obj, _PropertyIndex.XHL, value, flags)
end

"""
Use this to specify the percent reactance, H-T (winding 1 to winding 3).  Use for 3-winding transformers only. On the kVA base of winding 1. See also X13.

Name: `XHT`

(Getter)
"""
function XHT(obj::Obj)::Float64
    obj_get_float64(obj, _PropertyIndex.XHT)
end

"""
Use this to specify the percent reactance, H-T (winding 1 to winding 3).  Use for 3-winding transformers only. On the kVA base of winding 1. See also X13.

Name: `XHT`

(Setter)
"""
function XHT(obj::Obj, value::Float64, flags::SetterFlagsT=SetterFlagsT(0))
    obj_set_float64(obj, _PropertyIndex.XHT, value, flags)
end

"""
Use this to specify the percent reactance, L-T (winding 2 to winding 3).  Use for 3-winding transformers only. On the kVA base of winding 1.  See also X23.

Name: `XLT`

(Getter)
"""
function XLT(obj::Obj)::Float64
    obj_get_float64(obj, _PropertyIndex.XLT)
end

"""
Use this to specify the percent reactance, L-T (winding 2 to winding 3).  Use for 3-winding transformers only. On the kVA base of winding 1.  See also X23.

Name: `XLT`

(Setter)
"""
function XLT(obj::Obj, value::Float64, flags::SetterFlagsT=SetterFlagsT(0))
    obj_set_float64(obj, _PropertyIndex.XLT, value, flags)
end

"""
Use this to specify the percent reactance between all pairs of windings as an array. All values are on the kVA base of winding 1.  The order of the values is as follows:

(x12 13 14... 23 24.. 34 ..)  

There will be n(n-1)/2 values, where n=number of windings.

Name: `XSCArray`

(Getter)
"""
function XSCArray(obj::Obj)::Vector{Float64}
    obj_get_float64s(obj, _PropertyIndex.XSCArray)
end

"""
Use this to specify the percent reactance between all pairs of windings as an array. All values are on the kVA base of winding 1.  The order of the values is as follows:

(x12 13 14... 23 24.. 34 ..)  

There will be n(n-1)/2 values, where n=number of windings.

Name: `XSCArray`

(Setter)
"""
function XSCArray(obj::Obj, value::Vector{Float64}, flags::SetterFlagsT=SetterFlagsT(0))
    obj_get_float64s(obj, _PropertyIndex.XSCArray, value, flags)
end

"""
Thermal time constant of the transformer. Typically about 2.

**Unused** (unused internally by the models, but can be used to transport data)

Name: `Thermal`
Units: hour
Default: 2.0

(Getter)
"""
function Thermal(obj::Obj)::Float64
    obj_get_float64(obj, _PropertyIndex.Thermal)
end

"""
Thermal time constant of the transformer. Typically about 2.

**Unused** (unused internally by the models, but can be used to transport data)

Name: `Thermal`
Units: hour
Default: 2.0

(Setter)
"""
function Thermal(obj::Obj, value::Float64, flags::SetterFlagsT=SetterFlagsT(0))
    obj_set_float64(obj, _PropertyIndex.Thermal, value, flags)
end

"""
n Exponent for thermal properties in IEEE C57.  Typically 0.8.

**Unused** (unused internally by the models, but can be used to transport data)

Name: `n`
Default: 0.8

(Getter)
"""
function n(obj::Obj)::Float64
    obj_get_float64(obj, _PropertyIndex.n)
end

"""
n Exponent for thermal properties in IEEE C57.  Typically 0.8.

**Unused** (unused internally by the models, but can be used to transport data)

Name: `n`
Default: 0.8

(Setter)
"""
function n(obj::Obj, value::Float64, flags::SetterFlagsT=SetterFlagsT(0))
    obj_set_float64(obj, _PropertyIndex.n, value, flags)
end

"""
m Exponent for thermal properties in IEEE C57.  Typically 0.9 - 1.0

**Unused** (unused internally by the models, but can be used to transport data)

Name: `m`
Default: 0.8

(Getter)
"""
function m(obj::Obj)::Float64
    obj_get_float64(obj, _PropertyIndex.m)
end

"""
m Exponent for thermal properties in IEEE C57.  Typically 0.9 - 1.0

**Unused** (unused internally by the models, but can be used to transport data)

Name: `m`
Default: 0.8

(Setter)
"""
function m(obj::Obj, value::Float64, flags::SetterFlagsT=SetterFlagsT(0))
    obj_set_float64(obj, _PropertyIndex.m, value, flags)
end

"""
Temperature rise for full load.

**Unused** (unused internally by the models, but can be used to transport data)

Name: `FLRise`
Units: °C
Default: 65.0

(Getter)
"""
function FLRise(obj::Obj)::Float64
    obj_get_float64(obj, _PropertyIndex.FLRise)
end

"""
Temperature rise for full load.

**Unused** (unused internally by the models, but can be used to transport data)

Name: `FLRise`
Units: °C
Default: 65.0

(Setter)
"""
function FLRise(obj::Obj, value::Float64, flags::SetterFlagsT=SetterFlagsT(0))
    obj_set_float64(obj, _PropertyIndex.FLRise, value, flags)
end

"""
Hot spot temperature rise.

**Unused** (unused internally by the models, but can be used to transport data)

Name: `HSRise`
Units: °C
Default: 15.0

(Getter)
"""
function HSRise(obj::Obj)::Float64
    obj_get_float64(obj, _PropertyIndex.HSRise)
end

"""
Hot spot temperature rise.

**Unused** (unused internally by the models, but can be used to transport data)

Name: `HSRise`
Units: °C
Default: 15.0

(Setter)
"""
function HSRise(obj::Obj, value::Float64, flags::SetterFlagsT=SetterFlagsT(0))
    obj_set_float64(obj, _PropertyIndex.HSRise, value, flags)
end

"""
Percent load loss at full load. The %R of the High and Low windings (1 and 2) are adjusted to agree at rated kVA loading.

Name: `%LoadLoss`
Default: 0.4

(Getter)
"""
function pctLoadLoss(obj::Obj)::Float64
    obj_get_float64(obj, _PropertyIndex.pctLoadLoss)
end

"""
Percent load loss at full load. The %R of the High and Low windings (1 and 2) are adjusted to agree at rated kVA loading.

Name: `%LoadLoss`
Default: 0.4

(Setter)
"""
function pctLoadLoss(obj::Obj, value::Float64, flags::SetterFlagsT=SetterFlagsT(0))
    obj_set_float64(obj, _PropertyIndex.pctLoadLoss, value, flags)
end

"""
Percent no load losses at rated excitation voltage. Default is 0. Converts to a resistance in parallel with the magnetizing impedance in each winding.

Name: `%NoLoadLoss`
Default: 0.0

(Getter)
"""
function pctNoLoadLoss(obj::Obj)::Float64
    obj_get_float64(obj, _PropertyIndex.pctNoLoadLoss)
end

"""
Percent no load losses at rated excitation voltage. Default is 0. Converts to a resistance in parallel with the magnetizing impedance in each winding.

Name: `%NoLoadLoss`
Default: 0.0

(Setter)
"""
function pctNoLoadLoss(obj::Obj, value::Float64, flags::SetterFlagsT=SetterFlagsT(0))
    obj_set_float64(obj, _PropertyIndex.pctNoLoadLoss, value, flags)
end

"""
Normal maximum kVA rating of H winding (winding 1).  Usually 100% - 110% of maximum nameplate rating, depending on load shape. Defaults to 110% of kVA rating of Winding 1.

Name: `NormHkVA`
Units: kVA

(Getter)
"""
function NormHkVA(obj::Obj)::Float64
    obj_get_float64(obj, _PropertyIndex.NormHkVA)
end

"""
Normal maximum kVA rating of H winding (winding 1).  Usually 100% - 110% of maximum nameplate rating, depending on load shape. Defaults to 110% of kVA rating of Winding 1.

Name: `NormHkVA`
Units: kVA

(Setter)
"""
function NormHkVA(obj::Obj, value::Float64, flags::SetterFlagsT=SetterFlagsT(0))
    obj_set_float64(obj, _PropertyIndex.NormHkVA, value, flags)
end

"""
Emergency (contingency)  kVA rating of H winding (winding 1).  Usually 140% - 150% of maximum nameplate rating, depending on load shape. Defaults to 150% of kVA rating of Winding 1.

Name: `EmergHkVA`
Units: kVA

(Getter)
"""
function EmergHkVA(obj::Obj)::Float64
    obj_get_float64(obj, _PropertyIndex.EmergHkVA)
end

"""
Emergency (contingency)  kVA rating of H winding (winding 1).  Usually 140% - 150% of maximum nameplate rating, depending on load shape. Defaults to 150% of kVA rating of Winding 1.

Name: `EmergHkVA`
Units: kVA

(Setter)
"""
function EmergHkVA(obj::Obj, value::Float64, flags::SetterFlagsT=SetterFlagsT(0))
    obj_set_float64(obj, _PropertyIndex.EmergHkVA, value, flags)
end

"""
Designates whether this transformer is to be considered a substation.Default is No.

Name: `Sub`
Default: False

(Getter)
"""
function Sub(obj::Obj)::Bool
    return obj_get_bool(obj, _PropertyIndex.Sub)
end

"""
Designates whether this transformer is to be considered a substation.Default is No.

Name: `Sub`
Default: False

(Setter)
"""
function Sub(obj::Obj, value::Bool, flags::SetterFlagsT=SetterFlagsT(0))
    obj_set_bool(obj, _PropertyIndex.Sub, value, flags)
end

"""
Max per unit tap for the active winding.

Name: `MaxTap`
Default: [1.1, 1.1]

(Getter)
"""
function MaxTap(obj::Obj)::Vector{Float64}
    obj_get_float64s(obj, _PropertyIndex.MaxTap)
end

"""
Max per unit tap for the active winding.

Name: `MaxTap`
Default: [1.1, 1.1]

(Setter)
"""
function MaxTap(obj::Obj, value::Vector{Float64}, flags::SetterFlagsT=SetterFlagsT(0))
    obj_get_float64s(obj, _PropertyIndex.MaxTap, value, flags)
end

"""
Min per unit tap for the active winding.

Name: `MinTap`
Default: [0.9, 0.9]

(Getter)
"""
function MinTap(obj::Obj)::Vector{Float64}
    obj_get_float64s(obj, _PropertyIndex.MinTap)
end

"""
Min per unit tap for the active winding.

Name: `MinTap`
Default: [0.9, 0.9]

(Setter)
"""
function MinTap(obj::Obj, value::Vector{Float64}, flags::SetterFlagsT=SetterFlagsT(0))
    obj_get_float64s(obj, _PropertyIndex.MinTap, value, flags)
end


"""
Total number of taps between min and max tap.  Default is 32 (16 raise and 16 lower taps about the neutral position). The neutral position is not counted.

Name: `NumTaps`
Default: [32, 32]

(Getter)
"""
function NumTaps(obj::Obj)::Vector{Int32}
    obj_get_int32s(obj, _PropertyIndex.NumTaps)
end

"""
Total number of taps between min and max tap.  Default is 32 (16 raise and 16 lower taps about the neutral position). The neutral position is not counted.

Name: `NumTaps`
Default: [32, 32]

(Setter)
"""
function NumTaps(obj::Obj, value::Vector{Int32}, flags::SetterFlagsT=SetterFlagsT(0))
    obj_set_int32s(obj, _PropertyIndex.NumTaps, value, flags)
end

"""
Substation Name. Optional. Default is null. If specified, printed on plots

Name: `SubName`

(Getter)
"""
function SubName(obj::Obj)::String
    obj_get_str(obj, _PropertyIndex.SubName)
end

"""
Substation Name. Optional. Default is null. If specified, printed on plots

Name: `SubName`

(Setter)
"""
function SubName(obj::Obj, value::String, flags::SetterFlagsT=SetterFlagsT(0))
    obj_set_str(obj, _PropertyIndex.SubName, value, flags)
end

"""
Percent magnetizing current. Magnetizing branch is in parallel with windings in each phase. Also, see "ppm_antifloat".

Name: `%IMag`
Default: 0.0

(Getter)
"""
function pctIMag(obj::Obj)::Float64
    obj_get_float64(obj, _PropertyIndex.pctIMag)
end

"""
Percent magnetizing current. Magnetizing branch is in parallel with windings in each phase. Also, see "ppm_antifloat".

Name: `%IMag`
Default: 0.0

(Setter)
"""
function pctIMag(obj::Obj, value::Float64, flags::SetterFlagsT=SetterFlagsT(0))
    obj_set_float64(obj, _PropertyIndex.pctIMag, value, flags)
end

"""
Default=1 ppm.  Parts per million of transformer winding VA rating connected to ground to protect against accidentally floating a winding without a reference. If positive then the effect is adding a very large reactance to ground.  If negative, then a capacitor.

Name: `ppm_Antifloat`
Default: 1.0

(Getter)
"""
function ppm_Antifloat(obj::Obj)::Float64
    obj_get_float64(obj, _PropertyIndex.ppm_Antifloat)
end

"""
Default=1 ppm.  Parts per million of transformer winding VA rating connected to ground to protect against accidentally floating a winding without a reference. If positive then the effect is adding a very large reactance to ground.  If negative, then a capacitor.

Name: `ppm_Antifloat`
Default: 1.0

(Setter)
"""
function ppm_Antifloat(obj::Obj, value::Float64, flags::SetterFlagsT=SetterFlagsT(0))
    obj_set_float64(obj, _PropertyIndex.ppm_Antifloat, value, flags)
end

"""
Use this property to specify all the winding %resistances using an array. Example:

New Transformer.T1 buses="Hibus, lowbus" ~ %Rs=(0.2  0.3)

Name: `%Rs`
Default: [0.2, 0.2]

(Getter)
"""
function pctRs(obj::Obj)::Vector{Float64}
    obj_get_float64s(obj, _PropertyIndex.pctRs)
end

"""
Use this property to specify all the winding %resistances using an array. Example:

New Transformer.T1 buses="Hibus, lowbus" ~ %Rs=(0.2  0.3)

Name: `%Rs`
Default: [0.2, 0.2]

(Setter)
"""
function pctRs(obj::Obj, value::Vector{Float64}, flags::SetterFlagsT=SetterFlagsT(0))
    obj_get_float64s(obj, _PropertyIndex.pctRs, value, flags)
end

"""
Name of the bank this transformer is part of, for CIM, MultiSpeak, and other interfaces.

Name: `Bank`

(Getter)
"""
function Bank(obj::Obj)::String
    obj_get_str(obj, _PropertyIndex.Bank)
end

"""
Name of the bank this transformer is part of, for CIM, MultiSpeak, and other interfaces.

Name: `Bank`

(Setter)
"""
function Bank(obj::Obj, value::String, flags::SetterFlagsT=SetterFlagsT(0))
    obj_set_str(obj, _PropertyIndex.Bank, value, flags)
end

"""
Name of a library entry for transformer properties. The named XfmrCode must already be defined.

Name: `XfmrCode`

(Getter)
"""
function XfmrCode_str(obj::Obj)::String
    obj_get_str(obj, _PropertyIndex.XfmrCode)
end

"""
Name of a library entry for transformer properties. The named XfmrCode must already be defined.

Name: `XfmrCode`

(Setter)
"""
function XfmrCode_str(obj::Obj, value::String, flags::SetterFlagsT=SetterFlagsT(0))
    obj_set_str(obj, _PropertyIndex.XfmrCode, value, flags)
end

"""
Name of a library entry for transformer properties. The named XfmrCode must already be defined.

Name: `XfmrCode`

(Getter)
"""
function XfmrCode(obj)::Union{XfmrCodeObj, Nothing}
    obj_get_obj(obj,_PropertyIndex.XfmrCode, XfmrCodeObj)
end

"""
Name of a library entry for transformer properties. The named XfmrCode must already be defined.

Name: `XfmrCode`

(Setter)
"""
function XfmrCode(obj::Obj, value::Union{XfmrCodeObj, Nothing}, flags::SetterFlagsT=SetterFlagsT(0))
    obj_set_obj(obj, _PropertyIndex.XfmrCode, value, flags)
end

"""
Name of a library entry for transformer properties. The named XfmrCode must already be defined.

Name: `XfmrCode`

(Setter)
"""
function XfmrCode(obj::Obj, value::String, flags::SetterFlagsT=SetterFlagsT(0))
    obj_set_str(obj, _PropertyIndex.XfmrCode, value, flags)
end

"""
Signifies whether or not the X/R is assumed constant for harmonic studies.

Name: `XRConst`
Default: False

(Getter)
"""
function XRConst(obj::Obj)::Bool
    return obj_get_bool(obj, _PropertyIndex.XRConst)
end

"""
Signifies whether or not the X/R is assumed constant for harmonic studies.

Name: `XRConst`
Default: False

(Setter)
"""
function XRConst(obj::Obj, value::Bool, flags::SetterFlagsT=SetterFlagsT(0))
    obj_set_bool(obj, _PropertyIndex.XRConst, value, flags)
end

"""
Alternative to XHL for specifying the percent reactance from winding 1 to winding 2.  Use for 2- or 3-winding transformers. Percent on the kVA base of winding 1. 

Name: `X12`
Default: 7.000000000000001

(Getter)
"""
function X12(obj::Obj)::Float64
    obj_get_float64(obj, _PropertyIndex.X12)
end

"""
Alternative to XHL for specifying the percent reactance from winding 1 to winding 2.  Use for 2- or 3-winding transformers. Percent on the kVA base of winding 1. 

Name: `X12`
Default: 7.000000000000001

(Setter)
"""
function X12(obj::Obj, value::Float64, flags::SetterFlagsT=SetterFlagsT(0))
    obj_set_float64(obj, _PropertyIndex.X12, value, flags)
end

"""
Alternative to XHT for specifying the percent reactance from winding 1 to winding 3.  Use for 3-winding transformers only. Percent on the kVA base of winding 1. 

Name: `X13`
Default: 35.0

(Getter)
"""
function X13(obj::Obj)::Float64
    obj_get_float64(obj, _PropertyIndex.X13)
end

"""
Alternative to XHT for specifying the percent reactance from winding 1 to winding 3.  Use for 3-winding transformers only. Percent on the kVA base of winding 1. 

Name: `X13`
Default: 35.0

(Setter)
"""
function X13(obj::Obj, value::Float64, flags::SetterFlagsT=SetterFlagsT(0))
    obj_set_float64(obj, _PropertyIndex.X13, value, flags)
end

"""
Alternative to XLT for specifying the percent reactance from winding 2 to winding 3.Use for 3-winding transformers only. Percent on the kVA base of winding 1.  

Name: `X23`
Default: 30.0

(Getter)
"""
function X23(obj::Obj)::Float64
    obj_get_float64(obj, _PropertyIndex.X23)
end

"""
Alternative to XLT for specifying the percent reactance from winding 2 to winding 3.Use for 3-winding transformers only. Percent on the kVA base of winding 1.  

Name: `X23`
Default: 30.0

(Setter)
"""
function X23(obj::Obj, value::Float64, flags::SetterFlagsT=SetterFlagsT(0))
    obj_set_float64(obj, _PropertyIndex.X23, value, flags)
end

"""
{Lead | Lag (default) | ANSI (default) | Euro } Designation in mixed Delta-wye connections the relationship between HV to LV winding. Default is ANSI 30 deg lag, e.g., Dy1 of Yd1 vector group. To get typical European Dy11 connection, specify either "lead" or "Euro"

Name: `LeadLag`
Default: Lag

(Getter)
"""
function LeadLag(obj::Obj)::PhaseSequence.T
    PhaseSequence.T(obj_get_int32(obj, _PropertyIndex.LeadLag))
end

"""
{Lead | Lag (default) | ANSI (default) | Euro } Designation in mixed Delta-wye connections the relationship between HV to LV winding. Default is ANSI 30 deg lag, e.g., Dy1 of Yd1 vector group. To get typical European Dy11 connection, specify either "lead" or "Euro"

Name: `LeadLag`
Default: Lag

(Setter)
"""
function LeadLag(obj::Obj, value::String, flags::SetterFlagsT=SetterFlagsT(0))
    obj_set_str(obj, _PropertyIndex.LeadLag, value, flags)
end

"""
{Lead | Lag (default) | ANSI (default) | Euro } Designation in mixed Delta-wye connections the relationship between HV to LV winding. Default is ANSI 30 deg lag, e.g., Dy1 of Yd1 vector group. To get typical European Dy11 connection, specify either "lead" or "Euro"

Name: `LeadLag`
Default: Lag

(Setter)
"""
function LeadLag(obj::Obj, value::Union{Int,PhaseSequence.T}, flags::SetterFlagsT=SetterFlagsT(0))
    obj_set_int32(obj, _PropertyIndex.LeadLag, Int32(value), flags)
end

"""
{Lead | Lag (default) | ANSI (default) | Euro } Designation in mixed Delta-wye connections the relationship between HV to LV winding. Default is ANSI 30 deg lag, e.g., Dy1 of Yd1 vector group. To get typical European Dy11 connection, specify either "lead" or "Euro"

Name: `LeadLag`
Default: Lag

(Getter)
"""
function LeadLag_str(obj::Obj)::String
    obj_get_str(obj, _PropertyIndex.LeadLag)
end

"""
{Lead | Lag (default) | ANSI (default) | Euro } Designation in mixed Delta-wye connections the relationship between HV to LV winding. Default is ANSI 30 deg lag, e.g., Dy1 of Yd1 vector group. To get typical European Dy11 connection, specify either "lead" or "Euro"

Name: `LeadLag`
Default: Lag

(Setter)
"""
function LeadLag_str(obj::Obj, value::String, flags::SetterFlagsT=SetterFlagsT(0))
    LeadLag(obj, value, flags)
end

"""
Core Type. Used for GIC analysis

Name: `Core`
Default: shell

(Getter)
"""
function Core(obj::Obj)::CoreType.T
    CoreType.T(obj_get_int32(obj, _PropertyIndex.Core))
end

"""
Core Type. Used for GIC analysis

Name: `Core`
Default: shell

(Setter)
"""
function Core(obj::Obj, value::String, flags::SetterFlagsT=SetterFlagsT(0))
    obj_set_str(obj, _PropertyIndex.Core, value, flags)
end

"""
Core Type. Used for GIC analysis

Name: `Core`
Default: shell

(Setter)
"""
function Core(obj::Obj, value::Union{Int,CoreType.T}, flags::SetterFlagsT=SetterFlagsT(0))
    obj_set_int32(obj, _PropertyIndex.Core, Int32(value), flags)
end

"""
Core Type. Used for GIC analysis

Name: `Core`
Default: shell

(Getter)
"""
function Core_str(obj::Obj)::String
    obj_get_str(obj, _PropertyIndex.Core)
end

"""
Core Type. Used for GIC analysis

Name: `Core`
Default: shell

(Setter)
"""
function Core_str(obj::Obj, value::String, flags::SetterFlagsT=SetterFlagsT(0))
    Core(obj, value, flags)
end

"""
Winding dc resistance in OHMS. Useful for GIC analysis. From transformer test report. Defaults to 85% of %R property

Name: `RDCOhms`
Default: [0.0881171766666667, 0.0881171766666667]

(Getter)
"""
function RDCOhms(obj::Obj)::Vector{Float64}
    obj_get_float64s(obj, _PropertyIndex.RDCOhms)
end

"""
Winding dc resistance in OHMS. Useful for GIC analysis. From transformer test report. Defaults to 85% of %R property

Name: `RDCOhms`
Default: [0.0881171766666667, 0.0881171766666667]

(Setter)
"""
function RDCOhms(obj::Obj, value::Vector{Float64}, flags::SetterFlagsT=SetterFlagsT(0))
    obj_get_float64s(obj, _PropertyIndex.RDCOhms, value, flags)
end

"""
Defines the number of ratings to be defined for the transformer, to be used only when defining seasonal ratings using the "Ratings" property.

Name: `Seasons`

(Getter)
"""
function Seasons(obj::Obj)::Int32
    obj_get_int32(obj, _PropertyIndex.Seasons)
end

"""
Defines the number of ratings to be defined for the transformer, to be used only when defining seasonal ratings using the "Ratings" property.

Name: `Seasons`

(Setter)
"""
function Seasons(obj::Obj, value::Int32, flags::SetterFlagsT=SetterFlagsT(0))
    obj_set_int32(obj, _PropertyIndex.Seasons, value, flags)
end

"""
An array of ratings to be used when the seasonal ratings flag is True. It can be used to insert
multiple ratings to change during a QSTS simulation to evaluate different ratings in transformers. Is given in kVA

Name: `Ratings`
Default: [1100.0]

(Getter)
"""
function Ratings(obj::Obj)::Vector{Float64}
    obj_get_float64s(obj, _PropertyIndex.Ratings)
end

"""
An array of ratings to be used when the seasonal ratings flag is True. It can be used to insert
multiple ratings to change during a QSTS simulation to evaluate different ratings in transformers. Is given in kVA

Name: `Ratings`
Default: [1100.0]

(Setter)
"""
function Ratings(obj::Obj, value::Vector{Float64}, flags::SetterFlagsT=SetterFlagsT(0))
    obj_get_float64s(obj, _PropertyIndex.Ratings, value, flags)
end

"""
Normal rated current.

**Read-only**

Name: `NormAmps`

(Getter)
"""
function NormAmps(obj::Obj)::Float64
    obj_get_float64(obj, _PropertyIndex.NormAmps)
end

"""
Normal rated current.

**Read-only**

Name: `NormAmps`

(Setter)
"""
function NormAmps(obj::Obj, value::Float64, flags::SetterFlagsT=SetterFlagsT(0))
    obj_set_float64(obj, _PropertyIndex.NormAmps, value, flags)
end

"""
Maximum or emergency current rating.

**Read-only**

Name: `EmergAmps`

(Getter)
"""
function EmergAmps(obj::Obj)::Float64
    obj_get_float64(obj, _PropertyIndex.EmergAmps)
end

"""
Maximum or emergency current rating.

**Read-only**

Name: `EmergAmps`

(Setter)
"""
function EmergAmps(obj::Obj, value::Float64, flags::SetterFlagsT=SetterFlagsT(0))
    obj_set_float64(obj, _PropertyIndex.EmergAmps, value, flags)
end

"""
Transformer.faultrate

Name: `FaultRate`
Default: 0.007

(Getter)
"""
function FaultRate(obj::Obj)::Float64
    obj_get_float64(obj, _PropertyIndex.FaultRate)
end

"""
Transformer.faultrate

Name: `FaultRate`
Default: 0.007

(Setter)
"""
function FaultRate(obj::Obj, value::Float64, flags::SetterFlagsT=SetterFlagsT(0))
    obj_set_float64(obj, _PropertyIndex.FaultRate, value, flags)
end

"""
Percent of failures that become permanent.

Name: `pctPerm`
Default: 0.0

(Getter)
"""
function pctPerm(obj::Obj)::Float64
    obj_get_float64(obj, _PropertyIndex.pctPerm)
end

"""
Percent of failures that become permanent.

Name: `pctPerm`
Default: 0.0

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

end # module Transformer
export Transformer
