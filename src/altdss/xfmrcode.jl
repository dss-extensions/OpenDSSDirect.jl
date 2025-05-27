module XfmrCode
using ..Enums.SetterFlags: SetterFlagsT
using ..Enums: Connection
import Base: convert
using ..Common
using DocStringExtensions
@template (FUNCTIONS, METHODS) = """
                                 $(TYPEDSIGNATURES)
                                 $(DOCSTRING)
                                 """


const _cls_name = "XfmrCode"
const _cls_idx = 14

module _PropertyIndex
const Phases = Int32(1)
const Windings = Int32(2)
const Wdg = Int32(3)
const Conn = Int32(4)
const kV = Int32(5)
const kVA = Int32(6)
const Tap = Int32(7)
const pctR = Int32(8)
const RNeut = Int32(9)
const XNeut = Int32(10)
const Conns = Int32(11)
const kVs = Int32(12)
const kVAs = Int32(13)
const Taps = Int32(14)
const XHL = Int32(15)
const XHT = Int32(16)
const XLT = Int32(17)
const XSCArray = Int32(18)
const Thermal = Int32(19)
const n = Int32(20)
const m = Int32(21)
const FLRise = Int32(22)
const HSRise = Int32(23)
const pctLoadLoss = Int32(24)
const pctNoLoadLoss = Int32(25)
const NormHkVA = Int32(26)
const EmergHkVA = Int32(27)
const MaxTap = Int32(28)
const MinTap = Int32(29)
const NumTaps = Int32(30)
const pctIMag = Int32(31)
const ppm_Antifloat = Int32(32)
const pctRs = Int32(33)
const X12 = Int32(34)
const X13 = Int32(35)
const X23 = Int32(36)
const RDCOhms = Int32(37)
const Seasons = Int32(38)
const Ratings = Int32(39)
const Like = Int32(40)
end

struct XfmrCodeObj <: AbstractDSSObj
    ptr::Ptr{Cvoid}
    dss::DSSContext
end
export XfmrCodeObj
Common._wrap_dss_obj(::Val{_cls_idx}, ptr::Ptr{Cvoid}, dss::DSSContext) = XfmrCodeObj(ptr, dss)
const Obj = XfmrCodeObj

function Base.show(io::IO, obj::XfmrCodeObj) 
    name = obj_get_str(obj, obj.dss.capi.Obj_GetFullName)
    print(name)
end


include("dss_object.jl")


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
Number of windings, this transformers. (Also is the number of terminals) Default is 2. This property triggers memory allocation for the Transformer and will cause other properties to revert to default values.

Name: `Windings`

(Getter)
"""
function Windings(obj::Obj)::Int32
    obj_get_int32(obj, _PropertyIndex.Windings)
end

"""
Number of windings, this transformers. (Also is the number of terminals) Default is 2. This property triggers memory allocation for the Transformer and will cause other properties to revert to default values.

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
Neutral resistance of wye (star)-connected winding in actual ohms. If entered as a negative value, the neutral is assumed to be open, or floating.

Name: `RNeut`
Units: Ω
Default: [-1.0, -1.0]

(Getter)
"""
function RNeut(obj::Obj)::Vector{Float64}
    obj_get_float64s(obj, _PropertyIndex.RNeut)
end

"""
Neutral resistance of wye (star)-connected winding in actual ohms. If entered as a negative value, the neutral is assumed to be open, or floating.

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
Use this to specify all the Winding connections at once using an array. Example:

New Transformer.T1 buses="Hibus, lowbus"
~ conns=(delta, wye)

Name: `Conns`
Default: ['Wye', 'Wye']

(Getter)
"""
function Conns(obj)::Vector{Connection.T}
    Connection.T.(obj_get_int32s(obj, _PropertyIndex.Conns))
end

"""
Use this to specify all the Winding connections at once using an array. Example:

New Transformer.T1 buses="Hibus, lowbus"
~ conns=(delta, wye)

Name: `Conns`
Default: ['Wye', 'Wye']

(Setter)
"""
function Conns(obj::Obj, value::Vector{String}, flags::SetterFlagsT=SetterFlagsT(0))
    obj_set_strs(obj, _PropertyIndex.Conns, value, flags)
end

"""
Use this to specify all the Winding connections at once using an array. Example:

New Transformer.T1 buses="Hibus, lowbus"
~ conns=(delta, wye)

Name: `Conns`
Default: ['Wye', 'Wye']

(Setter)
"""
function Conns(obj::Obj, value::Union{Vector{Int},Vector{Connection.T}}, flags::SetterFlagsT=SetterFlagsT(0))
    obj_set_int32s(obj, _PropertyIndex.Conns, Int32.(value), flags)
end

"""
Use this to specify all the Winding connections at once using an array. Example:

New Transformer.T1 buses="Hibus, lowbus"
~ conns=(delta, wye)

