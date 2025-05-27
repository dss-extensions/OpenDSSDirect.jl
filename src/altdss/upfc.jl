module UPFC
using ..Enums.SetterFlags: SetterFlagsT
using ..Enums: UPFCMode
using ..Spectrum: SpectrumObj
using ..XYcurve: XYcurveObj
import Base: convert
using ..Common
using ..CircuitElement
using ..PCElement
using DocStringExtensions
@template (FUNCTIONS, METHODS) = """
                                 $(TYPEDSIGNATURES)
                                 $(DOCSTRING)
                                 """


const _cls_name = "UPFC"
const _cls_idx = 37

module _PropertyIndex
const Bus1 = Int32(1)
const Bus2 = Int32(2)
const RefkV = Int32(3)
const PF = Int32(4)
const Frequency = Int32(5)
const Phases = Int32(6)
const Xs = Int32(7)
const Tol1 = Int32(8)
const Mode = Int32(9)
const VpqMax = Int32(10)
const LossCurve = Int32(11)
const VHLimit = Int32(12)
const VLLimit = Int32(13)
const CLimit = Int32(14)
const refkV2 = Int32(15)
const kvarLimit = Int32(16)
const Element = Int32(17)
const Spectrum = Int32(18)
const BaseFreq = Int32(19)
const Enabled = Int32(20)
const Like = Int32(21)
end

struct UPFCObj <: AbstractPCElement
    ptr::Ptr{Cvoid}
    dss::DSSContext
end
export UPFCObj
Common._wrap_dss_obj(::Val{_cls_idx}, ptr::Ptr{Cvoid}, dss::DSSContext) = UPFCObj(ptr, dss)
const Obj = UPFCObj

function Base.show(io::IO, obj::UPFCObj) 
    name = obj_get_str(obj, obj.dss.capi.Obj_GetFullName)
    print(name)
end


include("dss_object.jl")


"""
Name of bus to which the input terminal (1) is connected.
bus1=busname.1.3
bus1=busname.1.2.3

Name: `Bus1`

(Getter)
"""
function Bus1(obj::Obj)::String
    obj_get_str(obj, _PropertyIndex.Bus1)
end

"""
Name of bus to which the input terminal (1) is connected.
bus1=busname.1.3
bus1=busname.1.2.3

Name: `Bus1`

(Setter)
"""
function Bus1(obj::Obj, value::String, flags::SetterFlagsT=SetterFlagsT(0))
    obj_set_str(obj, _PropertyIndex.Bus1, value, flags)
end

"""
Name of bus to which the output terminal (2) is connected.
bus2=busname.1.2
bus2=busname.1.2.3

Name: `Bus2`

(Getter)
"""
function Bus2(obj::Obj)::String
    obj_get_str(obj, _PropertyIndex.Bus2)
end

"""
Name of bus to which the output terminal (2) is connected.
bus2=busname.1.2
bus2=busname.1.2.3

Name: `Bus2`

(Setter)
"""
function Bus2(obj::Obj, value::String, flags::SetterFlagsT=SetterFlagsT(0))
    obj_set_str(obj, _PropertyIndex.Bus2, value, flags)
end

"""
Base Voltage expected at the output of the UPFC

"refkv=0.24"

Name: `RefkV`
Default: 0.24

(Getter)
"""
function RefkV(obj::Obj)::Float64
    obj_get_float64(obj, _PropertyIndex.RefkV)
end

"""
Base Voltage expected at the output of the UPFC

"refkv=0.24"

Name: `RefkV`
Default: 0.24

(Setter)
"""
function RefkV(obj::Obj, value::Float64, flags::SetterFlagsT=SetterFlagsT(0))
    obj_set_float64(obj, _PropertyIndex.RefkV, value, flags)
end

"""
Power factor target at the input terminal.

Name: `PF`
Default: 1.0

(Getter)
"""
function PF(obj::Obj)::Float64
    obj_get_float64(obj, _PropertyIndex.PF)
end

"""
Power factor target at the input terminal.

Name: `PF`
Default: 1.0

(Setter)
"""
function PF(obj::Obj, value::Float64, flags::SetterFlagsT=SetterFlagsT(0))
    obj_set_float64(obj, _PropertyIndex.PF, value, flags)
end

"""
UPFC working frequency.  Defaults to system default base frequency.

Name: `Frequency`
Units: Hz

(Getter)
"""
function Frequency(obj::Obj)::Float64
    obj_get_float64(obj, _PropertyIndex.Frequency)
