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
    @checked Lib.CktElement_Close(Term, Phs)
end

"""Full name of the i-th controller attached to this element. Ex: str = Controller(2).  See NumControls to determine valid index range"""
function Controller(idx::Int)::String
    return get_string(Lib.CktElement_Get_Controller(idx))
end

"""For PCElement, get the value of a variable by name. (Getter)"""
function Variable(MyVarName::String, Unused::Int)::Float64
    Code = Ref{Int32}(-1)
    result = @checked Lib.CktElement_Get_Variable(MyVarName, Code)
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
    @checked Lib.CktElement_Set_Variable(MyVarName, Code, Value)
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
    result = @checked Lib.CktElement_Get_Variablei(Idx, Code)
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
    @checked Lib.CktElement_Set_Variablei(Idx, Code, Value)
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
    return @checked(Lib.CktElement_IsOpen(Term, Phs)) != 0
end

"""Open phase of terminal for active circuit element"""
function Open(Term::Int, Phs::Int)
    @checked Lib.CktElement_Open(Term, Phs)
end

"""Array containing all property names of the active device."""
function AllPropertyNames()::Vector{String}
    return get_string_array(Lib.CktElement_Get_AllPropertyNames)
end

"""Array of strings listing all the published variable names, if a PCElement. Otherwise, null string."""
function AllVariableNames()::Vector{String}
    return get_string_array(Lib.CktElement_Get_AllVariableNames)
end

"""Array of doubles. Values of state variables of active element if PC element."""
function AllVariableValues()::Vector{Float64}
    return get_float64_array(Lib.CktElement_Get_AllVariableValues)
end

"""
Array of strings. Get Bus definitions to which each terminal is connected. 0-based array.
"""
function BusNames()::Vector{String}
    return get_string_array(Lib.CktElement_Get_BusNames)
end

"""
Array of strings. Set Bus definitions for each terminal is connected.
"""
function BusNames(Value::Vector{String})
    Value, ValuePtr, ValueCount = prepare_string_array(Value)
    @checked Lib.CktElement_Set_BusNames(ValuePtr, ValueCount)
end

"""Complex double array of Sequence Currents for all conductors of all terminals of active circuit element."""
function CplxSeqCurrents()::Vector{ComplexF64}
    return get_complex64_array(Lib.CktElement_Get_CplxSeqCurrents)
end

"""Complex double array of Sequence Voltage for all terminals of active circuit element."""
function CplxSeqVoltages()::Vector{ComplexF64}
    return get_complex64_array(Lib.CktElement_Get_CplxSeqVoltages)
end

"""Complex array of currents into each conductor of each terminal"""
function Currents()::Vector{ComplexF64}
    return get_complex64_array(Lib.CktElement_Get_Currents)
end

"""Currents in magnitude, angle format as a array of doubles."""
function CurrentsMagAng()::Array{Float64,2}
    r = get_float64_array(Lib.CktElement_Get_CurrentsMagAng)
    return reshape(r, (2, Int(length(r) / 2)))
end

"""Display name of the object (not necessarily unique) (Getter)"""
function DisplayName()::String
    return get_string(Lib.CktElement_Get_DisplayName())
end

"""Display name of the object (not necessarily unique) (Setter)"""
function DisplayName(Value::String)
    @checked Lib.CktElement_Set_DisplayName(Cstring(pointer(Value)))
end

"""Emergency Ampere Rating for PD elements (Getter)"""
function EmergAmps()::Float64
    return @checked Lib.CktElement_Get_EmergAmps()
end

"""Emergency Ampere Rating for PD elements (Setter)"""
function EmergAmps(Value::Float64)
    @checked Lib.CktElement_Set_EmergAmps(Value)
end

"""Boolean indicating that element is currently in the circuit. (Getter)"""
function Enabled()::Bool
    return @checked(Lib.CktElement_Get_Enabled()) != 0
end

"""Boolean indicating that element is currently in the circuit. (Setter)"""
function Enabled(Value::Bool)
    @checked Lib.CktElement_Set_Enabled(Value ? 1 : 0)
end

"""Name of the Energy Meter this element is assigned to."""
function EnergyMeter()::String
    return get_string(Lib.CktElement_Get_EnergyMeter())
end

"""globally unique identifier for this object"""
function GUID()::String
    return get_string(Lib.CktElement_Get_GUID())
end

"""Pointer to this object"""
function Handle()::Int
    return @checked Lib.CktElement_Get_Handle()
end

"""True if a recloser, relay, or fuse controlling this ckt element. OCP = Overcurrent Protection """
function HasOCPDevice()::Bool
    return @checked(Lib.CktElement_Get_HasOCPDevice()) != 0
end

