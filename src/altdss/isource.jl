module Isource
using ..Enums.SetterFlags: SetterFlagsT
using ..Enums: ScanType as ScanTypeEnum, SequenceType
using ..LoadShape: LoadShapeObj
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


const _cls_name = "Isource"
const _cls_idx = 17

module _PropertyIndex
const Bus1 = Int32(1)
const Amps = Int32(2)
const Angle = Int32(3)
const Frequency = Int32(4)
const Phases = Int32(5)
const ScanType = Int32(6)
const Sequence = Int32(7)
const Yearly = Int32(8)
const Daily = Int32(9)
const Duty = Int32(10)
const Bus2 = Int32(11)
const Spectrum = Int32(12)
const BaseFreq = Int32(13)
const Enabled = Int32(14)
const Like = Int32(15)
end

struct IsourceObj <: AbstractPCElement
    ptr::Ptr{Cvoid}
    dss::DSSContext
end
export IsourceObj
Common._wrap_dss_obj(::Val{_cls_idx}, ptr::Ptr{Cvoid}, dss::DSSContext) = IsourceObj(ptr, dss)
const Obj = IsourceObj

function Base.show(io::IO, obj::IsourceObj) 
    name = obj_get_str(obj, obj.dss.capi.Obj_GetFullName)
    print(name)
end


include("dss_object.jl")


"""
Name of bus to which source is connected.
bus1=busname
bus1=busname.1.2.3

Name: `Bus1`

(Getter)
"""
function Bus1(obj::Obj)::String
    obj_get_str(obj, _PropertyIndex.Bus1)
end

"""
Name of bus to which source is connected.
bus1=busname
bus1=busname.1.2.3

Name: `Bus1`

(Setter)
"""
function Bus1(obj::Obj, value::String, flags::SetterFlagsT=SetterFlagsT(0))
    obj_set_str(obj, _PropertyIndex.Bus1, value, flags)
end

"""
Magnitude of current source, each phase, in Amps.

Name: `Amps`
Units: A

(Getter)
"""
function Amps(obj::Obj)::Float64
    obj_get_float64(obj, _PropertyIndex.Amps)
end

"""
Magnitude of current source, each phase, in Amps.

Name: `Amps`
Units: A

(Setter)
"""
function Amps(obj::Obj, value::Float64, flags::SetterFlagsT=SetterFlagsT(0))
    obj_set_float64(obj, _PropertyIndex.Amps, value, flags)
end

"""
Phase angle of first phase: e.g., Angle=10.3.
Phase shift between phases is assumed 120 degrees when number of phases less than 3.

Name: `Angle`
Units: °
Default: 0.0

(Getter)
"""
function Angle(obj::Obj)::Float64
    obj_get_float64(obj, _PropertyIndex.Angle)
end

"""
Phase angle of first phase: e.g., Angle=10.3.
Phase shift between phases is assumed 120 degrees when number of phases less than 3.

Name: `Angle`
Units: °
Default: 0.0

(Setter)
"""
function Angle(obj::Obj, value::Float64, flags::SetterFlagsT=SetterFlagsT(0))
    obj_set_float64(obj, _PropertyIndex.Angle, value, flags)
end

"""
Source frequency.  Defaults to  circuit fundamental frequency.

Name: `Frequency`
Units: Hz

(Getter)
"""
function Frequency(obj::Obj)::Float64
    obj_get_float64(obj, _PropertyIndex.Frequency)
end

"""
Source frequency.  Defaults to  circuit fundamental frequency.

Name: `Frequency`
Units: Hz

(Setter)
"""
function Frequency(obj::Obj, value::Float64, flags::SetterFlagsT=SetterFlagsT(0))
    obj_set_float64(obj, _PropertyIndex.Frequency, value, flags)
end

"""
Number of phases. For 3 or less, phase shift is 120 degrees.

Name: `Phases`
Default: 3

(Getter)
"""
function Phases(obj::Obj)::Int32
    obj_get_int32(obj, _PropertyIndex.Phases)
end

"""
Number of phases. For 3 or less, phase shift is 120 degrees.

Name: `Phases`
Default: 3

(Setter)
"""
function Phases(obj::Obj, value::Int32, flags::SetterFlagsT=SetterFlagsT(0))
    obj_set_int32(obj, _PropertyIndex.Phases, value, flags)
end

"""
Maintain specified sequence for harmonic solution. Default is positive sequence. Otherwise, angle between phases rotates with harmonic.

Name: `ScanType`
Default: Positive

(Getter)
"""
function ScanType(obj::Obj)::ScanTypeEnum.T
    ScanTypeEnum.T(obj_get_int32(obj, _PropertyIndex.ScanType))
end

