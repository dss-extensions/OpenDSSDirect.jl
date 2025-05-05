module Meters

using DocStringExtensions

using ..Lib
using ..Utils

@template (FUNCTIONS, METHODS) = """
                                 $(TYPEDSIGNATURES)
                                 $(DOCSTRING)
                                 """


"""Array of names of all Meter objects."""
function AllNames(dss::DSSContext)::Vector{String}
    return get_string_array(Lib.Meters_Get_AllNames, dss.ctx)
end
AllNames() = AllNames(DSS_DEFAULT_CTX)

"""Gets the name of the active Meter object."""
function Name(dss::DSSContext)::String
    return get_string(@checked Lib.Meters_Get_Name(dss.ctx))
end
Name() = Name(DSS_DEFAULT_CTX)

"""Sets a Meter object active by name."""
function Name(dss::DSSContext, Value::String)
    @checked Lib.Meters_Set_Name(dss.ctx, Value)
end
Name(Value::String) = Name(DSS_DEFAULT_CTX, Value)

"""Number of Meter Objects in Active Circuit"""
function Count(dss::DSSContext)::Int
    return @checked Lib.Meters_Get_Count(dss.ctx)
end
Count() = Count(DSS_DEFAULT_CTX)

"""
Sets first Meter to be active.
Returns 0 if none.
"""
function First(dss::DSSContext)::Int
    return @checked Lib.Meters_Get_First(dss.ctx)
end
First() = First(DSS_DEFAULT_CTX)

"""
Sets next Meter to be active.
Returns 0 if no more.
"""
function Next(dss::DSSContext)::Int
    return @checked Lib.Meters_Get_Next(dss.ctx)
end
Next() = Next(DSS_DEFAULT_CTX)

"""
Returns the index of the current active Meter (1-based)

(Getter)
"""
function Idx(dss::DSSContext)::Int
    return @checked Lib.Meters_Get_idx(dss.ctx)
end
Idx() = Idx(DSS_DEFAULT_CTX)

"""
Activate Meter by index (1-based)

(Setter)
"""
function Idx(dss::DSSContext, Value::Int)
    @checked Lib.Meters_Set_idx(dss.ctx, Value)
end
Idx(Value::Int) = Idx(DSS_DEFAULT_CTX, Value)

"""
Close All Demand Interval Files. Users are required to close the DI files at the end of a run.

Original COM help: https://opendss.epri.com/CloseAllDIFiles.html
"""
function CloseAllDIFiles(dss::DSSContext)
    @checked Lib.Meters_CloseAllDIFiles(dss.ctx)
end
CloseAllDIFiles() = CloseAllDIFiles(DSS_DEFAULT_CTX)

"""
Calculate reliability indices

Original COM help: https://opendss.epri.com/DoReliabilityCalc.html
"""
function DoReliabilityCalc(dss::DSSContext, AssumeRestoration::Bool)
    @checked Lib.Meters_DoReliabilityCalc(dss.ctx, AssumeRestoration ? 1 : 0)
end
DoReliabilityCalc(AssumeRestoration::Bool) = DoReliabilityCalc(DSS_DEFAULT_CTX, AssumeRestoration)

"""
Open Demand Interval (DI) files

Original COM help: https://opendss.epri.com/OpenAllDIFiles.html
"""
function OpenAllDIFiles(dss::DSSContext)
    @checked Lib.Meters_OpenAllDIFiles(dss.ctx)
end
OpenAllDIFiles() = OpenAllDIFiles(DSS_DEFAULT_CTX)

"""
Resets registers of active meter.

Original COM help: https://opendss.epri.com/Reset2.html
"""
function Reset(dss::DSSContext)
    @checked Lib.Meters_Reset(dss.ctx)
end
Reset() = Reset(DSS_DEFAULT_CTX)

"""
Resets registers of all meter objects.

Original COM help: https://opendss.epri.com/ResetAll.html
"""
function ResetAll(dss::DSSContext)
    @checked Lib.Meters_ResetAll(dss.ctx)
