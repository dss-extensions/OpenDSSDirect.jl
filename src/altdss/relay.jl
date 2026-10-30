module Relay
using ..Enums.SetterFlags: SetterFlagsT
using ..Enums: RelayAction, RelayState, RelayType
using ..TCC_Curve: TCC_CurveObj
import Base: convert
using ..Common
using ..CircuitElement
using DocStringExtensions
@template (FUNCTIONS, METHODS) = """
                                 $(TYPEDSIGNATURES)
                                 $(DOCSTRING)
                                 """


const _cls_name = "Relay"
const _cls_idx = 32

module _PropertyIndex
const MonitoredObj = Int32(1)
const MonitoredTerm = Int32(2)
const SwitchedObj = Int32(3)
const SwitchedTerm = Int32(4)
const Type = Int32(5)
const PhaseCurve = Int32(6)
const GroundCurve = Int32(7)
const PhaseTrip = Int32(8)
const GroundTrip = Int32(9)
const TDPhase = Int32(10)
const TDGround = Int32(11)
const PhaseInst = Int32(12)
const GroundInst = Int32(13)
const Reset = Int32(14)
const Shots = Int32(15)
const RecloseIntervals = Int32(16)
const Delay = Int32(17)
const OvervoltCurve = Int32(18)
const UndervoltCurve = Int32(19)
const kVBase = Int32(20)
const pctPickup47 = Int32(21)
const BaseAmps46 = Int32(22)
const pctPickup46 = Int32(23)
const isqt46 = Int32(24)
const Variable = Int32(25)
const Overtrip = Int32(26)
const Undertrip = Int32(27)
const BreakerTime = Int32(28)
const Action = Int32(29)
const Z1Mag = Int32(30)
const Z1Ang = Int32(31)
const Z0Mag = Int32(32)
const Z0Ang = Int32(33)
const MPhase = Int32(34)
const MGround = Int32(35)
const EventLog = Int32(36)
const DebugTrace = Int32(37)
const DistReverse = Int32(38)
const Normal = Int32(39)
const State = Int32(40)
const DOC_TiltAngleLow = Int32(41)
const DOC_TiltAngleHigh = Int32(42)
const DOC_TripSettingLow = Int32(43)
const DOC_TripSettingHigh = Int32(44)
const DOC_TripSettingMag = Int32(45)
const DOC_DelayInner = Int32(46)
const DOC_PhaseCurveInner = Int32(47)
const DOC_PhaseTripInner = Int32(48)
const DOC_TDPhaseInner = Int32(49)
const DOC_P1Blocking = Int32(50)
const BaseFreq = Int32(51)
const Enabled = Int32(52)
const Like = Int32(53)
end

struct RelayObj <: AbstractControlElement
    ptr::Ptr{Cvoid}
    dss::DSSContext
end
export RelayObj
Common._wrap_dss_obj(::Val{_cls_idx}, ptr::Ptr{Cvoid}, dss::DSSContext) = RelayObj(ptr, dss)
const Obj = RelayObj

function Base.show(io::IO, obj::RelayObj) 
    name = obj_get_str(obj, obj.dss.capi.Obj_GetFullName)
    print(name)
end

function Type end

include("dss_object.jl")


"""
Full object name of the circuit element, typically a line, transformer, load, or generator, to which the relay's PT and/or CT are connected. This is the "monitored" element. There is no default; must be specified.

Name: `MonitoredObj`

(Getter)
"""
function MonitoredObj_str(obj::Obj)::String
    obj_get_str(obj, _PropertyIndex.MonitoredObj)
end

"""
Full object name of the circuit element, typically a line, transformer, load, or generator, to which the relay's PT and/or CT are connected. This is the "monitored" element. There is no default; must be specified.

Name: `MonitoredObj`

(Setter)
"""
function MonitoredObj_str(obj::Obj, value::String, flags::SetterFlagsT=SetterFlagsT(0))
    obj_set_str(obj, _PropertyIndex.MonitoredObj, value, flags)
end

"""
Full object name of the circuit element, typically a line, transformer, load, or generator, to which the relay's PT and/or CT are connected. This is the "monitored" element. There is no default; must be specified.

Name: `MonitoredObj`

(Getter)
"""
function MonitoredObj(obj)::DSSObj
    obj_get_obj(obj,_PropertyIndex.MonitoredObj)
end

"""
Full object name of the circuit element, typically a line, transformer, load, or generator, to which the relay's PT and/or CT are connected. This is the "monitored" element. There is no default; must be specified.

Name: `MonitoredObj`

(Setter)
"""
function MonitoredObj(obj::Obj, value::DSSObj, flags::SetterFlagsT=SetterFlagsT(0))
    obj_set_obj(obj, _PropertyIndex.MonitoredObj, value, flags)
end

"""
Full object name of the circuit element, typically a line, transformer, load, or generator, to which the relay's PT and/or CT are connected. This is the "monitored" element. There is no default; must be specified.

Name: `MonitoredObj`

(Setter)
"""
function MonitoredObj(obj::Obj, value::String, flags::SetterFlagsT=SetterFlagsT(0))
    obj_set_str(obj, _PropertyIndex.MonitoredObj, value, flags)
end

"""
Number of the terminal of the circuit element to which the Relay is connected. 1 or 2, typically.

Name: `MonitoredTerm`
Default: 1

(Getter)
"""
function MonitoredTerm(obj::Obj)::Int32
    obj_get_int32(obj, _PropertyIndex.MonitoredTerm)
end

"""
Number of the terminal of the circuit element to which the Relay is connected. 1 or 2, typically.

Name: `MonitoredTerm`
Default: 1

(Setter)
"""
function MonitoredTerm(obj::Obj, value::Int32, flags::SetterFlagsT=SetterFlagsT(0))
    obj_set_int32(obj, _PropertyIndex.MonitoredTerm, value, flags)
end

"""
Name of circuit element switch that the Relay controls. Specify the full object name. Defaults to the same as the Monitored element. This is the "controlled" element.

Name: `SwitchedObj`

(Getter)
"""
function SwitchedObj_str(obj::Obj)::String
    obj_get_str(obj, _PropertyIndex.SwitchedObj)
end

"""
Name of circuit element switch that the Relay controls. Specify the full object name. Defaults to the same as the Monitored element. This is the "controlled" element.

Name: `SwitchedObj`

(Setter)
"""
function SwitchedObj_str(obj::Obj, value::String, flags::SetterFlagsT=SetterFlagsT(0))
    obj_set_str(obj, _PropertyIndex.SwitchedObj, value, flags)
end

"""
Name of circuit element switch that the Relay controls. Specify the full object name. Defaults to the same as the Monitored element. This is the "controlled" element.

Name: `SwitchedObj`

(Getter)
"""
function SwitchedObj(obj)::DSSObj
    obj_get_obj(obj,_PropertyIndex.SwitchedObj)
end

