module WindGen
using ..Enums.SetterFlags: SetterFlagsT
using ..Enums: Connection, WindGenModel, WindGenQMode
using ..DynamicExp: DynamicExpObj
using ..LoadShape: LoadShapeObj
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


const _cls_name = "WindGen"
const _cls_idx = 28

module _PropertyIndex
const Phases = Int32(1)
const Bus1 = Int32(2)
const kV = Int32(3)
const kW = Int32(4)
const PF = Int32(5)
const Model = Int32(6)
const Yearly = Int32(7)
const Daily = Int32(8)
const Duty = Int32(9)
const Conn = Int32(10)
const kvar = Int32(11)
const Class = Int32(12)
const DebugTrace = Int32(13)
const Vminpu = Int32(14)
const Vmaxpu = Int32(15)
const kVA = Int32(16)
const MVA = Int32(17)
const DutyStart = Int32(18)
const DynamicEq = Int32(19)
const DynOut = Int32(20)
const RThev = Int32(21)
const XThev = Int32(22)
const VSS = Int32(23)
const PSS = Int32(24)
const QSS = Int32(25)
const VWind = Int32(26)
const QMode = Int32(27)
const SimMechFlg = Int32(28)
const APCFlg = Int32(29)
const QFlg = Int32(30)
const delt0 = Int32(31)
const N_WTG = Int32(32)
const VV_Curve = Int32(33)
const Ag = Int32(34)
const Cp = Int32(35)
const Lamda = Int32(36)
const P = Int32(37)
const pd = Int32(38)
const PLoss = Int32(39)
const Rad = Int32(40)
const VCutIn = Int32(41)
const VCutOut = Int32(42)
const Spectrum = Int32(43)
const BaseFreq = Int32(44)
const Enabled = Int32(45)
const Like = Int32(46)
end

struct WindGenObj <: AbstractPCElement
    ptr::Ptr{Cvoid}
    dss::DSSContext
end
export WindGenObj
Common._wrap_dss_obj(::Val{_cls_idx}, ptr::Ptr{Cvoid}, dss::DSSContext) = WindGenObj(ptr, dss)
const Obj = WindGenObj

function Base.show(io::IO, obj::WindGenObj) 
    name = obj_get_str(obj, obj.dss.capi.Obj_GetFullName)
    print(name)
end


include("dss_object.jl")


"""
Number of phases for this WindGen. Power is evenly divided among phases.

Name: `Phases`
Default: 3

(Getter)
"""
function Phases(obj::Obj)::Int32
    obj_get_int32(obj, _PropertyIndex.Phases)
end

"""
Number of phases for this WindGen. Power is evenly divided among phases.

Name: `Phases`
Default: 3

(Setter)
"""
function Phases(obj::Obj, value::Int32, flags::SetterFlagsT=SetterFlagsT(0))
    obj_set_int32(obj, _PropertyIndex.Phases, value, flags)
end

"""
Bus to which the WindGen is connected.  May include specific node specification.

Name: `Bus1`

(Getter)
"""
function Bus1(obj::Obj)::String
    obj_get_str(obj, _PropertyIndex.Bus1)
end

"""
Bus to which the WindGen is connected.  May include specific node specification.

Name: `Bus1`

(Setter)
"""
function Bus1(obj::Obj, value::String, flags::SetterFlagsT=SetterFlagsT(0))
    obj_set_str(obj, _PropertyIndex.Bus1, value, flags)
end

"""
Nominal rated (1.0 per unit) voltage, kV, for WindGen. For 2- and 3-phase WindGens, specify phase-phase kV.
Otherwise, for phases=1 or phases>3, specify actual kV across each branch of the WindGen.
If wye (star), specify phase-neutral kV.
If delta or phase-phase connected, specify phase-phase kV.

Name: `kV`
Units: kV
Default: 12.47

(Getter)
"""
function kV(obj::Obj)::Float64
    obj_get_float64(obj, _PropertyIndex.kV)
end

"""
Nominal rated (1.0 per unit) voltage, kV, for WindGen. For 2- and 3-phase WindGens, specify phase-phase kV.
Otherwise, for phases=1 or phases>3, specify actual kV across each branch of the WindGen.
If wye (star), specify phase-neutral kV.
If delta or phase-phase connected, specify phase-phase kV.

Name: `kV`
Units: kV
Default: 12.47

(Setter)
"""
function kV(obj::Obj, value::Float64, flags::SetterFlagsT=SetterFlagsT(0))
    obj_set_float64(obj, _PropertyIndex.kV, value, flags)
end

"""
Total base kW for the WindGen.
A positive value denotes power coming OUT of the element, which is the opposite of a load. This value is modified depending on the dispatch mode.
Unaffected by the global load multiplier and growth curves.
If you want there to be more generation, you must add more WindGens or change this value.

Name: `kW`
Units: kW
Default: 1000.0

(Getter)
"""
function kW(obj::Obj)::Float64
    obj_get_float64(obj, _PropertyIndex.kW)
end

