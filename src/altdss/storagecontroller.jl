module StorageController
using ..Enums.SetterFlags: SetterFlagsT
using ..Enums: MonitoredPhase, StorageControllerChargeMode, StorageControllerDischargeMode
using ..LoadShape: LoadShapeObj
import Base: convert
using ..Common
using ..CircuitElement
using DocStringExtensions
@template (FUNCTIONS, METHODS) = """
                                 $(TYPEDSIGNATURES)
                                 $(DOCSTRING)
                                 """


const _cls_name = "StorageController"
const _cls_idx = 31

module _PropertyIndex
const Element = Int32(1)
const Terminal = Int32(2)
const MonPhase = Int32(3)
const kWTarget = Int32(4)
const kWTargetLow = Int32(5)
const pctkWBand = Int32(6)
const kWBand = Int32(7)
const pctkWBandLow = Int32(8)
const kWBandLow = Int32(9)
const ElementList = Int32(10)
const Weights = Int32(11)
const ModeDischarge = Int32(12)
const ModeCharge = Int32(13)
const TimeDischargeTrigger = Int32(14)
const TimeChargeTrigger = Int32(15)
const pctRatekW = Int32(16)
const pctRateCharge = Int32(17)
const pctReserve = Int32(18)
const kWhTotal = Int32(19)
const kWTotal = Int32(20)
const kWhActual = Int32(21)
const kWActual = Int32(22)
const kWNeed = Int32(23)
const Yearly = Int32(24)
const Daily = Int32(25)
const Duty = Int32(26)
const EventLog = Int32(27)
const InhibitTime = Int32(28)
const TUp = Int32(29)
const TFlat = Int32(30)
const TDn = Int32(31)
const kWThreshold = Int32(32)
const DispFactor = Int32(33)
const ResetLevel = Int32(34)
const Seasons = Int32(35)
const SeasonTargets = Int32(36)
const SeasonTargetsLow = Int32(37)
const BaseFreq = Int32(38)
const Enabled = Int32(39)
const Like = Int32(40)
end

struct StorageControllerObj <: AbstractControlElement
    ptr::Ptr{Cvoid}
    dss::DSSContext
end
export StorageControllerObj
Common._wrap_dss_obj(::Val{_cls_idx}, ptr::Ptr{Cvoid}, dss::DSSContext) = StorageControllerObj(ptr, dss)
const Obj = StorageControllerObj

function Base.show(io::IO, obj::StorageControllerObj) 
    name = obj_get_str(obj, obj.dss.capi.Obj_GetFullName)
    print(name)
end


include("dss_object.jl")


"""
Full object name of the circuit element, typically a line or transformer, which the control is monitoring. There is no default; Must be specified.In "Local" control mode, is the name of the load that will be managed by the storage device, which should be installed at the same bus.

Name: `Element`

(Getter)
"""
function Element_str(obj::Obj)::String
    obj_get_str(obj, _PropertyIndex.Element)
end

"""
Full object name of the circuit element, typically a line or transformer, which the control is monitoring. There is no default; Must be specified.In "Local" control mode, is the name of the load that will be managed by the storage device, which should be installed at the same bus.

Name: `Element`

(Setter)
"""
function Element_str(obj::Obj, value::String, flags::SetterFlagsT=SetterFlagsT(0))
    obj_set_str(obj, _PropertyIndex.Element, value, flags)
end

"""
Full object name of the circuit element, typically a line or transformer, which the control is monitoring. There is no default; Must be specified.In "Local" control mode, is the name of the load that will be managed by the storage device, which should be installed at the same bus.

Name: `Element`

(Getter)
"""
function Element(obj)::DSSObj
    obj_get_obj(obj,_PropertyIndex.Element)
end

"""
Full object name of the circuit element, typically a line or transformer, which the control is monitoring. There is no default; Must be specified.In "Local" control mode, is the name of the load that will be managed by the storage device, which should be installed at the same bus.

Name: `Element`

(Setter)
"""
function Element(obj::Obj, value::DSSObj, flags::SetterFlagsT=SetterFlagsT(0))
    obj_set_obj(obj, _PropertyIndex.Element, value, flags)
end

"""
Full object name of the circuit element, typically a line or transformer, which the control is monitoring. There is no default; Must be specified.In "Local" control mode, is the name of the load that will be managed by the storage device, which should be installed at the same bus.

Name: `Element`

(Setter)
"""
function Element(obj::Obj, value::String, flags::SetterFlagsT=SetterFlagsT(0))
    obj_set_str(obj, _PropertyIndex.Element, value, flags)
end

"""
Number of the terminal of the circuit element to which the StorageController control is connected. 1 or 2, typically.  Default is 1. Make sure to select the proper direction on the power for the respective dispatch mode.

Name: `Terminal`
Default: 1

(Getter)
"""
function Terminal(obj::Obj)::Int32
    obj_get_int32(obj, _PropertyIndex.Terminal)
end

"""
Number of the terminal of the circuit element to which the StorageController control is connected. 1 or 2, typically.  Default is 1. Make sure to select the proper direction on the power for the respective dispatch mode.

Name: `Terminal`
Default: 1

(Setter)
"""
function Terminal(obj::Obj, value::Int32, flags::SetterFlagsT=SetterFlagsT(0))
    obj_set_int32(obj, _PropertyIndex.Terminal, value, flags)
end

"""
Number of the phase being monitored or one of {AVG | MAX | MIN} for all phases. Default=MAX. Must be less than the number of phases. Used in PeakShave, Follow, Support and I-PeakShave discharging modes and in PeakShaveLow, I-PeakShaveLow charging modes. For modes based on active power measurements, the value used by the control is the monitored one multiplied by the number of phases of the monitored element.

Name: `MonPhase`
Default: max

(Getter)
"""                
function MonPhase(obj::Obj)::Union{MonitoredPhase.T,Int}
    value = obj_get_int32(obj, _PropertyIndex.MonPhase)
    if value > 0
        return value
    end
    return MonitoredPhase.T(value)
end

