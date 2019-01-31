module Circuit

    using ..Lib
    using ..Utils

    function Capacity(Start, Increment)::Float64
        return Lib.Circuit_Capacity(Start, Increment)
    end

    function Disable(Name::String)
        Lib.Circuit_Disable(Cstring(pointer(Name)))
    end

    function Enable(Name::String)
        Lib.Circuit_Enable(Cstring(pointer(Name)))
    end

    function EndOfTimeStepUpdate()
        Lib.Circuit_EndOfTimeStepUpdate()
    end

    function FirstElement()::Int
        return Lib.Circuit_FirstElement()
    end

    function FirstPCElement()::Int
        return Lib.Circuit_FirstPCElement()
    end

    function FirstPDElement()::Int
        return Lib.Circuit_FirstPDElement()
    end

    """(read-only) Returns an array of doubles representing the distances to parent EnergyMeter. Sequence of array corresponds to other node ByPhase properties."""
    function AllNodeDistancesByPhase(Phase)::Vector{Float64}
        return get_float64_array(Lib.Circuit_Get_AllNodeDistancesByPhase, Phase)
    end

    """(read-only) Return array of strings of the node names for the By Phase criteria. Sequence corresponds to other ByPhase properties."""
    function AllNodeNamesByPhase(Phase)::Vector{String}
        return get_string_array(Lib.Circuit_Get_AllNodeNamesByPhase, Phase)
    end

    """(read-only) Returns Array of doubles represent voltage magnitudes for nodes on the specified phase."""
    function AllNodeVmagByPhase(Phase)::Vector{Float64}
        return get_float64_array(Lib.Circuit_Get_AllNodeVmagByPhase, Phase)
    end

    """(read-only) Returns array of per unit voltage magnitudes for each node by phase"""
    function AllNodeVmagPUByPhase(Phase)::Vector{Float64}
        return get_float64_array(Lib.Circuit_Get_AllNodeVmagPUByPhase, Phase)
    end

    function NextElement()::Int
        return Lib.Circuit_NextElement()
    end

    function NextPCElement()::Int
        return Lib.Circuit_NextPCElement()
    end

    function NextPDElement()::Int
        return Lib.Circuit_NextPDElement()
    end

    function Sample()
        Lib.Circuit_Sample()
    end

    function SaveSample()
        Lib.Circuit_SaveSample()
    end

    function SetActiveBus(BusName::String)::Int
        return Lib.Circuit_SetActiveBus(Cstring(pointer(BusName)))
    end

    function SetActiveBusi(BusIndex::Int)::Int
        return Lib.Circuit_SetActiveBusi(BusIndex)
    end

    function SetActiveClass(ClassName::String)::Int
        return Lib.Circuit_SetActiveClass(Cstring(pointer(ClassName)))
    end

    function SetActiveElement(FullName::String)::Int
        return Lib.Circuit_SetActiveElement(Cstring(pointer(FullName)))
    end

    function UpdateStorage()
        Lib.Circuit_UpdateStorage()
    end

    """(read-only) Returns distance from each bus to parent EnergyMeter. Corresponds to sequence in AllBusNames."""
    function AllBusDistances()::Vector{Float64}
        return get_float64_array(Lib.Circuit_Get_AllBusDistances)
    end

    """(read-only) Array of strings containing names of all buses in circuit (see AllNodeNames)."""
    function AllBusNames()::Vector{String}
        return get_string_array(Lib.Circuit_Get_AllBusNames)
    end

    """(read-only) Array of magnitudes (doubles) of voltages at all buses"""
    function AllBusVMag()::Vector{Float64}
        return get_float64_array(Lib.Circuit_Get_AllBusVmag)
    end

    """(read-only) Double Array of all bus voltages (each node) magnitudes in Per unit"""
    function AllBusMagPu()::Vector{Float64}
        return get_float64_array(Lib.Circuit_Get_AllBusVmagPu)
    end

    """(read-only) Complex array of all bus, node voltages from most recent solution"""
    function AllBusVolts()::Vector{ComplexF64}
        return get_complex64_array(Lib.Circuit_Get_AllBusVolts)
    end

    """(read-only) Array of total losses (complex) in each circuit element"""
    function AllElementLosses()::Vector{Float64}
        return get_float64_array(Lib.Circuit_Get_AllElementLosses)
    end

    """(read-only) Array of strings containing Full Name of all elements."""
    function AllElementNames()::Vector{String}
        return get_string_array(Lib.Circuit_Get_AllElementNames)
    end

    """(read-only) Returns an array of distances from parent EnergyMeter for each Node. Corresponds to AllBusVMag sequence."""
    function AllNodeDistances()::Vector{Float64}
        return get_float64_array(Lib.Circuit_Get_AllNodeDistances)
    end

    """(read-only) Array of strings containing full name of each node in system in same order as returned by AllBusVolts, etc."""
    function AllNodeNames()::Vector{String}
        return get_string_array(Lib.Circuit_Get_AllNodeNames)
    end

    """(read-only) Complex total line losses in the circuit"""
    function LineLosses()::Complex
        return get_complex64(Lib.Circuit_Get_LineLosses)
    end

    """(read-only) Total losses in active circuit, complex number (two-element array of double)."""
    function Losses()::Complex
        return get_complex64(Lib.Circuit_Get_Losses)
    end

    """(read-only) Name of the active circuit."""
    function Name()::String
        return get_string(Lib.Circuit_Get_Name())
    end

    """(read-only) Total number of Buses in the circuit."""
    function NumBuses()::Int
        return Lib.Circuit_Get_NumBuses()
    end

    """(read-only) Number of CktElements in the circuit."""
    function NumCktElements()::Int
        return Lib.Circuit_Get_NumCktElements()
    end

    """(read-only) Total number of nodes in the circuit."""
    function NumNodes()::Int
        return Lib.Circuit_Get_NumNodes()
    end

    """(read-only) Sets Parent PD element, if any, to be the active circuit element and returns index>0; Returns 0 if it fails or not applicable."""
    function ParentPDElement()::Int
        return Lib.Circuit_Get_ParentPDElement()
    end

    """(read-only) Complex losses in all transformers designated to substations."""
    function SubstationLosses()::Complex
        return get_complex64(Lib.Circuit_Get_SubstationLosses)
    end

    """(read-only) System Y matrix (after a solution has been performed)"""
    function SystemY()::Vector{Float64}
        return get_float64_array(Lib.Circuit_Get_SystemY)
    end

    """(read-only) Total power, watts delivered to the circuit"""
    function TotalPower()::Complex
        return get_complex64(Lib.Circuit_Get_TotalPower)
    end

    """(read-only) Array of doubles containing complex injection currents for the present solution. Is is the "I" vector of I=YV"""
    function YCurrents()::Vector{ComplexF64}
        return get_complex64_array(Lib.Circuit_Get_YCurrents)
    end

    """(read-only) Array of strings containing the names of the nodes in the same order as the Y matrix"""
    function YNodeOrder()::Vector{String}
        return get_string_array(Lib.Circuit_Get_YNodeOrder)
    end

    """(read-only) Complex array of actual node voltages in same order as SystemY matrix."""
    function YNodeVArray()::Vector{ComplexF64}
        return get_complex64_array(Lib.Circuit_Get_YNodeVarray)
    end

end

