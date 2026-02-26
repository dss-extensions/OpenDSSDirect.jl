module Storage
using ..Enums.SetterFlags: SetterFlagsT
using ..Enums: Connection, InverterControlMode, StorageDispatchMode, StorageState
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


const _cls_name = "Storage"
const _cls_idx = 30

module _PropertyIndex
const Phases = Int32(1)
const Bus1 = Int32(2)
const kV = Int32(3)
const Conn = Int32(4)
const kW = Int32(5)
const kvar = Int32(6)
const PF = Int32(7)
const kVA = Int32(8)
const pctCutIn = Int32(9)
const pctCutOut = Int32(10)
const EffCurve = Int32(11)
const VarFollowInverter = Int32(12)
const kvarMax = Int32(13)
const kvarMaxAbs = Int32(14)
const WattPriority = Int32(15)
const PFPriority = Int32(16)
const pctPMinNoVars = Int32(17)
const pctPMinkvarMax = Int32(18)
const kWRated = Int32(19)
const pctkWRated = Int32(20)
const kWhRated = Int32(21)
const kWhStored = Int32(22)
const pctStored = Int32(23)
const pctReserve = Int32(24)
const State = Int32(25)
const pctDischarge = Int32(26)
const pctCharge = Int32(27)
const pctEffCharge = Int32(28)
const pctEffDischarge = Int32(29)
const pctIdlingkW = Int32(30)
const pctIdlingkvar = Int32(31)
const pctR = Int32(32)
const pctX = Int32(33)
const Model = Int32(34)
const VMinpu = Int32(35)
const VMaxpu = Int32(36)
const Balanced = Int32(37)
const LimitCurrent = Int32(38)
const Yearly = Int32(39)
const Daily = Int32(40)
const Duty = Int32(41)
const DispMode = Int32(42)
const DischargeTrigger = Int32(43)
const ChargeTrigger = Int32(44)
const TimeChargeTrig = Int32(45)
const Class = Int32(46)
const DynaDLL = Int32(47)
const DynaData = Int32(48)
const UserModel = Int32(49)
const UserData = Int32(50)
const DebugTrace = Int32(51)
const kVDC = Int32(52)
const Kp = Int32(53)
const PITol = Int32(54)
const SafeVoltage = Int32(55)
const SafeMode = Int32(56)
const DynamicEq = Int32(57)
const DynOut = Int32(58)
const ControlMode = Int32(59)
const AmpLimit = Int32(60)
const AmpLimitGain = Int32(61)
const Spectrum = Int32(62)
const BaseFreq = Int32(63)
const Enabled = Int32(64)
const Like = Int32(65)
end

struct StorageObj <: AbstractPCElement
    ptr::Ptr{Cvoid}
    dss::DSSContext
end
export StorageObj
Common._wrap_dss_obj(::Val{_cls_idx}, ptr::Ptr{Cvoid}, dss::DSSContext) = StorageObj(ptr, dss)
const Obj = StorageObj

function Base.show(io::IO, obj::StorageObj) 
    name = obj_get_str(obj, obj.dss.capi.Obj_GetFullName)
    print(name)
end


include("dss_object.jl")
include("ce_registers.jl")


"""
Number of Phases, this Storage element.  Power is evenly divided among phases.

Name: `Phases`
Default: 3

(Getter)
"""
function Phases(obj::Obj)::Int32
    obj_get_int32(obj, _PropertyIndex.Phases)
end

"""
Number of Phases, this Storage element.  Power is evenly divided among phases.

Name: `Phases`
Default: 3

(Setter)
"""
function Phases(obj::Obj, value::Int32, flags::SetterFlagsT=SetterFlagsT(0))
    obj_set_int32(obj, _PropertyIndex.Phases, value, flags)
end

"""
Bus to which the Storage element is connected.  May include specific node specification.

Name: `Bus1`

(Getter)
"""
function Bus1(obj::Obj)::String
    obj_get_str(obj, _PropertyIndex.Bus1)
end

"""
Bus to which the Storage element is connected.  May include specific node specification.

Name: `Bus1`

(Setter)
"""
function Bus1(obj::Obj, value::String, flags::SetterFlagsT=SetterFlagsT(0))
    obj_set_str(obj, _PropertyIndex.Bus1, value, flags)
end

"""
Nominal rated (1.0 per unit) voltage, kV, for Storage element. For 2- and 3-phase Storage elements, specify phase-phase kV. Otherwise, specify actual kV across each branch of the Storage element. 

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
Nominal rated (1.0 per unit) voltage, kV, for Storage element. For 2- and 3-phase Storage elements, specify phase-phase kV. Otherwise, specify actual kV across each branch of the Storage element. 

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
Get/set the requested kW value. Final kW is subjected to the inverter ratings. A positive value denotes power coming OUT of the element, which is the opposite of a Load element. A negative value indicates the Storage element is in Charging state. This value is modified internally depending on the dispatch mode.

Name: `kW`
Units: kW
Default: -0.25

(Getter)
"""
function kW(obj::Obj)::Float64
    obj_get_float64(obj, _PropertyIndex.kW)
end

"""
Get/set the requested kW value. Final kW is subjected to the inverter ratings. A positive value denotes power coming OUT of the element, which is the opposite of a Load element. A negative value indicates the Storage element is in Charging state. This value is modified internally depending on the dispatch mode.

Name: `kW`
Units: kW
Default: -0.25

(Setter)
"""
function kW(obj::Obj, value::Float64, flags::SetterFlagsT=SetterFlagsT(0))
    obj_set_float64(obj, _PropertyIndex.kW, value, flags)
end

"""
Get/set the requested kvar value. Final kvar is subjected to the inverter ratings. Sets inverter to operate in constant kvar mode.

Name: `kvar`
Units: kvar
Default: -0.0

(Getter)
"""
function kvar(obj::Obj)::Float64
    obj_get_float64(obj, _PropertyIndex.kvar)
end

"""
Get/set the requested kvar value. Final kvar is subjected to the inverter ratings. Sets inverter to operate in constant kvar mode.

Name: `kvar`
Units: kvar
Default: -0.0

(Setter)
"""
function kvar(obj::Obj, value::Float64, flags::SetterFlagsT=SetterFlagsT(0))
    obj_set_float64(obj, _PropertyIndex.kvar, value, flags)
end

"""
Get/set the requested PF value. Final PF is subjected to the inverter ratings. Sets inverter to operate in constant PF mode. Nominally, the power factor for discharging (acting as a generator). Default is 1.0. 

Enter negative for leading power factor (when kW and kvar have opposite signs.)

A positive power factor signifies kw and kvar at the same direction.

Name: `PF`
Default: 1.0

(Getter)
"""
function PF(obj::Obj)::Float64
    obj_get_float64(obj, _PropertyIndex.PF)
end