"""
Total base kW for the WindGen.
A positive value denotes power coming OUT of the element, which is the opposite of a load. This value is modified depending on the dispatch mode.
Unaffected by the global load multiplier and growth curves.
If you want there to be more generation, you must add more WindGens or change this value.

Name: `kW`
Units: kW
Default: 1000.0

(Setter)
"""
function kW(obj::Obj, value::Float64, flags::SetterFlagsT=SetterFlagsT(0))
    obj_set_float64(obj, _PropertyIndex.kW, value, flags)
end

"""
WindGen power factor. Enter negative for leading powerfactor (when kW and kvar have opposite signs.)
A positive power factor for a WindGen signifies that the WindGen produces vars as is typical for a synchronous WindGen.
Induction machines would be generally specified with a negative power factor.

Name: `PF`
Default: 0.88

(Getter)
"""
function PF(obj::Obj)::Float64
    obj_get_float64(obj, _PropertyIndex.PF)
end

"""
WindGen power factor. Enter negative for leading powerfactor (when kW and kvar have opposite signs.)
A positive power factor for a WindGen signifies that the WindGen produces vars as is typical for a synchronous WindGen.
Induction machines would be generally specified with a negative power factor.

Name: `PF`
Default: 0.88

(Setter)
"""
function PF(obj::Obj, value::Float64, flags::SetterFlagsT=SetterFlagsT(0))
    obj_set_float64(obj, _PropertyIndex.PF, value, flags)
end

"""
Integer code for the model to use for generation variation with voltage.
Valid values are (**NOTE:** this is under review):
1:WindGen injects a constant kW at specified power factor.
2:WindGen is modeled as a constant admittance.
4:Const kW, Fixed Q (Q never varies)
5:Const kW, Fixed Q (as a constant reactance)

Name: `Model`
Default: 1

(Getter)
"""
function Model(obj)::WindGenModel.T
    WindGenModel.T(obj_get_int32(obj, _PropertyIndex.Model))
end

"""
Integer code for the model to use for generation variation with voltage.
Valid values are (**NOTE:** this is under review):
1:WindGen injects a constant kW at specified power factor.
2:WindGen is modeled as a constant admittance.
4:Const kW, Fixed Q (Q never varies)
5:Const kW, Fixed Q (as a constant reactance)

Name: `Model`
Default: 1

(Setter)
"""
function Model(obj::Obj, value::Union{Int,WindGenModel.T}, flags::SetterFlagsT=SetterFlagsT(0))
    obj_set_int32(obj, _PropertyIndex.Model, value, flags)
end

"""
Wind speed shape to use for yearly-mode simulations.  Must be previously defined as a LoadShape object.
If this is not specified, a constant value is assumed (no variation).
Set to NONE to reset to no LoadShape.
Nominally for 8760 simulations. If there are fewer points in the designated shape than the number of points in the solution, the curve is repeated.

Name: `Yearly`

(Getter)
"""
function Yearly_str(obj::Obj)::String
    obj_get_str(obj, _PropertyIndex.Yearly)
end

"""
Wind speed shape to use for yearly-mode simulations.  Must be previously defined as a LoadShape object.
If this is not specified, a constant value is assumed (no variation).
Set to NONE to reset to no LoadShape.
Nominally for 8760 simulations. If there are fewer points in the designated shape than the number of points in the solution, the curve is repeated.

Name: `Yearly`

(Setter)
"""
function Yearly_str(obj::Obj, value::String, flags::SetterFlagsT=SetterFlagsT(0))
    obj_set_str(obj, _PropertyIndex.Yearly, value, flags)
end

"""
Wind speed shape to use for yearly-mode simulations.  Must be previously defined as a LoadShape object.
If this is not specified, a constant value is assumed (no variation).
Set to NONE to reset to no LoadShape.
Nominally for 8760 simulations. If there are fewer points in the designated shape than the number of points in the solution, the curve is repeated.

Name: `Yearly`

(Getter)
"""
function Yearly(obj)::Union{LoadShapeObj, Nothing}
    obj_get_obj(obj,_PropertyIndex.Yearly, LoadShapeObj)
end

"""
Wind speed shape to use for yearly-mode simulations.  Must be previously defined as a LoadShape object.
If this is not specified, a constant value is assumed (no variation).
Set to NONE to reset to no LoadShape.
Nominally for 8760 simulations. If there are fewer points in the designated shape than the number of points in the solution, the curve is repeated.

Name: `Yearly`

(Setter)
"""
function Yearly(obj::Obj, value::Union{LoadShapeObj, Nothing}, flags::SetterFlagsT=SetterFlagsT(0))
    obj_set_obj(obj, _PropertyIndex.Yearly, value, flags)
end

"""
Wind speed shape to use for yearly-mode simulations.  Must be previously defined as a LoadShape object.
If this is not specified, a constant value is assumed (no variation).
Set to NONE to reset to no LoadShape.
Nominally for 8760 simulations. If there are fewer points in the designated shape than the number of points in the solution, the curve is repeated.

Name: `Yearly`

(Setter)
"""
function Yearly(obj::Obj, value::String, flags::SetterFlagsT=SetterFlagsT(0))
    obj_set_str(obj, _PropertyIndex.Yearly, value, flags)
