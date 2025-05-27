module CapControl
using ..Enums.SetterFlags: SetterFlagsT
using ..Enums: CapControlType, MonitoredPhase
using ..Capacitor: CapacitorObj
using ..LoadShape: LoadShapeObj
import Base: convert
using ..Common
using ..CircuitElement
using DocStringExtensions
@template (FUNCTIONS, METHODS) = """
                                 $(TYPEDSIGNATURES)
                                 $(DOCSTRING)
                                 """


const _cls_name = "CapControl"
const _cls_idx = 24

module _PropertyIndex
const Element = Int32(1)
const Terminal = Int32(2)
const Capacitor = Int32(3)
const Type = Int32(4)
const PTRatio = Int32(5)
const CTRatio = Int32(6)
const OnSetting = Int32(7)
const OffSetting = Int32(8)
const Delay = Int32(9)
const VoltOverride = Int32(10)
const VMax = Int32(11)
const VMin = Int32(12)
const DelayOff = Int32(13)
const DeadTime = Int32(14)
const CTPhase = Int32(15)
const PTPhase = Int32(16)
const VBus = Int32(17)
const EventLog = Int32(18)
const UserModel = Int32(19)
const UserData = Int32(20)
const pctMinkvar = Int32(21)
const Reset = Int32(22)
const ControlSignal = Int32(23)
const BaseFreq = Int32(24)
const Enabled = Int32(25)
const Like = Int32(26)
end

struct CapControlObj <: AbstractControlElement
    ptr::Ptr{Cvoid}
    dss::DSSContext
end
export CapControlObj
Common._wrap_dss_obj(::Val{_cls_idx}, ptr::Ptr{Cvoid}, dss::DSSContext) = CapControlObj(ptr, dss)
const Obj = CapControlObj

function Base.show(io::IO, obj::CapControlObj) 
    name = obj_get_str(obj, obj.dss.capi.Obj_GetFullName)
    print(name)
end


include("dss_object.jl")


"""
Full object name of the circuit element, typically a line or transformer, to which the capacitor control's PT and/or CT are connected.There is no default; must be specified.

Name: `Element`

(Getter)
"""
function Element_str(obj::Obj)::String
    obj_get_str(obj, _PropertyIndex.Element)
end

"""
Full object name of the circuit element, typically a line or transformer, to which the capacitor control's PT and/or CT are connected.There is no default; must be specified.

Name: `Element`

(Setter)
"""
function Element_str(obj::Obj, value::String, flags::SetterFlagsT=SetterFlagsT(0))
    obj_set_str(obj, _PropertyIndex.Element, value, flags)
end

"""
Full object name of the circuit element, typically a line or transformer, to which the capacitor control's PT and/or CT are connected.There is no default; must be specified.

Name: `Element`

(Getter)
"""
function Element(obj)::DSSObj
    obj_get_obj(obj,_PropertyIndex.Element)
end

"""
Full object name of the circuit element, typically a line or transformer, to which the capacitor control's PT and/or CT are connected.There is no default; must be specified.

Name: `Element`

(Setter)
"""
function Element(obj::Obj, value::DSSObj, flags::SetterFlagsT=SetterFlagsT(0))
    obj_set_obj(obj, _PropertyIndex.Element, value, flags)
end

"""
Full object name of the circuit element, typically a line or transformer, to which the capacitor control's PT and/or CT are connected.There is no default; must be specified.

Name: `Element`

(Setter)
"""
function Element(obj::Obj, value::String, flags::SetterFlagsT=SetterFlagsT(0))
    obj_set_str(obj, _PropertyIndex.Element, value, flags)
end

"""
Number of the terminal of the circuit element to which the CapControl is connected. 1 or 2, typically.

Name: `Terminal`
Default: 1

(Getter)
"""
function Terminal(obj::Obj)::Int32
    obj_get_int32(obj, _PropertyIndex.Terminal)
end