"""
Get/set the requested PF value. Final PF is subjected to the inverter ratings. Sets inverter to operate in constant PF mode. Nominally, the power factor for discharging (acting as a generator). Default is 1.0. 

Enter negative for leading power factor (when kW and kvar have opposite signs.)

A positive power factor signifies kw and kvar at the same direction.

Name: `PF`
Default: 1.0

(Setter)
"""
function PF(obj::Obj, value::Float64, flags::SetterFlagsT=SetterFlagsT(0))
    obj_set_float64(obj, _PropertyIndex.PF, value, flags)
end

"""
Indicates the inverter nameplate capability (in kVA). Used as the base for Dynamics mode and Harmonics mode values.

Name: `kVA`
Units: kVA
Default: 25.0

(Getter)
"""
function kVA(obj::Obj)::Float64
    obj_get_float64(obj, _PropertyIndex.kVA)
end

"""
Indicates the inverter nameplate capability (in kVA). Used as the base for Dynamics mode and Harmonics mode values.

Name: `kVA`
Units: kVA
Default: 25.0

(Setter)
"""
function kVA(obj::Obj, value::Float64, flags::SetterFlagsT=SetterFlagsT(0))
    obj_set_float64(obj, _PropertyIndex.kVA, value, flags)
end

"""
Cut-in power as a percentage of inverter kVA rating. It is the minimum DC power necessary to turn the inverter ON when it is OFF. Must be greater than or equal to %CutOut. Defaults to 2 for PVSystems and 0 for Storage elements which means that the inverter state will be always ON for this element.

Name: `%CutIn`
Default: 0.0

(Getter)
"""
function pctCutIn(obj::Obj)::Float64
    obj_get_float64(obj, _PropertyIndex.pctCutIn)
end

"""
Cut-in power as a percentage of inverter kVA rating. It is the minimum DC power necessary to turn the inverter ON when it is OFF. Must be greater than or equal to %CutOut. Defaults to 2 for PVSystems and 0 for Storage elements which means that the inverter state will be always ON for this element.

Name: `%CutIn`
Default: 0.0

(Setter)
"""
function pctCutIn(obj::Obj, value::Float64, flags::SetterFlagsT=SetterFlagsT(0))
    obj_set_float64(obj, _PropertyIndex.pctCutIn, value, flags)
end

"""
Cut-out power as a percentage of inverter kVA rating. It is the minimum DC power necessary to keep the inverter ON. Must be less than or equal to %CutIn. Defaults to 0, which means that, once ON, the inverter state will be always ON for this element.

Name: `%CutOut`
Default: 0.0

(Getter)
"""
function pctCutOut(obj::Obj)::Float64
    obj_get_float64(obj, _PropertyIndex.pctCutOut)
end

"""
Cut-out power as a percentage of inverter kVA rating. It is the minimum DC power necessary to keep the inverter ON. Must be less than or equal to %CutIn. Defaults to 0, which means that, once ON, the inverter state will be always ON for this element.

Name: `%CutOut`
Default: 0.0

(Setter)
"""
function pctCutOut(obj::Obj, value::Float64, flags::SetterFlagsT=SetterFlagsT(0))
    obj_set_float64(obj, _PropertyIndex.pctCutOut, value, flags)
end

"""
An XYCurve object, previously defined, that describes the PER UNIT efficiency vs PER UNIT of rated kVA for the inverter. Power at the AC side of the inverter is discounted by the multiplier obtained from this curve.

Name: `EffCurve`

(Getter)
"""
function EffCurve_str(obj::Obj)::String
    obj_get_str(obj, _PropertyIndex.EffCurve)
end

"""
An XYCurve object, previously defined, that describes the PER UNIT efficiency vs PER UNIT of rated kVA for the inverter. Power at the AC side of the inverter is discounted by the multiplier obtained from this curve.

Name: `EffCurve`

(Setter)
"""
function EffCurve_str(obj::Obj, value::String, flags::SetterFlagsT=SetterFlagsT(0))
    obj_set_str(obj, _PropertyIndex.EffCurve, value, flags)
end

"""
An XYCurve object, previously defined, that describes the PER UNIT efficiency vs PER UNIT of rated kVA for the inverter. Power at the AC side of the inverter is discounted by the multiplier obtained from this curve.

Name: `EffCurve`

(Getter)
"""
function EffCurve(obj)::Union{XYcurveObj, Nothing}
    obj_get_obj(obj,_PropertyIndex.EffCurve, XYcurveObj)
end

"""
An XYCurve object, previously defined, that describes the PER UNIT efficiency vs PER UNIT of rated kVA for the inverter. Power at the AC side of the inverter is discounted by the multiplier obtained from this curve.

Name: `EffCurve`

(Setter)
"""
function EffCurve(obj::Obj, value::Union{XYcurveObj, Nothing}, flags::SetterFlagsT=SetterFlagsT(0))
    obj_set_obj(obj, _PropertyIndex.EffCurve, value, flags)
end

"""
An XYCurve object, previously defined, that describes the PER UNIT efficiency vs PER UNIT of rated kVA for the inverter. Power at the AC side of the inverter is discounted by the multiplier obtained from this curve.

Name: `EffCurve`

(Setter)
"""
function EffCurve(obj::Obj, value::String, flags::SetterFlagsT=SetterFlagsT(0))
    obj_set_str(obj, _PropertyIndex.EffCurve, value, flags)
end

"""
A false value indicates that the reactive power generation/absorption does not respect the inverter status. When set to True, the reactive power generation/absorption will cease when the inverter status is off, due to DC kW dropping below %CutOut.  The reactive power generation/absorption will begin again when the DC kW is above %CutIn.  When set to False, the Storage will generate/absorb reactive power regardless of the status of the inverter.

Name: `VarFollowInverter`
Default: False

(Getter)
"""
function VarFollowInverter(obj::Obj)::Bool
    return obj_get_bool(obj, _PropertyIndex.VarFollowInverter)
end

"""
A false value indicates that the reactive power generation/absorption does not respect the inverter status. When set to True, the reactive power generation/absorption will cease when the inverter status is off, due to DC kW dropping below %CutOut.  The reactive power generation/absorption will begin again when the DC kW is above %CutIn.  When set to False, the Storage will generate/absorb reactive power regardless of the status of the inverter.

Name: `VarFollowInverter`
Default: False

(Setter)
"""
function VarFollowInverter(obj::Obj, value::Bool, flags::SetterFlagsT=SetterFlagsT(0))
    obj_set_bool(obj, _PropertyIndex.VarFollowInverter, value, flags)
end

"""
Indicates the maximum reactive power GENERATION (un-signed numerical variable in kvar) for the inverter. Defaults to kVA rating of the inverter.

Name: `kvarMax`
Units: kvar

(Getter)
"""
function kvarMax(obj::Obj)::Float64
    obj_get_float64(obj, _PropertyIndex.kvarMax)
end

"""
Indicates the maximum reactive power GENERATION (un-signed numerical variable in kvar) for the inverter. Defaults to kVA rating of the inverter.

Name: `kvarMax`
Units: kvar

(Setter)
"""
function kvarMax(obj::Obj, value::Float64, flags::SetterFlagsT=SetterFlagsT(0))
    obj_set_float64(obj, _PropertyIndex.kvarMax, value, flags)
