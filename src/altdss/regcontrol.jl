module RegControl
using ..Enums.SetterFlags: SetterFlagsT
using ..Enums: RegControlPhaseSelection
using ..AutoTrans: AutoTransObj
using ..Transformer: TransformerObj
import Base: convert
using ..Common
using ..CircuitElement
using DocStringExtensions
@template (FUNCTIONS, METHODS) = """
                                 $(TYPEDSIGNATURES)
                                 $(DOCSTRING)
                                 """


const _cls_name = "RegControl"
const _cls_idx = 21

module _PropertyIndex
const Transformer = Int32(1)
const Winding = Int32(2)
const VReg = Int32(3)
const Band = Int32(4)
const PTRatio = Int32(5)
const CTPrim = Int32(6)
const R = Int32(7)
const X = Int32(8)
const Bus = Int32(9)
const Delay = Int32(10)
const Reversible = Int32(11)
const RevVReg = Int32(12)
const RevBand = Int32(13)
const RevR = Int32(14)
const RevX = Int32(15)
const TapDelay = Int32(16)
const DebugTrace = Int32(17)
const MaxTapChange = Int32(18)
const InverseTime = Int32(19)
const TapWinding = Int32(20)
const VLimit = Int32(21)
const PTPhase = Int32(22)
const RevThreshold = Int32(23)
const RevDelay = Int32(24)
const RevNeutral = Int32(25)
const EventLog = Int32(26)
const RemotePTRatio = Int32(27)
const TapNum = Int32(28)
const Reset = Int32(29)
const LDC_Z = Int32(30)
const Rev_Z = Int32(31)
const Cogen = Int32(32)
const BaseFreq = Int32(33)
const Enabled = Int32(34)
const Like = Int32(35)
end

struct RegControlObj <: AbstractControlElement
    ptr::Ptr{Cvoid}
    dss::DSSContext
end
export RegControlObj
Common._wrap_dss_obj(::Val{_cls_idx}, ptr::Ptr{Cvoid}, dss::DSSContext) = RegControlObj(ptr, dss)
const Obj = RegControlObj

function Base.show(io::IO, obj::RegControlObj) 
    name = obj_get_str(obj, obj.dss.capi.Obj_GetFullName)
    print(name)
end


include("dss_object.jl")


"""
Name of Transformer or AutoTrans element to which the RegControl is connected. Do not specify the full object name; "Transformer" or "AutoTrans" is assumed for the object class.  Example:

Transformer=Xfmr1

Name: `Transformer`

(Getter)
"""
function Transformer_str(obj::Obj)::String
    obj_get_str(obj, _PropertyIndex.Transformer)
end

"""
Name of Transformer or AutoTrans element to which the RegControl is connected. Do not specify the full object name; "Transformer" or "AutoTrans" is assumed for the object class.  Example:

Transformer=Xfmr1

Name: `Transformer`

(Setter)
"""
function Transformer_str(obj::Obj, value::String, flags::SetterFlagsT=SetterFlagsT(0))
    obj_set_str(obj, _PropertyIndex.Transformer, value, flags)
end

"""
Name of Transformer or AutoTrans element to which the RegControl is connected. Do not specify the full object name; "Transformer" or "AutoTrans" is assumed for the object class.  Example:

Transformer=Xfmr1

Name: `Transformer`

(Getter)
"""
function Transformer(obj)::Union{TransformerObj, AutoTransObj, Nothing}
    obj_get_obj(obj,_PropertyIndex.Transformer)
end

"""
Name of Transformer or AutoTrans element to which the RegControl is connected. Do not specify the full object name; "Transformer" or "AutoTrans" is assumed for the object class.  Example:

Transformer=Xfmr1

Name: `Transformer`

(Setter)
"""
function Transformer(obj::Obj, value::Union{TransformerObj, AutoTransObj, Nothing}, flags::SetterFlagsT=SetterFlagsT(0))
    obj_set_obj(obj, _PropertyIndex.Transformer, value, flags)
