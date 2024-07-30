module CktElement

using DocStringExtensions

using ..Lib
using ..Utils

@template (FUNCTIONS, METHODS) = """
                                 $(TYPEDSIGNATURES)
                                 $(DOCSTRING)
                                 """

"""Close phase of terminal for active circuit element"""
function Close(dss::DSSContext, Term::Int, Phs::Int)
    @checked Lib.CktElement_Close(dss.ctx, Term, Phs)
end
Close(Term::Int, Phs::Int) = Close(DSS_DEFAULT_CTX, Term, Phs)

"""Full name of the i-th controller attached to this element. Ex: str = Controller(2).  See NumControls to determine valid index range"""
function Controller(dss::DSSContext, idx::Int)::String
    return get_string(Lib.CktElement_Get_Controller(dss.ctx, idx))
end
Controller(idx::Int) = Controller(DSS_DEFAULT_CTX, idx)

"""For PCElement, get the value of a variable by name. (Getter)"""
function Variable(dss::DSSContext, MyVarName::String, Unused::Int)::Float64
    Code = Ref{Int32}(-1)
    result = @checked Lib.CktElement_Get_Variable(dss.ctx, MyVarName, Code)
    if Code[] != 0
        throw(
            OpenDSSDirectException(
                "[ERROR] '$MyVarName' is not a valid variable name or the current object is not a PCElement."
            )
        )
    end
    return result
end
Variable(MyVarName::String, Unused::Int) = Variable(DSS_DEFAULT_CTX, MyVarName, Unused)

"""For PCElement, set the value of a variable by name. (Setter)"""
function Variable(dss::DSSContext, MyVarName::String, Unused::Int, Value::Float64)
    Code = Ref{Int32}(-1)
    @checked Lib.CktElement_Set_Variable(dss.ctx, MyVarName, Code, Value)
    if Code[] != 0
        throw(
            OpenDSSDirectException(
                "[ERROR] '$MyVarName' is not a valid variable name or the current object is not a PCElement."
            )
        )
    end
end
Variable(MyVarName::String, Unused::Int, Value::Float64) = Variable(DSS_DEFAULT_CTX, MyVarName, Unused, Value)

"""For PCElement, get the value of a variable by integer index. (Getter)"""
function Variablei(dss::DSSContext, Idx::Int, Unused::Int)::Float64
    Code = Ref{Int32}(-1)
    result = @checked Lib.CktElement_Get_Variablei(dss.ctx, Idx, Code)
    if Code[] != 0
        throw(
            OpenDSSDirectException(
                "[ERROR] $Idx is not a valid variable index or the current object is not a PCElement."
            )
        )
    end
    return result
end
Variablei(Idx::Int, Unused::Int) = Variablei(DSS_DEFAULT_CTX, Idx, Unused)

"""For PCElement, set the value of a variable by integer index. (Setter)"""
function Variablei(dss::DSSContext, Idx::Int, Unused::Int, Value::Float64)
    Code = Ref{Int32}(-1)
    @checked Lib.CktElement_Set_Variablei(dss.ctx, Idx, Code, Value)
    if Code[] != 0
        throw(
            OpenDSSDirectException(
                "[ERROR] $Idx is not a valid variable index or the current object is not a PCElement."
            )
        )
    end
end
Variablei(Idx::Int, Unused::Int, Value::Float64) = Variablei(DSS_DEFAULT_CTX, Idx, Unused, Value)

"""Check if open phase of terminal for active circuit element"""
function IsOpen(dss::DSSContext, Term::Int, Phs::Int)::Bool
    return @checked(Lib.CktElement_IsOpen(dss.ctx, Term, Phs)) != 0
end
IsOpen(Term::Int, Phs::Int) = IsOpen(DSS_DEFAULT_CTX, Term, Phs)

"""Open phase of terminal for active circuit element"""
function Open(dss::DSSContext, Term::Int, Phs::Int)
    @checked Lib.CktElement_Open(dss.ctx, Term, Phs)
end
Open(Term::Int, Phs::Int) = Open(DSS_DEFAULT_CTX, Term, Phs)

"""Array containing all property names of the active device."""
function AllPropertyNames(dss::DSSContext)::Vector{String}
    return get_string_array(Lib.CktElement_Get_AllPropertyNames, dss.ctx)
end
AllPropertyNames() = AllPropertyNames(DSS_DEFAULT_CTX)

"""Array of strings listing all the published variable names, if a PCElement. Otherwise, null string."""
function AllVariableNames(dss::DSSContext)::Vector{String}
    return get_string_array(Lib.CktElement_Get_AllVariableNames, dss.ctx)
