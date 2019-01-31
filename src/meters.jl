module Meters

    using ..Lib
    using ..Utils

    function CloseAllDIFiles()
        Lib.Meters_CloseAllDIFiles()
    end

    function DoReliabilityCalc(AssumeRestoration::Bool)
        Lib.Meters_DoReliabilityCalc(AssumeRestoration ? 1 : 0)
    end

    function OpenAllDIFiles()
        Lib.Meters_OpenAllDIFiles()
    end

    function Reset()
        Lib.Meters_Reset()
    end

    function ResetAll()
        Lib.Meters_ResetAll()
    end

    function Sample()
        Lib.Meters_Sample()
    end

    function SampleAll()
        Lib.Meters_SampleAll()
    end

    function Save()
        Lib.Meters_Save()
    end

    function SaveAll()
        Lib.Meters_SaveAll()
    end

    function SetActiveSection(SectIdx::Int)
        Lib.Meters_SetActiveSection(SectIdx)
    end

    """(read-only) Wide string list of all branches in zone of the active energymeter object."""
    function AllBranchesInZone()::Vector{String}
        return get_string_array(Lib.Meters_Get_AllBranchesInZone)
    end

    """(read-only) Array of names of all zone end elements."""
    function AllEndElements()::Vector{String}
        return get_string_array(Lib.Meters_Get_AllEndElements)
    end

    """(read-only) Array of all energy Meter names"""
    function AllNames()::Vector{String}
        return get_string_array(Lib.Meters_Get_AllNames)
    end

    """Array of doubles: set the phase allocation factors for the active meter."""
    function AllocFactors()::Vector{Float64}
        return get_float64_array(Lib.Meters_Get_AllocFactors)
    end

    """Array of doubles: set the phase allocation factors for the active meter."""
    function AllocFactors(Value::Vector{Float64})
        @error "Not implemented yet. Please contact the developer."
        # TODO: prepare_float64_array
        Value, ValuePtr, ValueCount = prepare_float64_array(Value)
        Lib.Meters_Set_AllocFactors(ValuePtr, ValueCount)
    end

    """(read-only) Average Repair time in this section of the meter zone"""
    function AvgRepairTime()::Float64
        return Lib.Meters_Get_AvgRepairTime()
    end

    """Set the magnitude of the real part of the Calculated Current (normally determined by solution) for the Meter to force some behavior on Load Allocation"""
    function CalcCurrent()::Vector{Float64}
        return get_float64_array(Lib.Meters_Get_CalcCurrent)
    end

    """Set the magnitude of the real part of the Calculated Current (normally determined by solution) for the Meter to force some behavior on Load Allocation"""
    function CalcCurrent(Value::Vector{Float64})
        @error "Not implemented yet. Please contact the developer."
        # TODO: prepare_float64_array
        Value, ValuePtr, ValueCount = prepare_float64_array(Value)
        Lib.Meters_Set_CalcCurrent(ValuePtr, ValueCount)
    end

    """(read-only) Number of Energy Meters in the Active Circuit"""
    function Count()::Int
        return Lib.Meters_Get_Count()
    end

    """(read-only) Number of branches in Active energymeter zone. (Same as sequencelist size)"""
    function CountBranches()::Int
        return Lib.Meters_Get_CountBranches()
    end

    """(read-only) Number of zone end elements in the active meter zone."""
    function CountEndElements()::Int
        return Lib.Meters_Get_CountEndElements()
    end

    """(read-only) Total customer interruptions for this Meter zone based on reliability calcs."""
    function CustInterrupts()::Float64
        # TODO: should this be Int?
        return Lib.Meters_Get_CustInterrupts()
    end

    """(read-only) Global Flag in the DSS to indicate if Demand Interval (DI) files have been properly opened."""
    function DIFilesAreOpen()::Bool
        return Lib.Meters_Get_DIFilesAreOpen() != 0
    end

    """(read-only) Sum of Fault Rate time Repair Hrs in this section of the meter zone"""
    function FaultRateXRepairHrs()::Float64
        return Lib.Meters_Get_FaultRateXRepairHrs()
    end

    """(read-only) Set the first energy Meter active. Returns 0 if none."""
    function First()::Int
        return Lib.Meters_Get_First()
    end

    """Set Name of metered element"""
    function MeteredElement()::String
        return get_string(Lib.Meters_Get_MeteredElement())
    end

    """Set Name of metered element"""
    function MeteredElement(Value::String)
        Lib.Meters_Set_MeteredElement(Cstring(pointer(Value)))
    end

    """set Number of Metered Terminal"""
    function MeteredTerminal()::Int
        return Lib.Meters_Get_MeteredTerminal()
    end

    """set Number of Metered Terminal"""
    function MeteredTerminal(Value::Int)
        Lib.Meters_Set_MeteredTerminal(Value)
    end

    """
    (read) Get/Set the active meter  name.
    (write) Set a meter to be active by name.
    """
    function Name()::String
        result = get_string(Lib.Meters_Get_Name())
        return result
    end

    """
    (read) Get/Set the active meter  name.
    (write) Set a meter to be active by name.
    """
    function Name(Value::String)
        Lib.Meters_Set_Name(Cstring(pointer(Value)))
    end

    """(read-only) Sets the next energy Meter active.  Returns 0 if no more."""
    function Next()::Int
        return Lib.Meters_Get_Next()
    end

    """(read-only) Number of branches (lines) in this section"""
    function NumSectionBranches()::Int
        return Lib.Meters_Get_NumSectionBranches()
    end

    """(read-only) Number of Customers in the active section."""
    function NumSectionCustomers()::Int
        return Lib.Meters_Get_NumSectionCustomers()
    end

    """(read-only) Number of feeder sections in this meter's zone"""
    function NumSections()::Int
        return Lib.Meters_Get_NumSections()
    end

    """(read-only) Type of OCP device. 1=Fuse; 2=Recloser; 3=Relay"""
    function OCPDeviceType()::Int
        # TODO: use enum here?
        return Lib.Meters_Get_OCPDeviceType()
    end

    """Array of doubles to set values of Peak Current property"""
    function PeakCurrent()::Vector{Float64}
        return get_float64_array(Lib.Meters_Get_Peakcurrent)
    end

    """Array of doubles to set values of Peak Current property"""
    function PeakCurrent(Value::Vector{Float64})
        @error "Not implemented yet. Please contact the developer."
        # TODO: prepare_float64_array
        Value, ValuePtr, ValueCount = prepare_float64_array(Value)
        Lib.Meters_Set_Peakcurrent(ValuePtr, ValueCount)
    end

    """(read-only) Array of strings containing the names of the registers."""
    function RegisterNames()::Vector{String}
        return get_string_array(Lib.Meters_Get_RegisterNames)
    end

    """(read-only) Array of all the values contained in the Meter registers for the active Meter."""
    function RegisterValues()::Vector{Float64}
        return get_float64_array(Lib.Meters_Get_RegisterValues)
    end

    """(read-only) SAIDI for this meter's zone. Execute DoReliabilityCalc first."""
    function SAIDI()::Float64
        return Lib.Meters_Get_SAIDI()
    end

    """(read-only) Returns SAIFI for this meter's Zone. Execute Reliability Calc method first."""
    function SAIFI()::Float64
        return Lib.Meters_Get_SAIFI()
    end

    """(read-only) SAIFI based on kW rather than number of customers. Get after reliability calcs."""
    function SAIFIkW()::Float64
        return Lib.Meters_Get_SAIFIKW()
    end

    """(read-only) SequenceIndex of the branch at the head of this section"""
    function SectSeqidx()::Int
        return Lib.Meters_Get_SectSeqIdx()
    end

    """(read-only) Total Customers downline from this section"""
    function SectTotalCust()::Int
        return Lib.Meters_Get_SectTotalCust()
    end

    """(read-only) Size of Sequence List"""
    function SeqListSize()::Int
        return Lib.Meters_Get_SeqListSize()
    end

    """Get/set Index into Meter's SequenceList that contains branch pointers in lexical order. Earlier index guaranteed to be upline from later index. Sets PDelement active."""
    function SequenceList()::Int
        return Lib.Meters_Get_SequenceIndex()
    end

    """Get/set Index into Meter's SequenceList that contains branch pointers in lexical order. Earlier index guaranteed to be upline from later index. Sets PDelement active."""
    function SequenceList(Value::Int)
        Lib.Meters_Set_SequenceIndex(Value)
    end

    """(read-only) Sum of the branch fault rates in this section of the meter's zone"""
    function SumBranchFltRates()::Float64
        return Lib.Meters_Get_SumBranchFltRates()
    end

    """(read-only) Total Number of customers in this zone (downline from the EnergyMeter)"""
    function TotalCustomers()::Int
        return Lib.Meters_Get_TotalCustomers()
    end

    """(read-only) Totals of all registers of all meters"""
    function Totals()::Vector{Float64}
        return get_float64_array(Lib.Meters_Get_Totals)
    end

end

