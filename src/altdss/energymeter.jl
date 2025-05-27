module EnergyMeter
using ..Enums.SetterFlags: SetterFlagsT
using ..Enums: EnergyMeterAction
import Base: convert
using ..Common
using ..CircuitElement
using DocStringExtensions
@template (FUNCTIONS, METHODS) = """
                                 $(TYPEDSIGNATURES)
                                 $(DOCSTRING)
                                 """


const _cls_name = "EnergyMeter"
const _cls_idx = 49

module _PropertyIndex
const Element = Int32(1)
const Terminal = Int32(2)
const Action = Int32(3)
const Option = Int32(4)
const kVANormal = Int32(5)
const kVAEmerg = Int32(6)
const PeakCurrent = Int32(7)
const ZoneList = Int32(8)
const LocalOnly = Int32(9)
const Mask = Int32(10)
const Losses = Int32(11)
const LineLosses = Int32(12)
const XfmrLosses = Int32(13)
const SeqLosses = Int32(14)
const PhaseLosses3 = Int32(15)
const VBaseLosses = Int32(16)
const PhaseVoltageReport = Int32(17)
const Int_Rate = Int32(18)
const Int_Duration = Int32(19)
const SAIFI = Int32(20)
const SAIFIkW = Int32(21)
const SAIDI = Int32(22)
const CAIDI = Int32(23)
const CustInterrupts = Int32(24)
const BaseFreq = Int32(25)
const Enabled = Int32(26)
const Like = Int32(27)
end

struct EnergyMeterObj <: AbstractMeterElement
    ptr::Ptr{Cvoid}
    dss::DSSContext
end
export EnergyMeterObj
Common._wrap_dss_obj(::Val{_cls_idx}, ptr::Ptr{Cvoid}, dss::DSSContext) = EnergyMeterObj(ptr, dss)
const Obj = EnergyMeterObj

function Base.show(io::IO, obj::EnergyMeterObj) 
    name = obj_get_str(obj, obj.dss.capi.Obj_GetFullName)
    print(name)
end


include("dss_object.jl")
include("energymeter_extras.jl")
include("ce_registers.jl")


"""
Name (Full Object name) of element to which the monitor is connected.

Name: `Element`
Default: Vsource.source

(Getter)
"""
function Element_str(obj::Obj)::String
    obj_get_str(obj, _PropertyIndex.Element)
end

"""
Name (Full Object name) of element to which the monitor is connected.

Name: `Element`
Default: Vsource.source

(Setter)
"""
function Element_str(obj::Obj, value::String, flags::SetterFlagsT=SetterFlagsT(0))
    obj_set_str(obj, _PropertyIndex.Element, value, flags)
end

"""
Name (Full Object name) of element to which the monitor is connected.

Name: `Element`
Default: Vsource.source

(Getter)
"""
function Element(obj)::Union{PDElement, Nothing}
    obj_get_obj(obj,_PropertyIndex.Element, PDElement)
end

"""
Name (Full Object name) of element to which the monitor is connected.

Name: `Element`
Default: Vsource.source

(Setter)
"""
function Element(obj::Obj, value::Union{PDElement, Nothing}, flags::SetterFlagsT=SetterFlagsT(0))
    obj_set_obj(obj, _PropertyIndex.Element, value, flags)
end

"""
Name (Full Object name) of element to which the monitor is connected.

Name: `Element`
Default: Vsource.source

(Setter)
"""
function Element(obj::Obj, value::String, flags::SetterFlagsT=SetterFlagsT(0))
    obj_set_str(obj, _PropertyIndex.Element, value, flags)
end

"""
Number of the terminal of the circuit element to which the monitor is connected. 1 or 2, typically.

Name: `Terminal`
Default: 1

(Getter)
"""
function Terminal(obj::Obj)::Int32
    obj_get_int32(obj, _PropertyIndex.Terminal)
end

"""
Number of the terminal of the circuit element to which the monitor is connected. 1 or 2, typically.

Name: `Terminal`
Default: 1

(Setter)
"""
function Terminal(obj::Obj, value::Int32, flags::SetterFlagsT=SetterFlagsT(0))
    obj_set_int32(obj, _PropertyIndex.Terminal, value, flags)
end