end
AllVariableNames() = AllVariableNames(DSS_DEFAULT_CTX)

"""Array of doubles. Values of state variables of active element if PC element."""
function AllVariableValues(dss::DSSContext)::Vector{Float64}
    return get_float64_array(Lib.CktElement_Get_AllVariableValues, dss.ctx)
end
AllVariableValues() = AllVariableValues(DSS_DEFAULT_CTX)

"""
Array of strings. Get Bus definitions to which each terminal is connected. 0-based array.
"""
function BusNames(dss::DSSContext, removeNodes::Bool)::Vector{String}
    return get_string_array(Lib.CktElement_Get_BusNames, dss.ctx, removeNodes)
end
BusNames(removeNodes::Bool) = BusNames(DSS_DEFAULT_CTX, removeNodes)
BusNames() = BusNames(DSS_DEFAULT_CTX, false)

"""
Array of strings. Set Bus definitions for each terminal is connected.
"""
function BusNames(dss::DSSContext, Value::Vector{String})
    Value, ValuePtr, ValueCount = prepare_string_array(Value)
    @checked Lib.CktElement_Set_BusNames(dss.ctx, ValuePtr, ValueCount)
end
BusNames(Value::Vector{String}) = BusNames(DSS_DEFAULT_CTX, Value)

"""Complex double array of Sequence Currents for all conductors of all terminals of active circuit element."""
function CplxSeqCurrents(dss::DSSContext)::Vector{ComplexF64}
    return get_complex64_array(Lib.CktElement_Get_CplxSeqCurrents, dss.ctx)
end
CplxSeqCurrents() = CplxSeqCurrents(DSS_DEFAULT_CTX)

"""Complex double array of Sequence Voltage for all terminals of active circuit element."""
function CplxSeqVoltages(dss::DSSContext)::Vector{ComplexF64}
    return get_complex64_array(Lib.CktElement_Get_CplxSeqVoltages, dss.ctx)
end
CplxSeqVoltages() = CplxSeqVoltages(DSS_DEFAULT_CTX)

"""Complex array of currents into each conductor of each terminal"""
function Currents(dss::DSSContext)::Vector{ComplexF64}
    return get_complex64_array(Lib.CktElement_Get_Currents, dss.ctx)
end
Currents() = Currents(DSS_DEFAULT_CTX)

"""Currents in magnitude, angle format as a array of doubles."""
function CurrentsMagAng(dss::DSSContext)::Array{Float64,2}
    r = get_float64_array(Lib.CktElement_Get_CurrentsMagAng, dss.ctx)
    return reshape(r, (2, Int(length(r) / 2)))
end
CurrentsMagAng() = CurrentsMagAng(DSS_DEFAULT_CTX)

"""Display name of the object (not necessarily unique) (Getter)"""
function DisplayName(dss::DSSContext)::String
    return get_string(Lib.CktElement_Get_DisplayName(dss.ctx))
end
DisplayName() = DisplayName(DSS_DEFAULT_CTX)

"""Display name of the object (not necessarily unique) (Setter)"""
function DisplayName(dss::DSSContext, Value::String)
    @checked Lib.CktElement_Set_DisplayName(dss.ctx, Cstring(pointer(Value)))
end
DisplayName(Value::String) = DisplayName(DSS_DEFAULT_CTX, Value)

"""Emergency Ampere Rating for PD elements (Getter)"""
function EmergAmps(dss::DSSContext)::Float64
    return @checked Lib.CktElement_Get_EmergAmps(dss.ctx)
end
EmergAmps() = EmergAmps(DSS_DEFAULT_CTX)

"""Emergency Ampere Rating for PD elements (Setter)"""
function EmergAmps(dss::DSSContext, Value::Float64)
    @checked Lib.CktElement_Set_EmergAmps(dss.ctx, Value)
end
EmergAmps(Value::Float64) = EmergAmps(DSS_DEFAULT_CTX, Value)

"""Boolean indicating that element is currently in the circuit. (Getter)"""
function Enabled(dss::DSSContext)::Bool
    return @checked(Lib.CktElement_Get_Enabled(dss.ctx)) != 0
end
Enabled() = Enabled(DSS_DEFAULT_CTX)

"""Boolean indicating that element is currently in the circuit. (Setter)"""
function Enabled(dss::DSSContext, Value::Bool)
    @checked Lib.CktElement_Set_Enabled(dss.ctx, Value ? 1 : 0)
