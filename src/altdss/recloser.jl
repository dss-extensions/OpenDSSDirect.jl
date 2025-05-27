module Recloser
using ..Enums.SetterFlags: SetterFlagsT
using ..Enums: RecloserState
using ..TCC_Curve: TCC_CurveObj
import Base: convert
using ..Common
using ..CircuitElement
using DocStringExtensions
@template (FUNCTIONS, METHODS) = """
                                 $(TYPEDSIGNATURES)
                                 $(DOCSTRING)
                                 """


const _cls_name = "Recloser"
const _cls_idx = 33

module _PropertyIndex
const MonitoredObj = Int32(1)
const MonitoredTerm = Int32(2)
const SwitchedObj = Int32(3)
const SwitchedTerm = Int32(4)
const NumFast = Int32(5)
const PhaseFast = Int32(6)
const PhaseDelayed = Int32(7)
const GroundFast = Int32(8)
const GroundDelayed = Int32(9)
const PhaseTrip = Int32(10)
const GroundTrip = Int32(11)
const PhaseInst = Int32(12)
const GroundInst = Int32(13)
const Reset = Int32(14)
const Shots = Int32(15)
const RecloseIntervals = Int32(16)
const Delay = Int32(17)
const Action = Int32(18)
const TDPhFast = Int32(19)
const TDGrFast = Int32(20)
const TDPhDelayed = Int32(21)
const TDGrDelayed = Int32(22)
const Normal = Int32(23)
const State = Int32(24)
const BaseFreq = Int32(25)
const Enabled = Int32(26)
const Like = Int32(27)
end

struct RecloserObj <: AbstractControlElement
    ptr::Ptr{Cvoid}
    dss::DSSContext
end
export RecloserObj
Common._wrap_dss_obj(::Val{_cls_idx}, ptr::Ptr{Cvoid}, dss::DSSContext) = RecloserObj(ptr, dss)
const Obj = RecloserObj

function Base.show(io::IO, obj::RecloserObj) 
    name = obj_get_str(obj, obj.dss.capi.Obj_GetFullName)
    print(name)
end


include("dss_object.jl")


"""
Full object name of the circuit element, typically a line, transformer, load, or generator, to which the Recloser's PT and/or CT are connected. This is the "monitored" element. There is no default; must be specified.

Name: `MonitoredObj`

(Getter)
"""
function MonitoredObj_str(obj::Obj)::String
    obj_get_str(obj, _PropertyIndex.MonitoredObj)
end

"""
Full object name of the circuit element, typically a line, transformer, load, or generator, to which the Recloser's PT and/or CT are connected. This is the "monitored" element. There is no default; must be specified.

Name: `MonitoredObj`

(Setter)
"""
function MonitoredObj_str(obj::Obj, value::String, flags::SetterFlagsT=SetterFlagsT(0))
    obj_set_str(obj, _PropertyIndex.MonitoredObj, value, flags)
end

"""
Full object name of the circuit element, typically a line, transformer, load, or generator, to which the Recloser's PT and/or CT are connected. This is the "monitored" element. There is no default; must be specified.

Name: `MonitoredObj`

(Getter)
"""
function MonitoredObj(obj)::DSSObj
    obj_get_obj(obj,_PropertyIndex.MonitoredObj)
end

"""
Full object name of the circuit element, typically a line, transformer, load, or generator, to which the Recloser's PT and/or CT are connected. This is the "monitored" element. There is no default; must be specified.

Name: `MonitoredObj`

(Setter)
"""
function MonitoredObj(obj::Obj, value::DSSObj, flags::SetterFlagsT=SetterFlagsT(0))
    obj_set_obj(obj, _PropertyIndex.MonitoredObj, value, flags)
end

"""
Full object name of the circuit element, typically a line, transformer, load, or generator, to which the Recloser's PT and/or CT are connected. This is the "monitored" element. There is no default; must be specified.

Name: `MonitoredObj`

(Setter)
"""
function MonitoredObj(obj::Obj, value::String, flags::SetterFlagsT=SetterFlagsT(0))
    obj_set_str(obj, _PropertyIndex.MonitoredObj, value, flags)