"""
Name of circuit element switch that the Relay controls. Specify the full object name. Defaults to the same as the Monitored element. This is the "controlled" element.

Name: `SwitchedObj`

(Setter)
"""
function SwitchedObj(obj::Obj, value::DSSObj, flags::SetterFlagsT=SetterFlagsT(0))
    obj_set_obj(obj, _PropertyIndex.SwitchedObj, value, flags)
end

"""
Name of circuit element switch that the Relay controls. Specify the full object name. Defaults to the same as the Monitored element. This is the "controlled" element.

Name: `SwitchedObj`

(Setter)
"""
function SwitchedObj(obj::Obj, value::String, flags::SetterFlagsT=SetterFlagsT(0))
    obj_set_str(obj, _PropertyIndex.SwitchedObj, value, flags)
end

"""
Number of the terminal of the controlled element in which the switch is controlled by the Relay. 1 or 2, typically.

Name: `SwitchedTerm`
Default: 1

(Getter)
"""
function SwitchedTerm(obj::Obj)::Int32
    obj_get_int32(obj, _PropertyIndex.SwitchedTerm)
end

"""
Number of the terminal of the controlled element in which the switch is controlled by the Relay. 1 or 2, typically.

Name: `SwitchedTerm`
Default: 1

(Setter)
"""
function SwitchedTerm(obj::Obj, value::Int32, flags::SetterFlagsT=SetterFlagsT(0))
    obj_set_int32(obj, _PropertyIndex.SwitchedTerm, value, flags)
end

"""
One of a legal relay type:
  Current
  Voltage
  Reversepower
  46 (neg seq current)
  47 (neg seq voltage)
  Generic (generic over/under relay)
  Distance
  TD21
  DOC (directional overcurrent)

Default is overcurrent relay (Current) Specify the curve and pickup settings appropriate for each type. Generic relays monitor PC Element Control variables and trip on out of over/under range in definite time.

Name: `Type`
Default: Current

(Getter)
"""
function Type(obj::Obj)::RelayType.T
    RelayType.T(obj_get_int32(obj, _PropertyIndex.Type))
end

"""
One of a legal relay type:
  Current
  Voltage
  Reversepower
  46 (neg seq current)
  47 (neg seq voltage)
  Generic (generic over/under relay)
  Distance
  TD21
  DOC (directional overcurrent)

Default is overcurrent relay (Current) Specify the curve and pickup settings appropriate for each type. Generic relays monitor PC Element Control variables and trip on out of over/under range in definite time.

Name: `Type`
Default: Current

(Setter)
"""
function Type(obj::Obj, value::String, flags::SetterFlagsT=SetterFlagsT(0))
    obj_set_str(obj, _PropertyIndex.Type, value, flags)
end

"""
One of a legal relay type:
  Current
  Voltage
  Reversepower
  46 (neg seq current)
  47 (neg seq voltage)
  Generic (generic over/under relay)
  Distance
  TD21
  DOC (directional overcurrent)

Default is overcurrent relay (Current) Specify the curve and pickup settings appropriate for each type. Generic relays monitor PC Element Control variables and trip on out of over/under range in definite time.

Name: `Type`
Default: Current

(Setter)
"""
function Type(obj::Obj, value::Union{Int,RelayType.T}, flags::SetterFlagsT=SetterFlagsT(0))
    obj_set_int32(obj, _PropertyIndex.Type, Int32(value), flags)
end

"""
One of a legal relay type:
  Current
  Voltage
  Reversepower
  46 (neg seq current)
  47 (neg seq voltage)
  Generic (generic over/under relay)
  Distance
  TD21
  DOC (directional overcurrent)

Default is overcurrent relay (Current) Specify the curve and pickup settings appropriate for each type. Generic relays monitor PC Element Control variables and trip on out of over/under range in definite time.

Name: `Type`
Default: Current

(Getter)
"""
function Type_str(obj::Obj)::String
    obj_get_str(obj, _PropertyIndex.Type)
end

"""
One of a legal relay type:
  Current
  Voltage
  Reversepower
  46 (neg seq current)
  47 (neg seq voltage)
  Generic (generic over/under relay)
  Distance
  TD21
  DOC (directional overcurrent)

Default is overcurrent relay (Current) Specify the curve and pickup settings appropriate for each type. Generic relays monitor PC Element Control variables and trip on out of over/under range in definite time.

Name: `Type`
Default: Current

(Setter)
"""
function Type_str(obj::Obj, value::String, flags::SetterFlagsT=SetterFlagsT(0))
    Type(obj, value, flags)
end

"""
Name of the TCC Curve object that determines the phase trip.  Must have been previously defined as a TCC_Curve object. Default is none (ignored). For overcurrent relay, multiplying the current values in the curve by the "phasetrip" value gives the actual current.

Name: `PhaseCurve`

(Getter)
"""
function PhaseCurve_str(obj::Obj)::String
    obj_get_str(obj, _PropertyIndex.PhaseCurve)
end

"""
Name of the TCC Curve object that determines the phase trip.  Must have been previously defined as a TCC_Curve object. Default is none (ignored). For overcurrent relay, multiplying the current values in the curve by the "phasetrip" value gives the actual current.

Name: `PhaseCurve`

(Setter)
"""
function PhaseCurve_str(obj::Obj, value::String, flags::SetterFlagsT=SetterFlagsT(0))
    obj_set_str(obj, _PropertyIndex.PhaseCurve, value, flags)
end

"""
Name of the TCC Curve object that determines the phase trip.  Must have been previously defined as a TCC_Curve object. Default is none (ignored). For overcurrent relay, multiplying the current values in the curve by the "phasetrip" value gives the actual current.

Name: `PhaseCurve`

(Getter)
"""
function PhaseCurve(obj)::Union{TCC_CurveObj, Nothing}
    obj_get_obj(obj,_PropertyIndex.PhaseCurve, TCC_CurveObj)
end

"""
Name of the TCC Curve object that determines the phase trip.  Must have been previously defined as a TCC_Curve object. Default is none (ignored). For overcurrent relay, multiplying the current values in the curve by the "phasetrip" value gives the actual current.

Name: `PhaseCurve`

(Setter)
"""
function PhaseCurve(obj::Obj, value::Union{TCC_CurveObj, Nothing}, flags::SetterFlagsT=SetterFlagsT(0))
    obj_set_obj(obj, _PropertyIndex.PhaseCurve, value, flags)
end

"""
Name of the TCC Curve object that determines the phase trip.  Must have been previously defined as a TCC_Curve object. Default is none (ignored). For overcurrent relay, multiplying the current values in the curve by the "phasetrip" value gives the actual current.

Name: `PhaseCurve`

(Setter)
"""
function PhaseCurve(obj::Obj, value::String, flags::SetterFlagsT=SetterFlagsT(0))
    obj_set_str(obj, _PropertyIndex.PhaseCurve, value, flags)
end

"""
Name of the TCC Curve object that determines the ground trip.  Must have been previously defined as a TCC_Curve object. Default is none (ignored).For overcurrent relay, multiplying the current values in the curve by the "groundtrip" valuw gives the actual current.

Name: `GroundCurve`

(Getter)
"""
function GroundCurve_str(obj::Obj)::String
    obj_get_str(obj, _PropertyIndex.GroundCurve)