end

"""
Indicates the maximum reactive power ABSORPTION (un-signed numerical variable in kvar) for the inverter. Defaults to kvarMax.

Name: `kvarMaxAbs`
Units: kvar

(Getter)
"""
function kvarMaxAbs(obj::Obj)::Float64
    obj_get_float64(obj, _PropertyIndex.kvarMaxAbs)
end

"""
Indicates the maximum reactive power ABSORPTION (un-signed numerical variable in kvar) for the inverter. Defaults to kvarMax.

Name: `kvarMaxAbs`
Units: kvar

(Setter)
"""
function kvarMaxAbs(obj::Obj, value::Float64, flags::SetterFlagsT=SetterFlagsT(0))
    obj_set_float64(obj, _PropertyIndex.kvarMaxAbs, value, flags)
end

"""
Set inverter to watt priority instead of the default var priority.

Name: `WattPriority`
Default: False

(Getter)
"""
function WattPriority(obj::Obj)::Bool
    return obj_get_bool(obj, _PropertyIndex.WattPriority)
end

"""
Set inverter to watt priority instead of the default var priority.

Name: `WattPriority`
Default: False

(Setter)
"""
function WattPriority(obj::Obj, value::Bool, flags::SetterFlagsT=SetterFlagsT(0))
    obj_set_bool(obj, _PropertyIndex.WattPriority, value, flags)
end

"""
If set to true, priority is given to power factor and WattPriority is neglected. It works only if operating in either constant PF or constant kvar modes. Defaults to False.

Name: `PFPriority`
Default: False

(Getter)
"""
function PFPriority(obj::Obj)::Bool
    return obj_get_bool(obj, _PropertyIndex.PFPriority)
end

"""
If set to true, priority is given to power factor and WattPriority is neglected. It works only if operating in either constant PF or constant kvar modes. Defaults to False.

Name: `PFPriority`
Default: False

(Setter)
"""
function PFPriority(obj::Obj, value::Bool, flags::SetterFlagsT=SetterFlagsT(0))
    obj_set_bool(obj, _PropertyIndex.PFPriority, value, flags)
end

"""
Minimum active power as percentage of kWrated under which there is no vars production/absorption. Defaults to 0 (disabled).

Name: `%PMinNoVars`
Default: 0.0

(Getter)
"""
function pctPMinNoVars(obj::Obj)::Float64
    obj_get_float64(obj, _PropertyIndex.pctPMinNoVars)
end

"""
Minimum active power as percentage of kWrated under which there is no vars production/absorption. Defaults to 0 (disabled).

Name: `%PMinNoVars`
Default: 0.0

(Setter)
"""
function pctPMinNoVars(obj::Obj, value::Float64, flags::SetterFlagsT=SetterFlagsT(0))
    obj_set_float64(obj, _PropertyIndex.pctPMinNoVars, value, flags)
end

"""
Minimum active power as percentage of kWrated that allows the inverter to produce/absorb reactive power up to its maximum reactive power, which can be either kvarMax or kvarMaxAbs, depending on the current operation quadrant. Defaults to 0 (disabled).

Name: `%PMinkvarMax`
Default: 0.0

(Getter)
"""
function pctPMinkvarMax(obj::Obj)::Float64
    obj_get_float64(obj, _PropertyIndex.pctPMinkvarMax)
end

"""
Minimum active power as percentage of kWrated that allows the inverter to produce/absorb reactive power up to its maximum reactive power, which can be either kvarMax or kvarMaxAbs, depending on the current operation quadrant. Defaults to 0 (disabled).

Name: `%PMinkvarMax`
Default: 0.0

(Setter)
"""
function pctPMinkvarMax(obj::Obj, value::Float64, flags::SetterFlagsT=SetterFlagsT(0))
    obj_set_float64(obj, _PropertyIndex.pctPMinkvarMax, value, flags)
end

"""
kW rating of power output. Base for Loadshapes when DispMode=Follow. Sets kVA property if it has not been specified yet. Defaults to 25.

Name: `kWRated`
Units: kW
Default: 25.0

(Getter)
"""
function kWRated(obj::Obj)::Float64
    obj_get_float64(obj, _PropertyIndex.kWRated)
end

"""
kW rating of power output. Base for Loadshapes when DispMode=Follow. Sets kVA property if it has not been specified yet. Defaults to 25.

Name: `kWRated`
Units: kW
Default: 25.0

(Setter)
"""
function kWRated(obj::Obj, value::Float64, flags::SetterFlagsT=SetterFlagsT(0))
    obj_set_float64(obj, _PropertyIndex.kWRated, value, flags)
end

"""
Upper limit on active power as a percentage of kWrated. Defaults to 100 (disabled).

Name: `%kWRated`
Default: 100.0

(Getter)
"""
function pctkWRated(obj::Obj)::Float64
    obj_get_float64(obj, _PropertyIndex.pctkWRated)
end

"""
Upper limit on active power as a percentage of kWrated. Defaults to 100 (disabled).

Name: `%kWRated`
Default: 100.0

(Setter)
"""
function pctkWRated(obj::Obj, value::Float64, flags::SetterFlagsT=SetterFlagsT(0))
    obj_set_float64(obj, _PropertyIndex.pctkWRated, value, flags)
end

"""
Rated Storage capacity in kWh.

Name: `kWhRated`
Units: kWh
Default: 50.0

(Getter)
"""
function kWhRated(obj::Obj)::Float64
    obj_get_float64(obj, _PropertyIndex.kWhRated)
end

"""
Rated Storage capacity in kWh.

Name: `kWhRated`
Units: kWh
Default: 50.0

(Setter)
"""
function kWhRated(obj::Obj, value::Float64, flags::SetterFlagsT=SetterFlagsT(0))
    obj_set_float64(obj, _PropertyIndex.kWhRated, value, flags)
end

"""
Present amount of energy stored, kWh. Default is same as kWhrated.

Name: `kWhStored`
Units: kWh

(Getter)
"""
function kWhStored(obj::Obj)::Float64
    obj_get_float64(obj, _PropertyIndex.kWhStored)
end

"""
Present amount of energy stored, kWh. Default is same as kWhrated.

Name: `kWhStored`
Units: kWh

(Setter)
"""
function kWhStored(obj::Obj, value::Float64, flags::SetterFlagsT=SetterFlagsT(0))
    obj_set_float64(obj, _PropertyIndex.kWhStored, value, flags)
end

"""
Present amount of energy stored, % of rated kWh.

Name: `%Stored`
Default: 100.0

(Getter)
"""
function pctStored(obj::Obj)::Float64
    obj_get_float64(obj, _PropertyIndex.pctStored)
end

"""
Present amount of energy stored, % of rated kWh.

Name: `%Stored`
Default: 100.0

(Setter)
"""
function pctStored(obj::Obj, value::Float64, flags::SetterFlagsT=SetterFlagsT(0))
    obj_set_float64(obj, _PropertyIndex.pctStored, value, flags)