"""
Maintain specified sequence for harmonic solution. Default is positive sequence. Otherwise, angle between phases rotates with harmonic.

Name: `ScanType`
Default: Positive

(Setter)
"""
function ScanType(obj::Obj, value::String, flags::SetterFlagsT=SetterFlagsT(0))
    obj_set_str(obj, _PropertyIndex.ScanType, value, flags)
end

"""
Maintain specified sequence for harmonic solution. Default is positive sequence. Otherwise, angle between phases rotates with harmonic.

Name: `ScanType`
Default: Positive

(Setter)
"""
function ScanType(obj::Obj, value::Union{Int,ScanTypeEnum.T}, flags::SetterFlagsT=SetterFlagsT(0))
    obj_set_int32(obj, _PropertyIndex.ScanType, Int32(value), flags)
end

"""
Maintain specified sequence for harmonic solution. Default is positive sequence. Otherwise, angle between phases rotates with harmonic.

Name: `ScanType`
Default: Positive

(Getter)
"""
function ScanType_str(obj::Obj)::String
    obj_get_str(obj, _PropertyIndex.ScanType)
end

"""
Maintain specified sequence for harmonic solution. Default is positive sequence. Otherwise, angle between phases rotates with harmonic.

Name: `ScanType`
Default: Positive

(Setter)
"""
function ScanType_str(obj::Obj, value::String, flags::SetterFlagsT=SetterFlagsT(0))
    ScanType(obj, value, flags)
end

"""
Set the phase angles for the specified symmetrical component sequence for non-harmonic solution modes.

Name: `Sequence`
Default: Positive

(Getter)
"""
function Sequence(obj::Obj)::SequenceType.T
    SequenceType.T(obj_get_int32(obj, _PropertyIndex.Sequence))
end

"""
Set the phase angles for the specified symmetrical component sequence for non-harmonic solution modes.

Name: `Sequence`
Default: Positive

(Setter)
"""
function Sequence(obj::Obj, value::String, flags::SetterFlagsT=SetterFlagsT(0))
    obj_set_str(obj, _PropertyIndex.Sequence, value, flags)
end

"""
Set the phase angles for the specified symmetrical component sequence for non-harmonic solution modes.

Name: `Sequence`
Default: Positive

(Setter)
"""
function Sequence(obj::Obj, value::Union{Int,SequenceType.T}, flags::SetterFlagsT=SetterFlagsT(0))
    obj_set_int32(obj, _PropertyIndex.Sequence, Int32(value), flags)
end

"""
Set the phase angles for the specified symmetrical component sequence for non-harmonic solution modes.

Name: `Sequence`
Default: Positive

(Getter)
"""
function Sequence_str(obj::Obj)::String
    obj_get_str(obj, _PropertyIndex.Sequence)
end

"""
Set the phase angles for the specified symmetrical component sequence for non-harmonic solution modes.

Name: `Sequence`
Default: Positive

(Setter)
"""
function Sequence_str(obj::Obj, value::String, flags::SetterFlagsT=SetterFlagsT(0))
    Sequence(obj, value, flags)
end

"""
LOADSHAPE object to use for the per-unit current for YEARLY-mode simulations. Set the Mult property of the LOADSHAPE to the pu curve. Qmult is not used. If UseActual=Yes then the Mult curve should be actual Amp.

Must be previously defined as a LOADSHAPE object. 

Is set to the Daily load shape when Daily is defined.  The daily load shape is repeated in this case. Set to NONE to reset to no loadshape for Yearly mode. The default is no variation.

Name: `Yearly`

(Getter)
"""
function Yearly_str(obj::Obj)::String
    obj_get_str(obj, _PropertyIndex.Yearly)
end

"""
LOADSHAPE object to use for the per-unit current for YEARLY-mode simulations. Set the Mult property of the LOADSHAPE to the pu curve. Qmult is not used. If UseActual=Yes then the Mult curve should be actual Amp.

Must be previously defined as a LOADSHAPE object. 

Is set to the Daily load shape when Daily is defined.  The daily load shape is repeated in this case. Set to NONE to reset to no loadshape for Yearly mode. The default is no variation.

Name: `Yearly`

(Setter)
"""
function Yearly_str(obj::Obj, value::String, flags::SetterFlagsT=SetterFlagsT(0))
    obj_set_str(obj, _PropertyIndex.Yearly, value, flags)
end

"""
LOADSHAPE object to use for the per-unit current for YEARLY-mode simulations. Set the Mult property of the LOADSHAPE to the pu curve. Qmult is not used. If UseActual=Yes then the Mult curve should be actual Amp.

Must be previously defined as a LOADSHAPE object. 

Is set to the Daily load shape when Daily is defined.  The daily load shape is repeated in this case. Set to NONE to reset to no loadshape for Yearly mode. The default is no variation.

Name: `Yearly`

(Getter)
"""
function Yearly(obj)::Union{LoadShapeObj, Nothing}
    obj_get_obj(obj,_PropertyIndex.Yearly, LoadShapeObj)