"""
{Clear (reset) | Save | Take | Zonedump | Allocate | Reduce} 

(A)llocate = Allocate loads on the meter zone to match PeakCurrent.
(C)lear = reset all registers to zero
(R)educe = reduces zone by merging lines (see Set Keeplist & ReduceOption)
(S)ave = saves the current register values to a file.
   File name is "MTR_metername.csv".
(T)ake = Takes a sample at present solution
(Z)onedump = Dump names of elements in meter zone to a file
   File name is "Zone_metername.csv".

Name: `Action`
"""
function Action(obj::Obj, value::Union{Int,EnergyMeterAction.T}, flags::SetterFlagsT=SetterFlagsT(0))
    obj_set_int32(obj, _PropertyIndex.Action, Int32(value), flags)
end

"""
{Clear (reset) | Save | Take | Zonedump | Allocate | Reduce} 

(A)llocate = Allocate loads on the meter zone to match PeakCurrent.
(C)lear = reset all registers to zero
(R)educe = reduces zone by merging lines (see Set Keeplist & ReduceOption)
(S)ave = saves the current register values to a file.
   File name is "MTR_metername.csv".
(T)ake = Takes a sample at present solution
(Z)onedump = Dump names of elements in meter zone to a file
   File name is "Zone_metername.csv".

Name: `Action`
"""
function Action(obj::Obj, value::String, flags::SetterFlagsT=SetterFlagsT(0))
    obj_set_str(obj, _PropertyIndex.Action, value)
end

"""Shortcut to Action(EnergyMeterAction.Allocate)"""
function Allocate(obj::Obj, flags::SetterFlagsT=SetterFlagsT(0))
    obj_set_int32(obj, _PropertyIndex.Action, EnergyMeterAction.T.Allocate, flags)
end

"""Shortcut to Action(EnergyMeterAction.Clear)"""
function Clear(obj::Obj, flags::SetterFlagsT=SetterFlagsT(0))
    obj_set_int32(obj, _PropertyIndex.Action, EnergyMeterAction.T.Clear, flags)
end

"""Shortcut to Action(EnergyMeterAction.Reduce)"""
function Reduce(obj::Obj, flags::SetterFlagsT=SetterFlagsT(0))
    obj_set_int32(obj, _PropertyIndex.Action, EnergyMeterAction.T.Reduce, flags)
end

"""Shortcut to Action(EnergyMeterAction.Save)"""
function Save(obj::Obj, flags::SetterFlagsT=SetterFlagsT(0))
    obj_set_int32(obj, _PropertyIndex.Action, EnergyMeterAction.T.Save, flags)
end

"""Shortcut to Action(EnergyMeterAction.TakeSample)"""
function TakeSample(obj::Obj, flags::SetterFlagsT=SetterFlagsT(0))
    obj_set_int32(obj, _PropertyIndex.Action, EnergyMeterAction.T.TakeSample, flags)
end

"""Shortcut to Action(EnergyMeterAction.ZoneDump)"""
function ZoneDump(obj::Obj, flags::SetterFlagsT=SetterFlagsT(0))
    obj_set_int32(obj, _PropertyIndex.Action, EnergyMeterAction.T.ZoneDump, flags)
end

"""
Enter a string ARRAY of any combination of the following. Options processed left-to-right:

(E)xcess : UE/EEN is estimate of energy over capacity 
(T)otal : UE/EEN is total energy after capacity exceeded
(R)adial : Treats zone as a radial circuit
(M)esh : Treats zone as meshed network (not radial).
(C)ombined : Load UE/EEN computed from combination of overload and undervoltage.
(V)oltage : Load UE/EEN computed based on voltage only.

Example: option=(E, R)

Name: `Option`
Default: ['E', 'R', 'C']

(Getter)
"""
function Option(obj::Obj)::Vector{String}
    obj_get_strs(obj, _PropertyIndex.Option)
end

