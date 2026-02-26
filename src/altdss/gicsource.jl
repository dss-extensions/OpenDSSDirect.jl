module GICsource
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


const _cls_name = "GICsource"
const _cls_idx = 41

module _PropertyIndex
const Volts = Int32(1)
const Angle = Int32(2)
const Frequency = Int32(3)
const Phases = Int32(4)
const EN = Int32(5)
const EE = Int32(6)
const Lat1 = Int32(7)
const Lon1 = Int32(8)
const Lat2 = Int32(9)
const Lon2 = Int32(10)
const Spectrum = Int32(11)
const BaseFreq = Int32(12)
const Enabled = Int32(13)
const Like = Int32(14)
end

struct GICsourceObj <: AbstractPCElement
    ptr::Ptr{Cvoid}
    dss::DSSContext
end
export GICsourceObj
Common._wrap_dss_obj(::Val{_cls_idx}, ptr::Ptr{Cvoid}, dss::DSSContext) = GICsourceObj(ptr, dss)
const Obj = GICsourceObj

function Base.show(io::IO, obj::GICsourceObj) 
    name = obj_get_str(obj, obj.dss.capi.Obj_GetFullName)
    print(name)
end


include("dss_object.jl")


"""
Voltage magnitude of the GIC voltage induced across the associated line. When specified, induced voltage is assumed defined by Voltage and Angle properties. 

Specify this value

OR

EN, EE, lat1, lon1, lat2, lon2. 

Not both!!  Last one entered will take precedence. Assumed identical in each phase of the Line object.

Name: `Volts`

(Getter)
"""
function Volts(obj::Obj)::Float64
    obj_get_float64(obj, _PropertyIndex.Volts)
end

"""
Voltage magnitude of the GIC voltage induced across the associated line. When specified, induced voltage is assumed defined by Voltage and Angle properties. 

Specify this value

OR

EN, EE, lat1, lon1, lat2, lon2. 

Not both!!  Last one entered will take precedence. Assumed identical in each phase of the Line object.

Name: `Volts`

(Setter)
"""
function Volts(obj::Obj, value::Float64, flags::SetterFlagsT=SetterFlagsT(0))
    obj_set_float64(obj, _PropertyIndex.Volts, value, flags)
end

"""
Phase angle of first phase. See Voltage property

Name: `Angle`
Units: °
Default: 0.0

(Getter)
"""
function Angle(obj::Obj)::Float64
    obj_get_float64(obj, _PropertyIndex.Angle)
end

"""
Phase angle of first phase. See Voltage property

Name: `Angle`
Units: °
Default: 0.0

(Setter)
"""
function Angle(obj::Obj, value::Float64, flags::SetterFlagsT=SetterFlagsT(0))
    obj_set_float64(obj, _PropertyIndex.Angle, value, flags)
end

"""
Source frequency. Defaults to 0.1 Hz. So GICSource=0 at power frequency.

Name: `Frequency`
Units: Hz
Default: 0.1

(Getter)
"""
function Frequency(obj::Obj)::Float64
    obj_get_float64(obj, _PropertyIndex.Frequency)
end

"""
Source frequency. Defaults to 0.1 Hz. So GICSource=0 at power frequency.

Name: `Frequency`
Units: Hz
Default: 0.1

(Setter)
"""
function Frequency(obj::Obj, value::Float64, flags::SetterFlagsT=SetterFlagsT(0))
    obj_set_float64(obj, _PropertyIndex.Frequency, value, flags)
end

"""
Number of phases. All three phases are assumed in phase (zero sequence)

Name: `Phases`
Default: 3

(Getter)
"""
function Phases(obj::Obj)::Int32
    obj_get_int32(obj, _PropertyIndex.Phases)
end

"""
Number of phases. All three phases are assumed in phase (zero sequence)

Name: `Phases`
Default: 3

(Setter)
"""
function Phases(obj::Obj, value::Int32, flags::SetterFlagsT=SetterFlagsT(0))
    obj_set_int32(obj, _PropertyIndex.Phases, value, flags)
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
Latitude of Bus1 of the line

Name: `Lat1`
Units: °

(Getter)
"""
function Lat1(obj::Obj)::Float64
    obj_get_float64(obj, _PropertyIndex.Lat1)
end

"""
Latitude of Bus1 of the line

Name: `Lat1`
Units: °

(Setter)
"""
function Lat1(obj::Obj, value::Float64, flags::SetterFlagsT=SetterFlagsT(0))
    obj_set_float64(obj, _PropertyIndex.Lat1, value, flags)
end

"""
Longitude of Bus1 of the line

Name: `Lon1`
Units: °

(Getter)
"""
function Lon1(obj::Obj)::Float64
    obj_get_float64(obj, _PropertyIndex.Lon1)
end

"""
Longitude of Bus1 of the line

Name: `Lon1`
Units: °

(Setter)
"""
function Lon1(obj::Obj, value::Float64, flags::SetterFlagsT=SetterFlagsT(0))
    obj_set_float64(obj, _PropertyIndex.Lon1, value, flags)
end

"""
Latitude of Bus2 of the line

Name: `Lat2`
Units: °

(Getter)
"""
function Lat2(obj::Obj)::Float64
    obj_get_float64(obj, _PropertyIndex.Lat2)
end

"""
Latitude of Bus2 of the line

Name: `Lat2`
Units: °

(Setter)
"""
function Lat2(obj::Obj, value::Float64, flags::SetterFlagsT=SetterFlagsT(0))
    obj_set_float64(obj, _PropertyIndex.Lat2, value, flags)
end

"""
Longitude of Bus2 of the line

Name: `Lon2`
Units: °

(Getter)
"""
function Lon2(obj::Obj)::Float64
    obj_get_float64(obj, _PropertyIndex.Lon2)
end

"""
Longitude of Bus2 of the line

Name: `Lon2`
Units: °

(Setter)
"""
function Lon2(obj::Obj, value::Float64, flags::SetterFlagsT=SetterFlagsT(0))
    obj_set_float64(obj, _PropertyIndex.Lon2, value, flags)
end

"""
Not used.

Name: `Spectrum`

(Getter)
"""
function Spectrum_str(obj::Obj)::String
    obj_get_str(obj, _PropertyIndex.Spectrum)
end

"""
Not used.

Name: `Spectrum`

(Setter)
"""
function Spectrum_str(obj::Obj, value::String, flags::SetterFlagsT=SetterFlagsT(0))
    obj_set_str(obj, _PropertyIndex.Spectrum, value, flags)
end

"""
Not used.

Name: `Spectrum`

(Getter)
"""
function Spectrum(obj)::Union{SpectrumObj, Nothing}
    obj_get_obj(obj,_PropertyIndex.Spectrum, SpectrumObj)
end

"""
Not used.

Name: `Spectrum`

(Setter)
"""
function Spectrum(obj::Obj, value::Union{SpectrumObj, Nothing}, flags::SetterFlagsT=SetterFlagsT(0))
    obj_set_obj(obj, _PropertyIndex.Spectrum, value, flags)
end

"""
Not used.

Name: `Spectrum`

(Setter)
"""
function Spectrum(obj::Obj, value::String, flags::SetterFlagsT=SetterFlagsT(0))
    obj_set_str(obj, _PropertyIndex.Spectrum, value, flags)
end

"""
Not used.

Name: `BaseFreq`
Units: Hz

(Getter)
"""
function BaseFreq(obj::Obj)::Float64
    obj_get_float64(obj, _PropertyIndex.BaseFreq)
end

"""
Not used.

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

end # module GICsource
export GICsource