"""
Number of the terminal of the circuit element to which the CapControl is connected. 1 or 2, typically.

Name: `Terminal`
Default: 1

(Setter)
"""
function Terminal(obj::Obj, value::Int32, flags::SetterFlagsT=SetterFlagsT(0))
    obj_set_int32(obj, _PropertyIndex.Terminal, value, flags)
end

"""
Name of Capacitor element which the CapControl controls. No Default; Must be specified.Do not specify the full object name; "Capacitor" is assumed for the object class.  Example:

Capacitor=cap1

Name: `Capacitor`

(Getter)
"""
function Capacitor_str(obj::Obj)::String
    obj_get_str(obj, _PropertyIndex.Capacitor)
end

"""
Name of Capacitor element which the CapControl controls. No Default; Must be specified.Do not specify the full object name; "Capacitor" is assumed for the object class.  Example:

Capacitor=cap1

Name: `Capacitor`

(Setter)
"""
function Capacitor_str(obj::Obj, value::String, flags::SetterFlagsT=SetterFlagsT(0))
    obj_set_str(obj, _PropertyIndex.Capacitor, value, flags)
end

"""
Name of Capacitor element which the CapControl controls. No Default; Must be specified.Do not specify the full object name; "Capacitor" is assumed for the object class.  Example:

Capacitor=cap1

Name: `Capacitor`

(Getter)
"""
function Capacitor(obj)::Union{CapacitorObj, Nothing}
    obj_get_obj(obj,_PropertyIndex.Capacitor, CapacitorObj)
end

"""
Name of Capacitor element which the CapControl controls. No Default; Must be specified.Do not specify the full object name; "Capacitor" is assumed for the object class.  Example:

Capacitor=cap1

Name: `Capacitor`

(Setter)
"""
function Capacitor(obj::Obj, value::Union{CapacitorObj, Nothing}, flags::SetterFlagsT=SetterFlagsT(0))
    obj_set_obj(obj, _PropertyIndex.Capacitor, value, flags)
end

"""
Name of Capacitor element which the CapControl controls. No Default; Must be specified.Do not specify the full object name; "Capacitor" is assumed for the object class.  Example:

Capacitor=cap1

Name: `Capacitor`

(Setter)
"""
function Capacitor(obj::Obj, value::String, flags::SetterFlagsT=SetterFlagsT(0))
    obj_set_str(obj, _PropertyIndex.Capacitor, value, flags)
end

"""
Control type.  Specify the ONsetting and OFFsetting appropriately with the type of control. (See help for ONsetting)

Name: `Type`
Default: Current

(Getter)
"""
function Type(obj::Obj)::CapControlType.T
    CapControlType.T(obj_get_int32(obj, _PropertyIndex.Type))
end

"""
Control type.  Specify the ONsetting and OFFsetting appropriately with the type of control. (See help for ONsetting)

Name: `Type`
Default: Current

(Setter)
"""
function Type(obj::Obj, value::String, flags::SetterFlagsT=SetterFlagsT(0))
    obj_set_str(obj, _PropertyIndex.Type, value, flags)
end

"""
Control type.  Specify the ONsetting and OFFsetting appropriately with the type of control. (See help for ONsetting)

Name: `Type`
Default: Current

(Setter)
"""
function Type(obj::Obj, value::Union{Int,CapControlType.T}, flags::SetterFlagsT=SetterFlagsT(0))
    obj_set_int32(obj, _PropertyIndex.Type, Int32(value), flags)
end

"""
Control type.  Specify the ONsetting and OFFsetting appropriately with the type of control. (See help for ONsetting)

Name: `Type`
Default: Current

(Getter)
"""
function Type_str(obj::Obj)::String
    obj_get_str(obj, _PropertyIndex.Type)
end

"""
Control type.  Specify the ONsetting and OFFsetting appropriately with the type of control. (See help for ONsetting)

Name: `Type`
Default: Current

(Setter)
"""
function Type_str(obj::Obj, value::String, flags::SetterFlagsT=SetterFlagsT(0))
    Type(obj, value, flags)
end