end

"""
Wind speed shape to use for daily-mode simulations. Must be previously defined as a LoadShape object of 24 hrs, typically.
Set to NONE to reset to no LoadShape.

Name: `Daily`

(Getter)
"""
function Daily_str(obj::Obj)::String
    obj_get_str(obj, _PropertyIndex.Daily)
end

"""
Wind speed shape to use for daily-mode simulations. Must be previously defined as a LoadShape object of 24 hrs, typically.
Set to NONE to reset to no LoadShape.

Name: `Daily`

(Setter)
"""
function Daily_str(obj::Obj, value::String, flags::SetterFlagsT=SetterFlagsT(0))
    obj_set_str(obj, _PropertyIndex.Daily, value, flags)
end

"""
Wind speed shape to use for daily-mode simulations. Must be previously defined as a LoadShape object of 24 hrs, typically.
Set to NONE to reset to no LoadShape.

Name: `Daily`

(Getter)
"""
function Daily(obj)::Union{LoadShapeObj, Nothing}
    obj_get_obj(obj,_PropertyIndex.Daily, LoadShapeObj)
end

"""
Wind speed shape to use for daily-mode simulations. Must be previously defined as a LoadShape object of 24 hrs, typically.
Set to NONE to reset to no LoadShape.

Name: `Daily`

(Setter)
"""
function Daily(obj::Obj, value::Union{LoadShapeObj, Nothing}, flags::SetterFlagsT=SetterFlagsT(0))
    obj_set_obj(obj, _PropertyIndex.Daily, value, flags)
end

"""
Wind speed shape to use for daily-mode simulations. Must be previously defined as a LoadShape object of 24 hrs, typically.
Set to NONE to reset to no LoadShape.

Name: `Daily`

(Setter)
"""
function Daily(obj::Obj, value::String, flags::SetterFlagsT=SetterFlagsT(0))
    obj_set_str(obj, _PropertyIndex.Daily, value, flags)
end

"""
Load shape to use for duty cycle dispatch simulations such as for wind or solar generation.
Must be previously defined as a LoadShape object.
Typically would have time intervals less than 1 hr -- perhaps, in seconds.
Set to NONE to reset to no LoadShape.
Designate the number of points to solve using the Set Number=xxxx command.
If there are fewer points in the actual shape, the shape is assumed to repeat.

Name: `Duty`

(Getter)
"""
function Duty_str(obj::Obj)::String
    obj_get_str(obj, _PropertyIndex.Duty)
end

"""
Load shape to use for duty cycle dispatch simulations such as for wind or solar generation.
Must be previously defined as a LoadShape object.
Typically would have time intervals less than 1 hr -- perhaps, in seconds.
Set to NONE to reset to no LoadShape.
Designate the number of points to solve using the Set Number=xxxx command.
If there are fewer points in the actual shape, the shape is assumed to repeat.

Name: `Duty`

(Setter)
"""
function Duty_str(obj::Obj, value::String, flags::SetterFlagsT=SetterFlagsT(0))
    obj_set_str(obj, _PropertyIndex.Duty, value, flags)
end

"""
Load shape to use for duty cycle dispatch simulations such as for wind or solar generation.
Must be previously defined as a LoadShape object.
Typically would have time intervals less than 1 hr -- perhaps, in seconds.
Set to NONE to reset to no LoadShape.
Designate the number of points to solve using the Set Number=xxxx command.
If there are fewer points in the actual shape, the shape is assumed to repeat.

Name: `Duty`

(Getter)
"""
function Duty(obj)::Union{LoadShapeObj, Nothing}
    obj_get_obj(obj,_PropertyIndex.Duty, LoadShapeObj)
end

"""
Load shape to use for duty cycle dispatch simulations such as for wind or solar generation.
Must be previously defined as a LoadShape object.
Typically would have time intervals less than 1 hr -- perhaps, in seconds.
Set to NONE to reset to no LoadShape.
Designate the number of points to solve using the Set Number=xxxx command.
If there are fewer points in the actual shape, the shape is assumed to repeat.

Name: `Duty`

(Setter)
"""
function Duty(obj::Obj, value::Union{LoadShapeObj, Nothing}, flags::SetterFlagsT=SetterFlagsT(0))
    obj_set_obj(obj, _PropertyIndex.Duty, value, flags)
end

"""
Load shape to use for duty cycle dispatch simulations such as for wind or solar generation.
Must be previously defined as a LoadShape object.
Typically would have time intervals less than 1 hr -- perhaps, in seconds.
Set to NONE to reset to no LoadShape.
Designate the number of points to solve using the Set Number=xxxx command.
If there are fewer points in the actual shape, the shape is assumed to repeat.

Name: `Duty`

(Setter)
"""
function Duty(obj::Obj, value::String, flags::SetterFlagsT=SetterFlagsT(0))
    obj_set_str(obj, _PropertyIndex.Duty, value, flags)
end

"""
={wye|LN|delta|LL}. Default is wye.

Name: `Conn`
Default: Wye

(Getter)
"""
function Conn(obj::Obj)::Connection.T
    Connection.T(obj_get_int32(obj, _PropertyIndex.Conn))