end

"""
Number of the terminal of the circuit element to which the Recloser is connected. 1 or 2, typically.

Name: `MonitoredTerm`
Default: 1

(Getter)
"""
function MonitoredTerm(obj::Obj)::Int32
    obj_get_int32(obj, _PropertyIndex.MonitoredTerm)
end

"""
Number of the terminal of the circuit element to which the Recloser is connected. 1 or 2, typically.

Name: `MonitoredTerm`
Default: 1

(Setter)
"""
function MonitoredTerm(obj::Obj, value::Int32, flags::SetterFlagsT=SetterFlagsT(0))
    obj_set_int32(obj, _PropertyIndex.MonitoredTerm, value, flags)
end

"""
Name of circuit element switch that the Recloser controls. Specify the full object name. Defaults to the same as the Monitored element. This is the "controlled" element.

Name: `SwitchedObj`

(Getter)
"""
function SwitchedObj_str(obj::Obj)::String
    obj_get_str(obj, _PropertyIndex.SwitchedObj)
end

"""
Name of circuit element switch that the Recloser controls. Specify the full object name. Defaults to the same as the Monitored element. This is the "controlled" element.

Name: `SwitchedObj`

(Setter)
"""
function SwitchedObj_str(obj::Obj, value::String, flags::SetterFlagsT=SetterFlagsT(0))
    obj_set_str(obj, _PropertyIndex.SwitchedObj, value, flags)
end

"""
Name of circuit element switch that the Recloser controls. Specify the full object name. Defaults to the same as the Monitored element. This is the "controlled" element.

Name: `SwitchedObj`

(Getter)
"""
function SwitchedObj(obj)::DSSObj
    obj_get_obj(obj,_PropertyIndex.SwitchedObj)
end

"""
Name of circuit element switch that the Recloser controls. Specify the full object name. Defaults to the same as the Monitored element. This is the "controlled" element.

Name: `SwitchedObj`

(Setter)
"""
function SwitchedObj(obj::Obj, value::DSSObj, flags::SetterFlagsT=SetterFlagsT(0))
    obj_set_obj(obj, _PropertyIndex.SwitchedObj, value, flags)
end

"""
Name of circuit element switch that the Recloser controls. Specify the full object name. Defaults to the same as the Monitored element. This is the "controlled" element.

Name: `SwitchedObj`

(Setter)
"""
function SwitchedObj(obj::Obj, value::String, flags::SetterFlagsT=SetterFlagsT(0))
    obj_set_str(obj, _PropertyIndex.SwitchedObj, value, flags)
end

"""
Number of the terminal of the controlled element in which the switch is controlled by the Recloser. 1 or 2, typically.  Default is 1.

Name: `SwitchedTerm`
Default: 1

(Getter)
"""
function SwitchedTerm(obj::Obj)::Int32
    obj_get_int32(obj, _PropertyIndex.SwitchedTerm)
end

"""
Number of the terminal of the controlled element in which the switch is controlled by the Recloser. 1 or 2, typically.  Default is 1.

Name: `SwitchedTerm`
Default: 1

(Setter)
"""
function SwitchedTerm(obj::Obj, value::Int32, flags::SetterFlagsT=SetterFlagsT(0))
    obj_set_int32(obj, _PropertyIndex.SwitchedTerm, value, flags)
end

"""
Number of Fast (fuse saving) operations. (See "Shots")

Name: `NumFast`
Default: 1

(Getter)
"""
function NumFast(obj::Obj)::Int32
    obj_get_int32(obj, _PropertyIndex.NumFast)
end

"""
Number of Fast (fuse saving) operations. (See "Shots")

Name: `NumFast`
Default: 1

(Setter)
"""
function NumFast(obj::Obj, value::Int32, flags::SetterFlagsT=SetterFlagsT(0))
    obj_set_int32(obj, _PropertyIndex.NumFast, value, flags)
end