end

"""
Percentage of rated kWh Storage capacity to be held in reserve for normal operation.
This is treated as the minimum energy discharge level unless there is an emergency. For emergency operation set this property lower. Cannot be less than zero.

Name: `%Reserve`
Default: 20.0

(Getter)
"""
function pctReserve(obj::Obj)::Float64
    obj_get_float64(obj, _PropertyIndex.pctReserve)
end

"""
Percentage of rated kWh Storage capacity to be held in reserve for normal operation.
This is treated as the minimum energy discharge level unless there is an emergency. For emergency operation set this property lower. Cannot be less than zero.

Name: `%Reserve`
Default: 20.0

(Setter)
"""
function pctReserve(obj::Obj, value::Float64, flags::SetterFlagsT=SetterFlagsT(0))
    obj_set_float64(obj, _PropertyIndex.pctReserve, value, flags)
end

"""
{IDLING | CHARGING | DISCHARGING}  Get/Set present operational state. In DISCHARGING mode, the Storage element acts as a generator and the kW property is positive. The element continues discharging at the scheduled output power level until the Storage reaches the reserve value. Then the state reverts to IDLING. In the CHARGING state, the Storage element behaves like a Load and the kW property is negative. The element continues to charge until the max Storage kWh is reached and then switches to IDLING state. In IDLING state, the element draws the idling losses plus the associated inverter losses.

Name: `State`
Default: Idling

(Getter)
"""
function State(obj::Obj)::StorageState.T
    StorageState.T(obj_get_int32(obj, _PropertyIndex.State))
end

"""
{IDLING | CHARGING | DISCHARGING}  Get/Set present operational state. In DISCHARGING mode, the Storage element acts as a generator and the kW property is positive. The element continues discharging at the scheduled output power level until the Storage reaches the reserve value. Then the state reverts to IDLING. In the CHARGING state, the Storage element behaves like a Load and the kW property is negative. The element continues to charge until the max Storage kWh is reached and then switches to IDLING state. In IDLING state, the element draws the idling losses plus the associated inverter losses.

Name: `State`
Default: Idling

(Setter)
"""
function State(obj::Obj, value::String, flags::SetterFlagsT=SetterFlagsT(0))
    obj_set_str(obj, _PropertyIndex.State, value, flags)
end

"""
{IDLING | CHARGING | DISCHARGING}  Get/Set present operational state. In DISCHARGING mode, the Storage element acts as a generator and the kW property is positive. The element continues discharging at the scheduled output power level until the Storage reaches the reserve value. Then the state reverts to IDLING. In the CHARGING state, the Storage element behaves like a Load and the kW property is negative. The element continues to charge until the max Storage kWh is reached and then switches to IDLING state. In IDLING state, the element draws the idling losses plus the associated inverter losses.

Name: `State`
Default: Idling

(Setter)
"""
function State(obj::Obj, value::Union{Int,StorageState.T}, flags::SetterFlagsT=SetterFlagsT(0))
    obj_set_int32(obj, _PropertyIndex.State, Int32(value), flags)
end

"""
{IDLING | CHARGING | DISCHARGING}  Get/Set present operational state. In DISCHARGING mode, the Storage element acts as a generator and the kW property is positive. The element continues discharging at the scheduled output power level until the Storage reaches the reserve value. Then the state reverts to IDLING. In the CHARGING state, the Storage element behaves like a Load and the kW property is negative. The element continues to charge until the max Storage kWh is reached and then switches to IDLING state. In IDLING state, the element draws the idling losses plus the associated inverter losses.

Name: `State`
Default: Idling

(Getter)
"""
function State_str(obj::Obj)::String
    obj_get_str(obj, _PropertyIndex.State)
end

"""
{IDLING | CHARGING | DISCHARGING}  Get/Set present operational state. In DISCHARGING mode, the Storage element acts as a generator and the kW property is positive. The element continues discharging at the scheduled output power level until the Storage reaches the reserve value. Then the state reverts to IDLING. In the CHARGING state, the Storage element behaves like a Load and the kW property is negative. The element continues to charge until the max Storage kWh is reached and then switches to IDLING state. In IDLING state, the element draws the idling losses plus the associated inverter losses.

Name: `State`
Default: Idling

(Setter)
"""
function State_str(obj::Obj, value::String, flags::SetterFlagsT=SetterFlagsT(0))
    State(obj, value, flags)
end

"""
Discharge rate (output power) in percentage of rated kW.

Name: `%Discharge`
Default: 100.0

(Getter)
"""
function pctDischarge(obj::Obj)::Float64
    obj_get_float64(obj, _PropertyIndex.pctDischarge)
end

"""
Discharge rate (output power) in percentage of rated kW.

Name: `%Discharge`
Default: 100.0

(Setter)
"""
function pctDischarge(obj::Obj, value::Float64, flags::SetterFlagsT=SetterFlagsT(0))
    obj_set_float64(obj, _PropertyIndex.pctDischarge, value, flags)
end

"""
Charging rate (input power) in percentage of rated kW.

Name: `%Charge`
Default: 100.0

(Getter)
"""
function pctCharge(obj::Obj)::Float64
    obj_get_float64(obj, _PropertyIndex.pctCharge)
end

"""
Charging rate (input power) in percentage of rated kW.

Name: `%Charge`
Default: 100.0

(Setter)
"""
function pctCharge(obj::Obj, value::Float64, flags::SetterFlagsT=SetterFlagsT(0))
    obj_set_float64(obj, _PropertyIndex.pctCharge, value, flags)
end

"""
Percentage efficiency for CHARGING the Storage element.

Name: `%EffCharge`
Default: 90.0

(Getter)
"""
function pctEffCharge(obj::Obj)::Float64
    obj_get_float64(obj, _PropertyIndex.pctEffCharge)
end

"""
Percentage efficiency for CHARGING the Storage element.

Name: `%EffCharge`
Default: 90.0

(Setter)
"""
function pctEffCharge(obj::Obj, value::Float64, flags::SetterFlagsT=SetterFlagsT(0))
    obj_set_float64(obj, _PropertyIndex.pctEffCharge, value, flags)
end

"""
Percentage efficiency for DISCHARGING the Storage element.

Name: `%EffDischarge`
Default: 90.0

(Getter)
"""
function pctEffDischarge(obj::Obj)::Float64
    obj_get_float64(obj, _PropertyIndex.pctEffDischarge)
end

"""
Percentage efficiency for DISCHARGING the Storage element.

Name: `%EffDischarge`
Default: 90.0

(Setter)
"""
function pctEffDischarge(obj::Obj, value::Float64, flags::SetterFlagsT=SetterFlagsT(0))
    obj_set_float64(obj, _PropertyIndex.pctEffDischarge, value, flags)
end

"""
Percentage of rated kW consumed by idling losses.

Name: `%IdlingkW`
Default: 1.0

(Getter)
"""
function pctIdlingkW(obj::Obj)::Float64
    obj_get_float64(obj, _PropertyIndex.pctIdlingkW)