"""
Ratio of the PT that converts the monitored voltage to the control voltage. If the capacitor is Wye, the 1st phase line-to-neutral voltage is monitored.  Else, the line-to-line voltage (1st - 2nd phase) is monitored.

Name: `PTRatio`
Default: 60.0

(Getter)
"""
function PTRatio(obj::Obj)::Float64
    obj_get_float64(obj, _PropertyIndex.PTRatio)
end

"""
Ratio of the PT that converts the monitored voltage to the control voltage. If the capacitor is Wye, the 1st phase line-to-neutral voltage is monitored.  Else, the line-to-line voltage (1st - 2nd phase) is monitored.

Name: `PTRatio`
Default: 60.0

(Setter)
"""
function PTRatio(obj::Obj, value::Float64, flags::SetterFlagsT=SetterFlagsT(0))
    obj_set_float64(obj, _PropertyIndex.PTRatio, value, flags)
end

"""
Ratio of the CT from line amps to control ampere setting for current and kvar control types. 

Name: `CTRatio`
Default: 60.0

(Getter)
"""
function CTRatio(obj::Obj)::Float64
    obj_get_float64(obj, _PropertyIndex.CTRatio)
end

"""
Ratio of the CT from line amps to control ampere setting for current and kvar control types. 

Name: `CTRatio`
Default: 60.0

(Setter)
"""
function CTRatio(obj::Obj, value::Float64, flags::SetterFlagsT=SetterFlagsT(0))
    obj_set_float64(obj, _PropertyIndex.CTRatio, value, flags)
end

"""
Value at which the control arms to switch the capacitor ON (or ratchet up a step).  

Type of Control:

Current: Line Amps / CTratio
Voltage: Line-Neutral (or Line-Line for delta) Volts / PTratio
kvar:    Total kvar, all phases (3-phase for pos seq model). This is directional. 
PF:      Power Factor, Total power in monitored terminal. Negative for Leading. 
Time:    Hrs from Midnight as a floating point number (decimal). 7:30am would be entered as 7.5.
Follow:  Follows a loadshape (ControlSignal) to determine when to turn ON/OFF the capacitor. If the value is different than 0 the capacitor will connect to the grid, otherwise, it will be disconnected.

Name: `OnSetting`
Default: 300.0

(Getter)
"""
function OnSetting(obj::Obj)::Float64
    obj_get_float64(obj, _PropertyIndex.OnSetting)
end

"""
Value at which the control arms to switch the capacitor ON (or ratchet up a step).  

Type of Control:

Current: Line Amps / CTratio
Voltage: Line-Neutral (or Line-Line for delta) Volts / PTratio
kvar:    Total kvar, all phases (3-phase for pos seq model). This is directional. 
PF:      Power Factor, Total power in monitored terminal. Negative for Leading. 
Time:    Hrs from Midnight as a floating point number (decimal). 7:30am would be entered as 7.5.
Follow:  Follows a loadshape (ControlSignal) to determine when to turn ON/OFF the capacitor. If the value is different than 0 the capacitor will connect to the grid, otherwise, it will be disconnected.

Name: `OnSetting`
Default: 300.0

(Setter)
"""
function OnSetting(obj::Obj, value::Float64, flags::SetterFlagsT=SetterFlagsT(0))
    obj_set_float64(obj, _PropertyIndex.OnSetting, value, flags)
end

"""
Value at which the control arms to switch the capacitor OFF. (See help for ONsetting)For Time control, is OK to have Off time the next day ( < On time)

Name: `OffSetting`
Default: 200.0

(Getter)
"""
function OffSetting(obj::Obj)::Float64
    obj_get_float64(obj, _PropertyIndex.OffSetting)
end

"""
Value at which the control arms to switch the capacitor OFF. (See help for ONsetting)For Time control, is OK to have Off time the next day ( < On time)

Name: `OffSetting`
Default: 200.0

(Setter)
"""
function OffSetting(obj::Obj, value::Float64, flags::SetterFlagsT=SetterFlagsT(0))
    obj_set_float64(obj, _PropertyIndex.OffSetting, value, flags)