"""
Name of the TCC Curve object that determines the Phase Fast trip.  Must have been previously defined as a TCC_Curve object. Default is "A". Multiplying the current values in the curve by the "phasetrip" value gives the actual current.

Name: `PhaseFast`
Default: a

(Getter)
"""
function PhaseFast_str(obj::Obj)::String
    obj_get_str(obj, _PropertyIndex.PhaseFast)
end

"""
Name of the TCC Curve object that determines the Phase Fast trip.  Must have been previously defined as a TCC_Curve object. Default is "A". Multiplying the current values in the curve by the "phasetrip" value gives the actual current.

Name: `PhaseFast`
Default: a

(Setter)
"""
function PhaseFast_str(obj::Obj, value::String, flags::SetterFlagsT=SetterFlagsT(0))
    obj_set_str(obj, _PropertyIndex.PhaseFast, value, flags)
end

"""
Name of the TCC Curve object that determines the Phase Fast trip.  Must have been previously defined as a TCC_Curve object. Default is "A". Multiplying the current values in the curve by the "phasetrip" value gives the actual current.

Name: `PhaseFast`
Default: a

(Getter)
"""
function PhaseFast(obj)::Union{TCC_CurveObj, Nothing}
    obj_get_obj(obj,_PropertyIndex.PhaseFast, TCC_CurveObj)
end

"""
Name of the TCC Curve object that determines the Phase Fast trip.  Must have been previously defined as a TCC_Curve object. Default is "A". Multiplying the current values in the curve by the "phasetrip" value gives the actual current.

Name: `PhaseFast`
Default: a

(Setter)
"""
function PhaseFast(obj::Obj, value::Union{TCC_CurveObj, Nothing}, flags::SetterFlagsT=SetterFlagsT(0))
    obj_set_obj(obj, _PropertyIndex.PhaseFast, value, flags)
end

"""
Name of the TCC Curve object that determines the Phase Fast trip.  Must have been previously defined as a TCC_Curve object. Default is "A". Multiplying the current values in the curve by the "phasetrip" value gives the actual current.

Name: `PhaseFast`
Default: a

(Setter)
"""
function PhaseFast(obj::Obj, value::String, flags::SetterFlagsT=SetterFlagsT(0))
    obj_set_str(obj, _PropertyIndex.PhaseFast, value, flags)
end

"""
Name of the TCC Curve object that determines the Phase Delayed trip.  Must have been previously defined as a TCC_Curve object. Default is "D".Multiplying the current values in the curve by the "phasetrip" value gives the actual current.

Name: `PhaseDelayed`
Default: d

(Getter)
"""
function PhaseDelayed_str(obj::Obj)::String
    obj_get_str(obj, _PropertyIndex.PhaseDelayed)
end

"""
Name of the TCC Curve object that determines the Phase Delayed trip.  Must have been previously defined as a TCC_Curve object. Default is "D".Multiplying the current values in the curve by the "phasetrip" value gives the actual current.

Name: `PhaseDelayed`
Default: d

(Setter)
"""
function PhaseDelayed_str(obj::Obj, value::String, flags::SetterFlagsT=SetterFlagsT(0))
    obj_set_str(obj, _PropertyIndex.PhaseDelayed, value, flags)
end

"""
Name of the TCC Curve object that determines the Phase Delayed trip.  Must have been previously defined as a TCC_Curve object. Default is "D".Multiplying the current values in the curve by the "phasetrip" value gives the actual current.

Name: `PhaseDelayed`
Default: d

(Getter)
"""
function PhaseDelayed(obj)::Union{TCC_CurveObj, Nothing}
    obj_get_obj(obj,_PropertyIndex.PhaseDelayed, TCC_CurveObj)
end

"""
Name of the TCC Curve object that determines the Phase Delayed trip.  Must have been previously defined as a TCC_Curve object. Default is "D".Multiplying the current values in the curve by the "phasetrip" value gives the actual current.

Name: `PhaseDelayed`
Default: d

(Setter)
"""
function PhaseDelayed(obj::Obj, value::Union{TCC_CurveObj, Nothing}, flags::SetterFlagsT=SetterFlagsT(0))
    obj_set_obj(obj, _PropertyIndex.PhaseDelayed, value, flags)
