module VSConverter
using ..Enums.SetterFlags: SetterFlagsT
using ..Enums: VSConverterControlMode
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


const _cls_name = "VSConverter"
const _cls_idx = 47

module _PropertyIndex
const Phases = Int32(1)
const Bus1 = Int32(2)
const kVAC = Int32(3)
const kVDC = Int32(4)
const kW = Int32(5)
const NDC = Int32(6)
const RAC = Int32(7)
const XAC = Int32(8)
const M0 = Int32(9)
const d0 = Int32(10)
const MMin = Int32(11)
const MMax = Int32(12)
const IACMax = Int32(13)
const IDCMax = Int32(14)
const VACRef = Int32(15)
const PACRef = Int32(16)
const QACRef = Int32(17)
const VDCRef = Int32(18)
const VSCMode = Int32(19)
const Spectrum = Int32(20)
const BaseFreq = Int32(21)
const Enabled = Int32(22)
const Like = Int32(23)
end

struct VSConverterObj <: AbstractPCElement
    ptr::Ptr{Cvoid}
    dss::DSSContext
end
export VSConverterObj
Common._wrap_dss_obj(::Val{_cls_idx}, ptr::Ptr{Cvoid}, dss::DSSContext) = VSConverterObj(ptr, dss)
const Obj = VSConverterObj

function Base.show(io::IO, obj::VSConverterObj) 
    name = obj_get_str(obj, obj.dss.capi.Obj_GetFullName)
    print(name)
end


include("dss_object.jl")


"""
Number of AC plus DC conductors. AC phases numbered before DC conductors.

Name: `Phases`
Default: 4

(Getter)
"""
function Phases(obj::Obj)::Int32
    obj_get_int32(obj, _PropertyIndex.Phases)
end

"""
Number of AC plus DC conductors. AC phases numbered before DC conductors.

Name: `Phases`
Default: 4

(Setter)
"""
function Phases(obj::Obj, value::Int32, flags::SetterFlagsT=SetterFlagsT(0))
    obj_set_int32(obj, _PropertyIndex.Phases, value, flags)
end

"""
Name of converter bus, containing both AC and DC conductors. Bus2 is always ground.

Name: `Bus1`

(Getter)
"""
function Bus1(obj::Obj)::String
    obj_get_str(obj, _PropertyIndex.Bus1)
end

"""
Name of converter bus, containing both AC and DC conductors. Bus2 is always ground.

Name: `Bus1`

(Setter)
"""
function Bus1(obj::Obj, value::String, flags::SetterFlagsT=SetterFlagsT(0))
    obj_set_str(obj, _PropertyIndex.Bus1, value, flags)
end

"""
Nominal AC line-neutral voltage in kV. Must be specified > 0.

Name: `kVAC`
Default: 1.0

(Getter)
"""
function kVAC(obj::Obj)::Float64
    obj_get_float64(obj, _PropertyIndex.kVAC)
end

"""
Nominal AC line-neutral voltage in kV. Must be specified > 0.

Name: `kVAC`
Default: 1.0

(Setter)
"""
function kVAC(obj::Obj, value::Float64, flags::SetterFlagsT=SetterFlagsT(0))
    obj_set_float64(obj, _PropertyIndex.kVAC, value, flags)
end

"""
Nominal DC voltage in kV. Must be specified > 0.

Name: `kVDC`
Default: 1.0

(Getter)
"""
function kVDC(obj::Obj)::Float64
    obj_get_float64(obj, _PropertyIndex.kVDC)
end

"""
Nominal DC voltage in kV. Must be specified > 0.

Name: `kVDC`
Default: 1.0

(Setter)
"""
function kVDC(obj::Obj, value::Float64, flags::SetterFlagsT=SetterFlagsT(0))
    obj_set_float64(obj, _PropertyIndex.kVDC, value, flags)
end

"""
Nominal converter power in kW. Must be specified > 0.

Name: `kW`
Default: 1.0

(Getter)
"""
function kW(obj::Obj)::Float64
    obj_get_float64(obj, _PropertyIndex.kW)
end

"""
Nominal converter power in kW. Must be specified > 0.

Name: `kW`
Default: 1.0

(Setter)
"""
function kW(obj::Obj, value::Float64, flags::SetterFlagsT=SetterFlagsT(0))
    obj_set_float64(obj, _PropertyIndex.kW, value, flags)
end

"""
Number of DC conductors. DC conductors numbered after AC phases.

Name: `NDC`
Default: 1

(Getter)
"""
function NDC(obj::Obj)::Int32
    obj_get_int32(obj, _PropertyIndex.NDC)
end

"""
Number of DC conductors. DC conductors numbered after AC phases.

Name: `NDC`
Default: 1

(Setter)
"""
function NDC(obj::Obj, value::Int32, flags::SetterFlagsT=SetterFlagsT(0))
    obj_set_int32(obj, _PropertyIndex.NDC, value, flags)
end