end

"""
={wye|LN|delta|LL}. Default is wye.

Name: `Conn`
Default: Wye

(Setter)
"""
function Conn(obj::Obj, value::String, flags::SetterFlagsT=SetterFlagsT(0))
    obj_set_str(obj, _PropertyIndex.Conn, value, flags)
end

"""
={wye|LN|delta|LL}. Default is wye.

Name: `Conn`
Default: Wye

(Setter)
"""
function Conn(obj::Obj, value::Union{Int,Connection.T}, flags::SetterFlagsT=SetterFlagsT(0))
    obj_set_int32(obj, _PropertyIndex.Conn, Int32(value), flags)
end

"""
={wye|LN|delta|LL}. Default is wye.

Name: `Conn`
Default: Wye

(Getter)
"""
function Conn_str(obj::Obj)::String
    obj_get_str(obj, _PropertyIndex.Conn)
end

"""
={wye|LN|delta|LL}. Default is wye.

Name: `Conn`
Default: Wye

(Setter)
"""
function Conn_str(obj::Obj, value::String, flags::SetterFlagsT=SetterFlagsT(0))
    Conn(obj, value, flags)
end

"""
Specify the base kvar. Alternative to specifying the power factor.
Side effect: the power factor value is altered to agree based on present value of kW.

Name: `kvar`
Units: kvar

(Getter)
"""
function kvar(obj::Obj)::Float64
    obj_get_float64(obj, _PropertyIndex.kvar)
end

"""
Specify the base kvar. Alternative to specifying the power factor.
Side effect: the power factor value is altered to agree based on present value of kW.

Name: `kvar`
Units: kvar

(Setter)
"""
function kvar(obj::Obj, value::Float64, flags::SetterFlagsT=SetterFlagsT(0))
    obj_set_float64(obj, _PropertyIndex.kvar, value, flags)
end

"""
An arbitrary integer number representing the class of WindGen so that WindGen values may be segregated by class.

Name: `Class`
Default: 1

(Getter)
"""
function Class(obj::Obj)::Int32
    obj_get_int32(obj, _PropertyIndex.Class)
end

"""
An arbitrary integer number representing the class of WindGen so that WindGen values may be segregated by class.

Name: `Class`
Default: 1

(Setter)
"""
function Class(obj::Obj, value::Int32, flags::SetterFlagsT=SetterFlagsT(0))
    obj_set_int32(obj, _PropertyIndex.Class, value, flags)
end

"""
Turn this on to capture the progress of the WindGen model for each iteration.
Creates a separate file for each WindGen named "WINDGEN_name.CSV".

Name: `DebugTrace`
Default: False

(Getter)
"""
function DebugTrace(obj::Obj)::Bool
    return obj_get_bool(obj, _PropertyIndex.DebugTrace)
end

"""
Turn this on to capture the progress of the WindGen model for each iteration.
Creates a separate file for each WindGen named "WINDGEN_name.CSV".

Name: `DebugTrace`
Default: False

(Setter)
"""
function DebugTrace(obj::Obj, value::Bool, flags::SetterFlagsT=SetterFlagsT(0))
    obj_set_bool(obj, _PropertyIndex.DebugTrace, value, flags)
end

"""
Minimum per unit voltage for which the Model is assumed to apply. Below this value, the WindGen model reverts to a constant impedance model. For model 7, the current is limited to the value computed for constant power at VMinPU.

Name: `Vminpu`
Default: 0.9

(Getter)
"""
function Vminpu(obj::Obj)::Float64
    obj_get_float64(obj, _PropertyIndex.Vminpu)
end

"""
Minimum per unit voltage for which the Model is assumed to apply. Below this value, the WindGen model reverts to a constant impedance model. For model 7, the current is limited to the value computed for constant power at VMinPU.

Name: `Vminpu`
Default: 0.9

(Setter)
"""
function Vminpu(obj::Obj, value::Float64, flags::SetterFlagsT=SetterFlagsT(0))
    obj_set_float64(obj, _PropertyIndex.Vminpu, value, flags)
end

"""
Maximum per unit voltage for which the Model is assumed to apply.
Above this value, the WindGen model reverts to a constant impedance model.

Name: `Vmaxpu`
Default: 1.1

(Getter)
"""
function Vmaxpu(obj::Obj)::Float64
    obj_get_float64(obj, _PropertyIndex.Vmaxpu)
end

"""
Maximum per unit voltage for which the Model is assumed to apply.
Above this value, the WindGen model reverts to a constant impedance model.

Name: `Vmaxpu`
Default: 1.1

(Setter)
"""
function Vmaxpu(obj::Obj, value::Float64, flags::SetterFlagsT=SetterFlagsT(0))
    obj_set_float64(obj, _PropertyIndex.Vmaxpu, value, flags)
end

"""
kVA rating of electrical machine. Defaults to 1.2 times "kW" if not specified. Applied to machine or inverter definition for Dynamics mode solutions. 

Name: `kVA`

(Getter)
"""
function kVA(obj::Obj)::Float64
    obj_get_float64(obj, _PropertyIndex.kVA)
