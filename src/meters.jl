module Meters

using DocStringExtensions

using ..Lib
using ..Utils

@template (FUNCTIONS, METHODS) = """
                                 $(TYPEDSIGNATURES)
                                 $(DOCSTRING)
                                 """

"""Close all DI Files"""
function CloseAllDIFiles(dss::DSSContext)
    @checked Lib.Meters_CloseAllDIFiles(dss.ctx)
end
CloseAllDIFiles() = CloseAllDIFiles(DSS_DEFAULT_CTX)

"""Do reliability calculation"""
function DoReliabilityCalc(dss::DSSContext, AssumeRestoration::Bool)
    @checked Lib.Meters_DoReliabilityCalc(dss.ctx, AssumeRestoration ? 1 : 0)
end
DoReliabilityCalc(AssumeRestoration::Bool) = DoReliabilityCalc(DSS_DEFAULT_CTX, AssumeRestoration)

"""Open all DI Files"""
function OpenAllDIFiles(dss::DSSContext)
    @checked Lib.Meters_OpenAllDIFiles(dss.ctx)
end
OpenAllDIFiles() = OpenAllDIFiles(DSS_DEFAULT_CTX)

"""Reset meter"""
function Reset(dss::DSSContext)
    @checked Lib.Meters_Reset(dss.ctx)
end
Reset() = Reset(DSS_DEFAULT_CTX)

"""Reset all meters"""
function ResetAll(dss::DSSContext)
    @checked Lib.Meters_ResetAll(dss.ctx)
end
ResetAll() = ResetAll(DSS_DEFAULT_CTX)

"""Sample meter"""
function Sample(dss::DSSContext)
    @checked Lib.Meters_Sample(dss.ctx)
end
Sample() = Sample(DSS_DEFAULT_CTX)

"""Sample all meters"""
function SampleAll(dss::DSSContext)
    @checked Lib.Meters_SampleAll(dss.ctx)
end
SampleAll() = SampleAll(DSS_DEFAULT_CTX)

"""Save meter registers"""
function Save(dss::DSSContext)
    @checked Lib.Meters_Save(dss.ctx)
end
Save() = Save(DSS_DEFAULT_CTX)

"""Save all meters registers"""
function SaveAll(dss::DSSContext)
    @checked Lib.Meters_SaveAll(dss.ctx)
end
SaveAll() = SaveAll(DSS_DEFAULT_CTX)

"""Set active section"""
function SetActiveSection(dss::DSSContext, SectIdx::Int)
    @checked Lib.Meters_SetActiveSection(dss.ctx, SectIdx)
end
SetActiveSection(SectIdx::Int) = SetActiveSection(DSS_DEFAULT_CTX, SectIdx)

"""Wide string list of all branches in zone of the active energymeter object."""
function AllBranchesInZone(dss::DSSContext)::Vector{String}
    return get_string_array(Lib.Meters_Get_AllBranchesInZone, dss.ctx)
end
AllBranchesInZone() = AllBranchesInZone(DSS_DEFAULT_CTX)

"""Array of names of all zone end elements."""
function AllEndElements(dss::DSSContext)::Vector{String}
    return get_string_array(Lib.Meters_Get_AllEndElements, dss.ctx)
end
AllEndElements() = AllEndElements(DSS_DEFAULT_CTX)

"""Array of all energy Meter names"""
function AllNames(dss::DSSContext)::Vector{String}
    return get_string_array(Lib.Meters_Get_AllNames, dss.ctx)
end
AllNames() = AllNames(DSS_DEFAULT_CTX)

"""Array of doubles: set the phase allocation factors for the active meter."""
function AllocFactors(dss::DSSContext)::Vector{Float64}
    return get_float64_array(Lib.Meters_Get_AllocFactors, dss.ctx)
end
AllocFactors() = AllocFactors(DSS_DEFAULT_CTX)

"""Array of doubles: set the phase allocation factors for the active meter."""
function AllocFactors(dss::DSSContext, Value::Vector{Float64})
    Value, ValuePtr, ValueCount = prepare_float64_array(Value)
    @checked Lib.Meters_Set_AllocFactors(dss.ctx, ValuePtr, ValueCount)
end
AllocFactors(Value::Vector{Float64}) = AllocFactors(DSS_DEFAULT_CTX, Value)

"""Average Repair time in this section of the meter zone"""
function AvgRepairTime(dss::DSSContext)::Float64
    return @checked Lib.Meters_Get_AvgRepairTime(dss.ctx)
end
AvgRepairTime() = AvgRepairTime(DSS_DEFAULT_CTX)

"""Set the magnitude of the real part of the Calculated Current (normally determined by solution) for the Meter to force some behavior on Load Allocation"""
function CalcCurrent(dss::DSSContext)::Vector{Float64}
    return get_float64_array(Lib.Meters_Get_CalcCurrent, dss.ctx)
end
CalcCurrent() = CalcCurrent(DSS_DEFAULT_CTX)

