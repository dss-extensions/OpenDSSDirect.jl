module Generator
using ..Enums.SetterFlags: SetterFlagsT
using ..Enums: Connection, GeneratorDispatchMode, GeneratorModel, GeneratorStatus
using ..DynamicExp: DynamicExpObj
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


const _cls_name = "Generator"
const _cls_idx = 27

module _PropertyIndex
const Phases = Int32(1)
const Bus1 = Int32(2)
const kV = Int32(3)
const kW = Int32(4)
const PF = Int32(5)
const kvar = Int32(6)
const Model = Int32(7)
const VMinpu = Int32(8)
const VMaxpu = Int32(9)
const Yearly = Int32(10)
const Daily = Int32(11)
const Duty = Int32(12)
const DispMode = Int32(13)
const DispValue = Int32(14)
const Conn = Int32(15)
const Status = Int32(16)
const Class = Int32(17)
const Vpu = Int32(18)
const Maxkvar = Int32(19)
const Minkvar = Int32(20)
const PVFactor = Int32(21)
const ForceOn = Int32(22)
const kVA = Int32(23)
const MVA = Int32(24)
const Xd = Int32(25)
const Xdp = Int32(26)
const Xdpp = Int32(27)
const H = Int32(28)
const D = Int32(29)
const UserModel = Int32(30)
const UserData = Int32(31)
const ShaftModel = Int32(32)
const ShaftData = Int32(33)
const DutyStart = Int32(34)
const DebugTrace = Int32(35)
const Balanced = Int32(36)
const XRdp = Int32(37)
const UseFuel = Int32(38)
const FuelkWh = Int32(39)
const pctFuel = Int32(40)
const pctReserve = Int32(41)
const Refuel = Int32(42)
const DynamicEq = Int32(43)
const DynOut = Int32(44)
const Spectrum = Int32(45)
const BaseFreq = Int32(46)
const Enabled = Int32(47)
const Like = Int32(48)
end

struct GeneratorObj <: AbstractPCElement
    ptr::Ptr{Cvoid}
    dss::DSSContext
end
export GeneratorObj
Common._wrap_dss_obj(::Val{_cls_idx}, ptr::Ptr{Cvoid}, dss::DSSContext) = GeneratorObj(ptr, dss)
const Obj = GeneratorObj

function Base.show(io::IO, obj::GeneratorObj) 
    name = obj_get_str(obj, obj.dss.capi.Obj_GetFullName)
    print(name)
end


include("dss_object.jl")
include("ce_registers.jl")


"""
Number of Phases, this Generator.  Power is evenly divided among phases.

Name: `Phases`
Default: 3

(Getter)
"""
function Phases(obj::Obj)::Int32
    obj_get_int32(obj, _PropertyIndex.Phases)
end

"""
Number of Phases, this Generator.  Power is evenly divided among phases.

Name: `Phases`
Default: 3

(Setter)
"""
function Phases(obj::Obj, value::Int32, flags::SetterFlagsT=SetterFlagsT(0))
    obj_set_int32(obj, _PropertyIndex.Phases, value, flags)
end

"""
Bus to which the Generator is connected.  May include specific node specification.

Name: `Bus1`

(Getter)
"""
function Bus1(obj::Obj)::String
    obj_get_str(obj, _PropertyIndex.Bus1)
end

"""
Bus to which the Generator is connected.  May include specific node specification.

Name: `Bus1`

(Setter)
"""
function Bus1(obj::Obj, value::String, flags::SetterFlagsT=SetterFlagsT(0))
    obj_set_str(obj, _PropertyIndex.Bus1, value, flags)
end

"""
Nominal rated (1.0 per unit) voltage, kV, for Generator. For 2- and 3-phase Generators, specify phase-phase kV. Otherwise, for phases=1 or phases>3, specify actual kV across each branch of the Generator. If wye (star), specify phase-neutral kV. If delta or phase-phase connected, specify phase-phase kV.

Name: `kV`
Units: kV
Default: 12.47

(Getter)
"""
function kV(obj::Obj)::Float64
    obj_get_float64(obj, _PropertyIndex.kV)
end

"""
Nominal rated (1.0 per unit) voltage, kV, for Generator. For 2- and 3-phase Generators, specify phase-phase kV. Otherwise, for phases=1 or phases>3, specify actual kV across each branch of the Generator. If wye (star), specify phase-neutral kV. If delta or phase-phase connected, specify phase-phase kV.

Name: `kV`
Units: kV
Default: 12.47

(Setter)
"""
function kV(obj::Obj, value::Float64, flags::SetterFlagsT=SetterFlagsT(0))
    obj_set_float64(obj, _PropertyIndex.kV, value, flags)
end

"""
Total base kW for the Generator.  A positive value denotes power coming OUT of the element, 
which is the opposite of a load. This value is modified depending on the dispatch mode. Unaffected by the global load multiplier and growth curves. If you want there to be more generation, you must add more generators or change this value.

Name: `kW`
Units: kW
Default: 1000.0

(Getter)
"""
function kW(obj::Obj)::Float64
    obj_get_float64(obj, _PropertyIndex.kW)
end

"""
Total base kW for the Generator.  A positive value denotes power coming OUT of the element, 
which is the opposite of a load. This value is modified depending on the dispatch mode. Unaffected by the global load multiplier and growth curves. If you want there to be more generation, you must add more generators or change this value.

Name: `kW`
Units: kW
Default: 1000.0

(Setter)
"""
function kW(obj::Obj, value::Float64, flags::SetterFlagsT=SetterFlagsT(0))
    obj_set_float64(obj, _PropertyIndex.kW, value, flags)
end

"""
Generator power factor. Enter negative for leading powerfactor (when kW and kvar have opposite signs.)
A positive power factor for a generator signifies that the generator produces vars 
as is typical for a synchronous generator.  Induction machines would be 
specified with a negative power factor.

Name: `PF`
Default: 0.88

(Getter)
"""
function PF(obj::Obj)::Float64
    obj_get_float64(obj, _PropertyIndex.PF)