end

"""
Name of the TCC Curve object that determines the ground trip.  Must have been previously defined as a TCC_Curve object. Default is none (ignored).For overcurrent relay, multiplying the current values in the curve by the "groundtrip" valuw gives the actual current.

Name: `GroundCurve`

(Setter)
"""
function GroundCurve_str(obj::Obj, value::String, flags::SetterFlagsT=SetterFlagsT(0))
    obj_set_str(obj, _PropertyIndex.GroundCurve, value, flags)
end

"""
Name of the TCC Curve object that determines the ground trip.  Must have been previously defined as a TCC_Curve object. Default is none (ignored).For overcurrent relay, multiplying the current values in the curve by the "groundtrip" valuw gives the actual current.

Name: `GroundCurve`

(Getter)
"""
function GroundCurve(obj)::Union{TCC_CurveObj, Nothing}
    obj_get_obj(obj,_PropertyIndex.GroundCurve, TCC_CurveObj)
end

"""
Name of the TCC Curve object that determines the ground trip.  Must have been previously defined as a TCC_Curve object. Default is none (ignored).For overcurrent relay, multiplying the current values in the curve by the "groundtrip" valuw gives the actual current.

Name: `GroundCurve`

(Setter)
"""
function GroundCurve(obj::Obj, value::Union{TCC_CurveObj, Nothing}, flags::SetterFlagsT=SetterFlagsT(0))
    obj_set_obj(obj, _PropertyIndex.GroundCurve, value, flags)
end

"""
Name of the TCC Curve object that determines the ground trip.  Must have been previously defined as a TCC_Curve object. Default is none (ignored).For overcurrent relay, multiplying the current values in the curve by the "groundtrip" valuw gives the actual current.

Name: `GroundCurve`

(Setter)
"""
function GroundCurve(obj::Obj, value::String, flags::SetterFlagsT=SetterFlagsT(0))
    obj_set_str(obj, _PropertyIndex.GroundCurve, value, flags)
end

"""
Multiplier or actual phase amps for the phase TCC curve.

Name: `PhaseTrip`
Default: 1.0

(Getter)
"""
function PhaseTrip(obj::Obj)::Float64
    obj_get_float64(obj, _PropertyIndex.PhaseTrip)
end

"""
Multiplier or actual phase amps for the phase TCC curve.

Name: `PhaseTrip`
Default: 1.0

(Setter)
"""
function PhaseTrip(obj::Obj, value::Float64, flags::SetterFlagsT=SetterFlagsT(0))
    obj_set_float64(obj, _PropertyIndex.PhaseTrip, value, flags)
end

"""
Multiplier or actual ground amps (3I0) for the ground TCC curve.

Name: `GroundTrip`
Default: 1.0

(Getter)
"""
function GroundTrip(obj::Obj)::Float64
    obj_get_float64(obj, _PropertyIndex.GroundTrip)
end

"""
Multiplier or actual ground amps (3I0) for the ground TCC curve.

Name: `GroundTrip`
Default: 1.0

(Setter)
"""
function GroundTrip(obj::Obj, value::Float64, flags::SetterFlagsT=SetterFlagsT(0))
    obj_set_float64(obj, _PropertyIndex.GroundTrip, value, flags)
end

"""
Time dial for Phase trip curve. Multiplier on time axis of specified curve.

Name: `TDPhase`
Default: 1.0

(Getter)
"""
function TDPhase(obj::Obj)::Float64
    obj_get_float64(obj, _PropertyIndex.TDPhase)
end

"""
Time dial for Phase trip curve. Multiplier on time axis of specified curve.

Name: `TDPhase`
Default: 1.0

(Setter)
"""
function TDPhase(obj::Obj, value::Float64, flags::SetterFlagsT=SetterFlagsT(0))
    obj_set_float64(obj, _PropertyIndex.TDPhase, value, flags)
end

"""
Time dial for Ground trip curve. Multiplier on time axis of specified curve.

Name: `TDGround`
Default: 1.0

(Getter)
"""
function TDGround(obj::Obj)::Float64
    obj_get_float64(obj, _PropertyIndex.TDGround)
end

"""
Time dial for Ground trip curve. Multiplier on time axis of specified curve.

Name: `TDGround`
Default: 1.0

(Setter)
"""
function TDGround(obj::Obj, value::Float64, flags::SetterFlagsT=SetterFlagsT(0))
    obj_set_float64(obj, _PropertyIndex.TDGround, value, flags)
end

"""
Actual amps (Current relay) or kW (reverse power relay) for instantaneous phase trip which is assumed to happen in 0.01 sec + Delay Time. Default is 0.0, which signifies no inst trip. Use this value for specifying the Reverse Power threshold (kW) for reverse power relays.

Name: `PhaseInst`
Default: 0.0

(Getter)
"""
function PhaseInst(obj::Obj)::Float64
    obj_get_float64(obj, _PropertyIndex.PhaseInst)
end

"""
Actual amps (Current relay) or kW (reverse power relay) for instantaneous phase trip which is assumed to happen in 0.01 sec + Delay Time. Default is 0.0, which signifies no inst trip. Use this value for specifying the Reverse Power threshold (kW) for reverse power relays.

Name: `PhaseInst`
Default: 0.0

(Setter)
"""
function PhaseInst(obj::Obj, value::Float64, flags::SetterFlagsT=SetterFlagsT(0))
    obj_set_float64(obj, _PropertyIndex.PhaseInst, value, flags)
end

"""
Actual amps for instantaneous ground trip which is assumed to happen in 0.01 sec + Delay Time. Default is 0, which signifies no inst trip.

Name: `GroundInst`
Units: A
Default: 0.0

(Getter)
"""
function GroundInst(obj::Obj)::Float64
    obj_get_float64(obj, _PropertyIndex.GroundInst)
end

"""
Actual amps for instantaneous ground trip which is assumed to happen in 0.01 sec + Delay Time. Default is 0, which signifies no inst trip.

Name: `GroundInst`
Units: A
Default: 0.0

(Setter)
"""
function GroundInst(obj::Obj, value::Float64, flags::SetterFlagsT=SetterFlagsT(0))
    obj_set_float64(obj, _PropertyIndex.GroundInst, value, flags)
end

"""
Reset time for relay. If this much time passes between the last pickup event, and the relay has not locked out, the operation counter resets.

Name: `Reset`
Units: s
Default: 15.0

(Getter)
"""
function Reset(obj::Obj)::Float64
    obj_get_float64(obj, _PropertyIndex.Reset)
end

"""
Reset time for relay. If this much time passes between the last pickup event, and the relay has not locked out, the operation counter resets.

Name: `Reset`
Units: s
Default: 15.0

(Setter)
"""
function Reset(obj::Obj, value::Float64, flags::SetterFlagsT=SetterFlagsT(0))
    obj_set_float64(obj, _PropertyIndex.Reset, value, flags)