end

"""
Name of the TCC Curve object that determines the Phase Delayed trip.  Must have been previously defined as a TCC_Curve object. Default is "D".Multiplying the current values in the curve by the "phasetrip" value gives the actual current.

Name: `PhaseDelayed`
Default: d

(Setter)
"""
function PhaseDelayed(obj::Obj, value::String, flags::SetterFlagsT=SetterFlagsT(0))
    obj_set_str(obj, _PropertyIndex.PhaseDelayed, value, flags)
end

"""
Name of the TCC Curve object that determines the Ground Fast trip.  Must have been previously defined as a TCC_Curve object. Default is none (ignored). Multiplying the current values in the curve by the "groundtrip" value gives the actual current.

Name: `GroundFast`

(Getter)
"""
function GroundFast_str(obj::Obj)::String
    obj_get_str(obj, _PropertyIndex.GroundFast)
end

"""
Name of the TCC Curve object that determines the Ground Fast trip.  Must have been previously defined as a TCC_Curve object. Default is none (ignored). Multiplying the current values in the curve by the "groundtrip" value gives the actual current.

Name: `GroundFast`

(Setter)
"""
function GroundFast_str(obj::Obj, value::String, flags::SetterFlagsT=SetterFlagsT(0))
    obj_set_str(obj, _PropertyIndex.GroundFast, value, flags)
end

"""
Name of the TCC Curve object that determines the Ground Fast trip.  Must have been previously defined as a TCC_Curve object. Default is none (ignored). Multiplying the current values in the curve by the "groundtrip" value gives the actual current.

Name: `GroundFast`

(Getter)
"""
function GroundFast(obj)::Union{TCC_CurveObj, Nothing}
    obj_get_obj(obj,_PropertyIndex.GroundFast, TCC_CurveObj)
end

"""
Name of the TCC Curve object that determines the Ground Fast trip.  Must have been previously defined as a TCC_Curve object. Default is none (ignored). Multiplying the current values in the curve by the "groundtrip" value gives the actual current.

Name: `GroundFast`

(Setter)
"""
function GroundFast(obj::Obj, value::Union{TCC_CurveObj, Nothing}, flags::SetterFlagsT=SetterFlagsT(0))
    obj_set_obj(obj, _PropertyIndex.GroundFast, value, flags)
end

"""
Name of the TCC Curve object that determines the Ground Fast trip.  Must have been previously defined as a TCC_Curve object. Default is none (ignored). Multiplying the current values in the curve by the "groundtrip" value gives the actual current.

Name: `GroundFast`

(Setter)
"""
function GroundFast(obj::Obj, value::String, flags::SetterFlagsT=SetterFlagsT(0))
    obj_set_str(obj, _PropertyIndex.GroundFast, value, flags)
end

"""
Name of the TCC Curve object that determines the Ground Delayed trip.  Must have been previously defined as a TCC_Curve object. Default is none (ignored).Multiplying the current values in the curve by the "groundtrip" value gives the actual current.

Name: `GroundDelayed`

(Getter)
"""
function GroundDelayed_str(obj::Obj)::String
    obj_get_str(obj, _PropertyIndex.GroundDelayed)
end

"""
Name of the TCC Curve object that determines the Ground Delayed trip.  Must have been previously defined as a TCC_Curve object. Default is none (ignored).Multiplying the current values in the curve by the "groundtrip" value gives the actual current.

Name: `GroundDelayed`

(Setter)
"""
function GroundDelayed_str(obj::Obj, value::String, flags::SetterFlagsT=SetterFlagsT(0))
    obj_set_str(obj, _PropertyIndex.GroundDelayed, value, flags)
end

"""
Name of the TCC Curve object that determines the Ground Delayed trip.  Must have been previously defined as a TCC_Curve object. Default is none (ignored).Multiplying the current values in the curve by the "groundtrip" value gives the actual current.

Name: `GroundDelayed`

(Getter)
"""
function GroundDelayed(obj)::Union{TCC_CurveObj, Nothing}
    obj_get_obj(obj,_PropertyIndex.GroundDelayed, TCC_CurveObj)