end

"""
Generator power factor. Enter negative for leading powerfactor (when kW and kvar have opposite signs.)
A positive power factor for a generator signifies that the generator produces vars 
as is typical for a synchronous generator.  Induction machines would be 
specified with a negative power factor.

Name: `PF`
Default: 0.88

(Setter)
"""
function PF(obj::Obj, value::Float64, flags::SetterFlagsT=SetterFlagsT(0))
    obj_set_float64(obj, _PropertyIndex.PF, value, flags)
end

"""
Specify the base kvar.  Alternative to specifying the power factor.  Side effect:  the power factor value is altered to agree based on present value of kW.

Name: `kvar`
Units: kvar

(Getter)
"""
function kvar(obj::Obj)::Float64
    obj_get_float64(obj, _PropertyIndex.kvar)
end

"""
Specify the base kvar.  Alternative to specifying the power factor.  Side effect:  the power factor value is altered to agree based on present value of kW.

Name: `kvar`
Units: kvar

(Setter)
"""
function kvar(obj::Obj, value::Float64, flags::SetterFlagsT=SetterFlagsT(0))
    obj_set_float64(obj, _PropertyIndex.kvar, value, flags)
end

"""
Integer code for the model to use for generation variation with voltage. Valid values are:

- 1: Generator injects a constant kW at specified power factor.
- 2: Generator is modeled as a constant admittance.
- 3: Const kW, constant kV.  Somewhat like a conventional transmission power flow P-V generator.
- 4: Const kW, Fixed Q (Q never varies)
- 5: Const kW, Fixed Q(as a constant reactance)
- 6: Compute load injection from User-written Model.(see usage of Xd, Xdp)
- 7: Constant kW, kvar, but current-limited below Vminpu. Approximates a simple inverter. See also Balanced.

Name: `Model`
Default: 1

(Getter)
"""
function Model(obj)::GeneratorModel.T
    GeneratorModel.T(obj_get_int32(obj, _PropertyIndex.Model))
end

"""
Integer code for the model to use for generation variation with voltage. Valid values are:

- 1: Generator injects a constant kW at specified power factor.
- 2: Generator is modeled as a constant admittance.
- 3: Const kW, constant kV.  Somewhat like a conventional transmission power flow P-V generator.
- 4: Const kW, Fixed Q (Q never varies)
- 5: Const kW, Fixed Q(as a constant reactance)
- 6: Compute load injection from User-written Model.(see usage of Xd, Xdp)
- 7: Constant kW, kvar, but current-limited below Vminpu. Approximates a simple inverter. See also Balanced.

Name: `Model`
Default: 1

(Setter)
"""
function Model(obj::Obj, value::Union{Int,GeneratorModel.T}, flags::SetterFlagsT=SetterFlagsT(0))
    obj_set_int32(obj, _PropertyIndex.Model, value, flags)
end

"""
Minimum per unit voltage for which the Model is assumed to apply. Below this value, the load model reverts to a constant impedance model. For model 7, the current is limited to the value computed for constant power at Vminpu.

Name: `VMinpu`
Default: 0.9

(Getter)
"""
function VMinpu(obj::Obj)::Float64
    obj_get_float64(obj, _PropertyIndex.VMinpu)
end

"""
Minimum per unit voltage for which the Model is assumed to apply. Below this value, the load model reverts to a constant impedance model. For model 7, the current is limited to the value computed for constant power at Vminpu.

Name: `VMinpu`
Default: 0.9

(Setter)
"""
function VMinpu(obj::Obj, value::Float64, flags::SetterFlagsT=SetterFlagsT(0))
    obj_set_float64(obj, _PropertyIndex.VMinpu, value, flags)
end

"""
Maximum per unit voltage for which the Model is assumed to apply. Above this value, the load model reverts to a constant impedance model.

Name: `VMaxpu`
Default: 1.1

(Getter)
"""
function VMaxpu(obj::Obj)::Float64
    obj_get_float64(obj, _PropertyIndex.VMaxpu)
end

"""
Maximum per unit voltage for which the Model is assumed to apply. Above this value, the load model reverts to a constant impedance model.

Name: `VMaxpu`
Default: 1.1

(Setter)
"""
function VMaxpu(obj::Obj, value::Float64, flags::SetterFlagsT=SetterFlagsT(0))
    obj_set_float64(obj, _PropertyIndex.VMaxpu, value, flags)
end

"""
Dispatch shape to use for yearly simulations.  Must be previously defined as a Loadshape object. If this is not specified, a constant value is assumed (no variation). If the generator is assumed to be ON continuously, specify Status=FIXED, or designate a curve that is 1.0 per unit at all times. Set to NONE to reset to no loadshape. Nominally for 8760 simulations.  If there are fewer points in the designated shape than the number of points in the solution, the curve is repeated.

Name: `Yearly`

(Getter)
"""
function Yearly_str(obj::Obj)::String
    obj_get_str(obj, _PropertyIndex.Yearly)
end

"""
Dispatch shape to use for yearly simulations.  Must be previously defined as a Loadshape object. If this is not specified, a constant value is assumed (no variation). If the generator is assumed to be ON continuously, specify Status=FIXED, or designate a curve that is 1.0 per unit at all times. Set to NONE to reset to no loadshape. Nominally for 8760 simulations.  If there are fewer points in the designated shape than the number of points in the solution, the curve is repeated.

Name: `Yearly`

(Setter)
"""
function Yearly_str(obj::Obj, value::String, flags::SetterFlagsT=SetterFlagsT(0))
    obj_set_str(obj, _PropertyIndex.Yearly, value, flags)
end

