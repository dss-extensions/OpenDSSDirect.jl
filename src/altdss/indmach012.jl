module IndMach012
using ..Enums.SetterFlags: SetterFlagsT
using ..Enums: Connection, IndMach012SlipOption
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


const _cls_name = "IndMach012"
const _cls_idx = 40

module _PropertyIndex
const Phases = Int32(1)
const Bus1 = Int32(2)
const kV = Int32(3)
const kW = Int32(4)
const PF = Int32(5)
const Conn = Int32(6)
const kVA = Int32(7)
const H = Int32(8)
const D = Int32(9)
const puRs = Int32(10)
const puXs = Int32(11)
const puRr = Int32(12)
const puXr = Int32(13)
const puXm = Int32(14)
const Slip = Int32(15)
const MaxSlip = Int32(16)
const SlipOption = Int32(17)
const Yearly = Int32(18)
const Daily = Int32(19)
const Duty = Int32(20)
const DebugTrace = Int32(21)
const Spectrum = Int32(22)
const BaseFreq = Int32(23)
const Enabled = Int32(24)
const Like = Int32(25)
end

struct IndMach012Obj <: AbstractPCElement
    ptr::Ptr{Cvoid}
    dss::DSSContext
end
export IndMach012Obj
Common._wrap_dss_obj(::Val{_cls_idx}, ptr::Ptr{Cvoid}, dss::DSSContext) = IndMach012Obj(ptr, dss)
const Obj = IndMach012Obj

function Base.show(io::IO, obj::IndMach012Obj) 
    name = obj_get_str(obj, obj.dss.capi.Obj_GetFullName)
    print(name)
end


include("dss_object.jl")


"""
Number of Phases, this Induction Machine.  

Name: `Phases`
Default: 3

(Getter)
"""
function Phases(obj::Obj)::Int32
    obj_get_int32(obj, _PropertyIndex.Phases)
end

"""
Number of Phases, this Induction Machine.  

Name: `Phases`
Default: 3

(Setter)
"""
function Phases(obj::Obj, value::Int32, flags::SetterFlagsT=SetterFlagsT(0))
    obj_set_int32(obj, _PropertyIndex.Phases, value, flags)
end

"""
Bus to which the Induction Machine is connected.  May include specific node specification.

Name: `Bus1`

(Getter)
"""
function Bus1(obj::Obj)::String
    obj_get_str(obj, _PropertyIndex.Bus1)
end

"""
Bus to which the Induction Machine is connected.  May include specific node specification.

Name: `Bus1`

(Setter)
"""
function Bus1(obj::Obj, value::String, flags::SetterFlagsT=SetterFlagsT(0))
    obj_set_str(obj, _PropertyIndex.Bus1, value, flags)
end

"""
Nominal rated (1.0 per unit) voltage, kV. For 2- and 3-phase machines, specify phase-phase kV. Otherwise, specify actual kV across each branch of the machine. If wye (star), specify phase-neutral kV. If delta or phase-phase connected, specify phase-phase kV.

Name: `kV`
Units: kV
Default: 12.47

(Getter)
"""
function kV(obj::Obj)::Float64
    obj_get_float64(obj, _PropertyIndex.kV)
end

"""
Nominal rated (1.0 per unit) voltage, kV. For 2- and 3-phase machines, specify phase-phase kV. Otherwise, specify actual kV across each branch of the machine. If wye (star), specify phase-neutral kV. If delta or phase-phase connected, specify phase-phase kV.

Name: `kV`
Units: kV
Default: 12.47

(Setter)
"""
function kV(obj::Obj, value::Float64, flags::SetterFlagsT=SetterFlagsT(0))
    obj_set_float64(obj, _PropertyIndex.kV, value, flags)
end

"""
Shaft Power, kW, for the Induction Machine.  A positive value denotes power for a load. 
Negative value denotes an induction generator. 

Name: `kW`
Default: 1000.0

(Getter)
"""
function kW(obj::Obj)::Float64
    obj_get_float64(obj, _PropertyIndex.kW)