"""
Enter a string ARRAY of any combination of the following. Options processed left-to-right:

(E)xcess : UE/EEN is estimate of energy over capacity 
(T)otal : UE/EEN is total energy after capacity exceeded
(R)adial : Treats zone as a radial circuit
(M)esh : Treats zone as meshed network (not radial).
(C)ombined : Load UE/EEN computed from combination of overload and undervoltage.
(V)oltage : Load UE/EEN computed based on voltage only.

Example: option=(E, R)

Name: `Option`
Default: ['E', 'R', 'C']

(Setter)
"""
function Option(obj::Obj, value::Vector{String}, flags::SetterFlagsT=SetterFlagsT(0))
    obj_set_strs(obj, _PropertyIndex.Option, value, flags)
end

"""
Upper limit on kVA load in the zone, Normal configuration. Default is 0.0 (ignored). Overrides limits on individual lines for overload EEN. With "LocalOnly=Yes" option, uses only load in metered branch.

Name: `kVANormal`
Default: 0.0

(Getter)
"""
function kVANormal(obj::Obj)::Float64
    obj_get_float64(obj, _PropertyIndex.kVANormal)
end

"""
Upper limit on kVA load in the zone, Normal configuration. Default is 0.0 (ignored). Overrides limits on individual lines for overload EEN. With "LocalOnly=Yes" option, uses only load in metered branch.

Name: `kVANormal`
Default: 0.0

(Setter)
"""
function kVANormal(obj::Obj, value::Float64, flags::SetterFlagsT=SetterFlagsT(0))
    obj_set_float64(obj, _PropertyIndex.kVANormal, value, flags)
end

"""
Upper limit on kVA load in the zone, Emergency configuration. Default is 0.0 (ignored). Overrides limits on individual lines for overload UE. With "LocalOnly=Yes" option, uses only load in metered branch.

Name: `kVAEmerg`
Default: 0.0

(Getter)
"""
function kVAEmerg(obj::Obj)::Float64
    obj_get_float64(obj, _PropertyIndex.kVAEmerg)
end

"""
Upper limit on kVA load in the zone, Emergency configuration. Default is 0.0 (ignored). Overrides limits on individual lines for overload UE. With "LocalOnly=Yes" option, uses only load in metered branch.

Name: `kVAEmerg`
Default: 0.0

(Setter)
"""
function kVAEmerg(obj::Obj, value::Float64, flags::SetterFlagsT=SetterFlagsT(0))
    obj_set_float64(obj, _PropertyIndex.kVAEmerg, value, flags)
end

"""
ARRAY of current magnitudes representing the peak currents measured at this location for the load allocation function. Enter one current for each phase

Name: `PeakCurrent`
Default: [400.0, 400.0, 400.0]

(Getter)
"""
function PeakCurrent(obj::Obj)::Vector{Float64}
    obj_get_float64s(obj, _PropertyIndex.PeakCurrent)
end

"""
ARRAY of current magnitudes representing the peak currents measured at this location for the load allocation function. Enter one current for each phase

Name: `PeakCurrent`
Default: [400.0, 400.0, 400.0]

(Setter)
"""
function PeakCurrent(obj::Obj, value::Vector{Float64}, flags::SetterFlagsT=SetterFlagsT(0))
    obj_get_float64s(obj, _PropertyIndex.PeakCurrent, value, flags)
end

"""
ARRAY of full element names for this meter's zone. Default is for meter to find its own zone. If specified, DSS uses this list instead.  Can access the names in a single-column text file.  Examples: 

zonelist=[line.L1, transformer.T1, Line.L3] 
zonelist=(file=branchlist.txt)

Name: `ZoneList`

(Getter)
"""
function ZoneList(obj::Obj)::Vector{String}
    obj_get_strs(obj, _PropertyIndex.ZoneList)
end

"""
ARRAY of full element names for this meter's zone. Default is for meter to find its own zone. If specified, DSS uses this list instead.  Can access the names in a single-column text file.  Examples: 

zonelist=[line.L1, transformer.T1, Line.L3] 
zonelist=(file=branchlist.txt)

Name: `ZoneList`

(Setter)
"""
function ZoneList(obj::Obj, value::Vector{String}, flags::SetterFlagsT=SetterFlagsT(0))
    obj_set_strs(obj, _PropertyIndex.ZoneList, value, flags)
end

"""
If Yes, meter considers only the monitored element for EEN and UE calcs.  Uses whole zone for losses.

Name: `LocalOnly`
Default: False

(Getter)
"""
function LocalOnly(obj::Obj)::Bool
    return obj_get_bool(obj, _PropertyIndex.LocalOnly)
