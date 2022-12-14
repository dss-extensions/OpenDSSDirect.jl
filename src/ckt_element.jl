module CktElement

using DocStringExtensions

using ..Lib
using ..Utils

@template (FUNCTIONS, METHODS) = """
                                 $(TYPEDSIGNATURES)
                                 $(DOCSTRING)
                                 """

"""Close phase of terminal for active circuit element"""
function Close(Term::Int, Phs::Int)
    @checked Lib.CktElement_Close(C_NULL_CTX, Term, Phs)
end

"""Full name of the i-th controller attached to this element. Ex: str = Controller(2).  See NumControls to determine valid index range"""
function Controller(idx::Int)::String
    return get_string(Lib.CktElement_Get_Controller(C_NULL_CTX, idx))
end

"""For PCElement, get the value of a variable by name. (Getter)"""
function Variable(MyVarName::String, Unused::Int)::Float64
    Code = Ref{Int32}(-1)
    result = @checked Lib.CktElement_Get_Variable(C_NULL_CTX, MyVarName, Code)
    if Code[] != 0
        throw(
            OpenDSSDirectException(
                "[ERROR] '$MyVarName' is not a valid variable name or the current object is not a PCElement."
            )
        )
    end
    return result
end

"""For PCElement, set the value of a variable by name. (Setter)"""
function Variable(MyVarName::String, Unused::Int, Value::Float64)
    Code = Ref{Int32}(-1)
    @checked Lib.CktElement_Set_Variable(C_NULL_CTX, MyVarName, Code, Value)
    if Code[] != 0
        throw(
            OpenDSSDirectException(
                "[ERROR] '$MyVarName' is not a valid variable name or the current object is not a PCElement."
            )
        )
    end
end

"""For PCElement, get the value of a variable by integer index. (Getter)"""
function Variablei(Idx::Int, Unused::Int)::Float64
    Code = Ref{Int32}(-1)
    result = @checked Lib.CktElement_Get_Variablei(C_NULL_CTX, Idx, Code)
    if Code[] != 0
        throw(
            OpenDSSDirectException(
                "[ERROR] $Idx is not a valid variable index or the current object is not a PCElement."
            )
        )
    end
    return result
end

"""For PCElement, set the value of a variable by integer index. (Setter)"""
function Variablei(Idx::Int, Unused::Int, Value::Float64)
    Code = Ref{Int32}(-1)
    @checked Lib.CktElement_Set_Variablei(C_NULL_CTX, Idx, Code, Value)
    if Code[] != 0
        throw(
            OpenDSSDirectException(
                "[ERROR] $Idx is not a valid variable index or the current object is not a PCElement."
            )
        )
    end
end

"""Check if open phase of terminal for active circuit element"""
function IsOpen(Term::Int, Phs::Int)::Bool
    return @checked(Lib.CktElement_IsOpen(C_NULL_CTX, Term, Phs)) != 0
end

"""Open phase of terminal for active circuit element"""
function Open(Term::Int, Phs::Int)
    @checked Lib.CktElement_Open(C_NULL_CTX, Term, Phs)
end

"""Array containing all property names of the active device."""
function AllPropertyNames()::Vector{String}
    return get_string_array(Lib.CktElement_Get_AllPropertyNames, C_NULL_CTX)
end

"""Array of strings listing all the published variable names, if a PCElement. Otherwise, null string."""
function AllVariableNames()::Vector{String}
    return get_string_array(Lib.CktElement_Get_AllVariableNames, C_NULL_CTX)
end

"""Array of doubles. Values of state variables of active element if PC element."""
function AllVariableValues()::Vector{Float64}
    return get_float64_array(Lib.CktElement_Get_AllVariableValues, C_NULL_CTX)
end

"""
Array of strings. Get Bus definitions to which each terminal is connected. 0-based array.
"""
function BusNames()::Vector{String}
    return get_string_array(Lib.CktElement_Get_BusNames, C_NULL_CTX)
end

"""
Array of strings. Set Bus definitions for each terminal is connected.
"""
function BusNames(Value::Vector{String})
    Value, ValuePtr, ValueCount = prepare_string_array(Value)
    @checked Lib.CktElement_Set_BusNames(C_NULL_CTX, ValuePtr, ValueCount)