end

"""
Percentage of rated kW consumed by idling losses.

Name: `%IdlingkW`
Default: 1.0

(Setter)
"""
function pctIdlingkW(obj::Obj, value::Float64, flags::SetterFlagsT=SetterFlagsT(0))
    obj_set_float64(obj, _PropertyIndex.pctIdlingkW, value, flags)
end

"""
Equivalent percentage internal resistance, ohms. Placed in series with internal voltage source for harmonics and dynamics modes. Use a combination of %IdlingkW, %EffCharge and %EffDischarge to account for losses in power flow modes.

Name: `%R`
Default: 0.0

(Getter)
"""
function pctR(obj::Obj)::Float64
    obj_get_float64(obj, _PropertyIndex.pctR)
end

"""
Equivalent percentage internal resistance, ohms. Placed in series with internal voltage source for harmonics and dynamics modes. Use a combination of %IdlingkW, %EffCharge and %EffDischarge to account for losses in power flow modes.

Name: `%R`
Default: 0.0

(Setter)
"""
function pctR(obj::Obj, value::Float64, flags::SetterFlagsT=SetterFlagsT(0))
    obj_set_float64(obj, _PropertyIndex.pctR, value, flags)
end

"""
Equivalent percentage internal reactance, ohms. Placed in series with internal voltage source for harmonics and dynamics modes. (Limits fault current to 2 pu.

Name: `%X`
Default: 50.0

(Getter)
"""
function pctX(obj::Obj)::Float64
    obj_get_float64(obj, _PropertyIndex.pctX)
end

"""
Equivalent percentage internal reactance, ohms. Placed in series with internal voltage source for harmonics and dynamics modes. (Limits fault current to 2 pu.

Name: `%X`
Default: 50.0

(Setter)
"""
function pctX(obj::Obj, value::Float64, flags::SetterFlagsT=SetterFlagsT(0))
    obj_set_float64(obj, _PropertyIndex.pctX, value, flags)
end

"""
Integer code (default=1) for the model to be used for power output variation with voltage. Valid values are:

1:Storage element injects/absorbs a CONSTANT power.
2:Storage element is modeled as a CONSTANT IMPEDANCE.
3:Compute load injection from User-written Model.

Name: `Model`
Default: 1

(Getter)
"""
function Model(obj::Obj)::Int32
    obj_get_int32(obj, _PropertyIndex.Model)
end

"""
Integer code (default=1) for the model to be used for power output variation with voltage. Valid values are:

1:Storage element injects/absorbs a CONSTANT power.
2:Storage element is modeled as a CONSTANT IMPEDANCE.
3:Compute load injection from User-written Model.

Name: `Model`
Default: 1

(Setter)
"""
function Model(obj::Obj, value::Int32, flags::SetterFlagsT=SetterFlagsT(0))
    obj_set_int32(obj, _PropertyIndex.Model, value, flags)
end

"""
Default = 0.90.  Minimum per unit voltage for which the Model is assumed to apply. Below this value, the load model reverts to a constant impedance model.

Name: `VMinpu`
Default: 0.9

(Getter)
"""
function VMinpu(obj::Obj)::Float64
    obj_get_float64(obj, _PropertyIndex.VMinpu)
end

"""
Default = 0.90.  Minimum per unit voltage for which the Model is assumed to apply. Below this value, the load model reverts to a constant impedance model.

Name: `VMinpu`
Default: 0.9

(Setter)
"""
function VMinpu(obj::Obj, value::Float64, flags::SetterFlagsT=SetterFlagsT(0))
    obj_set_float64(obj, _PropertyIndex.VMinpu, value, flags)
end

"""
Default = 1.10.  Maximum per unit voltage for which the Model is assumed to apply. Above this value, the load model reverts to a constant impedance model.

Name: `VMaxpu`
Default: 1.1

(Getter)
"""
function VMaxpu(obj::Obj)::Float64
    obj_get_float64(obj, _PropertyIndex.VMaxpu)
end

"""
Default = 1.10.  Maximum per unit voltage for which the Model is assumed to apply. Above this value, the load model reverts to a constant impedance model.

Name: `VMaxpu`
Default: 1.1

(Setter)
"""
function VMaxpu(obj::Obj, value::Float64, flags::SetterFlagsT=SetterFlagsT(0))
    obj_set_float64(obj, _PropertyIndex.VMaxpu, value, flags)
end

"""
Force balanced current only for 3-phase Storage. Forces zero- and negative-sequence to zero. 

Name: `Balanced`
Default: False

(Getter)
"""
function Balanced(obj::Obj)::Bool
    return obj_get_bool(obj, _PropertyIndex.Balanced)
end

"""
Force balanced current only for 3-phase Storage. Forces zero- and negative-sequence to zero. 

Name: `Balanced`
Default: False

(Setter)
"""
function Balanced(obj::Obj, value::Bool, flags::SetterFlagsT=SetterFlagsT(0))
    obj_set_bool(obj, _PropertyIndex.Balanced, value, flags)
end

"""
Limits current magnitude to Vminpu value for both 1-phase and 3-phase Storage similar to Generator Model 7. For 3-phase, limits the positive-sequence current but not the negative-sequence.

Name: `LimitCurrent`
Default: False

(Getter)
"""
function LimitCurrent(obj::Obj)::Bool
    return obj_get_bool(obj, _PropertyIndex.LimitCurrent)
end

"""
Limits current magnitude to Vminpu value for both 1-phase and 3-phase Storage similar to Generator Model 7. For 3-phase, limits the positive-sequence current but not the negative-sequence.

Name: `LimitCurrent`
Default: False

(Setter)
"""
function LimitCurrent(obj::Obj, value::Bool, flags::SetterFlagsT=SetterFlagsT(0))
    obj_set_bool(obj, _PropertyIndex.LimitCurrent, value, flags)
end

"""
Dispatch shape to use for yearly simulations.  Must be previously defined as a Loadshape object. If this is not specified, the Daily dispatch shape, if any, is repeated during Yearly solution modes. In the default dispatch mode, the Storage element uses this loadshape to trigger State changes.

Name: `Yearly`

(Getter)
"""
function Yearly_str(obj::Obj)::String
    obj_get_str(obj, _PropertyIndex.Yearly)
end

"""
Dispatch shape to use for yearly simulations.  Must be previously defined as a Loadshape object. If this is not specified, the Daily dispatch shape, if any, is repeated during Yearly solution modes. In the default dispatch mode, the Storage element uses this loadshape to trigger State changes.

Name: `Yearly`

(Setter)
"""
function Yearly_str(obj::Obj, value::String, flags::SetterFlagsT=SetterFlagsT(0))
    obj_set_str(obj, _PropertyIndex.Yearly, value, flags)
end