"""Set the magnitude of the real part of the Calculated Current (normally determined by solution) for the Meter to force some behavior on Load Allocation"""
function CalcCurrent(dss::DSSContext, Value::Vector{Float64})
    Value, ValuePtr, ValueCount = prepare_float64_array(Value)
    @checked Lib.Meters_Set_CalcCurrent(dss.ctx, ValuePtr, ValueCount)
end
CalcCurrent(Value::Vector{Float64}) = CalcCurrent(DSS_DEFAULT_CTX, Value)

"""Number of Energy Meters in the Active Circuit"""
function Count(dss::DSSContext)::Int
    return @checked Lib.Meters_Get_Count(dss.ctx)
end
Count() = Count(DSS_DEFAULT_CTX)

"""Number of branches in Active energymeter zone. (Same as sequencelist size)"""
function CountBranches(dss::DSSContext)::Int
    return @checked Lib.Meters_Get_CountBranches(dss.ctx)
end
CountBranches() = CountBranches(DSS_DEFAULT_CTX)

"""Number of zone end elements in the active meter zone."""
function CountEndElements(dss::DSSContext)::Int
    return @checked Lib.Meters_Get_CountEndElements(dss.ctx)
end
CountEndElements() = CountEndElements(DSS_DEFAULT_CTX)

"""Total customer interruptions for this Meter zone based on reliability calcs."""
function CustInterrupts(dss::DSSContext)::Float64
        # TODO: should this be Int?
    return @checked Lib.Meters_Get_CustInterrupts(dss.ctx)
end
CustInterrupts() = CustInterrupts(DSS_DEFAULT_CTX)

"""Global Flag in the DSS to indicate if Demand Interval (DI) files have been properly opened."""
function DIFilesAreOpen(dss::DSSContext)::Bool
    return @checked(Lib.Meters_Get_DIFilesAreOpen(dss.ctx)) != 0
end
DIFilesAreOpen() = DIFilesAreOpen(DSS_DEFAULT_CTX)

"""Sum of Fault Rate time Repair Hrs in this section of the meter zone"""
function FaultRateXRepairHrs(dss::DSSContext)::Float64
    return @checked Lib.Meters_Get_FaultRateXRepairHrs(dss.ctx)
end
FaultRateXRepairHrs() = FaultRateXRepairHrs(DSS_DEFAULT_CTX)

"""Set the first energy Meter active. Returns 0 if none."""
function First(dss::DSSContext)::Int
    return @checked Lib.Meters_Get_First(dss.ctx)
end
First() = First(DSS_DEFAULT_CTX)

"""Set Name of metered element"""
function MeteredElement(dss::DSSContext)::String
    return get_string(Lib.Meters_Get_MeteredElement(dss.ctx))
end
MeteredElement() = MeteredElement(DSS_DEFAULT_CTX)

"""Set Name of metered element"""
function MeteredElement(dss::DSSContext, Value::String)
    @checked Lib.Meters_Set_MeteredElement(dss.ctx, Cstring(pointer(Value)))
end
MeteredElement(Value::String) = MeteredElement(DSS_DEFAULT_CTX, Value)

"""set Number of Metered Terminal"""
function MeteredTerminal(dss::DSSContext)::Int
    return @checked Lib.Meters_Get_MeteredTerminal(dss.ctx)
end
MeteredTerminal() = MeteredTerminal(DSS_DEFAULT_CTX)

"""set Number of Metered Terminal"""
function MeteredTerminal(dss::DSSContext, Value::Int)
    @checked Lib.Meters_Set_MeteredTerminal(dss.ctx, Value)
end
MeteredTerminal(Value::Int) = MeteredTerminal(DSS_DEFAULT_CTX, Value)

"""
(read) Get/Set the active meter  name.
(write) Set a meter to be active by name.
"""
function Name(dss::DSSContext)::String
    return get_string(@checked Lib.Meters_Get_Name(dss.ctx))
end
Name() = Name(DSS_DEFAULT_CTX)

"""
(read) Get/Set the active meter  name.
(write) Set a meter to be active by name.
"""
function Name(dss::DSSContext, Value::String)
    @checked Lib.Meters_Set_Name(dss.ctx, Cstring(pointer(Value)))
end
Name(Value::String) = Name(DSS_DEFAULT_CTX, Value)

"""Sets the next energy Meter active.  Returns 0 if no more."""
function Next(dss::DSSContext)::Int
    return @checked Lib.Meters_Get_Next(dss.ctx)
end
Next() = Next(DSS_DEFAULT_CTX)

"""Number of branches (lines) in this section"""
function NumSectionBranches(dss::DSSContext)::Int
    return @checked Lib.Meters_Get_NumSectionBranches(dss.ctx)
end
NumSectionBranches() = NumSectionBranches(DSS_DEFAULT_CTX)

"""Number of Customers in the active section."""
function NumSectionCustomers(dss::DSSContext)::Int
    return @checked Lib.Meters_Get_NumSectionCustomers(dss.ctx)
end
NumSectionCustomers() = NumSectionCustomers(DSS_DEFAULT_CTX)

"""Number of feeder sections in this meter's zone"""
function NumSections(dss::DSSContext)::Int
    return @checked Lib.Meters_Get_NumSections(dss.ctx)