end

"""
Name of Transformer or AutoTrans element to which the RegControl is connected. Do not specify the full object name; "Transformer" or "AutoTrans" is assumed for the object class.  Example:

Transformer=Xfmr1

Name: `Transformer`

(Setter)
"""
function Transformer(obj::Obj, value::String, flags::SetterFlagsT=SetterFlagsT(0))
    obj_set_str(obj, _PropertyIndex.Transformer, value, flags)
end

"""
Number of the winding of the transformer element that the RegControl is monitoring. 1 or 2, typically.  Side Effect: Sets TAPWINDING property to the same winding.

Name: `Winding`
Default: 1

(Getter)
"""
function Winding(obj::Obj)::Int32
    obj_get_int32(obj, _PropertyIndex.Winding)
end

"""
Number of the winding of the transformer element that the RegControl is monitoring. 1 or 2, typically.  Side Effect: Sets TAPWINDING property to the same winding.

Name: `Winding`
Default: 1

(Setter)
"""
function Winding(obj::Obj, value::Int32, flags::SetterFlagsT=SetterFlagsT(0))
    obj_set_int32(obj, _PropertyIndex.Winding, value, flags)
end

"""
Voltage regulator setting for the winding being controlled.  Multiplying this value times the ptratio should yield the voltage across the WINDING of the controlled transformer.

Name: `VReg`
Units: V
Default: 120.0

(Getter)
"""
function VReg(obj::Obj)::Float64
    obj_get_float64(obj, _PropertyIndex.VReg)
end

"""
Voltage regulator setting for the winding being controlled.  Multiplying this value times the ptratio should yield the voltage across the WINDING of the controlled transformer.

Name: `VReg`
Units: V
Default: 120.0

(Setter)
"""
function VReg(obj::Obj, value::Float64, flags::SetterFlagsT=SetterFlagsT(0))
    obj_set_float64(obj, _PropertyIndex.VReg, value, flags)
end

"""
Bandwidth in VOLTS for the controlled bus (see help for ptratio property).

Name: `Band`
Default: 3.0

(Getter)
"""
function Band(obj::Obj)::Float64
    obj_get_float64(obj, _PropertyIndex.Band)
end

"""
Bandwidth in VOLTS for the controlled bus (see help for ptratio property).

Name: `Band`
Default: 3.0

(Setter)
"""
function Band(obj::Obj, value::Float64, flags::SetterFlagsT=SetterFlagsT(0))
    obj_set_float64(obj, _PropertyIndex.Band, value, flags)
end

"""
Ratio of the PT that converts the controlled winding voltage to the regulator control voltage. If the winding is Wye, the line-to-neutral voltage is used.  Else, the line-to-line voltage is used. SIDE EFFECT: Also sets RemotePTRatio property.

Name: `PTRatio`
Default: 60.0

(Getter)
"""
function PTRatio(obj::Obj)::Float64
    obj_get_float64(obj, _PropertyIndex.PTRatio)
end

"""
Ratio of the PT that converts the controlled winding voltage to the regulator control voltage. If the winding is Wye, the line-to-neutral voltage is used.  Else, the line-to-line voltage is used. SIDE EFFECT: Also sets RemotePTRatio property.

Name: `PTRatio`
Default: 60.0

(Setter)
"""
function PTRatio(obj::Obj, value::Float64, flags::SetterFlagsT=SetterFlagsT(0))
    obj_set_float64(obj, _PropertyIndex.PTRatio, value, flags)
end

"""
Rating of the primary CT rating for which the line amps convert to control rated amps. The typical default secondary ampere rating is 0.2 Amps (check with manufacturer specs). Current at which the LDC voltages match the R and X settings.

Name: `CTPrim`
Units: A
Default: 300.0

(Getter)
"""
function CTPrim(obj::Obj)::Float64
    obj_get_float64(obj, _PropertyIndex.CTPrim)