end

"""
Shaft Power, kW, for the Induction Machine.  A positive value denotes power for a load. 
Negative value denotes an induction generator. 

Name: `kW`
Default: 1000.0

(Setter)
"""
function kW(obj::Obj, value::Float64, flags::SetterFlagsT=SetterFlagsT(0))
    obj_set_float64(obj, _PropertyIndex.kW, value, flags)
end

"""
[Read Only] Present power factor for the machine. 

**Read-only**

Name: `PF`

(Getter)
"""
function PF(obj::Obj)::Float64
    obj_get_float64(obj, _PropertyIndex.PF)
end

"""
[Read Only] Present power factor for the machine. 

**Read-only**

Name: `PF`

(Setter)
"""
function PF(obj::Obj, value::Float64, flags::SetterFlagsT=SetterFlagsT(0))
    obj_set_float64(obj, _PropertyIndex.PF, value, flags)
end

"""
Connection of stator: Delta or Wye. Default is Delta.

Name: `Conn`
Default: Delta

(Getter)
"""
function Conn(obj::Obj)::Connection.T
    Connection.T(obj_get_int32(obj, _PropertyIndex.Conn))
end

"""
Connection of stator: Delta or Wye. Default is Delta.

Name: `Conn`
Default: Delta

(Setter)
"""
function Conn(obj::Obj, value::String, flags::SetterFlagsT=SetterFlagsT(0))
    obj_set_str(obj, _PropertyIndex.Conn, value, flags)
end

"""
Connection of stator: Delta or Wye. Default is Delta.

Name: `Conn`
Default: Delta

(Setter)
"""
function Conn(obj::Obj, value::Union{Int,Connection.T}, flags::SetterFlagsT=SetterFlagsT(0))
    obj_set_int32(obj, _PropertyIndex.Conn, Int32(value), flags)
end

"""
Connection of stator: Delta or Wye. Default is Delta.

Name: `Conn`
Default: Delta

(Getter)
"""
function Conn_str(obj::Obj)::String
    obj_get_str(obj, _PropertyIndex.Conn)
end

"""
Connection of stator: Delta or Wye. Default is Delta.

Name: `Conn`
Default: Delta

(Setter)
"""
function Conn_str(obj::Obj, value::String, flags::SetterFlagsT=SetterFlagsT(0))
    Conn(obj, value, flags)
end

"""
Rated kVA for the machine.

Name: `kVA`
Default: 1200.0

(Getter)
"""
function kVA(obj::Obj)::Float64
    obj_get_float64(obj, _PropertyIndex.kVA)
end

"""
Rated kVA for the machine.

Name: `kVA`
Default: 1200.0

(Setter)
"""
function kVA(obj::Obj, value::Float64, flags::SetterFlagsT=SetterFlagsT(0))
    obj_set_float64(obj, _PropertyIndex.kVA, value, flags)
end

"""
Per unit mass constant of the machine.  MW-sec/MVA.

Name: `H`
Default: 1.0

(Getter)
"""
function H(obj::Obj)::Float64
    obj_get_float64(obj, _PropertyIndex.H)
end

"""
Per unit mass constant of the machine.  MW-sec/MVA.

Name: `H`
Default: 1.0

(Setter)
"""
function H(obj::Obj, value::Float64, flags::SetterFlagsT=SetterFlagsT(0))
    obj_set_float64(obj, _PropertyIndex.H, value, flags)
end

"""
Damping constant. Usual range is 0 to 4. Adjust to get damping in Dynamics mode,

Name: `D`
Default: 1.0

(Getter)
"""
function D(obj::Obj)::Float64
    obj_get_float64(obj, _PropertyIndex.D)
end

"""
Damping constant. Usual range is 0 to 4. Adjust to get damping in Dynamics mode,

Name: `D`
Default: 1.0

(Setter)
"""
function D(obj::Obj, value::Float64, flags::SetterFlagsT=SetterFlagsT(0))
    obj_set_float64(obj, _PropertyIndex.D, value, flags)