end

"""
Time delay, in seconds, from when the control is armed before it sends out the switching command to turn ON.  The control may reset before the action actually occurs. This is used to determine which capacity control will act first. Default is 15.  You may specify any floating point number to achieve a model of whatever condition is necessary.

Name: `Delay`
Units: s
Default: 15.0

(Getter)
"""
function Delay(obj::Obj)::Float64
    obj_get_float64(obj, _PropertyIndex.Delay)
end

"""
Time delay, in seconds, from when the control is armed before it sends out the switching command to turn ON.  The control may reset before the action actually occurs. This is used to determine which capacity control will act first. Default is 15.  You may specify any floating point number to achieve a model of whatever condition is necessary.

Name: `Delay`
Units: s
Default: 15.0

(Setter)
"""
function Delay(obj::Obj, value::Float64, flags::SetterFlagsT=SetterFlagsT(0))
    obj_set_float64(obj, _PropertyIndex.Delay, value, flags)
end

"""
Switch to indicate whether VOLTAGE OVERRIDE is to be considered. Vmax and Vmin must be set to reasonable values if this property is Yes.

Name: `VoltOverride`
Default: False

(Getter)
"""
function VoltOverride(obj::Obj)::Bool
    return obj_get_bool(obj, _PropertyIndex.VoltOverride)
end

"""
Switch to indicate whether VOLTAGE OVERRIDE is to be considered. Vmax and Vmin must be set to reasonable values if this property is Yes.

Name: `VoltOverride`
Default: False

(Setter)
"""
function VoltOverride(obj::Obj, value::Bool, flags::SetterFlagsT=SetterFlagsT(0))
    obj_set_bool(obj, _PropertyIndex.VoltOverride, value, flags)
end

"""
Maximum voltage. If the voltage across the capacitor divided by the PTRATIO is greater than this voltage, the capacitor will switch OFF regardless of other control settings. Default is 126 (goes with a PT ratio of 60 for 12.47 kV system).

Name: `VMax`
Units: V
Default: 126.0

(Getter)
"""
function VMax(obj::Obj)::Float64
    obj_get_float64(obj, _PropertyIndex.VMax)
end

"""
Maximum voltage. If the voltage across the capacitor divided by the PTRATIO is greater than this voltage, the capacitor will switch OFF regardless of other control settings. Default is 126 (goes with a PT ratio of 60 for 12.47 kV system).

Name: `VMax`
Units: V
Default: 126.0

(Setter)
"""
function VMax(obj::Obj, value::Float64, flags::SetterFlagsT=SetterFlagsT(0))
    obj_set_float64(obj, _PropertyIndex.VMax, value, flags)
end

"""
Minimum voltage. If the voltage across the capacitor divided by the PTRATIO is less than this voltage, the capacitor will switch ON regardless of other control settings. Default is 115 (goes with a PT ratio of 60 for 12.47 kV system).

Name: `VMin`
Units: V
Default: 115.0

(Getter)
"""
function VMin(obj::Obj)::Float64
    obj_get_float64(obj, _PropertyIndex.VMin)
end

"""
Minimum voltage. If the voltage across the capacitor divided by the PTRATIO is less than this voltage, the capacitor will switch ON regardless of other control settings. Default is 115 (goes with a PT ratio of 60 for 12.47 kV system).

Name: `VMin`
Units: V
Default: 115.0

(Setter)
"""
function VMin(obj::Obj, value::Float64, flags::SetterFlagsT=SetterFlagsT(0))
    obj_set_float64(obj, _PropertyIndex.VMin, value, flags)
end

"""
Time delay for control to turn OFF when present state is ON.

Name: `DelayOff`
Units: s
Default: 15.0

(Getter)
"""
function DelayOff(obj::Obj)::Float64
    obj_get_float64(obj, _PropertyIndex.DelayOff)
end