"""
Dispatch shape to use for yearly simulations.  Must be previously defined as a Loadshape object. If this is not specified, the Daily dispatch shape, if any, is repeated during Yearly solution modes. In the default dispatch mode, the Storage element uses this loadshape to trigger State changes.

Name: `Yearly`

(Getter)
"""
function Yearly(obj)::Union{LoadShapeObj, Nothing}
    obj_get_obj(obj,_PropertyIndex.Yearly, LoadShapeObj)
end

"""
Dispatch shape to use for yearly simulations.  Must be previously defined as a Loadshape object. If this is not specified, the Daily dispatch shape, if any, is repeated during Yearly solution modes. In the default dispatch mode, the Storage element uses this loadshape to trigger State changes.

Name: `Yearly`

(Setter)
"""
function Yearly(obj::Obj, value::Union{LoadShapeObj, Nothing}, flags::SetterFlagsT=SetterFlagsT(0))
    obj_set_obj(obj, _PropertyIndex.Yearly, value, flags)
end

"""
Dispatch shape to use for yearly simulations.  Must be previously defined as a Loadshape object. If this is not specified, the Daily dispatch shape, if any, is repeated during Yearly solution modes. In the default dispatch mode, the Storage element uses this loadshape to trigger State changes.

Name: `Yearly`

(Setter)
"""
function Yearly(obj::Obj, value::String, flags::SetterFlagsT=SetterFlagsT(0))
    obj_set_str(obj, _PropertyIndex.Yearly, value, flags)
end

"""
Dispatch shape to use for daily simulations.  Must be previously defined as a Loadshape object of 24 hrs, typically.  In the default dispatch mode, the Storage element uses this loadshape to trigger State changes.

Name: `Daily`

(Getter)
"""
function Daily_str(obj::Obj)::String
    obj_get_str(obj, _PropertyIndex.Daily)
end

"""
Dispatch shape to use for daily simulations.  Must be previously defined as a Loadshape object of 24 hrs, typically.  In the default dispatch mode, the Storage element uses this loadshape to trigger State changes.

Name: `Daily`

(Setter)
"""
function Daily_str(obj::Obj, value::String, flags::SetterFlagsT=SetterFlagsT(0))
    obj_set_str(obj, _PropertyIndex.Daily, value, flags)
end

"""
Dispatch shape to use for daily simulations.  Must be previously defined as a Loadshape object of 24 hrs, typically.  In the default dispatch mode, the Storage element uses this loadshape to trigger State changes.

Name: `Daily`

(Getter)
"""
function Daily(obj)::Union{LoadShapeObj, Nothing}
    obj_get_obj(obj,_PropertyIndex.Daily, LoadShapeObj)
end

"""
Dispatch shape to use for daily simulations.  Must be previously defined as a Loadshape object of 24 hrs, typically.  In the default dispatch mode, the Storage element uses this loadshape to trigger State changes.

Name: `Daily`

(Setter)
"""
function Daily(obj::Obj, value::Union{LoadShapeObj, Nothing}, flags::SetterFlagsT=SetterFlagsT(0))
    obj_set_obj(obj, _PropertyIndex.Daily, value, flags)
end

"""
Dispatch shape to use for daily simulations.  Must be previously defined as a Loadshape object of 24 hrs, typically.  In the default dispatch mode, the Storage element uses this loadshape to trigger State changes.

Name: `Daily`

(Setter)
"""
function Daily(obj::Obj, value::String, flags::SetterFlagsT=SetterFlagsT(0))
    obj_set_str(obj, _PropertyIndex.Daily, value, flags)
end

"""
Load shape to use for duty cycle dispatch simulations such as for solar ramp rate studies. Must be previously defined as a Loadshape object. 

Typically would have time intervals of 1-5 seconds. 

Designate the number of points to solve using the Set Number=xxxx command. If there are fewer points in the actual shape, the shape is assumed to repeat.

Name: `Duty`

(Getter)
"""
function Duty_str(obj::Obj)::String
    obj_get_str(obj, _PropertyIndex.Duty)
end

"""
Load shape to use for duty cycle dispatch simulations such as for solar ramp rate studies. Must be previously defined as a Loadshape object. 

Typically would have time intervals of 1-5 seconds. 

Designate the number of points to solve using the Set Number=xxxx command. If there are fewer points in the actual shape, the shape is assumed to repeat.

Name: `Duty`

(Setter)
"""
function Duty_str(obj::Obj, value::String, flags::SetterFlagsT=SetterFlagsT(0))
    obj_set_str(obj, _PropertyIndex.Duty, value, flags)
end

"""
Load shape to use for duty cycle dispatch simulations such as for solar ramp rate studies. Must be previously defined as a Loadshape object. 

Typically would have time intervals of 1-5 seconds. 

Designate the number of points to solve using the Set Number=xxxx command. If there are fewer points in the actual shape, the shape is assumed to repeat.

Name: `Duty`

(Getter)
"""
function Duty(obj)::Union{LoadShapeObj, Nothing}
    obj_get_obj(obj,_PropertyIndex.Duty, LoadShapeObj)
end

"""
Load shape to use for duty cycle dispatch simulations such as for solar ramp rate studies. Must be previously defined as a Loadshape object. 

Typically would have time intervals of 1-5 seconds. 

Designate the number of points to solve using the Set Number=xxxx command. If there are fewer points in the actual shape, the shape is assumed to repeat.

Name: `Duty`

(Setter)
"""
function Duty(obj::Obj, value::Union{LoadShapeObj, Nothing}, flags::SetterFlagsT=SetterFlagsT(0))
    obj_set_obj(obj, _PropertyIndex.Duty, value, flags)
end

"""
Load shape to use for duty cycle dispatch simulations such as for solar ramp rate studies. Must be previously defined as a Loadshape object. 

Typically would have time intervals of 1-5 seconds. 

Designate the number of points to solve using the Set Number=xxxx command. If there are fewer points in the actual shape, the shape is assumed to repeat.

Name: `Duty`

(Setter)
"""
function Duty(obj::Obj, value::String, flags::SetterFlagsT=SetterFlagsT(0))
    obj_set_str(obj, _PropertyIndex.Duty, value, flags)
end

"""
{DEFAULT | FOLLOW | EXTERNAL | LOADLEVEL | PRICE } Default = "DEFAULT". Dispatch mode. 

In DEFAULT mode, Storage element state is triggered to discharge or charge at the specified rate by the loadshape curve corresponding to the solution mode. 

In FOLLOW mode the kW output of the Storage element follows the active loadshape multiplier until Storage is either exhausted or full. The element discharges for positive values and charges for negative values.  The loadshape is based on rated kW. 

In EXTERNAL mode, Storage element state is controlled by an external Storagecontroller. This mode is automatically set if this Storage element is included in the element list of a StorageController element. 

For the other two dispatch modes, the Storage element state is controlled by either the global default Loadlevel value or the price level. 

Name: `DispMode`
Default: Default

(Getter)
"""
function DispMode(obj::Obj)::StorageDispatchMode.T
    StorageDispatchMode.T(obj_get_int32(obj, _PropertyIndex.DispMode))
