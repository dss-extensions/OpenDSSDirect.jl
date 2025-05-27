module PVSystem
using ..Enums.SetterFlags: SetterFlagsT
using ..Enums: Connection, InverterControlMode, PVSystemModel
using ..DynamicExp: DynamicExpObj
using ..LoadShape: LoadShapeObj
using ..Spectrum: SpectrumObj
using ..TShape: TShapeObj
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


const _cls_name = "PVSystem"
const _cls_idx = 36

module _PropertyIndex
const Phases = Int32(1)
const Bus1 = Int32(2)
const kV = Int32(3)
const Irradiance = Int32(4)
const Pmpp = Int32(5)
const pctPmpp = Int32(6)
const Temperature = Int32(7)
const PF = Int32(8)
const Conn = Int32(9)
const kvar = Int32(10)
const kVA = Int32(11)
const pctCutIn = Int32(12)
const pctCutOut = Int32(13)
const EffCurve = Int32(14)
const PTCurve = Int32(15)
const pctR = Int32(16)
const pctX = Int32(17)
const Model = Int32(18)
const VMinpu = Int32(19)
const VMaxpu = Int32(20)
const Balanced = Int32(21)
const LimitCurrent = Int32(22)
const Yearly = Int32(23)
const Daily = Int32(24)
const Duty = Int32(25)
const TYearly = Int32(26)
const TDaily = Int32(27)
const TDuty = Int32(28)
const Class = Int32(29)
const UserModel = Int32(30)
const UserData = Int32(31)
const DebugTrace = Int32(32)
const VarFollowInverter = Int32(33)
const DutyStart = Int32(34)
const WattPriority = Int32(35)
const PFPriority = Int32(36)
const pctPMinNoVars = Int32(37)
const pctPMinkvarMax = Int32(38)
const kvarMax = Int32(39)
const kvarMaxAbs = Int32(40)
const kVDC = Int32(41)
const Kp = Int32(42)
const PITol = Int32(43)
const SafeVoltage = Int32(44)
const SafeMode = Int32(45)
const DynamicEq = Int32(46)
const DynOut = Int32(47)
const ControlMode = Int32(48)
const AmpLimit = Int32(49)
const AmpLimitGain = Int32(50)
const Spectrum = Int32(51)
const BaseFreq = Int32(52)
const Enabled = Int32(53)
const Like = Int32(54)
end

struct PVSystemObj <: AbstractPCElement
    ptr::Ptr{Cvoid}
    dss::DSSContext
end
export PVSystemObj
Common._wrap_dss_obj(::Val{_cls_idx}, ptr::Ptr{Cvoid}, dss::DSSContext) = PVSystemObj(ptr, dss)
const Obj = PVSystemObj

function Base.show(io::IO, obj::PVSystemObj) 
    name = obj_get_str(obj, obj.dss.capi.Obj_GetFullName)
    print(name)
end


include("dss_object.jl")
include("ce_registers.jl")


"""
Number of Phases, this PVSystem element.  Power is evenly divided among phases.

Name: `Phases`
Default: 3

(Getter)
"""
function Phases(obj::Obj)::Int32
    obj_get_int32(obj, _PropertyIndex.Phases)
end

"""
Number of Phases, this PVSystem element.  Power is evenly divided among phases.

Name: `Phases`
Default: 3

(Setter)
"""
function Phases(obj::Obj, value::Int32, flags::SetterFlagsT=SetterFlagsT(0))
    obj_set_int32(obj, _PropertyIndex.Phases, value, flags)
end

"""
Bus to which the PVSystem element is connected.  May include specific node specification.

Name: `Bus1`

(Getter)
"""
function Bus1(obj::Obj)::String
    obj_get_str(obj, _PropertyIndex.Bus1)
end

"""
Bus to which the PVSystem element is connected.  May include specific node specification.

Name: `Bus1`

(Setter)
"""
function Bus1(obj::Obj, value::String, flags::SetterFlagsT=SetterFlagsT(0))
    obj_set_str(obj, _PropertyIndex.Bus1, value, flags)
end

"""
Nominal rated (1.0 per unit) voltage, kV, for PVSystem element. For 2- and 3-phase PVSystem elements, specify phase-phase kV. Otherwise, specify actual kV across each branch of the PVSystem element. If 1-phase wye (star or LN), specify phase-neutral kV. If 1-phase delta or phase-phase connected, specify phase-phase kV.

Name: `kV`
Units: kV
Default: 12.47

(Getter)
"""
function kV(obj::Obj)::Float64
    obj_get_float64(obj, _PropertyIndex.kV)
end

"""
Nominal rated (1.0 per unit) voltage, kV, for PVSystem element. For 2- and 3-phase PVSystem elements, specify phase-phase kV. Otherwise, specify actual kV across each branch of the PVSystem element. If 1-phase wye (star or LN), specify phase-neutral kV. If 1-phase delta or phase-phase connected, specify phase-phase kV.

Name: `kV`
Units: kV
Default: 12.47

(Setter)
"""
function kV(obj::Obj, value::Float64, flags::SetterFlagsT=SetterFlagsT(0))
    obj_set_float64(obj, _PropertyIndex.kV, value, flags)
end

"""
Get/set the present irradiance value in kW/sq-m. Used as base value for shape multipliers. Generally entered as peak value for the time period of interest and the yearly, daily, and duty load shape objects are defined as per unit multipliers (just like Loads/Generators).

Name: `Irradiance`
Default: 1.0

(Getter)
"""
function Irradiance(obj::Obj)::Float64
    obj_get_float64(obj, _PropertyIndex.Irradiance)
end

"""
Get/set the present irradiance value in kW/sq-m. Used as base value for shape multipliers. Generally entered as peak value for the time period of interest and the yearly, daily, and duty load shape objects are defined as per unit multipliers (just like Loads/Generators).

Name: `Irradiance`
Default: 1.0

(Setter)
"""
function Irradiance(obj::Obj, value::Float64, flags::SetterFlagsT=SetterFlagsT(0))
    obj_set_float64(obj, _PropertyIndex.Irradiance, value, flags)
end

"""
Get/set the rated max power of the PV array for 1.0 kW/sq-m irradiance and a user-selected array temperature. The P-TCurve should be defined relative to the selected array temperature.

Name: `Pmpp`
Default: 500.0

(Getter)
"""
function Pmpp(obj::Obj)::Float64
    obj_get_float64(obj, _PropertyIndex.Pmpp)
end

"""
Get/set the rated max power of the PV array for 1.0 kW/sq-m irradiance and a user-selected array temperature. The P-TCurve should be defined relative to the selected array temperature.

Name: `Pmpp`
Default: 500.0

(Setter)
"""
function Pmpp(obj::Obj, value::Float64, flags::SetterFlagsT=SetterFlagsT(0))
    obj_set_float64(obj, _PropertyIndex.Pmpp, value, flags)
end

"""
Upper limit on active power as a percentage of Pmpp.

Name: `%Pmpp`
Default: 100.0

(Getter)
"""
function pctPmpp(obj::Obj)::Float64
    obj_get_float64(obj, _PropertyIndex.pctPmpp)
end

"""
Upper limit on active power as a percentage of Pmpp.

Name: `%Pmpp`
Default: 100.0

(Setter)
"""
function pctPmpp(obj::Obj, value::Float64, flags::SetterFlagsT=SetterFlagsT(0))
    obj_set_float64(obj, _PropertyIndex.pctPmpp, value, flags)