"""
Dispatch shape to use for yearly simulations.  Must be previously defined as a Loadshape object. If this is not specified, a constant value is assumed (no variation). If the generator is assumed to be ON continuously, specify Status=FIXED, or designate a curve that is 1.0 per unit at all times. Set to NONE to reset to no loadshape. Nominally for 8760 simulations.  If there are fewer points in the designated shape than the number of points in the solution, the curve is repeated.

Name: `Yearly`

(Getter)
"""
function Yearly(obj)::Union{LoadShapeObj, Nothing}
    obj_get_obj(obj,_PropertyIndex.Yearly, LoadShapeObj)
end

"""
Dispatch shape to use for yearly simulations.  Must be previously defined as a Loadshape object. If this is not specified, a constant value is assumed (no variation). If the generator is assumed to be ON continuously, specify Status=FIXED, or designate a curve that is 1.0 per unit at all times. Set to NONE to reset to no loadshape. Nominally for 8760 simulations.  If there are fewer points in the designated shape than the number of points in the solution, the curve is repeated.

Name: `Yearly`

(Setter)
"""
function Yearly(obj::Obj, value::Union{LoadShapeObj, Nothing}, flags::SetterFlagsT=SetterFlagsT(0))
    obj_set_obj(obj, _PropertyIndex.Yearly, value, flags)
end

"""
Dispatch shape to use for yearly simulations.  Must be previously defined as a Loadshape object. If this is not specified, a constant value is assumed (no variation). If the generator is assumed to be ON continuously, specify Status=FIXED, or designate a curve that is 1.0 per unit at all times. Set to NONE to reset to no loadshape. Nominally for 8760 simulations.  If there are fewer points in the designated shape than the number of points in the solution, the curve is repeated.

Name: `Yearly`

(Setter)
"""
function Yearly(obj::Obj, value::String, flags::SetterFlagsT=SetterFlagsT(0))
    obj_set_str(obj, _PropertyIndex.Yearly, value, flags)
end

"""
Dispatch shape to use for daily simulations.  Must be previously defined as a Loadshape object of 24 hrs, typically.  If generator is assumed to be ON continuously, specify Status=FIXED, or designate a Loadshape object that is 1.0 per unit for all hours. Set to NONE to reset to no loadshape. 

Name: `Daily`

(Getter)
"""
function Daily_str(obj::Obj)::String
    obj_get_str(obj, _PropertyIndex.Daily)
end

"""
Dispatch shape to use for daily simulations.  Must be previously defined as a Loadshape object of 24 hrs, typically.  If generator is assumed to be ON continuously, specify Status=FIXED, or designate a Loadshape object that is 1.0 per unit for all hours. Set to NONE to reset to no loadshape. 

Name: `Daily`

(Setter)
"""
function Daily_str(obj::Obj, value::String, flags::SetterFlagsT=SetterFlagsT(0))
    obj_set_str(obj, _PropertyIndex.Daily, value, flags)
end

"""
Dispatch shape to use for daily simulations.  Must be previously defined as a Loadshape object of 24 hrs, typically.  If generator is assumed to be ON continuously, specify Status=FIXED, or designate a Loadshape object that is 1.0 per unit for all hours. Set to NONE to reset to no loadshape. 

Name: `Daily`

(Getter)
"""
function Daily(obj)::Union{LoadShapeObj, Nothing}
    obj_get_obj(obj,_PropertyIndex.Daily, LoadShapeObj)
end

"""
Dispatch shape to use for daily simulations.  Must be previously defined as a Loadshape object of 24 hrs, typically.  If generator is assumed to be ON continuously, specify Status=FIXED, or designate a Loadshape object that is 1.0 per unit for all hours. Set to NONE to reset to no loadshape. 

Name: `Daily`

(Setter)
"""
function Daily(obj::Obj, value::Union{LoadShapeObj, Nothing}, flags::SetterFlagsT=SetterFlagsT(0))
    obj_set_obj(obj, _PropertyIndex.Daily, value, flags)
end

"""
Dispatch shape to use for daily simulations.  Must be previously defined as a Loadshape object of 24 hrs, typically.  If generator is assumed to be ON continuously, specify Status=FIXED, or designate a Loadshape object that is 1.0 per unit for all hours. Set to NONE to reset to no loadshape. 

Name: `Daily`

(Setter)
"""
function Daily(obj::Obj, value::String, flags::SetterFlagsT=SetterFlagsT(0))
    obj_set_str(obj, _PropertyIndex.Daily, value, flags)
end

"""
Load shape to use for duty cycle dispatch simulations such as for wind generation. Must be previously defined as a Loadshape object. Typically would have time intervals less than 1 hr -- perhaps, in seconds. Set Status=Fixed to ignore Loadshape designation. Set to NONE to reset to no loadshape. Designate the number of points to solve using the Set Number=xxxx command. If there are fewer points in the actual shape, the shape is assumed to repeat.

Name: `Duty`

(Getter)
"""
function Duty_str(obj::Obj)::String
    obj_get_str(obj, _PropertyIndex.Duty)
end

"""
Load shape to use for duty cycle dispatch simulations such as for wind generation. Must be previously defined as a Loadshape object. Typically would have time intervals less than 1 hr -- perhaps, in seconds. Set Status=Fixed to ignore Loadshape designation. Set to NONE to reset to no loadshape. Designate the number of points to solve using the Set Number=xxxx command. If there are fewer points in the actual shape, the shape is assumed to repeat.

Name: `Duty`

(Setter)
"""
function Duty_str(obj::Obj, value::String, flags::SetterFlagsT=SetterFlagsT(0))
    obj_set_str(obj, _PropertyIndex.Duty, value, flags)
end

"""
Load shape to use for duty cycle dispatch simulations such as for wind generation. Must be previously defined as a Loadshape object. Typically would have time intervals less than 1 hr -- perhaps, in seconds. Set Status=Fixed to ignore Loadshape designation. Set to NONE to reset to no loadshape. Designate the number of points to solve using the Set Number=xxxx command. If there are fewer points in the actual shape, the shape is assumed to repeat.

Name: `Duty`

(Getter)
"""
function Duty(obj)::Union{LoadShapeObj, Nothing}
    obj_get_obj(obj,_PropertyIndex.Duty, LoadShapeObj)