end
Enabled(Value::Bool) = Enabled(DSS_DEFAULT_CTX, Value)

"""Name of the Energy Meter this element is assigned to."""
function EnergyMeter(dss::DSSContext)::String
    return get_string(Lib.CktElement_Get_EnergyMeter(dss.ctx))
end
EnergyMeter() = EnergyMeter(DSS_DEFAULT_CTX)

"""globally unique identifier for this object"""
function GUID(dss::DSSContext)::String
    return get_string(Lib.CktElement_Get_GUID(dss.ctx))
end
GUID() = GUID(DSS_DEFAULT_CTX)

"""Pointer to this object"""
function Handle(dss::DSSContext)::Int
    return @checked Lib.CktElement_Get_Handle(dss.ctx)
end
Handle() = Handle(DSS_DEFAULT_CTX)

"""True if a recloser, relay, or fuse controlling this ckt element. OCP = Overcurrent Protection """
function HasOCPDevice(dss::DSSContext)::Bool
    return @checked(Lib.CktElement_Get_HasOCPDevice(dss.ctx)) != 0
end
HasOCPDevice() = HasOCPDevice(DSS_DEFAULT_CTX)

"""This element has a SwtControl attached."""
function HasSwitchControl(dss::DSSContext)::Bool
    return @checked(Lib.CktElement_Get_HasSwitchControl(dss.ctx)) != 0
end
HasSwitchControl() = HasSwitchControl(DSS_DEFAULT_CTX)

"""This element has a CapControl or RegControl attached."""
function HasVoltControl(dss::DSSContext)::Bool
    return @checked(Lib.CktElement_Get_HasVoltControl(dss.ctx)) != 0
end
HasVoltControl() = HasVoltControl(DSS_DEFAULT_CTX)

"""Total losses in the element: two-element complex array"""
function Losses(dss::DSSContext)::Vector{ComplexF64}
    return get_complex64_array(Lib.CktElement_Get_Losses, dss.ctx)
end
Losses() = Losses(DSS_DEFAULT_CTX)

"""Full Name of Active Circuit Element"""
function Name(dss::DSSContext)::String
    return get_string(Lib.CktElement_Get_Name(dss.ctx))
end
Name() = Name(DSS_DEFAULT_CTX)

"""Array of integer containing the node numbers (representing phases, for example) for each conductor of each terminal. """
function NodeOrder(dss::DSSContext)::Vector{Int}
    return get_int32_array(Lib.CktElement_Get_NodeOrder, dss.ctx)
end
NodeOrder() = NodeOrder(DSS_DEFAULT_CTX)

"""Normal ampere rating for PD Elements (Getter)"""
function NormalAmps(dss::DSSContext)::Float64
    return @checked Lib.CktElement_Get_NormalAmps(dss.ctx)
end
NormalAmps() = NormalAmps(DSS_DEFAULT_CTX)

"""Normal ampere rating for PD Elements (Setter)"""
function NormalAmps(dss::DSSContext, Value::Float64)
    @checked Lib.CktElement_Set_NormalAmps(dss.ctx, Value)
end
NormalAmps(Value::Float64) = NormalAmps(DSS_DEFAULT_CTX, Value)

"""Number of Conductors per Terminal"""
function NumConductors(dss::DSSContext)::Int
    return @checked Lib.CktElement_Get_NumConductors(dss.ctx)
end
NumConductors() = NumConductors(DSS_DEFAULT_CTX)

"""Number of controls connected to this device. Use to determine valid range for index into Controller array."""
function NumControls(dss::DSSContext)::Int
    return @checked Lib.CktElement_Get_NumControls(dss.ctx)
end
NumControls() = NumControls(DSS_DEFAULT_CTX)

"""Number of Phases"""
function NumPhases(dss::DSSContext)::Int
    return @checked Lib.CktElement_Get_NumPhases(dss.ctx)
end
NumPhases() = NumPhases(DSS_DEFAULT_CTX)

"""Number of Properties this Circuit Element."""
function NumProperties(dss::DSSContext)::Int
    return @checked Lib.CktElement_Get_NumProperties(dss.ctx)
end
NumProperties() = NumProperties(DSS_DEFAULT_CTX)

"""Number of Terminals this Circuit Element"""
function NumTerminals(dss::DSSContext)::Int
    return @checked Lib.CktElement_Get_NumTerminals(dss.ctx)
end
NumTerminals() = NumTerminals(DSS_DEFAULT_CTX)