end

"""
Get/set the present Temperature. Used as fixed value corresponding to PTCurve property. A multiplier is obtained from the Pmpp-Temp curve and applied to the nominal Pmpp from the irradiance to determine the net array output.

Name: `Temperature`
Default: 25.0

(Getter)
"""
function Temperature(obj::Obj)::Float64
    obj_get_float64(obj, _PropertyIndex.Temperature)
end

"""
Get/set the present Temperature. Used as fixed value corresponding to PTCurve property. A multiplier is obtained from the Pmpp-Temp curve and applied to the nominal Pmpp from the irradiance to determine the net array output.

Name: `Temperature`
Default: 25.0

(Setter)
"""
function Temperature(obj::Obj, value::Float64, flags::SetterFlagsT=SetterFlagsT(0))
    obj_set_float64(obj, _PropertyIndex.Temperature, value, flags)
end

"""
Nominally, the power factor for the output power. Setting this property will cause the inverter to operate in constant power factor mode.Enter negative when kW and kvar have opposite signs.
A positive power factor signifies that the PVSystem element produces vars 
as is typical for a generator.  

Name: `PF`
Default: 1.0

(Getter)
"""
function PF(obj::Obj)::Float64
    obj_get_float64(obj, _PropertyIndex.PF)
end

"""
Nominally, the power factor for the output power. Setting this property will cause the inverter to operate in constant power factor mode.Enter negative when kW and kvar have opposite signs.
A positive power factor signifies that the PVSystem element produces vars 
as is typical for a generator.  

Name: `PF`
Default: 1.0

(Setter)
"""
function PF(obj::Obj, value::Float64, flags::SetterFlagsT=SetterFlagsT(0))
    obj_set_float64(obj, _PropertyIndex.PF, value, flags)
end

"""
={wye|LN|delta|LL}.  Default is wye.

Name: `Conn`
Default: Wye

(Getter)
"""
function Conn(obj::Obj)::Connection.T
    Connection.T(obj_get_int32(obj, _PropertyIndex.Conn))
end

"""
={wye|LN|delta|LL}.  Default is wye.

Name: `Conn`
Default: Wye

(Setter)
"""
function Conn(obj::Obj, value::String, flags::SetterFlagsT=SetterFlagsT(0))
    obj_set_str(obj, _PropertyIndex.Conn, value, flags)
end

"""
={wye|LN|delta|LL}.  Default is wye.

Name: `Conn`
Default: Wye

(Setter)
"""
function Conn(obj::Obj, value::Union{Int,Connection.T}, flags::SetterFlagsT=SetterFlagsT(0))
    obj_set_int32(obj, _PropertyIndex.Conn, Int32(value), flags)
end

"""
={wye|LN|delta|LL}.  Default is wye.

Name: `Conn`
Default: Wye

(Getter)
"""
function Conn_str(obj::Obj)::String
    obj_get_str(obj, _PropertyIndex.Conn)
end

"""
={wye|LN|delta|LL}.  Default is wye.

Name: `Conn`
Default: Wye

(Setter)
"""
function Conn_str(obj::Obj, value::String, flags::SetterFlagsT=SetterFlagsT(0))
    Conn(obj, value, flags)
end

"""
Get/set the present kvar value.  Setting this property forces the inverter to operate in constant kvar mode.

Name: `kvar`
Units: kvar

(Getter)
"""
function kvar(obj::Obj)::Float64
    obj_get_float64(obj, _PropertyIndex.kvar)
end

"""
Get/set the present kvar value.  Setting this property forces the inverter to operate in constant kvar mode.

Name: `kvar`
Units: kvar

(Setter)
"""
function kvar(obj::Obj, value::Float64, flags::SetterFlagsT=SetterFlagsT(0))
    obj_set_float64(obj, _PropertyIndex.kvar, value, flags)
end

"""
kVA rating of inverter. Used as the base for Dynamics mode and Harmonics mode values.

Name: `kVA`
Default: 500.0

(Getter)
"""
function kVA(obj::Obj)::Float64
    obj_get_float64(obj, _PropertyIndex.kVA)
end

"""
kVA rating of inverter. Used as the base for Dynamics mode and Harmonics mode values.

Name: `kVA`
Default: 500.0

(Setter)
"""
function kVA(obj::Obj, value::Float64, flags::SetterFlagsT=SetterFlagsT(0))
    obj_set_float64(obj, _PropertyIndex.kVA, value, flags)
end

"""
% cut-in power -- % of kVA rating of inverter. When the inverter is OFF, the power from the array must be greater than this for the inverter to turn on.

Name: `%CutIn`
Default: 20.0

(Getter)
"""
function pctCutIn(obj::Obj)::Float64
    obj_get_float64(obj, _PropertyIndex.pctCutIn)
end

"""
% cut-in power -- % of kVA rating of inverter. When the inverter is OFF, the power from the array must be greater than this for the inverter to turn on.

Name: `%CutIn`
Default: 20.0

(Setter)
"""
function pctCutIn(obj::Obj, value::Float64, flags::SetterFlagsT=SetterFlagsT(0))
    obj_set_float64(obj, _PropertyIndex.pctCutIn, value, flags)
end

"""
% cut-out power -- % of kVA rating of inverter. When the inverter is ON, the inverter turns OFF when the power from the array drops below this value.

Name: `%CutOut`
Default: 20.0

(Getter)
"""
function pctCutOut(obj::Obj)::Float64
    obj_get_float64(obj, _PropertyIndex.pctCutOut)
end

"""
% cut-out power -- % of kVA rating of inverter. When the inverter is ON, the inverter turns OFF when the power from the array drops below this value.

Name: `%CutOut`
Default: 20.0

(Setter)
"""
function pctCutOut(obj::Obj, value::Float64, flags::SetterFlagsT=SetterFlagsT(0))
    obj_set_float64(obj, _PropertyIndex.pctCutOut, value, flags)
end

"""
An XYCurve object, previously defined, that describes the PER UNIT efficiency vs PER UNIT of rated kVA for the inverter. Inverter output power is discounted by the multiplier obtained from this curve.

Name: `EffCurve`

(Getter)
"""
function EffCurve_str(obj::Obj)::String
    obj_get_str(obj, _PropertyIndex.EffCurve)
end

"""
An XYCurve object, previously defined, that describes the PER UNIT efficiency vs PER UNIT of rated kVA for the inverter. Inverter output power is discounted by the multiplier obtained from this curve.

Name: `EffCurve`

(Setter)
"""
function EffCurve_str(obj::Obj, value::String, flags::SetterFlagsT=SetterFlagsT(0))
    obj_set_str(obj, _PropertyIndex.EffCurve, value, flags)
end

"""
An XYCurve object, previously defined, that describes the PER UNIT efficiency vs PER UNIT of rated kVA for the inverter. Inverter output power is discounted by the multiplier obtained from this curve.

Name: `EffCurve`

(Getter)
"""
function EffCurve(obj)::Union{XYcurveObj, Nothing}
    obj_get_obj(obj,_PropertyIndex.EffCurve, XYcurveObj)
end