end

"""
Rating of the primary CT rating for which the line amps convert to control rated amps. The typical default secondary ampere rating is 0.2 Amps (check with manufacturer specs). Current at which the LDC voltages match the R and X settings.

Name: `CTPrim`
Units: A
Default: 300.0

(Setter)
"""
function CTPrim(obj::Obj, value::Float64, flags::SetterFlagsT=SetterFlagsT(0))
    obj_set_float64(obj, _PropertyIndex.CTPrim, value, flags)
end

"""
R setting on the line drop compensator in the regulator, expressed in VOLTS.

Name: `R`
Default: 0.0

(Getter)
"""
function R(obj::Obj)::Float64
    obj_get_float64(obj, _PropertyIndex.R)
end

"""
R setting on the line drop compensator in the regulator, expressed in VOLTS.

Name: `R`
Default: 0.0

(Setter)
"""
function R(obj::Obj, value::Float64, flags::SetterFlagsT=SetterFlagsT(0))
    obj_set_float64(obj, _PropertyIndex.R, value, flags)
end

"""
X setting on the line drop compensator in the regulator, expressed in VOLTS.

Name: `X`
Default: 0.0

(Getter)
"""
function X(obj::Obj)::Float64
    obj_get_float64(obj, _PropertyIndex.X)
end

"""
X setting on the line drop compensator in the regulator, expressed in VOLTS.

Name: `X`
Default: 0.0

(Setter)
"""
function X(obj::Obj, value::Float64, flags::SetterFlagsT=SetterFlagsT(0))
    obj_set_float64(obj, _PropertyIndex.X, value, flags)
end

"""
Name of a bus (busname.nodename) in the system to use as the controlled bus instead of the bus to which the transformer winding is connected or the R and X line drop compensator settings.  Do not specify this value if you wish to use the line drop compensator settings.  Default is null string. Assumes the base voltage for this bus is the same as the transformer winding base specified above. Note: This bus (1-phase) WILL BE CREATED by the regulator control upon SOLVE if not defined by some other device. You can specify the node of the bus you wish to sample (defaults to 1). If specified, the RegControl is redefined as a 1-phase device since only one voltage is used.

Name: `Bus`

(Getter)
"""
function Bus(obj::Obj)::String
    obj_get_str(obj, _PropertyIndex.Bus)
end

"""
Name of a bus (busname.nodename) in the system to use as the controlled bus instead of the bus to which the transformer winding is connected or the R and X line drop compensator settings.  Do not specify this value if you wish to use the line drop compensator settings.  Default is null string. Assumes the base voltage for this bus is the same as the transformer winding base specified above. Note: This bus (1-phase) WILL BE CREATED by the regulator control upon SOLVE if not defined by some other device. You can specify the node of the bus you wish to sample (defaults to 1). If specified, the RegControl is redefined as a 1-phase device since only one voltage is used.

Name: `Bus`

(Setter)
"""
function Bus(obj::Obj, value::String, flags::SetterFlagsT=SetterFlagsT(0))
    obj_set_str(obj, _PropertyIndex.Bus, value, flags)
end

"""
Time delay from when the voltage goes out of band to when the tap changing begins. This is used to determine which regulator control will act first. You may specify any floating point number to achieve a model of whatever condition is necessary.

Name: `Delay`
Units: s
Default: 15.0

(Getter)
"""
function Delay(obj::Obj)::Float64
    obj_get_float64(obj, _PropertyIndex.Delay)
end

"""
Time delay from when the voltage goes out of band to when the tap changing begins. This is used to determine which regulator control will act first. You may specify any floating point number to achieve a model of whatever condition is necessary.

Name: `Delay`
Units: s
Default: 15.0

(Setter)
"""
function Delay(obj::Obj, value::Float64, flags::SetterFlagsT=SetterFlagsT(0))
    obj_set_float64(obj, _PropertyIndex.Delay, value, flags)
end