end

"""
Load shape to use for duty cycle dispatch simulations such as for wind generation. Must be previously defined as a Loadshape object. Typically would have time intervals less than 1 hr -- perhaps, in seconds. Set Status=Fixed to ignore Loadshape designation. Set to NONE to reset to no loadshape. Designate the number of points to solve using the Set Number=xxxx command. If there are fewer points in the actual shape, the shape is assumed to repeat.

Name: `Duty`

(Setter)
"""
function Duty(obj::Obj, value::Union{LoadShapeObj, Nothing}, flags::SetterFlagsT=SetterFlagsT(0))
    obj_set_obj(obj, _PropertyIndex.Duty, value, flags)
end

"""
Load shape to use for duty cycle dispatch simulations such as for wind generation. Must be previously defined as a Loadshape object. Typically would have time intervals less than 1 hr -- perhaps, in seconds. Set Status=Fixed to ignore Loadshape designation. Set to NONE to reset to no loadshape. Designate the number of points to solve using the Set Number=xxxx command. If there are fewer points in the actual shape, the shape is assumed to repeat.

Name: `Duty`

(Setter)
"""
function Duty(obj::Obj, value::String, flags::SetterFlagsT=SetterFlagsT(0))
    obj_set_str(obj, _PropertyIndex.Duty, value, flags)
end

"""
Dispatch mode. In default mode, the generator is either always on or follows dispatch curve as specified. Otherwise, the gen comes on when either the global default load level (Loadshape "default") or the price level exceeds the dispatch value.

Name: `DispMode`
Default: Default

(Getter)
"""
function DispMode(obj::Obj)::GeneratorDispatchMode.T
    GeneratorDispatchMode.T(obj_get_int32(obj, _PropertyIndex.DispMode))
end

"""
Dispatch mode. In default mode, the generator is either always on or follows dispatch curve as specified. Otherwise, the gen comes on when either the global default load level (Loadshape "default") or the price level exceeds the dispatch value.

Name: `DispMode`
Default: Default

(Setter)
"""
function DispMode(obj::Obj, value::String, flags::SetterFlagsT=SetterFlagsT(0))
    obj_set_str(obj, _PropertyIndex.DispMode, value, flags)
end

"""
Dispatch mode. In default mode, the generator is either always on or follows dispatch curve as specified. Otherwise, the gen comes on when either the global default load level (Loadshape "default") or the price level exceeds the dispatch value.

Name: `DispMode`
Default: Default

(Setter)
"""
function DispMode(obj::Obj, value::Union{Int,GeneratorDispatchMode.T}, flags::SetterFlagsT=SetterFlagsT(0))
    obj_set_int32(obj, _PropertyIndex.DispMode, Int32(value), flags)
end

"""
Dispatch mode. In default mode, the generator is either always on or follows dispatch curve as specified. Otherwise, the gen comes on when either the global default load level (Loadshape "default") or the price level exceeds the dispatch value.

Name: `DispMode`
Default: Default

(Getter)
"""
function DispMode_str(obj::Obj)::String
    obj_get_str(obj, _PropertyIndex.DispMode)
end

"""
Dispatch mode. In default mode, the generator is either always on or follows dispatch curve as specified. Otherwise, the gen comes on when either the global default load level (Loadshape "default") or the price level exceeds the dispatch value.

Name: `DispMode`
Default: Default

(Setter)
"""
function DispMode_str(obj::Obj, value::String, flags::SetterFlagsT=SetterFlagsT(0))
    DispMode(obj, value, flags)
end

"""
Dispatch value. 
If = 0 (default) then Generator follow dispatch curves, if any. 
If > 0  then Generator is ON only when either the price signal (in Price dispatch mode) exceeds this value or the active circuit load multiplier × "default" loadshape value * the default yearly growth factor exceeds this value.  Then the generator follows dispatch curves (duty, daily, or yearly), if any (see also Status).

Name: `DispValue`
Default: 0.0

(Getter)
"""
function DispValue(obj::Obj)::Float64
    obj_get_float64(obj, _PropertyIndex.DispValue)
end

"""
Dispatch value. 
If = 0 (default) then Generator follow dispatch curves, if any. 
If > 0  then Generator is ON only when either the price signal (in Price dispatch mode) exceeds this value or the active circuit load multiplier × "default" loadshape value * the default yearly growth factor exceeds this value.  Then the generator follows dispatch curves (duty, daily, or yearly), if any (see also Status).

Name: `DispValue`
Default: 0.0

(Setter)
"""
function DispValue(obj::Obj, value::Float64, flags::SetterFlagsT=SetterFlagsT(0))
    obj_set_float64(obj, _PropertyIndex.DispValue, value, flags)
end

"""
Generator connection. Default is wye.

Name: `Conn`
Default: Wye

(Getter)
"""
function Conn(obj::Obj)::Connection.T
    Connection.T(obj_get_int32(obj, _PropertyIndex.Conn))
end

"""
Generator connection. Default is wye.

Name: `Conn`
Default: Wye

(Setter)
"""
function Conn(obj::Obj, value::String, flags::SetterFlagsT=SetterFlagsT(0))
    obj_set_str(obj, _PropertyIndex.Conn, value, flags)
end

"""
Generator connection. Default is wye.

Name: `Conn`
Default: Wye

(Setter)
"""
function Conn(obj::Obj, value::Union{Int,Connection.T}, flags::SetterFlagsT=SetterFlagsT(0))
    obj_set_int32(obj, _PropertyIndex.Conn, Int32(value), flags)
end

"""
Generator connection. Default is wye.

Name: `Conn`
Default: Wye

(Getter)
"""
function Conn_str(obj::Obj)::String
    obj_get_str(obj, _PropertyIndex.Conn)
end

"""
Generator connection. Default is wye.

Name: `Conn`
Default: Wye

(Setter)
"""
function Conn_str(obj::Obj, value::String, flags::SetterFlagsT=SetterFlagsT(0))
    Conn(obj, value, flags)