"""
An XYCurve object, previously defined, that describes the PER UNIT efficiency vs PER UNIT of rated kVA for the inverter. Inverter output power is discounted by the multiplier obtained from this curve.

Name: `EffCurve`

(Setter)
"""
function EffCurve(obj::Obj, value::Union{XYcurveObj, Nothing}, flags::SetterFlagsT=SetterFlagsT(0))
    obj_set_obj(obj, _PropertyIndex.EffCurve, value, flags)
end

"""
An XYCurve object, previously defined, that describes the PER UNIT efficiency vs PER UNIT of rated kVA for the inverter. Inverter output power is discounted by the multiplier obtained from this curve.

Name: `EffCurve`

(Setter)
"""
function EffCurve(obj::Obj, value::String, flags::SetterFlagsT=SetterFlagsT(0))
    obj_set_str(obj, _PropertyIndex.EffCurve, value, flags)
end

"""
An XYCurve object, previously defined, that describes the PV array PER UNIT Pmpp vs Temperature curve. Temperature units must agree with the Temperature property and the Temperature shapes used for simulations. The Pmpp values are specified in per unit of the Pmpp value for 1 kW/sq-m irradiance. The value for the temperature at which Pmpp is defined should be 1.0. The net array power is determined by the irradiance * Pmpp * f(Temperature)

Name: `P-TCurve`

(Getter)
"""
function PTCurve_str(obj::Obj)::String
    obj_get_str(obj, _PropertyIndex.PTCurve)
end

"""
An XYCurve object, previously defined, that describes the PV array PER UNIT Pmpp vs Temperature curve. Temperature units must agree with the Temperature property and the Temperature shapes used for simulations. The Pmpp values are specified in per unit of the Pmpp value for 1 kW/sq-m irradiance. The value for the temperature at which Pmpp is defined should be 1.0. The net array power is determined by the irradiance * Pmpp * f(Temperature)

Name: `P-TCurve`

(Setter)
"""
function PTCurve_str(obj::Obj, value::String, flags::SetterFlagsT=SetterFlagsT(0))
    obj_set_str(obj, _PropertyIndex.PTCurve, value, flags)
end

"""
An XYCurve object, previously defined, that describes the PV array PER UNIT Pmpp vs Temperature curve. Temperature units must agree with the Temperature property and the Temperature shapes used for simulations. The Pmpp values are specified in per unit of the Pmpp value for 1 kW/sq-m irradiance. The value for the temperature at which Pmpp is defined should be 1.0. The net array power is determined by the irradiance * Pmpp * f(Temperature)

Name: `P-TCurve`

(Getter)
"""
function PTCurve(obj)::Union{XYcurveObj, Nothing}
    obj_get_obj(obj,_PropertyIndex.PTCurve, XYcurveObj)
end

"""
An XYCurve object, previously defined, that describes the PV array PER UNIT Pmpp vs Temperature curve. Temperature units must agree with the Temperature property and the Temperature shapes used for simulations. The Pmpp values are specified in per unit of the Pmpp value for 1 kW/sq-m irradiance. The value for the temperature at which Pmpp is defined should be 1.0. The net array power is determined by the irradiance * Pmpp * f(Temperature)

Name: `P-TCurve`

(Setter)
"""
function PTCurve(obj::Obj, value::Union{XYcurveObj, Nothing}, flags::SetterFlagsT=SetterFlagsT(0))
    obj_set_obj(obj, _PropertyIndex.PTCurve, value, flags)
end

"""
An XYCurve object, previously defined, that describes the PV array PER UNIT Pmpp vs Temperature curve. Temperature units must agree with the Temperature property and the Temperature shapes used for simulations. The Pmpp values are specified in per unit of the Pmpp value for 1 kW/sq-m irradiance. The value for the temperature at which Pmpp is defined should be 1.0. The net array power is determined by the irradiance * Pmpp * f(Temperature)

Name: `P-TCurve`

(Setter)
"""
function PTCurve(obj::Obj, value::String, flags::SetterFlagsT=SetterFlagsT(0))
    obj_set_str(obj, _PropertyIndex.PTCurve, value, flags)
end

"""
Equivalent percent internal resistance, ohms. Placed in series with internal voltage source for harmonics and dynamics modes. (Limits fault current to about 2 pu if not current limited -- see LimitCurrent) 

Name: `%R`
Default: 50.0

(Getter)
"""
function pctR(obj::Obj)::Float64
    obj_get_float64(obj, _PropertyIndex.pctR)
end

"""
Equivalent percent internal resistance, ohms. Placed in series with internal voltage source for harmonics and dynamics modes. (Limits fault current to about 2 pu if not current limited -- see LimitCurrent) 

Name: `%R`
Default: 50.0

(Setter)
"""
function pctR(obj::Obj, value::Float64, flags::SetterFlagsT=SetterFlagsT(0))
    obj_set_float64(obj, _PropertyIndex.pctR, value, flags)
end

"""
Equivalent percent internal reactance, ohms. Placed in series with internal voltage source for harmonics and dynamics modes.

Name: `%X`
Default: 0.0

(Getter)
"""
function pctX(obj::Obj)::Float64
    obj_get_float64(obj, _PropertyIndex.pctX)
end

"""
Equivalent percent internal reactance, ohms. Placed in series with internal voltage source for harmonics and dynamics modes.

Name: `%X`
Default: 0.0

(Setter)
"""
function pctX(obj::Obj, value::Float64, flags::SetterFlagsT=SetterFlagsT(0))
    obj_set_float64(obj, _PropertyIndex.pctX, value, flags)
end

"""
Integer code (default=1) for the model to use for power output variation with voltage. Valid values are:

1:PVSystem element injects a CONSTANT kW at specified power factor.
2:PVSystem element is modeled as a CONSTANT ADMITTANCE.
3:Compute load injection from User-written Model.

Name: `Model`
Default: 1

(Getter)
"""
function Model(obj)::PVSystemModel.T
    PVSystemModel.T(obj_get_int32(obj, _PropertyIndex.Model))
end

"""
Integer code (default=1) for the model to use for power output variation with voltage. Valid values are:

1:PVSystem element injects a CONSTANT kW at specified power factor.
2:PVSystem element is modeled as a CONSTANT ADMITTANCE.
3:Compute load injection from User-written Model.

Name: `Model`
Default: 1

(Setter)
"""
function Model(obj::Obj, value::Union{Int,PVSystemModel.T}, flags::SetterFlagsT=SetterFlagsT(0))
    obj_set_int32(obj, _PropertyIndex.Model, value, flags)
end

"""
Minimum per unit voltage for which the Model is assumed to apply. Below this value, the load model reverts to a constant impedance model except for Dynamics model. In Dynamics mode, the current magnitude is limited to the value the power flow would compute for this voltage.

Name: `VMinpu`
Default: 0.9

(Getter)
"""
function VMinpu(obj::Obj)::Float64
    obj_get_float64(obj, _PropertyIndex.VMinpu)
end

"""
Minimum per unit voltage for which the Model is assumed to apply. Below this value, the load model reverts to a constant impedance model except for Dynamics model. In Dynamics mode, the current magnitude is limited to the value the power flow would compute for this voltage.

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
Force balanced current only for 3-phase PVSystems. Forces zero- and negative-sequence to zero. 

Name: `Balanced`
Default: False

(Getter)
"""
function Balanced(obj::Obj)::Bool
    return obj_get_bool(obj, _PropertyIndex.Balanced)
end