end

"""
UPFC working frequency.  Defaults to system default base frequency.

Name: `Frequency`
Units: Hz

(Setter)
"""
function Frequency(obj::Obj, value::Float64, flags::SetterFlagsT=SetterFlagsT(0))
    obj_set_float64(obj, _PropertyIndex.Frequency, value, flags)
end

"""
Number of phases.  Defaults to 1 phase (2 terminals, 1 conductor per terminal).

Name: `Phases`
Default: 1

(Getter)
"""
function Phases(obj::Obj)::Int32
    obj_get_int32(obj, _PropertyIndex.Phases)
end

"""
Number of phases.  Defaults to 1 phase (2 terminals, 1 conductor per terminal).

Name: `Phases`
Default: 1

(Setter)
"""
function Phases(obj::Obj, value::Int32, flags::SetterFlagsT=SetterFlagsT(0))
    obj_set_int32(obj, _PropertyIndex.Phases, value, flags)
end

"""
Reactance of the series transformer of the UPFC, ohms (default=0.7540 ... 2 mH)

Name: `Xs`
Default: 0.754

(Getter)
"""
function Xs(obj::Obj)::Float64
    obj_get_float64(obj, _PropertyIndex.Xs)
end

"""
Reactance of the series transformer of the UPFC, ohms (default=0.7540 ... 2 mH)

Name: `Xs`
Default: 0.754

(Setter)
"""
function Xs(obj::Obj, value::Float64, flags::SetterFlagsT=SetterFlagsT(0))
    obj_set_float64(obj, _PropertyIndex.Xs, value, flags)
end

"""
Tolerance in pu for the series PI controller
Tol1=0.02 is the format used to define 2% tolerance (Default=2%)

Name: `Tol1`
Default: 0.02

(Getter)
"""
function Tol1(obj::Obj)::Float64
    obj_get_float64(obj, _PropertyIndex.Tol1)
end

"""
Tolerance in pu for the series PI controller
Tol1=0.02 is the format used to define 2% tolerance (Default=2%)

Name: `Tol1`
Default: 0.02

(Setter)
"""
function Tol1(obj::Obj, value::Float64, flags::SetterFlagsT=SetterFlagsT(0))
    obj_set_float64(obj, _PropertyIndex.Tol1, value, flags)
end

"""
Integer used to define the control mode of the UPFC: 

0 = Off, 
1 = Voltage regulator, 
2 = Phase angle regulator, 
3 = Dual mode
4 = It is a control mode where the user can set two different set points to create a secure GAP, these references must be defined in the parameters RefkV and RefkV2. The only restriction when setting these values is that RefkV must be higher than RefkV2. 
5 = In this mode the user can define the same GAP using two set points as in control mode 4. The only difference between mode 5 and mode 4 is that in mode 5, the UPFC controller performs dual control actions just as in control mode 3

Name: `Mode`
Default: 1

(Getter)
"""
function Mode(obj)::UPFCMode.T
    UPFCMode.T(obj_get_int32(obj, _PropertyIndex.Mode))
end

"""
Integer used to define the control mode of the UPFC: 

0 = Off, 
1 = Voltage regulator, 
2 = Phase angle regulator, 
3 = Dual mode
4 = It is a control mode where the user can set two different set points to create a secure GAP, these references must be defined in the parameters RefkV and RefkV2. The only restriction when setting these values is that RefkV must be higher than RefkV2. 
5 = In this mode the user can define the same GAP using two set points as in control mode 4. The only difference between mode 5 and mode 4 is that in mode 5, the UPFC controller performs dual control actions just as in control mode 3

Name: `Mode`
Default: 1

(Setter)
"""
function Mode(obj::Obj, value::Union{Int,UPFCMode.T}, flags::SetterFlagsT=SetterFlagsT(0))
    obj_set_int32(obj, _PropertyIndex.Mode, value, flags)
end

"""
Maximum voltage (in volts) delivered by the series voltage source (Default = 24 V)

Name: `VpqMax`
Default: 24.0

(Getter)
"""
function VpqMax(obj::Obj)::Float64
    obj_get_float64(obj, _PropertyIndex.VpqMax)
end

"""
Maximum voltage (in volts) delivered by the series voltage source (Default = 24 V)

Name: `VpqMax`
Default: 24.0

(Setter)
"""
function VpqMax(obj::Obj, value::Float64, flags::SetterFlagsT=SetterFlagsT(0))
    obj_set_float64(obj, _PropertyIndex.VpqMax, value, flags)