end

"""
Number of shots to lockout. This is one more than the number of reclose intervals.

Name: `Shots`
Default: 4

(Getter)
"""
function Shots(obj::Obj)::Int32
    obj_get_int32(obj, _PropertyIndex.Shots)
end

"""
Number of shots to lockout. This is one more than the number of reclose intervals.

Name: `Shots`
Default: 4

(Setter)
"""
function Shots(obj::Obj, value::Int32, flags::SetterFlagsT=SetterFlagsT(0))
    obj_set_int32(obj, _PropertyIndex.Shots, value, flags)
end

"""
Array of reclose intervals. If none, specify "NONE". Default for overcurrent relay is (0.5, 2.0, 2.0) seconds. Default for a voltage relay is (5.0). In a voltage relay, this is  seconds after restoration of voltage that the reclose occurs. Reverse power relay is one shot to lockout, so this is ignored.  A locked out relay must be closed manually (set action=close).

Name: `RecloseIntervals`
Default: [0.5, 2.0, 2.0]

(Getter)
"""
function RecloseIntervals(obj::Obj)::Vector{Float64}
    obj_get_float64s(obj, _PropertyIndex.RecloseIntervals)
end

"""
Array of reclose intervals. If none, specify "NONE". Default for overcurrent relay is (0.5, 2.0, 2.0) seconds. Default for a voltage relay is (5.0). In a voltage relay, this is  seconds after restoration of voltage that the reclose occurs. Reverse power relay is one shot to lockout, so this is ignored.  A locked out relay must be closed manually (set action=close).

Name: `RecloseIntervals`
Default: [0.5, 2.0, 2.0]

(Setter)
"""
function RecloseIntervals(obj::Obj, value::Vector{Float64}, flags::SetterFlagsT=SetterFlagsT(0))
    obj_get_float64s(obj, _PropertyIndex.RecloseIntervals, value, flags)
end

"""
Trip time delay (sec) for DEFINITE TIME relays. Default is 0 for current, voltage and DOC relays. If >0 then this value is used instead of curves. Used by Generic, RevPower, 46 and 47 relays. Defaults to 0.1 s for these relays.

Name: `Delay`

(Getter)
"""
function Delay(obj::Obj)::Float64
    obj_get_float64(obj, _PropertyIndex.Delay)
end

"""
Trip time delay (sec) for DEFINITE TIME relays. Default is 0 for current, voltage and DOC relays. If >0 then this value is used instead of curves. Used by Generic, RevPower, 46 and 47 relays. Defaults to 0.1 s for these relays.

Name: `Delay`

(Setter)
"""
function Delay(obj::Obj, value::Float64, flags::SetterFlagsT=SetterFlagsT(0))
    obj_set_float64(obj, _PropertyIndex.Delay, value, flags)
end

"""
TCC Curve object to use for overvoltage relay. Curve is assumed to be defined with per unit voltage values. Voltage base should be defined for the relay. Default is none (ignored).

Name: `OvervoltCurve`

(Getter)
"""
function OvervoltCurve_str(obj::Obj)::String
    obj_get_str(obj, _PropertyIndex.OvervoltCurve)
end

"""
TCC Curve object to use for overvoltage relay. Curve is assumed to be defined with per unit voltage values. Voltage base should be defined for the relay. Default is none (ignored).

Name: `OvervoltCurve`

(Setter)
"""
function OvervoltCurve_str(obj::Obj, value::String, flags::SetterFlagsT=SetterFlagsT(0))
    obj_set_str(obj, _PropertyIndex.OvervoltCurve, value, flags)
end

"""
TCC Curve object to use for overvoltage relay. Curve is assumed to be defined with per unit voltage values. Voltage base should be defined for the relay. Default is none (ignored).

Name: `OvervoltCurve`

(Getter)
"""
function OvervoltCurve(obj)::Union{TCC_CurveObj, Nothing}
    obj_get_obj(obj,_PropertyIndex.OvervoltCurve, TCC_CurveObj)
end

"""
TCC Curve object to use for overvoltage relay. Curve is assumed to be defined with per unit voltage values. Voltage base should be defined for the relay. Default is none (ignored).

Name: `OvervoltCurve`

(Setter)
"""
function OvervoltCurve(obj::Obj, value::Union{TCC_CurveObj, Nothing}, flags::SetterFlagsT=SetterFlagsT(0))
    obj_set_obj(obj, _PropertyIndex.OvervoltCurve, value, flags)
end

"""
TCC Curve object to use for overvoltage relay. Curve is assumed to be defined with per unit voltage values. Voltage base should be defined for the relay. Default is none (ignored).

Name: `OvervoltCurve`

(Setter)
"""
function OvervoltCurve(obj::Obj, value::String, flags::SetterFlagsT=SetterFlagsT(0))
    obj_set_str(obj, _PropertyIndex.OvervoltCurve, value, flags)
end

"""
TCC Curve object to use for undervoltage relay. Curve is assumed to be defined with per unit voltage values. Voltage base should be defined for the relay. Default is none (ignored).

Name: `UndervoltCurve`

(Getter)
"""
function UndervoltCurve_str(obj::Obj)::String
    obj_get_str(obj, _PropertyIndex.UndervoltCurve)
end

"""
TCC Curve object to use for undervoltage relay. Curve is assumed to be defined with per unit voltage values. Voltage base should be defined for the relay. Default is none (ignored).

Name: `UndervoltCurve`

(Setter)
"""
function UndervoltCurve_str(obj::Obj, value::String, flags::SetterFlagsT=SetterFlagsT(0))
    obj_set_str(obj, _PropertyIndex.UndervoltCurve, value, flags)
end

"""
TCC Curve object to use for undervoltage relay. Curve is assumed to be defined with per unit voltage values. Voltage base should be defined for the relay. Default is none (ignored).

Name: `UndervoltCurve`

(Getter)
"""
function UndervoltCurve(obj)::Union{TCC_CurveObj, Nothing}
    obj_get_obj(obj,_PropertyIndex.UndervoltCurve, TCC_CurveObj)
end

"""
TCC Curve object to use for undervoltage relay. Curve is assumed to be defined with per unit voltage values. Voltage base should be defined for the relay. Default is none (ignored).

Name: `UndervoltCurve`

(Setter)
"""
function UndervoltCurve(obj::Obj, value::Union{TCC_CurveObj, Nothing}, flags::SetterFlagsT=SetterFlagsT(0))
    obj_set_obj(obj, _PropertyIndex.UndervoltCurve, value, flags)
end

"""
TCC Curve object to use for undervoltage relay. Curve is assumed to be defined with per unit voltage values. Voltage base should be defined for the relay. Default is none (ignored).

Name: `UndervoltCurve`

(Setter)
"""
function UndervoltCurve(obj::Obj, value::String, flags::SetterFlagsT=SetterFlagsT(0))
    obj_set_str(obj, _PropertyIndex.UndervoltCurve, value, flags)
end