end

"""
Per unit stator resistance.

Name: `puRs`
Default: 0.0053

(Getter)
"""
function puRs(obj::Obj)::Float64
    obj_get_float64(obj, _PropertyIndex.puRs)
end

"""
Per unit stator resistance.

Name: `puRs`
Default: 0.0053

(Setter)
"""
function puRs(obj::Obj, value::Float64, flags::SetterFlagsT=SetterFlagsT(0))
    obj_set_float64(obj, _PropertyIndex.puRs, value, flags)
end

"""
Per unit stator leakage reactance.

Name: `puXs`
Default: 0.106

(Getter)
"""
function puXs(obj::Obj)::Float64
    obj_get_float64(obj, _PropertyIndex.puXs)
end

"""
Per unit stator leakage reactance.

Name: `puXs`
Default: 0.106

(Setter)
"""
function puXs(obj::Obj, value::Float64, flags::SetterFlagsT=SetterFlagsT(0))
    obj_set_float64(obj, _PropertyIndex.puXs, value, flags)
end

"""
Per unit rotor  resistance.

Name: `puRr`
Default: 0.007

(Getter)
"""
function puRr(obj::Obj)::Float64
    obj_get_float64(obj, _PropertyIndex.puRr)
end

"""
Per unit rotor  resistance.

Name: `puRr`
Default: 0.007

(Setter)
"""
function puRr(obj::Obj, value::Float64, flags::SetterFlagsT=SetterFlagsT(0))
    obj_set_float64(obj, _PropertyIndex.puRr, value, flags)
end

"""
Per unit rotor leakage reactance.

Name: `puXr`
Default: 0.12

(Getter)
"""
function puXr(obj::Obj)::Float64
    obj_get_float64(obj, _PropertyIndex.puXr)
end

"""
Per unit rotor leakage reactance.

Name: `puXr`
Default: 0.12

(Setter)
"""
function puXr(obj::Obj, value::Float64, flags::SetterFlagsT=SetterFlagsT(0))
    obj_set_float64(obj, _PropertyIndex.puXr, value, flags)
end

"""
Per unit magnetizing reactance.

Name: `puXm`
Default: 4.0

(Getter)
"""
function puXm(obj::Obj)::Float64
    obj_get_float64(obj, _PropertyIndex.puXm)
end

"""
Per unit magnetizing reactance.

Name: `puXm`
Default: 4.0

(Setter)
"""
function puXm(obj::Obj, value::Float64, flags::SetterFlagsT=SetterFlagsT(0))
    obj_set_float64(obj, _PropertyIndex.puXm, value, flags)
end

"""
Initial slip value.

Name: `Slip`
Default: 0.007

(Getter)
"""
function Slip(obj::Obj)::Float64
    obj_get_float64(obj, _PropertyIndex.Slip)
end

"""
Initial slip value.

Name: `Slip`
Default: 0.007

(Setter)
"""
function Slip(obj::Obj, value::Float64, flags::SetterFlagsT=SetterFlagsT(0))
    obj_set_float64(obj, _PropertyIndex.Slip, value, flags)
end

"""
Max slip value to allow. Set this before setting slip.

Name: `MaxSlip`
Default: 0.1

(Getter)
"""
function MaxSlip(obj::Obj)::Float64
    obj_get_float64(obj, _PropertyIndex.MaxSlip)
end

"""
Max slip value to allow. Set this before setting slip.

Name: `MaxSlip`
Default: 0.1

(Setter)
"""
function MaxSlip(obj::Obj, value::Float64, flags::SetterFlagsT=SetterFlagsT(0))
    obj_set_float64(obj, _PropertyIndex.MaxSlip, value, flags)
end

