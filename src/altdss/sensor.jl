module Sensor
using ..Enums.SetterFlags: SetterFlagsT
using ..Enums: Connection
import Base: convert
using ..Common
using ..CircuitElement
using DocStringExtensions
@template (FUNCTIONS, METHODS) = """
                                 $(TYPEDSIGNATURES)
                                 $(DOCSTRING)
                                 """


const _cls_name = "Sensor"
const _cls_idx = 50

module _PropertyIndex
const Element = Int32(1)
const Terminal = Int32(2)
const kVBase = Int32(3)
const Clear = Int32(4)
const kVs = Int32(5)
const Currents = Int32(6)
const kWs = Int32(7)
const kvars = Int32(8)
const Conn = Int32(9)
const DeltaDirection = Int32(10)
const pctError = Int32(11)
const Weight = Int32(12)
const BaseFreq = Int32(13)
const Enabled = Int32(14)
const Like = Int32(15)
end

struct SensorObj <: AbstractMeterElement
    ptr::Ptr{Cvoid}
    dss::DSSContext
end
export SensorObj
Common._wrap_dss_obj(::Val{_cls_idx}, ptr::Ptr{Cvoid}, dss::DSSContext) = SensorObj(ptr, dss)
const Obj = SensorObj

function Base.show(io::IO, obj::SensorObj) 
    name = obj_get_str(obj, obj.dss.capi.Obj_GetFullName)
    print(name)
end


include("dss_object.jl")


"""
Name (Full Object name) of element to which the Sensor is connected.

Name: `Element`

(Getter)
"""
function Element_str(obj::Obj)::String
    obj_get_str(obj, _PropertyIndex.Element)
end

"""
Name (Full Object name) of element to which the Sensor is connected.

Name: `Element`

(Setter)
"""
function Element_str(obj::Obj, value::String, flags::SetterFlagsT=SetterFlagsT(0))
    obj_set_str(obj, _PropertyIndex.Element, value, flags)
end

"""
Name (Full Object name) of element to which the Sensor is connected.

Name: `Element`

(Getter)
"""
function Element(obj)::DSSObj
    obj_get_obj(obj,_PropertyIndex.Element)
end

"""
Name (Full Object name) of element to which the Sensor is connected.

Name: `Element`

(Setter)
"""
function Element(obj::Obj, value::DSSObj, flags::SetterFlagsT=SetterFlagsT(0))
    obj_set_obj(obj, _PropertyIndex.Element, value, flags)
end

"""
Name (Full Object name) of element to which the Sensor is connected.

Name: `Element`

(Setter)
"""
function Element(obj::Obj, value::String, flags::SetterFlagsT=SetterFlagsT(0))
    obj_set_str(obj, _PropertyIndex.Element, value, flags)
end

"""
Number of the terminal of the circuit element to which the Sensor is connected. 1 or 2, typically.

Name: `Terminal`
Default: 1

(Getter)
"""
function Terminal(obj::Obj)::Int32
    obj_get_int32(obj, _PropertyIndex.Terminal)
end

"""
Number of the terminal of the circuit element to which the Sensor is connected. 1 or 2, typically.

Name: `Terminal`
Default: 1

(Setter)
"""
function Terminal(obj::Obj, value::Int32, flags::SetterFlagsT=SetterFlagsT(0))
    obj_set_int32(obj, _PropertyIndex.Terminal, value, flags)
end

"""
Voltage base for the sensor, in kV. If connected to a 2- or 3-phase terminal, 
specify L-L voltage. For 1-phase devices specify L-N or actual 1-phase voltage.

Name: `kVBase`
Units: kV
Default: 12.47

(Getter)
"""
function kVBase(obj::Obj)::Float64
    obj_get_float64(obj, _PropertyIndex.kVBase)
end

"""
Voltage base for the sensor, in kV. If connected to a 2- or 3-phase terminal, 
specify L-L voltage. For 1-phase devices specify L-N or actual 1-phase voltage.

Name: `kVBase`
Units: kV
Default: 12.47

(Setter)
"""
function kVBase(obj::Obj, value::Float64, flags::SetterFlagsT=SetterFlagsT(0))
    obj_set_float64(obj, _PropertyIndex.kVBase, value, flags)
end

"""
Clear=Yes clears sensor values. Should be issued before putting in a new set of measurements.

Name: `Clear`
Default: False
"""
function Clear(obj::Obj, value::Bool=true, flags::SetterFlagsT=SetterFlagsT(0))
    obj_set_bool(obj, _PropertyIndex.Clear, value, flags)
end

"""
Array of Voltages (kV) measured by the voltage sensor. For Delta-connected sensors, Line-Line voltages are expected. For Wye, Line-Neutral are expected.

Name: `kVs`

(Getter)
"""
function kVs(obj::Obj)::Vector{Float64}
    obj_get_float64s(obj, _PropertyIndex.kVs)
end

"""
Array of Voltages (kV) measured by the voltage sensor. For Delta-connected sensors, Line-Line voltages are expected. For Wye, Line-Neutral are expected.

Name: `kVs`

(Setter)
"""
function kVs(obj::Obj, value::Vector{Float64}, flags::SetterFlagsT=SetterFlagsT(0))
    obj_get_float64s(obj, _PropertyIndex.kVs, value, flags)
end

"""
Array of Currents (amps) measured by the current sensor. Specify this or power quantities; not both.

Name: `Currents`

(Getter)
"""
function Currents(obj::Obj)::Vector{Float64}
    obj_get_float64s(obj, _PropertyIndex.Currents)