end

"""
If Fixed, then dispatch multipliers do not apply. The generator is alway at full power when it is ON.  Default is Variable  (follows curves).

Name: `Status`
Default: Variable

(Getter)
"""
function Status(obj::Obj)::GeneratorStatus.T
    GeneratorStatus.T(obj_get_int32(obj, _PropertyIndex.Status))
end

"""
If Fixed, then dispatch multipliers do not apply. The generator is alway at full power when it is ON.  Default is Variable  (follows curves).

Name: `Status`
Default: Variable

(Setter)
"""
function Status(obj::Obj, value::String, flags::SetterFlagsT=SetterFlagsT(0))
    obj_set_str(obj, _PropertyIndex.Status, value, flags)
end

"""
If Fixed, then dispatch multipliers do not apply. The generator is alway at full power when it is ON.  Default is Variable  (follows curves).

Name: `Status`
Default: Variable

(Setter)
"""
function Status(obj::Obj, value::Union{Int,GeneratorStatus.T}, flags::SetterFlagsT=SetterFlagsT(0))
    obj_set_int32(obj, _PropertyIndex.Status, Int32(value), flags)
end

"""
If Fixed, then dispatch multipliers do not apply. The generator is alway at full power when it is ON.  Default is Variable  (follows curves).

Name: `Status`
Default: Variable

(Getter)
"""
function Status_str(obj::Obj)::String
    obj_get_str(obj, _PropertyIndex.Status)
end

"""
If Fixed, then dispatch multipliers do not apply. The generator is alway at full power when it is ON.  Default is Variable  (follows curves).

Name: `Status`
Default: Variable

(Setter)
"""
function Status_str(obj::Obj, value::String, flags::SetterFlagsT=SetterFlagsT(0))
    Status(obj, value, flags)
end

"""
An arbitrary integer number representing the class of Generator so that Generator values may be segregated by class.

Name: `Class`
Default: 1

(Getter)
"""
function Class(obj::Obj)::Int32
    obj_get_int32(obj, _PropertyIndex.Class)
end

"""
An arbitrary integer number representing the class of Generator so that Generator values may be segregated by class.

Name: `Class`
Default: 1

(Setter)
"""
function Class(obj::Obj, value::Int32, flags::SetterFlagsT=SetterFlagsT(0))
    obj_set_int32(obj, _PropertyIndex.Class, value, flags)
end

"""
Per Unit voltage set point for Model = 3  (typical power flow model).

Name: `Vpu`
Default: 1.0

(Getter)
"""
function Vpu(obj::Obj)::Float64
    obj_get_float64(obj, _PropertyIndex.Vpu)
end

"""
Per Unit voltage set point for Model = 3  (typical power flow model).

Name: `Vpu`
Default: 1.0

(Setter)
"""
function Vpu(obj::Obj, value::Float64, flags::SetterFlagsT=SetterFlagsT(0))
    obj_set_float64(obj, _PropertyIndex.Vpu, value, flags)
end

"""
Maximum kvar limit for Model = 3.  Defaults to twice the specified load kvar.  Always reset this if you change PF or kvar properties.

Name: `Maxkvar`

(Getter)
"""
function Maxkvar(obj::Obj)::Float64
    obj_get_float64(obj, _PropertyIndex.Maxkvar)
end

"""
Maximum kvar limit for Model = 3.  Defaults to twice the specified load kvar.  Always reset this if you change PF or kvar properties.

Name: `Maxkvar`

(Setter)
"""
function Maxkvar(obj::Obj, value::Float64, flags::SetterFlagsT=SetterFlagsT(0))
    obj_set_float64(obj, _PropertyIndex.Maxkvar, value, flags)
end

"""
Minimum kvar limit for Model = 3. Enter a negative number if generator can absorb vars. Defaults to negative of Maxkvar.  Always reset this if you change PF or kvar properties.

Name: `Minkvar`

(Getter)
"""
function Minkvar(obj::Obj)::Float64
    obj_get_float64(obj, _PropertyIndex.Minkvar)
end

"""
Minimum kvar limit for Model = 3. Enter a negative number if generator can absorb vars. Defaults to negative of Maxkvar.  Always reset this if you change PF or kvar properties.

Name: `Minkvar`

(Setter)
"""
function Minkvar(obj::Obj, value::Float64, flags::SetterFlagsT=SetterFlagsT(0))
    obj_set_float64(obj, _PropertyIndex.Minkvar, value, flags)
end

"""
Deceleration factor for P-V generator model (Model=3).  Default is 0.1. If the circuit converges easily, you may want to use a higher number such as 1.0. Use a lower number if solution diverges. Use Debugtrace=yes to create a file that will trace the convergence of a generator model.

Name: `PVFactor`
Default: 0.1

(Getter)
"""
function PVFactor(obj::Obj)::Float64
    obj_get_float64(obj, _PropertyIndex.PVFactor)
end

"""
Deceleration factor for P-V generator model (Model=3).  Default is 0.1. If the circuit converges easily, you may want to use a higher number such as 1.0. Use a lower number if solution diverges. Use Debugtrace=yes to create a file that will trace the convergence of a generator model.

Name: `PVFactor`
Default: 0.1

(Setter)
"""
function PVFactor(obj::Obj, value::Float64, flags::SetterFlagsT=SetterFlagsT(0))
    obj_set_float64(obj, _PropertyIndex.PVFactor, value, flags)
end

"""
Forces generator ON despite requirements of other dispatch modes. Stays ON until this property is set to NO, or an internal algorithm cancels the forced ON state.

Name: `ForceOn`
Default: False

(Getter)
"""
function ForceOn(obj::Obj)::Bool
    return obj_get_bool(obj, _PropertyIndex.ForceOn)
end

