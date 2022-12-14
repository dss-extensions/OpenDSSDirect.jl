module Circuit

    using ..Lib
    using ..Utils

    """Compute capacity"""
    function Capacity(Start, Increment)::Float64
        return @checked Lib.Circuit_Capacity(C_NULL_CTX, Start, Increment)
    end

    """Disable circuit"""
    function Disable(Name::String)
        @checked Lib.Circuit_Disable(C_NULL_CTX, Cstring(pointer(Name)))
    end

    """Enable circuit"""
    function Enable(Name::String)
        @checked Lib.Circuit_Enable(C_NULL_CTX, Cstring(pointer(Name)))
    end

    """Do end of time step update and cleanup"""
    function EndOfTimeStepUpdate()
        @checked Lib.Circuit_EndOfTimeStepUpdate(C_NULL_CTX)
    end

    """Set first element in active class to be active"""
    function FirstElement()::Int
        return @checked Lib.Circuit_FirstElement(C_NULL_CTX)
    end

    """Set first PCElement to be active"""
    function FirstPCElement()::Int
        return @checked Lib.Circuit_FirstPCElement(C_NULL_CTX)
    end

    """Set first PDElement to be active"""
    function FirstPDElement()::Int
        return @checked Lib.Circuit_FirstPDElement(C_NULL_CTX)
    end

    """Returns an array of doubles representing the distances to parent EnergyMeter. Sequence of array corresponds to other node ByPhase properties."""
    function AllNodeDistancesByPhase(Phase::Int)::Vector{Float64}
        return get_float64_array(Lib.Circuit_Get_AllNodeDistancesByPhase, C_NULL_CTX, Phase)
    end

    """Return array of strings of the node names for the By Phase criteria. Sequence corresponds to other ByPhase properties."""
    function AllNodeNamesByPhase(Phase::Int)::Vector{String}
        return get_string_array(Lib.Circuit_Get_AllNodeNamesByPhase, C_NULL_CTX, Phase)
    end

    """Returns Array of doubles represent voltage magnitudes for nodes on the specified phase."""
    function AllNodeVmagByPhase(Phase::Int)::Vector{Float64}
        return get_float64_array(Lib.Circuit_Get_AllNodeVmagByPhase, C_NULL_CTX, Phase)
    end

    """Returns array of per unit voltage magnitudes for each node by phase"""
    function AllNodeVmagPUByPhase(Phase::Int)::Vector{Float64}
        return get_float64_array(Lib.Circuit_Get_AllNodeVmagPUByPhase, C_NULL_CTX, Phase)
    end

    """Set next element in active class to be active"""
    function NextElement()::Int
        return @checked Lib.Circuit_NextElement(C_NULL_CTX)
    end

    """Set next PCElement to be active"""
    function NextPCElement()::Int
        return @checked Lib.Circuit_NextPCElement(C_NULL_CTX)
    end

    """Set next PDElement to be active"""
    function NextPDElement()::Int
        return @checked Lib.Circuit_NextPDElement(C_NULL_CTX)
    end

    """Sample all meters and monitors"""
    function Sample()
        @checked Lib.Circuit_Sample(C_NULL_CTX)
    end

    """Save all all meters and monitors registers and buffers"""
    function SaveSample()
        @checked Lib.Circuit_SaveSample(C_NULL_CTX)
    end

    """Set active bus name"""
    function SetActiveBus(BusName::String)::Int
        return @checked Lib.Circuit_SetActiveBus(C_NULL_CTX, Cstring(pointer(BusName)))
    end

    """Set active bus index"""
    function SetActiveBusi(BusIndex::Int)::Int
        return @checked Lib.Circuit_SetActiveBusi(C_NULL_CTX, BusIndex)
    end

    """Set active class name"""
    function SetActiveClass(ClassName::String)::Int
        return @checked Lib.Circuit_SetActiveClass(C_NULL_CTX, Cstring(pointer(ClassName)))
    end

    """Set active element full name"""
    function SetActiveElement(FullName::String)::Int
        return @checked Lib.Circuit_SetActiveElement(C_NULL_CTX, Cstring(pointer(FullName)))
    end

    """Update storage"""
    function UpdateStorage()
        @checked Lib.Circuit_UpdateStorage(C_NULL_CTX)
    end

    """Returns distance from each bus to parent EnergyMeter. Corresponds to sequence in AllBusNames."""
    function AllBusDistances()::Vector{Float64}
        return get_float64_array(Lib.Circuit_Get_AllBusDistances, C_NULL_CTX)
    end

    """Array of strings containing names of all buses in circuit (see AllNodeNames)."""
    function AllBusNames()::Vector{String}
        return get_string_array(Lib.Circuit_Get_AllBusNames, C_NULL_CTX)
    end

    """Array of magnitudes (doubles) of voltages at all buses"""
    function AllBusVMag()::Vector{Float64}
        return get_float64_array(Lib.Circuit_Get_AllBusVmag, C_NULL_CTX)
    end

    """Double Array of all bus voltages (each node) magnitudes in Per unit"""
    function AllBusMagPu()::Vector{Float64}
        return get_float64_array(Lib.Circuit_Get_AllBusVmagPu, C_NULL_CTX)
    end

    """Complex array of all bus, node voltages from most recent solution"""
    function AllBusVolts()::Vector{ComplexF64}
        return get_complex64_array(Lib.Circuit_Get_AllBusVolts, C_NULL_CTX)
    end

    """Array of total losses (complex) in each circuit element"""
    function AllElementLosses()::Vector{Float64}
        return get_float64_array(Lib.Circuit_Get_AllElementLosses, C_NULL_CTX)
    end

    """Array of strings containing Full Name of all elements."""
    function AllElementNames()::Vector{String}
        return get_string_array(Lib.Circuit_Get_AllElementNames, C_NULL_CTX)
    end

    """Returns an array of distances from parent EnergyMeter for each Node. Corresponds to AllBusVMag sequence."""
    function AllNodeDistances()::Vector{Float64}
        return get_float64_array(Lib.Circuit_Get_AllNodeDistances, C_NULL_CTX)
    end

    """Array of strings containing full name of each node in system in same order as returned by AllBusVolts, etc."""
    function AllNodeNames()::Vector{String}
        return get_string_array(Lib.Circuit_Get_AllNodeNames, C_NULL_CTX)
    end

    """Complex total line losses in the circuit"""
    function LineLosses()::Complex
        return get_complex64(Lib.Circuit_Get_LineLosses, C_NULL_CTX)
    end

    """Total losses in active circuit, complex number (two-element array of double)."""
    function Losses()::Complex
        return get_complex64(Lib.Circuit_Get_Losses, C_NULL_CTX)
    end

    """Name of the active circuit."""
    function Name()::String
        return get_string(@checked Lib.Circuit_Get_Name(C_NULL_CTX))
    end

    """Total number of Buses in the circuit."""
    function NumBuses()::Int
        return @checked Lib.Circuit_Get_NumBuses(C_NULL_CTX)
    end

    """Number of CktElements in the circuit."""
    function NumCktElements()::Int
        return @checked Lib.Circuit_Get_NumCktElements(C_NULL_CTX)
    end

    """Total number of nodes in the circuit."""
    function NumNodes()::Int
        return @checked Lib.Circuit_Get_NumNodes(C_NULL_CTX)
    end

    """Sets Parent PD element, if any, to be the active circuit element and returns index>0; Returns 0 if it fails or not applicable."""
    function ParentPDElement()::Int
        return @checked Lib.Circuit_Get_ParentPDElement(C_NULL_CTX)
    end

    """Complex losses in all transformers designated to substations."""
    function SubstationLosses()::Complex
        return get_complex64(Lib.Circuit_Get_SubstationLosses, C_NULL_CTX)
    end

    """System Y matrix (after a solution has been performed)"""
    function SystemY()::Matrix{ComplexF64}
        r = get_float64_array(Lib.Circuit_Get_SystemY, C_NULL_CTX)
        r = Array(reinterpret(ComplexF64, r))
        return reshape(r, (Int(sqrt(length(r))), Int(sqrt(length(r)))))
    end

    """Total power, watts delivered to the circuit"""
    function TotalPower()::Complex
        return get_complex64(Lib.Circuit_Get_TotalPower, C_NULL_CTX)
    end

    """Array of doubles containing complex injection currents for the present solution. Is is the "I" vector of I=YV"""
    function YCurrents()::Vector{ComplexF64}
        return get_complex64_array(Lib.Circuit_Get_YCurrents, C_NULL_CTX)
    end

    """Array of strings containing the names of the nodes in the same order as the Y matrix"""
    function YNodeOrder()::Vector{String}
        return get_string_array(Lib.Circuit_Get_YNodeOrder, C_NULL_CTX)
    end

    """Complex array of actual node voltages in same order as SystemY matrix."""
    function YNodeVArray()::Vector{ComplexF64}
        return get_complex64_array(Lib.Circuit_Get_YNodeVarray, C_NULL_CTX)
    end

    """Activates a circuit element by the given index"""
    function SetCktElement(Idx::Int)
        @checked Lib.Circuit_SetCktElementIndex(C_NULL_CTX, Idx)
    end

    """Activates a circuit element by the given name"""
    function SetCktElement(Name::String)
        @checked Lib.Circuit_SetCktElementName(C_NULL_CTX, Name)
    end

    """Array of total losses (complex) in a selection of elements.
    Use the element indices (starting at 1) as parameter.
    
    (API Extension)"""
    function ElementLosses(Idx::Vector{Int32})::Vector{ComplexF64}
        value, value_ptr, value_cnt = prepare_int32_array(Idx)
        return get_complex64_array(Lib.Circuit_Get_ElementLosses, C_NULL_CTX, value_ptr, value_cnt)
    end    

end