"""
Voltage base (kV) for the relay. Specify line-line for 3 phase devices); line-neutral for 1-phase devices.  Relay assumes the number of phases of the monitored element.  Default is 0.0, which results in assuming the voltage values in the "TCC" curve are specified in actual line-to-neutral volts.

Name: `kVBase`
Default: 0.0

(Getter)
"""
function kVBase(obj::Obj)::Float64
    obj_get_float64(obj, _PropertyIndex.kVBase)
end

"""
Voltage base (kV) for the relay. Specify line-line for 3 phase devices); line-neutral for 1-phase devices.  Relay assumes the number of phases of the monitored element.  Default is 0.0, which results in assuming the voltage values in the "TCC" curve are specified in actual line-to-neutral volts.

Name: `kVBase`
Default: 0.0

(Setter)
"""
function kVBase(obj::Obj, value::Float64, flags::SetterFlagsT=SetterFlagsT(0))
    obj_set_float64(obj, _PropertyIndex.kVBase, value, flags)
end

"""
Percent voltage pickup for 47 relay (Neg seq voltage). Default is 2. Specify also base voltage (kvbase) and delay time value.   

Name: `47%Pickup`
Default: 2.0

(Getter)
"""
function F47pctPickup(obj::Obj)::Float64
    obj_get_float64(obj, _PropertyIndex.F47pctPickup)
end

"""
Percent voltage pickup for 47 relay (Neg seq voltage). Default is 2. Specify also base voltage (kvbase) and delay time value.   

Name: `47%Pickup`
Default: 2.0

(Setter)
"""
function F47pctPickup(obj::Obj, value::Float64, flags::SetterFlagsT=SetterFlagsT(0))
    obj_set_float64(obj, _PropertyIndex.F47pctPickup, value, flags)
end

"""
Base current, Amps, for 46 relay (neg seq current). Used for establishing pickup and per unit I-squared-t.

Name: `46BaseAmps`
Default: 100.0

(Getter)
"""
function F46BaseAmps(obj::Obj)::Float64
    obj_get_float64(obj, _PropertyIndex.F46BaseAmps)
end

"""
Base current, Amps, for 46 relay (neg seq current). Used for establishing pickup and per unit I-squared-t.

Name: `46BaseAmps`
Default: 100.0

(Setter)
"""
function F46BaseAmps(obj::Obj, value::Float64, flags::SetterFlagsT=SetterFlagsT(0))
    obj_set_float64(obj, _PropertyIndex.F46BaseAmps, value, flags)
end

"""
Percent pickup current for 46 relay (neg seq current). Default is 20.  When current exceeds this value × BaseAmps, I-squared-t calc starts.

Name: `46%Pickup`
Default: 20.0

(Getter)
"""
function F46pctPickup(obj::Obj)::Float64
    obj_get_float64(obj, _PropertyIndex.F46pctPickup)
end

"""
Percent pickup current for 46 relay (neg seq current). Default is 20.  When current exceeds this value × BaseAmps, I-squared-t calc starts.

Name: `46%Pickup`
Default: 20.0

(Setter)
"""
function F46pctPickup(obj::Obj, value::Float64, flags::SetterFlagsT=SetterFlagsT(0))
    obj_set_float64(obj, _PropertyIndex.F46pctPickup, value, flags)
end

"""
Negative Sequence I-squared-t trip value for 46 relay (neg seq current).  Default is 1 (trips in 1 sec for 1 per unit neg seq current).  Should be 1 to 99.

Name: `46isqt`
Default: 1.0

(Getter)
"""
function F46isqt(obj::Obj)::Float64
    obj_get_float64(obj, _PropertyIndex.F46isqt)
end

"""
Negative Sequence I-squared-t trip value for 46 relay (neg seq current).  Default is 1 (trips in 1 sec for 1 per unit neg seq current).  Should be 1 to 99.

Name: `46isqt`
Default: 1.0

(Setter)
"""
function F46isqt(obj::Obj, value::Float64, flags::SetterFlagsT=SetterFlagsT(0))
    obj_set_float64(obj, _PropertyIndex.F46isqt, value, flags)
end

"""
Name of variable in PC Elements being monitored.  Only applies to Generic relay.

Name: `Variable`

(Getter)
"""
function Variable(obj::Obj)::String
    obj_get_str(obj, _PropertyIndex.Variable)
end

"""
Name of variable in PC Elements being monitored.  Only applies to Generic relay.

Name: `Variable`

(Setter)
"""
function Variable(obj::Obj, value::String, flags::SetterFlagsT=SetterFlagsT(0))
    obj_set_str(obj, _PropertyIndex.Variable, value, flags)
end

"""
Trip setting (high value) for Generic relay variable.  Relay trips in definite time if value of variable exceeds this value.

Name: `Overtrip`
Default: 1.2

(Getter)
"""
function Overtrip(obj::Obj)::Float64
    obj_get_float64(obj, _PropertyIndex.Overtrip)
end

"""
Trip setting (high value) for Generic relay variable.  Relay trips in definite time if value of variable exceeds this value.

Name: `Overtrip`
Default: 1.2

(Setter)
"""
function Overtrip(obj::Obj, value::Float64, flags::SetterFlagsT=SetterFlagsT(0))
    obj_set_float64(obj, _PropertyIndex.Overtrip, value, flags)
end

"""
Trip setting (low value) for Generic relay variable.  Relay trips in definite time if value of variable is less than this value.

Name: `Undertrip`
Default: 0.8

(Getter)
"""
function Undertrip(obj::Obj)::Float64
    obj_get_float64(obj, _PropertyIndex.Undertrip)
end

"""
Trip setting (low value) for Generic relay variable.  Relay trips in definite time if value of variable is less than this value.

Name: `Undertrip`
Default: 0.8

(Setter)
"""
function Undertrip(obj::Obj, value::Float64, flags::SetterFlagsT=SetterFlagsT(0))
    obj_set_float64(obj, _PropertyIndex.Undertrip, value, flags)
end

"""
Fixed delay time (sec) added to relay time. Designed to represent breaker time or some other delay after a trip decision is made.Use Delay property for setting a fixed trip time delay.Added to trip time of current and voltage relays. Could use in combination with inst trip value to obtain a definite time overcurrent relay.

Name: `BreakerTime`
Default: 0.0

(Getter)
"""
function BreakerTime(obj::Obj)::Float64
    obj_get_float64(obj, _PropertyIndex.BreakerTime)
end

"""
Fixed delay time (sec) added to relay time. Designed to represent breaker time or some other delay after a trip decision is made.Use Delay property for setting a fixed trip time delay.Added to trip time of current and voltage relays. Could use in combination with inst trip value to obtain a definite time overcurrent relay.

Name: `BreakerTime`
Default: 0.0

(Setter)
"""
function BreakerTime(obj::Obj, value::Float64, flags::SetterFlagsT=SetterFlagsT(0))
    obj_set_float64(obj, _PropertyIndex.BreakerTime, value, flags)
end