"""
Indicates whether or not the regulator can be switched to regulate in the reverse direction. Typically applies only to line regulators and not to LTC on a substation transformer.

Name: `Reversible`
Default: False

(Getter)
"""
function Reversible(obj::Obj)::Bool
    return obj_get_bool(obj, _PropertyIndex.Reversible)
end

"""
Indicates whether or not the regulator can be switched to regulate in the reverse direction. Typically applies only to line regulators and not to LTC on a substation transformer.

Name: `Reversible`
Default: False

(Setter)
"""
function Reversible(obj::Obj, value::Bool, flags::SetterFlagsT=SetterFlagsT(0))
    obj_set_bool(obj, _PropertyIndex.Reversible, value, flags)
end

"""
Voltage setting in volts for operation in the reverse direction.

Name: `RevVReg`
Default: 120.0

(Getter)
"""
function RevVReg(obj::Obj)::Float64
    obj_get_float64(obj, _PropertyIndex.RevVReg)
end

"""
Voltage setting in volts for operation in the reverse direction.

Name: `RevVReg`
Default: 120.0

(Setter)
"""
function RevVReg(obj::Obj, value::Float64, flags::SetterFlagsT=SetterFlagsT(0))
    obj_set_float64(obj, _PropertyIndex.RevVReg, value, flags)
end

"""
Bandwidth for operating in the reverse direction.

Name: `RevBand`
Default: 3.0

(Getter)
"""
function RevBand(obj::Obj)::Float64
    obj_get_float64(obj, _PropertyIndex.RevBand)
end

"""
Bandwidth for operating in the reverse direction.

Name: `RevBand`
Default: 3.0

(Setter)
"""
function RevBand(obj::Obj, value::Float64, flags::SetterFlagsT=SetterFlagsT(0))
    obj_set_float64(obj, _PropertyIndex.RevBand, value, flags)
end

"""
R line drop compensator setting for reverse direction.

Name: `RevR`
Default: 0.0

(Getter)
"""
function RevR(obj::Obj)::Float64
    obj_get_float64(obj, _PropertyIndex.RevR)
end

"""
R line drop compensator setting for reverse direction.

Name: `RevR`
Default: 0.0

(Setter)
"""
function RevR(obj::Obj, value::Float64, flags::SetterFlagsT=SetterFlagsT(0))
    obj_set_float64(obj, _PropertyIndex.RevR, value, flags)
end

"""
X line drop compensator setting for reverse direction.

Name: `RevX`
Default: 0.0

(Getter)
"""
function RevX(obj::Obj)::Float64
    obj_get_float64(obj, _PropertyIndex.RevX)
end

"""
X line drop compensator setting for reverse direction.

Name: `RevX`
Default: 0.0

(Setter)
"""
function RevX(obj::Obj, value::Float64, flags::SetterFlagsT=SetterFlagsT(0))
    obj_set_float64(obj, _PropertyIndex.RevX, value, flags)
end

"""
Delay between tap changes. This is how long it takes between changes after the first change.

Name: `TapDelay`
Units: s
Default: 2.0

(Getter)
"""
function TapDelay(obj::Obj)::Float64
    obj_get_float64(obj, _PropertyIndex.TapDelay)
end

"""
Delay between tap changes. This is how long it takes between changes after the first change.

Name: `TapDelay`
Units: s
Default: 2.0

(Setter)
"""
function TapDelay(obj::Obj, value::Float64, flags::SetterFlagsT=SetterFlagsT(0))
    obj_set_float64(obj, _PropertyIndex.TapDelay, value, flags)
end

"""
Turn this on to capture the progress of the regulator model for each control iteration.  Creates a separate file for each RegControl named "REG_name.csv".

Name: `DebugTrace`
Default: False

(Getter)
"""
function DebugTrace(obj::Obj)::Bool
    return obj_get_bool(obj, _PropertyIndex.DebugTrace)
end

