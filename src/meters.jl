module Meters

using DocStringExtensions

using ..Lib
using ..Utils

@template (FUNCTIONS, METHODS) = """
                                 $(TYPEDSIGNATURES)
                                 $(DOCSTRING)
                                 """

"""Close all DI Files"""
function CloseAllDIFiles()
    @checked Lib.Meters_CloseAllDIFiles()
end

"""Do reliability calculation"""
function DoReliabilityCalc(AssumeRestoration::Bool)
    @checked Lib.Meters_DoReliabilityCalc(AssumeRestoration ? 1 : 0)
end

"""Open all DI Files"""
function OpenAllDIFiles()
    @checked Lib.Meters_OpenAllDIFiles()
end

"""Reset meter"""
function Reset()
    @checked Lib.Meters_Reset()
end

"""Reset all meters"""
function ResetAll()
    @checked Lib.Meters_ResetAll()
end

"""Sample meter"""
function Sample()
    @checked Lib.Meters_Sample()
end

"""Sample all meters"""
function SampleAll()
    @checked Lib.Meters_SampleAll()
end

"""Save meter registers"""
function Save()
    @checked Lib.Meters_Save()
end

"""Save all meters registers"""
function SaveAll()
    @checked Lib.Meters_SaveAll()
end

"""Set active section"""
function SetActiveSection(SectIdx::Int)
    @checked Lib.Meters_SetActiveSection(SectIdx)
end

"""Wide string list of all branches in zone of the active energymeter object."""
function AllBranchesInZone()::Vector{String}
    return get_string_array(Lib.Meters_Get_AllBranchesInZone)
end

"""Array of names of all zone end elements."""
function AllEndElements()::Vector{String}
    return get_string_array(Lib.Meters_Get_AllEndElements)
end

"""Array of all energy Meter names"""
function AllNames()::Vector{String}
    return get_string_array(Lib.Meters_Get_AllNames)
end

"""Array of doubles: set the phase allocation factors for the active meter."""
function AllocFactors()::Vector{Float64}
    return get_float64_array(Lib.Meters_Get_AllocFactors)
end

"""Array of doubles: set the phase allocation factors for the active meter."""
function AllocFactors(Value::Vector{Float64})
    Value, ValuePtr, ValueCount = prepare_float64_array(Value)
    @checked Lib.Meters_Set_AllocFactors(ValuePtr, ValueCount)
end

"""Average Repair time in this section of the meter zone"""
function AvgRepairTime()::Float64
    return @checked Lib.Meters_Get_AvgRepairTime()
end

"""Set the magnitude of the real part of the Calculated Current (normally determined by solution) for the Meter to force some behavior on Load Allocation"""
function CalcCurrent()::Vector{Float64}
    return get_float64_array(Lib.Meters_Get_CalcCurrent)
end

"""Set the magnitude of the real part of the Calculated Current (normally determined by solution) for the Meter to force some behavior on Load Allocation"""
function CalcCurrent(Value::Vector{Float64})
    Value, ValuePtr, ValueCount = prepare_float64_array(Value)
    @checked Lib.Meters_Set_CalcCurrent(ValuePtr, ValueCount)
end

"""Number of Energy Meters in the Active Circuit"""
function Count()::Int
    return @checked Lib.Meters_Get_Count()
end

"""Number of branches in Active energymeter zone. (Same as sequencelist size)"""
function CountBranches()::Int
    return @checked Lib.Meters_Get_CountBranches()
end

"""Number of zone end elements in the active meter zone."""
function CountEndElements()::Int
    return @checked Lib.Meters_Get_CountEndElements()
end

"""Total customer interruptions for this Meter zone based on reliability calcs."""
function CustInterrupts()::Float64
        # TODO: should this be Int?
    return @checked Lib.Meters_Get_CustInterrupts()
end

"""Global Flag in the DSS to indicate if Demand Interval (DI) files have been properly opened."""
function DIFilesAreOpen()::Bool
    return @checked(Lib.Meters_Get_DIFilesAreOpen()) != 0
end

"""Sum of Fault Rate time Repair Hrs in this section of the meter zone"""
function FaultRateXRepairHrs()::Float64
    return @checked Lib.Meters_Get_FaultRateXRepairHrs()
end

"""Set the first energy Meter active. Returns 0 if none."""
function First()::Int
    return @checked Lib.Meters_Get_First()
end

"""Set Name of metered element"""
function MeteredElement()::String
    return get_string(Lib.Meters_Get_MeteredElement())