"""
DEPRECATED. See "State" property

Name: `Action`

(Getter)
"""
function Action(obj::Obj)::RelayAction.T
    RelayAction.T(obj_get_int32(obj, _PropertyIndex.Action))
end

"""
DEPRECATED. See "State" property

Name: `Action`

(Setter)
"""
function Action(obj::Obj, value::String, flags::SetterFlagsT=SetterFlagsT(0))
    obj_set_str(obj, _PropertyIndex.Action, value, flags)
end

"""
DEPRECATED. See "State" property

Name: `Action`

(Setter)
"""
function Action(obj::Obj, value::Union{Int,RelayAction.T}, flags::SetterFlagsT=SetterFlagsT(0))
    obj_set_int32(obj, _PropertyIndex.Action, Int32(value), flags)
end

"""
DEPRECATED. See "State" property

Name: `Action`

(Getter)
"""
function Action_str(obj::Obj)::String
    obj_get_str(obj, _PropertyIndex.Action)
end

"""
DEPRECATED. See "State" property

Name: `Action`

(Setter)
"""
function Action_str(obj::Obj, value::String, flags::SetterFlagsT=SetterFlagsT(0))
    Action(obj, value, flags)
end

"""
Positive sequence reach impedance in primary ohms for Distance and TD21 functions.

Name: `Z1Mag`
Default: 0.7

(Getter)
"""
function Z1Mag(obj::Obj)::Float64
    obj_get_float64(obj, _PropertyIndex.Z1Mag)
end

"""
Positive sequence reach impedance in primary ohms for Distance and TD21 functions.

Name: `Z1Mag`
Default: 0.7

(Setter)
"""
function Z1Mag(obj::Obj, value::Float64, flags::SetterFlagsT=SetterFlagsT(0))
    obj_set_float64(obj, _PropertyIndex.Z1Mag, value, flags)
end

"""
Positive sequence reach impedance angle in degrees for Distance and TD21 functions.

Name: `Z1Ang`
Default: 64.0

(Getter)
"""
function Z1Ang(obj::Obj)::Float64
    obj_get_float64(obj, _PropertyIndex.Z1Ang)
end

"""
Positive sequence reach impedance angle in degrees for Distance and TD21 functions.

Name: `Z1Ang`
Default: 64.0

(Setter)
"""
function Z1Ang(obj::Obj, value::Float64, flags::SetterFlagsT=SetterFlagsT(0))
    obj_set_float64(obj, _PropertyIndex.Z1Ang, value, flags)
end

"""
Zero sequence reach impedance in primary ohms for Distance and TD21 functions.

Name: `Z0Mag`
Default: 2.1

(Getter)
"""
function Z0Mag(obj::Obj)::Float64
    obj_get_float64(obj, _PropertyIndex.Z0Mag)
end

"""
Zero sequence reach impedance in primary ohms for Distance and TD21 functions.

Name: `Z0Mag`
Default: 2.1

(Setter)
"""
function Z0Mag(obj::Obj, value::Float64, flags::SetterFlagsT=SetterFlagsT(0))
    obj_set_float64(obj, _PropertyIndex.Z0Mag, value, flags)
end

"""
Zero sequence reach impedance angle in degrees for Distance and TD21 functions.

Name: `Z0Ang`
Default: 68.0

(Getter)
"""
function Z0Ang(obj::Obj)::Float64
    obj_get_float64(obj, _PropertyIndex.Z0Ang)
end

"""
Zero sequence reach impedance angle in degrees for Distance and TD21 functions.

Name: `Z0Ang`
Default: 68.0

(Setter)
"""
function Z0Ang(obj::Obj, value::Float64, flags::SetterFlagsT=SetterFlagsT(0))
    obj_set_float64(obj, _PropertyIndex.Z0Ang, value, flags)
end

"""
Phase reach multiplier in per-unit for Distance and TD21 functions.

Name: `MPhase`
Default: 0.7

(Getter)
"""
function MPhase(obj::Obj)::Float64
    obj_get_float64(obj, _PropertyIndex.MPhase)
end

"""
Phase reach multiplier in per-unit for Distance and TD21 functions.

Name: `MPhase`
Default: 0.7

(Setter)
"""
function MPhase(obj::Obj, value::Float64, flags::SetterFlagsT=SetterFlagsT(0))
    obj_set_float64(obj, _PropertyIndex.MPhase, value, flags)
end

"""
Ground reach multiplier in per-unit for Distance and TD21 functions.

Name: `MGround`
Default: 0.7

(Getter)
"""
function MGround(obj::Obj)::Float64
    obj_get_float64(obj, _PropertyIndex.MGround)
end

"""
Ground reach multiplier in per-unit for Distance and TD21 functions.

Name: `MGround`
Default: 0.7

(Setter)
"""
function MGround(obj::Obj, value::Float64, flags::SetterFlagsT=SetterFlagsT(0))
    obj_set_float64(obj, _PropertyIndex.MGround, value, flags)
end

"""
Write trips, reclose and reset events to EventLog.

Name: `EventLog`
Default: False

(Getter)
"""
function EventLog(obj::Obj)::Bool
    return obj_get_bool(obj, _PropertyIndex.EventLog)
end

"""
Write trips, reclose and reset events to EventLog.

Name: `EventLog`
Default: False

(Setter)
"""
function EventLog(obj::Obj, value::Bool, flags::SetterFlagsT=SetterFlagsT(0))
    obj_set_bool(obj, _PropertyIndex.EventLog, value, flags)
end

"""
Write extra details to Eventlog.

Name: `DebugTrace`
Default: False

(Getter)
"""
function DebugTrace(obj::Obj)::Bool
    return obj_get_bool(obj, _PropertyIndex.DebugTrace)
end

"""
Write extra details to Eventlog.

Name: `DebugTrace`
Default: False

(Setter)
"""
function DebugTrace(obj::Obj, value::Bool, flags::SetterFlagsT=SetterFlagsT(0))
    obj_set_bool(obj, _PropertyIndex.DebugTrace, value, flags)
end

"""
Reverse direction for distance and td21 types.

Name: `DistReverse`
Default: False

(Getter)
"""
function DistReverse(obj::Obj)::Bool
    return obj_get_bool(obj, _PropertyIndex.DistReverse)
end

"""
Reverse direction for distance and td21 types.

Name: `DistReverse`
Default: False

(Setter)
"""
function DistReverse(obj::Obj, value::Bool, flags::SetterFlagsT=SetterFlagsT(0))
    obj_set_bool(obj, _PropertyIndex.DistReverse, value, flags)
end

"""
{Open | Closed} Normal state of the relay. The relay reverts to this state for reset, change of mode, etc. Defaults to "State" if not specifically declared.

Name: `Normal`
Default: closed

(Getter)
"""
function Normal(obj::Obj)::RelayState.T
    RelayState.T(obj_get_int32(obj, _PropertyIndex.Normal))
end