end
ResetAll() = ResetAll(DSS_DEFAULT_CTX)

"""
Forces active Meter to take a sample.

Original COM help: https://opendss.epri.com/Sample1.html
"""
function Sample(dss::DSSContext)
    @checked Lib.Meters_Sample(dss.ctx)
end
Sample() = Sample(DSS_DEFAULT_CTX)

"""
Causes all EnergyMeter objects to take a sample at the present time.

Original COM help: https://opendss.epri.com/SampleAll.html
"""
function SampleAll(dss::DSSContext)
    @checked Lib.Meters_SampleAll(dss.ctx)
end
SampleAll() = SampleAll(DSS_DEFAULT_CTX)

"""
Saves meter register values.

Original COM help: https://opendss.epri.com/Save.html
"""
function Save(dss::DSSContext)
    @checked Lib.Meters_Save(dss.ctx)
end
Save() = Save(DSS_DEFAULT_CTX)

"""
Save All EnergyMeter objects

Original COM help: https://opendss.epri.com/SaveAll.html
"""
function SaveAll(dss::DSSContext)
    @checked Lib.Meters_SaveAll(dss.ctx)
end
SaveAll() = SaveAll(DSS_DEFAULT_CTX)

"""Set active section"""
function SetActiveSection(dss::DSSContext, SectIdx::Int)
    @checked Lib.Meters_SetActiveSection(dss.ctx, SectIdx)
end
SetActiveSection(SectIdx::Int) = SetActiveSection(DSS_DEFAULT_CTX, SectIdx)

"""
List (strings) of all branches in zone of the active EnergyMeter object.

Original COM help: https://opendss.epri.com/AllBranchesInZone.html
"""
function AllBranchesInZone(dss::DSSContext)::Vector{String}
    return get_string_array(Lib.Meters_Get_AllBranchesInZone, dss.ctx)
end
AllBranchesInZone() = AllBranchesInZone(DSS_DEFAULT_CTX)

"""
Array of names of all zone end elements.

Original COM help: https://opendss.epri.com/AllEndElements.html
"""
function AllEndElements(dss::DSSContext)::Vector{String}
    return get_string_array(Lib.Meters_Get_AllEndElements, dss.ctx)
end
AllEndElements() = AllEndElements(DSS_DEFAULT_CTX)

"""
Array of doubles: set the phase allocation factors for the active meter.

Original COM help: https://opendss.epri.com/AllocFactors.html

(Getter)
"""
function AllocFactors(dss::DSSContext)::Vector{Float64}
    return get_float64_array(Lib.Meters_Get_AllocFactors, dss.ctx)
end
AllocFactors() = AllocFactors(DSS_DEFAULT_CTX)

"""
Array of doubles: set the phase allocation factors for the active meter.

Original COM help: https://opendss.epri.com/AllocFactors.html

(Setter)
"""
function AllocFactors(dss::DSSContext, Value::Vector{Float64})
    Value, ValuePtr, ValueCount = prepare_float64_array(Value)
    @checked Lib.Meters_Set_AllocFactors(dss.ctx, ValuePtr, ValueCount)
end
AllocFactors(Value::Vector{Float64}) = AllocFactors(DSS_DEFAULT_CTX, Value)

"""
Average Repair time in this section of the meter zone

Original COM help: https://opendss.epri.com/AvgRepairTime.html
"""
function AvgRepairTime(dss::DSSContext)::Float64
    return @checked Lib.Meters_Get_AvgRepairTime(dss.ctx)
end
AvgRepairTime() = AvgRepairTime(DSS_DEFAULT_CTX)

"""
Set the magnitude of the real part of the Calculated Current (normally determined by solution) for the Meter to force some behavior on Load Allocation

Original COM help: https://opendss.epri.com/CalcCurrent.html

(Getter)
"""
function CalcCurrent(dss::DSSContext)::Vector{Float64}
    return get_float64_array(Lib.Meters_Get_CalcCurrent, dss.ctx)