end

"""
Name of the TCC Curve object that determines the Ground Delayed trip.  Must have been previously defined as a TCC_Curve object. Default is none (ignored).Multiplying the current values in the curve by the "groundtrip" value gives the actual current.

Name: `GroundDelayed`

(Setter)
"""
function GroundDelayed(obj::Obj, value::Union{TCC_CurveObj, Nothing}, flags::SetterFlagsT=SetterFlagsT(0))
    obj_set_obj(obj, _PropertyIndex.GroundDelayed, value, flags)
end

"""
Name of the TCC Curve object that determines the Ground Delayed trip.  Must have been previously defined as a TCC_Curve object. Default is none (ignored).Multiplying the current values in the curve by the "groundtrip" value gives the actual current.

Name: `GroundDelayed`

(Setter)
"""
function GroundDelayed(obj::Obj, value::String, flags::SetterFlagsT=SetterFlagsT(0))
    obj_set_str(obj, _PropertyIndex.GroundDelayed, value, flags)
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
Actual amps for instantaneous phase trip which is assumed to happen in 0.01 sec + Delay Time. Default is 0.0, which signifies no inst trip. 

Name: `PhaseInst`
Default: 0.0

(Getter)
"""
function PhaseInst(obj::Obj)::Float64
    obj_get_float64(obj, _PropertyIndex.PhaseInst)
end

"""
Actual amps for instantaneous phase trip which is assumed to happen in 0.01 sec + Delay Time. Default is 0.0, which signifies no inst trip. 

Name: `PhaseInst`
Default: 0.0

(Setter)
"""
function PhaseInst(obj::Obj, value::Float64, flags::SetterFlagsT=SetterFlagsT(0))
    obj_set_float64(obj, _PropertyIndex.PhaseInst, value, flags)
end

"""
Actual amps for instantaneous ground trip which is assumed to happen in 0.01 sec + Delay Time. Default is 0.0, which signifies no inst trip.

Name: `GroundInst`
Default: 0.0

(Getter)
"""
function GroundInst(obj::Obj)::Float64
    obj_get_float64(obj, _PropertyIndex.GroundInst)
end

"""
Actual amps for instantaneous ground trip which is assumed to happen in 0.01 sec + Delay Time. Default is 0.0, which signifies no inst trip.

Name: `GroundInst`
Default: 0.0

(Setter)
"""
function GroundInst(obj::Obj, value::Float64, flags::SetterFlagsT=SetterFlagsT(0))
    obj_set_float64(obj, _PropertyIndex.GroundInst, value, flags)
end

"""
Reset time for Recloser.

Name: `Reset`
Units: s
Default: 15.0

(Getter)
"""
function Reset(obj::Obj)::Float64
    obj_get_float64(obj, _PropertyIndex.Reset)
end

"""
Reset time for Recloser.

Name: `Reset`
Units: s
Default: 15.0

(Setter)
"""
function Reset(obj::Obj, value::Float64, flags::SetterFlagsT=SetterFlagsT(0))
    obj_set_float64(obj, _PropertyIndex.Reset, value, flags)
end

"""
Total Number of fast and delayed shots to lockout.  Default is 4. This is one more than the number of reclose intervals.

Name: `Shots`
Default: 4

(Getter)
"""
function Shots(obj::Obj)::Int32
    obj_get_int32(obj, _PropertyIndex.Shots)
end

"""
Total Number of fast and delayed shots to lockout.  Default is 4. This is one more than the number of reclose intervals.

Name: `Shots`
Default: 4

(Setter)
"""
function Shots(obj::Obj, value::Int32, flags::SetterFlagsT=SetterFlagsT(0))
    obj_set_int32(obj, _PropertyIndex.Shots, value, flags)
end

"""
Array of reclose intervals.  Default for Recloser is (0.5, 2.0, 2.0) seconds. A locked out Recloser must be closed manually (action=close).

Name: `RecloseIntervals`
Default: [0.5, 2.0, 2.0]

