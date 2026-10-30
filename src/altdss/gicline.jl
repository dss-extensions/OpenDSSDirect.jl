module GICLine
using ..Enums.SetterFlags: SetterFlagsT
using ..Spectrum: SpectrumObj
import Base: convert
using ..Common
using ..CircuitElement
using ..PCElement
using DocStringExtensions
@template (FUNCTIONS, METHODS) = """
                                 $(TYPEDSIGNATURES)
                                 $(DOCSTRING)
                                 """


const _cls_name = "GICLine"
const _cls_idx = 45

module _PropertyIndex
const Bus1 = Int32(1)
const Bus2 = Int32(2)
const Volts = Int32(3)
const Angle = Int32(4)
const Frequency = Int32(5)
const Phases = Int32(6)
const R = Int32(7)
const X = Int32(8)
const C = Int32(9)
const EN = Int32(10)
const EE = Int32(11)
const Lat1 = Int32(12)
const Lon1 = Int32(13)
const Lat2 = Int32(14)
const Lon2 = Int32(15)
const Spectrum = Int32(16)
const BaseFreq = Int32(17)
const Enabled = Int32(18)
const Like = Int32(19)
end

struct GICLineObj <: AbstractPCElement
    ptr::Ptr{Cvoid}
    dss::DSSContext
end
export GICLineObj
Common._wrap_dss_obj(::Val{_cls_idx}, ptr::Ptr{Cvoid}, dss::DSSContext) = GICLineObj(ptr, dss)
const Obj = GICLineObj

function Base.show(io::IO, obj::GICLineObj) 
    name = obj_get_str(obj, obj.dss.capi.Obj_GetFullName)
    print(name)
end


include("dss_object.jl")


"""
Name of bus to which the main terminal (1) is connected.
bus1=busname
bus1=busname.1.2.3

Name: `Bus1`

(Getter)
"""
function Bus1(obj::Obj)::String
    obj_get_str(obj, _PropertyIndex.Bus1)
end

"""
Name of bus to which the main terminal (1) is connected.
bus1=busname
bus1=busname.1.2.3

Name: `Bus1`

(Setter)
"""
function Bus1(obj::Obj, value::String, flags::SetterFlagsT=SetterFlagsT(0))
    obj_set_str(obj, _PropertyIndex.Bus1, value, flags)
end

"""
Name of bus to which 2nd terminal is connected.
bus2=busname
bus2=busname.1.2.3

No Default; must be specified.

Name: `Bus2`

(Getter)
"""
function Bus2(obj::Obj)::String
    obj_get_str(obj, _PropertyIndex.Bus2)
end

"""
Name of bus to which 2nd terminal is connected.
bus2=busname
bus2=busname.1.2.3

No Default; must be specified.

Name: `Bus2`

(Setter)
"""
function Bus2(obj::Obj, value::String, flags::SetterFlagsT=SetterFlagsT(0))
    obj_set_str(obj, _PropertyIndex.Bus2, value, flags)
end

"""
Voltage magnitude, in volts, of the GIC voltage induced across this line. When specified, voltage source is assumed defined by Voltage and Angle properties. 

Specify this value

OR

EN, EE, lat1, lon1, lat2, lon2. 

Not both!!  Last one entered will take precedence. Assumed identical in each phase of the Line object.

Name: `Volts`
Units: V

(Getter)
"""
function Volts(obj::Obj)::Float64
    obj_get_float64(obj, _PropertyIndex.Volts)
end

"""
Voltage magnitude, in volts, of the GIC voltage induced across this line. When specified, voltage source is assumed defined by Voltage and Angle properties. 

Specify this value

OR

EN, EE, lat1, lon1, lat2, lon2. 

Not both!!  Last one entered will take precedence. Assumed identical in each phase of the Line object.

Name: `Volts`
Units: V

(Setter)
"""
function Volts(obj::Obj, value::Float64, flags::SetterFlagsT=SetterFlagsT(0))
    obj_set_float64(obj, _PropertyIndex.Volts, value, flags)
end

"""
Phase angle in degrees of first phase. See Voltage property

Name: `Angle`
Default: 0.0

(Getter)
"""
function Angle(obj::Obj)::Float64
    obj_get_float64(obj, _PropertyIndex.Angle)