end

"""
LOADSHAPE object to use for the per-unit current for YEARLY-mode simulations. Set the Mult property of the LOADSHAPE to the pu curve. Qmult is not used. If UseActual=Yes then the Mult curve should be actual Amp.

Must be previously defined as a LOADSHAPE object. 

Is set to the Daily load shape when Daily is defined.  The daily load shape is repeated in this case. Set to NONE to reset to no loadshape for Yearly mode. The default is no variation.

Name: `Yearly`

(Setter)
"""
function Yearly(obj::Obj, value::Union{LoadShapeObj, Nothing}, flags::SetterFlagsT=SetterFlagsT(0))
    obj_set_obj(obj, _PropertyIndex.Yearly, value, flags)
end

"""
LOADSHAPE object to use for the per-unit current for YEARLY-mode simulations. Set the Mult property of the LOADSHAPE to the pu curve. Qmult is not used. If UseActual=Yes then the Mult curve should be actual Amp.

Must be previously defined as a LOADSHAPE object. 

Is set to the Daily load shape when Daily is defined.  The daily load shape is repeated in this case. Set to NONE to reset to no loadshape for Yearly mode. The default is no variation.

Name: `Yearly`

(Setter)
"""
function Yearly(obj::Obj, value::String, flags::SetterFlagsT=SetterFlagsT(0))
    obj_set_str(obj, _PropertyIndex.Yearly, value, flags)
end

"""
LOADSHAPE object to use for the per-unit current for DAILY-mode simulations. Set the Mult property of the LOADSHAPE to the pu curve. Qmult is not used. If UseActual=Yes then the Mult curve should be actual A.

Must be previously defined as a LOADSHAPE object. 

Sets Yearly curve if it is not already defined.   Set to NONE to reset to no loadshape for Yearly mode. The default is no variation.

Name: `Daily`

(Getter)
"""
function Daily_str(obj::Obj)::String
    obj_get_str(obj, _PropertyIndex.Daily)
end

"""
LOADSHAPE object to use for the per-unit current for DAILY-mode simulations. Set the Mult property of the LOADSHAPE to the pu curve. Qmult is not used. If UseActual=Yes then the Mult curve should be actual A.

Must be previously defined as a LOADSHAPE object. 

Sets Yearly curve if it is not already defined.   Set to NONE to reset to no loadshape for Yearly mode. The default is no variation.

Name: `Daily`

(Setter)
"""
function Daily_str(obj::Obj, value::String, flags::SetterFlagsT=SetterFlagsT(0))
    obj_set_str(obj, _PropertyIndex.Daily, value, flags)
end

"""
LOADSHAPE object to use for the per-unit current for DAILY-mode simulations. Set the Mult property of the LOADSHAPE to the pu curve. Qmult is not used. If UseActual=Yes then the Mult curve should be actual A.

Must be previously defined as a LOADSHAPE object. 

Sets Yearly curve if it is not already defined.   Set to NONE to reset to no loadshape for Yearly mode. The default is no variation.

Name: `Daily`

(Getter)
"""
function Daily(obj)::Union{LoadShapeObj, Nothing}
    obj_get_obj(obj,_PropertyIndex.Daily, LoadShapeObj)
end

"""
LOADSHAPE object to use for the per-unit current for DAILY-mode simulations. Set the Mult property of the LOADSHAPE to the pu curve. Qmult is not used. If UseActual=Yes then the Mult curve should be actual A.

Must be previously defined as a LOADSHAPE object. 

Sets Yearly curve if it is not already defined.   Set to NONE to reset to no loadshape for Yearly mode. The default is no variation.

Name: `Daily`

(Setter)
"""
function Daily(obj::Obj, value::Union{LoadShapeObj, Nothing}, flags::SetterFlagsT=SetterFlagsT(0))
    obj_set_obj(obj, _PropertyIndex.Daily, value, flags)
end

"""
LOADSHAPE object to use for the per-unit current for DAILY-mode simulations. Set the Mult property of the LOADSHAPE to the pu curve. Qmult is not used. If UseActual=Yes then the Mult curve should be actual A.

Must be previously defined as a LOADSHAPE object. 

Sets Yearly curve if it is not already defined.   Set to NONE to reset to no loadshape for Yearly mode. The default is no variation.

Name: `Daily`

(Setter)
"""
function Daily(obj::Obj, value::String, flags::SetterFlagsT=SetterFlagsT(0))
    obj_set_str(obj, _PropertyIndex.Daily, value, flags)
end