"""
Turn this on to capture the progress of the regulator model for each control iteration.  Creates a separate file for each RegControl named "REG_name.csv".

Name: `DebugTrace`
Default: False

(Setter)
"""
function DebugTrace(obj::Obj, value::Bool, flags::SetterFlagsT=SetterFlagsT(0))
    obj_set_bool(obj, _PropertyIndex.DebugTrace, value, flags)
end

"""
Maximum allowable tap change per control iteration in STATIC control mode.

Set this to 1 to better approximate actual control action. 

Set this to 0 to fix the tap in the current position.

Name: `MaxTapChange`
Default: 16

(Getter)
"""
function MaxTapChange(obj::Obj)::Int32
    obj_get_int32(obj, _PropertyIndex.MaxTapChange)
end

"""
Maximum allowable tap change per control iteration in STATIC control mode.

Set this to 1 to better approximate actual control action. 

Set this to 0 to fix the tap in the current position.

Name: `MaxTapChange`
Default: 16

(Setter)
"""
function MaxTapChange(obj::Obj, value::Int32, flags::SetterFlagsT=SetterFlagsT(0))
    obj_set_int32(obj, _PropertyIndex.MaxTapChange, value, flags)
end

"""
The time delay is adjusted inversely proportional to the amount the voltage is outside the band down to 10%.

Name: `InverseTime`
Default: False

(Getter)
"""
function InverseTime(obj::Obj)::Bool
    return obj_get_bool(obj, _PropertyIndex.InverseTime)
end

"""
The time delay is adjusted inversely proportional to the amount the voltage is outside the band down to 10%.

Name: `InverseTime`
Default: False

(Setter)
"""
function InverseTime(obj::Obj, value::Bool, flags::SetterFlagsT=SetterFlagsT(0))
    obj_set_bool(obj, _PropertyIndex.InverseTime, value, flags)
end

"""
Winding containing the actual taps, if different than the WINDING property. Defaults to the same winding as specified by the WINDING property.

Name: `TapWinding`

(Getter)
"""
function TapWinding(obj::Obj)::Int32
    obj_get_int32(obj, _PropertyIndex.TapWinding)
end

"""
Winding containing the actual taps, if different than the WINDING property. Defaults to the same winding as specified by the WINDING property.

Name: `TapWinding`

(Setter)
"""
function TapWinding(obj::Obj, value::Int32, flags::SetterFlagsT=SetterFlagsT(0))
    obj_set_int32(obj, _PropertyIndex.TapWinding, value, flags)
end

"""
Voltage Limit for bus to which regulated winding is connected (e.g. first customer). Set to a value greater then zero to activate this function.

Name: `VLimit`
Units: V
Default: 0.0

(Getter)
"""
function VLimit(obj::Obj)::Float64
    obj_get_float64(obj, _PropertyIndex.VLimit)
end

"""
Voltage Limit for bus to which regulated winding is connected (e.g. first customer). Set to a value greater then zero to activate this function.

Name: `VLimit`
Units: V
Default: 0.0

(Setter)
"""
function VLimit(obj::Obj, value::Float64, flags::SetterFlagsT=SetterFlagsT(0))
    obj_set_float64(obj, _PropertyIndex.VLimit, value, flags)
end

"""
For multi-phase transformers, the number of the phase being monitored or one of { MAX | MIN} for all phases. Must be less than or equal to the number of phases. Ignored for regulated bus.

Name: `PTPhase`
Default: 1

(Getter)
"""                
function PTPhase(obj::Obj)::Union{RegControlPhaseSelection.T,Int}
    value = obj_get_int32(obj, _PropertyIndex.PTPhase)
    if value > 0
        return value
    end
    return RegControlPhaseSelection.T(value)
end

"""
For multi-phase transformers, the number of the phase being monitored or one of { MAX | MIN} for all phases. Must be less than or equal to the number of phases. Ignored for regulated bus.

Name: `PTPhase`
Default: 1

(Setter)
"""
function PTPhase(obj::Obj, value::String, flags::SetterFlagsT=SetterFlagsT(0))
    obj_set_str(obj, _PropertyIndex.PTPhase, value, flags)