"""
AC resistance for the converter transformer, plus any series reactors.
Must be 0 for Vac control mode.

Name: `RAC`
Units: Ω
Default: 1e-12

(Getter)
"""
function RAC(obj::Obj)::Float64
    obj_get_float64(obj, _PropertyIndex.RAC)
end

"""
AC resistance for the converter transformer, plus any series reactors.
Must be 0 for Vac control mode.

Name: `RAC`
Units: Ω
Default: 1e-12

(Setter)
"""
function RAC(obj::Obj, value::Float64, flags::SetterFlagsT=SetterFlagsT(0))
    obj_set_float64(obj, _PropertyIndex.RAC, value, flags)
end

"""
AC reactance for the converter transformer, plus any series reactors.
Must be 0 for Vac control mode. Must be >0 for PacVac, PacQac or VacVdc control mode.

Name: `XAC`
Units: Ω
Default: 0.0

(Getter)
"""
function XAC(obj::Obj)::Float64
    obj_get_float64(obj, _PropertyIndex.XAC)
end

"""
AC reactance for the converter transformer, plus any series reactors.
Must be 0 for Vac control mode. Must be >0 for PacVac, PacQac or VacVdc control mode.

Name: `XAC`
Units: Ω
Default: 0.0

(Setter)
"""
function XAC(obj::Obj, value::Float64, flags::SetterFlagsT=SetterFlagsT(0))
    obj_set_float64(obj, _PropertyIndex.XAC, value, flags)
end

"""
Fixed or initial value of the modulation index.

Name: `M0`
Default: 0.5

(Getter)
"""
function M0(obj::Obj)::Float64
    obj_get_float64(obj, _PropertyIndex.M0)
end

"""
Fixed or initial value of the modulation index.

Name: `M0`
Default: 0.5

(Setter)
"""
function M0(obj::Obj, value::Float64, flags::SetterFlagsT=SetterFlagsT(0))
    obj_set_float64(obj, _PropertyIndex.M0, value, flags)
end

"""
Fixed or initial value of the power angle in degrees.

Name: `d0`
Default: 0.0

(Getter)
"""
function d0(obj::Obj)::Float64
    obj_get_float64(obj, _PropertyIndex.d0)
end

"""
Fixed or initial value of the power angle in degrees.

Name: `d0`
Default: 0.0

(Setter)
"""
function d0(obj::Obj, value::Float64, flags::SetterFlagsT=SetterFlagsT(0))
    obj_set_float64(obj, _PropertyIndex.d0, value, flags)
end

"""
Minimum value of modulation index.

Name: `MMin`
Default: 0.1

(Getter)
"""
function MMin(obj::Obj)::Float64
    obj_get_float64(obj, _PropertyIndex.MMin)
end

"""
Minimum value of modulation index.

Name: `MMin`
Default: 0.1

(Setter)
"""
function MMin(obj::Obj, value::Float64, flags::SetterFlagsT=SetterFlagsT(0))
    obj_set_float64(obj, _PropertyIndex.MMin, value, flags)
end

"""
Maximum value of modulation index.

Name: `MMax`
Default: 0.9

(Getter)
"""
function MMax(obj::Obj)::Float64
    obj_get_float64(obj, _PropertyIndex.MMax)
end

"""
Maximum value of modulation index.

Name: `MMax`
Default: 0.9

(Setter)
"""
function MMax(obj::Obj, value::Float64, flags::SetterFlagsT=SetterFlagsT(0))
    obj_set_float64(obj, _PropertyIndex.MMax, value, flags)
end

"""
Maximum value of AC line current, per-unit of nominal.

Name: `IACMax`
Default: 2.0

(Getter)
"""
function IACMax(obj::Obj)::Float64
    obj_get_float64(obj, _PropertyIndex.IACMax)
end

"""
Maximum value of AC line current, per-unit of nominal.

Name: `IACMax`
Default: 2.0

(Setter)
"""
function IACMax(obj::Obj, value::Float64, flags::SetterFlagsT=SetterFlagsT(0))
    obj_set_float64(obj, _PropertyIndex.IACMax, value, flags)
end

"""
Maximum value of DC current, per-unit of nominal.

Name: `IDCMax`
Default: 2.0

(Getter)
"""
function IDCMax(obj::Obj)::Float64
    obj_get_float64(obj, _PropertyIndex.IDCMax)
end

"""
Maximum value of DC current, per-unit of nominal.

Name: `IDCMax`
Default: 2.0

(Setter)
"""
function IDCMax(obj::Obj, value::Float64, flags::SetterFlagsT=SetterFlagsT(0))
    obj_set_float64(obj, _PropertyIndex.IDCMax, value, flags)
end

"""
Reference AC line-to-neutral voltage, RMS Volts.
Applies to PacVac and VdcVac control modes, influencing m.

Name: `VACRef`
Default: 0.0

(Getter)
"""
function VACRef(obj::Obj)::Float64
    obj_get_float64(obj, _PropertyIndex.VACRef)