"""
Force balanced current only for 3-phase PVSystems. Forces zero- and negative-sequence to zero. 

Name: `Balanced`
Default: False

(Setter)
"""
function Balanced(obj::Obj, value::Bool, flags::SetterFlagsT=SetterFlagsT(0))
    obj_set_bool(obj, _PropertyIndex.Balanced, value, flags)
end

"""
Limits current magnitude to Vminpu value for both 1-phase and 3-phase PVSystems similar to Generator Model 7. For 3-phase, limits the positive-sequence current but not the negative-sequence.

Name: `LimitCurrent`
Default: False

(Getter)
"""
function LimitCurrent(obj::Obj)::Bool
    return obj_get_bool(obj, _PropertyIndex.LimitCurrent)
end

"""
Limits current magnitude to Vminpu value for both 1-phase and 3-phase PVSystems similar to Generator Model 7. For 3-phase, limits the positive-sequence current but not the negative-sequence.

Name: `LimitCurrent`
Default: False

(Setter)
"""
function LimitCurrent(obj::Obj, value::Bool, flags::SetterFlagsT=SetterFlagsT(0))
    obj_set_bool(obj, _PropertyIndex.LimitCurrent, value, flags)
end

"""
Dispatch shape to use for yearly simulations.  Must be previously defined as a Loadshape object. If this is not specified, the Daily dispatch shape, if any, is repeated during Yearly solution modes. In the default dispatch mode, the PVSystem element uses this loadshape to trigger State changes.

Name: `Yearly`

(Getter)
"""
function Yearly_str(obj::Obj)::String
    obj_get_str(obj, _PropertyIndex.Yearly)
end

"""
Dispatch shape to use for yearly simulations.  Must be previously defined as a Loadshape object. If this is not specified, the Daily dispatch shape, if any, is repeated during Yearly solution modes. In the default dispatch mode, the PVSystem element uses this loadshape to trigger State changes.

Name: `Yearly`

(Setter)
"""
function Yearly_str(obj::Obj, value::String, flags::SetterFlagsT=SetterFlagsT(0))
    obj_set_str(obj, _PropertyIndex.Yearly, value, flags)
end

"""
Dispatch shape to use for yearly simulations.  Must be previously defined as a Loadshape object. If this is not specified, the Daily dispatch shape, if any, is repeated during Yearly solution modes. In the default dispatch mode, the PVSystem element uses this loadshape to trigger State changes.

Name: `Yearly`

(Getter)
"""
function Yearly(obj)::Union{LoadShapeObj, Nothing}
    obj_get_obj(obj,_PropertyIndex.Yearly, LoadShapeObj)
end

"""
Dispatch shape to use for yearly simulations.  Must be previously defined as a Loadshape object. If this is not specified, the Daily dispatch shape, if any, is repeated during Yearly solution modes. In the default dispatch mode, the PVSystem element uses this loadshape to trigger State changes.

Name: `Yearly`

(Setter)
"""
function Yearly(obj::Obj, value::Union{LoadShapeObj, Nothing}, flags::SetterFlagsT=SetterFlagsT(0))
    obj_set_obj(obj, _PropertyIndex.Yearly, value, flags)
end

"""
Dispatch shape to use for yearly simulations.  Must be previously defined as a Loadshape object. If this is not specified, the Daily dispatch shape, if any, is repeated during Yearly solution modes. In the default dispatch mode, the PVSystem element uses this loadshape to trigger State changes.

Name: `Yearly`

(Setter)
"""
function Yearly(obj::Obj, value::String, flags::SetterFlagsT=SetterFlagsT(0))
    obj_set_str(obj, _PropertyIndex.Yearly, value, flags)
end

"""
Dispatch shape to use for daily simulations.  Must be previously defined as a Loadshape object of 24 hrs, typically.  In the default dispatch mode, the PVSystem element uses this loadshape to trigger State changes.

Name: `Daily`

(Getter)
"""
function Daily_str(obj::Obj)::String
    obj_get_str(obj, _PropertyIndex.Daily)
end

"""
Dispatch shape to use for daily simulations.  Must be previously defined as a Loadshape object of 24 hrs, typically.  In the default dispatch mode, the PVSystem element uses this loadshape to trigger State changes.

Name: `Daily`

(Setter)
"""
function Daily_str(obj::Obj, value::String, flags::SetterFlagsT=SetterFlagsT(0))
    obj_set_str(obj, _PropertyIndex.Daily, value, flags)
end

"""
Dispatch shape to use for daily simulations.  Must be previously defined as a Loadshape object of 24 hrs, typically.  In the default dispatch mode, the PVSystem element uses this loadshape to trigger State changes.

Name: `Daily`

(Getter)
"""
function Daily(obj)::Union{LoadShapeObj, Nothing}
    obj_get_obj(obj,_PropertyIndex.Daily, LoadShapeObj)
end

"""
Dispatch shape to use for daily simulations.  Must be previously defined as a Loadshape object of 24 hrs, typically.  In the default dispatch mode, the PVSystem element uses this loadshape to trigger State changes.

Name: `Daily`

(Setter)
"""
function Daily(obj::Obj, value::Union{LoadShapeObj, Nothing}, flags::SetterFlagsT=SetterFlagsT(0))
    obj_set_obj(obj, _PropertyIndex.Daily, value, flags)
end

"""
Dispatch shape to use for daily simulations.  Must be previously defined as a Loadshape object of 24 hrs, typically.  In the default dispatch mode, the PVSystem element uses this loadshape to trigger State changes.

Name: `Daily`

(Setter)
"""
function Daily(obj::Obj, value::String, flags::SetterFlagsT=SetterFlagsT(0))
    obj_set_str(obj, _PropertyIndex.Daily, value, flags)
end

"""
Load shape to use for duty cycle dispatch simulations such as for solar ramp rate studies. Must be previously defined as a Loadshape object. Typically would have time intervals of 1-5 seconds. Designate the number of points to solve using the Set Number=xxxx command. If there are fewer points in the actual shape, the shape is assumed to repeat.

Name: `Duty`

(Getter)
"""
function Duty_str(obj::Obj)::String
    obj_get_str(obj, _PropertyIndex.Duty)
end

"""
Load shape to use for duty cycle dispatch simulations such as for solar ramp rate studies. Must be previously defined as a Loadshape object. Typically would have time intervals of 1-5 seconds. Designate the number of points to solve using the Set Number=xxxx command. If there are fewer points in the actual shape, the shape is assumed to repeat.

Name: `Duty`

(Setter)
"""
function Duty_str(obj::Obj, value::String, flags::SetterFlagsT=SetterFlagsT(0))
    obj_set_str(obj, _PropertyIndex.Duty, value, flags)
end

"""
Load shape to use for duty cycle dispatch simulations such as for solar ramp rate studies. Must be previously defined as a Loadshape object. Typically would have time intervals of 1-5 seconds. Designate the number of points to solve using the Set Number=xxxx command. If there are fewer points in the actual shape, the shape is assumed to repeat.

Name: `Duty`

(Getter)
"""
function Duty(obj)::Union{LoadShapeObj, Nothing}
    obj_get_obj(obj,_PropertyIndex.Duty, LoadShapeObj)
end