"""
Forces generator ON despite requirements of other dispatch modes. Stays ON until this property is set to NO, or an internal algorithm cancels the forced ON state.

Name: `ForceOn`
Default: False

(Setter)
"""
function ForceOn(obj::Obj, value::Bool, flags::SetterFlagsT=SetterFlagsT(0))
    obj_set_bool(obj, _PropertyIndex.ForceOn, value, flags)
end

"""
kVA rating of electrical machine. Defaults to 1.2 × kW if not specified. Applied to machine or inverter definition for Dynamics mode solutions. 

Name: `kVA`

(Getter)
"""
function kVA(obj::Obj)::Float64
    obj_get_float64(obj, _PropertyIndex.kVA)
end

"""
kVA rating of electrical machine. Defaults to 1.2 × kW if not specified. Applied to machine or inverter definition for Dynamics mode solutions. 

Name: `kVA`

(Setter)
"""
function kVA(obj::Obj, value::Float64, flags::SetterFlagsT=SetterFlagsT(0))
    obj_set_float64(obj, _PropertyIndex.kVA, value, flags)
end

"""
Per unit synchronous reactance of machine. Presently used only for Thévenin impedance for power flow calcs of user models (model=6). Typically use a value 0.4 to 1.0. Default is 1.0

Name: `Xd`
Default: 1.0

(Getter)
"""
function Xd(obj::Obj)::Float64
    obj_get_float64(obj, _PropertyIndex.Xd)
end

"""
Per unit synchronous reactance of machine. Presently used only for Thévenin impedance for power flow calcs of user models (model=6). Typically use a value 0.4 to 1.0. Default is 1.0

Name: `Xd`
Default: 1.0

(Setter)
"""
function Xd(obj::Obj, value::Float64, flags::SetterFlagsT=SetterFlagsT(0))
    obj_set_float64(obj, _PropertyIndex.Xd, value, flags)
end

"""
Per unit transient reactance of the machine.  Used for Dynamics mode and Fault studies.  Default is 0.27.For user models, this value is used for the Thévenin/Norton impedance for Dynamics Mode.

Name: `Xdp`
Default: 0.28

(Getter)
"""
function Xdp(obj::Obj)::Float64
    obj_get_float64(obj, _PropertyIndex.Xdp)
end

"""
Per unit transient reactance of the machine.  Used for Dynamics mode and Fault studies.  Default is 0.27.For user models, this value is used for the Thévenin/Norton impedance for Dynamics Mode.

Name: `Xdp`
Default: 0.28

(Setter)
"""
function Xdp(obj::Obj, value::Float64, flags::SetterFlagsT=SetterFlagsT(0))
    obj_set_float64(obj, _PropertyIndex.Xdp, value, flags)
end

"""
Per unit subtransient reactance of the machine.  Used for Harmonics. Default is 0.20.

Name: `Xdpp`
Default: 0.2

(Getter)
"""
function Xdpp(obj::Obj)::Float64
    obj_get_float64(obj, _PropertyIndex.Xdpp)
end

"""
Per unit subtransient reactance of the machine.  Used for Harmonics. Default is 0.20.

Name: `Xdpp`
Default: 0.2

(Setter)
"""
function Xdpp(obj::Obj, value::Float64, flags::SetterFlagsT=SetterFlagsT(0))
    obj_set_float64(obj, _PropertyIndex.Xdpp, value, flags)
end

"""
Per unit mass constant of the machine.  MW-sec/MVA.  Default is 1.0.

Name: `H`
Default: 1.0

(Getter)
"""
function H(obj::Obj)::Float64
    obj_get_float64(obj, _PropertyIndex.H)
end

"""
Per unit mass constant of the machine.  MW-sec/MVA.  Default is 1.0.

Name: `H`
Default: 1.0

(Setter)
"""
function H(obj::Obj, value::Float64, flags::SetterFlagsT=SetterFlagsT(0))
    obj_set_float64(obj, _PropertyIndex.H, value, flags)
end

"""
Damping constant.  Usual range is 0 to 4. Default is 1.0.  Adjust to get damping

Name: `D`
Default: 1.0

(Getter)
"""
function D(obj::Obj)::Float64
    obj_get_float64(obj, _PropertyIndex.D)
end

"""
Damping constant.  Usual range is 0 to 4. Default is 1.0.  Adjust to get damping

Name: `D`
Default: 1.0

(Setter)
"""
function D(obj::Obj, value::Float64, flags::SetterFlagsT=SetterFlagsT(0))
    obj_set_float64(obj, _PropertyIndex.D, value, flags)
end

"""
Name of DLL containing user-written model, which computes the terminal currents for Dynamics studies, overriding the default model.  Set to "none" to negate previous setting.

Name: `UserModel`

(Getter)
"""
function UserModel(obj::Obj)::String
    obj_get_str(obj, _PropertyIndex.UserModel)
end

"""
Name of DLL containing user-written model, which computes the terminal currents for Dynamics studies, overriding the default model.  Set to "none" to negate previous setting.

Name: `UserModel`

(Setter)
"""
function UserModel(obj::Obj, value::String, flags::SetterFlagsT=SetterFlagsT(0))
    obj_set_str(obj, _PropertyIndex.UserModel, value, flags)
end

"""
String (in quotes or parentheses) that gets passed to user-written model for defining the data required for that model.

Name: `UserData`

(Getter)
"""
function UserData(obj::Obj)::String
    obj_get_str(obj, _PropertyIndex.UserData)
end

"""
String (in quotes or parentheses) that gets passed to user-written model for defining the data required for that model.

Name: `UserData`

(Setter)
"""
function UserData(obj::Obj, value::String, flags::SetterFlagsT=SetterFlagsT(0))
    obj_set_str(obj, _PropertyIndex.UserData, value, flags)
end

"""
Name of user-written DLL containing a Shaft model, which models the prime mover and determines the power on the shaft for Dynamics studies. Models additional mass elements other than the single-mass model in the DSS default model. Set to "none" to negate previous setting.

Name: `ShaftModel`

(Getter)
"""
function ShaftModel(obj::Obj)::String
    obj_get_str(obj, _PropertyIndex.ShaftModel)