end

"""
Phase angle in degrees of first phase. See Voltage property

Name: `Angle`
Default: 0.0

(Setter)
"""
function Angle(obj::Obj, value::Float64, flags::SetterFlagsT=SetterFlagsT(0))
    obj_set_float64(obj, _PropertyIndex.Angle, value, flags)
end

"""
Source frequency.

Name: `Frequency`
Units: Hz
Default: 0.1

(Getter)
"""
function Frequency(obj::Obj)::Float64
    obj_get_float64(obj, _PropertyIndex.Frequency)
end

"""
Source frequency.

Name: `Frequency`
Units: Hz
Default: 0.1

(Setter)
"""
function Frequency(obj::Obj, value::Float64, flags::SetterFlagsT=SetterFlagsT(0))
    obj_set_float64(obj, _PropertyIndex.Frequency, value, flags)
end

"""
Number of phases.

Name: `Phases`
Default: 3

(Getter)
"""
function Phases(obj::Obj)::Int32
    obj_get_int32(obj, _PropertyIndex.Phases)
end

"""
Number of phases.

Name: `Phases`
Default: 3

(Setter)
"""
function Phases(obj::Obj, value::Int32, flags::SetterFlagsT=SetterFlagsT(0))
    obj_set_int32(obj, _PropertyIndex.Phases, value, flags)
end

"""
Resistance of line, impedance in series with GIC voltage source. 

Name: `R`
Units: Ω

(Getter)
"""
function R(obj::Obj)::Float64
    obj_get_float64(obj, _PropertyIndex.R)
end

"""
Resistance of line, impedance in series with GIC voltage source. 

Name: `R`
Units: Ω

(Setter)
"""
function R(obj::Obj, value::Float64, flags::SetterFlagsT=SetterFlagsT(0))
    obj_set_float64(obj, _PropertyIndex.R, value, flags)
end

"""
Reactance at base frequency. This value is generally not important for GIC studies but may be used if desired.

Name: `X`
Units: Ω
Default: 0.0

(Getter)
"""
function X(obj::Obj)::Float64
    obj_get_float64(obj, _PropertyIndex.X)
end

"""
Reactance at base frequency. This value is generally not important for GIC studies but may be used if desired.

Name: `X`
Units: Ω
Default: 0.0

(Setter)
"""
function X(obj::Obj, value::Float64, flags::SetterFlagsT=SetterFlagsT(0))
    obj_set_float64(obj, _PropertyIndex.X, value, flags)
end

"""
Value of line blocking capacitance. A zero value implies that there is no line blocking capacitor.

Name: `C`
Units: μF
Default: 0.0

(Getter)
"""
function C(obj::Obj)::Float64
    obj_get_float64(obj, _PropertyIndex.C)
end

"""
Value of line blocking capacitance. A zero value implies that there is no line blocking capacitor.

Name: `C`
Units: μF
Default: 0.0

(Setter)
"""
function C(obj::Obj, value::Float64, flags::SetterFlagsT=SetterFlagsT(0))
    obj_set_float64(obj, _PropertyIndex.C, value, flags)
end

"""
Northward Electric field. If specified, Voltage and Angle are computed from EN, EE, lat and lon values.

Name: `EN`
Units: V/km

(Getter)
"""
function EN(obj::Obj)::Float64
    obj_get_float64(obj, _PropertyIndex.EN)
end

"""
Northward Electric field. If specified, Voltage and Angle are computed from EN, EE, lat and lon values.

Name: `EN`
Units: V/km

(Setter)
"""
function EN(obj::Obj, value::Float64, flags::SetterFlagsT=SetterFlagsT(0))
    obj_set_float64(obj, _PropertyIndex.EN, value, flags)
end

"""
Eastward Electric field. If specified, Voltage and Angle are computed from EN, EE, lat and lon values.

Name: `EE`
Units: V/km

(Getter)
"""
function EE(obj::Obj)::Float64
    obj_get_float64(obj, _PropertyIndex.EE)
end