"""
Load shape to use for duty cycle dispatch simulations such as for solar ramp rate studies. Must be previously defined as a Loadshape object. Typically would have time intervals of 1-5 seconds. Designate the number of points to solve using the Set Number=xxxx command. If there are fewer points in the actual shape, the shape is assumed to repeat.

Name: `Duty`

(Setter)
"""
function Duty(obj::Obj, value::Union{LoadShapeObj, Nothing}, flags::SetterFlagsT=SetterFlagsT(0))
    obj_set_obj(obj, _PropertyIndex.Duty, value, flags)
end

"""
Load shape to use for duty cycle dispatch simulations such as for solar ramp rate studies. Must be previously defined as a Loadshape object. Typically would have time intervals of 1-5 seconds. Designate the number of points to solve using the Set Number=xxxx command. If there are fewer points in the actual shape, the shape is assumed to repeat.

Name: `Duty`

(Setter)
"""
function Duty(obj::Obj, value::String, flags::SetterFlagsT=SetterFlagsT(0))
    obj_set_str(obj, _PropertyIndex.Duty, value, flags)
end

"""
Temperature shape to use for yearly simulations.  Must be previously defined as a TShape object. If this is not specified, the Daily dispatch shape, if any, is repeated during Yearly solution modes. The PVSystem element uses this TShape to determine the Pmpp from the Pmpp vs T curve. Units must agree with the Pmpp vs T curve.

Name: `TYearly`

(Getter)
"""
function TYearly_str(obj::Obj)::String
    obj_get_str(obj, _PropertyIndex.TYearly)
end

"""
Temperature shape to use for yearly simulations.  Must be previously defined as a TShape object. If this is not specified, the Daily dispatch shape, if any, is repeated during Yearly solution modes. The PVSystem element uses this TShape to determine the Pmpp from the Pmpp vs T curve. Units must agree with the Pmpp vs T curve.

Name: `TYearly`

(Setter)
"""
function TYearly_str(obj::Obj, value::String, flags::SetterFlagsT=SetterFlagsT(0))
    obj_set_str(obj, _PropertyIndex.TYearly, value, flags)
end

"""
Temperature shape to use for yearly simulations.  Must be previously defined as a TShape object. If this is not specified, the Daily dispatch shape, if any, is repeated during Yearly solution modes. The PVSystem element uses this TShape to determine the Pmpp from the Pmpp vs T curve. Units must agree with the Pmpp vs T curve.

Name: `TYearly`

(Getter)
"""
function TYearly(obj)::Union{TShapeObj, Nothing}
    obj_get_obj(obj,_PropertyIndex.TYearly, TShapeObj)
end

"""
Temperature shape to use for yearly simulations.  Must be previously defined as a TShape object. If this is not specified, the Daily dispatch shape, if any, is repeated during Yearly solution modes. The PVSystem element uses this TShape to determine the Pmpp from the Pmpp vs T curve. Units must agree with the Pmpp vs T curve.

Name: `TYearly`

(Setter)
"""
function TYearly(obj::Obj, value::Union{TShapeObj, Nothing}, flags::SetterFlagsT=SetterFlagsT(0))
    obj_set_obj(obj, _PropertyIndex.TYearly, value, flags)
end

"""
Temperature shape to use for yearly simulations.  Must be previously defined as a TShape object. If this is not specified, the Daily dispatch shape, if any, is repeated during Yearly solution modes. The PVSystem element uses this TShape to determine the Pmpp from the Pmpp vs T curve. Units must agree with the Pmpp vs T curve.

Name: `TYearly`

(Setter)
"""
function TYearly(obj::Obj, value::String, flags::SetterFlagsT=SetterFlagsT(0))
    obj_set_str(obj, _PropertyIndex.TYearly, value, flags)
end

"""
Temperature shape to use for daily simulations.  Must be previously defined as a TShape object of 24 hrs, typically.  The PVSystem element uses this TShape to determine the Pmpp from the Pmpp vs T curve. Units must agree with the Pmpp vs T curve.

Name: `TDaily`

(Getter)
"""
function TDaily_str(obj::Obj)::String
    obj_get_str(obj, _PropertyIndex.TDaily)
end

"""
Temperature shape to use for daily simulations.  Must be previously defined as a TShape object of 24 hrs, typically.  The PVSystem element uses this TShape to determine the Pmpp from the Pmpp vs T curve. Units must agree with the Pmpp vs T curve.

Name: `TDaily`

(Setter)
"""
function TDaily_str(obj::Obj, value::String, flags::SetterFlagsT=SetterFlagsT(0))
    obj_set_str(obj, _PropertyIndex.TDaily, value, flags)
end

"""
Temperature shape to use for daily simulations.  Must be previously defined as a TShape object of 24 hrs, typically.  The PVSystem element uses this TShape to determine the Pmpp from the Pmpp vs T curve. Units must agree with the Pmpp vs T curve.

Name: `TDaily`

(Getter)
"""
function TDaily(obj)::Union{TShapeObj, Nothing}
    obj_get_obj(obj,_PropertyIndex.TDaily, TShapeObj)
end

"""
Temperature shape to use for daily simulations.  Must be previously defined as a TShape object of 24 hrs, typically.  The PVSystem element uses this TShape to determine the Pmpp from the Pmpp vs T curve. Units must agree with the Pmpp vs T curve.

Name: `TDaily`

(Setter)
"""
function TDaily(obj::Obj, value::Union{TShapeObj, Nothing}, flags::SetterFlagsT=SetterFlagsT(0))
    obj_set_obj(obj, _PropertyIndex.TDaily, value, flags)
end

"""
Temperature shape to use for daily simulations.  Must be previously defined as a TShape object of 24 hrs, typically.  The PVSystem element uses this TShape to determine the Pmpp from the Pmpp vs T curve. Units must agree with the Pmpp vs T curve.

Name: `TDaily`

(Setter)
"""
function TDaily(obj::Obj, value::String, flags::SetterFlagsT=SetterFlagsT(0))
    obj_set_str(obj, _PropertyIndex.TDaily, value, flags)
end

"""
Temperature shape to use for duty cycle dispatch simulations such as for solar ramp rate studies. Must be previously defined as a TShape object. Typically would have time intervals of 1-5 seconds. Designate the number of points to solve using the Set Number=xxxx command. If there are fewer points in the actual shape, the shape is assumed to repeat. The PVSystem model uses this TShape to determine the Pmpp from the Pmpp vs T curve. Units must agree with the Pmpp vs T curve.

Name: `TDuty`

(Getter)
"""
function TDuty_str(obj::Obj)::String
    obj_get_str(obj, _PropertyIndex.TDuty)
end

"""
Temperature shape to use for duty cycle dispatch simulations such as for solar ramp rate studies. Must be previously defined as a TShape object. Typically would have time intervals of 1-5 seconds. Designate the number of points to solve using the Set Number=xxxx command. If there are fewer points in the actual shape, the shape is assumed to repeat. The PVSystem model uses this TShape to determine the Pmpp from the Pmpp vs T curve. Units must agree with the Pmpp vs T curve.

Name: `TDuty`

(Setter)
"""
function TDuty_str(obj::Obj, value::String, flags::SetterFlagsT=SetterFlagsT(0))
    obj_set_str(obj, _PropertyIndex.TDuty, value, flags)
end