end

"""
{DEFAULT | FOLLOW | EXTERNAL | LOADLEVEL | PRICE } Default = "DEFAULT". Dispatch mode. 

In DEFAULT mode, Storage element state is triggered to discharge or charge at the specified rate by the loadshape curve corresponding to the solution mode. 

In FOLLOW mode the kW output of the Storage element follows the active loadshape multiplier until Storage is either exhausted or full. The element discharges for positive values and charges for negative values.  The loadshape is based on rated kW. 

In EXTERNAL mode, Storage element state is controlled by an external Storagecontroller. This mode is automatically set if this Storage element is included in the element list of a StorageController element. 

For the other two dispatch modes, the Storage element state is controlled by either the global default Loadlevel value or the price level. 

Name: `DispMode`
Default: Default

(Setter)
"""
function DispMode(obj::Obj, value::String, flags::SetterFlagsT=SetterFlagsT(0))
    obj_set_str(obj, _PropertyIndex.DispMode, value, flags)
end

"""
{DEFAULT | FOLLOW | EXTERNAL | LOADLEVEL | PRICE } Default = "DEFAULT". Dispatch mode. 

In DEFAULT mode, Storage element state is triggered to discharge or charge at the specified rate by the loadshape curve corresponding to the solution mode. 

In FOLLOW mode the kW output of the Storage element follows the active loadshape multiplier until Storage is either exhausted or full. The element discharges for positive values and charges for negative values.  The loadshape is based on rated kW. 

In EXTERNAL mode, Storage element state is controlled by an external Storagecontroller. This mode is automatically set if this Storage element is included in the element list of a StorageController element. 

For the other two dispatch modes, the Storage element state is controlled by either the global default Loadlevel value or the price level. 

Name: `DispMode`
Default: Default

(Setter)
"""
function DispMode(obj::Obj, value::Union{Int,StorageDispatchMode.T}, flags::SetterFlagsT=SetterFlagsT(0))
    obj_set_int32(obj, _PropertyIndex.DispMode, Int32(value), flags)
end

"""
{DEFAULT | FOLLOW | EXTERNAL | LOADLEVEL | PRICE } Default = "DEFAULT". Dispatch mode. 

In DEFAULT mode, Storage element state is triggered to discharge or charge at the specified rate by the loadshape curve corresponding to the solution mode. 

In FOLLOW mode the kW output of the Storage element follows the active loadshape multiplier until Storage is either exhausted or full. The element discharges for positive values and charges for negative values.  The loadshape is based on rated kW. 

In EXTERNAL mode, Storage element state is controlled by an external Storagecontroller. This mode is automatically set if this Storage element is included in the element list of a StorageController element. 

For the other two dispatch modes, the Storage element state is controlled by either the global default Loadlevel value or the price level. 

Name: `DispMode`
Default: Default

(Getter)
"""
function DispMode_str(obj::Obj)::String
    obj_get_str(obj, _PropertyIndex.DispMode)
end

"""
{DEFAULT | FOLLOW | EXTERNAL | LOADLEVEL | PRICE } Default = "DEFAULT". Dispatch mode. 

In DEFAULT mode, Storage element state is triggered to discharge or charge at the specified rate by the loadshape curve corresponding to the solution mode. 

In FOLLOW mode the kW output of the Storage element follows the active loadshape multiplier until Storage is either exhausted or full. The element discharges for positive values and charges for negative values.  The loadshape is based on rated kW. 

In EXTERNAL mode, Storage element state is controlled by an external Storagecontroller. This mode is automatically set if this Storage element is included in the element list of a StorageController element. 

For the other two dispatch modes, the Storage element state is controlled by either the global default Loadlevel value or the price level. 

Name: `DispMode`
Default: Default

(Setter)
"""
function DispMode_str(obj::Obj, value::String, flags::SetterFlagsT=SetterFlagsT(0))
    DispMode(obj, value, flags)
end

"""
Dispatch trigger value for discharging the Storage. 
If = 0 the Storage element state is changed by the State command or by a StorageController object. 
If ≠ 0  the Storage element state is set to DISCHARGING when this trigger level is EXCEEDED by either the specified Loadshape curve value or the price signal or global Loadlevel value, depending on dispatch mode. See State property.

Name: `DischargeTrigger`
Default: 0.0

(Getter)
"""
function DischargeTrigger(obj::Obj)::Float64
    obj_get_float64(obj, _PropertyIndex.DischargeTrigger)
end

"""
Dispatch trigger value for discharging the Storage. 
If = 0 the Storage element state is changed by the State command or by a StorageController object. 
If ≠ 0  the Storage element state is set to DISCHARGING when this trigger level is EXCEEDED by either the specified Loadshape curve value or the price signal or global Loadlevel value, depending on dispatch mode. See State property.

Name: `DischargeTrigger`
Default: 0.0

(Setter)
"""
function DischargeTrigger(obj::Obj, value::Float64, flags::SetterFlagsT=SetterFlagsT(0))
    obj_set_float64(obj, _PropertyIndex.DischargeTrigger, value, flags)
end

"""
Dispatch trigger value for charging the Storage. 

If = 0 the Storage element state is changed by the State command or StorageController object.  

If ≠ 0  the Storage element state is set to CHARGING when this trigger level is GREATER than either the specified Loadshape curve value or the price signal or global Loadlevel value, depending on dispatch mode. See State property.

Name: `ChargeTrigger`
Default: 0.0

(Getter)
"""
function ChargeTrigger(obj::Obj)::Float64
    obj_get_float64(obj, _PropertyIndex.ChargeTrigger)
end

"""
Dispatch trigger value for charging the Storage. 

If = 0 the Storage element state is changed by the State command or StorageController object.  

If ≠ 0  the Storage element state is set to CHARGING when this trigger level is GREATER than either the specified Loadshape curve value or the price signal or global Loadlevel value, depending on dispatch mode. See State property.

Name: `ChargeTrigger`
Default: 0.0

(Setter)
"""
function ChargeTrigger(obj::Obj, value::Float64, flags::SetterFlagsT=SetterFlagsT(0))
    obj_set_float64(obj, _PropertyIndex.ChargeTrigger, value, flags)
end

"""
Time of day in fractional hours (0230 = 2.5) at which Storage element will automatically go into charge state. Enter a negative time value to disable this feature.

Name: `TimeChargeTrig`
Units: hour (0-24)
Default: 2.0

(Getter)
"""
function TimeChargeTrig(obj::Obj)::Float64
    obj_get_float64(obj, _PropertyIndex.TimeChargeTrig)
end

"""
Time of day in fractional hours (0230 = 2.5) at which Storage element will automatically go into charge state. Enter a negative time value to disable this feature.

Name: `TimeChargeTrig`
Units: hour (0-24)
Default: 2.0

(Setter)
"""
function TimeChargeTrig(obj::Obj, value::Float64, flags::SetterFlagsT=SetterFlagsT(0))
    obj_set_float64(obj, _PropertyIndex.TimeChargeTrig, value, flags)