Name: `Conns`
Default: ['Wye', 'Wye']

(Getter)
"""
function Conns_str(obj::Obj)::Vector{String}
    obj_get_strs(obj, _PropertyIndex.Conns)
end

"""
Use this to specify all the Winding connections at once using an array. Example:

New Transformer.T1 buses="Hibus, lowbus"
~ conns=(delta, wye)

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
Use this to specify the normal p.u. tap of all windings at once using an array.

Name: `Taps`
Default: [1.0, 1.0]

(Getter)
"""
function Taps(obj::Obj)::Vector{Float64}
    obj_get_float64s(obj, _PropertyIndex.Taps)
end

"""
Use this to specify the normal p.u. tap of all windings at once using an array.

Name: `Taps`
Default: [1.0, 1.0]

(Setter)
"""
function Taps(obj::Obj, value::Vector{Float64}, flags::SetterFlagsT=SetterFlagsT(0))
    obj_get_float64s(obj, _PropertyIndex.Taps, value, flags)
end

"""
Use this to specify the percent reactance, H-L (winding 1 to winding 2).  Use for 2- or 3-winding transformers. On the kva base of winding 1.

Name: `XHL`

(Getter)
"""
function XHL(obj::Obj)::Float64
    obj_get_float64(obj, _PropertyIndex.XHL)
end

"""
Use this to specify the percent reactance, H-L (winding 1 to winding 2).  Use for 2- or 3-winding transformers. On the kva base of winding 1.

Name: `XHL`

(Setter)
"""
function XHL(obj::Obj, value::Float64, flags::SetterFlagsT=SetterFlagsT(0))
    obj_set_float64(obj, _PropertyIndex.XHL, value, flags)
end

"""
Use this to specify the percent reactance, H-T (winding 1 to winding 3).  Use for 3-winding transformers only. On the kVA base of winding 1.

Name: `XHT`

(Getter)
"""
function XHT(obj::Obj)::Float64
    obj_get_float64(obj, _PropertyIndex.XHT)
end

"""
Use this to specify the percent reactance, H-T (winding 1 to winding 3).  Use for 3-winding transformers only. On the kVA base of winding 1.

Name: `XHT`

(Setter)
"""
function XHT(obj::Obj, value::Float64, flags::SetterFlagsT=SetterFlagsT(0))
    obj_set_float64(obj, _PropertyIndex.XHT, value, flags)
end

"""
Use this to specify the percent reactance, L-T (winding 2 to winding 3).  Use for 3-winding transformers only. On the kVA base of winding 1.

Name: `XLT`

(Getter)
"""
function XLT(obj::Obj)::Float64
    obj_get_float64(obj, _PropertyIndex.XLT)
end

"""
Use this to specify the percent reactance, L-T (winding 2 to winding 3).  Use for 3-winding transformers only. On the kVA base of winding 1.

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
Total number of taps between min and max tap.  Default is 32.

Name: `NumTaps`
Default: [32, 32]

(Getter)
"""
function NumTaps(obj::Obj)::Vector{Int32}
    obj_get_int32s(obj, _PropertyIndex.NumTaps)
end

"""
Total number of taps between min and max tap.  Default is 32.

Name: `NumTaps`
Default: [32, 32]

(Setter)
"""
function NumTaps(obj::Obj, value::Vector{Int32}, flags::SetterFlagsT=SetterFlagsT(0))
    obj_set_int32s(obj, _PropertyIndex.NumTaps, value, flags)
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
Winding dc resistance in OHMS. Useful for GIC analysis. From transformer test report. Defaults to 85% of %R property

Name: `RDCOhms`
Default: [0.26435153000000006, 0.26435153000000006]

(Getter)
"""
function RDCOhms(obj::Obj)::Vector{Float64}
    obj_get_float64s(obj, _PropertyIndex.RDCOhms)
end

"""
Winding dc resistance in OHMS. Useful for GIC analysis. From transformer test report. Defaults to 85% of %R property

Name: `RDCOhms`
Default: [0.26435153000000006, 0.26435153000000006]

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
multiple ratings to change during a QSTS simulation to evaluate different ratings in transformers.

Name: `Ratings`
Default: [600.0]

(Getter)
"""
function Ratings(obj::Obj)::Vector{Float64}
    obj_get_float64s(obj, _PropertyIndex.Ratings)
end

"""
An array of ratings to be used when the seasonal ratings flag is True. It can be used to insert
multiple ratings to change during a QSTS simulation to evaluate different ratings in transformers.

Name: `Ratings`
Default: [600.0]

(Setter)
"""
function Ratings(obj::Obj, value::Vector{Float64}, flags::SetterFlagsT=SetterFlagsT(0))
    obj_get_float64s(obj, _PropertyIndex.Ratings, value, flags)
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

end # module XfmrCode
export XfmrCode