end

"""
Name of the XYCurve for describing the losses behavior as a function of the voltage at the input of the UPFC

Name: `LossCurve`

(Getter)
"""
function LossCurve_str(obj::Obj)::String
    obj_get_str(obj, _PropertyIndex.LossCurve)
end

"""
Name of the XYCurve for describing the losses behavior as a function of the voltage at the input of the UPFC

Name: `LossCurve`

(Setter)
"""
function LossCurve_str(obj::Obj, value::String, flags::SetterFlagsT=SetterFlagsT(0))
    obj_set_str(obj, _PropertyIndex.LossCurve, value, flags)
end

"""
Name of the XYCurve for describing the losses behavior as a function of the voltage at the input of the UPFC

Name: `LossCurve`

(Getter)
"""
function LossCurve(obj)::Union{XYcurveObj, Nothing}
    obj_get_obj(obj,_PropertyIndex.LossCurve, XYcurveObj)
end

"""
Name of the XYCurve for describing the losses behavior as a function of the voltage at the input of the UPFC

Name: `LossCurve`

(Setter)
"""
function LossCurve(obj::Obj, value::Union{XYcurveObj, Nothing}, flags::SetterFlagsT=SetterFlagsT(0))
    obj_set_obj(obj, _PropertyIndex.LossCurve, value, flags)
end

"""
Name of the XYCurve for describing the losses behavior as a function of the voltage at the input of the UPFC

Name: `LossCurve`

(Setter)
"""
function LossCurve(obj::Obj, value::String, flags::SetterFlagsT=SetterFlagsT(0))
    obj_set_str(obj, _PropertyIndex.LossCurve, value, flags)
end

"""
High limit for the voltage at the input of the UPFC, if the voltage is above this value the UPFC turns off. This value is specified in Volts (default 300 V)

Name: `VHLimit`
Default: 300.0

(Getter)
"""
function VHLimit(obj::Obj)::Float64
    obj_get_float64(obj, _PropertyIndex.VHLimit)
end

"""
High limit for the voltage at the input of the UPFC, if the voltage is above this value the UPFC turns off. This value is specified in Volts (default 300 V)

Name: `VHLimit`
Default: 300.0

(Setter)
"""
function VHLimit(obj::Obj, value::Float64, flags::SetterFlagsT=SetterFlagsT(0))
    obj_set_float64(obj, _PropertyIndex.VHLimit, value, flags)
end

"""
low limit for the voltage at the input of the UPFC, if voltage is below this value the UPFC turns off. This value is specified in Volts (default 125 V)

Name: `VLLimit`
Default: 125.0

(Getter)
"""
function VLLimit(obj::Obj)::Float64
    obj_get_float64(obj, _PropertyIndex.VLLimit)
end

"""
low limit for the voltage at the input of the UPFC, if voltage is below this value the UPFC turns off. This value is specified in Volts (default 125 V)

Name: `VLLimit`
Default: 125.0

(Setter)
"""
function VLLimit(obj::Obj, value::Float64, flags::SetterFlagsT=SetterFlagsT(0))
    obj_set_float64(obj, _PropertyIndex.VLLimit, value, flags)
end

"""
Current Limit for the UPFC, if the current passing through the UPFC is higher than this value the UPFC turns off. This value is specified in Amps (Default 265 A)

Name: `CLimit`
Default: 265.0

(Getter)
"""
function CLimit(obj::Obj)::Float64
    obj_get_float64(obj, _PropertyIndex.CLimit)
end

"""
Current Limit for the UPFC, if the current passing through the UPFC is higher than this value the UPFC turns off. This value is specified in Amps (Default 265 A)

Name: `CLimit`
Default: 265.0

(Setter)
"""
function CLimit(obj::Obj, value::Float64, flags::SetterFlagsT=SetterFlagsT(0))
    obj_set_float64(obj, _PropertyIndex.CLimit, value, flags)
end

"""
Base Voltage expected at the output of the UPFC for control modes 4 and 5.

This reference must be lower than refkv, see control modes 4 and 5 for details

Name: `refkV2`
Default: 0.0

(Getter)
"""
function refkV2(obj::Obj)::Float64
    obj_get_float64(obj, _PropertyIndex.refkV2)
end