end

"""
If Yes, meter considers only the monitored element for EEN and UE calcs.  Uses whole zone for losses.

Name: `LocalOnly`
Default: False

(Setter)
"""
function LocalOnly(obj::Obj, value::Bool, flags::SetterFlagsT=SetterFlagsT(0))
    obj_set_bool(obj, _PropertyIndex.LocalOnly, value, flags)
end

"""
Mask for adding registers whenever all meters are totalized.  Array of floating point numbers representing the multiplier to be used for summing each register from this meter. Default = (1, 1, 1, 1, ... ).  You only have to enter as many as are changed (positional). Useful when two meters monitor same energy, etc.

Name: `Mask`
Default: [1.0, 1.0, 1.0, 1.0, 1.0, 1.0, 1.0, 1.0, 1.0, 1.0, 1.0, 1.0, 1.0, 1.0, 1.0, 1.0, 1.0, 1.0, 1.0, 1.0, 1.0, 1.0, 1.0, 1.0, 1.0, 1.0, 1.0, 1.0, 1.0, 1.0, 1.0, 1.0, 1.0, 1.0, 1.0, 1.0, 1.0, 1.0, 1.0, 1.0, 1.0, 1.0, 1.0, 1.0, 1.0, 1.0, 1.0, 1.0, 1.0, 1.0, 1.0, 1.0, 1.0, 1.0, 1.0, 1.0, 1.0, 1.0, 1.0, 1.0, 1.0, 1.0, 1.0, 1.0, 1.0, 1.0, 1.0]

(Getter)
"""
function Mask(obj::Obj)::Vector{Float64}
    obj_get_float64s(obj, _PropertyIndex.Mask)
end

"""
Mask for adding registers whenever all meters are totalized.  Array of floating point numbers representing the multiplier to be used for summing each register from this meter. Default = (1, 1, 1, 1, ... ).  You only have to enter as many as are changed (positional). Useful when two meters monitor same energy, etc.

Name: `Mask`
Default: [1.0, 1.0, 1.0, 1.0, 1.0, 1.0, 1.0, 1.0, 1.0, 1.0, 1.0, 1.0, 1.0, 1.0, 1.0, 1.0, 1.0, 1.0, 1.0, 1.0, 1.0, 1.0, 1.0, 1.0, 1.0, 1.0, 1.0, 1.0, 1.0, 1.0, 1.0, 1.0, 1.0, 1.0, 1.0, 1.0, 1.0, 1.0, 1.0, 1.0, 1.0, 1.0, 1.0, 1.0, 1.0, 1.0, 1.0, 1.0, 1.0, 1.0, 1.0, 1.0, 1.0, 1.0, 1.0, 1.0, 1.0, 1.0, 1.0, 1.0, 1.0, 1.0, 1.0, 1.0, 1.0, 1.0, 1.0]

(Setter)
"""
function Mask(obj::Obj, value::Vector{Float64}, flags::SetterFlagsT=SetterFlagsT(0))
    obj_get_float64s(obj, _PropertyIndex.Mask, value, flags)
end

"""
Compute Zone losses. If NO, then no losses at all are computed.

Name: `Losses`
Default: True

(Getter)
"""
function Losses(obj::Obj)::Bool
    return obj_get_bool(obj, _PropertyIndex.Losses)
end

"""
Compute Zone losses. If NO, then no losses at all are computed.

Name: `Losses`
Default: True

(Setter)
"""
function Losses(obj::Obj, value::Bool, flags::SetterFlagsT=SetterFlagsT(0))
    obj_set_bool(obj, _PropertyIndex.Losses, value, flags)
end

"""
Compute Line losses. If NO, then none of the losses are computed.

Name: `LineLosses`
Default: True

(Getter)
"""
function LineLosses(obj::Obj)::Bool
    return obj_get_bool(obj, _PropertyIndex.LineLosses)
end

"""
Compute Line losses. If NO, then none of the losses are computed.

Name: `LineLosses`
Default: True

(Setter)
"""
function LineLosses(obj::Obj, value::Bool, flags::SetterFlagsT=SetterFlagsT(0))
    obj_set_bool(obj, _PropertyIndex.LineLosses, value, flags)