end

"""
Array of Currents (amps) measured by the current sensor. Specify this or power quantities; not both.

Name: `Currents`

(Setter)
"""
function Currents(obj::Obj, value::Vector{Float64}, flags::SetterFlagsT=SetterFlagsT(0))
    obj_get_float64s(obj, _PropertyIndex.Currents, value, flags)
end

"""
Array of Active power (kW) measurements at the sensor. Is converted into Currents along with q=[...]
Will override any currents=[...] specification.

Name: `kWs`

(Getter)
"""
function kWs(obj::Obj)::Vector{Float64}
    obj_get_float64s(obj, _PropertyIndex.kWs)
end

"""
Array of Active power (kW) measurements at the sensor. Is converted into Currents along with q=[...]
Will override any currents=[...] specification.

Name: `kWs`

(Setter)
"""
function kWs(obj::Obj, value::Vector{Float64}, flags::SetterFlagsT=SetterFlagsT(0))
    obj_get_float64s(obj, _PropertyIndex.kWs, value, flags)
end

"""
Array of Reactive power (kvar) measurements at the sensor. Is converted into Currents along with p=[...]

Name: `kvars`

(Getter)
"""
function kvars(obj::Obj)::Vector{Float64}
    obj_get_float64s(obj, _PropertyIndex.kvars)
end

"""
Array of Reactive power (kvar) measurements at the sensor. Is converted into Currents along with p=[...]

Name: `kvars`

(Setter)
"""
function kvars(obj::Obj, value::Vector{Float64}, flags::SetterFlagsT=SetterFlagsT(0))
    obj_get_float64s(obj, _PropertyIndex.kvars, value, flags)
end

"""
Voltage sensor connection. Applies to voltage measurement only. 
Currents are always assumed to be line currents.
If wye or LN, voltage is assumed measured line-neutral; otherwise, line-line.

Name: `Conn`
Default: Wye

(Getter)
"""
function Conn(obj::Obj)::Connection.T
    Connection.T(obj_get_int32(obj, _PropertyIndex.Conn))
end

"""
Voltage sensor connection. Applies to voltage measurement only. 
Currents are always assumed to be line currents.
If wye or LN, voltage is assumed measured line-neutral; otherwise, line-line.

Name: `Conn`
Default: Wye

(Setter)
"""
function Conn(obj::Obj, value::String, flags::SetterFlagsT=SetterFlagsT(0))
    obj_set_str(obj, _PropertyIndex.Conn, value, flags)
end

"""
Voltage sensor connection. Applies to voltage measurement only. 
Currents are always assumed to be line currents.
If wye or LN, voltage is assumed measured line-neutral; otherwise, line-line.

Name: `Conn`
Default: Wye

(Setter)
"""
function Conn(obj::Obj, value::Union{Int,Connection.T}, flags::SetterFlagsT=SetterFlagsT(0))
    obj_set_int32(obj, _PropertyIndex.Conn, Int32(value), flags)
end

"""
Voltage sensor connection. Applies to voltage measurement only. 
Currents are always assumed to be line currents.
If wye or LN, voltage is assumed measured line-neutral; otherwise, line-line.

Name: `Conn`
Default: Wye

(Getter)
"""
function Conn_str(obj::Obj)::String
    obj_get_str(obj, _PropertyIndex.Conn)
end

"""
Voltage sensor connection. Applies to voltage measurement only. 
Currents are always assumed to be line currents.
If wye or LN, voltage is assumed measured line-neutral; otherwise, line-line.

Name: `Conn`
Default: Wye

(Setter)
"""
function Conn_str(obj::Obj, value::String, flags::SetterFlagsT=SetterFlagsT(0))
    Conn(obj, value, flags)
end

"""
Default is 1: 1-2, 2-3, 3-1. For reverse rotation, enter -1.

Name: `DeltaDirection`
Default: 1

(Getter)
"""
function DeltaDirection(obj::Obj)::Int32
    obj_get_int32(obj, _PropertyIndex.DeltaDirection)
end

"""
Default is 1: 1-2, 2-3, 3-1. For reverse rotation, enter -1.

Name: `DeltaDirection`
Default: 1

(Setter)
"""
function DeltaDirection(obj::Obj, value::Int32, flags::SetterFlagsT=SetterFlagsT(0))
    obj_set_int32(obj, _PropertyIndex.DeltaDirection, value, flags)
end

"""
Assumed percent error in the measurement.

Name: `%Error`
Default: 1.0

(Getter)
"""
function pctError(obj::Obj)::Float64
    obj_get_float64(obj, _PropertyIndex.pctError)
end

"""
Assumed percent error in the measurement.

Name: `%Error`
Default: 1.0

(Setter)
"""
function pctError(obj::Obj, value::Float64, flags::SetterFlagsT=SetterFlagsT(0))
    obj_set_float64(obj, _PropertyIndex.pctError, value, flags)
end

"""
Weighting factor.

Name: `Weight`
Default: 1.0

(Getter)
"""
function Weight(obj::Obj)::Float64
    obj_get_float64(obj, _PropertyIndex.Weight)
end

"""
Weighting factor.

Name: `Weight`
Default: 1.0

(Setter)
"""
function Weight(obj::Obj, value::Float64, flags::SetterFlagsT=SetterFlagsT(0))
    obj_set_float64(obj, _PropertyIndex.Weight, value, flags)
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

end # module Sensor
export Sensor