end

"""
An arbitrary integer number representing the class of Storage element so that Storage values may be segregated by class.

Name: `Class`
Default: 1

(Getter)
"""
function Class(obj::Obj)::Int32
    obj_get_int32(obj, _PropertyIndex.Class)
end

"""
An arbitrary integer number representing the class of Storage element so that Storage values may be segregated by class.

Name: `Class`
Default: 1

(Setter)
"""
function Class(obj::Obj, value::Int32, flags::SetterFlagsT=SetterFlagsT(0))
    obj_set_int32(obj, _PropertyIndex.Class, value, flags)
end

"""
Name of DLL containing user-written dynamics model, which computes the terminal currents for Dynamics-mode simulations, overriding the default model.  Set to "none" to negate previous setting. This DLL has a simpler interface than the UserModel DLL and is only used for Dynamics mode.

Name: `DynaDLL`

(Getter)
"""
function DynaDLL(obj::Obj)::String
    obj_get_str(obj, _PropertyIndex.DynaDLL)
end

"""
Name of DLL containing user-written dynamics model, which computes the terminal currents for Dynamics-mode simulations, overriding the default model.  Set to "none" to negate previous setting. This DLL has a simpler interface than the UserModel DLL and is only used for Dynamics mode.

Name: `DynaDLL`

(Setter)
"""
function DynaDLL(obj::Obj, value::String, flags::SetterFlagsT=SetterFlagsT(0))
    obj_set_str(obj, _PropertyIndex.DynaDLL, value, flags)
end

"""
String (in quotes or parentheses if necessary) that gets passed to the user-written dynamics model Edit function for defining the data required for that model.

Name: `DynaData`

(Getter)
"""
function DynaData(obj::Obj)::String
    obj_get_str(obj, _PropertyIndex.DynaData)
end

"""
String (in quotes or parentheses if necessary) that gets passed to the user-written dynamics model Edit function for defining the data required for that model.

Name: `DynaData`

(Setter)
"""
function DynaData(obj::Obj, value::String, flags::SetterFlagsT=SetterFlagsT(0))
    obj_set_str(obj, _PropertyIndex.DynaData, value, flags)
end

"""
Name of DLL containing user-written model, which computes the terminal currents for both power flow and dynamics, overriding the default model.  Set to "none" to negate previous setting.

Name: `UserModel`

(Getter)
"""
function UserModel(obj::Obj)::String
    obj_get_str(obj, _PropertyIndex.UserModel)
end

"""
Name of DLL containing user-written model, which computes the terminal currents for both power flow and dynamics, overriding the default model.  Set to "none" to negate previous setting.

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
Turn this on to capture the progress of the Storage model for each iteration.  Creates a separate file for each Storage element named "Storage_name.csv".

Name: `DebugTrace`
Default: False

(Getter)
"""
function DebugTrace(obj::Obj)::Bool
    return obj_get_bool(obj, _PropertyIndex.DebugTrace)
end

"""
Turn this on to capture the progress of the Storage model for each iteration.  Creates a separate file for each Storage element named "Storage_name.csv".

Name: `DebugTrace`
Default: False

(Setter)
"""
function DebugTrace(obj::Obj, value::Bool, flags::SetterFlagsT=SetterFlagsT(0))
    obj_set_bool(obj, _PropertyIndex.DebugTrace, value, flags)
end

"""
Indicates the rated voltage (kV) at the input of the inverter while the storage is discharging. The value is normally greater or equal to the kV base of the Storage device. It is used for dynamics simulation ONLY.

Name: `kVDC`
Units: kV
Default: 8.0

(Getter)
"""
function kVDC(obj::Obj)::Float64
    obj_get_float64(obj, _PropertyIndex.kVDC)
end

"""
Indicates the rated voltage (kV) at the input of the inverter while the storage is discharging. The value is normally greater or equal to the kV base of the Storage device. It is used for dynamics simulation ONLY.

Name: `kVDC`
Units: kV
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
Indicates the voltage level (%) respect to the base voltage level for which the Inverter will operate. If this threshold is violated, the Inverter will enter safe mode (OFF). For dynamic simulation. By default is 80%.

Name: `SafeVoltage`
Default: 80.0

(Getter)
"""
function SafeVoltage(obj::Obj)::Float64
    obj_get_float64(obj, _PropertyIndex.SafeVoltage)
end

"""
Indicates the voltage level (%) respect to the base voltage level for which the Inverter will operate. If this threshold is violated, the Inverter will enter safe mode (OFF). For dynamic simulation. By default is 80%.

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
The name of the variables within the Dynamic equation that will be used to govern the Storage dynamics. This Storage model requires 1 output from the dynamic equation:

    1. Current.

The output variables need to be defined in the same order.

Name: `DynOut`

(Getter)
"""
function DynOut(obj::Obj)::Vector{String}
    obj_get_strs(obj, _PropertyIndex.DynOut)
end

"""
The name of the variables within the Dynamic equation that will be used to govern the Storage dynamics. This Storage model requires 1 output from the dynamic equation:

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
Units: A

(Getter)
"""
function AmpLimit(obj::Obj)::Float64
    obj_get_float64(obj, _PropertyIndex.AmpLimit)
end

"""
The current limiter per phase for the IBR when operating in GFM mode. This limit is imposed to prevent the IBR to enter into Safe Mode when reaching the IBR power ratings.
Once the IBR reaches this value, it remains there without moving into Safe Mode. This value needs to be set lower than the IBR Amps rating.

Name: `AmpLimit`
Units: A

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
Name of harmonic voltage or current spectrum for this Storage element. Current injection is assumed for inverter.

Name: `Spectrum`

(Getter)
"""
function Spectrum_str(obj::Obj)::String
    obj_get_str(obj, _PropertyIndex.Spectrum)
end

"""
Name of harmonic voltage or current spectrum for this Storage element. Current injection is assumed for inverter.

Name: `Spectrum`

(Setter)
"""
function Spectrum_str(obj::Obj, value::String, flags::SetterFlagsT=SetterFlagsT(0))
    obj_set_str(obj, _PropertyIndex.Spectrum, value, flags)
end

"""
Name of harmonic voltage or current spectrum for this Storage element. Current injection is assumed for inverter.

Name: `Spectrum`

(Getter)
"""
function Spectrum(obj)::Union{SpectrumObj, Nothing}
    obj_get_obj(obj,_PropertyIndex.Spectrum, SpectrumObj)
end

"""
Name of harmonic voltage or current spectrum for this Storage element. Current injection is assumed for inverter.

Name: `Spectrum`

(Setter)
"""
function Spectrum(obj::Obj, value::Union{SpectrumObj, Nothing}, flags::SetterFlagsT=SetterFlagsT(0))
    obj_set_obj(obj, _PropertyIndex.Spectrum, value, flags)
end

"""
Name of harmonic voltage or current spectrum for this Storage element. Current injection is assumed for inverter.

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

end # module Storage
export Storage
