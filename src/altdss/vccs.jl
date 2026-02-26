module VCCS
using ..Enums.SetterFlags: SetterFlagsT
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


const _cls_name = "VCCS"
const _cls_idx = 18

module _PropertyIndex
const Bus1 = Int32(1)
const Phases = Int32(2)
const PRated = Int32(3)
const VRated = Int32(4)
const Ppct = Int32(5)
const BP1 = Int32(6)
const BP2 = Int32(7)
const Filter = Int32(8)
const FSample = Int32(9)
const RMSMode = Int32(10)
const IMaxpu = Int32(11)
const VRMSTau = Int32(12)
const IRMSTau = Int32(13)
const Spectrum = Int32(14)
const BaseFreq = Int32(15)
const Enabled = Int32(16)
const Like = Int32(17)
end

struct VCCSObj <: AbstractPCElement
    ptr::Ptr{Cvoid}
    dss::DSSContext
end
export VCCSObj
Common._wrap_dss_obj(::Val{_cls_idx}, ptr::Ptr{Cvoid}, dss::DSSContext) = VCCSObj(ptr, dss)
const Obj = VCCSObj

function Base.show(io::IO, obj::VCCSObj) 
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
Number of phases.

Name: `Phases`
Default: 1

(Getter)
"""
function Phases(obj::Obj)::Int32
    obj_get_int32(obj, _PropertyIndex.Phases)
end

"""
Number of phases.

Name: `Phases`
Default: 1

(Setter)
"""
function Phases(obj::Obj, value::Int32, flags::SetterFlagsT=SetterFlagsT(0))
    obj_set_int32(obj, _PropertyIndex.Phases, value, flags)
end

"""
Total rated power.

Name: `PRated`
Units: kW
Default: 250.0

(Getter)
"""
function PRated(obj::Obj)::Float64
    obj_get_float64(obj, _PropertyIndex.PRated)
end

"""
Total rated power.

Name: `PRated`
Units: kW
Default: 250.0

(Setter)
"""
function PRated(obj::Obj, value::Float64, flags::SetterFlagsT=SetterFlagsT(0))
    obj_set_float64(obj, _PropertyIndex.PRated, value, flags)
end

"""
Rated line-to-line voltage.

Name: `VRated`
Units: V
Default: 208.0

(Getter)
"""
function VRated(obj::Obj)::Float64
    obj_get_float64(obj, _PropertyIndex.VRated)
end

"""
Rated line-to-line voltage.

Name: `VRated`
Units: V
Default: 208.0

(Setter)
"""
function VRated(obj::Obj, value::Float64, flags::SetterFlagsT=SetterFlagsT(0))
    obj_set_float64(obj, _PropertyIndex.VRated, value, flags)
end

"""
Steady-state operating output, in percent of rated.

Name: `Ppct`
Default: 100.0

(Getter)
"""
function Ppct(obj::Obj)::Float64
    obj_get_float64(obj, _PropertyIndex.Ppct)
end

"""
Steady-state operating output, in percent of rated.

Name: `Ppct`
Default: 100.0

(Setter)
"""
function Ppct(obj::Obj, value::Float64, flags::SetterFlagsT=SetterFlagsT(0))
    obj_set_float64(obj, _PropertyIndex.Ppct, value, flags)
end

"""
XYCurve defining the input piece-wise linear block.

Name: `BP1`

(Getter)
"""
function BP1_str(obj::Obj)::String
    obj_get_str(obj, _PropertyIndex.BP1)
end

"""
XYCurve defining the input piece-wise linear block.

Name: `BP1`

(Setter)
"""
function BP1_str(obj::Obj, value::String, flags::SetterFlagsT=SetterFlagsT(0))
    obj_set_str(obj, _PropertyIndex.BP1, value, flags)
end

"""
XYCurve defining the input piece-wise linear block.

Name: `BP1`

(Getter)
"""
function BP1(obj)::Union{XYcurveObj, Nothing}
    obj_get_obj(obj,_PropertyIndex.BP1, XYcurveObj)
end

"""
XYCurve defining the input piece-wise linear block.

Name: `BP1`

(Setter)
"""
function BP1(obj::Obj, value::Union{XYcurveObj, Nothing}, flags::SetterFlagsT=SetterFlagsT(0))
    obj_set_obj(obj, _PropertyIndex.BP1, value, flags)
end

"""
XYCurve defining the input piece-wise linear block.

Name: `BP1`

(Setter)
"""
function BP1(obj::Obj, value::String, flags::SetterFlagsT=SetterFlagsT(0))
    obj_set_str(obj, _PropertyIndex.BP1, value, flags)
end

"""
XYCurve defining the output piece-wise linear block.

Name: `BP2`

(Getter)
"""
function BP2_str(obj::Obj)::String
    obj_get_str(obj, _PropertyIndex.BP2)
end

"""
XYCurve defining the output piece-wise linear block.

Name: `BP2`

(Setter)
"""
function BP2_str(obj::Obj, value::String, flags::SetterFlagsT=SetterFlagsT(0))
    obj_set_str(obj, _PropertyIndex.BP2, value, flags)
end

"""
XYCurve defining the output piece-wise linear block.

Name: `BP2`