end

"""
For multi-phase transformers, the number of the phase being monitored or one of { MAX | MIN} for all phases. Must be less than or equal to the number of phases. Ignored for regulated bus.

Name: `PTPhase`
Default: 1

(Setter)
"""
function PTPhase(obj::Obj, value::Union{Int,RegControlPhaseSelection.T}, flags::SetterFlagsT=SetterFlagsT(0))
    obj_set_int32(obj, _PropertyIndex.PTPhase, Int32(value), flags)
end

"""
For multi-phase transformers, the number of the phase being monitored or one of { MAX | MIN} for all phases. Must be less than or equal to the number of phases. Ignored for regulated bus.

Name: `PTPhase`
Default: 1

(Getter)
"""
function PTPhase_str(obj::Obj)::String
    obj_get_str(obj, _PropertyIndex.PTPhase)
end

"""
For multi-phase transformers, the number of the phase being monitored or one of { MAX | MIN} for all phases. Must be less than or equal to the number of phases. Ignored for regulated bus.

Name: `PTPhase`
Default: 1

(Setter)
"""
function PTPhase_str(obj::Obj, value::String, flags::SetterFlagsT=SetterFlagsT(0))
    PTPhase(obj, value, flags)
end

"""
kW reverse power threshold for reversing the direction of the regulator.

Name: `RevThreshold`
Units: kW
Default: 100.0

(Getter)
"""
function RevThreshold(obj::Obj)::Float64
    obj_get_float64(obj, _PropertyIndex.RevThreshold)
end

"""
kW reverse power threshold for reversing the direction of the regulator.

Name: `RevThreshold`
Units: kW
Default: 100.0

(Setter)
"""
function RevThreshold(obj::Obj, value::Float64, flags::SetterFlagsT=SetterFlagsT(0))
    obj_set_float64(obj, _PropertyIndex.RevThreshold, value, flags)
end

"""
Time Delay for executing the reversing action once the threshold for reversing has been exceeded.

Name: `RevDelay`
Units: s
Default: 60.0

(Getter)
"""
function RevDelay(obj::Obj)::Float64
    obj_get_float64(obj, _PropertyIndex.RevDelay)
end

"""
Time Delay for executing the reversing action once the threshold for reversing has been exceeded.

Name: `RevDelay`
Units: s
Default: 60.0

(Setter)
"""
function RevDelay(obj::Obj, value::Float64, flags::SetterFlagsT=SetterFlagsT(0))
    obj_set_float64(obj, _PropertyIndex.RevDelay, value, flags)
end

"""
Set this to Yes if you want the regulator to go to neutral in the reverse direction or in cogen operation.

Name: `RevNeutral`
Default: False

(Getter)
"""
function RevNeutral(obj::Obj)::Bool
    return obj_get_bool(obj, _PropertyIndex.RevNeutral)
end

"""
Set this to Yes if you want the regulator to go to neutral in the reverse direction or in cogen operation.

Name: `RevNeutral`
Default: False

(Setter)
"""
function RevNeutral(obj::Obj, value::Bool, flags::SetterFlagsT=SetterFlagsT(0))
    obj_set_bool(obj, _PropertyIndex.RevNeutral, value, flags)
end

"""
Log control actions to Eventlog.

Name: `EventLog`
Default: False

(Getter)
"""
function EventLog(obj::Obj)::Bool
    return obj_get_bool(obj, _PropertyIndex.EventLog)
end

"""
Log control actions to Eventlog.

Name: `EventLog`
Default: False

(Setter)
"""
function EventLog(obj::Obj, value::Bool, flags::SetterFlagsT=SetterFlagsT(0))
    obj_set_bool(obj, _PropertyIndex.EventLog, value, flags)
end