end

"""
kVA rating of electrical machine. Defaults to 1.2 times "kW" if not specified. Applied to machine or inverter definition for Dynamics mode solutions. 

Name: `kVA`

(Setter)
"""
function kVA(obj::Obj, value::Float64, flags::SetterFlagsT=SetterFlagsT(0))
    obj_set_float64(obj, _PropertyIndex.kVA, value, flags)
end

"""
MVA rating of electrical machine. Alternative to using the "kVA" property.

Name: `MVA`

(Getter)
"""
function MVA(obj::Obj)::Float64
    obj_get_float64(obj, _PropertyIndex.MVA)
end

"""
MVA rating of electrical machine. Alternative to using the "kVA" property.

Name: `MVA`

(Setter)
"""
function MVA(obj::Obj, value::Float64, flags::SetterFlagsT=SetterFlagsT(0))
    obj_set_float64(obj, _PropertyIndex.MVA, value, flags)
end

"""
Starting time offset [hours] into the duty cycle shape for this WindGen.

Name: `DutyStart`
Units: hour
Default: 0.0

(Getter)
"""
function DutyStart(obj::Obj)::Float64
    obj_get_float64(obj, _PropertyIndex.DutyStart)
end

"""
Starting time offset [hours] into the duty cycle shape for this WindGen.

Name: `DutyStart`
Units: hour
Default: 0.0

(Setter)
"""
function DutyStart(obj::Obj, value::Float64, flags::SetterFlagsT=SetterFlagsT(0))
    obj_set_float64(obj, _PropertyIndex.DutyStart, value, flags)
end

"""
The name of the dynamic equation (DynamicExp) that will be used for defining the dynamic behavior of the generator.
if not defined, the generator dynamics will follow the built-in dynamic equation.

Name: `DynamicEq`

(Getter)
"""
function DynamicEq_str(obj::Obj)::String
    obj_get_str(obj, _PropertyIndex.DynamicEq)
end

"""
The name of the dynamic equation (DynamicExp) that will be used for defining the dynamic behavior of the generator.
if not defined, the generator dynamics will follow the built-in dynamic equation.

Name: `DynamicEq`

(Setter)
"""
function DynamicEq_str(obj::Obj, value::String, flags::SetterFlagsT=SetterFlagsT(0))
    obj_set_str(obj, _PropertyIndex.DynamicEq, value, flags)
end

"""
The name of the dynamic equation (DynamicExp) that will be used for defining the dynamic behavior of the generator.
if not defined, the generator dynamics will follow the built-in dynamic equation.

Name: `DynamicEq`

(Getter)
"""
function DynamicEq(obj)::Union{DynamicExpObj, Nothing}
    obj_get_obj(obj,_PropertyIndex.DynamicEq, DynamicExpObj)
end

"""
The name of the dynamic equation (DynamicExp) that will be used for defining the dynamic behavior of the generator.
if not defined, the generator dynamics will follow the built-in dynamic equation.

Name: `DynamicEq`

(Setter)
"""
function DynamicEq(obj::Obj, value::Union{DynamicExpObj, Nothing}, flags::SetterFlagsT=SetterFlagsT(0))
    obj_set_obj(obj, _PropertyIndex.DynamicEq, value, flags)
end

"""
The name of the dynamic equation (DynamicExp) that will be used for defining the dynamic behavior of the generator.
if not defined, the generator dynamics will follow the built-in dynamic equation.

Name: `DynamicEq`

(Setter)
"""
function DynamicEq(obj::Obj, value::String, flags::SetterFlagsT=SetterFlagsT(0))
    obj_set_str(obj, _PropertyIndex.DynamicEq, value, flags)
end

"""
The name of the variables within the Dynamic equation that will be used to govern the generator dynamics.
This generator model requires 2 outputs from the dynamic equation: 
1. Shaft speed (velocity) relative to synchronous speed.
2. Shaft, or power, angle (relative to synchronous reference frame).
The output variables need to be defined in the same order.

Name: `DynOut`

(Getter)
"""
function DynOut(obj::Obj)::Vector{String}
    obj_get_strs(obj, _PropertyIndex.DynOut)
end

"""
The name of the variables within the Dynamic equation that will be used to govern the generator dynamics.
This generator model requires 2 outputs from the dynamic equation: 
1. Shaft speed (velocity) relative to synchronous speed.
2. Shaft, or power, angle (relative to synchronous reference frame).
The output variables need to be defined in the same order.

Name: `DynOut`

(Setter)
"""
function DynOut(obj::Obj, value::Vector{String}, flags::SetterFlagsT=SetterFlagsT(0))
    obj_set_strs(obj, _PropertyIndex.DynOut, value, flags)
end

"""
Per unit Thévenin equivalent R.

Name: `RThev`
Default: 0.0

(Getter)
"""
function RThev(obj::Obj)::Float64
    obj_get_float64(obj, _PropertyIndex.RThev)
end