end

"""Complex double array of Sequence Currents for all conductors of all terminals of active circuit element."""
function CplxSeqCurrents()::Vector{ComplexF64}
    return get_complex64_array(Lib.CktElement_Get_CplxSeqCurrents, C_NULL_CTX)
end

"""Complex double array of Sequence Voltage for all terminals of active circuit element."""
function CplxSeqVoltages()::Vector{ComplexF64}
    return get_complex64_array(Lib.CktElement_Get_CplxSeqVoltages, C_NULL_CTX)
end

"""Complex array of currents into each conductor of each terminal"""
function Currents()::Vector{ComplexF64}
    return get_complex64_array(Lib.CktElement_Get_Currents, C_NULL_CTX)
end

"""Currents in magnitude, angle format as a array of doubles."""
function CurrentsMagAng()::Array{Float64,2}
    r = get_float64_array(Lib.CktElement_Get_CurrentsMagAng, C_NULL_CTX)
    return reshape(r, (2, Int(length(r) / 2)))
end

"""Display name of the object (not necessarily unique) (Getter)"""
function DisplayName()::String
    return get_string(Lib.CktElement_Get_DisplayName(C_NULL_CTX))
end

"""Display name of the object (not necessarily unique) (Setter)"""
function DisplayName(Value::String)
    @checked Lib.CktElement_Set_DisplayName(C_NULL_CTX, Cstring(pointer(Value)))
end

"""Emergency Ampere Rating for PD elements (Getter)"""
function EmergAmps()::Float64
    return @checked Lib.CktElement_Get_EmergAmps(C_NULL_CTX)
end

"""Emergency Ampere Rating for PD elements (Setter)"""
function EmergAmps(Value::Float64)
    @checked Lib.CktElement_Set_EmergAmps(C_NULL_CTX, Value)
end

"""Boolean indicating that element is currently in the circuit. (Getter)"""
function Enabled()::Bool
    return @checked(Lib.CktElement_Get_Enabled(C_NULL_CTX)) != 0
end

"""Boolean indicating that element is currently in the circuit. (Setter)"""
function Enabled(Value::Bool)
    @checked Lib.CktElement_Set_Enabled(C_NULL_CTX, Value ? 1 : 0)
end

"""Name of the Energy Meter this element is assigned to."""
function EnergyMeter()::String
    return get_string(Lib.CktElement_Get_EnergyMeter(C_NULL_CTX))
end

"""globally unique identifier for this object"""
function GUID()::String
    return get_string(Lib.CktElement_Get_GUID(C_NULL_CTX))
end

"""Pointer to this object"""
function Handle()::Int
    return @checked Lib.CktElement_Get_Handle(C_NULL_CTX)
end

"""True if a recloser, relay, or fuse controlling this ckt element. OCP = Overcurrent Protection """
function HasOCPDevice()::Bool
    return @checked(Lib.CktElement_Get_HasOCPDevice(C_NULL_CTX)) != 0
end

"""This element has a SwtControl attached."""
function HasSwitchControl()::Bool
    return @checked(Lib.CktElement_Get_HasSwitchControl(C_NULL_CTX)) != 0
end

"""This element has a CapControl or RegControl attached."""
function HasVoltControl()::Bool
    return @checked(Lib.CktElement_Get_HasVoltControl(C_NULL_CTX)) != 0
end

"""Total losses in the element: two-element complex array"""
function Losses()::Vector{ComplexF64}
    return get_complex64_array(Lib.CktElement_Get_Losses, C_NULL_CTX)
end

"""Full Name of Active Circuit Element"""
function Name()::String
    return get_string(Lib.CktElement_Get_Name(C_NULL_CTX))
end

"""Array of integer containing the node numbers (representing phases, for example) for each conductor of each terminal. """
function NodeOrder()::Vector{Int}
    return get_int32_array(Lib.CktElement_Get_NodeOrder, C_NULL_CTX)
end

"""Normal ampere rating for PD Elements (Getter)"""
function NormalAmps()::Float64
    return @checked Lib.CktElement_Get_NormalAmps(C_NULL_CTX)
end

"""Normal ampere rating for PD Elements (Setter)"""
function NormalAmps(Value::Float64)
    @checked Lib.CktElement_Set_NormalAmps(C_NULL_CTX, Value)