end

"""Set Name of metered element"""
function MeteredElement(Value::String)
    @checked Lib.Meters_Set_MeteredElement(Cstring(pointer(Value)))
end

"""set Number of Metered Terminal"""
function MeteredTerminal()::Int
    return @checked Lib.Meters_Get_MeteredTerminal()
end

"""set Number of Metered Terminal"""
function MeteredTerminal(Value::Int)
    @checked Lib.Meters_Set_MeteredTerminal(Value)
end

"""
(read) Get/Set the active meter  name.
(write) Set a meter to be active by name.
"""
function Name()::String
    return get_string(@checked Lib.Meters_Get_Name())
end

"""
(read) Get/Set the active meter  name.
(write) Set a meter to be active by name.
"""
function Name(Value::String)
    @checked Lib.Meters_Set_Name(Cstring(pointer(Value)))
end

"""Sets the next energy Meter active.  Returns 0 if no more."""
function Next()::Int
    return @checked Lib.Meters_Get_Next()
end

"""Number of branches (lines) in this section"""
function NumSectionBranches()::Int
    return @checked Lib.Meters_Get_NumSectionBranches()
end

"""Number of Customers in the active section."""
function NumSectionCustomers()::Int
    return @checked Lib.Meters_Get_NumSectionCustomers()
end

"""Number of feeder sections in this meter's zone"""
function NumSections()::Int
    return @checked Lib.Meters_Get_NumSections()
end

"""Type of OCP device. 1=Fuse; 2=Recloser; 3=Relay"""
function OCPDeviceType()::Int
        # TODO: use enum here?
    return @checked Lib.Meters_Get_OCPDeviceType()
end

"""Array of doubles to set values of Peak Current property"""
function PeakCurrent()::Vector{Float64}
    return get_float64_array(Lib.Meters_Get_Peakcurrent)
end

"""Array of doubles to set values of Peak Current property"""
function PeakCurrent(Value::Vector{Float64})
    Value, ValuePtr, ValueCount = prepare_float64_array(Value)
    @checked Lib.Meters_Set_Peakcurrent(ValuePtr, ValueCount)
end

"""Array of strings containing the names of the registers."""
function RegisterNames()::Vector{String}
    return get_string_array(Lib.Meters_Get_RegisterNames)
end

"""Array of all the values contained in the Meter registers for the active Meter."""
function RegisterValues()::Vector{Float64}
    return get_float64_array(Lib.Meters_Get_RegisterValues)
end

"""SAIDI for this meter's zone. Execute DoReliabilityCalc first."""
function SAIDI()::Float64
    return @checked Lib.Meters_Get_SAIDI()
end

"""Returns SAIFI for this meter's Zone. Execute Reliability Calc method first."""
function SAIFI()::Float64
    return @checked Lib.Meters_Get_SAIFI()
end

"""SAIFI based on kW rather than number of customers. Get after reliability calcs."""
function SAIFIkW()::Float64
    return @checked Lib.Meters_Get_SAIFIKW()
end

"""SequenceIndex of the branch at the head of this section"""
function SectSeqidx()::Int
    return @checked Lib.Meters_Get_SectSeqIdx()
end

"""Total Customers downline from this section"""
function SectTotalCust()::Int
    return @checked Lib.Meters_Get_SectTotalCust()
end

"""Size of Sequence List"""
function SeqListSize()::Int
    return @checked Lib.Meters_Get_SeqListSize()
end

"""Get/set Index into Meter's SequenceList that contains branch pointers in lexical order. Earlier index guaranteed to be upline from later index. Sets PDelement active."""
function SequenceList()::Int
    return @checked Lib.Meters_Get_SequenceIndex()
end

"""Get/set Index into Meter's SequenceList that contains branch pointers in lexical order. Earlier index guaranteed to be upline from later index. Sets PDelement active."""
function SequenceList(Value::Int)
    @checked Lib.Meters_Set_SequenceIndex(Value)
end

"""Sum of the branch fault rates in this section of the meter's zone"""
function SumBranchFltRates()::Float64
    return @checked Lib.Meters_Get_SumBranchFltRates()
end

"""Total Number of customers in this zone (downline from the EnergyMeter)"""
function TotalCustomers()::Int
    return @checked Lib.Meters_Get_TotalCustomers()
end

"""Totals of all registers of all meters"""
function Totals()::Vector{Float64}
    return get_float64_array(Lib.Meters_Get_Totals)
end

end