"""
Eastward Electric field. If specified, Voltage and Angle are computed from EN, EE, lat and lon values.

Name: `EE`
Units: V/km

(Setter)
"""
function EE(obj::Obj, value::Float64, flags::SetterFlagsT=SetterFlagsT(0))
    obj_set_float64(obj, _PropertyIndex.EE, value, flags)
end

"""
Latitude of Bus1

Name: `Lat1`
Units: °

(Getter)
"""
function Lat1(obj::Obj)::Float64
    obj_get_float64(obj, _PropertyIndex.Lat1)
end

"""
Latitude of Bus1

Name: `Lat1`
Units: °

(Setter)
"""
function Lat1(obj::Obj, value::Float64, flags::SetterFlagsT=SetterFlagsT(0))
    obj_set_float64(obj, _PropertyIndex.Lat1, value, flags)
end

"""
Longitude of Bus1

Name: `Lon1`
Units: °

(Getter)
"""
function Lon1(obj::Obj)::Float64
    obj_get_float64(obj, _PropertyIndex.Lon1)
end

"""
Longitude of Bus1

Name: `Lon1`
Units: °

(Setter)
"""
function Lon1(obj::Obj, value::Float64, flags::SetterFlagsT=SetterFlagsT(0))
    obj_set_float64(obj, _PropertyIndex.Lon1, value, flags)
end

"""
Latitude of Bus2

Name: `Lat2`
Units: °

(Getter)
"""
function Lat2(obj::Obj)::Float64
    obj_get_float64(obj, _PropertyIndex.Lat2)
end

"""
Latitude of Bus2

Name: `Lat2`
Units: °

(Setter)
"""
function Lat2(obj::Obj, value::Float64, flags::SetterFlagsT=SetterFlagsT(0))
    obj_set_float64(obj, _PropertyIndex.Lat2, value, flags)
end

"""
Longitude of Bus2

Name: `Lon2`
Units: °

(Getter)
"""
function Lon2(obj::Obj)::Float64
    obj_get_float64(obj, _PropertyIndex.Lon2)
end

"""
Longitude of Bus2

Name: `Lon2`
Units: °

(Setter)
"""
function Lon2(obj::Obj, value::Float64, flags::SetterFlagsT=SetterFlagsT(0))
    obj_set_float64(obj, _PropertyIndex.Lon2, value, flags)
end

"""
Inherited Property for all PCElements. Name of harmonic spectrum for this source.

Name: `Spectrum`

(Getter)
"""
function Spectrum_str(obj::Obj)::String
    obj_get_str(obj, _PropertyIndex.Spectrum)
end

"""
Inherited Property for all PCElements. Name of harmonic spectrum for this source.

Name: `Spectrum`

(Setter)
"""
function Spectrum_str(obj::Obj, value::String, flags::SetterFlagsT=SetterFlagsT(0))
    obj_set_str(obj, _PropertyIndex.Spectrum, value, flags)
end

"""
Inherited Property for all PCElements. Name of harmonic spectrum for this source.

Name: `Spectrum`

(Getter)
"""
function Spectrum(obj)::Union{SpectrumObj, Nothing}
    obj_get_obj(obj,_PropertyIndex.Spectrum, SpectrumObj)
end

"""
Inherited Property for all PCElements. Name of harmonic spectrum for this source.

Name: `Spectrum`

(Setter)
"""
function Spectrum(obj::Obj, value::Union{SpectrumObj, Nothing}, flags::SetterFlagsT=SetterFlagsT(0))
    obj_set_obj(obj, _PropertyIndex.Spectrum, value, flags)
end

"""
Inherited Property for all PCElements. Name of harmonic spectrum for this source.

Name: `Spectrum`

(Setter)
"""
function Spectrum(obj::Obj, value::String, flags::SetterFlagsT=SetterFlagsT(0))
    obj_set_str(obj, _PropertyIndex.Spectrum, value, flags)
end

"""
Inherited Property for all PCElements. Base frequency for specification of reactance value.

Name: `BaseFreq`

(Getter)
"""
function BaseFreq(obj::Obj)::Float64
    obj_get_float64(obj, _PropertyIndex.BaseFreq)
end

"""
Inherited Property for all PCElements. Base frequency for specification of reactance value.

Name: `BaseFreq`

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

end # module GICLine
export GICLine