"""
Option for slip model.

Name: `SlipOption`
Default: VariableSlip

(Getter)
"""
function SlipOption(obj::Obj)::IndMach012SlipOption.T
    IndMach012SlipOption.T(obj_get_int32(obj, _PropertyIndex.SlipOption))
end

"""
Option for slip model.

Name: `SlipOption`
Default: VariableSlip

(Setter)
"""
function SlipOption(obj::Obj, value::String, flags::SetterFlagsT=SetterFlagsT(0))
    obj_set_str(obj, _PropertyIndex.SlipOption, value, flags)
end

"""
Option for slip model.

Name: `SlipOption`
Default: VariableSlip

(Setter)
"""
function SlipOption(obj::Obj, value::Union{Int,IndMach012SlipOption.T}, flags::SetterFlagsT=SetterFlagsT(0))
    obj_set_int32(obj, _PropertyIndex.SlipOption, Int32(value), flags)
end

"""
Option for slip model.

Name: `SlipOption`
Default: VariableSlip

(Getter)
"""
function SlipOption_str(obj::Obj)::String
    obj_get_str(obj, _PropertyIndex.SlipOption)
end

"""
Option for slip model.

Name: `SlipOption`
Default: VariableSlip

(Setter)
"""
function SlipOption_str(obj::Obj, value::String, flags::SetterFlagsT=SetterFlagsT(0))
    SlipOption(obj, value, flags)
end

"""
LOADSHAPE object to use for yearly simulations.  Must be previously defined as a Loadshape object. Is set to the Daily load shape  when Daily is defined.  The daily load shape is repeated in this case. Set Status=Fixed to ignore Loadshape designation. Set to NONE to reset to no loadshape. The default is no variation.

Name: `Yearly`

(Getter)
"""
function Yearly_str(obj::Obj)::String
    obj_get_str(obj, _PropertyIndex.Yearly)
end

"""
LOADSHAPE object to use for yearly simulations.  Must be previously defined as a Loadshape object. Is set to the Daily load shape  when Daily is defined.  The daily load shape is repeated in this case. Set Status=Fixed to ignore Loadshape designation. Set to NONE to reset to no loadshape. The default is no variation.

Name: `Yearly`

(Setter)
"""
function Yearly_str(obj::Obj, value::String, flags::SetterFlagsT=SetterFlagsT(0))
    obj_set_str(obj, _PropertyIndex.Yearly, value, flags)
end

"""
LOADSHAPE object to use for yearly simulations.  Must be previously defined as a Loadshape object. Is set to the Daily load shape  when Daily is defined.  The daily load shape is repeated in this case. Set Status=Fixed to ignore Loadshape designation. Set to NONE to reset to no loadshape. The default is no variation.

Name: `Yearly`

(Getter)
"""
function Yearly(obj)::Union{LoadShapeObj, Nothing}
    obj_get_obj(obj,_PropertyIndex.Yearly, LoadShapeObj)
end

"""
LOADSHAPE object to use for yearly simulations.  Must be previously defined as a Loadshape object. Is set to the Daily load shape  when Daily is defined.  The daily load shape is repeated in this case. Set Status=Fixed to ignore Loadshape designation. Set to NONE to reset to no loadshape. The default is no variation.

Name: `Yearly`

(Setter)
"""
function Yearly(obj::Obj, value::Union{LoadShapeObj, Nothing}, flags::SetterFlagsT=SetterFlagsT(0))
    obj_set_obj(obj, _PropertyIndex.Yearly, value, flags)
end

"""
LOADSHAPE object to use for yearly simulations.  Must be previously defined as a Loadshape object. Is set to the Daily load shape  when Daily is defined.  The daily load shape is repeated in this case. Set Status=Fixed to ignore Loadshape designation. Set to NONE to reset to no loadshape. The default is no variation.

Name: `Yearly`

(Setter)
"""
function Yearly(obj::Obj, value::String, flags::SetterFlagsT=SetterFlagsT(0))
    obj_set_str(obj, _PropertyIndex.Yearly, value, flags)
end