"""
Temperature shape to use for duty cycle dispatch simulations such as for solar ramp rate studies. Must be previously defined as a TShape object. Typically would have time intervals of 1-5 seconds. Designate the number of points to solve using the Set Number=xxxx command. If there are fewer points in the actual shape, the shape is assumed to repeat. The PVSystem model uses this TShape to determine the Pmpp from the Pmpp vs T curve. Units must agree with the Pmpp vs T curve.

Name: `TDuty`

(Getter)
"""
function TDuty(obj)::Union{TShapeObj, Nothing}
    obj_get_obj(obj,_PropertyIndex.TDuty, TShapeObj)
end

"""
Temperature shape to use for duty cycle dispatch simulations such as for solar ramp rate studies. Must be previously defined as a TShape object. Typically would have time intervals of 1-5 seconds. Designate the number of points to solve using the Set Number=xxxx command. If there are fewer points in the actual shape, the shape is assumed to repeat. The PVSystem model uses this TShape to determine the Pmpp from the Pmpp vs T curve. Units must agree with the Pmpp vs T curve.

Name: `TDuty`

(Setter)
"""
function TDuty(obj::Obj, value::Union{TShapeObj, Nothing}, flags::SetterFlagsT=SetterFlagsT(0))
    obj_set_obj(obj, _PropertyIndex.TDuty, value, flags)
end

"""
Temperature shape to use for duty cycle dispatch simulations such as for solar ramp rate studies. Must be previously defined as a TShape object. Typically would have time intervals of 1-5 seconds. Designate the number of points to solve using the Set Number=xxxx command. If there are fewer points in the actual shape, the shape is assumed to repeat. The PVSystem model uses this TShape to determine the Pmpp from the Pmpp vs T curve. Units must agree with the Pmpp vs T curve.

Name: `TDuty`

(Setter)
"""
function TDuty(obj::Obj, value::String, flags::SetterFlagsT=SetterFlagsT(0))
    obj_set_str(obj, _PropertyIndex.TDuty, value, flags)
end

"""
An arbitrary integer number representing the class of PVSystem element so that PVSystem values may be segregated by class.

Name: `Class`
Default: 1

(Getter)
"""
function Class(obj::Obj)::Int32
    obj_get_int32(obj, _PropertyIndex.Class)
end

"""
An arbitrary integer number representing the class of PVSystem element so that PVSystem values may be segregated by class.

Name: `Class`
Default: 1

(Setter)
"""
function Class(obj::Obj, value::Int32, flags::SetterFlagsT=SetterFlagsT(0))
    obj_set_int32(obj, _PropertyIndex.Class, value, flags)
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
Turn this on to capture the progress of the PVSystem model for each iteration.  Creates a separate file for each PVSystem element named "PVSystem_name.csv".

Name: `DebugTrace`
Default: False

(Getter)
"""
function DebugTrace(obj::Obj)::Bool
    return obj_get_bool(obj, _PropertyIndex.DebugTrace)
end

"""
Turn this on to capture the progress of the PVSystem model for each iteration.  Creates a separate file for each PVSystem element named "PVSystem_name.csv".

Name: `DebugTrace`
Default: False

(Setter)
"""
function DebugTrace(obj::Obj, value::Bool, flags::SetterFlagsT=SetterFlagsT(0))
    obj_set_bool(obj, _PropertyIndex.DebugTrace, value, flags)
end

"""
Defaults to False which indicates that the reactive power generation/absorption does not respect the inverter status.When set to True, the PVSystem reactive power generation/absorption will cease when the inverter status is off, due to panel kW dropping below %Cutout.  The reactive power generation/absorption will begin again when the panel kW is above %Cutin.  When set to False, the PVSystem will generate/absorb reactive power regardless of the status of the inverter.

Name: `VarFollowInverter`
Default: False

(Getter)
"""
function VarFollowInverter(obj::Obj)::Bool
    return obj_get_bool(obj, _PropertyIndex.VarFollowInverter)
end

"""
Defaults to False which indicates that the reactive power generation/absorption does not respect the inverter status.When set to True, the PVSystem reactive power generation/absorption will cease when the inverter status is off, due to panel kW dropping below %Cutout.  The reactive power generation/absorption will begin again when the panel kW is above %Cutin.  When set to False, the PVSystem will generate/absorb reactive power regardless of the status of the inverter.

Name: `VarFollowInverter`
Default: False

(Setter)
"""
function VarFollowInverter(obj::Obj, value::Bool, flags::SetterFlagsT=SetterFlagsT(0))
    obj_set_bool(obj, _PropertyIndex.VarFollowInverter, value, flags)
end

"""
Starting time offset into the duty cycle shape for this PVSystem.

Name: `DutyStart`
Units: hour
Default: 0.0

(Getter)
"""
function DutyStart(obj::Obj)::Float64
    obj_get_float64(obj, _PropertyIndex.DutyStart)
end

"""
Starting time offset into the duty cycle shape for this PVSystem.

Name: `DutyStart`
Units: hour
Default: 0.0

(Setter)
"""
function DutyStart(obj::Obj, value::Float64, flags::SetterFlagsT=SetterFlagsT(0))
    obj_set_float64(obj, _PropertyIndex.DutyStart, value, flags)
end

"""
Set inverter to watt priority instead of the default var priority

Name: `WattPriority`
Default: False

(Getter)
"""
function WattPriority(obj::Obj)::Bool
    return obj_get_bool(obj, _PropertyIndex.WattPriority)
end

"""
Set inverter to watt priority instead of the default var priority

Name: `WattPriority`
Default: False

(Setter)
"""
function WattPriority(obj::Obj, value::Bool, flags::SetterFlagsT=SetterFlagsT(0))
    obj_set_bool(obj, _PropertyIndex.WattPriority, value, flags)
end

"""
Set inverter to operate with PF priority when in constant PF mode. If "Yes", value assigned to "WattPriority" is neglected. If controlled by an InvControl with either Volt-Var or DRC or both functions activated, PF priority is neglected and "WattPriority" is considered. Default = No.

Name: `PFPriority`
Default: False

(Getter)
"""
function PFPriority(obj::Obj)::Bool
    return obj_get_bool(obj, _PropertyIndex.PFPriority)
end

"""
Set inverter to operate with PF priority when in constant PF mode. If "Yes", value assigned to "WattPriority" is neglected. If controlled by an InvControl with either Volt-Var or DRC or both functions activated, PF priority is neglected and "WattPriority" is considered. Default = No.

Name: `PFPriority`
Default: False

(Setter)
"""
function PFPriority(obj::Obj, value::Bool, flags::SetterFlagsT=SetterFlagsT(0))
    obj_set_bool(obj, _PropertyIndex.PFPriority, value, flags)
end

"""
Minimum active power as percentage of Pmpp under which there is no vars production/absorption.

Name: `%PMinNoVars`
Default: 0.0

(Getter)
"""
function pctPMinNoVars(obj::Obj)::Float64
    obj_get_float64(obj, _PropertyIndex.pctPMinNoVars)
end

"""
Minimum active power as percentage of Pmpp under which there is no vars production/absorption.

Name: `%PMinNoVars`
Default: 0.0

(Setter)
"""
function pctPMinNoVars(obj::Obj, value::Float64, flags::SetterFlagsT=SetterFlagsT(0))
    obj_set_float64(obj, _PropertyIndex.pctPMinNoVars, value, flags)
end

"""
Minimum active power as percentage of Pmpp that allows the inverter to produce/absorb reactive power up to its kvarMax or kvarMaxAbs.

Name: `%PMinkvarMax`
Default: 0.0