"""
Number of the phase being monitored or one of {AVG | MAX | MIN} for all phases. Default=MAX. Must be less than the number of phases. Used in PeakShave, Follow, Support and I-PeakShave discharging modes and in PeakShaveLow, I-PeakShaveLow charging modes. For modes based on active power measurements, the value used by the control is the monitored one multiplied by the number of phases of the monitored element.

Name: `MonPhase`
Default: max

(Setter)
"""
function MonPhase(obj::Obj, value::String, flags::SetterFlagsT=SetterFlagsT(0))
    obj_set_str(obj, _PropertyIndex.MonPhase, value, flags)
end

"""
Number of the phase being monitored or one of {AVG | MAX | MIN} for all phases. Default=MAX. Must be less than the number of phases. Used in PeakShave, Follow, Support and I-PeakShave discharging modes and in PeakShaveLow, I-PeakShaveLow charging modes. For modes based on active power measurements, the value used by the control is the monitored one multiplied by the number of phases of the monitored element.

Name: `MonPhase`
Default: max

(Setter)
"""
function MonPhase(obj::Obj, value::Union{Int,MonitoredPhase.T}, flags::SetterFlagsT=SetterFlagsT(0))
    obj_set_int32(obj, _PropertyIndex.MonPhase, Int32(value), flags)
end

"""
Number of the phase being monitored or one of {AVG | MAX | MIN} for all phases. Default=MAX. Must be less than the number of phases. Used in PeakShave, Follow, Support and I-PeakShave discharging modes and in PeakShaveLow, I-PeakShaveLow charging modes. For modes based on active power measurements, the value used by the control is the monitored one multiplied by the number of phases of the monitored element.

Name: `MonPhase`
Default: max

(Getter)
"""
function MonPhase_str(obj::Obj)::String
    obj_get_str(obj, _PropertyIndex.MonPhase)
end

"""
Number of the phase being monitored or one of {AVG | MAX | MIN} for all phases. Default=MAX. Must be less than the number of phases. Used in PeakShave, Follow, Support and I-PeakShave discharging modes and in PeakShaveLow, I-PeakShaveLow charging modes. For modes based on active power measurements, the value used by the control is the monitored one multiplied by the number of phases of the monitored element.

Name: `MonPhase`
Default: max

(Setter)
"""
function MonPhase_str(obj::Obj, value::String, flags::SetterFlagsT=SetterFlagsT(0))
    MonPhase(obj, value, flags)
end

"""
kW/kamps target for Discharging. The Storage element fleet is dispatched to try to hold the power/current in band at least until the Storage is depleted. The selection of power or current depends on the Discharge mode (PeakShave->kW, I-PeakShave->kamps).

Name: `kWTarget`
Units: kW
Default: 8000.0

(Getter)
"""
function kWTarget(obj::Obj)::Float64
    obj_get_float64(obj, _PropertyIndex.kWTarget)
end

"""
kW/kamps target for Discharging. The Storage element fleet is dispatched to try to hold the power/current in band at least until the Storage is depleted. The selection of power or current depends on the Discharge mode (PeakShave->kW, I-PeakShave->kamps).

Name: `kWTarget`
Units: kW
Default: 8000.0

(Setter)
"""
function kWTarget(obj::Obj, value::Float64, flags::SetterFlagsT=SetterFlagsT(0))
    obj_set_float64(obj, _PropertyIndex.kWTarget, value, flags)
end

"""
kW/kamps target for Charging. The Storage element fleet is dispatched to try to hold the power/current in band at least until the Storage is fully charged. The selection of power or current depends on the charge mode (PeakShavelow->kW, I-PeakShavelow->kamps).

Name: `kWTargetLow`
Units: kW
Default: 4000.0

(Getter)
"""
function kWTargetLow(obj::Obj)::Float64
    obj_get_float64(obj, _PropertyIndex.kWTargetLow)
end

"""
kW/kamps target for Charging. The Storage element fleet is dispatched to try to hold the power/current in band at least until the Storage is fully charged. The selection of power or current depends on the charge mode (PeakShavelow->kW, I-PeakShavelow->kamps).

Name: `kWTargetLow`
Units: kW
Default: 4000.0

(Setter)
"""
function kWTargetLow(obj::Obj, value::Float64, flags::SetterFlagsT=SetterFlagsT(0))
    obj_set_float64(obj, _PropertyIndex.kWTargetLow, value, flags)
end

"""
Bandwidth (% of Target kW/kamps) of the dead band around the kW/kamps target value. Default is 2% (+/-1%).No dispatch changes are attempted if the power in the monitored terminal stays within this band.

Name: `%kWBand`
Default: 2.0

(Getter)
"""
function pctkWBand(obj::Obj)::Float64
    obj_get_float64(obj, _PropertyIndex.pctkWBand)
end

"""
Bandwidth (% of Target kW/kamps) of the dead band around the kW/kamps target value. Default is 2% (+/-1%).No dispatch changes are attempted if the power in the monitored terminal stays within this band.

Name: `%kWBand`
Default: 2.0

(Setter)
"""
function pctkWBand(obj::Obj, value::Float64, flags::SetterFlagsT=SetterFlagsT(0))
    obj_set_float64(obj, _PropertyIndex.pctkWBand, value, flags)
end

"""
Alternative way of specifying the bandwidth. (kW/kamps) of the dead band around the kW/kamps target value. Default is 2% of kWTarget (+/-1%).No dispatch changes are attempted if the power in the monitored terminal stays within this band.

Name: `kWBand`
Units: kW

(Getter)
"""
function kWBand(obj::Obj)::Float64
    obj_get_float64(obj, _PropertyIndex.kWBand)
end

"""
Alternative way of specifying the bandwidth. (kW/kamps) of the dead band around the kW/kamps target value. Default is 2% of kWTarget (+/-1%).No dispatch changes are attempted if the power in the monitored terminal stays within this band.

Name: `kWBand`
Units: kW

(Setter)
"""
function kWBand(obj::Obj, value::Float64, flags::SetterFlagsT=SetterFlagsT(0))
    obj_set_float64(obj, _PropertyIndex.kWBand, value, flags)
end

"""
Bandwidth (% of kWTargetLow) of the dead band around the kW/kamps low target value. Default is 2% (+/-1%).No charging is attempted if the power in the monitored terminal stays within this band.

Name: `%kWBandLow`
Default: 2.0

(Getter)
"""
function pctkWBandLow(obj::Obj)::Float64
    obj_get_float64(obj, _PropertyIndex.pctkWBandLow)