end
CalcCurrent() = CalcCurrent(DSS_DEFAULT_CTX)

"""
Set the magnitude of the real part of the Calculated Current (normally determined by solution) for the Meter to force some behavior on Load Allocation

Original COM help: https://opendss.epri.com/CalcCurrent.html

(Setter)
"""
function CalcCurrent(dss::DSSContext, Value::Vector{Float64})
    Value, ValuePtr, ValueCount = prepare_float64_array(Value)
    @checked Lib.Meters_Set_CalcCurrent(dss.ctx, ValuePtr, ValueCount)
end
CalcCurrent(Value::Vector{Float64}) = CalcCurrent(DSS_DEFAULT_CTX, Value)

"""
Number of branches in Active EnergyMeter zone. (Same as sequence list size)

Original COM help: https://opendss.epri.com/CountBranches.html
"""
function CountBranches(dss::DSSContext)::Int
    return @checked Lib.Meters_Get_CountBranches(dss.ctx)
end
CountBranches() = CountBranches(DSS_DEFAULT_CTX)

"""
Number of zone end elements in the active meter zone.

Original COM help: https://opendss.epri.com/CountEndElements.html
"""
function CountEndElements(dss::DSSContext)::Int
    return @checked Lib.Meters_Get_CountEndElements(dss.ctx)
end
CountEndElements() = CountEndElements(DSS_DEFAULT_CTX)

"""
Total customer interruptions for this Meter zone based on reliability calcs.

Original COM help: https://opendss.epri.com/CustInterrupts.html
"""
function CustInterrupts(dss::DSSContext)::Float64
    return @checked Lib.Meters_Get_CustInterrupts(dss.ctx)
end
CustInterrupts() = CustInterrupts(DSS_DEFAULT_CTX)

"""
Global Flag in the DSS to indicate if Demand Interval (DI) files have been properly opened.

Original COM help: https://opendss.epri.com/DIFilesAreOpen.html
"""
function DIFilesAreOpen(dss::DSSContext)::Bool
    return @checked(Lib.Meters_Get_DIFilesAreOpen(dss.ctx)) != 0
end
DIFilesAreOpen() = DIFilesAreOpen(DSS_DEFAULT_CTX)

"""
Sum of Fault Rate time Repair Hrs in this section of the meter zone

Original COM help: https://opendss.epri.com/FaultRateXRepairHrs.html
"""
function FaultRateXRepairHrs(dss::DSSContext)::Float64
    return @checked Lib.Meters_Get_FaultRateXRepairHrs(dss.ctx)
end
FaultRateXRepairHrs() = FaultRateXRepairHrs(DSS_DEFAULT_CTX)

"""
Name of metered element

Original COM help: https://opendss.epri.com/MeteredElement.html

(Getter)
"""
function MeteredElement(dss::DSSContext)::String
    return get_string(Lib.Meters_Get_MeteredElement(dss.ctx))
end
MeteredElement() = MeteredElement(DSS_DEFAULT_CTX)

"""
Name of metered element

Original COM help: https://opendss.epri.com/MeteredElement.html

(Setter)
"""
function MeteredElement(dss::DSSContext, Value::String)
    @checked Lib.Meters_Set_MeteredElement(dss.ctx, Value)
end
MeteredElement(Value::String) = MeteredElement(DSS_DEFAULT_CTX, Value)

"""
Number of Metered Terminal

Original COM help: https://opendss.epri.com/MeteredTerminal.html

(Getter)
"""
function MeteredTerminal(dss::DSSContext)::Int
    return @checked Lib.Meters_Get_MeteredTerminal(dss.ctx)
end
MeteredTerminal() = MeteredTerminal(DSS_DEFAULT_CTX)

"""
Number of Metered Terminal

Original COM help: https://opendss.epri.com/MeteredTerminal.html

(Setter)
"""
function MeteredTerminal(dss::DSSContext, Value::Int)
    @checked Lib.Meters_Set_MeteredTerminal(dss.ctx, Value)
