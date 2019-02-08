module Circuit

    using ..Lib
    using ..Utils
    import ..TypedDocStringExtensions

    TypedDocStringExtensions.@template (FUNCTIONS, METHODS) =
        """
        $(TypedDocStringExtensions.FULLSIGNATURES)
        $(TypedDocStringExtensions.DOCSTRING)
        """

    """Compute capacity"""
    function Capacity(Start, Increment)::Float64
        return Lib.Circuit_Capacity(Start, Increment)
    end

    """Disable circuit"""
    function Disable(Name::String)
        Lib.Circuit_Disable(Cstring(pointer(Name)))
    end

    """Enable circuit"""
    function Enable(Name::String)
        Lib.Circuit_Enable(Cstring(pointer(Name)))
    end

    """Do end of time step update and cleanup"""
    function EndOfTimeStepUpdate()
        Lib.Circuit_EndOfTimeStepUpdate()
    end

    """Set first element in active class to be active"""
    function FirstElement()::Int
        return Lib.Circuit_FirstElement()
    end

    """Set first PCElement to be active"""
    function FirstPCElement()::Int
        return Lib.Circuit_FirstPCElement()
    end

    """Set first PDElement to be active"""
    function FirstPDElement()::Int
        return Lib.Circuit_FirstPDElement()
    end

    """Returns an array of doubles representing the distances to parent EnergyMeter. Sequence of array corresponds to other node ByPhase properties."""
    function AllNodeDistancesByPhase(Phase)::Vector{Float64}
        error("Not implemented yet. Please contact the developer.")
        return Utils.get_float64_array(Lib.Circuit_Get_AllNodeDistancesByPhase, Phase)
    end

    """Return array of strings of the node names for the By Phase criteria. Sequence corresponds to other ByPhase properties."""
    function AllNodeNamesByPhase(Phase)::Vector{String}
        error("Not implemented yet. Please contact the developer.")
        return Utils.get_string_array(Lib.Circuit_Get_AllNodeNamesByPhase, Phase)
    end

    """Returns Array of doubles represent voltage magnitudes for nodes on the specified phase."""
    function AllNodeVmagByPhase(Phase)::Vector{Float64}
        error("Not implemented yet. Please contact the developer.")
        return Utils.get_float64_array(Lib.Circuit_Get_AllNodeVmagByPhase, Phase)
    end

    """Returns array of per unit voltage magnitudes for each node by phase"""
    function AllNodeVmagPUByPhase(Phase)::Vector{Float64}
        error("Not implemented yet. Please contact the developer.")
        return Utils.get_float64_array(Lib.Circuit_Get_AllNodeVmagPUByPhase, Phase)
    end

    """Set next element in active class to be active"""
    function NextElement()::Int
        return Lib.Circuit_NextElement()
    end

    """Set next PCElement to be active"""
    function NextPCElement()::Int
        return Lib.Circuit_NextPCElement()
    end

    """Set next PDElement to be active"""
    function NextPDElement()::Int
        return Lib.Circuit_NextPDElement()
    end

    """Sample all meters and monitors"""
    function Sample()
        Lib.Circuit_Sample()
    end

    """Save all all meters and monitors registers and buffers"""
    function SaveSample()
        Lib.Circuit_SaveSample()
    end

    """Set active bus name"""
    function SetActiveBus(BusName::String)::Int
        return Lib.Circuit_SetActiveBus(Cstring(pointer(BusName)))
    end

    """Set active bus index"""
    function SetActiveBusi(BusIndex::Int)::Int
        return Lib.Circuit_SetActiveBusi(BusIndex)
    end

    """Set active class name"""
    function SetActiveClass(ClassName::String)::Int
        return Lib.Circuit_SetActiveClass(Cstring(pointer(ClassName)))
    end

    """Set active element full name"""
    function SetActiveElement(FullName::String)::Int
        return Lib.Circuit_SetActiveElement(Cstring(pointer(FullName)))
    end

    """Update storage"""
    function UpdateStorage()
        Lib.Circuit_UpdateStorage()
    end

    """Returns distance from each bus to parent EnergyMeter. Corresponds to sequence in AllBusNames."""
    function AllBusDistances()::Vector{Float64}
        return Utils.get_float64_array(Lib.Circuit_Get_AllBusDistances)
    end

    """Array of strings containing names of all buses in circuit (see AllNodeNames)."""
    function AllBusNames()::Vector{String}
        return Utils.get_string_array(Lib.Circuit_Get_AllBusNames)
    end

    """Array of magnitudes (doubles) of voltages at all buses"""
    function AllBusVMag()::Vector{Float64}
        return Utils.get_float64_array(Lib.Circuit_Get_AllBusVmag)
    end

    """Double Array of all bus voltages (each node) magnitudes in Per unit"""
    function AllBusMagPu()::Vector{Float64}
        return Utils.get_float64_array(Lib.Circuit_Get_AllBusVmagPu)
    end

    """Complex array of all bus, node voltages from most recent solution"""
    function AllBusVolts()::Vector{ComplexF64}
        return Utils.get_complex64_array(Lib.Circuit_Get_AllBusVolts)
    end

    """Array of total losses (complex) in each circuit element"""
    function AllElementLosses()::Vector{Float64}
        return Utils.get_float64_array(Lib.Circuit_Get_AllElementLosses)
    end

    """Array of strings containing Full Name of all elements."""
    function AllElementNames()::Vector{String}
        return Utils.get_string_array(Lib.Circuit_Get_AllElementNames)
    end

    """Returns an array of distances from parent EnergyMeter for each Node. Corresponds to AllBusVMag sequence."""
    function AllNodeDistances()::Vector{Float64}
        return Utils.get_float64_array(Lib.Circuit_Get_AllNodeDistances)
    end

    """Array of strings containing full name of each node in system in same order as returned by AllBusVolts, etc."""
    function AllNodeNames()::Vector{String}
        return Utils.get_string_array(Lib.Circuit_Get_AllNodeNames)
    end

    """Complex total line losses in the circuit"""
    function LineLosses()::Complex
        return Utils.get_complex64(Lib.Circuit_Get_LineLosses)
    end

    """Total losses in active circuit, complex number (two-element array of double)."""
    function Losses()::Complex
        return Utils.get_complex64(Lib.Circuit_Get_Losses)
    end

    """Name of the active circuit."""
    function Name()::String
        return Utils.get_string(Lib.Circuit_Get_Name())
    end

    """Total number of Buses in the circuit."""
    function NumBuses()::Int
        return Lib.Circuit_Get_NumBuses()
    end

    """Number of CktElements in the circuit."""
    function NumCktElements()::Int
        return Lib.Circuit_Get_NumCktElements()
    end

    """Total number of nodes in the circuit."""
    function NumNodes()::Int
        return Lib.Circuit_Get_NumNodes()
    end

    """Sets Parent PD element, if any, to be the active circuit element and returns index>0; Returns 0 if it fails or not applicable."""
    function ParentPDElement()::Int
        return Lib.Circuit_Get_ParentPDElement()
    end

    """Complex losses in all transformers designated to substations."""
    function SubstationLosses()::Complex
        return Utils.get_complex64(Lib.Circuit_Get_SubstationLosses)
    end

    """System Y matrix (after a solution has been performed)"""
    function SystemY()::Matrix{ComplexF64}
        r = Utils.get_float64_array(Lib.Circuit_Get_SystemY)
        r = Array(reinterpret(ComplexF64, r))
        return reshape(r, (Int(sqrt(length(r))), Int(sqrt(length(r)))))
    end

    """Total power, watts delivered to the circuit"""
    function TotalPower()::Complex
        return Utils.get_complex64(Lib.Circuit_Get_TotalPower)
    end

    """Array of doubles containing complex injection currents for the present solution. Is is the "I" vector of I=YV"""
    function YCurrents()::Vector{ComplexF64}
        return Utils.get_complex64_array(Lib.Circuit_Get_YCurrents)
    end

    """Array of strings containing the names of the nodes in the same order as the Y matrix"""
    function YNodeOrder()::Vector{String}
        return Utils.get_string_array(Lib.Circuit_Get_YNodeOrder)
    end

    """Complex array of actual node voltages in same order as SystemY matrix."""
    function YNodeVArray()::Vector{ComplexF64}
        return Utils.get_complex64_array(Lib.Circuit_Get_YNodeVarray)
    end

end