end

"""
Bandwidth (% of kWTargetLow) of the dead band around the kW/kamps low target value. Default is 2% (+/-1%).No charging is attempted if the power in the monitored terminal stays within this band.

Name: `%kWBandLow`
Default: 2.0

(Setter)
"""
function pctkWBandLow(obj::Obj, value::Float64, flags::SetterFlagsT=SetterFlagsT(0))
    obj_set_float64(obj, _PropertyIndex.pctkWBandLow, value, flags)
end

"""
Alternative way of specifying the bandwidth. (kW/kamps) of the dead band around the kW/kamps low target value. Default is 2% of kWTargetLow (+/-1%).No charging is attempted if the power in the monitored terminal stays within this band.

Name: `kWBandLow`
Units: kW

(Getter)
"""
function kWBandLow(obj::Obj)::Float64
    obj_get_float64(obj, _PropertyIndex.kWBandLow)
end

"""
Alternative way of specifying the bandwidth. (kW/kamps) of the dead band around the kW/kamps low target value. Default is 2% of kWTargetLow (+/-1%).No charging is attempted if the power in the monitored terminal stays within this band.

Name: `kWBandLow`
Units: kW

(Setter)
"""
function kWBandLow(obj::Obj, value::Float64, flags::SetterFlagsT=SetterFlagsT(0))
    obj_set_float64(obj, _PropertyIndex.kWBandLow, value, flags)
end

"""
Array list of Storage elements to be controlled.  If not specified, all Storage elements in the circuit not presently dispatched by another controller are assumed dispatched by this controller.

Name: `ElementList`

(Getter)
"""
function ElementList(obj::Obj)::Vector{String}
    obj_get_strs(obj, _PropertyIndex.ElementList)
end

"""
Array list of Storage elements to be controlled.  If not specified, all Storage elements in the circuit not presently dispatched by another controller are assumed dispatched by this controller.

Name: `ElementList`

(Setter)
"""
function ElementList(obj::Obj, value::Vector{String}, flags::SetterFlagsT=SetterFlagsT(0))
    obj_set_strs(obj, _PropertyIndex.ElementList, value, flags)
end

"""
Array of proportional weights corresponding to each Storage element in the ElementList. The needed kW or kvar to get back to center band is dispatched to each Storage element according to these weights. Default is to set all weights to 1.0.

Name: `Weights`

(Getter)
"""
function Weights(obj::Obj)::Vector{Float64}
    obj_get_float64s(obj, _PropertyIndex.Weights)
end

"""
Array of proportional weights corresponding to each Storage element in the ElementList. The needed kW or kvar to get back to center band is dispatched to each Storage element according to these weights. Default is to set all weights to 1.0.

Name: `Weights`

(Setter)
"""
function Weights(obj::Obj, value::Vector{Float64}, flags::SetterFlagsT=SetterFlagsT(0))
    obj_get_float64s(obj, _PropertyIndex.Weights, value, flags)
end

"""
Mode of operation for the DISCHARGE FUNCTION of this controller. 

In PeakShave mode (Default), the control attempts to discharge Storage to keep power in the monitored element below the kWTarget. 

In Follow mode, the control is triggered by time and resets the kWTarget value to the present monitored element power. It then attempts to discharge Storage to keep power in the monitored element below the new kWTarget. See TimeDischargeTrigger.

In Support mode, the control operates oppositely of PeakShave mode: Storage is discharged to keep kW power output up near the target. 

In Loadshape mode, both charging and discharging precisely follows the per unit loadshape. Storage is discharged when the loadshape value is positive. 

In Time mode, the Storage discharge is turned on at the specified %RatekW at the specified discharge trigger time in fractional hours.

In Schedule mode, the Tup, TFlat, and Tdn properties specify the up ramp duration, flat duration, and down ramp duration for the schedule. The schedule start time is set by TimeDischargeTrigger and the rate of discharge for the flat part is determined by %RatekW.

In I-PeakShave mode, the control attempts to discharge Storage to keep current in the monitored element below the target given in k-amps (thousands of amps), when this control mode is active, the property kWTarget will be expressed in k-amps. 

Name: `ModeDischarge`
Default: PeakShave

(Getter)
"""
function ModeDischarge(obj::Obj)::StorageControllerDischargeMode.T
    StorageControllerDischargeMode.T(obj_get_int32(obj, _PropertyIndex.ModeDischarge))
end

"""
Mode of operation for the DISCHARGE FUNCTION of this controller. 

In PeakShave mode (Default), the control attempts to discharge Storage to keep power in the monitored element below the kWTarget. 

In Follow mode, the control is triggered by time and resets the kWTarget value to the present monitored element power. It then attempts to discharge Storage to keep power in the monitored element below the new kWTarget. See TimeDischargeTrigger.

In Support mode, the control operates oppositely of PeakShave mode: Storage is discharged to keep kW power output up near the target. 

In Loadshape mode, both charging and discharging precisely follows the per unit loadshape. Storage is discharged when the loadshape value is positive. 

In Time mode, the Storage discharge is turned on at the specified %RatekW at the specified discharge trigger time in fractional hours.

In Schedule mode, the Tup, TFlat, and Tdn properties specify the up ramp duration, flat duration, and down ramp duration for the schedule. The schedule start time is set by TimeDischargeTrigger and the rate of discharge for the flat part is determined by %RatekW.

In I-PeakShave mode, the control attempts to discharge Storage to keep current in the monitored element below the target given in k-amps (thousands of amps), when this control mode is active, the property kWTarget will be expressed in k-amps. 

Name: `ModeDischarge`
Default: PeakShave

(Setter)
"""
function ModeDischarge(obj::Obj, value::String, flags::SetterFlagsT=SetterFlagsT(0))
    obj_set_str(obj, _PropertyIndex.ModeDischarge, value, flags)
end