end

"""
Compute Transformer losses. If NO, transformers are ignored in loss calculations.

Name: `XfmrLosses`
Default: True

(Getter)
"""
function XfmrLosses(obj::Obj)::Bool
    return obj_get_bool(obj, _PropertyIndex.XfmrLosses)
end

"""
Compute Transformer losses. If NO, transformers are ignored in loss calculations.

Name: `XfmrLosses`
Default: True

(Setter)
"""
function XfmrLosses(obj::Obj, value::Bool, flags::SetterFlagsT=SetterFlagsT(0))
    obj_set_bool(obj, _PropertyIndex.XfmrLosses, value, flags)
end

"""
Compute Sequence losses in lines and segregate by line mode losses and zero mode losses.

Name: `SeqLosses`
Default: True

(Getter)
"""
function SeqLosses(obj::Obj)::Bool
    return obj_get_bool(obj, _PropertyIndex.SeqLosses)
end

"""
Compute Sequence losses in lines and segregate by line mode losses and zero mode losses.

Name: `SeqLosses`
Default: True

(Setter)
"""
function SeqLosses(obj::Obj, value::Bool, flags::SetterFlagsT=SetterFlagsT(0))
    obj_set_bool(obj, _PropertyIndex.SeqLosses, value, flags)
end

"""
Compute Line losses and segregate by 3-phase and other (1- and 2-phase) line losses. 

Name: `3PhaseLosses`
Default: True

(Getter)
"""
function ThreePhaseLosses(obj::Obj)::Bool
    return obj_get_bool(obj, _PropertyIndex.ThreePhaseLosses)
end

"""
Compute Line losses and segregate by 3-phase and other (1- and 2-phase) line losses. 

Name: `3PhaseLosses`
Default: True

(Setter)
"""
function ThreePhaseLosses(obj::Obj, value::Bool, flags::SetterFlagsT=SetterFlagsT(0))
    obj_set_bool(obj, _PropertyIndex.ThreePhaseLosses, value, flags)
end

"""
Compute losses and segregate by voltage base. If NO, then voltage-based tabulation is not reported.

Name: `VBaseLosses`
Default: True

(Getter)
"""
function VBaseLosses(obj::Obj)::Bool
    return obj_get_bool(obj, _PropertyIndex.VBaseLosses)
end

"""
Compute losses and segregate by voltage base. If NO, then voltage-based tabulation is not reported.

Name: `VBaseLosses`
Default: True

(Setter)
"""
function VBaseLosses(obj::Obj, value::Bool, flags::SetterFlagsT=SetterFlagsT(0))
    obj_set_bool(obj, _PropertyIndex.VBaseLosses, value, flags)
end

"""
Report min, max, and average phase voltages for the zone and tabulate by voltage base. Demand Intervals must be turned on (Set Demand=true) and voltage bases must be defined for this property to take effect. Result is in a separate report file.

Name: `PhaseVoltageReport`
Default: False

(Getter)
"""
function PhaseVoltageReport(obj::Obj)::Bool
    return obj_get_bool(obj, _PropertyIndex.PhaseVoltageReport)
end

"""
Report min, max, and average phase voltages for the zone and tabulate by voltage base. Demand Intervals must be turned on (Set Demand=true) and voltage bases must be defined for this property to take effect. Result is in a separate report file.

Name: `PhaseVoltageReport`
Default: False

(Setter)
"""
function PhaseVoltageReport(obj::Obj, value::Bool, flags::SetterFlagsT=SetterFlagsT(0))
    obj_set_bool(obj, _PropertyIndex.PhaseVoltageReport, value, flags)
end

"""
Average number of annual interruptions for head of the meter zone (source side of zone or feeder).

Name: `Int_Rate`
Default: 0.0

(Getter)
"""
function Int_Rate(obj::Obj)::Float64
    obj_get_float64(obj, _PropertyIndex.Int_Rate)
end

"""
Average number of annual interruptions for head of the meter zone (source side of zone or feeder).

Name: `Int_Rate`
Default: 0.0

(Setter)
"""
function Int_Rate(obj::Obj, value::Float64, flags::SetterFlagsT=SetterFlagsT(0))
    obj_set_float64(obj, _PropertyIndex.Int_Rate, value, flags)