end
NumSections() = NumSections(DSS_DEFAULT_CTX)

"""Type of OCP device. 1=Fuse; 2=Recloser; 3=Relay"""
function OCPDeviceType(dss::DSSContext)::Int
        # TODO: use enum here?
    return @checked Lib.Meters_Get_OCPDeviceType(dss.ctx)
end
OCPDeviceType() = OCPDeviceType(DSS_DEFAULT_CTX)

"""Array of doubles to set values of Peak Current property"""
function PeakCurrent(dss::DSSContext)::Vector{Float64}
    return get_float64_array(Lib.Meters_Get_Peakcurrent, dss.ctx)
end
PeakCurrent() = PeakCurrent(DSS_DEFAULT_CTX)

"""Array of doubles to set values of Peak Current property"""
function PeakCurrent(dss::DSSContext, Value::Vector{Float64})
    Value, ValuePtr, ValueCount = prepare_float64_array(Value)
    @checked Lib.Meters_Set_Peakcurrent(dss.ctx, ValuePtr, ValueCount)
end
PeakCurrent(Value::Vector{Float64}) = PeakCurrent(DSS_DEFAULT_CTX, Value)

"""Array of strings containing the names of the registers."""
function RegisterNames(dss::DSSContext)::Vector{String}
    return get_string_array(Lib.Meters_Get_RegisterNames, dss.ctx)
end
RegisterNames() = RegisterNames(DSS_DEFAULT_CTX)

"""Array of all the values contained in the Meter registers for the active Meter."""
function RegisterValues(dss::DSSContext)::Vector{Float64}
    return get_float64_array(Lib.Meters_Get_RegisterValues, dss.ctx)
end
RegisterValues() = RegisterValues(DSS_DEFAULT_CTX)

"""SAIDI for this meter's zone. Execute DoReliabilityCalc first."""
function SAIDI(dss::DSSContext)::Float64
    return @checked Lib.Meters_Get_SAIDI(dss.ctx)
end
SAIDI() = SAIDI(DSS_DEFAULT_CTX)

"""Returns SAIFI for this meter's Zone. Execute Reliability Calc method first."""
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

"""Total Customers downline from this section"""
function SectTotalCust(dss::DSSContext)::Int
    return @checked Lib.Meters_Get_SectTotalCust(dss.ctx)
end
SectTotalCust() = SectTotalCust(DSS_DEFAULT_CTX)

"""Size of Sequence List"""
function SeqListSize(dss::DSSContext)::Int
    return @checked Lib.Meters_Get_SeqListSize(dss.ctx)
end
SeqListSize() = SeqListSize(DSS_DEFAULT_CTX)

"""Get/set Index into Meter's SequenceList that contains branch pointers in lexical order. Earlier index guaranteed to be upline from later index. Sets PDelement active."""
function SequenceList(dss::DSSContext)::Int
    return @checked Lib.Meters_Get_SequenceIndex(dss.ctx)
end
SequenceList() = SequenceList(DSS_DEFAULT_CTX)

"""Get/set Index into Meter's SequenceList that contains branch pointers in lexical order. Earlier index guaranteed to be upline from later index. Sets PDelement active."""
function SequenceList(dss::DSSContext, Value::Int)
    @checked Lib.Meters_Set_SequenceIndex(dss.ctx, Value)
end
SequenceList(Value::Int) = SequenceList(DSS_DEFAULT_CTX, Value)

"""Sum of the branch fault rates in this section of the meter's zone"""
function SumBranchFltRates(dss::DSSContext)::Float64
    return @checked Lib.Meters_Get_SumBranchFltRates(dss.ctx)
end
SumBranchFltRates() = SumBranchFltRates(DSS_DEFAULT_CTX)

"""Total Number of customers in this zone (downline from the EnergyMeter)"""
function TotalCustomers(dss::DSSContext)::Int
    return @checked Lib.Meters_Get_TotalCustomers(dss.ctx)
end
TotalCustomers() = TotalCustomers(DSS_DEFAULT_CTX)

"""Totals of all registers of all meters"""
function Totals(dss::DSSContext)::Vector{Float64}
    return get_float64_array(Lib.Meters_Get_Totals, dss.ctx)
end
Totals() = Totals(DSS_DEFAULT_CTX)

"""Returns the list of all PCE within the area covered by the energy meter"""
function ZonePCE(dss::DSSContext)::Vector{String}
    return get_string_array(Lib.Meters_Get_ZonePCE, dss.ctx)
end
ZonePCE() = ZonePCE(DSS_DEFAULT_CTX)

"""Meter Index (Getter)"""
function Idx(dss::DSSContext)::Int
    return @checked Lib.Meters_Get_idx(dss.ctx)
end
Idx() = Idx(DSS_DEFAULT_CTX)

"""Meter Index (Setter)"""
function Idx(dss::DSSContext, Value::Int)
    @checked Lib.Meters_Set_idx(dss.ctx, Value)
end
Idx(Value::Int) = Idx(DSS_DEFAULT_CTX, Value)

end