"""
Mode of operation for the DISCHARGE FUNCTION of this controller. 

In PeakShave mode (Default), the control attempts to discharge Storage to keep power in the monitored element below the kWTarget. 

In Follow mode, the control is triggered by time and resets the kWTarget value to the present monitored element power. It then attempts to discharge Storage to keep power in the monitored element below the new kWTarget. See TimeDischargeTrigger.

In Support mode, the control operates oppositely of PeakShave mode: Storage is discharged to keep kW power output up near the target. 

In Loadshape mode, both charging and discharging precisely follows the per unit loadshape. Storage is discharged when the loadshape value is positive. 

In Time mode, the Storage discharge is turned on at the specified %RatekW at the specified discharge trigger time in fractional hours.

In Schedule mode, the Tup, TFlat, and Tdn properties specify the up ramp duration, flat duration, and down ramp duration for the schedule. The schedule start time is set by TimeDischargeTrigger and the rate of discharge for the flat part is determined by %RatekW.

In I-PeakShave mode, the control attempts to discharge Storage to keep current in the monitored element below the target given in k-amps (thousands of amps), when this control mode is active, the property kWTarget will be expressed in k-amps. 

Name: `ModeDischarge`
Default: PeakShave

(Setter)
"""
function ModeDischarge(obj::Obj, value::Union{Int,StorageControllerDischargeMode.T}, flags::SetterFlagsT=SetterFlagsT(0))
    obj_set_int32(obj, _PropertyIndex.ModeDischarge, Int32(value), flags)
end

"""
Mode of operation for the DISCHARGE FUNCTION of this controller. 

In PeakShave mode (Default), the control attempts to discharge Storage to keep power in the monitored element below the kWTarget. 

In Follow mode, the control is triggered by time and resets the kWTarget value to the present monitored element power. It then attempts to discharge Storage to keep power in the monitored element below the new kWTarget. See TimeDischargeTrigger.

In Support mode, the control operates oppositely of PeakShave mode: Storage is discharged to keep kW power output up near the target. 

In Loadshape mode, both charging and discharging precisely follows the per unit loadshape. Storage is discharged when the loadshape value is positive. 

In Time mode, the Storage discharge is turned on at the specified %RatekW at the specified discharge trigger time in fractional hours.

In Schedule mode, the Tup, TFlat, and Tdn properties specify the up ramp duration, flat duration, and down ramp duration for the schedule. The schedule start time is set by TimeDischargeTrigger and the rate of discharge for the flat part is determined by %RatekW.

In I-PeakShave mode, the control attempts to discharge Storage to keep current in the monitored element below the target given in k-amps (thousands of amps), when this control mode is active, the property kWTarget will be expressed in k-amps. 

Name: `ModeDischarge`
Default: PeakShave

(Getter)
"""
function ModeDischarge_str(obj::Obj)::String
    obj_get_str(obj, _PropertyIndex.ModeDischarge)
end

"""
Mode of operation for the DISCHARGE FUNCTION of this controller. 

In PeakShave mode (Default), the control attempts to discharge Storage to keep power in the monitored element below the kWTarget. 

In Follow mode, the control is triggered by time and resets the kWTarget value to the present monitored element power. It then attempts to discharge Storage to keep power in the monitored element below the new kWTarget. See TimeDischargeTrigger.

In Support mode, the control operates oppositely of PeakShave mode: Storage is discharged to keep kW power output up near the target. 

In Loadshape mode, both charging and discharging precisely follows the per unit loadshape. Storage is discharged when the loadshape value is positive. 

In Time mode, the Storage discharge is turned on at the specified %RatekW at the specified discharge trigger time in fractional hours.

In Schedule mode, the Tup, TFlat, and Tdn properties specify the up ramp duration, flat duration, and down ramp duration for the schedule. The schedule start time is set by TimeDischargeTrigger and the rate of discharge for the flat part is determined by %RatekW.

In I-PeakShave mode, the control attempts to discharge Storage to keep current in the monitored element below the target given in k-amps (thousands of amps), when this control mode is active, the property kWTarget will be expressed in k-amps. 

Name: `ModeDischarge`
Default: PeakShave

(Setter)
"""
function ModeDischarge_str(obj::Obj, value::String, flags::SetterFlagsT=SetterFlagsT(0))
    ModeDischarge(obj, value, flags)
end

"""
Mode of operation for the CHARGE FUNCTION of this controller. 

In Loadshape mode, both charging and discharging precisely follows the per unit loadshape. Storage is charged when the loadshape value is negative. 

In Time mode, the Storage charging FUNCTION is triggered at the specified %RateCharge at the specified charge trigger time in fractional hours.

In PeakShaveLow mode, the charging operation will charge the Storage fleet when the power at a monitored element is below a specified KW target (kWTarget_low). The Storage will charge as much power as necessary to keep the power within the deadband around kWTarget_low.

In I-PeakShaveLow mode, the charging operation will charge the Storage fleet when the current (Amps) at a monitored element is below a specified amps target (kWTarget_low). The Storage will charge as much power as necessary to keep the amps within the deadband around kWTarget_low. When this control mode is active, the property kWTarget_low will be expressed in k-amps and all the other parameters will be adjusted to match the amps (current) control criteria.

Name: `ModeCharge`
Default: Time

(Getter)
"""
function ModeCharge(obj::Obj)::StorageControllerChargeMode.T
    StorageControllerChargeMode.T(obj_get_int32(obj, _PropertyIndex.ModeCharge))
end

"""
Mode of operation for the CHARGE FUNCTION of this controller. 

In Loadshape mode, both charging and discharging precisely follows the per unit loadshape. Storage is charged when the loadshape value is negative. 

In Time mode, the Storage charging FUNCTION is triggered at the specified %RateCharge at the specified charge trigger time in fractional hours.

In PeakShaveLow mode, the charging operation will charge the Storage fleet when the power at a monitored element is below a specified KW target (kWTarget_low). The Storage will charge as much power as necessary to keep the power within the deadband around kWTarget_low.

In I-PeakShaveLow mode, the charging operation will charge the Storage fleet when the current (Amps) at a monitored element is below a specified amps target (kWTarget_low). The Storage will charge as much power as necessary to keep the amps within the deadband around kWTarget_low. When this control mode is active, the property kWTarget_low will be expressed in k-amps and all the other parameters will be adjusted to match the amps (current) control criteria.

Name: `ModeCharge`
Default: Time

(Setter)
"""
function ModeCharge(obj::Obj, value::String, flags::SetterFlagsT=SetterFlagsT(0))
    obj_set_str(obj, _PropertyIndex.ModeCharge, value, flags)