"""
Per unit Thévenin equivalent R.

Name: `RThev`
Default: 0.0

(Setter)
"""
function RThev(obj::Obj, value::Float64, flags::SetterFlagsT=SetterFlagsT(0))
    obj_set_float64(obj, _PropertyIndex.RThev, value, flags)
end

"""
Per unit Thévenin equivalent X.

Name: `XThev`
Default: 0.05

(Getter)
"""
function XThev(obj::Obj)::Float64
    obj_get_float64(obj, _PropertyIndex.XThev)
end

"""
Per unit Thévenin equivalent X.

Name: `XThev`
Default: 0.05

(Setter)
"""
function XThev(obj::Obj, value::Float64, flags::SetterFlagsT=SetterFlagsT(0))
    obj_set_float64(obj, _PropertyIndex.XThev, value, flags)
end

"""
Steady state voltage magnitude.

Name: `VSS`
Units: pu (voltage)
Default: 1.0

(Getter)
"""
function VSS(obj::Obj)::Float64
    obj_get_float64(obj, _PropertyIndex.VSS)
end

"""
Steady state voltage magnitude.

Name: `VSS`
Units: pu (voltage)
Default: 1.0

(Setter)
"""
function VSS(obj::Obj, value::Float64, flags::SetterFlagsT=SetterFlagsT(0))
    obj_set_float64(obj, _PropertyIndex.VSS, value, flags)
end

"""
Steady state output real power.

Name: `PSS`
Default: 1.0

(Getter)
"""
function PSS(obj::Obj)::Float64
    obj_get_float64(obj, _PropertyIndex.PSS)
end

"""
Steady state output real power.

Name: `PSS`
Default: 1.0

(Setter)
"""
function PSS(obj::Obj, value::Float64, flags::SetterFlagsT=SetterFlagsT(0))
    obj_set_float64(obj, _PropertyIndex.PSS, value, flags)
end

"""
Steady state output reactive power.

Name: `QSS`
Default: 0.0

(Getter)
"""
function QSS(obj::Obj)::Float64
    obj_get_float64(obj, _PropertyIndex.QSS)
end

"""
Steady state output reactive power.

Name: `QSS`
Default: 0.0

(Setter)
"""
function QSS(obj::Obj, value::Float64, flags::SetterFlagsT=SetterFlagsT(0))
    obj_set_float64(obj, _PropertyIndex.QSS, value, flags)
end

"""
Wind speed in m/s

Name: `VWind`
Default: 12.0

(Getter)
"""
function VWind(obj::Obj)::Float64
    obj_get_float64(obj, _PropertyIndex.VWind)
end

"""
Wind speed in m/s

Name: `VWind`
Default: 12.0

(Setter)
"""
function VWind(obj::Obj, value::Float64, flags::SetterFlagsT=SetterFlagsT(0))
    obj_set_float64(obj, _PropertyIndex.VWind, value, flags)
end

"""
Q control mode (0:Q, 1:PF, 2:VV).

Name: `QMode`
Default: 0

(Getter)
"""
function QMode(obj)::WindGenQMode.T
    WindGenQMode.T(obj_get_int32(obj, _PropertyIndex.QMode))
end

"""
Q control mode (0:Q, 1:PF, 2:VV).

Name: `QMode`
Default: 0

(Setter)
"""
function QMode(obj::Obj, value::Union{Int,WindGenQMode.T}, flags::SetterFlagsT=SetterFlagsT(0))
    obj_set_int32(obj, _PropertyIndex.QMode, value, flags)
end

"""
1 to simulate mechanical system. Otherwise (0) only uses the electrical system. For dynamics simulation purposes.

Name: `SimMechFlg`
Default: 1

(Getter)
"""
function SimMechFlg(obj::Obj)::Int32
    obj_get_int32(obj, _PropertyIndex.SimMechFlg)
end

"""
1 to simulate mechanical system. Otherwise (0) only uses the electrical system. For dynamics simulation purposes.

Name: `SimMechFlg`
Default: 1

(Setter)
"""
function SimMechFlg(obj::Obj, value::Int32, flags::SetterFlagsT=SetterFlagsT(0))
    obj_set_int32(obj, _PropertyIndex.SimMechFlg, value, flags)
end

"""
1 to enable active power control.

Name: `APCFlg`
Default: 0

(Getter)
"""
function APCFlg(obj::Obj)::Int32
    obj_get_int32(obj, _PropertyIndex.APCFlg)
end

"""
1 to enable active power control.

Name: `APCFlg`
Default: 0

(Setter)
"""
function APCFlg(obj::Obj, value::Int32, flags::SetterFlagsT=SetterFlagsT(0))
    obj_set_int32(obj, _PropertyIndex.APCFlg, value, flags)
end

"""
1 to enable reactive power and voltage control.

Name: `QFlg`
Default: 1

(Getter)
"""
function QFlg(obj::Obj)::Int32
    obj_get_int32(obj, _PropertyIndex.QFlg)
end

"""
1 to enable reactive power and voltage control.

Name: `QFlg`
Default: 1

(Setter)
"""
function QFlg(obj::Obj, value::Int32, flags::SetterFlagsT=SetterFlagsT(0))
    obj_set_int32(obj, _PropertyIndex.QFlg, value, flags)