end

"""
Reference AC line-to-neutral voltage, RMS Volts.
Applies to PacVac and VdcVac control modes, influencing m.

Name: `VACRef`
Default: 0.0

(Setter)
"""
function VACRef(obj::Obj, value::Float64, flags::SetterFlagsT=SetterFlagsT(0))
    obj_set_float64(obj, _PropertyIndex.VACRef, value, flags)
end

"""
Reference total AC real power, Watts.
Applies to PacVac and PacQac control modes, influencing d.

Name: `PACRef`
Default: 0.0

(Getter)
"""
function PACRef(obj::Obj)::Float64
    obj_get_float64(obj, _PropertyIndex.PACRef)
end

"""
Reference total AC real power, Watts.
Applies to PacVac and PacQac control modes, influencing d.

Name: `PACRef`
Default: 0.0

(Setter)
"""
function PACRef(obj::Obj, value::Float64, flags::SetterFlagsT=SetterFlagsT(0))
    obj_set_float64(obj, _PropertyIndex.PACRef, value, flags)
end

"""
Reference total AC reactive power, Vars.
Applies to PacQac and VdcQac control modes, influencing m.

Name: `QACRef`
Default: 0.0

(Getter)
"""
function QACRef(obj::Obj)::Float64
    obj_get_float64(obj, _PropertyIndex.QACRef)
end

"""
Reference total AC reactive power, Vars.
Applies to PacQac and VdcQac control modes, influencing m.

Name: `QACRef`
Default: 0.0

(Setter)
"""
function QACRef(obj::Obj, value::Float64, flags::SetterFlagsT=SetterFlagsT(0))
    obj_set_float64(obj, _PropertyIndex.QACRef, value, flags)
end

"""
Reference DC voltage, Volts.
Applies to VdcVac control mode, influencing d.

Name: `VDCRef`
Default: 0.0

(Getter)
"""
function VDCRef(obj::Obj)::Float64
    obj_get_float64(obj, _PropertyIndex.VDCRef)
end

"""
Reference DC voltage, Volts.
Applies to VdcVac control mode, influencing d.

Name: `VDCRef`
Default: 0.0

(Setter)
"""
function VDCRef(obj::Obj, value::Float64, flags::SetterFlagsT=SetterFlagsT(0))
    obj_set_float64(obj, _PropertyIndex.VDCRef, value, flags)
end

"""
Control Mode

Name: `VSCMode`
Default: Fixed

(Getter)
"""
function VSCMode(obj::Obj)::VSConverterControlMode.T
    VSConverterControlMode.T(obj_get_int32(obj, _PropertyIndex.VSCMode))
end

"""
Control Mode

Name: `VSCMode`
Default: Fixed

(Setter)
"""
function VSCMode(obj::Obj, value::String, flags::SetterFlagsT=SetterFlagsT(0))
    obj_set_str(obj, _PropertyIndex.VSCMode, value, flags)
end

"""
Control Mode

Name: `VSCMode`
Default: Fixed

(Setter)
"""
function VSCMode(obj::Obj, value::Union{Int,VSConverterControlMode.T}, flags::SetterFlagsT=SetterFlagsT(0))
    obj_set_int32(obj, _PropertyIndex.VSCMode, Int32(value), flags)
end

"""
Control Mode

Name: `VSCMode`
Default: Fixed

(Getter)
"""
function VSCMode_str(obj::Obj)::String
    obj_get_str(obj, _PropertyIndex.VSCMode)
end

"""
Control Mode

Name: `VSCMode`
Default: Fixed

(Setter)
"""
function VSCMode_str(obj::Obj, value::String, flags::SetterFlagsT=SetterFlagsT(0))
    VSCMode(obj, value, flags)
end

"""
Name of harmonic spectrum for this device.

Name: `Spectrum`
Default: default

(Getter)
"""
function Spectrum_str(obj::Obj)::String
    obj_get_str(obj, _PropertyIndex.Spectrum)
end

"""
Name of harmonic spectrum for this device.

Name: `Spectrum`
Default: default

(Setter)
"""
function Spectrum_str(obj::Obj, value::String, flags::SetterFlagsT=SetterFlagsT(0))
    obj_set_str(obj, _PropertyIndex.Spectrum, value, flags)
end

"""
Name of harmonic spectrum for this device.

Name: `Spectrum`
Default: default

(Getter)
"""
function Spectrum(obj)::Union{SpectrumObj, Nothing}
    obj_get_obj(obj,_PropertyIndex.Spectrum, SpectrumObj)
end

"""
Name of harmonic spectrum for this device.

Name: `Spectrum`
Default: default

(Setter)
"""
function Spectrum(obj::Obj, value::Union{SpectrumObj, Nothing}, flags::SetterFlagsT=SetterFlagsT(0))
    obj_set_obj(obj, _PropertyIndex.Spectrum, value, flags)
end

"""
Name of harmonic spectrum for this device.

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

end # module VSConverter
export VSConverter