end

"""
Mode of operation for the CHARGE FUNCTION of this controller. 

In Loadshape mode, both charging and discharging precisely follows the per unit loadshape. Storage is charged when the loadshape value is negative. 

In Time mode, the Storage charging FUNCTION is triggered at the specified %RateCharge at the specified charge trigger time in fractional hours.

In PeakShaveLow mode, the charging operation will charge the Storage fleet when the power at a monitored element is below a specified KW target (kWTarget_low). The Storage will charge as much power as necessary to keep the power within the deadband around kWTarget_low.

In I-PeakShaveLow mode, the charging operation will charge the Storage fleet when the current (Amps) at a monitored element is below a specified amps target (kWTarget_low). The Storage will charge as much power as necessary to keep the amps within the deadband around kWTarget_low. When this control mode is active, the property kWTarget_low will be expressed in k-amps and all the other parameters will be adjusted to match the amps (current) control criteria.

Name: `ModeCharge`
Default: Time

(Setter)
"""
function ModeCharge(obj::Obj, value::Union{Int,StorageControllerChargeMode.T}, flags::SetterFlagsT=SetterFlagsT(0))
    obj_set_int32(obj, _PropertyIndex.ModeCharge, Int32(value), flags)
end

"""
Mode of operation for the CHARGE FUNCTION of this controller. 

In Loadshape mode, both charging and discharging precisely follows the per unit loadshape. Storage is charged when the loadshape value is negative. 

In Time mode, the Storage charging FUNCTION is triggered at the specified %RateCharge at the specified charge trigger time in fractional hours.

In PeakShaveLow mode, the charging operation will charge the Storage fleet when the power at a monitored element is below a specified KW target (kWTarget_low). The Storage will charge as much power as necessary to keep the power within the deadband around kWTarget_low.

In I-PeakShaveLow mode, the charging operation will charge the Storage fleet when the current (Amps) at a monitored element is below a specified amps target (kWTarget_low). The Storage will charge as much power as necessary to keep the amps within the deadband around kWTarget_low. When this control mode is active, the property kWTarget_low will be expressed in k-amps and all the other parameters will be adjusted to match the amps (current) control criteria.

Name: `ModeCharge`
Default: Time

(Getter)
"""
function ModeCharge_str(obj::Obj)::String
    obj_get_str(obj, _PropertyIndex.ModeCharge)
end

"""
Mode of operation for the CHARGE FUNCTION of this controller. 

In Loadshape mode, both charging and discharging precisely follows the per unit loadshape. Storage is charged when the loadshape value is negative. 

In Time mode, the Storage charging FUNCTION is triggered at the specified %RateCharge at the specified charge trigger time in fractional hours.

In PeakShaveLow mode, the charging operation will charge the Storage fleet when the power at a monitored element is below a specified KW target (kWTarget_low). The Storage will charge as much power as necessary to keep the power within the deadband around kWTarget_low.

In I-PeakShaveLow mode, the charging operation will charge the Storage fleet when the current (Amps) at a monitored element is below a specified amps target (kWTarget_low). The Storage will charge as much power as necessary to keep the amps within the deadband around kWTarget_low. When this control mode is active, the property kWTarget_low will be expressed in k-amps and all the other parameters will be adjusted to match the amps (current) control criteria.

Name: `ModeCharge`
Default: Time

(Setter)
"""
function ModeCharge_str(obj::Obj, value::String, flags::SetterFlagsT=SetterFlagsT(0))
    ModeCharge(obj, value, flags)
end

"""
Default time of day (hr) for initiating Discharging of the fleet. During Follow or Time mode discharging is triggered at a fixed time each day at this hour. If Follow mode, Storage will be discharged to attempt to hold the load at or below the power level at the time of triggering. In Time mode, the discharge is based on the %RatekW property value. Set this to a negative value to ignore. Default is 12.0 for Follow mode; otherwise it is -1 (ignored). 

Name: `TimeDischargeTrigger`
Units: hour (0-24)
Default: -1.0

(Getter)
"""
function TimeDischargeTrigger(obj::Obj)::Float64
    obj_get_float64(obj, _PropertyIndex.TimeDischargeTrigger)
end

"""
Default time of day (hr) for initiating Discharging of the fleet. During Follow or Time mode discharging is triggered at a fixed time each day at this hour. If Follow mode, Storage will be discharged to attempt to hold the load at or below the power level at the time of triggering. In Time mode, the discharge is based on the %RatekW property value. Set this to a negative value to ignore. Default is 12.0 for Follow mode; otherwise it is -1 (ignored). 

Name: `TimeDischargeTrigger`
Units: hour (0-24)
Default: -1.0

(Setter)
"""
function TimeDischargeTrigger(obj::Obj, value::Float64, flags::SetterFlagsT=SetterFlagsT(0))
    obj_set_float64(obj, _PropertyIndex.TimeDischargeTrigger, value, flags)
end

"""
Default time of day (hr) for initiating charging in Time control mode. Set this to a negative value to ignore. Default is 2.0.  (0200).When this value is >0 the Storage fleet is set to charging at this time regardless of other control criteria to make sure Storage is topped off for the next discharge cycle.

Name: `TimeChargeTrigger`
Units: hour (0-24)
Default: 2.0

(Getter)
"""
function TimeChargeTrigger(obj::Obj)::Float64
    obj_get_float64(obj, _PropertyIndex.TimeChargeTrigger)
end

"""
Default time of day (hr) for initiating charging in Time control mode. Set this to a negative value to ignore. Default is 2.0.  (0200).When this value is >0 the Storage fleet is set to charging at this time regardless of other control criteria to make sure Storage is topped off for the next discharge cycle.

Name: `TimeChargeTrigger`
Units: hour (0-24)
Default: 2.0

(Setter)
"""
function TimeChargeTrigger(obj::Obj, value::Float64, flags::SetterFlagsT=SetterFlagsT(0))
    obj_set_float64(obj, _PropertyIndex.TimeChargeTrigger, value, flags)
end