"""
When regulating a bus (the Bus= property is set), the PT ratio required to convert actual voltage at the remote bus to control voltage. Is initialized to PTratio property. Set this property after setting PTratio.

Name: `RemotePTRatio`

(Getter)
"""
function RemotePTRatio(obj::Obj)::Float64
    obj_get_float64(obj, _PropertyIndex.RemotePTRatio)
end

"""
When regulating a bus (the Bus= property is set), the PT ratio required to convert actual voltage at the remote bus to control voltage. Is initialized to PTratio property. Set this property after setting PTratio.

Name: `RemotePTRatio`

(Setter)
"""
function RemotePTRatio(obj::Obj, value::Float64, flags::SetterFlagsT=SetterFlagsT(0))
    obj_set_float64(obj, _PropertyIndex.RemotePTRatio, value, flags)
end

"""
An integer number indicating the tap position that the controlled transformer winding tap position is currently at, or is being set to.  If being set, and the value is outside the range of the transformer min or max tap, then set to the min or max tap position as appropriate. Default is 0

Name: `TapNum`
Default: 0

(Getter)
"""
function TapNum(obj::Obj)::Int32
    obj_get_int32(obj, _PropertyIndex.TapNum)
end

"""
An integer number indicating the tap position that the controlled transformer winding tap position is currently at, or is being set to.  If being set, and the value is outside the range of the transformer min or max tap, then set to the min or max tap position as appropriate. Default is 0

Name: `TapNum`
Default: 0

(Setter)
"""
function TapNum(obj::Obj, value::Int32, flags::SetterFlagsT=SetterFlagsT(0))
    obj_set_int32(obj, _PropertyIndex.TapNum, value, flags)
end

"""
If Yes, forces Reset of this RegControl.

Name: `Reset`
Default: False
"""
function Reset(obj::Obj, value::Bool=true, flags::SetterFlagsT=SetterFlagsT(0))
    obj_set_bool(obj, _PropertyIndex.Reset, value, flags)
end

"""
Z value for Beckwith LDC_Z control option. Volts adjustment at rated control current.

Name: `LDC_Z`
Default: 0.0

(Getter)
"""
function LDC_Z(obj::Obj)::Float64
    obj_get_float64(obj, _PropertyIndex.LDC_Z)
end

"""
Z value for Beckwith LDC_Z control option. Volts adjustment at rated control current.

Name: `LDC_Z`
Default: 0.0

(Setter)
"""
function LDC_Z(obj::Obj, value::Float64, flags::SetterFlagsT=SetterFlagsT(0))
    obj_set_float64(obj, _PropertyIndex.LDC_Z, value, flags)
end

"""
Reverse Z value for Beckwith LDC_Z control option.

Name: `Rev_Z`
Default: 0.0

(Getter)
"""
function Rev_Z(obj::Obj)::Float64
    obj_get_float64(obj, _PropertyIndex.Rev_Z)
end

"""
Reverse Z value for Beckwith LDC_Z control option.

Name: `Rev_Z`
Default: 0.0

(Setter)
"""
function Rev_Z(obj::Obj, value::Float64, flags::SetterFlagsT=SetterFlagsT(0))
    obj_set_float64(obj, _PropertyIndex.Rev_Z, value, flags)
end

"""
The Cogen feature is activated. Continues looking forward if power reverses, but switches to reverse-mode LDC, vreg and band values.

Name: `Cogen`
Default: False

(Getter)
"""
function Cogen(obj::Obj)::Bool
    return obj_get_bool(obj, _PropertyIndex.Cogen)
end

"""
The Cogen feature is activated. Continues looking forward if power reverses, but switches to reverse-mode LDC, vreg and band values.

Name: `Cogen`
Default: False

(Setter)
"""
function Cogen(obj::Obj, value::Bool, flags::SetterFlagsT=SetterFlagsT(0))
    obj_set_bool(obj, _PropertyIndex.Cogen, value, flags)
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

end # module RegControl
export RegControl