"""
Time delay for control to turn OFF when present state is ON.

Name: `DelayOff`
Units: s
Default: 15.0

(Setter)
"""
function DelayOff(obj::Obj, value::Float64, flags::SetterFlagsT=SetterFlagsT(0))
    obj_set_float64(obj, _PropertyIndex.DelayOff, value, flags)
end

"""
Dead time after capacitor is turned OFF before it can be turned back ON.

Name: `DeadTime`
Units: s
Default: 300.0

(Getter)
"""
function DeadTime(obj::Obj)::Float64
    obj_get_float64(obj, _PropertyIndex.DeadTime)
end

"""
Dead time after capacitor is turned OFF before it can be turned back ON.

Name: `DeadTime`
Units: s
Default: 300.0

(Setter)
"""
function DeadTime(obj::Obj, value::Float64, flags::SetterFlagsT=SetterFlagsT(0))
    obj_set_float64(obj, _PropertyIndex.DeadTime, value, flags)
end

"""
Number of the phase being monitored for CURRENT control or one of {AVG | MAX | MIN} for all phases. If delta or L-L connection, enter the first or the two phases being monitored [1-2, 2-3, 3-1]. Must be less than the number of phases. Does not apply to kvar control which uses all phases by default.

Name: `CTPhase`
Default: 1

(Getter)
"""                
function CTPhase(obj::Obj)::Union{MonitoredPhase.T,Int}
    value = obj_get_int32(obj, _PropertyIndex.CTPhase)
    if value > 0
        return value
    end
    return MonitoredPhase.T(value)
end

"""
Number of the phase being monitored for CURRENT control or one of {AVG | MAX | MIN} for all phases. If delta or L-L connection, enter the first or the two phases being monitored [1-2, 2-3, 3-1]. Must be less than the number of phases. Does not apply to kvar control which uses all phases by default.

Name: `CTPhase`
Default: 1

(Setter)
"""
function CTPhase(obj::Obj, value::String, flags::SetterFlagsT=SetterFlagsT(0))
    obj_set_str(obj, _PropertyIndex.CTPhase, value, flags)
end

"""
Number of the phase being monitored for CURRENT control or one of {AVG | MAX | MIN} for all phases. If delta or L-L connection, enter the first or the two phases being monitored [1-2, 2-3, 3-1]. Must be less than the number of phases. Does not apply to kvar control which uses all phases by default.

Name: `CTPhase`
Default: 1

(Setter)
"""
function CTPhase(obj::Obj, value::Union{Int,MonitoredPhase.T}, flags::SetterFlagsT=SetterFlagsT(0))
    obj_set_int32(obj, _PropertyIndex.CTPhase, Int32(value), flags)
end

"""
Number of the phase being monitored for CURRENT control or one of {AVG | MAX | MIN} for all phases. If delta or L-L connection, enter the first or the two phases being monitored [1-2, 2-3, 3-1]. Must be less than the number of phases. Does not apply to kvar control which uses all phases by default.

Name: `CTPhase`
Default: 1

(Getter)
"""
function CTPhase_str(obj::Obj)::String
    obj_get_str(obj, _PropertyIndex.CTPhase)
end

"""
Number of the phase being monitored for CURRENT control or one of {AVG | MAX | MIN} for all phases. If delta or L-L connection, enter the first or the two phases being monitored [1-2, 2-3, 3-1]. Must be less than the number of phases. Does not apply to kvar control which uses all phases by default.

Name: `CTPhase`
Default: 1

(Setter)
"""
function CTPhase_str(obj::Obj, value::String, flags::SetterFlagsT=SetterFlagsT(0))
    CTPhase(obj, value, flags)
end

"""
Number of the phase being monitored for VOLTAGE control or one of {AVG | MAX | MIN} for all phases. If delta or L-L connection, enter the first or the two phases being monitored [1-2, 2-3, 3-1]. Must be less than the number of phases. Does not apply to kvar control which uses all phases by default.

Name: `PTPhase`
Default: 1

(Getter)
"""                
function PTPhase(obj::Obj)::Union{MonitoredPhase.T,Int}
    value = obj_get_int32(obj, _PropertyIndex.PTPhase)
    if value > 0
        return value
    end
    return MonitoredPhase.T(value)