"""
LOADSHAPE object to use for the per-unit current for DUTYCYCLE-mode simulations. Set the Mult property of the LOADSHAPE to the pu curve. Qmult is not used. If UseActual=Yes then the Mult curve should be actual A.

Must be previously defined as a LOADSHAPE object. 

Defaults to Daily load shape when Daily is defined.   Set to NONE to reset to no loadshape for Yearly mode. The default is no variation.

Name: `Duty`

(Getter)
"""
function Duty_str(obj::Obj)::String
    obj_get_str(obj, _PropertyIndex.Duty)
end

"""
LOADSHAPE object to use for the per-unit current for DUTYCYCLE-mode simulations. Set the Mult property of the LOADSHAPE to the pu curve. Qmult is not used. If UseActual=Yes then the Mult curve should be actual A.

Must be previously defined as a LOADSHAPE object. 

Defaults to Daily load shape when Daily is defined.   Set to NONE to reset to no loadshape for Yearly mode. The default is no variation.

Name: `Duty`

(Setter)
"""
function Duty_str(obj::Obj, value::String, flags::SetterFlagsT=SetterFlagsT(0))
    obj_set_str(obj, _PropertyIndex.Duty, value, flags)
end

"""
LOADSHAPE object to use for the per-unit current for DUTYCYCLE-mode simulations. Set the Mult property of the LOADSHAPE to the pu curve. Qmult is not used. If UseActual=Yes then the Mult curve should be actual A.

Must be previously defined as a LOADSHAPE object. 

Defaults to Daily load shape when Daily is defined.   Set to NONE to reset to no loadshape for Yearly mode. The default is no variation.

Name: `Duty`

(Getter)
"""
function Duty(obj)::Union{LoadShapeObj, Nothing}
    obj_get_obj(obj,_PropertyIndex.Duty, LoadShapeObj)
end

"""
LOADSHAPE object to use for the per-unit current for DUTYCYCLE-mode simulations. Set the Mult property of the LOADSHAPE to the pu curve. Qmult is not used. If UseActual=Yes then the Mult curve should be actual A.

Must be previously defined as a LOADSHAPE object. 

Defaults to Daily load shape when Daily is defined.   Set to NONE to reset to no loadshape for Yearly mode. The default is no variation.

Name: `Duty`

(Setter)
"""
function Duty(obj::Obj, value::Union{LoadShapeObj, Nothing}, flags::SetterFlagsT=SetterFlagsT(0))
    obj_set_obj(obj, _PropertyIndex.Duty, value, flags)
end

"""
LOADSHAPE object to use for the per-unit current for DUTYCYCLE-mode simulations. Set the Mult property of the LOADSHAPE to the pu curve. Qmult is not used. If UseActual=Yes then the Mult curve should be actual A.

Must be previously defined as a LOADSHAPE object. 

Defaults to Daily load shape when Daily is defined.   Set to NONE to reset to no loadshape for Yearly mode. The default is no variation.

Name: `Duty`

(Setter)
"""
function Duty(obj::Obj, value::String, flags::SetterFlagsT=SetterFlagsT(0))
    obj_set_str(obj, _PropertyIndex.Duty, value, flags)
end

"""
Name of bus to which 2nd terminal is connected.
bus2=busname
bus2=busname.1.2.3

Default is Bus1.0.0.0 (grounded-wye connection)

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

Default is Bus1.0.0.0 (grounded-wye connection)

Name: `Bus2`

(Setter)
"""
function Bus2(obj::Obj, value::String, flags::SetterFlagsT=SetterFlagsT(0))
    obj_set_str(obj, _PropertyIndex.Bus2, value, flags)
end

"""
Harmonic spectrum assumed for this source.

Name: `Spectrum`
Default: default

(Getter)
"""
function Spectrum_str(obj::Obj)::String
    obj_get_str(obj, _PropertyIndex.Spectrum)
end

"""
Harmonic spectrum assumed for this source.

Name: `Spectrum`
Default: default

(Setter)
"""
function Spectrum_str(obj::Obj, value::String, flags::SetterFlagsT=SetterFlagsT(0))
    obj_set_str(obj, _PropertyIndex.Spectrum, value, flags)
end

"""
Harmonic spectrum assumed for this source.

Name: `Spectrum`
Default: default

(Getter)
"""
function Spectrum(obj)::Union{SpectrumObj, Nothing}
    obj_get_obj(obj,_PropertyIndex.Spectrum, SpectrumObj)
end

"""
Harmonic spectrum assumed for this source.

Name: `Spectrum`
Default: default

(Setter)
"""
function Spectrum(obj::Obj, value::Union{SpectrumObj, Nothing}, flags::SetterFlagsT=SetterFlagsT(0))
    obj_set_obj(obj, _PropertyIndex.Spectrum, value, flags)
end

"""
Harmonic spectrum assumed for this source.

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

end # module Isource
export Isource