end

"""
User defined internal simulation step.

Name: `delt0`
Default: 5e-05

(Getter)
"""
function delt0(obj::Obj)::Float64
    obj_get_float64(obj, _PropertyIndex.delt0)
end

"""
User defined internal simulation step.

Name: `delt0`
Default: 5e-05

(Setter)
"""
function delt0(obj::Obj, value::Float64, flags::SetterFlagsT=SetterFlagsT(0))
    obj_set_float64(obj, _PropertyIndex.delt0, value, flags)
end

"""
Number of WTG in aggregation.

Name: `N_WTG`
Default: 1

(Getter)
"""
function N_WTG(obj::Obj)::Int32
    obj_get_int32(obj, _PropertyIndex.N_WTG)
end

"""
Number of WTG in aggregation.

Name: `N_WTG`
Default: 1

(Setter)
"""
function N_WTG(obj::Obj, value::Int32, flags::SetterFlagsT=SetterFlagsT(0))
    obj_set_int32(obj, _PropertyIndex.N_WTG, value, flags)
end

"""
Name of the XY curve defining the control curve for implementing volt-var (VV) control with this inverter.

Name: `VV_Curve`

(Getter)
"""
function VV_Curve_str(obj::Obj)::String
    obj_get_str(obj, _PropertyIndex.VV_Curve)
end

"""
Name of the XY curve defining the control curve for implementing volt-var (VV) control with this inverter.

Name: `VV_Curve`

(Setter)
"""
function VV_Curve_str(obj::Obj, value::String, flags::SetterFlagsT=SetterFlagsT(0))
    obj_set_str(obj, _PropertyIndex.VV_Curve, value, flags)
end

"""
Name of the XY curve defining the control curve for implementing volt-var (VV) control with this inverter.

Name: `VV_Curve`

(Getter)
"""
function VV_Curve(obj)::Union{XYcurveObj, Nothing}
    obj_get_obj(obj,_PropertyIndex.VV_Curve, XYcurveObj)
end

"""
Name of the XY curve defining the control curve for implementing volt-var (VV) control with this inverter.

Name: `VV_Curve`

(Setter)
"""
function VV_Curve(obj::Obj, value::Union{XYcurveObj, Nothing}, flags::SetterFlagsT=SetterFlagsT(0))
    obj_set_obj(obj, _PropertyIndex.VV_Curve, value, flags)
end

"""
Name of the XY curve defining the control curve for implementing volt-var (VV) control with this inverter.

Name: `VV_Curve`

(Setter)
"""
function VV_Curve(obj::Obj, value::String, flags::SetterFlagsT=SetterFlagsT(0))
    obj_set_str(obj, _PropertyIndex.VV_Curve, value, flags)
end

"""
Gearbox ratio.

Name: `Ag`
Default: 0.011111111111111112

(Getter)
"""
function Ag(obj::Obj)::Float64
    obj_get_float64(obj, _PropertyIndex.Ag)
end

"""
Gearbox ratio.

Name: `Ag`
Default: 0.011111111111111112

(Setter)
"""
function Ag(obj::Obj, value::Float64, flags::SetterFlagsT=SetterFlagsT(0))
    obj_set_float64(obj, _PropertyIndex.Ag, value, flags)
end

"""
Turbine performance coefficient.

Name: `Cp`
Default: 0.41

(Getter)
"""
function Cp(obj::Obj)::Float64
    obj_get_float64(obj, _PropertyIndex.Cp)
end

"""
Turbine performance coefficient.

Name: `Cp`
Default: 0.41

(Setter)
"""
function Cp(obj::Obj, value::Float64, flags::SetterFlagsT=SetterFlagsT(0))
    obj_set_float64(obj, _PropertyIndex.Cp, value, flags)
end

"""
Tip speed ratio.

Name: `Lamda`
Default: 7.95

(Getter)
"""
function Lamda(obj::Obj)::Float64
    obj_get_float64(obj, _PropertyIndex.Lamda)
end

"""
Tip speed ratio.

Name: `Lamda`
Default: 7.95

(Setter)
"""
function Lamda(obj::Obj, value::Float64, flags::SetterFlagsT=SetterFlagsT(0))
    obj_set_float64(obj, _PropertyIndex.Lamda, value, flags)
end

"""
WindGen.p

Name: `P`
Default: 2.0

(Getter)
"""
function P(obj::Obj)::Float64
    obj_get_float64(obj, _PropertyIndex.P)
end

"""
WindGen.p

Name: `P`
Default: 2.0

(Setter)
"""
function P(obj::Obj, value::Float64, flags::SetterFlagsT=SetterFlagsT(0))
    obj_set_float64(obj, _PropertyIndex.P, value, flags)
end

"""
Air density in kg/m3.

Name: `pd`
Default: 1.225

(Getter)
"""
function pd(obj::Obj)::Float64
    obj_get_float64(obj, _PropertyIndex.pd)
end