"""This element has a SwtControl attached."""
function HasSwitchControl()::Bool
    return @checked(Lib.CktElement_Get_HasSwitchControl()) != 0
end

"""This element has a CapControl or RegControl attached."""
function HasVoltControl()::Bool
    return @checked(Lib.CktElement_Get_HasVoltControl()) != 0
end

"""Total losses in the element: two-element complex array"""
function Losses()::Vector{ComplexF64}
    return get_complex64_array(Lib.CktElement_Get_Losses)
end

"""Full Name of Active Circuit Element"""
function Name()::String
    return get_string(Lib.CktElement_Get_Name())
end

"""Array of integer containing the node numbers (representing phases, for example) for each conductor of each terminal. """
function NodeOrder()::Vector{Int}
    return get_int32_array(Lib.CktElement_Get_NodeOrder)
end

"""Normal ampere rating for PD Elements (Getter)"""
function NormalAmps()::Float64
    return @checked Lib.CktElement_Get_NormalAmps()
end

"""Normal ampere rating for PD Elements (Setter)"""
function NormalAmps(Value::Float64)
    @checked Lib.CktElement_Set_NormalAmps(Value)
end

"""Number of Conductors per Terminal"""
function NumConductors()::Int
    return @checked Lib.CktElement_Get_NumConductors()
end

"""Number of controls connected to this device. Use to determine valid range for index into Controller array."""
function NumControls()::Int
    return @checked Lib.CktElement_Get_NumControls()
end

"""Number of Phases"""
function NumPhases()::Int
    return @checked Lib.CktElement_Get_NumPhases()
end

"""Number of Properties this Circuit Element."""
function NumProperties()::Int
    return @checked Lib.CktElement_Get_NumProperties()
end

"""Number of Terminals this Circuit Element"""
function NumTerminals()::Int
    return @checked Lib.CktElement_Get_NumTerminals()
end

"""Index into Controller list of OCP Device controlling this CktElement"""
function OCPDevIndex()::Int
    return @checked Lib.CktElement_Get_OCPDevIndex()
end

"""0=None; 1=Fuse; 2=Recloser; 3=Relay;  Type of OCP controller device"""
function OCPDevType()::Int
    return @checked Lib.CktElement_Get_OCPDevType()
end

"""Complex array of losses by phase"""
function PhaseLosses()::Vector{ComplexF64}
    return get_complex64_array(Lib.CktElement_Get_PhaseLosses)
end

"""Complex array of powers into each conductor of each terminal"""
function Powers()::Vector{ComplexF64}
    return get_complex64_array(Lib.CktElement_Get_Powers)
end

"""Residual currents for each terminal: (mag, angle)"""
function Residuals()::Array{Float64,2}
    r = get_float64_array(Lib.CktElement_Get_Residuals)
    return reshape(r, (2, Int(length(r) / 2)))
end

"""Double array of symmetrical component currents into each 3-phase terminal"""
function SeqCurrents()::Vector{Float64}
    return get_float64_array(Lib.CktElement_Get_SeqCurrents)
end

"""Double array of sequence powers into each 3-phase teminal"""
function SeqPowers()::Vector{ComplexF64}
    return get_complex64_array(Lib.CktElement_Get_SeqPowers)
end

"""Double array of symmetrical component voltages at each 3-phase terminal"""
function SeqVoltages()::Vector{Float64}
    return get_float64_array(Lib.CktElement_Get_SeqVoltages)
end

"""Returns the total powers (complex) at ALL terminals of the active circuit element."""
function TotalPowers()::Vector{ComplexF64}
    return get_complex64_array(Lib.CktElement_Get_TotalPowers)
end

"""Complex array of voltages at terminals"""
function Voltages()::Vector{ComplexF64}
    return get_complex64_array(Lib.CktElement_Get_Voltages)
end

"""Voltages at each conductor in magnitude, angle form as array of doubles."""
function VoltagesMagAng()::Array{Float64,2}
    r = get_float64_array(Lib.CktElement_Get_VoltagesMagAng)
    return reshape(r, (2, Int(length(r) / 2)))
end

"""YPrim matrix, column order, complex numbers (paired)"""
function YPrim()::Array{ComplexF64,2}
    r = get_complex64_array(Lib.CktElement_Get_Yprim)
        # TODO: should we transpose here?
    return reshape(r, (Int(sqrt(length(r))), Int(sqrt(length(r)))))
end

"""Returns true if the current active element is isolated.
Note that this only fetches the current value. See also the Topology interface."""
function IsIsolated()::Bool
    return (@checked Lib.CktElement_Get_IsIsolated()) != 0
end

"""Array of integers, a copy of the internal NodeRef of the CktElement.

(API Extension)"""
function NodeRef()::Vector{Int}
    return get_int32_array(Lib.CktElement_Get_NodeRef)
end

end