end

"""
Number of the phase being monitored for VOLTAGE control or one of {AVG | MAX | MIN} for all phases. If delta or L-L connection, enter the first or the two phases being monitored [1-2, 2-3, 3-1]. Must be less than the number of phases. Does not apply to kvar control which uses all phases by default.

Name: `PTPhase`
Default: 1

(Setter)
"""
function PTPhase(obj::Obj, value::String, flags::SetterFlagsT=SetterFlagsT(0))
    obj_set_str(obj, _PropertyIndex.PTPhase, value, flags)
end

"""
Number of the phase being monitored for VOLTAGE control or one of {AVG | MAX | MIN} for all phases. If delta or L-L connection, enter the first or the two phases being monitored [1-2, 2-3, 3-1]. Must be less than the number of phases. Does not apply to kvar control which uses all phases by default.

Name: `PTPhase`
Default: 1

(Setter)
"""
function PTPhase(obj::Obj, value::Union{Int,MonitoredPhase.T}, flags::SetterFlagsT=SetterFlagsT(0))
    obj_set_int32(obj, _PropertyIndex.PTPhase, Int32(value), flags)
end

"""
Number of the phase being monitored for VOLTAGE control or one of {AVG | MAX | MIN} for all phases. If delta or L-L connection, enter the first or the two phases being monitored [1-2, 2-3, 3-1]. Must be less than the number of phases. Does not apply to kvar control which uses all phases by default.

Name: `PTPhase`
Default: 1

(Getter)
"""
function PTPhase_str(obj::Obj)::String
    obj_get_str(obj, _PropertyIndex.PTPhase)
end

"""
Number of the phase being monitored for VOLTAGE control or one of {AVG | MAX | MIN} for all phases. If delta or L-L connection, enter the first or the two phases being monitored [1-2, 2-3, 3-1]. Must be less than the number of phases. Does not apply to kvar control which uses all phases by default.

Name: `PTPhase`
Default: 1

(Setter)
"""
function PTPhase_str(obj::Obj, value::String, flags::SetterFlagsT=SetterFlagsT(0))
    PTPhase(obj, value, flags)
end

"""
Name of bus to use for voltage override function. Default is bus at monitored terminal. Sometimes it is useful to monitor a bus in another location to emulate various DMS control algorithms.

Name: `VBus`

(Getter)
"""
function VBus(obj::Obj)::String
    obj_get_str(obj, _PropertyIndex.VBus)
end

"""
Name of bus to use for voltage override function. Default is bus at monitored terminal. Sometimes it is useful to monitor a bus in another location to emulate various DMS control algorithms.

Name: `VBus`

(Setter)
"""
function VBus(obj::Obj, value::String, flags::SetterFlagsT=SetterFlagsT(0))
    obj_set_str(obj, _PropertyIndex.VBus, value, flags)
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
Name of DLL containing user-written CapControl model, overriding the default model.  Set to "none" to negate previous setting. 

Name: `UserModel`

(Getter)
"""
function UserModel(obj::Obj)::String
    obj_get_str(obj, _PropertyIndex.UserModel)
end

"""
Name of DLL containing user-written CapControl model, overriding the default model.  Set to "none" to negate previous setting. 

Name: `UserModel`

(Setter)
"""
function UserModel(obj::Obj, value::String, flags::SetterFlagsT=SetterFlagsT(0))
    obj_set_str(obj, _PropertyIndex.UserModel, value, flags)
end

"""
String (in quotes or parentheses if necessary) that gets passed to the user-written CapControl model Edit function for defining the data required for that model. 

Name: `UserData`

(Getter)
"""
function UserData(obj::Obj)::String
    obj_get_str(obj, _PropertyIndex.UserData)
end

"""
String (in quotes or parentheses if necessary) that gets passed to the user-written CapControl model Edit function for defining the data required for that model. 

