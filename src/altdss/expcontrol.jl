module ExpControl
using ..Enums.SetterFlags: SetterFlagsT
import Base: convert
using ..Common
using ..CircuitElement
using DocStringExtensions
@template (FUNCTIONS, METHODS) = """
                                 $(TYPEDSIGNATURES)
                                 $(DOCSTRING)
                                 """


const _cls_name = "ExpControl"
const _cls_idx = 44

module _PropertyIndex
const PVSystemList = Int32(1)
const VReg = Int32(2)
const Slope = Int32(3)
const VRegTau = Int32(4)
const QBias = Int32(5)
const VRegMin = Int32(6)
const VRegMax = Int32(7)
const QMaxLead = Int32(8)
const QMaxLag = Int32(9)
const EventLog = Int32(10)
const DeltaQ_Factor = Int32(11)
const PreferQ = Int32(12)
const TResponse = Int32(13)
const DERList = Int32(14)
const BaseFreq = Int32(15)
const Enabled = Int32(16)
const Like = Int32(17)
end

struct ExpControlObj <: AbstractControlElement
    ptr::Ptr{Cvoid}
    dss::DSSContext
end
export ExpControlObj
Common._wrap_dss_obj(::Val{_cls_idx}, ptr::Ptr{Cvoid}, dss::DSSContext) = ExpControlObj(ptr, dss)
const Obj = ExpControlObj

function Base.show(io::IO, obj::ExpControlObj) 
    name = obj_get_str(obj, obj.dss.capi.Obj_GetFullName)
    print(name)
end


include("dss_object.jl")


"""
Array list of PVSystems to be controlled.

If not specified, all PVSystems in the circuit are assumed to be controlled by this ExpControl.

Name: `PVSystemList`

(Getter)
"""
function PVSystemList(obj::Obj)::Vector{String}
    obj_get_strs(obj, _PropertyIndex.PVSystemList)
end

"""
Array list of PVSystems to be controlled.

If not specified, all PVSystems in the circuit are assumed to be controlled by this ExpControl.

Name: `PVSystemList`

(Setter)
"""
function PVSystemList(obj::Obj, value::Vector{String}, flags::SetterFlagsT=SetterFlagsT(0))
    obj_set_strs(obj, _PropertyIndex.PVSystemList, value, flags)
end

"""
Per-unit voltage at which reactive power is zero.

This may dynamically self-adjust when VregTau > 0, limited by VregMin and VregMax.If input as 0, Vreg will be initialized from a snapshot solution with no inverter Q.The equilibrium point of reactive power is also affected by Qbias

Name: `VReg`
Default: 1.0

(Getter)
"""
function VReg(obj::Obj)::Float64
    obj_get_float64(obj, _PropertyIndex.VReg)
end

"""
Per-unit voltage at which reactive power is zero.

This may dynamically self-adjust when VregTau > 0, limited by VregMin and VregMax.If input as 0, Vreg will be initialized from a snapshot solution with no inverter Q.The equilibrium point of reactive power is also affected by Qbias

Name: `VReg`
Default: 1.0

(Setter)
"""
function VReg(obj::Obj, value::Float64, flags::SetterFlagsT=SetterFlagsT(0))
    obj_set_float64(obj, _PropertyIndex.VReg, value, flags)
end

"""
Per-unit reactive power injection / per-unit voltage deviation from Vreg.

Unlike InvControl, base reactive power is constant at the inverter kva rating.

Name: `Slope`
Default: 50.0

(Getter)
"""
function Slope(obj::Obj)::Float64
    obj_get_float64(obj, _PropertyIndex.Slope)
end

"""
Per-unit reactive power injection / per-unit voltage deviation from Vreg.

Unlike InvControl, base reactive power is constant at the inverter kva rating.

Name: `Slope`
Default: 50.0

(Setter)
"""
function Slope(obj::Obj, value::Float64, flags::SetterFlagsT=SetterFlagsT(0))
    obj_set_float64(obj, _PropertyIndex.Slope, value, flags)
end

"""
Time constant for adaptive Vreg.

When the control injects or absorbs reactive power due to a voltage deviation from the Q=0 crossing of the volt-var curve, the Q=0 crossing will move toward the actual terminal voltage with this time constant. Over time, the effect is to gradually bring inverter reactive power to zero as the grid voltage changes due to non-solar effects. If zero, then Vreg stays fixed. IEEE1547-2018 requires adjustability from 300s to 5000s

Name: `VRegTau`
Units: s
Default: 1200.0

(Getter)
"""
function VRegTau(obj::Obj)::Float64
    obj_get_float64(obj, _PropertyIndex.VRegTau)