"""
Sets the kW discharge rate in % of rated capacity for each element of the fleet. Applies to TIME control mode, SCHEDULE mode, or anytime discharging is triggered by time.

Name: `%RatekW`
Default: 20.0

(Getter)
"""
function pctRatekW(obj::Obj)::Float64
    obj_get_float64(obj, _PropertyIndex.pctRatekW)
end

"""
Sets the kW discharge rate in % of rated capacity for each element of the fleet. Applies to TIME control mode, SCHEDULE mode, or anytime discharging is triggered by time.

Name: `%RatekW`
Default: 20.0

(Setter)
"""
function pctRatekW(obj::Obj, value::Float64, flags::SetterFlagsT=SetterFlagsT(0))
    obj_set_float64(obj, _PropertyIndex.pctRatekW, value, flags)
end

"""
Sets the kW charging rate in % of rated capacity for each element of the fleet. Applies to TIME control mode and anytime charging mode is entered due to a time trigger.

Name: `%RateCharge`
Default: 20.0

(Getter)
"""
function pctRateCharge(obj::Obj)::Float64
    obj_get_float64(obj, _PropertyIndex.pctRateCharge)
end

"""
Sets the kW charging rate in % of rated capacity for each element of the fleet. Applies to TIME control mode and anytime charging mode is entered due to a time trigger.

Name: `%RateCharge`
Default: 20.0

(Setter)
"""
function pctRateCharge(obj::Obj, value::Float64, flags::SetterFlagsT=SetterFlagsT(0))
    obj_set_float64(obj, _PropertyIndex.pctRateCharge, value, flags)
end

"""
Use this property to change the % reserve for each Storage element under control of this controller. This might be used, for example, to allow deeper discharges of Storage or in case of emergency operation to use the remainder of the Storage element.

Name: `%Reserve`
Default: 25.0

(Getter)
"""
function pctReserve(obj::Obj)::Float64
    obj_get_float64(obj, _PropertyIndex.pctReserve)
end

"""
Use this property to change the % reserve for each Storage element under control of this controller. This might be used, for example, to allow deeper discharges of Storage or in case of emergency operation to use the remainder of the Storage element.

Name: `%Reserve`
Default: 25.0

(Setter)
"""
function pctReserve(obj::Obj, value::Float64, flags::SetterFlagsT=SetterFlagsT(0))
    obj_set_float64(obj, _PropertyIndex.pctReserve, value, flags)
end

"""
(Read only). Total rated kWh energy Storage capacity of Storage elements controlled by this controller.

**Read-only**

Name: `kWhTotal`

(Getter)
"""
function kWhTotal(obj::Obj)::Float64
    obj_get_float64(obj, _PropertyIndex.kWhTotal)
end

"""
(Read only). Total rated kWh energy Storage capacity of Storage elements controlled by this controller.

**Read-only**

Name: `kWhTotal`

(Setter)
"""
function kWhTotal(obj::Obj, value::Float64, flags::SetterFlagsT=SetterFlagsT(0))
    obj_set_float64(obj, _PropertyIndex.kWhTotal, value, flags)
end

"""
(Read only). Total rated kW power capacity of Storage elements controlled by this controller.

**Read-only**

Name: `kWTotal`

(Getter)
"""
function kWTotal(obj::Obj)::Float64
    obj_get_float64(obj, _PropertyIndex.kWTotal)
end

"""
(Read only). Total rated kW power capacity of Storage elements controlled by this controller.

**Read-only**

Name: `kWTotal`

(Setter)
"""
function kWTotal(obj::Obj, value::Float64, flags::SetterFlagsT=SetterFlagsT(0))
    obj_set_float64(obj, _PropertyIndex.kWTotal, value, flags)
end

"""
(Read only). Actual kWh stored of all controlled Storage elements. 

**Read-only**

Name: `kWhActual`

(Getter)
"""
function kWhActual(obj::Obj)::Float64
    obj_get_float64(obj, _PropertyIndex.kWhActual)
end

"""
(Read only). Actual kWh stored of all controlled Storage elements. 

**Read-only**

Name: `kWhActual`

(Setter)
"""
function kWhActual(obj::Obj, value::Float64, flags::SetterFlagsT=SetterFlagsT(0))
    obj_set_float64(obj, _PropertyIndex.kWhActual, value, flags)
end

"""
(Read only). Actual kW output of all controlled Storage elements. 

**Read-only**

Name: `kWActual`

(Getter)
"""
function kWActual(obj::Obj)::Float64
    obj_get_float64(obj, _PropertyIndex.kWActual)
end

"""
(Read only). Actual kW output of all controlled Storage elements. 

**Read-only**

Name: `kWActual`

(Setter)
"""
function kWActual(obj::Obj, value::Float64, flags::SetterFlagsT=SetterFlagsT(0))
    obj_set_float64(obj, _PropertyIndex.kWActual, value, flags)
end

"""
(Read only). KW needed to meet target.

**Read-only**

Name: `kWNeed`
Units: kW

(Getter)
"""
function kWNeed(obj::Obj)::Float64
    obj_get_float64(obj, _PropertyIndex.kWNeed)
end

"""
(Read only). KW needed to meet target.

**Read-only**

Name: `kWNeed`
Units: kW

(Setter)
"""
function kWNeed(obj::Obj, value::Float64, flags::SetterFlagsT=SetterFlagsT(0))
    obj_set_float64(obj, _PropertyIndex.kWNeed, value, flags)
end

"""
Dispatch loadshape object, If any, for Yearly solution Mode.

Name: `Yearly`

(Getter)
"""
function Yearly_str(obj::Obj)::String
    obj_get_str(obj, _PropertyIndex.Yearly)
end

"""
Dispatch loadshape object, If any, for Yearly solution Mode.

Name: `Yearly`

(Setter)
"""
function Yearly_str(obj::Obj, value::String, flags::SetterFlagsT=SetterFlagsT(0))
    obj_set_str(obj, _PropertyIndex.Yearly, value, flags)
end

"""
Dispatch loadshape object, If any, for Yearly solution Mode.

Name: `Yearly`

(Getter)
"""
function Yearly(obj)::Union{LoadShapeObj, Nothing}
    obj_get_obj(obj,_PropertyIndex.Yearly, LoadShapeObj)