"""
{Open | Closed} Normal state of the relay. The relay reverts to this state for reset, change of mode, etc. Defaults to "State" if not specifically declared.

Name: `Normal`
Default: closed

(Setter)
"""
function Normal(obj::Obj, value::String, flags::SetterFlagsT=SetterFlagsT(0))
    obj_set_str(obj, _PropertyIndex.Normal, value, flags)
end

"""
{Open | Closed} Normal state of the relay. The relay reverts to this state for reset, change of mode, etc. Defaults to "State" if not specifically declared.

Name: `Normal`
Default: closed

(Setter)
"""
function Normal(obj::Obj, value::Union{Int,RelayState.T}, flags::SetterFlagsT=SetterFlagsT(0))
    obj_set_int32(obj, _PropertyIndex.Normal, Int32(value), flags)
end

"""
{Open | Closed} Normal state of the relay. The relay reverts to this state for reset, change of mode, etc. Defaults to "State" if not specifically declared.

Name: `Normal`
Default: closed

(Getter)
"""
function Normal_str(obj::Obj)::String
    obj_get_str(obj, _PropertyIndex.Normal)
end

"""
{Open | Closed} Normal state of the relay. The relay reverts to this state for reset, change of mode, etc. Defaults to "State" if not specifically declared.

Name: `Normal`
Default: closed

(Setter)
"""
function Normal_str(obj::Obj, value::String, flags::SetterFlagsT=SetterFlagsT(0))
    Normal(obj, value, flags)
end

"""
{Open | Closed} Actual state of the relay. Upon setting, immediately forces state of the relay, overriding the Relay control. Simulates manual control on relay. Defaults to Closed. "Open" causes the controlled element to open and lock out. "Closed" causes the controlled element to close and the relay to reset to its first operation.

Name: `State`
Default: closed

(Getter)
"""
function State(obj::Obj)::RelayState.T
    RelayState.T(obj_get_int32(obj, _PropertyIndex.State))
end

"""
{Open | Closed} Actual state of the relay. Upon setting, immediately forces state of the relay, overriding the Relay control. Simulates manual control on relay. Defaults to Closed. "Open" causes the controlled element to open and lock out. "Closed" causes the controlled element to close and the relay to reset to its first operation.

Name: `State`
Default: closed

(Setter)
"""
function State(obj::Obj, value::String, flags::SetterFlagsT=SetterFlagsT(0))
    obj_set_str(obj, _PropertyIndex.State, value, flags)
end

"""
{Open | Closed} Actual state of the relay. Upon setting, immediately forces state of the relay, overriding the Relay control. Simulates manual control on relay. Defaults to Closed. "Open" causes the controlled element to open and lock out. "Closed" causes the controlled element to close and the relay to reset to its first operation.

Name: `State`
Default: closed

(Setter)
"""
function State(obj::Obj, value::Union{Int,RelayState.T}, flags::SetterFlagsT=SetterFlagsT(0))
    obj_set_int32(obj, _PropertyIndex.State, Int32(value), flags)
end

"""
{Open | Closed} Actual state of the relay. Upon setting, immediately forces state of the relay, overriding the Relay control. Simulates manual control on relay. Defaults to Closed. "Open" causes the controlled element to open and lock out. "Closed" causes the controlled element to close and the relay to reset to its first operation.

Name: `State`
Default: closed

(Getter)
"""
function State_str(obj::Obj)::String
    obj_get_str(obj, _PropertyIndex.State)
end

"""
{Open | Closed} Actual state of the relay. Upon setting, immediately forces state of the relay, overriding the Relay control. Simulates manual control on relay. Defaults to Closed. "Open" causes the controlled element to open and lock out. "Closed" causes the controlled element to close and the relay to reset to its first operation.

Name: `State`
Default: closed

(Setter)
"""
function State_str(obj::Obj, value::String, flags::SetterFlagsT=SetterFlagsT(0))
    State(obj, value, flags)
end

"""
Tilt angle for low-current trip line.

Name: `DOC_TiltAngleLow`
Default: 90.0

(Getter)
"""
function DOC_TiltAngleLow(obj::Obj)::Float64
    obj_get_float64(obj, _PropertyIndex.DOC_TiltAngleLow)
end

"""
Tilt angle for low-current trip line.

Name: `DOC_TiltAngleLow`
Default: 90.0

(Setter)
"""
function DOC_TiltAngleLow(obj::Obj, value::Float64, flags::SetterFlagsT=SetterFlagsT(0))
    obj_set_float64(obj, _PropertyIndex.DOC_TiltAngleLow, value, flags)
end

"""
Tilt angle for high-current trip line.

Name: `DOC_TiltAngleHigh`
Default: 90.0

(Getter)
"""
function DOC_TiltAngleHigh(obj::Obj)::Float64
    obj_get_float64(obj, _PropertyIndex.DOC_TiltAngleHigh)
end

"""
Tilt angle for high-current trip line.

Name: `DOC_TiltAngleHigh`
Default: 90.0

(Setter)
"""
function DOC_TiltAngleHigh(obj::Obj, value::Float64, flags::SetterFlagsT=SetterFlagsT(0))
    obj_set_float64(obj, _PropertyIndex.DOC_TiltAngleHigh, value, flags)
end

"""
Resistive trip setting for low-current line.

Name: `DOC_TripSettingLow`
Default: 0.0

(Getter)
"""
function DOC_TripSettingLow(obj::Obj)::Float64
    obj_get_float64(obj, _PropertyIndex.DOC_TripSettingLow)
end

"""
Resistive trip setting for low-current line.

Name: `DOC_TripSettingLow`
Default: 0.0

(Setter)
"""
function DOC_TripSettingLow(obj::Obj, value::Float64, flags::SetterFlagsT=SetterFlagsT(0))
    obj_set_float64(obj, _PropertyIndex.DOC_TripSettingLow, value, flags)
end

"""
Resistive trip setting for high-current line.  Default is -1 (deactivated). To activate, set a positive value. Must be greater than "DOC_TripSettingLow".

Name: `DOC_TripSettingHigh`
Default: -1.0

(Getter)
"""
function DOC_TripSettingHigh(obj::Obj)::Float64
    obj_get_float64(obj, _PropertyIndex.DOC_TripSettingHigh)
end

"""
Resistive trip setting for high-current line.  Default is -1 (deactivated). To activate, set a positive value. Must be greater than "DOC_TripSettingLow".

Name: `DOC_TripSettingHigh`
Default: -1.0

(Setter)
"""
function DOC_TripSettingHigh(obj::Obj, value::Float64, flags::SetterFlagsT=SetterFlagsT(0))
    obj_set_float64(obj, _PropertyIndex.DOC_TripSettingHigh, value, flags)
end

"""
Trip setting for current magnitude (defines a circle in the relay characteristics). Default is -1 (deactivated). To activate, set a positive value.

Name: `DOC_TripSettingMag`
Default: -1.0

(Getter)
"""
function DOC_TripSettingMag(obj::Obj)::Float64
    obj_get_float64(obj, _PropertyIndex.DOC_TripSettingMag)
end