Name: `UserData`

(Setter)
"""
function UserData(obj::Obj, value::String, flags::SetterFlagsT=SetterFlagsT(0))
    obj_set_str(obj, _PropertyIndex.UserData, value, flags)
end

"""
For PF control option, min percent of total bank kvar at which control will close capacitor switch.

Name: `pctMinkvar`
Default: 50.0

(Getter)
"""
function pctMinkvar(obj::Obj)::Float64
    obj_get_float64(obj, _PropertyIndex.pctMinkvar)
end

"""
For PF control option, min percent of total bank kvar at which control will close capacitor switch.

Name: `pctMinkvar`
Default: 50.0

(Setter)
"""
function pctMinkvar(obj::Obj, value::Float64, flags::SetterFlagsT=SetterFlagsT(0))
    obj_set_float64(obj, _PropertyIndex.pctMinkvar, value, flags)
end

"""
If Yes, forces Reset of this CapControl.

Name: `Reset`
Default: False
"""
function Reset(obj::Obj, value::Bool=true, flags::SetterFlagsT=SetterFlagsT(0))
    obj_set_bool(obj, _PropertyIndex.Reset, value, flags)
end

"""
Load shape used for controlling the connection/disconnection of the capacitor to the grid, when the load shape is DIFFERENT than ZERO (0) the capacitor will be ON and connected to the grid. Otherwise, if the load shape value is EQUAL to ZERO (0) the capacitor bank will be OFF and disconnected from the grid.

Name: `ControlSignal`

(Getter)
"""
function ControlSignal_str(obj::Obj)::String
    obj_get_str(obj, _PropertyIndex.ControlSignal)
end

"""
Load shape used for controlling the connection/disconnection of the capacitor to the grid, when the load shape is DIFFERENT than ZERO (0) the capacitor will be ON and connected to the grid. Otherwise, if the load shape value is EQUAL to ZERO (0) the capacitor bank will be OFF and disconnected from the grid.

Name: `ControlSignal`

(Setter)
"""
function ControlSignal_str(obj::Obj, value::String, flags::SetterFlagsT=SetterFlagsT(0))
    obj_set_str(obj, _PropertyIndex.ControlSignal, value, flags)
end

"""
Load shape used for controlling the connection/disconnection of the capacitor to the grid, when the load shape is DIFFERENT than ZERO (0) the capacitor will be ON and connected to the grid. Otherwise, if the load shape value is EQUAL to ZERO (0) the capacitor bank will be OFF and disconnected from the grid.

Name: `ControlSignal`

(Getter)
"""
function ControlSignal(obj)::Union{LoadShapeObj, Nothing}
    obj_get_obj(obj,_PropertyIndex.ControlSignal, LoadShapeObj)
end

"""
Load shape used for controlling the connection/disconnection of the capacitor to the grid, when the load shape is DIFFERENT than ZERO (0) the capacitor will be ON and connected to the grid. Otherwise, if the load shape value is EQUAL to ZERO (0) the capacitor bank will be OFF and disconnected from the grid.

Name: `ControlSignal`

(Setter)
"""
function ControlSignal(obj::Obj, value::Union{LoadShapeObj, Nothing}, flags::SetterFlagsT=SetterFlagsT(0))
    obj_set_obj(obj, _PropertyIndex.ControlSignal, value, flags)
end

"""
Load shape used for controlling the connection/disconnection of the capacitor to the grid, when the load shape is DIFFERENT than ZERO (0) the capacitor will be ON and connected to the grid. Otherwise, if the load shape value is EQUAL to ZERO (0) the capacitor bank will be OFF and disconnected from the grid.

Name: `ControlSignal`

(Setter)
"""
function ControlSignal(obj::Obj, value::String, flags::SetterFlagsT=SetterFlagsT(0))
    obj_set_str(obj, _PropertyIndex.ControlSignal, value, flags)
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

end # module CapControl
export CapControl