"""
LOADSHAPE object to use for daily simulations.  Must be previously defined as a Loadshape object of 24 hrs, typically. Set Status=Fixed to ignore Loadshape designation. Set to NONE to reset to no loadshape. Default is no variation (constant) if not defined. Side effect: Sets Yearly load shape if not already defined.

Name: `Daily`

(Getter)
"""
function Daily_str(obj::Obj)::String
    obj_get_str(obj, _PropertyIndex.Daily)
end

"""
LOADSHAPE object to use for daily simulations.  Must be previously defined as a Loadshape object of 24 hrs, typically. Set Status=Fixed to ignore Loadshape designation. Set to NONE to reset to no loadshape. Default is no variation (constant) if not defined. Side effect: Sets Yearly load shape if not already defined.

Name: `Daily`

(Setter)
"""
function Daily_str(obj::Obj, value::String, flags::SetterFlagsT=SetterFlagsT(0))
    obj_set_str(obj, _PropertyIndex.Daily, value, flags)
end

"""
LOADSHAPE object to use for daily simulations.  Must be previously defined as a Loadshape object of 24 hrs, typically. Set Status=Fixed to ignore Loadshape designation. Set to NONE to reset to no loadshape. Default is no variation (constant) if not defined. Side effect: Sets Yearly load shape if not already defined.

Name: `Daily`

(Getter)
"""
function Daily(obj)::Union{LoadShapeObj, Nothing}
    obj_get_obj(obj,_PropertyIndex.Daily, LoadShapeObj)
end

"""
LOADSHAPE object to use for daily simulations.  Must be previously defined as a Loadshape object of 24 hrs, typically. Set Status=Fixed to ignore Loadshape designation. Set to NONE to reset to no loadshape. Default is no variation (constant) if not defined. Side effect: Sets Yearly load shape if not already defined.

Name: `Daily`

(Setter)
"""
function Daily(obj::Obj, value::Union{LoadShapeObj, Nothing}, flags::SetterFlagsT=SetterFlagsT(0))
    obj_set_obj(obj, _PropertyIndex.Daily, value, flags)
end

"""
LOADSHAPE object to use for daily simulations.  Must be previously defined as a Loadshape object of 24 hrs, typically. Set Status=Fixed to ignore Loadshape designation. Set to NONE to reset to no loadshape. Default is no variation (constant) if not defined. Side effect: Sets Yearly load shape if not already defined.

Name: `Daily`

(Setter)
"""
function Daily(obj::Obj, value::String, flags::SetterFlagsT=SetterFlagsT(0))
    obj_set_str(obj, _PropertyIndex.Daily, value, flags)
end

"""
LOADSHAPE object to use for duty cycle simulations.  Must be previously defined as a Loadshape object.  Typically would have time intervals less than 1 hr. Designate the number of points to solve using the Set Number=xxxx command. If there are fewer points in the actual shape, the shape is assumed to repeat.Set to NONE to reset to no loadshape. Set Status=Fixed to ignore Loadshape designation.  Defaults to Daily curve If not specified.

Name: `Duty`

(Getter)
"""
function Duty_str(obj::Obj)::String
    obj_get_str(obj, _PropertyIndex.Duty)
end

"""
LOADSHAPE object to use for duty cycle simulations.  Must be previously defined as a Loadshape object.  Typically would have time intervals less than 1 hr. Designate the number of points to solve using the Set Number=xxxx command. If there are fewer points in the actual shape, the shape is assumed to repeat.Set to NONE to reset to no loadshape. Set Status=Fixed to ignore Loadshape designation.  Defaults to Daily curve If not specified.

Name: `Duty`

(Setter)
"""
function Duty_str(obj::Obj, value::String, flags::SetterFlagsT=SetterFlagsT(0))
    obj_set_str(obj, _PropertyIndex.Duty, value, flags)
end