"""
Air density in kg/m3.

Name: `pd`
Default: 1.225

(Setter)
"""
function pd(obj::Obj, value::Float64, flags::SetterFlagsT=SetterFlagsT(0))
    obj_set_float64(obj, _PropertyIndex.pd, value, flags)
end

"""
Name of the XYCurve object describing the active power losses in pct versus the wind speed.

Name: `PLoss`

(Getter)
"""
function PLoss_str(obj::Obj)::String
    obj_get_str(obj, _PropertyIndex.PLoss)
end

"""
Name of the XYCurve object describing the active power losses in pct versus the wind speed.

Name: `PLoss`

(Setter)
"""
function PLoss_str(obj::Obj, value::String, flags::SetterFlagsT=SetterFlagsT(0))
    obj_set_str(obj, _PropertyIndex.PLoss, value, flags)
end

"""
Name of the XYCurve object describing the active power losses in pct versus the wind speed.

Name: `PLoss`

(Getter)
"""
function PLoss(obj)::Union{XYcurveObj, Nothing}
    obj_get_obj(obj,_PropertyIndex.PLoss, XYcurveObj)
end

"""
Name of the XYCurve object describing the active power losses in pct versus the wind speed.

Name: `PLoss`

(Setter)
"""
function PLoss(obj::Obj, value::Union{XYcurveObj, Nothing}, flags::SetterFlagsT=SetterFlagsT(0))
    obj_set_obj(obj, _PropertyIndex.PLoss, value, flags)
end

"""
Name of the XYCurve object describing the active power losses in pct versus the wind speed.

Name: `PLoss`

(Setter)
"""
function PLoss(obj::Obj, value::String, flags::SetterFlagsT=SetterFlagsT(0))
    obj_set_str(obj, _PropertyIndex.PLoss, value, flags)
end

"""
Rotor radius in meters.

Name: `Rad`
Default: 40.0

(Getter)
"""
function Rad(obj::Obj)::Float64
    obj_get_float64(obj, _PropertyIndex.Rad)
end

"""
Rotor radius in meters.

Name: `Rad`
Default: 40.0

(Setter)
"""
function Rad(obj::Obj, value::Float64, flags::SetterFlagsT=SetterFlagsT(0))
    obj_set_float64(obj, _PropertyIndex.Rad, value, flags)
end

"""
Cut-in speed for the wind generator.

Name: `VCutIn`
Default: 5.0

(Getter)
"""
function VCutIn(obj::Obj)::Float64
    obj_get_float64(obj, _PropertyIndex.VCutIn)
end

"""
Cut-in speed for the wind generator.

Name: `VCutIn`
Default: 5.0

(Setter)
"""
function VCutIn(obj::Obj, value::Float64, flags::SetterFlagsT=SetterFlagsT(0))
    obj_set_float64(obj, _PropertyIndex.VCutIn, value, flags)
end

"""
Cut-out speed for the wind generator.

Name: `VCutOut`
Default: 23.0

(Getter)
"""
function VCutOut(obj::Obj)::Float64
    obj_get_float64(obj, _PropertyIndex.VCutOut)
end

"""
Cut-out speed for the wind generator.

Name: `VCutOut`
Default: 23.0

(Setter)
"""
function VCutOut(obj::Obj, value::Float64, flags::SetterFlagsT=SetterFlagsT(0))
    obj_set_float64(obj, _PropertyIndex.VCutOut, value, flags)
end

"""
Name of harmonic voltage or current spectrum for this WindGen.
Voltage behind Xd" for machine - default. Current injection for inverter.

Name: `Spectrum`
Default: defaultgen

(Getter)
"""
function Spectrum_str(obj::Obj)::String
    obj_get_str(obj, _PropertyIndex.Spectrum)
end

"""
Name of harmonic voltage or current spectrum for this WindGen.
Voltage behind Xd" for machine - default. Current injection for inverter.

Name: `Spectrum`
Default: defaultgen

(Setter)
"""
function Spectrum_str(obj::Obj, value::String, flags::SetterFlagsT=SetterFlagsT(0))
    obj_set_str(obj, _PropertyIndex.Spectrum, value, flags)
end

"""
Name of harmonic voltage or current spectrum for this WindGen.
Voltage behind Xd" for machine - default. Current injection for inverter.

Name: `Spectrum`
Default: defaultgen

(Getter)
"""
function Spectrum(obj)::Union{SpectrumObj, Nothing}
    obj_get_obj(obj,_PropertyIndex.Spectrum, SpectrumObj)
end

"""
Name of harmonic voltage or current spectrum for this WindGen.
Voltage behind Xd" for machine - default. Current injection for inverter.

Name: `Spectrum`
Default: defaultgen

(Setter)
"""
function Spectrum(obj::Obj, value::Union{SpectrumObj, Nothing}, flags::SetterFlagsT=SetterFlagsT(0))
    obj_set_obj(obj, _PropertyIndex.Spectrum, value, flags)
end

"""
Name of harmonic voltage or current spectrum for this WindGen.
Voltage behind Xd" for machine - default. Current injection for inverter.

Name: `Spectrum`
Default: defaultgen

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

end # module WindGen
export WindGen