end

"""
Dispatch loadshape object, If any, for Yearly solution Mode.

Name: `Yearly`

(Setter)
"""
function Yearly(obj::Obj, value::Union{LoadShapeObj, Nothing}, flags::SetterFlagsT=SetterFlagsT(0))
    obj_set_obj(obj, _PropertyIndex.Yearly, value, flags)
end

"""
Dispatch loadshape object, If any, for Yearly solution Mode.

Name: `Yearly`

(Setter)
"""
function Yearly(obj::Obj, value::String, flags::SetterFlagsT=SetterFlagsT(0))
    obj_set_str(obj, _PropertyIndex.Yearly, value, flags)
end

"""
Dispatch loadshape object, If any, for Daily solution mode.

Name: `Daily`

(Getter)
"""
function Daily_str(obj::Obj)::String
    obj_get_str(obj, _PropertyIndex.Daily)
end

"""
Dispatch loadshape object, If any, for Daily solution mode.

Name: `Daily`

(Setter)
"""
function Daily_str(obj::Obj, value::String, flags::SetterFlagsT=SetterFlagsT(0))
    obj_set_str(obj, _PropertyIndex.Daily, value, flags)
end

"""
Dispatch loadshape object, If any, for Daily solution mode.

Name: `Daily`

(Getter)
"""
function Daily(obj)::Union{LoadShapeObj, Nothing}
    obj_get_obj(obj,_PropertyIndex.Daily, LoadShapeObj)
end

"""
Dispatch loadshape object, If any, for Daily solution mode.

Name: `Daily`

(Setter)
"""
function Daily(obj::Obj, value::Union{LoadShapeObj, Nothing}, flags::SetterFlagsT=SetterFlagsT(0))
    obj_set_obj(obj, _PropertyIndex.Daily, value, flags)
end

"""
Dispatch loadshape object, If any, for Daily solution mode.

Name: `Daily`

(Setter)
"""
function Daily(obj::Obj, value::String, flags::SetterFlagsT=SetterFlagsT(0))
    obj_set_str(obj, _PropertyIndex.Daily, value, flags)
end

"""
Dispatch loadshape object, If any, for Dutycycle solution mode.

Name: `Duty`

(Getter)
"""
function Duty_str(obj::Obj)::String
    obj_get_str(obj, _PropertyIndex.Duty)
end

"""
Dispatch loadshape object, If any, for Dutycycle solution mode.

Name: `Duty`

(Setter)
"""
function Duty_str(obj::Obj, value::String, flags::SetterFlagsT=SetterFlagsT(0))
    obj_set_str(obj, _PropertyIndex.Duty, value, flags)
end

"""
Dispatch loadshape object, If any, for Dutycycle solution mode.

Name: `Duty`

(Getter)
"""
function Duty(obj)::Union{LoadShapeObj, Nothing}
    obj_get_obj(obj,_PropertyIndex.Duty, LoadShapeObj)
end

"""
Dispatch loadshape object, If any, for Dutycycle solution mode.

Name: `Duty`

(Setter)
"""
function Duty(obj::Obj, value::Union{LoadShapeObj, Nothing}, flags::SetterFlagsT=SetterFlagsT(0))
    obj_set_obj(obj, _PropertyIndex.Duty, value, flags)
end

"""
Dispatch loadshape object, If any, for Dutycycle solution mode.

Name: `Duty`

(Setter)
"""
function Duty(obj::Obj, value::String, flags::SetterFlagsT=SetterFlagsT(0))
    obj_set_str(obj, _PropertyIndex.Duty, value, flags)
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
Hours (integer) to inhibit Discharging after going into Charge mode.

Name: `InhibitTime`
Units: hour
Default: 5

(Getter)
"""
function InhibitTime(obj::Obj)::Int32
    obj_get_int32(obj, _PropertyIndex.InhibitTime)
end

"""
Hours (integer) to inhibit Discharging after going into Charge mode.

Name: `InhibitTime`
Units: hour
Default: 5

(Setter)
"""
function InhibitTime(obj::Obj, value::Int32, flags::SetterFlagsT=SetterFlagsT(0))
    obj_set_int32(obj, _PropertyIndex.InhibitTime, value, flags)
end

"""
Duration of upramp part for SCHEDULE mode.

Name: `TUp`
Units: hour
Default: 0.25

(Getter)
"""
function TUp(obj::Obj)::Float64
    obj_get_float64(obj, _PropertyIndex.TUp)
end

"""
Duration of upramp part for SCHEDULE mode.

Name: `TUp`
Units: hour
Default: 0.25

(Setter)
"""
function TUp(obj::Obj, value::Float64, flags::SetterFlagsT=SetterFlagsT(0))
    obj_set_float64(obj, _PropertyIndex.TUp, value, flags)
end

"""
Duration of flat part for SCHEDULE mode.

Name: `TFlat`
Units: hour
Default: 2.0

(Getter)
"""
function TFlat(obj::Obj)::Float64
    obj_get_float64(obj, _PropertyIndex.TFlat)
end

"""
Duration of flat part for SCHEDULE mode.

Name: `TFlat`
Units: hour
Default: 2.0

(Setter)
"""
function TFlat(obj::Obj, value::Float64, flags::SetterFlagsT=SetterFlagsT(0))
    obj_set_float64(obj, _PropertyIndex.TFlat, value, flags)
end

"""
Duration of downramp part for SCHEDULE mode.

Name: `TDn`
Units: hour
Default: 0.25

(Getter)
"""
function TDn(obj::Obj)::Float64
    obj_get_float64(obj, _PropertyIndex.TDn)
end

"""
Duration of downramp part for SCHEDULE mode.

Name: `TDn`
Units: hour
Default: 0.25

(Setter)
"""
function TDn(obj::Obj, value::Float64, flags::SetterFlagsT=SetterFlagsT(0))
    obj_set_float64(obj, _PropertyIndex.TDn, value, flags)
end

"""
Threshold, kW, for Follow mode. kW has to be above this value for the Storage element to be dispatched on. Defaults to 75% of the kWTarget value. Must reset this property after setting kWTarget if you want a different value.

Name: `kWThreshold`
Units: kW