end

"""Number of Conductors per Terminal"""
function NumConductors()::Int
    return @checked Lib.CktElement_Get_NumConductors(C_NULL_CTX)
end

"""Number of controls connected to this device. Use to determine valid range for index into Controller array."""
function NumControls()::Int
    return @checked Lib.CktElement_Get_NumControls(C_NULL_CTX)
end

"""Number of Phases"""
function NumPhases()::Int
    return @checked Lib.CktElement_Get_NumPhases(C_NULL_CTX)
end

"""Number of Properties this Circuit Element."""
function NumProperties()::Int
    return @checked Lib.CktElement_Get_NumProperties(C_NULL_CTX)
end

"""Number of Terminals this Circuit Element"""
function NumTerminals()::Int
    return @checked Lib.CktElement_Get_NumTerminals(C_NULL_CTX)
end

"""Index into Controller list of OCP Device controlling this CktElement"""
function OCPDevIndex()::Int
    return @checked Lib.CktElement_Get_OCPDevIndex(C_NULL_CTX)
end

"""0=None; 1=Fuse; 2=Recloser; 3=Relay;  Type of OCP controller device"""
function OCPDevType()::Int
    return @checked Lib.CktElement_Get_OCPDevType(C_NULL_CTX)
end

"""Complex array of losses by phase"""
function PhaseLosses()::Vector{ComplexF64}
    return get_complex64_array(Lib.CktElement_Get_PhaseLosses, C_NULL_CTX)
end

"""Complex array of powers into each conductor of each terminal"""
function Powers()::Vector{ComplexF64}
    return get_complex64_array(Lib.CktElement_Get_Powers, C_NULL_CTX)
end

"""Residual currents for each terminal: (mag, angle)"""
function Residuals()::Array{Float64,2}
    r = get_float64_array(Lib.CktElement_Get_Residuals, C_NULL_CTX)
    return reshape(r, (2, Int(length(r) / 2)))
end

"""Double array of symmetrical component currents into each 3-phase terminal"""
function SeqCurrents()::Vector{Float64}
    return get_float64_array(Lib.CktElement_Get_SeqCurrents, C_NULL_CTX)
end

"""Double array of sequence powers into each 3-phase teminal"""
function SeqPowers()::Vector{ComplexF64}
    return get_complex64_array(Lib.CktElement_Get_SeqPowers, C_NULL_CTX)
end

"""Double array of symmetrical component voltages at each 3-phase terminal"""
function SeqVoltages()::Vector{Float64}
    return get_float64_array(Lib.CktElement_Get_SeqVoltages, C_NULL_CTX)
end

"""Returns the total powers (complex) at ALL terminals of the active circuit element."""
function TotalPowers()::Vector{ComplexF64}
    return get_complex64_array(Lib.CktElement_Get_TotalPowers, C_NULL_CTX)
end

"""Complex array of voltages at terminals"""
function Voltages()::Vector{ComplexF64}
    return get_complex64_array(Lib.CktElement_Get_Voltages, C_NULL_CTX)
end

"""Voltages at each conductor in magnitude, angle form as array of doubles."""
function VoltagesMagAng()::Array{Float64,2}
    r = get_float64_array(Lib.CktElement_Get_VoltagesMagAng, C_NULL_CTX)
    return reshape(r, (2, Int(length(r) / 2)))
end

"""YPrim matrix, column order, complex numbers (paired)"""
function YPrim()::Array{ComplexF64,2}
    r = get_complex64_array(Lib.CktElement_Get_Yprim, C_NULL_CTX)
        # TODO: should we transpose here?
    return reshape(r, (Int(sqrt(length(r))), Int(sqrt(length(r)))))
end

"""Returns true if the current active element is isolated.
Note that this only fetches the current value. See also the Topology interface."""
function IsIsolated()::Bool
    return (@checked Lib.CktElement_Get_IsIsolated(C_NULL_CTX)) != 0
end

"""Array of integers, a copy of the internal NodeRef of the CktElement.

(API Extension)"""
function NodeRef()::Vector{Int}
    return get_int32_array(Lib.CktElement_Get_NodeRef, C_NULL_CTX)
end

end