"""
Trip setting for current magnitude (defines a circle in the relay characteristics). Default is -1 (deactivated). To activate, set a positive value.

Name: `DOC_TripSettingMag`
Default: -1.0

(Setter)
"""
function DOC_TripSettingMag(obj::Obj, value::Float64, flags::SetterFlagsT=SetterFlagsT(0))
    obj_set_float64(obj, _PropertyIndex.DOC_TripSettingMag, value, flags)
end

"""
Trip time delay (sec) for operation in inner region for DOC relay, defined when "DOC_TripSettingMag" or "DOC_TripSettingHigh" are activate. Default is -1.0 (deactivated), meaning that the relay characteristic is insensitive in the inner region (no trip). Set to 0 for instantaneous trip and >0 for a definite time delay. If "DOC_PhaseCurveInner" is specified, time delay from curve is utilized instead.

Name: `DOC_DelayInner`
Default: -1.0

(Getter)
"""
function DOC_DelayInner(obj::Obj)::Float64
    obj_get_float64(obj, _PropertyIndex.DOC_DelayInner)
end

"""
Trip time delay (sec) for operation in inner region for DOC relay, defined when "DOC_TripSettingMag" or "DOC_TripSettingHigh" are activate. Default is -1.0 (deactivated), meaning that the relay characteristic is insensitive in the inner region (no trip). Set to 0 for instantaneous trip and >0 for a definite time delay. If "DOC_PhaseCurveInner" is specified, time delay from curve is utilized instead.

Name: `DOC_DelayInner`
Default: -1.0

(Setter)
"""
function DOC_DelayInner(obj::Obj, value::Float64, flags::SetterFlagsT=SetterFlagsT(0))
    obj_set_float64(obj, _PropertyIndex.DOC_DelayInner, value, flags)
end

"""
Name of the TCC Curve object that determines the phase trip for operation in inner region for DOC relay. Must have been previously defined as a TCC_Curve object. Default is none (ignored). Multiplying the current values in the curve by the "DOC_PhaseTripInner" value gives the actual current.

Name: `DOC_PhaseCurveInner`

(Getter)
"""
function DOC_PhaseCurveInner_str(obj::Obj)::String
    obj_get_str(obj, _PropertyIndex.DOC_PhaseCurveInner)
end

"""
Name of the TCC Curve object that determines the phase trip for operation in inner region for DOC relay. Must have been previously defined as a TCC_Curve object. Default is none (ignored). Multiplying the current values in the curve by the "DOC_PhaseTripInner" value gives the actual current.

Name: `DOC_PhaseCurveInner`

(Setter)
"""
function DOC_PhaseCurveInner_str(obj::Obj, value::String, flags::SetterFlagsT=SetterFlagsT(0))
    obj_set_str(obj, _PropertyIndex.DOC_PhaseCurveInner, value, flags)
end

"""
Name of the TCC Curve object that determines the phase trip for operation in inner region for DOC relay. Must have been previously defined as a TCC_Curve object. Default is none (ignored). Multiplying the current values in the curve by the "DOC_PhaseTripInner" value gives the actual current.

Name: `DOC_PhaseCurveInner`

(Getter)
"""
function DOC_PhaseCurveInner(obj)::Union{TCC_CurveObj, Nothing}
    obj_get_obj(obj,_PropertyIndex.DOC_PhaseCurveInner, TCC_CurveObj)
end

"""
Name of the TCC Curve object that determines the phase trip for operation in inner region for DOC relay. Must have been previously defined as a TCC_Curve object. Default is none (ignored). Multiplying the current values in the curve by the "DOC_PhaseTripInner" value gives the actual current.

Name: `DOC_PhaseCurveInner`

(Setter)
"""
function DOC_PhaseCurveInner(obj::Obj, value::Union{TCC_CurveObj, Nothing}, flags::SetterFlagsT=SetterFlagsT(0))
    obj_set_obj(obj, _PropertyIndex.DOC_PhaseCurveInner, value, flags)
end

"""
Name of the TCC Curve object that determines the phase trip for operation in inner region for DOC relay. Must have been previously defined as a TCC_Curve object. Default is none (ignored). Multiplying the current values in the curve by the "DOC_PhaseTripInner" value gives the actual current.

Name: `DOC_PhaseCurveInner`

(Setter)
"""
function DOC_PhaseCurveInner(obj::Obj, value::String, flags::SetterFlagsT=SetterFlagsT(0))
    obj_set_str(obj, _PropertyIndex.DOC_PhaseCurveInner, value, flags)
end

"""
Multiplier for the "DOC_PhaseCurveInner" TCC curve.

Name: `DOC_PhaseTripInner`
Default: 1.0

(Getter)
"""
function DOC_PhaseTripInner(obj::Obj)::Float64
    obj_get_float64(obj, _PropertyIndex.DOC_PhaseTripInner)
end

"""
Multiplier for the "DOC_PhaseCurveInner" TCC curve.

Name: `DOC_PhaseTripInner`
Default: 1.0

(Setter)
"""
function DOC_PhaseTripInner(obj::Obj, value::Float64, flags::SetterFlagsT=SetterFlagsT(0))
    obj_set_float64(obj, _PropertyIndex.DOC_PhaseTripInner, value, flags)
end

"""
Time dial for "DOC_PhaseCurveInner" TCC curve. Multiplier on time axis of specified curve.

Name: `DOC_TDPhaseInner`
Default: 1.0

(Getter)
"""
function DOC_TDPhaseInner(obj::Obj)::Float64
    obj_get_float64(obj, _PropertyIndex.DOC_TDPhaseInner)
end

"""
Time dial for "DOC_PhaseCurveInner" TCC curve. Multiplier on time axis of specified curve.

Name: `DOC_TDPhaseInner`
Default: 1.0

(Setter)
"""
function DOC_TDPhaseInner(obj::Obj, value::Float64, flags::SetterFlagsT=SetterFlagsT(0))
    obj_set_float64(obj, _PropertyIndex.DOC_TDPhaseInner, value, flags)
end

"""
Blocking element that impedes relay from tripping if balanced net three-phase active power is in the forward direction (i.e., flowing into the monitored terminal). For a delayed trip, if at any given time the reverse power flow condition stops, the tripping is reset. Default=True.

Name: `DOC_P1Blocking`
Default: True

(Getter)
"""
function DOC_P1Blocking(obj::Obj)::Bool
    return obj_get_bool(obj, _PropertyIndex.DOC_P1Blocking)
end

"""
Blocking element that impedes relay from tripping if balanced net three-phase active power is in the forward direction (i.e., flowing into the monitored terminal). For a delayed trip, if at any given time the reverse power flow condition stops, the tripping is reset. Default=True.

Name: `DOC_P1Blocking`
Default: True

(Setter)
"""
function DOC_P1Blocking(obj::Obj, value::Bool, flags::SetterFlagsT=SetterFlagsT(0))
    obj_set_bool(obj, _PropertyIndex.DOC_P1Blocking, value, flags)
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

end # module Relay
export Relay