"""Index into Controller list of OCP Device controlling this CktElement"""
function OCPDevIndex(dss::DSSContext)::Int
    return @checked Lib.CktElement_Get_OCPDevIndex(dss.ctx)
end
OCPDevIndex() = OCPDevIndex(DSS_DEFAULT_CTX)

"""0=None; 1=Fuse; 2=Recloser; 3=Relay;  Type of OCP controller device"""
function OCPDevType(dss::DSSContext)::Int
    return @checked Lib.CktElement_Get_OCPDevType(dss.ctx)
end
OCPDevType() = OCPDevType(DSS_DEFAULT_CTX)

"""Complex array of losses by phase"""
function PhaseLosses(dss::DSSContext)::Vector{ComplexF64}
    return get_complex64_array(Lib.CktElement_Get_PhaseLosses, dss.ctx)
end
PhaseLosses() = PhaseLosses(DSS_DEFAULT_CTX)

"""Complex array of powers into each conductor of each terminal"""
function Powers(dss::DSSContext)::Vector{ComplexF64}
    return get_complex64_array(Lib.CktElement_Get_Powers, dss.ctx)
end
Powers() = Powers(DSS_DEFAULT_CTX)

"""Residual currents for each terminal: (mag, angle)"""
function Residuals(dss::DSSContext)::Array{Float64,2}
    r = get_float64_array(Lib.CktElement_Get_Residuals, dss.ctx)
    return reshape(r, (2, Int(length(r) / 2)))
end
Residuals() = Residuals(DSS_DEFAULT_CTX)

"""Double array of symmetrical component currents into each 3-phase terminal"""
function SeqCurrents(dss::DSSContext)::Vector{Float64}
    return get_float64_array(Lib.CktElement_Get_SeqCurrents, dss.ctx)
end
SeqCurrents() = SeqCurrents(DSS_DEFAULT_CTX)

"""Double array of sequence powers into each 3-phase teminal"""
function SeqPowers(dss::DSSContext)::Vector{ComplexF64}
    return get_complex64_array(Lib.CktElement_Get_SeqPowers, dss.ctx)
end
SeqPowers() = SeqPowers(DSS_DEFAULT_CTX)

"""Double array of symmetrical component voltages at each 3-phase terminal"""
function SeqVoltages(dss::DSSContext)::Vector{Float64}
    return get_float64_array(Lib.CktElement_Get_SeqVoltages, dss.ctx)
end
SeqVoltages() = SeqVoltages(DSS_DEFAULT_CTX)

"""Returns the total powers (complex) at ALL terminals of the active circuit element."""
function TotalPowers(dss::DSSContext)::Vector{ComplexF64}
    return get_complex64_array(Lib.CktElement_Get_TotalPowers, dss.ctx)
end
TotalPowers() = TotalPowers(DSS_DEFAULT_CTX)

"""Complex array of voltages at terminals"""
function Voltages(dss::DSSContext)::Vector{ComplexF64}
    return get_complex64_array(Lib.CktElement_Get_Voltages, dss.ctx)
end
Voltages() = Voltages(DSS_DEFAULT_CTX)

"""Voltages at each conductor in magnitude, angle form as array of doubles."""
function VoltagesMagAng(dss::DSSContext)::Array{Float64,2}
    r = get_float64_array(Lib.CktElement_Get_VoltagesMagAng, dss.ctx)
    return reshape(r, (2, Int(length(r) / 2)))
end
VoltagesMagAng() = VoltagesMagAng(DSS_DEFAULT_CTX)

"""YPrim matrix, column order, complex numbers (paired)"""
function YPrim(dss::DSSContext)::Array{ComplexF64,2}
    r = get_complex64_array(Lib.CktElement_Get_Yprim, dss.ctx)
        # TODO: should we transpose here?
    return reshape(r, (Int(sqrt(length(r))), Int(sqrt(length(r)))))
end
YPrim() = YPrim(DSS_DEFAULT_CTX)

"""Returns true if the current active element is isolated.
Note that this only fetches the current value. See also the Topology interface."""
function IsIsolated(dss::DSSContext)::Bool
    return (@checked Lib.CktElement_Get_IsIsolated(dss.ctx)) != 0
end
IsIsolated() = IsIsolated(DSS_DEFAULT_CTX)

"""Array of integers, a copy of the internal NodeRef of the CktElement.

(API Extension)"""
function NodeRef(dss::DSSContext)::Vector{Int}
    return get_int32_array(Lib.CktElement_Get_NodeRef, dss.ctx)
end
NodeRef() = NodeRef(DSS_DEFAULT_CTX)

end