end

"""
Average annual duration, in hr, of interruptions for head of the meter zone (source side of zone or feeder).

Name: `Int_Duration`
Default: 0.0

(Getter)
"""
function Int_Duration(obj::Obj)::Float64
    obj_get_float64(obj, _PropertyIndex.Int_Duration)
end

"""
Average annual duration, in hr, of interruptions for head of the meter zone (source side of zone or feeder).

Name: `Int_Duration`
Default: 0.0

(Setter)
"""
function Int_Duration(obj::Obj, value::Float64, flags::SetterFlagsT=SetterFlagsT(0))
    obj_set_float64(obj, _PropertyIndex.Int_Duration, value, flags)
end

"""
(Read only) Makes SAIFI result available via return on query (? energymeter.myMeter.SAIFI.

**Read-only**

Name: `SAIFI`

(Getter)
"""
function SAIFI(obj::Obj)::Float64
    obj_get_float64(obj, _PropertyIndex.SAIFI)
end

"""
(Read only) Makes SAIFI result available via return on query (? energymeter.myMeter.SAIFI.

**Read-only**

Name: `SAIFI`

(Setter)
"""
function SAIFI(obj::Obj, value::Float64, flags::SetterFlagsT=SetterFlagsT(0))
    obj_set_float64(obj, _PropertyIndex.SAIFI, value, flags)
end

"""
(Read only) Makes SAIFIkW result available via return on query (? energymeter.myMeter.SAIFIkW.

**Read-only**

Name: `SAIFIkW`

(Getter)
"""
function SAIFIkW(obj::Obj)::Float64
    obj_get_float64(obj, _PropertyIndex.SAIFIkW)
end

"""
(Read only) Makes SAIFIkW result available via return on query (? energymeter.myMeter.SAIFIkW.

**Read-only**

Name: `SAIFIkW`

(Setter)
"""
function SAIFIkW(obj::Obj, value::Float64, flags::SetterFlagsT=SetterFlagsT(0))
    obj_set_float64(obj, _PropertyIndex.SAIFIkW, value, flags)
end

"""
(Read only) Makes SAIDI result available via return on query (? energymeter.myMeter.SAIDI.

**Read-only**

Name: `SAIDI`

(Getter)
"""
function SAIDI(obj::Obj)::Float64
    obj_get_float64(obj, _PropertyIndex.SAIDI)
end

"""
(Read only) Makes SAIDI result available via return on query (? energymeter.myMeter.SAIDI.

**Read-only**

Name: `SAIDI`

(Setter)
"""
function SAIDI(obj::Obj, value::Float64, flags::SetterFlagsT=SetterFlagsT(0))
    obj_set_float64(obj, _PropertyIndex.SAIDI, value, flags)
end

"""
(Read only) Makes CAIDI result available via return on query (? energymeter.myMeter.CAIDI.

**Read-only**

Name: `CAIDI`

(Getter)
"""
function CAIDI(obj::Obj)::Float64
    obj_get_float64(obj, _PropertyIndex.CAIDI)
end

"""
(Read only) Makes CAIDI result available via return on query (? energymeter.myMeter.CAIDI.

**Read-only**

Name: `CAIDI`

(Setter)
"""
function CAIDI(obj::Obj, value::Float64, flags::SetterFlagsT=SetterFlagsT(0))
    obj_set_float64(obj, _PropertyIndex.CAIDI, value, flags)
end

"""
(Read only) Makes Total Customer Interrupts value result available via return on query (? energymeter.myMeter.CustInterrupts.

**Read-only**

Name: `CustInterrupts`

(Getter)
"""
function CustInterrupts(obj::Obj)::Float64
    obj_get_float64(obj, _PropertyIndex.CustInterrupts)
end

"""
(Read only) Makes Total Customer Interrupts value result available via return on query (? energymeter.myMeter.CustInterrupts.

**Read-only**

Name: `CustInterrupts`

(Setter)
"""
function CustInterrupts(obj::Obj, value::Float64, flags::SetterFlagsT=SetterFlagsT(0))
    obj_set_float64(obj, _PropertyIndex.CustInterrupts, value, flags)
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

end # module EnergyMeter
export EnergyMeter