(Getter)
"""
function BP2(obj)::Union{XYcurveObj, Nothing}
    obj_get_obj(obj,_PropertyIndex.BP2, XYcurveObj)
end

"""
XYCurve defining the output piece-wise linear block.

Name: `BP2`

(Setter)
"""
function BP2(obj::Obj, value::Union{XYcurveObj, Nothing}, flags::SetterFlagsT=SetterFlagsT(0))
    obj_set_obj(obj, _PropertyIndex.BP2, value, flags)
end

"""
XYCurve defining the output piece-wise linear block.

Name: `BP2`

(Setter)
"""
function BP2(obj::Obj, value::String, flags::SetterFlagsT=SetterFlagsT(0))
    obj_set_str(obj, _PropertyIndex.BP2, value, flags)
end

"""
XYCurve defining the digital filter coefficients (x numerator, y denominator).

Name: `Filter`

(Getter)
"""
function Filter_str(obj::Obj)::String
    obj_get_str(obj, _PropertyIndex.Filter)
end

"""
XYCurve defining the digital filter coefficients (x numerator, y denominator).

Name: `Filter`

(Setter)
"""
function Filter_str(obj::Obj, value::String, flags::SetterFlagsT=SetterFlagsT(0))
    obj_set_str(obj, _PropertyIndex.Filter, value, flags)
end

"""
XYCurve defining the digital filter coefficients (x numerator, y denominator).

Name: `Filter`

(Getter)
"""
function Filter(obj)::Union{XYcurveObj, Nothing}
    obj_get_obj(obj,_PropertyIndex.Filter, XYcurveObj)
end

"""
XYCurve defining the digital filter coefficients (x numerator, y denominator).

Name: `Filter`

(Setter)
"""
function Filter(obj::Obj, value::Union{XYcurveObj, Nothing}, flags::SetterFlagsT=SetterFlagsT(0))
    obj_set_obj(obj, _PropertyIndex.Filter, value, flags)
end

"""
XYCurve defining the digital filter coefficients (x numerator, y denominator).

Name: `Filter`

(Setter)
"""
function Filter(obj::Obj, value::String, flags::SetterFlagsT=SetterFlagsT(0))
    obj_set_str(obj, _PropertyIndex.Filter, value, flags)
end

"""
Sample frequency for the digital filter.

Name: `FSample`
Units: Hz
Default: 5000.0

(Getter)
"""
function FSample(obj::Obj)::Float64
    obj_get_float64(obj, _PropertyIndex.FSample)
end

"""
Sample frequency for the digital filter.

Name: `FSample`
Units: Hz
Default: 5000.0

(Setter)
"""
function FSample(obj::Obj, value::Float64, flags::SetterFlagsT=SetterFlagsT(0))
    obj_set_float64(obj, _PropertyIndex.FSample, value, flags)
end

"""
True if only Hz is used to represent a phase-locked loop (PLL), ignoring the BP1, BP2 and time-domain transformations.

Name: `RMSMode`
Default: False

(Getter)
"""
function RMSMode(obj::Obj)::Bool
    return obj_get_bool(obj, _PropertyIndex.RMSMode)
end

"""
True if only Hz is used to represent a phase-locked loop (PLL), ignoring the BP1, BP2 and time-domain transformations.

Name: `RMSMode`
Default: False

(Setter)
"""
function RMSMode(obj::Obj, value::Bool, flags::SetterFlagsT=SetterFlagsT(0))
    obj_set_bool(obj, _PropertyIndex.RMSMode, value, flags)
end

"""
Maximum output current in per-unit of rated.

Name: `IMaxpu`
Default: 1.1

(Getter)
"""
function IMaxpu(obj::Obj)::Float64
    obj_get_float64(obj, _PropertyIndex.IMaxpu)
end

"""
Maximum output current in per-unit of rated.

Name: `IMaxpu`
Default: 1.1

(Setter)
"""
function IMaxpu(obj::Obj, value::Float64, flags::SetterFlagsT=SetterFlagsT(0))
    obj_set_float64(obj, _PropertyIndex.IMaxpu, value, flags)
end

"""
Time constant in sensing Vrms for the PLL.

Name: `VRMSTau`
Default: 0.0015

(Getter)
"""
function VRMSTau(obj::Obj)::Float64
    obj_get_float64(obj, _PropertyIndex.VRMSTau)
end

"""
Time constant in sensing Vrms for the PLL.

Name: `VRMSTau`
Default: 0.0015

(Setter)
"""
function VRMSTau(obj::Obj, value::Float64, flags::SetterFlagsT=SetterFlagsT(0))
    obj_set_float64(obj, _PropertyIndex.VRMSTau, value, flags)
end

"""
Time constant in producing Irms from the PLL.

Name: `IRMSTau`
Default: 0.0015

(Getter)
"""
function IRMSTau(obj::Obj)::Float64
    obj_get_float64(obj, _PropertyIndex.IRMSTau)
end

"""
Time constant in producing Irms from the PLL.

Name: `IRMSTau`
Default: 0.0015

(Setter)
"""
function IRMSTau(obj::Obj, value::Float64, flags::SetterFlagsT=SetterFlagsT(0))
    obj_set_float64(obj, _PropertyIndex.IRMSTau, value, flags)
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

end # module VCCS
export VCCS