(Getter)
"""
function pctPMinkvarMax(obj::Obj)::Float64
    obj_get_float64(obj, _PropertyIndex.pctPMinkvarMax)
end

"""
Minimum active power as percentage of Pmpp that allows the inverter to produce/absorb reactive power up to its kvarMax or kvarMaxAbs.

Name: `%PMinkvarMax`
Default: 0.0

(Setter)
"""
function pctPMinkvarMax(obj::Obj, value::Float64, flags::SetterFlagsT=SetterFlagsT(0))
    obj_set_float64(obj, _PropertyIndex.pctPMinkvarMax, value, flags)
end

"""
Indicates the maximum reactive power GENERATION (un-signed numerical variable in kvar) for the inverter (as an un-signed value). Defaults to kVA rating of the inverter.

Name: `kvarMax`

(Getter)
"""
function kvarMax(obj::Obj)::Float64
    obj_get_float64(obj, _PropertyIndex.kvarMax)
end

"""
Indicates the maximum reactive power GENERATION (un-signed numerical variable in kvar) for the inverter (as an un-signed value). Defaults to kVA rating of the inverter.

Name: `kvarMax`

(Setter)
"""
function kvarMax(obj::Obj, value::Float64, flags::SetterFlagsT=SetterFlagsT(0))
    obj_set_float64(obj, _PropertyIndex.kvarMax, value, flags)
end

"""
Indicates the maximum reactive power ABSORPTION (un-signed numerical variable in kvar) for the inverter (as an un-signed value). Defaults to kVA rating of the inverter.

Name: `kvarMaxAbs`

(Getter)
"""
function kvarMaxAbs(obj::Obj)::Float64
    obj_get_float64(obj, _PropertyIndex.kvarMaxAbs)
end

"""
Indicates the maximum reactive power ABSORPTION (un-signed numerical variable in kvar) for the inverter (as an un-signed value). Defaults to kVA rating of the inverter.

Name: `kvarMaxAbs`

(Setter)
"""
function kvarMaxAbs(obj::Obj, value::Float64, flags::SetterFlagsT=SetterFlagsT(0))
    obj_set_float64(obj, _PropertyIndex.kvarMaxAbs, value, flags)
end

"""
Indicates the rated voltage (kV) at the input of the inverter at the peak of PV energy production. The value is normally greater or equal to the kV base of the PV system. It is used for dynamics simulation ONLY.

Name: `kVDC`
Default: 8.0

(Getter)
"""
function kVDC(obj::Obj)::Float64
    obj_get_float64(obj, _PropertyIndex.kVDC)
end

"""
Indicates the rated voltage (kV) at the input of the inverter at the peak of PV energy production. The value is normally greater or equal to the kV base of the PV system. It is used for dynamics simulation ONLY.

Name: `kVDC`
Default: 8.0

(Setter)
"""
function kVDC(obj::Obj, value::Float64, flags::SetterFlagsT=SetterFlagsT(0))
    obj_set_float64(obj, _PropertyIndex.kVDC, value, flags)
end

"""
It is the proportional gain for the PI controller within the inverter. Use it to modify the controller response in dynamics simulation mode.

Name: `Kp`
Default: 0.01

(Getter)
"""
function Kp(obj::Obj)::Float64
    obj_get_float64(obj, _PropertyIndex.Kp)
end

"""
It is the proportional gain for the PI controller within the inverter. Use it to modify the controller response in dynamics simulation mode.

Name: `Kp`
Default: 0.01

(Setter)
"""
function Kp(obj::Obj, value::Float64, flags::SetterFlagsT=SetterFlagsT(0))
    obj_set_float64(obj, _PropertyIndex.Kp, value, flags)
end

"""
It is the tolerance (%) for the closed loop controller of the inverter. For dynamics simulation mode.

Name: `PITol`
Default: 0.0

(Getter)
"""
function PITol(obj::Obj)::Float64
    obj_get_float64(obj, _PropertyIndex.PITol)
end

"""
It is the tolerance (%) for the closed loop controller of the inverter. For dynamics simulation mode.

Name: `PITol`
Default: 0.0

(Setter)
"""
function PITol(obj::Obj, value::Float64, flags::SetterFlagsT=SetterFlagsT(0))
    obj_set_float64(obj, _PropertyIndex.PITol, value, flags)
end

"""
Indicates the voltage level (%) respect to the base voltage level for which the Inverter will operate. If this threshold is violated, the Inverter will enter safe mode (OFF). For dynamic simulation. By default is 80%

Name: `SafeVoltage`
Default: 80.0

(Getter)
"""
function SafeVoltage(obj::Obj)::Float64
    obj_get_float64(obj, _PropertyIndex.SafeVoltage)
end

"""
Indicates the voltage level (%) respect to the base voltage level for which the Inverter will operate. If this threshold is violated, the Inverter will enter safe mode (OFF). For dynamic simulation. By default is 80%

Name: `SafeVoltage`
Default: 80.0

(Setter)
"""
function SafeVoltage(obj::Obj, value::Float64, flags::SetterFlagsT=SetterFlagsT(0))
    obj_set_float64(obj, _PropertyIndex.SafeVoltage, value, flags)
end

"""
(Read only) Indicates whether the inverter entered (Yes) or not (No) into Safe Mode.

**Read-only**

Name: `SafeMode`

(Getter)
"""
function SafeMode(obj::Obj)::Bool
    return obj_get_bool(obj, _PropertyIndex.SafeMode)
end

"""
(Read only) Indicates whether the inverter entered (Yes) or not (No) into Safe Mode.

**Read-only**

Name: `SafeMode`

(Setter)
"""
function SafeMode(obj::Obj, value::Bool, flags::SetterFlagsT=SetterFlagsT(0))
    obj_set_bool(obj, _PropertyIndex.SafeMode, value, flags)
end

"""
The name of the dynamic equation (DynamicExp) that will be used for defining the dynamic behavior of the generator. If not defined, the generator dynamics will follow the built-in dynamic equation.

Name: `DynamicEq`

(Getter)
"""
function DynamicEq_str(obj::Obj)::String
    obj_get_str(obj, _PropertyIndex.DynamicEq)
end

"""
The name of the dynamic equation (DynamicExp) that will be used for defining the dynamic behavior of the generator. If not defined, the generator dynamics will follow the built-in dynamic equation.

Name: `DynamicEq`

(Setter)
"""
function DynamicEq_str(obj::Obj, value::String, flags::SetterFlagsT=SetterFlagsT(0))
    obj_set_str(obj, _PropertyIndex.DynamicEq, value, flags)
end

"""
The name of the dynamic equation (DynamicExp) that will be used for defining the dynamic behavior of the generator. If not defined, the generator dynamics will follow the built-in dynamic equation.

Name: `DynamicEq`

(Getter)
"""
function DynamicEq(obj)::Union{DynamicExpObj, Nothing}
    obj_get_obj(obj,_PropertyIndex.DynamicEq, DynamicExpObj)
end

"""
The name of the dynamic equation (DynamicExp) that will be used for defining the dynamic behavior of the generator. If not defined, the generator dynamics will follow the built-in dynamic equation.

Name: `DynamicEq`