(Getter)
"""
function RecloseIntervals(obj::Obj)::Vector{Float64}
    obj_get_float64s(obj, _PropertyIndex.RecloseIntervals)
end

"""
Array of reclose intervals.  Default for Recloser is (0.5, 2.0, 2.0) seconds. A locked out Recloser must be closed manually (action=close).

Name: `RecloseIntervals`
Default: [0.5, 2.0, 2.0]

(Setter)
"""
function RecloseIntervals(obj::Obj, value::Vector{Float64}, flags::SetterFlagsT=SetterFlagsT(0))
    obj_get_float64s(obj, _PropertyIndex.RecloseIntervals, value, flags)
end

"""
Fixed delay time added to Recloser trip time. Used to represent breaker time or any other delay.

Name: `Delay`
Units: s
Default: 0.0

(Getter)
"""
function Delay(obj::Obj)::Float64
    obj_get_float64(obj, _PropertyIndex.Delay)
end

"""
Fixed delay time added to Recloser trip time. Used to represent breaker time or any other delay.

Name: `Delay`
Units: s
Default: 0.0

(Setter)
"""
function Delay(obj::Obj, value::Float64, flags::SetterFlagsT=SetterFlagsT(0))
    obj_set_float64(obj, _PropertyIndex.Delay, value, flags)
end

"""
Time dial for Phase Fast trip curve. Multiplier on time axis of specified curve.

Name: `TDPhFast`
Default: 1.0

(Getter)
"""
function TDPhFast(obj::Obj)::Float64
    obj_get_float64(obj, _PropertyIndex.TDPhFast)
end

"""
Time dial for Phase Fast trip curve. Multiplier on time axis of specified curve.

Name: `TDPhFast`
Default: 1.0

(Setter)
"""
function TDPhFast(obj::Obj, value::Float64, flags::SetterFlagsT=SetterFlagsT(0))
    obj_set_float64(obj, _PropertyIndex.TDPhFast, value, flags)
end

"""
Time dial for Ground Fast trip curve. Multiplier on time axis of specified curve.

Name: `TDGrFast`
Default: 1.0

(Getter)
"""
function TDGrFast(obj::Obj)::Float64
    obj_get_float64(obj, _PropertyIndex.TDGrFast)
end

"""
Time dial for Ground Fast trip curve. Multiplier on time axis of specified curve.

Name: `TDGrFast`
Default: 1.0

(Setter)
"""
function TDGrFast(obj::Obj, value::Float64, flags::SetterFlagsT=SetterFlagsT(0))
    obj_set_float64(obj, _PropertyIndex.TDGrFast, value, flags)
end

"""
Time dial for Phase Delayed trip curve. Multiplier on time axis of specified curve.

Name: `TDPhDelayed`
Default: 1.0

(Getter)
"""
function TDPhDelayed(obj::Obj)::Float64
    obj_get_float64(obj, _PropertyIndex.TDPhDelayed)
end

"""
Time dial for Phase Delayed trip curve. Multiplier on time axis of specified curve.

Name: `TDPhDelayed`
Default: 1.0

(Setter)
"""
function TDPhDelayed(obj::Obj, value::Float64, flags::SetterFlagsT=SetterFlagsT(0))
    obj_set_float64(obj, _PropertyIndex.TDPhDelayed, value, flags)
end

"""
Time dial for Ground Delayed trip curve. Multiplier on time axis of specified curve.

Name: `TDGrDelayed`
Default: 1.0

(Getter)
"""
function TDGrDelayed(obj::Obj)::Float64
    obj_get_float64(obj, _PropertyIndex.TDGrDelayed)
end

"""
Time dial for Ground Delayed trip curve. Multiplier on time axis of specified curve.

Name: `TDGrDelayed`
Default: 1.0

(Setter)
"""
function TDGrDelayed(obj::Obj, value::Float64, flags::SetterFlagsT=SetterFlagsT(0))
    obj_set_float64(obj, _PropertyIndex.TDGrDelayed, value, flags)
end

"""
Normal state of the recloser. The recloser reverts to this state for reset, change of mode, etc. Defaults to "State" if not specifically declared.