end

"""
Time constant for adaptive Vreg.

When the control injects or absorbs reactive power due to a voltage deviation from the Q=0 crossing of the volt-var curve, the Q=0 crossing will move toward the actual terminal voltage with this time constant. Over time, the effect is to gradually bring inverter reactive power to zero as the grid voltage changes due to non-solar effects. If zero, then Vreg stays fixed. IEEE1547-2018 requires adjustability from 300s to 5000s

Name: `VRegTau`
Units: s
Default: 1200.0

(Setter)
"""
function VRegTau(obj::Obj, value::Float64, flags::SetterFlagsT=SetterFlagsT(0))
    obj_set_float64(obj, _PropertyIndex.VRegTau, value, flags)
end

"""
Equilibrium per-unit reactive power when V=Vreg; defaults to 0.

Enter > 0 for lagging (capacitive) bias, < 0 for leading (inductive) bias.

Name: `QBias`
Default: 0.0

(Getter)
"""
function QBias(obj::Obj)::Float64
    obj_get_float64(obj, _PropertyIndex.QBias)
end

"""
Equilibrium per-unit reactive power when V=Vreg; defaults to 0.

Enter > 0 for lagging (capacitive) bias, < 0 for leading (inductive) bias.

Name: `QBias`
Default: 0.0

(Setter)
"""
function QBias(obj::Obj, value::Float64, flags::SetterFlagsT=SetterFlagsT(0))
    obj_set_float64(obj, _PropertyIndex.QBias, value, flags)
end

"""
Lower limit on adaptive Vreg; defaults to 0.95 per-unit

Name: `VRegMin`
Default: 0.95

(Getter)
"""
function VRegMin(obj::Obj)::Float64
    obj_get_float64(obj, _PropertyIndex.VRegMin)
end

"""
Lower limit on adaptive Vreg; defaults to 0.95 per-unit

Name: `VRegMin`
Default: 0.95

(Setter)
"""
function VRegMin(obj::Obj, value::Float64, flags::SetterFlagsT=SetterFlagsT(0))
    obj_set_float64(obj, _PropertyIndex.VRegMin, value, flags)
end

"""
Upper limit on adaptive Vreg; defaults to 1.05 per-unit

Name: `VRegMax`
Default: 1.05

(Getter)
"""
function VRegMax(obj::Obj)::Float64
    obj_get_float64(obj, _PropertyIndex.VRegMax)
end

"""
Upper limit on adaptive Vreg; defaults to 1.05 per-unit

Name: `VRegMax`
Default: 1.05

(Setter)
"""
function VRegMax(obj::Obj, value::Float64, flags::SetterFlagsT=SetterFlagsT(0))
    obj_set_float64(obj, _PropertyIndex.VRegMax, value, flags)
end

"""
Limit on leading (inductive) reactive power injection, in per-unit of base kva; defaults to 0.44.For Category A inverters per P1547/D7, set this value to 0.25.

Regardless of QmaxLead, the reactive power injection is still limited by dynamic headroom when actual real power output exceeds 0%

Name: `QMaxLead`
Default: 0.44

(Getter)
"""
function QMaxLead(obj::Obj)::Float64
    obj_get_float64(obj, _PropertyIndex.QMaxLead)
end

"""
Limit on leading (inductive) reactive power injection, in per-unit of base kva; defaults to 0.44.For Category A inverters per P1547/D7, set this value to 0.25.

Regardless of QmaxLead, the reactive power injection is still limited by dynamic headroom when actual real power output exceeds 0%

Name: `QMaxLead`
Default: 0.44

(Setter)
"""
function QMaxLead(obj::Obj, value::Float64, flags::SetterFlagsT=SetterFlagsT(0))
    obj_set_float64(obj, _PropertyIndex.QMaxLead, value, flags)
end

"""
Limit on lagging (capacitive) reactive power injection, in per-unit of base kva; defaults to 0.44.

For Category A inverters per P1547/D7, set this value to 0.25.Regardless of QmaxLag, the reactive power injection is still limited by dynamic headroom when actual real power output exceeds 0%

Name: `QMaxLag`
Default: 0.44

(Getter)
"""
function QMaxLag(obj::Obj)::Float64
    obj_get_float64(obj, _PropertyIndex.QMaxLag)
end

"""
Limit on lagging (capacitive) reactive power injection, in per-unit of base kva; defaults to 0.44.

For Category A inverters per P1547/D7, set this value to 0.25.Regardless of QmaxLag, the reactive power injection is still limited by dynamic headroom when actual real power output exceeds 0%

Name: `QMaxLag`
Default: 0.44

(Setter)
"""
function QMaxLag(obj::Obj, value::Float64, flags::SetterFlagsT=SetterFlagsT(0))
    obj_set_float64(obj, _PropertyIndex.QMaxLag, value, flags)
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
Convergence parameter; Defaults to 0.7. 