end

"""
Name of user-written DLL containing a Shaft model, which models the prime mover and determines the power on the shaft for Dynamics studies. Models additional mass elements other than the single-mass model in the DSS default model. Set to "none" to negate previous setting.

Name: `ShaftModel`

(Setter)
"""
function ShaftModel(obj::Obj, value::String, flags::SetterFlagsT=SetterFlagsT(0))
    obj_set_str(obj, _PropertyIndex.ShaftModel, value, flags)
end

"""
String (in quotes or parentheses) that gets passed to user-written shaft dynamic model for defining the data for that model.

Name: `ShaftData`

(Getter)
"""
function ShaftData(obj::Obj)::String
    obj_get_str(obj, _PropertyIndex.ShaftData)
end

"""
String (in quotes or parentheses) that gets passed to user-written shaft dynamic model for defining the data for that model.

Name: `ShaftData`

(Setter)
"""
function ShaftData(obj::Obj, value::String, flags::SetterFlagsT=SetterFlagsT(0))
    obj_set_str(obj, _PropertyIndex.ShaftData, value, flags)
end

"""
Starting time offset [hours] into the duty cycle shape for this generator, defaults to 0

Name: `DutyStart`
Units: hour
Default: 0.0

(Getter)
"""
function DutyStart(obj::Obj)::Float64
    obj_get_float64(obj, _PropertyIndex.DutyStart)
end

"""
Starting time offset [hours] into the duty cycle shape for this generator, defaults to 0

Name: `DutyStart`
Units: hour
Default: 0.0

(Setter)
"""
function DutyStart(obj::Obj, value::Float64, flags::SetterFlagsT=SetterFlagsT(0))
    obj_set_float64(obj, _PropertyIndex.DutyStart, value, flags)
end

"""
Turn this on to capture the progress of the generator model for each iteration.  Creates a separate file for each generator named "GEN_name.csv".

Name: `DebugTrace`
Default: False

(Getter)
"""
function DebugTrace(obj::Obj)::Bool
    return obj_get_bool(obj, _PropertyIndex.DebugTrace)
end

"""
Turn this on to capture the progress of the generator model for each iteration.  Creates a separate file for each generator named "GEN_name.csv".

Name: `DebugTrace`
Default: False

(Setter)
"""
function DebugTrace(obj::Obj, value::Bool, flags::SetterFlagsT=SetterFlagsT(0))
    obj_set_bool(obj, _PropertyIndex.DebugTrace, value, flags)
end

"""
For Model=7, force balanced current only for 3-phase generators. Force zero- and negative-sequence to zero.

Name: `Balanced`
Default: False

(Getter)
"""
function Balanced(obj::Obj)::Bool
    return obj_get_bool(obj, _PropertyIndex.Balanced)
end

"""
For Model=7, force balanced current only for 3-phase generators. Force zero- and negative-sequence to zero.

Name: `Balanced`
Default: False

(Setter)
"""
function Balanced(obj::Obj, value::Bool, flags::SetterFlagsT=SetterFlagsT(0))
    obj_set_bool(obj, _PropertyIndex.Balanced, value, flags)
end

"""
X/R ratio for Xdp property for FaultStudy and Dynamic modes.

Name: `XRdp`
Default: 20.0

(Getter)
"""
function XRdp(obj::Obj)::Float64
    obj_get_float64(obj, _PropertyIndex.XRdp)
end

"""
X/R ratio for Xdp property for FaultStudy and Dynamic modes.

Name: `XRdp`
Default: 20.0

(Setter)
"""
function XRdp(obj::Obj, value::Float64, flags::SetterFlagsT=SetterFlagsT(0))
    obj_set_float64(obj, _PropertyIndex.XRdp, value, flags)
end

"""
Activates the use of fuel for the operation of the generator. When the fuel level reaches the reserve level, the generator stops until it gets refueled. By default, the generator is connected to a continuous fuel supply, Use this mode to mimic dependency on fuel level for different generation technologies.

Name: `UseFuel`
Default: False

(Getter)
"""
function UseFuel(obj::Obj)::Bool
    return obj_get_bool(obj, _PropertyIndex.UseFuel)
end

"""
Activates the use of fuel for the operation of the generator. When the fuel level reaches the reserve level, the generator stops until it gets refueled. By default, the generator is connected to a continuous fuel supply, Use this mode to mimic dependency on fuel level for different generation technologies.

Name: `UseFuel`
Default: False

(Setter)
"""
function UseFuel(obj::Obj, value::Bool, flags::SetterFlagsT=SetterFlagsT(0))
    obj_set_bool(obj, _PropertyIndex.UseFuel, value, flags)
end

"""
The nominal level of fuel for the generator (kWh). It only applies if UseFuel = True

Name: `FuelkWh`
Default: 0.0

(Getter)
"""
function FuelkWh(obj::Obj)::Float64
    obj_get_float64(obj, _PropertyIndex.FuelkWh)
end

"""
The nominal level of fuel for the generator (kWh). It only applies if UseFuel = True

Name: `FuelkWh`
Default: 0.0

(Setter)
"""
function FuelkWh(obj::Obj, value::Float64, flags::SetterFlagsT=SetterFlagsT(0))
    obj_set_float64(obj, _PropertyIndex.FuelkWh, value, flags)
end

"""
It is a number between 0 and 100 representing the current amount of fuel available in percentage of FuelkWh. It only applies if UseFuel = True

Name: `%Fuel`
Default: 100.0

(Getter)
"""
function pctFuel(obj::Obj)::Float64
    obj_get_float64(obj, _PropertyIndex.pctFuel)
end

"""
It is a number between 0 and 100 representing the current amount of fuel available in percentage of FuelkWh. It only applies if UseFuel = True

Name: `%Fuel`
Default: 100.0

(Setter)
"""
function pctFuel(obj::Obj, value::Float64, flags::SetterFlagsT=SetterFlagsT(0))
    obj_set_float64(obj, _PropertyIndex.pctFuel, value, flags)
