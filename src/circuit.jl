module Circuit

    using ..lib
    using ..utils

    function Capacity(Start, Increment)
        return lib.Circuit_Capacity(Start, Increment)
    end

    function Disable(Name::String)
        lib.Circuit_Disable(Cstring(pointer(Name)))
    end

    function Enable(Name::String)
        lib.Circuit_Enable(Cstring(pointer(Name)))
    end

    function EndOfTimeStepUpdate()
        lib.Circuit_EndOfTimeStepUpdate()
    end

    function FirstElement()
        return lib.Circuit_FirstElement()
    end

    function FirstPCElement()
        return lib.Circuit_FirstPCElement()
    end

    function FirstPDElement()
        return lib.Circuit_FirstPDElement()
    end

    """(read-only) Returns an array of doubles representing the distances to parent EnergyMeter. Sequence of array corresponds to other node ByPhase properties."""
    function AllNodeDistancesByPhase(Phase)
        return get_float64_array(lib.Circuit_Get_AllNodeDistancesByPhase, Phase)
    end

    """(read-only) Return array of strings of the node names for the By Phase criteria. Sequence corresponds to other ByPhase properties."""
    function AllNodeNamesByPhase(Phase)
        return get_string_array(lib.Circuit_Get_AllNodeNamesByPhase, Phase)
    end

    """(read-only) Returns Array of doubles represent voltage magnitudes for nodes on the specified phase."""
    function AllNodeVmagByPhase(Phase)
        return get_float64_array(lib.Circuit_Get_AllNodeVmagByPhase, Phase)
    end

    """(read-only) Returns array of per unit voltage magnitudes for each node by phase"""
    function AllNodeVmagPUByPhase(Phase)
        return get_float64_array(lib.Circuit_Get_AllNodeVmagPUByPhase, Phase)
    end

    function NextElement()
        return lib.Circuit_NextElement()
    end

    function NextPCElement()
        return lib.Circuit_NextPCElement()
    end

    function NextPDElement()
        return lib.Circuit_NextPDElement()
    end

    function Sample()
        lib.Circuit_Sample()
    end

    function SaveSample()
        lib.Circuit_SaveSample()
    end

    function SetActiveBus(BusName::String)
        return lib.Circuit_SetActiveBus(Cstring(pointer(BusName)))
    end

    function SetActiveBusi(BusIndex::Int)
        return lib.Circuit_SetActiveBusi(BusIndex)
    end

    function SetActiveClass(ClassName::String)
        return lib.Circuit_SetActiveClass(Cstring(pointer(ClassName)))
    end

    function SetActiveElement(FullName::String)
        return lib.Circuit_SetActiveElement(Cstring(pointer(FullName)))
    end

    function UpdateStorage()
        lib.Circuit_UpdateStorage()
    end

    """(read-only) Returns distance from each bus to parent EnergyMeter. Corresponds to sequence in AllBusNames."""
    function AllBusDistances()
        return get_float64_array(lib.Circuit_Get_AllBusDistances)
    end

    """(read-only) Array of strings containing names of all buses in circuit (see AllNodeNames)."""
    function AllBusNames()
        return get_string_array(lib.Circuit_Get_AllBusNames)
    end

    """(read-only) Array of magnitudes (doubles) of voltages at all buses"""
    function AllBusVMag()
        return get_float64_array(lib.Circuit_Get_AllBusVmag)
    end

    """(read-only) Double Array of all bus voltages (each node) magnitudes in Per unit"""
    function AllBusMagPu()
        return get_float64_array(lib.Circuit_Get_AllBusVmagPu)
    end

    """(read-only) Complex array of all bus, node voltages from most recent solution"""
    function AllBusVolts()
        return get_complex64_array(lib.Circuit_Get_AllBusVolts)
    end

    """(read-only) Array of total losses (complex) in each circuit element"""
    function AllElementLosses()
        return get_float64_array(lib.Circuit_Get_AllElementLosses)
    end

    """(read-only) Array of strings containing Full Name of all elements."""
    function AllElementNames()
        return get_string_array(lib.Circuit_Get_AllElementNames)
    end

    """(read-only) Returns an array of distances from parent EnergyMeter for each Node. Corresponds to AllBusVMag sequence."""
    function AllNodeDistances()
        return get_float64_array(lib.Circuit_Get_AllNodeDistances)
    end

    """(read-only) Array of strings containing full name of each node in system in same order as returned by AllBusVolts, etc."""
    function AllNodeNames()
        return get_string_array(lib.Circuit_Get_AllNodeNames)
    end

    """(read-only) Complex total line losses in the circuit"""
    function LineLosses()::Complex
        return get_complex64(lib.Circuit_Get_LineLosses)
    end

    """(read-only) Total losses in active circuit, complex number (two-element array of double)."""
    function Losses()::Complex
        return get_complex64(lib.Circuit_Get_Losses)
    end

    """(read-only) Name of the active circuit."""
    function Name()
        return get_string(lib.Circuit_Get_Name())
    end

    """(read-only) Total number of Buses in the circuit."""
    function NumBuses()::Int
        return lib.Circuit_Get_NumBuses()
    end

    """(read-only) Number of CktElements in the circuit."""
    function NumCktElements()::Int
        return lib.Circuit_Get_NumCktElements()
    end

    """(read-only) Total number of nodes in the circuit."""
    function NumNodes()::Int
        return lib.Circuit_Get_NumNodes()
    end

    """(read-only) Sets Parent PD element, if any, to be the active circuit element and returns index>0; Returns 0 if it fails or not applicable."""
    function ParentPDElement()::Int
        return lib.Circuit_Get_ParentPDElement()
    end

    """(read-only) Complex losses in all transformers designated to substations."""
    function SubstationLosses()::Complex
        return get_complex64(lib.Circuit_Get_SubstationLosses)
    end

    """(read-only) System Y matrix (after a solution has been performed)"""
    function SystemY()
        return get_float64_array(lib.Circuit_Get_SystemY)
    end

    """(read-only) Total power, watts delivered to the circuit"""
    function TotalPower()::Complex
        return get_complex64(lib.Circuit_Get_TotalPower)
    end

    """(read-only) Array of doubles containing complex injection currents for the present solution. Is is the "I" vector of I=YV"""
    function YCurrents()
        return get_complex64_array(lib.Circuit_Get_YCurrents)
    end

    """(read-only) Array of strings containing the names of the nodes in the same order as the Y matrix"""
    function YNodeOrder()
        return get_string_array(lib.Circuit_Get_YNodeOrder)
    end

    """(read-only) Complex array of actual node voltages in same order as SystemY matrix."""
    function YNodeVArray()
        return get_complex64_array(lib.Circuit_Get_YNodeVarray)
    end

end