(Getter)
"""
function kWThreshold(obj::Obj)::Float64
    obj_get_float64(obj, _PropertyIndex.kWThreshold)
end

"""
Threshold, kW, for Follow mode. kW has to be above this value for the Storage element to be dispatched on. Defaults to 75% of the kWTarget value. Must reset this property after setting kWTarget if you want a different value.

Name: `kWThreshold`
Units: kW

(Setter)
"""
function kWThreshold(obj::Obj, value::Float64, flags::SetterFlagsT=SetterFlagsT(0))
    obj_set_float64(obj, _PropertyIndex.kWThreshold, value, flags)
end

"""
Defaults to 1 (disabled). Set to any value between 0 and 1 to enable this parameter.

Use this parameter to reduce the amount of power requested by the controller in each control iteration. It can be useful when maximum control iterations are exceeded due to numerical instability such as fleet being set to charging and idling in subsequent control iterations (check the Eventlog). 

Name: `DispFactor`
Default: 1.0

(Getter)
"""
function DispFactor(obj::Obj)::Float64
    obj_get_float64(obj, _PropertyIndex.DispFactor)
end

"""
Defaults to 1 (disabled). Set to any value between 0 and 1 to enable this parameter.

Use this parameter to reduce the amount of power requested by the controller in each control iteration. It can be useful when maximum control iterations are exceeded due to numerical instability such as fleet being set to charging and idling in subsequent control iterations (check the Eventlog). 

Name: `DispFactor`
Default: 1.0

(Setter)
"""
function DispFactor(obj::Obj, value::Float64, flags::SetterFlagsT=SetterFlagsT(0))
    obj_set_float64(obj, _PropertyIndex.DispFactor, value, flags)
end

"""
The level of charge required for allowing the storage to discharge again after reaching the reserve storage level. After reaching this level, the storage control  will not allow the storage device to discharge, forcing the storage to charge. Once the storage reaches this level, the storage will be able to discharge again. This value is a number between 0.2 and 1

Name: `ResetLevel`
Default: 0.8

(Getter)
"""
function ResetLevel(obj::Obj)::Float64
    obj_get_float64(obj, _PropertyIndex.ResetLevel)
end

"""
The level of charge required for allowing the storage to discharge again after reaching the reserve storage level. After reaching this level, the storage control  will not allow the storage device to discharge, forcing the storage to charge. Once the storage reaches this level, the storage will be able to discharge again. This value is a number between 0.2 and 1

Name: `ResetLevel`
Default: 0.8

(Setter)
"""
function ResetLevel(obj::Obj, value::Float64, flags::SetterFlagsT=SetterFlagsT(0))
    obj_set_float64(obj, _PropertyIndex.ResetLevel, value, flags)
end

"""
With this property the user can specify the number of targets to be used by the controller using the list given at "SeasonTargets"/"SeasonTargetsLow", which can be used to dynamically adjust the storage controller during a QSTS simulation. The default value is 1. This property needs to be defined before defining SeasonTargets/SeasonTargetsLow.

Name: `Seasons`

(Getter)
"""
function Seasons(obj::Obj)::Int32
    obj_get_int32(obj, _PropertyIndex.Seasons)
end

"""
With this property the user can specify the number of targets to be used by the controller using the list given at "SeasonTargets"/"SeasonTargetsLow", which can be used to dynamically adjust the storage controller during a QSTS simulation. The default value is 1. This property needs to be defined before defining SeasonTargets/SeasonTargetsLow.

Name: `Seasons`

(Setter)
"""
function Seasons(obj::Obj, value::Int32, flags::SetterFlagsT=SetterFlagsT(0))
    obj_set_int32(obj, _PropertyIndex.Seasons, value, flags)
end

"""
An array of doubles specifying the targets to be used during a QSTS simulation. These targets will take effect only if SeasonRating=true. The number of targets cannot exceed the number of seasons defined at the SeasonSignal.The difference between the targets defined at SeasonTargets and SeasonTargetsLow is that SeasonTargets applies to discharging modes, while SeasonTargetsLow applies to charging modes.

Name: `SeasonTargets`
Default: [8000.0]

(Getter)
"""
function SeasonTargets(obj::Obj)::Vector{Float64}
    obj_get_float64s(obj, _PropertyIndex.SeasonTargets)
end

"""
An array of doubles specifying the targets to be used during a QSTS simulation. These targets will take effect only if SeasonRating=true. The number of targets cannot exceed the number of seasons defined at the SeasonSignal.The difference between the targets defined at SeasonTargets and SeasonTargetsLow is that SeasonTargets applies to discharging modes, while SeasonTargetsLow applies to charging modes.

Name: `SeasonTargets`
Default: [8000.0]

(Setter)
"""
function SeasonTargets(obj::Obj, value::Vector{Float64}, flags::SetterFlagsT=SetterFlagsT(0))
    obj_get_float64s(obj, _PropertyIndex.SeasonTargets, value, flags)
end

"""
An array of doubles specifying the targets to be used during a QSTS simulation. These targets will take effect only if SeasonRating=true. The number of targets cannot exceed the number of seasons defined at the SeasonSignal.The difference between the targets defined at SeasonTargets and SeasonTargetsLow is that SeasonTargets applies to discharging modes, while SeasonTargetsLow applies to charging modes.

Name: `SeasonTargetsLow`
Default: [4000.0]

(Getter)
"""
function SeasonTargetsLow(obj::Obj)::Vector{Float64}
    obj_get_float64s(obj, _PropertyIndex.SeasonTargetsLow)
end

"""
An array of doubles specifying the targets to be used during a QSTS simulation. These targets will take effect only if SeasonRating=true. The number of targets cannot exceed the number of seasons defined at the SeasonSignal.The difference between the targets defined at SeasonTargets and SeasonTargetsLow is that SeasonTargets applies to discharging modes, while SeasonTargetsLow applies to charging modes.

Name: `SeasonTargetsLow`
Default: [4000.0]

(Setter)
"""
function SeasonTargetsLow(obj::Obj, value::Vector{Float64}, flags::SetterFlagsT=SetterFlagsT(0))
    obj_get_float64s(obj, _PropertyIndex.SeasonTargetsLow, value, flags)
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

end # module StorageController
export StorageController