end

"""
It is a number between 0 and 100 representing the reserve level in percentage of FuelkWh. It only applies if UseFuel = True

Name: `%Reserve`
Default: 20.0

(Getter)
"""
function pctReserve(obj::Obj)::Float64
    obj_get_float64(obj, _PropertyIndex.pctReserve)
end

"""
It is a number between 0 and 100 representing the reserve level in percentage of FuelkWh. It only applies if UseFuel = True

Name: `%Reserve`
Default: 20.0

(Setter)
"""
function pctReserve(obj::Obj, value::Float64, flags::SetterFlagsT=SetterFlagsT(0))
    obj_set_float64(obj, _PropertyIndex.pctReserve, value, flags)
end

"""
Setting a true value manually refuels the generator when needed. It only applies if UseFuel = True

Name: `Refuel`
Default: False
"""
function Refuel(obj::Obj, value::Bool=true, flags::SetterFlagsT=SetterFlagsT(0))
    obj_set_bool(obj, _PropertyIndex.Refuel, value, flags)
end

"""
The name of the dynamic equation (DynamicExp) that will be used for defining the dynamic behavior of the generator. if not defined, the generator dynamics will follow the built-in dynamic equation.

Name: `DynamicEq`

(Getter)
"""
function DynamicEq_str(obj::Obj)::String
    obj_get_str(obj, _PropertyIndex.DynamicEq)
end

"""
The name of the dynamic equation (DynamicExp) that will be used for defining the dynamic behavior of the generator. if not defined, the generator dynamics will follow the built-in dynamic equation.

Name: `DynamicEq`

(Setter)
"""
function DynamicEq_str(obj::Obj, value::String, flags::SetterFlagsT=SetterFlagsT(0))
    obj_set_str(obj, _PropertyIndex.DynamicEq, value, flags)
end

"""
The name of the dynamic equation (DynamicExp) that will be used for defining the dynamic behavior of the generator. if not defined, the generator dynamics will follow the built-in dynamic equation.

Name: `DynamicEq`

(Getter)
"""
function DynamicEq(obj)::Union{DynamicExpObj, Nothing}
    obj_get_obj(obj,_PropertyIndex.DynamicEq, DynamicExpObj)
end

"""
The name of the dynamic equation (DynamicExp) that will be used for defining the dynamic behavior of the generator. if not defined, the generator dynamics will follow the built-in dynamic equation.

Name: `DynamicEq`

(Setter)
"""
function DynamicEq(obj::Obj, value::Union{DynamicExpObj, Nothing}, flags::SetterFlagsT=SetterFlagsT(0))
    obj_set_obj(obj, _PropertyIndex.DynamicEq, value, flags)
end

"""
The name of the dynamic equation (DynamicExp) that will be used for defining the dynamic behavior of the generator. if not defined, the generator dynamics will follow the built-in dynamic equation.

Name: `DynamicEq`

(Setter)
"""
function DynamicEq(obj::Obj, value::String, flags::SetterFlagsT=SetterFlagsT(0))
    obj_set_str(obj, _PropertyIndex.DynamicEq, value, flags)
end

"""
The name of the variables within the Dynamic equation that will be used to govern the generator dynamics.This generator model requires 2 outputs from the dynamic equation: 

1. Shaft speed (velocity) relative to synchronous speed.
2. Shaft, or power, angle (relative to synchronous reference frame).

The output variables need to be defined in tha strict order.

Name: `DynOut`

(Getter)
"""
function DynOut(obj::Obj)::Vector{String}
    obj_get_strs(obj, _PropertyIndex.DynOut)
end

"""
The name of the variables within the Dynamic equation that will be used to govern the generator dynamics.This generator model requires 2 outputs from the dynamic equation: 

1. Shaft speed (velocity) relative to synchronous speed.
2. Shaft, or power, angle (relative to synchronous reference frame).

The output variables need to be defined in tha strict order.

Name: `DynOut`

(Setter)
"""
function DynOut(obj::Obj, value::Vector{String}, flags::SetterFlagsT=SetterFlagsT(0))
    obj_set_strs(obj, _PropertyIndex.DynOut, value, flags)
end

"""
Name of harmonic voltage or current spectrum for this generator. Voltage behind Xd" for machine - default. Current injection for inverter.

Name: `Spectrum`
Default: defaultgen

(Getter)
"""
function Spectrum_str(obj::Obj)::String
    obj_get_str(obj, _PropertyIndex.Spectrum)
end

"""
Name of harmonic voltage or current spectrum for this generator. Voltage behind Xd" for machine - default. Current injection for inverter.

Name: `Spectrum`
Default: defaultgen

(Setter)
"""
function Spectrum_str(obj::Obj, value::String, flags::SetterFlagsT=SetterFlagsT(0))
    obj_set_str(obj, _PropertyIndex.Spectrum, value, flags)
end

"""
Name of harmonic voltage or current spectrum for this generator. Voltage behind Xd" for machine - default. Current injection for inverter.

Name: `Spectrum`
Default: defaultgen

(Getter)
"""
function Spectrum(obj)::Union{SpectrumObj, Nothing}
    obj_get_obj(obj,_PropertyIndex.Spectrum, SpectrumObj)
end

"""
Name of harmonic voltage or current spectrum for this generator. Voltage behind Xd" for machine - default. Current injection for inverter.

Name: `Spectrum`
Default: defaultgen

(Setter)
"""
function Spectrum(obj::Obj, value::Union{SpectrumObj, Nothing}, flags::SetterFlagsT=SetterFlagsT(0))
    obj_set_obj(obj, _PropertyIndex.Spectrum, value, flags)
end

"""
Name of harmonic voltage or current spectrum for this generator. Voltage behind Xd" for machine - default. Current injection for inverter.

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

end # module Generator
export Generator