end
MeteredTerminal(Value::Int) = MeteredTerminal(DSS_DEFAULT_CTX, Value)

"""
Number of branches (lines) in this section

Original COM help: https://opendss.epri.com/NumSectionBranches.html
"""
function NumSectionBranches(dss::DSSContext)::Int
    return @checked Lib.Meters_Get_NumSectionBranches(dss.ctx)
end
NumSectionBranches() = NumSectionBranches(DSS_DEFAULT_CTX)

"""
Number of Customers in the active section.

Original COM help: https://opendss.epri.com/NumSectionCustomers.html
"""
function NumSectionCustomers(dss::DSSContext)::Int
    return @checked Lib.Meters_Get_NumSectionCustomers(dss.ctx)
end
NumSectionCustomers() = NumSectionCustomers(DSS_DEFAULT_CTX)

"""
Number of feeder sections in this meter's zone

Original COM help: https://opendss.epri.com/NumSections.html
"""
function NumSections(dss::DSSContext)::Int
    return @checked Lib.Meters_Get_NumSections(dss.ctx)
end
NumSections() = NumSections(DSS_DEFAULT_CTX)

"""
Type of OCP device. 1=Fuse; 2=Recloser; 3=Relay

Original COM help: https://opendss.epri.com/OCPDeviceType.html
"""
function OCPDeviceType(dss::DSSContext)::Int
    # TODO: use enum here?
    return @checked Lib.Meters_Get_OCPDeviceType(dss.ctx)
end
OCPDeviceType() = OCPDeviceType(DSS_DEFAULT_CTX)

"""
Array of doubles to set values of Peak Current property

Original COM help: https://opendss.epri.com/Peakcurrent.html

(Getter)
"""
function PeakCurrent(dss::DSSContext)::Vector{Float64}
    return get_float64_array(Lib.Meters_Get_Peakcurrent, dss.ctx)
end
PeakCurrent() = PeakCurrent(DSS_DEFAULT_CTX)

"""
Array of doubles to set values of Peak Current property

Original COM help: https://opendss.epri.com/Peakcurrent.html

(Setter)
"""
function PeakCurrent(dss::DSSContext, Value::Vector{Float64})
    Value, ValuePtr, ValueCount = prepare_float64_array(Value)
    @checked Lib.Meters_Set_Peakcurrent(dss.ctx, ValuePtr, ValueCount)
end
PeakCurrent(Value::Vector{Float64}) = PeakCurrent(DSS_DEFAULT_CTX, Value)

"""
Array of strings containing the names of the registers.

See also the enum `EnergyMeterRegisters` for the standard register names.
Besides those listed in the enumeration, users may need to check `RegisterNames`
in order to find a specific register index at runtime.

Original COM help: https://opendss.epri.com/RegisterNames1.html
"""
function RegisterNames(dss::DSSContext)::Vector{String}
    return get_string_array(Lib.Meters_Get_RegisterNames, dss.ctx)
end
RegisterNames() = RegisterNames(DSS_DEFAULT_CTX)

"""
Array of all the values contained in the Meter registers for the active Meter.

Original COM help: https://opendss.epri.com/RegisterValues1.html
"""
function RegisterValues(dss::DSSContext)::Vector{Float64}
    return get_float64_array(Lib.Meters_Get_RegisterValues, dss.ctx)
end
RegisterValues() = RegisterValues(DSS_DEFAULT_CTX)

"""
SAIDI for this meter's zone. Execute DoReliabilityCalc first.

Original COM help: https://opendss.epri.com/SAIDI.html
"""
function SAIDI(dss::DSSContext)::Float64
    return @checked Lib.Meters_Get_SAIDI(dss.ctx)
end
SAIDI() = SAIDI(DSS_DEFAULT_CTX)

