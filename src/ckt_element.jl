module CktElement

    using ..Lib
    using ..Utils

    function Close(Term::Int, Phs::Int)
        Lib.CktElement_Close(Term, Phs)
    end

    """(read-only) Full name of the i-th controller attached to this element. Ex: str = Controller(2).  See NumControls to determine valid index range"""
    function Controller(idx::Int)::String
        return get_string(Lib.CktElement_Get_Controller(idx))
    end

    """(read-only) For PCElement, get the value of a variable by name. If Code>0 Then no variable by this name or not a PCelement."""
    function Variable(MyVarName::String, Code::Int)::Float64
        return Lib.CktElement_Get_Variable(MyVarName, Code)
    end

    """(read-only) For PCElement, get the value of a variable by integer index."""
    function Variablei(Idx::Int, Code::Int)::Float64
        return Lib.CktElement_Get_Variablei(Int32(Idx), Ref{Int32}(Code))
    end

    function IsOpen(Term::Int, Phs::Int)::Bool
        return Lib.CktElement_IsOpen(Term, Phs) != 0
    end

    function Open(Term::Int, Phs::Int)
        Lib.CktElement_Open(Term, Phs)
    end

    """(read-only) Array containing all property names of the active device."""
    function AllPropertyNames()::Vector{String}
        return get_string_array(Lib.CktElement_Get_AllPropertyNames)
    end

    """(read-only) Array of strings listing all the published variable names, if a PCElement. Otherwise, null string."""
    function AllVariableNames()::Vector{String}
        return get_string_array(Lib.CktElement_Get_AllVariableNames)
    end

    """(read-only) Array of doubles. Values of state variables of active element if PC element."""
    function AllVariableValues()::Vector{Float64}
        return get_float64_array(Lib.CktElement_Get_AllVariableValues)
    end

    """
    (read) Array of strings. Get  Bus definitions to which each terminal is connected. 0-based array.
    (write) Array of strings. Set Bus definitions for each terminal is connected.
    """
    function BusNames()::Vector{String}
        return get_string_array(Lib.CktElement_Get_BusNames)
    end

    """
    (read) Array of strings. Get  Bus definitions to which each terminal is connected. 0-based array.
    (write) Array of strings. Set Bus definitions for each terminal is connected.
    """
    function BusNames(Value::Vector{String})
        Value, ValuePtr, ValueCount = prepare_string_array(Value)
        Lib.CktElement_Set_BusNames(ValuePtr, ValueCount)
    end

    """(read-only) Complex double array of Sequence Currents for all conductors of all terminals of active circuit element."""
    function CplxSeqCurrents()::Vector{ComplexF64}
        return get_complex64_array(Lib.CktElement_Get_CplxSeqCurrents)
    end

    """(read-only) Complex double array of Sequence Voltage for all terminals of active circuit element."""
    function CplxSeqVoltages()::Vector{ComplexF64}
        return get_complex64_array(Lib.CktElement_Get_CplxSeqVoltages)
    end

    """(read-only) Complex array of currents into each conductor of each terminal"""
    function Currents()::Vector{ComplexF64}
        return get_complex64_array(Lib.CktElement_Get_Currents)
    end

    """(read-only) Currents in magnitude, angle format as a array of doubles."""
    function CurrentsMagAng()::Array{Float64, 2}
        r = get_float64_array(Lib.CktElement_Get_CurrentsMagAng)
        return reshape(r, (2, Int(length(r)/2)))
    end

    """Display name of the object (not necessarily unique) (Getter)"""
    function DisplayName()::String
        return get_string(Lib.CktElement_Get_DisplayName())
    end

    """Display name of the object (not necessarily unique) (Setter)"""
    function DisplayName(Value::String)
        Lib.CktElement_Set_DisplayName(Cstring(pointer(Value)))
    end

    """
    (read) Emergency Ampere Rating for PD elements
    (write) Emergency Ampere Rating
    """
    function EmergAmps()::Float64
        return Lib.CktElement_Get_EmergAmps()
    end

    """
    (read) Emergency Ampere Rating for PD elements
    (write) Emergency Ampere Rating
    """
    function EmergAmps(Value::Float64)
        Lib.CktElement_Set_EmergAmps(Value)
    end

    """Boolean indicating that element is currently in the circuit."""
    function Enabled()::Bool
        return Lib.CktElement_Get_Enabled() != 0
    end

    """Boolean indicating that element is currently in the circuit."""
    function Enabled(Value::Bool)
        Lib.CktElement_Set_Enabled(Value ? 1 : 0)
    end

    """(read-only) Name of the Energy Meter this element is assigned to."""
    function EnergyMeter()::String
        return get_string(Lib.CktElement_Get_EnergyMeter())
    end

    """(read-only) globally unique identifier for this object"""
    function GUID()::String
        return get_string(Lib.CktElement_Get_GUID())
    end

    """(read-only) Pointer to this object"""
    function Handle()::Int
        return Lib.CktElement_Get_Handle()
    end

    """(read-only) True if a recloser, relay, or fuse controlling this ckt element. OCP = Overcurrent Protection """
    function HasOCPDevice()::Bool
        return Lib.CktElement_Get_HasOCPDevice() != 0
    end

    """(read-only) This element has a SwtControl attached."""
    function HasSwitchControl()::Bool
        return Lib.CktElement_Get_HasSwitchControl() != 0
    end

    """(read-only) This element has a CapControl or RegControl attached."""
    function HasVoltControl()::Bool
        return Lib.CktElement_Get_HasVoltControl() != 0
    end

    """(read-only) Total losses in the element: two-element complex array"""
    function Losses()::Vector{ComplexF64}
        return get_complex64_array(Lib.CktElement_Get_Losses)
    end

    """(read-only) Full Name of Active Circuit Element"""
    function Name()::String
        return get_string(Lib.CktElement_Get_Name())
    end

    """(read-only) Array of integer containing the node numbers (representing phases, for example) for each conductor of each terminal. """
    function NodeOrder()::Vector{Int}
        return get_int32_array(Lib.CktElement_Get_NodeOrder)
    end

    """
    (read) Normal ampere rating for PD Elements
    (write) Normal ampere rating
    """
    function NormalAmps()::Float64
        return Lib.CktElement_Get_NormalAmps()
    end

    """
    (read) Normal ampere rating for PD Elements
    (write) Normal ampere rating
    """
    function NormalAmps(Value::Float64)
        Lib.CktElement_Set_NormalAmps(Value)
    end

    """(read-only) Number of Conductors per Terminal"""
    function NumConductors()::Int
        return Lib.CktElement_Get_NumConductors()
    end

    """(read-only) Number of controls connected to this device. Use to determine valid range for index into Controller array."""
    function NumControls()::Int
        return Lib.CktElement_Get_NumControls()
    end

    """(read-only) Number of Phases"""
    function NumPhases()::Int
        return Lib.CktElement_Get_NumPhases()
    end

    """(read-only) Number of Properties this Circuit Element."""
    function NumProperties()::Int
        return Lib.CktElement_Get_NumProperties()
    end

    """(read-only) Number of Terminals this Circuit Element"""
    function NumTerminals()::Int
        return Lib.CktElement_Get_NumTerminals()
    end

    """(read-only) Index into Controller list of OCP Device controlling this CktElement"""
    function OCPDevIndex()::Int
        return Lib.CktElement_Get_OCPDevIndex()
    end

    """(read-only) 0=None; 1=Fuse; 2=Recloser; 3=Relay;  Type of OCP controller device"""
    function OCPDevType()::Int
        return Lib.CktElement_Get_OCPDevType()
    end

    """(read-only) Complex array of losses by phase"""
    function PhaseLosses()::Vector{ComplexF64}
        return get_complex64_array(Lib.CktElement_Get_PhaseLosses)
    end

    """(read-only) Complex array of powers into each conductor of each terminal"""
    function Powers()::Vector{ComplexF64}
        return get_complex64_array(Lib.CktElement_Get_Powers)
    end

    """(read-only) Residual currents for each terminal: (mag, angle)"""
    function Residuals()::Array{Float64, 2}
        r = get_float64_array(Lib.CktElement_Get_Residuals)
        return reshape(r, (2, Int(length(r)/2)))
    end

    """(read-only) Double array of symmetrical component currents into each 3-phase terminal"""
    function SeqCurrents()::Vector{Float64}
        return get_float64_array(Lib.CktElement_Get_SeqCurrents)
    end

    """(read-only) Double array of sequence powers into each 3-phase teminal"""
    function SeqPowers()::Vector{ComplexF64}
        return get_complex64_array(Lib.CktElement_Get_SeqPowers)
    end

    """(read-only) Double array of symmetrical component voltages at each 3-phase terminal"""
    function SeqVoltages()::Vector{Float64}
        return get_float64_array(Lib.CktElement_Get_SeqVoltages)
    end

    """(read-only) Complex array of voltages at terminals"""
    function Voltages()::Vector{ComplexF64}
        return get_complex64_array(Lib.CktElement_Get_Voltages)
    end

    """(read-only) Voltages at each conductor in magnitude, angle form as array of doubles."""
    function VoltagesMagAng()::Array{Float64, 2}
        r = get_float64_array(Lib.CktElement_Get_VoltagesMagAng)
        return reshape(r, (2, Int(length(r)/2)))
    end

    """(read-only) YPrim matrix, column order, complex numbers (paired)"""
    function YPrim()::Array{ComplexF64, 2}
        r = get_complex64_array(Lib.CktElement_Get_Yprim)
        # TODO: should we transpose here?
        return reshape(r, (Int(length(r)/2), Int(length(r)/2)))
    end

end