"""
LOADSHAPE object to use for duty cycle simulations.  Must be previously defined as a Loadshape object.  Typically would have time intervals less than 1 hr. Designate the number of points to solve using the Set Number=xxxx command. If there are fewer points in the actual shape, the shape is assumed to repeat.Set to NONE to reset to no loadshape. Set Status=Fixed to ignore Loadshape designation.  Defaults to Daily curve If not specified.

Name: `Duty`

(Getter)
"""
function Duty(obj)::Union{LoadShapeObj, Nothing}
    obj_get_obj(obj,_PropertyIndex.Duty, LoadShapeObj)
end

"""
LOADSHAPE object to use for duty cycle simulations.  Must be previously defined as a Loadshape object.  Typically would have time intervals less than 1 hr. Designate the number of points to solve using the Set Number=xxxx command. If there are fewer points in the actual shape, the shape is assumed to repeat.Set to NONE to reset to no loadshape. Set Status=Fixed to ignore Loadshape designation.  Defaults to Daily curve If not specified.

Name: `Duty`

(Setter)
"""
function Duty(obj::Obj, value::Union{LoadShapeObj, Nothing}, flags::SetterFlagsT=SetterFlagsT(0))
    obj_set_obj(obj, _PropertyIndex.Duty, value, flags)
end

"""
LOADSHAPE object to use for duty cycle simulations.  Must be previously defined as a Loadshape object.  Typically would have time intervals less than 1 hr. Designate the number of points to solve using the Set Number=xxxx command. If there are fewer points in the actual shape, the shape is assumed to repeat.Set to NONE to reset to no loadshape. Set Status=Fixed to ignore Loadshape designation.  Defaults to Daily curve If not specified.

Name: `Duty`

(Setter)
"""
function Duty(obj::Obj, value::String, flags::SetterFlagsT=SetterFlagsT(0))
    obj_set_str(obj, _PropertyIndex.Duty, value, flags)
end

"""
Write DebugTrace file.

Name: `DebugTrace`
Default: False

(Getter)
"""
function DebugTrace(obj::Obj)::Bool
    return obj_get_bool(obj, _PropertyIndex.DebugTrace)
end

"""
Write DebugTrace file.

Name: `DebugTrace`
Default: False

(Setter)
"""
function DebugTrace(obj::Obj, value::Bool, flags::SetterFlagsT=SetterFlagsT(0))
    obj_set_bool(obj, _PropertyIndex.DebugTrace, value, flags)
end

"""
Name of harmonic voltage or current spectrum for this IndMach012. Voltage behind Xd" for machine - default.

Name: `Spectrum`
Default: default

(Getter)
"""
function Spectrum_str(obj::Obj)::String
    obj_get_str(obj, _PropertyIndex.Spectrum)
end

"""
Name of harmonic voltage or current spectrum for this IndMach012. Voltage behind Xd" for machine - default.

Name: `Spectrum`
Default: default

(Setter)
"""
function Spectrum_str(obj::Obj, value::String, flags::SetterFlagsT=SetterFlagsT(0))
    obj_set_str(obj, _PropertyIndex.Spectrum, value, flags)
end

"""
Name of harmonic voltage or current spectrum for this IndMach012. Voltage behind Xd" for machine - default.

Name: `Spectrum`
Default: default

(Getter)
"""
function Spectrum(obj)::Union{SpectrumObj, Nothing}
    obj_get_obj(obj,_PropertyIndex.Spectrum, SpectrumObj)
end

"""
Name of harmonic voltage or current spectrum for this IndMach012. Voltage behind Xd" for machine - default.

Name: `Spectrum`
Default: default

(Setter)
"""
function Spectrum(obj::Obj, value::Union{SpectrumObj, Nothing}, flags::SetterFlagsT=SetterFlagsT(0))
    obj_set_obj(obj, _PropertyIndex.Spectrum, value, flags)
end

"""
Name of harmonic voltage or current spectrum for this IndMach012. Voltage behind Xd" for machine - default.

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

end # module IndMach012
export IndMach012