"""
Returns SAIFI for this meter's Zone. Execute Reliability Calc method first.

Original COM help: https://opendss.epri.com/SAIFI.html
"""
function SAIFI(dss::DSSContext)::Float64
    return @checked Lib.Meters_Get_SAIFI(dss.ctx)
end
SAIFI() = SAIFI(DSS_DEFAULT_CTX)

"""SAIFI based on kW rather than number of customers. Get after reliability calcs."""
function SAIFIkW(dss::DSSContext)::Float64
    return @checked Lib.Meters_Get_SAIFIKW(dss.ctx)
end
SAIFIkW() = SAIFIkW(DSS_DEFAULT_CTX)

"""SequenceIndex of the branch at the head of this section"""
function SectSeqidx(dss::DSSContext)::Int
    return @checked Lib.Meters_Get_SectSeqIdx(dss.ctx)
end
SectSeqidx() = SectSeqidx(DSS_DEFAULT_CTX)

"""
Total Customers downline from this section

Original COM help: https://opendss.epri.com/SectTotalCust.html
"""
function SectTotalCust(dss::DSSContext)::Int
    return @checked Lib.Meters_Get_SectTotalCust(dss.ctx)
end
SectTotalCust() = SectTotalCust(DSS_DEFAULT_CTX)

"""
Size of the Sequence List

Original COM help: https://opendss.epri.com/SeqListSize.html
"""
function SeqListSize(dss::DSSContext)::Int
    return @checked Lib.Meters_Get_SeqListSize(dss.ctx)
end
SeqListSize() = SeqListSize(DSS_DEFAULT_CTX)

"""Get the index into Meter's SequenceList that contains branch pointers in lexical order. Earlier index guaranteed to be upline from later index. Sets PDelement active."""
function SequenceIndex(dss::DSSContext)::Int
    return @checked Lib.Meters_Get_SequenceIndex(dss.ctx)
end
SequenceIndex() = SequenceIndex(DSS_DEFAULT_CTX)

"""Set the index into Meter's SequenceList that contains branch pointers in lexical order. Earlier index guaranteed to be upline from later index. Sets PDelement active."""
function SequenceIndex(dss::DSSContext, Value::Int)
    @checked Lib.Meters_Set_SequenceIndex(dss.ctx, Value)
end
SequenceIndex(Value::Int) = SequenceIndex(DSS_DEFAULT_CTX, Value)

"""Deprecated: Use SequenceIndex instead (renamed)"""
const SequenceList = SequenceIndex

@deprecate SequenceList SequenceIndex

"""
Sum of the branch fault rates in this section of the meter's zone

Original COM help: https://opendss.epri.com/SumBranchFltRates.html
"""
function SumBranchFltRates(dss::DSSContext)::Float64
    return @checked Lib.Meters_Get_SumBranchFltRates(dss.ctx)
end
SumBranchFltRates() = SumBranchFltRates(DSS_DEFAULT_CTX)

"""
Total Number of customers in this zone (downline from the EnergyMeter)

Original COM help: https://opendss.epri.com/TotalCustomers.html
"""
function TotalCustomers(dss::DSSContext)::Int
    return @checked Lib.Meters_Get_TotalCustomers(dss.ctx)
end
TotalCustomers() = TotalCustomers(DSS_DEFAULT_CTX)

"""
Totals of all registers of all meters

Original COM help: https://opendss.epri.com/Totals.html
"""
function Totals(dss::DSSContext)::Vector{Float64}
    return get_float64_array(Lib.Meters_Get_Totals, dss.ctx)
end
Totals() = Totals(DSS_DEFAULT_CTX)

"""
Returns the list of all PCE within the area covered by the energy meter

Original COM help: https://opendss.epri.com/ZonePCE.html
"""
function ZonePCE(dss::DSSContext)::Vector{String}
    return get_string_array(Lib.Meters_Get_ZonePCE, dss.ctx)
end
ZonePCE() = ZonePCE(DSS_DEFAULT_CTX)

end