Name: `Normal`
Default: closed

(Getter)
"""
function Normal(obj::Obj)::RecloserState.T
    RecloserState.T(obj_get_int32(obj, _PropertyIndex.Normal))
end

"""
Normal state of the recloser. The recloser reverts to this state for reset, change of mode, etc. Defaults to "State" if not specifically declared.

Name: `Normal`
Default: closed

(Setter)
"""
function Normal(obj::Obj, value::String, flags::SetterFlagsT=SetterFlagsT(0))
    obj_set_str(obj, _PropertyIndex.Normal, value, flags)
end

"""
Normal state of the recloser. The recloser reverts to this state for reset, change of mode, etc. Defaults to "State" if not specifically declared.

Name: `Normal`
Default: closed

(Setter)
"""
function Normal(obj::Obj, value::Union{Int,RecloserState.T}, flags::SetterFlagsT=SetterFlagsT(0))
    obj_set_int32(obj, _PropertyIndex.Normal, Int32(value), flags)
end

"""
Normal state of the recloser. The recloser reverts to this state for reset, change of mode, etc. Defaults to "State" if not specifically declared.

Name: `Normal`
Default: closed

(Getter)
"""
function Normal_str(obj::Obj)::String
    obj_get_str(obj, _PropertyIndex.Normal)
end

"""
Normal state of the recloser. The recloser reverts to this state for reset, change of mode, etc. Defaults to "State" if not specifically declared.

Name: `Normal`
Default: closed

(Setter)
"""
function Normal_str(obj::Obj, value::String, flags::SetterFlagsT=SetterFlagsT(0))
    Normal(obj, value, flags)
end

"""
Actual state of the recloser. Upon setting, immediately forces state of the recloser, overriding the Recloser control. Simulates manual control on recloser. Defaults to Closed. "Open" causes the controlled element to open and lock out. "Closed" causes the controlled element to close and the recloser to reset to its first operation.

Name: `State`
Default: closed

(Getter)
"""
function State(obj::Obj)::RecloserState.T
    RecloserState.T(obj_get_int32(obj, _PropertyIndex.State))
end

"""
Actual state of the recloser. Upon setting, immediately forces state of the recloser, overriding the Recloser control. Simulates manual control on recloser. Defaults to Closed. "Open" causes the controlled element to open and lock out. "Closed" causes the controlled element to close and the recloser to reset to its first operation.

Name: `State`
Default: closed

(Setter)
"""
function State(obj::Obj, value::String, flags::SetterFlagsT=SetterFlagsT(0))
    obj_set_str(obj, _PropertyIndex.State, value, flags)
end

"""
Actual state of the recloser. Upon setting, immediately forces state of the recloser, overriding the Recloser control. Simulates manual control on recloser. Defaults to Closed. "Open" causes the controlled element to open and lock out. "Closed" causes the controlled element to close and the recloser to reset to its first operation.

Name: `State`
Default: closed

(Setter)
"""
function State(obj::Obj, value::Union{Int,RecloserState.T}, flags::SetterFlagsT=SetterFlagsT(0))
    obj_set_int32(obj, _PropertyIndex.State, Int32(value), flags)
end

"""
Actual state of the recloser. Upon setting, immediately forces state of the recloser, overriding the Recloser control. Simulates manual control on recloser. Defaults to Closed. "Open" causes the controlled element to open and lock out. "Closed" causes the controlled element to close and the recloser to reset to its first operation.

Name: `State`
Default: closed

(Getter)
"""
function State_str(obj::Obj)::String
    obj_get_str(obj, _PropertyIndex.State)
end

"""
Actual state of the recloser. Upon setting, immediately forces state of the recloser, overriding the Recloser control. Simulates manual control on recloser. Defaults to Closed. "Open" causes the controlled element to open and lock out. "Closed" causes the controlled element to close and the recloser to reset to its first operation.

Name: `State`
Default: closed

(Setter)
"""
function State_str(obj::Obj, value::String, flags::SetterFlagsT=SetterFlagsT(0))
    State(obj, value, flags)
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

end # module Recloser
export Recloser