Sets the maximum change (in per unit) from the prior var output level to the desired var output level during each control iteration. If numerical instability is noticed in solutions such as var sign changing from one control iteration to the next and voltages oscillating between two values with some separation, this is an indication of numerical instability (use the EventLog to diagnose). If the maximum control iterations are exceeded, and no numerical instability is seen in the EventLog of via monitors, then try increasing the value of this parameter to reduce the number of control iterations needed to achieve the control criteria, and move to the power flow solution.

Name: `DeltaQ_Factor`
Default: 0.7

(Getter)
"""
function DeltaQ_Factor(obj::Obj)::Float64
    obj_get_float64(obj, _PropertyIndex.DeltaQ_Factor)
end

"""
Convergence parameter; Defaults to 0.7. 

Sets the maximum change (in per unit) from the prior var output level to the desired var output level during each control iteration. If numerical instability is noticed in solutions such as var sign changing from one control iteration to the next and voltages oscillating between two values with some separation, this is an indication of numerical instability (use the EventLog to diagnose). If the maximum control iterations are exceeded, and no numerical instability is seen in the EventLog of via monitors, then try increasing the value of this parameter to reduce the number of control iterations needed to achieve the control criteria, and move to the power flow solution.

Name: `DeltaQ_Factor`
Default: 0.7

(Setter)
"""
function DeltaQ_Factor(obj::Obj, value::Float64, flags::SetterFlagsT=SetterFlagsT(0))
    obj_set_float64(obj, _PropertyIndex.DeltaQ_Factor, value, flags)
end

"""
Curtails real power output as needed to meet the reactive power requirement. IEEE1547-2018 requires Yes, but the default is No for backward compatibility of OpenDSS models.

Name: `PreferQ`
Default: False

(Getter)
"""
function PreferQ(obj::Obj)::Bool
    return obj_get_bool(obj, _PropertyIndex.PreferQ)
end

"""
Curtails real power output as needed to meet the reactive power requirement. IEEE1547-2018 requires Yes, but the default is No for backward compatibility of OpenDSS models.

Name: `PreferQ`
Default: False

(Setter)
"""
function PreferQ(obj::Obj, value::Bool, flags::SetterFlagsT=SetterFlagsT(0))
    obj_set_bool(obj, _PropertyIndex.PreferQ, value, flags)
end

"""
Open-loop response time for changes in Q.

The value of Q reaches 90% of the target change within Tresponse, which corresponds to a low-pass filter having tau = Tresponse / 2.3026. The behavior is similar to LPFTAU in InvControl, but here the response time is input instead of the time constant. IEEE1547-2018 default is 10s for Category A and 5s for Category B, adjustable from 1s to 90s for both categories. However, the default is 0 for backward compatibility of OpenDSS models.

Name: `TResponse`
Default: 0.0

(Getter)
"""
function TResponse(obj::Obj)::Float64
    obj_get_float64(obj, _PropertyIndex.TResponse)
end

"""
Open-loop response time for changes in Q.

The value of Q reaches 90% of the target change within Tresponse, which corresponds to a low-pass filter having tau = Tresponse / 2.3026. The behavior is similar to LPFTAU in InvControl, but here the response time is input instead of the time constant. IEEE1547-2018 default is 10s for Category A and 5s for Category B, adjustable from 1s to 90s for both categories. However, the default is 0 for backward compatibility of OpenDSS models.

Name: `TResponse`
Default: 0.0

(Setter)
"""
function TResponse(obj::Obj, value::Float64, flags::SetterFlagsT=SetterFlagsT(0))
    obj_set_float64(obj, _PropertyIndex.TResponse, value, flags)
end

"""
Alternative to PVSystemList for CIM export and import.

However, storage is not actually implemented yet. Use fully qualified PVSystem names.

Name: `DERList`

(Getter)
"""
function DERList(obj::Obj)::Vector{String}
    obj_get_strs(obj, _PropertyIndex.DERList)
end

"""
Alternative to PVSystemList for CIM export and import.

However, storage is not actually implemented yet. Use fully qualified PVSystem names.

Name: `DERList`

(Setter)
"""
function DERList(obj::Obj, value::Vector{String}, flags::SetterFlagsT=SetterFlagsT(0))
    obj_set_strs(obj, _PropertyIndex.DERList, value, flags)
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

end # module ExpControl
export ExpControl