(Setter)
"""
function DynamicEq(obj::Obj, value::Union{DynamicExpObj, Nothing}, flags::SetterFlagsT=SetterFlagsT(0))
    obj_set_obj(obj, _PropertyIndex.DynamicEq, value, flags)
end

"""
The name of the dynamic equation (DynamicExp) that will be used for defining the dynamic behavior of the generator. If not defined, the generator dynamics will follow the built-in dynamic equation.

Name: `DynamicEq`

(Setter)
"""
function DynamicEq(obj::Obj, value::String, flags::SetterFlagsT=SetterFlagsT(0))
    obj_set_str(obj, _PropertyIndex.DynamicEq, value, flags)
end

"""
The name of the variables within the Dynamic equation that will be used to govern the PVSystem dynamics. This PVsystem model requires 1 output from the dynamic equation:

    1. Current.

The output variables need to be defined in the same order.

Name: `DynOut`

(Getter)
"""
function DynOut(obj::Obj)::Vector{String}
    obj_get_strs(obj, _PropertyIndex.DynOut)
end

"""
The name of the variables within the Dynamic equation that will be used to govern the PVSystem dynamics. This PVsystem model requires 1 output from the dynamic equation:

    1. Current.

The output variables need to be defined in the same order.

Name: `DynOut`

(Setter)
"""
function DynOut(obj::Obj, value::Vector{String}, flags::SetterFlagsT=SetterFlagsT(0))
    obj_set_strs(obj, _PropertyIndex.DynOut, value, flags)
end

"""
Defines the control mode for the inverter. By default it is GFL (Grid Following Inverter). Use GFM (Grid Forming Inverter) for energizing islanded microgrids, but, if the device is connected to the grid, it is highly recommended to use GFL.

GFM control mode disables any control action set by the InvControl device.

Name: `ControlMode`
Default: GFL

(Getter)
"""
function ControlMode(obj::Obj)::InverterControlMode.T
    InverterControlMode.T(obj_get_int32(obj, _PropertyIndex.ControlMode))
end

"""
Defines the control mode for the inverter. By default it is GFL (Grid Following Inverter). Use GFM (Grid Forming Inverter) for energizing islanded microgrids, but, if the device is connected to the grid, it is highly recommended to use GFL.

GFM control mode disables any control action set by the InvControl device.

Name: `ControlMode`
Default: GFL

(Setter)
"""
function ControlMode(obj::Obj, value::String, flags::SetterFlagsT=SetterFlagsT(0))
    obj_set_str(obj, _PropertyIndex.ControlMode, value, flags)
end

"""
Defines the control mode for the inverter. By default it is GFL (Grid Following Inverter). Use GFM (Grid Forming Inverter) for energizing islanded microgrids, but, if the device is connected to the grid, it is highly recommended to use GFL.

GFM control mode disables any control action set by the InvControl device.

Name: `ControlMode`
Default: GFL

(Setter)
"""
function ControlMode(obj::Obj, value::Union{Int,InverterControlMode.T}, flags::SetterFlagsT=SetterFlagsT(0))
    obj_set_int32(obj, _PropertyIndex.ControlMode, Int32(value), flags)
end

"""
Defines the control mode for the inverter. By default it is GFL (Grid Following Inverter). Use GFM (Grid Forming Inverter) for energizing islanded microgrids, but, if the device is connected to the grid, it is highly recommended to use GFL.

GFM control mode disables any control action set by the InvControl device.

Name: `ControlMode`
Default: GFL

(Getter)
"""
function ControlMode_str(obj::Obj)::String
    obj_get_str(obj, _PropertyIndex.ControlMode)
end

"""
Defines the control mode for the inverter. By default it is GFL (Grid Following Inverter). Use GFM (Grid Forming Inverter) for energizing islanded microgrids, but, if the device is connected to the grid, it is highly recommended to use GFL.

GFM control mode disables any control action set by the InvControl device.

Name: `ControlMode`
Default: GFL

(Setter)
"""
function ControlMode_str(obj::Obj, value::String, flags::SetterFlagsT=SetterFlagsT(0))
    ControlMode(obj, value, flags)
end

"""
The current limiter per phase for the IBR when operating in GFM mode. This limit is imposed to prevent the IBR to enter into Safe Mode when reaching the IBR power ratings.
Once the IBR reaches this value, it remains there without moving into Safe Mode. This value needs to be set lower than the IBR Amps rating.

Name: `AmpLimit`

(Getter)
"""
function AmpLimit(obj::Obj)::Float64
    obj_get_float64(obj, _PropertyIndex.AmpLimit)
end

"""
The current limiter per phase for the IBR when operating in GFM mode. This limit is imposed to prevent the IBR to enter into Safe Mode when reaching the IBR power ratings.
Once the IBR reaches this value, it remains there without moving into Safe Mode. This value needs to be set lower than the IBR Amps rating.

Name: `AmpLimit`

(Setter)
"""
function AmpLimit(obj::Obj, value::Float64, flags::SetterFlagsT=SetterFlagsT(0))
    obj_set_float64(obj, _PropertyIndex.AmpLimit, value, flags)
end

"""
Use it for fine tunning the current limiter when active, by default is 0.8, it has to be a value between 0.1 and 1. This value allows users to fine tune the IBRs current limiter to match with the user requirements.

Name: `AmpLimitGain`
Default: 0.8

(Getter)
"""
function AmpLimitGain(obj::Obj)::Float64
    obj_get_float64(obj, _PropertyIndex.AmpLimitGain)
end

"""
Use it for fine tunning the current limiter when active, by default is 0.8, it has to be a value between 0.1 and 1. This value allows users to fine tune the IBRs current limiter to match with the user requirements.

Name: `AmpLimitGain`
Default: 0.8

(Setter)
"""
function AmpLimitGain(obj::Obj, value::Float64, flags::SetterFlagsT=SetterFlagsT(0))
    obj_set_float64(obj, _PropertyIndex.AmpLimitGain, value, flags)
end

"""
Name of harmonic voltage or current spectrum for this PVSystem element. A harmonic voltage source is assumed for the inverter.

Name: `Spectrum`

(Getter)
"""
function Spectrum_str(obj::Obj)::String
    obj_get_str(obj, _PropertyIndex.Spectrum)
end

"""
Name of harmonic voltage or current spectrum for this PVSystem element. A harmonic voltage source is assumed for the inverter.

Name: `Spectrum`

(Setter)
"""
function Spectrum_str(obj::Obj, value::String, flags::SetterFlagsT=SetterFlagsT(0))
    obj_set_str(obj, _PropertyIndex.Spectrum, value, flags)
end

"""
Name of harmonic voltage or current spectrum for this PVSystem element. A harmonic voltage source is assumed for the inverter.

Name: `Spectrum`

(Getter)
"""
function Spectrum(obj)::Union{SpectrumObj, Nothing}
    obj_get_obj(obj,_PropertyIndex.Spectrum, SpectrumObj)
end

"""
Name of harmonic voltage or current spectrum for this PVSystem element. A harmonic voltage source is assumed for the inverter.

Name: `Spectrum`

(Setter)
"""
function Spectrum(obj::Obj, value::Union{SpectrumObj, Nothing}, flags::SetterFlagsT=SetterFlagsT(0))
    obj_set_obj(obj, _PropertyIndex.Spectrum, value, flags)
end

"""
Name of harmonic voltage or current spectrum for this PVSystem element. A harmonic voltage source is assumed for the inverter.

Name: `Spectrum`

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

end # module PVSystem
export PVSystem