"""
Base Voltage expected at the output of the UPFC for control modes 4 and 5.

This reference must be lower than refkv, see control modes 4 and 5 for details

Name: `refkV2`
Default: 0.0

(Setter)
"""
function refkV2(obj::Obj, value::Float64, flags::SetterFlagsT=SetterFlagsT(0))
    obj_set_float64(obj, _PropertyIndex.refkV2, value, flags)
end

"""
Maximum amount of reactive power that can be absorbed by the UPFC.

Name: `kvarLimit`
Units: kvar
Default: 5.0

(Getter)
"""
function kvarLimit(obj::Obj)::Float64
    obj_get_float64(obj, _PropertyIndex.kvarLimit)
end

"""
Maximum amount of reactive power that can be absorbed by the UPFC.

Name: `kvarLimit`
Units: kvar
Default: 5.0

(Setter)
"""
function kvarLimit(obj::Obj, value::Float64, flags::SetterFlagsT=SetterFlagsT(0))
    obj_set_float64(obj, _PropertyIndex.kvarLimit, value, flags)
end

"""
The name of the PD element monitored when operating with reactive power compensation. Normally, it should be the PD element immediately upstream the UPFC. The element must be defined including the class, e.g. Line.myline.

Name: `Element`

(Getter)
"""
function Element_str(obj::Obj)::String
    obj_get_str(obj, _PropertyIndex.Element)
end

"""
The name of the PD element monitored when operating with reactive power compensation. Normally, it should be the PD element immediately upstream the UPFC. The element must be defined including the class, e.g. Line.myline.

Name: `Element`

(Setter)
"""
function Element_str(obj::Obj, value::String, flags::SetterFlagsT=SetterFlagsT(0))
    obj_set_str(obj, _PropertyIndex.Element, value, flags)
end

"""
The name of the PD element monitored when operating with reactive power compensation. Normally, it should be the PD element immediately upstream the UPFC. The element must be defined including the class, e.g. Line.myline.

Name: `Element`

(Getter)
"""
function Element(obj)::Union{PDElement, Nothing}
    obj_get_obj(obj,_PropertyIndex.Element, PDElement)
end

"""
The name of the PD element monitored when operating with reactive power compensation. Normally, it should be the PD element immediately upstream the UPFC. The element must be defined including the class, e.g. Line.myline.

Name: `Element`

(Setter)
"""
function Element(obj::Obj, value::Union{PDElement, Nothing}, flags::SetterFlagsT=SetterFlagsT(0))
    obj_set_obj(obj, _PropertyIndex.Element, value, flags)
end

"""
The name of the PD element monitored when operating with reactive power compensation. Normally, it should be the PD element immediately upstream the UPFC. The element must be defined including the class, e.g. Line.myline.

Name: `Element`

(Setter)
"""
function Element(obj::Obj, value::String, flags::SetterFlagsT=SetterFlagsT(0))
    obj_set_str(obj, _PropertyIndex.Element, value, flags)
end

"""
Name of harmonic spectrum for this source.

Name: `Spectrum`
Default: default

(Getter)
"""
function Spectrum_str(obj::Obj)::String
    obj_get_str(obj, _PropertyIndex.Spectrum)
end

"""
Name of harmonic spectrum for this source.

Name: `Spectrum`
Default: default

(Setter)
"""
function Spectrum_str(obj::Obj, value::String, flags::SetterFlagsT=SetterFlagsT(0))
    obj_set_str(obj, _PropertyIndex.Spectrum, value, flags)
end

"""
Name of harmonic spectrum for this source.

Name: `Spectrum`
Default: default

(Getter)
"""
function Spectrum(obj)::Union{SpectrumObj, Nothing}
    obj_get_obj(obj,_PropertyIndex.Spectrum, SpectrumObj)
end

"""
Name of harmonic spectrum for this source.

Name: `Spectrum`
Default: default

(Setter)
"""
function Spectrum(obj::Obj, value::Union{SpectrumObj, Nothing}, flags::SetterFlagsT=SetterFlagsT(0))
    obj_set_obj(obj, _PropertyIndex.Spectrum, value, flags)
end

"""
Name of harmonic spectrum for this source.

Name: `Spectrum`
Default: default

(Setter)
"""
function Spectrum(obj::Obj, value::String, flags::SetterFlagsT=SetterFlagsT(0))
    obj_set_str(obj, _PropertyIndex.Spectrum, value, flags)
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

end # module UPFC
export UPFC
