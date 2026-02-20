"""
The (Active)CktElement interface allows accessing some common properties and 
methods shared across circuit elements in the DSS engine.

Users can enable specific elements by name or use the dedicated interface 
(e.g. use `Loads.Name`, `Transformers.First/Next`) and access the properties here.

If you are new to OpenDSS/AltDSS and this classic interface, please read the following document
for an overview of the "active element" paradigm used by COM and the classic APIs:
    
https://dss-extensions.org/classic_api.html#the-active-paradigm
"""
module CktElement

using DocStringExtensions

using ..Lib
using ..Utils

@template (FUNCTIONS, METHODS) = """
                                 $(TYPEDSIGNATURES)
                                 $(DOCSTRING)
                                 """

"""
Close the specified terminal and phase, if non-zero, or all conductors at the terminal.

Original COM help: <https://opendss.epri.com/Close1.html>
"""
function Close(dss::DSSContext, Term::Int, Phs::Int)
    @checked dss_ccall(dss.capi.CktElement_Close, dss.ctx, Term, Phs)
end
Close(Term::Int, Phs::Int) = Close(DSS_DEFAULT_CTX, Term, Phs)

"""Full name of the i-th controller attached to this element. Ex: str = Controller(2).  See NumControls to determine valid index range"""
function Controller(dss::DSSContext, idx::Int)::String
    return get_string(dss_ccall(dss.capi.CktElement_Get_Controller, dss.ctx, idx))
end
Controller(idx::Int) = Controller(DSS_DEFAULT_CTX, idx)

"""
If the active element is a PCElement, get the value of a variable by name.
Otherwise, an exception is raised.

(Getter)
"""
function Variable(dss::DSSContext, MyVarName::String, Unused::Int)::Float64
    Code = Ref{Int32}(-1)
    result = @checked dss_ccall(dss.capi.CktElement_Get_Variable, dss.ctx, MyVarName, Code)
    if Code[] != 0
        throw(
            OpenDSSDirectException(
                "[ERROR] '$MyVarName' is not a valid variable name or the current object is not a PCElement."
            )
        )
    end
    return result
end
Variable(MyVarName::String) = Variable(DSS_DEFAULT_CTX, MyVarName, 0)

"""
If the active element is a PCElement, set the value of a variable by name.
Otherwise, an exception is raised.

(Setter)
"""
function Variable(dss::DSSContext, MyVarName::String, Unused::Int, Value::Float64)
    Code = Ref{Int32}(-1)
    @checked dss_ccall(dss.capi.CktElement_Set_Variable, dss.ctx, MyVarName, Code, Value)
    if Code[] != 0
        throw(
            OpenDSSDirectException(
                "[ERROR] '$MyVarName' is not a valid variable name or the current object is not a PCElement."
            )
        )
    end
end
Variable(MyVarName::String, Value::Float64) = Variable(DSS_DEFAULT_CTX, MyVarName, 0, Value)

"""
If the active element is a PCElement, get the value of a variable by its integer index.
Otherwise, an exception is raised.

(Getter)
"""
function Variablei(dss::DSSContext, Idx::Int, Unused::Int)::Float64
    Code = Ref{Int32}(-1)
    result = @checked dss_ccall(dss.capi.CktElement_Get_Variablei, dss.ctx, Idx, Code)
    if Code[] != 0
        throw(
            OpenDSSDirectException(
                "[ERROR] $Idx is not a valid variable index or the current object is not a PCElement."
            )
        )
    end
    return result
end
Variablei(dss::DSSContext, Idx::Int) = Variablei(dss, Idx, 0)
Variablei(Idx::Int, Unused::Int) = Variablei(DSS_DEFAULT_CTX, Idx, Unused)
Variablei(Idx::Int) = Variablei(DSS_DEFAULT_CTX, Idx, 0)

"""
If the active element is a PCElement, set the value of a variable by its integer index.
Otherwise, an exception is raised.

(Setter)
"""
function Variablei(dss::DSSContext, Idx::Int, Unused::Int, Value::Float64)
    Code = Ref{Int32}(-1)
    @checked dss_ccall(dss.capi.CktElement_Set_Variablei, dss.ctx, Idx, Code, Value)
    if Code[] != 0
        throw(
            OpenDSSDirectException(
                "[ERROR] $Idx is not a valid variable index or the current object is not a PCElement."
            )
        )
    end
end
Variablei(dss::DSSContext, Idx::Int, Value::Float64) = Variablei(dss, Idx, 0, Value)
Variablei(Idx::Int, Unused::Int, Value::Float64) = Variablei(DSS_DEFAULT_CTX, Idx, Unused, Value)
Variablei(Idx::Int, Value::Float64) = Variablei(DSS_DEFAULT_CTX, Idx, 0, Value)

"""
Indicates if the specified terminal and, optionally, a specific phase conductor is open.

Provide zero in the `Phs` argument to check if any conductor of the terminal `Term` is open.

Provide a non-zero phase number in `Phs` to check if a specific phase conductor is open.

Original COM help: <https://opendss.epri.com/IsOpen.html>
"""
function IsOpen(dss::DSSContext, Term::Int, Phs::Int)::Bool
    return @checked(dss_ccall(dss.capi.CktElement_IsOpen, dss.ctx, Term, Phs)) != 0
end
IsOpen(Term::Int, Phs::Int) = IsOpen(DSS_DEFAULT_CTX, Term, Phs)

"""
Indicates if any of the phase conductors of the specified terminal is open.

Original COM help: <https://opendss.epri.com/Open1.html>
"""
function IsOpen(dss::DSSContext, Term::Int)::Bool
    return @checked(dss_ccall(dss.capi.CktElement_IsOpen, dss.ctx, Term, 0)) != 0
end
IsOpen(Term::Int) = IsOpen(DSS_DEFAULT_CTX, Term)

"""
Open the specified terminal and phase, if non-zero, or all conductors at the terminal.

Original COM help: <https://opendss.epri.com/Open1.html>
"""
function Open(dss::DSSContext, Term::Int, Phs::Int)
    @checked dss_ccall(dss.capi.CktElement_Open, dss.ctx, Term, Phs)
end
Open(Term::Int, Phs::Int) = Open(DSS_DEFAULT_CTX, Term, Phs)

"""
Array containing all property names of the active device.

Original COM help: <https://opendss.epri.com/AllPropertyNames.html>
"""
function AllPropertyNames(dss::DSSContext)::Vector{String}
    return get_string_array(dss.capi.CktElement_Get_AllPropertyNames, dss)
end
AllPropertyNames() = AllPropertyNames(DSS_DEFAULT_CTX)

"""
Array of strings listing all the published state variable names.
Valid only for PCElements.

Original COM help: <https://opendss.epri.com/AllVariableNames.html>
"""
function AllVariableNames(dss::DSSContext)::Vector{String}
    return get_string_array(dss.capi.CktElement_Get_AllVariableNames, dss)
end
AllVariableNames() = AllVariableNames(DSS_DEFAULT_CTX)

"""
Array of doubles. Values of state variables of active element if PC element.
Valid only for PCElements.

Original COM help: <https://opendss.epri.com/AllVariableValues.html>
"""
function AllVariableValues(dss::DSSContext)::Vector{Float64}
    return get_float64_array(dss.capi.CktElement_Get_AllVariableValues, dss)
end
AllVariableValues() = AllVariableValues(DSS_DEFAULT_CTX)

"""
Bus definitions to which each terminal is connected.

In getter mode, the argument `removeNodes` is an **API Extension**.
Use it to get only the bus names, without the connection/node specification, if present.

Original COM help: <https://opendss.epri.com/BusNames.html>

(Getter)
"""
function BusNames(dss::DSSContext, removeNodes::Bool)::Vector{String}
    return get_string_array(dss.capi.CktElement_Get_BusNames, dss, removeNodes)
end
BusNames(dss::DSSContext) = BusNames(DSS_DEFAULT_CTX, false)
BusNames(removeNodes::Bool) = BusNames(DSS_DEFAULT_CTX, removeNodes)
BusNames() = BusNames(DSS_DEFAULT_CTX, false)

"""
Bus definitions to which each terminal is connected.

Original COM help: <https://opendss.epri.com/BusNames.html>

(Setter)
"""
function BusNames(dss::DSSContext, Value::Vector{String})
    Value, ValuePtr, ValueCount = prepare_string_array(Value)
    @checked dss_ccall(dss.capi.CktElement_Set_BusNames, dss.ctx, ValuePtr, ValueCount)
end
BusNames(Value::Vector{String}) = BusNames(DSS_DEFAULT_CTX, Value)

"""
Complex double array of Sequence Currents for all conductors of all terminals of active circuit element.

Original COM help: <https://opendss.epri.com/CplxSeqCurrents.html>
"""
function CplxSeqCurrents(dss::DSSContext)::Vector{ComplexF64}
    return get_complex64_array(dss.capi.CktElement_Get_CplxSeqCurrents, dss)
end
CplxSeqCurrents() = CplxSeqCurrents(DSS_DEFAULT_CTX)

"""
Complex double array of Sequence Voltage for all terminals of active circuit element.

Original COM help: <https://opendss.epri.com/CplxSeqVoltages1.html>
"""
function CplxSeqVoltages(dss::DSSContext)::Vector{ComplexF64}
    return get_complex64_array(dss.capi.CktElement_Get_CplxSeqVoltages, dss)
end
CplxSeqVoltages() = CplxSeqVoltages(DSS_DEFAULT_CTX)

"""
Complex array of currents into each conductor of each terminal

Original COM help: <https://opendss.epri.com/Currents1.html>
"""
function Currents(dss::DSSContext)::Vector{ComplexF64}
    return get_complex64_array(dss.capi.CktElement_Get_Currents, dss)
end
Currents() = Currents(DSS_DEFAULT_CTX)

"""
Currents in magnitude, angle (degrees) format as an array of doubles.

Original COM help: <https://opendss.epri.com/CurrentsMagAng.html>
"""
function CurrentsMagAng(dss::DSSContext)::Matrix{Float64}
    r = get_float64_array(dss.capi.CktElement_Get_CurrentsMagAng, dss)
    return reshape(r, (2, Int(length(r) / 2)))
end
CurrentsMagAng() = CurrentsMagAng(DSS_DEFAULT_CTX)

"""
Display name of the object (not necessarily unique)

Original COM help: <https://opendss.epri.com/DisplayName.html>

(Getter)
"""
function DisplayName(dss::DSSContext)::String
    return get_string(dss_ccall(dss.capi.CktElement_Get_DisplayName, dss.ctx))
end
DisplayName() = DisplayName(DSS_DEFAULT_CTX)

"""
Display name of the object (not necessarily unique)

Original COM help: <https://opendss.epri.com/DisplayName.html>

(Setter)
"""
function DisplayName(dss::DSSContext, Value::String)
    @checked dss_ccall(dss.capi.CktElement_Set_DisplayName, dss.ctx, Value)
end
DisplayName(Value::String) = DisplayName(DSS_DEFAULT_CTX, Value)

"""
Emergency Ampere Rating for PD elements

Original COM help: <https://opendss.epri.com/EmergAmps.html>

(Getter)
"""
function EmergAmps(dss::DSSContext)::Float64
    return @checked dss_ccall(dss.capi.CktElement_Get_EmergAmps, dss.ctx)
end
EmergAmps() = EmergAmps(DSS_DEFAULT_CTX)

"""
Emergency Ampere Rating for PD elements

Original COM help: <https://opendss.epri.com/EmergAmps.html>

(Setter)
"""
function EmergAmps(dss::DSSContext, Value::Float64)
    @checked dss_ccall(dss.capi.CktElement_Set_EmergAmps, dss.ctx, Value)
end
EmergAmps(Value::Float64) = EmergAmps(DSS_DEFAULT_CTX, Value)

"""
Boolean indicating that element is currently in the circuit.

Original COM help: <https://opendss.epri.com/Enabled.html>

(Getter)
"""
function Enabled(dss::DSSContext)::Bool
    return @checked(dss_ccall(dss.capi.CktElement_Get_Enabled, dss.ctx)) != 0
end
Enabled() = Enabled(DSS_DEFAULT_CTX)

"""
Boolean indicating that element is currently in the circuit.

Original COM help: <https://opendss.epri.com/Enabled.html>

(Setter)
"""
function Enabled(dss::DSSContext, Value::Bool)
    @checked dss_ccall(dss.capi.CktElement_Set_Enabled, dss.ctx, Value ? 1 : 0)
end
Enabled(Value::Bool) = Enabled(DSS_DEFAULT_CTX, Value)

"""
Name of the Energy Meter this element is assigned to.

*Requires an energy meter with an updated zone.*

Original COM help: <https://opendss.epri.com/EnergyMeter.html>
"""
function EnergyMeter(dss::DSSContext)::String
    return get_string(dss_ccall(dss.capi.CktElement_Get_EnergyMeter, dss.ctx))
end
EnergyMeter() = EnergyMeter(DSS_DEFAULT_CTX)

"""
GUID/UUID for this object.

Original COM help: <https://opendss.epri.com/GUID.html>
"""
function GUID(dss::DSSContext)::String
    return get_string(dss_ccall(dss.capi.CktElement_Get_GUID, dss.ctx))
end
GUID() = GUID(DSS_DEFAULT_CTX)

"""
Index of this element into the circuit's element list.

Original COM help: <https://opendss.epri.com/Handle.html>
"""
function Handle(dss::DSSContext)::Int
    return @checked dss_ccall(dss.capi.CktElement_Get_Handle, dss.ctx)
end
Handle() = Handle(DSS_DEFAULT_CTX)

"""
True if a recloser, relay, or fuse controlling this ckt element. OCP = Overcurrent Protection

Original COM help: <https://opendss.epri.com/HasOCPDevice.html>
"""
function HasOCPDevice(dss::DSSContext)::Bool
    return @checked(dss_ccall(dss.capi.CktElement_Get_HasOCPDevice, dss.ctx)) != 0
end
HasOCPDevice() = HasOCPDevice(DSS_DEFAULT_CTX)

"""
True if this element has a SwtControl attached.

Original COM help: <https://opendss.epri.com/HasSwitchControl.html>
"""
function HasSwitchControl(dss::DSSContext)::Bool
    return @checked(dss_ccall(dss.capi.CktElement_Get_HasSwitchControl, dss.ctx)) != 0
end
HasSwitchControl() = HasSwitchControl(DSS_DEFAULT_CTX)

"""
True if this element has a CapControl or RegControl attached.

Original COM help: <https://opendss.epri.com/HasVoltControl.html>
"""
function HasVoltControl(dss::DSSContext)::Bool
    return @checked(dss_ccall(dss.capi.CktElement_Get_HasVoltControl, dss.ctx)) != 0
end
HasVoltControl() = HasVoltControl(DSS_DEFAULT_CTX)

"""
Total losses in the element: two-element double array (complex), in VA (watts, vars)

Original COM help: <https://opendss.epri.com/Losses1.html>
"""
function Losses(dss::DSSContext)::Vector{ComplexF64}
    #TODO: change to a single complex value
    return get_complex64_array(dss.capi.CktElement_Get_Losses, dss)
end
Losses() = Losses(DSS_DEFAULT_CTX)

"""
A complex array of the 3 types of losses (total losses, load losses, no-load losses) for the active circuit element, in VA.

Added in May 2025. Same as `LossesByType` introduced for Transformers in AltDSS/DSS C-API in May 2019.
"""
function AllLosses(dss::DSSContext)::Vector{ComplexF64}
    return get_complex64_array(dss.capi.CktElement_Get_AllLosses, dss)
end
AllLosses() = AllLosses(DSS_DEFAULT_CTX)

"""
Full Name of Active Circuit Element

Original COM help: <https://opendss.epri.com/Name4.html>
"""
function Name(dss::DSSContext)::String
    return get_string(dss_ccall(dss.capi.CktElement_Get_Name, dss.ctx))
end
Name() = Name(DSS_DEFAULT_CTX)

"""
Array of integer containing the node numbers (representing phases, for example) for each conductor of each terminal.

Be sure to run a solution to initialize the values after the circuit is created or modified.

Original COM help: <https://opendss.epri.com/NodeOrder.html>
"""
function NodeOrder(dss::DSSContext)::Vector{Int}
    return get_int32_array(dss.capi.CktElement_Get_NodeOrder, dss)
end
NodeOrder() = NodeOrder(DSS_DEFAULT_CTX)

"""
Normal ampere rating for PD Elements

Original COM help: <https://opendss.epri.com/NormalAmps.html>

(Getter)
"""
function NormalAmps(dss::DSSContext)::Float64
    return @checked dss_ccall(dss.capi.CktElement_Get_NormalAmps, dss.ctx)
end
NormalAmps() = NormalAmps(DSS_DEFAULT_CTX)

"""
Normal ampere rating for PD Elements

Original COM help: <https://opendss.epri.com/NormalAmps.html>

(Setter)
"""
function NormalAmps(dss::DSSContext, Value::Float64)
    @checked dss_ccall(dss.capi.CktElement_Set_NormalAmps, dss.ctx, Value)
end
NormalAmps(Value::Float64) = NormalAmps(DSS_DEFAULT_CTX, Value)

"""
Number of Conductors per Terminal

Original COM help: <https://opendss.epri.com/NumConductors.html>
"""
function NumConductors(dss::DSSContext)::Int
    return @checked dss_ccall(dss.capi.CktElement_Get_NumConductors, dss.ctx)
end
NumConductors() = NumConductors(DSS_DEFAULT_CTX)

"""
Number of controls connected to this device.
Use to determine valid range for index into Controller array.

Original COM help: <https://opendss.epri.com/NumControls.html>
"""
function NumControls(dss::DSSContext)::Int
    return @checked dss_ccall(dss.capi.CktElement_Get_NumControls, dss.ctx)
end
NumControls() = NumControls(DSS_DEFAULT_CTX)

"""
Number of Phases

Original COM help: <https://opendss.epri.com/NumPhases.html>
"""
function NumPhases(dss::DSSContext)::Int
    return @checked dss_ccall(dss.capi.CktElement_Get_NumPhases, dss.ctx)
end
NumPhases() = NumPhases(DSS_DEFAULT_CTX)

"""
Number of Properties this Circuit Element.

Original COM help: <https://opendss.epri.com/NumProperties.html>
"""
function NumProperties(dss::DSSContext)::Int
    return @checked dss_ccall(dss.capi.CktElement_Get_NumProperties, dss.ctx)
end
NumProperties() = NumProperties(DSS_DEFAULT_CTX)

"""
Number of terminals in this Circuit Element

Original COM help: <https://opendss.epri.com/NumTerminals.html>
"""
function NumTerminals(dss::DSSContext)::Int
    return @checked dss_ccall(dss.capi.CktElement_Get_NumTerminals, dss.ctx)
end
NumTerminals() = NumTerminals(DSS_DEFAULT_CTX)

"""
Index into Controller list of OCP Device controlling this CktElement

Original COM help: <https://opendss.epri.com/OCPDevIndex.html>
"""
function OCPDevIndex(dss::DSSContext)::Int
    return @checked dss_ccall(dss.capi.CktElement_Get_OCPDevIndex, dss.ctx)
end
OCPDevIndex() = OCPDevIndex(DSS_DEFAULT_CTX)

"""
0=None; 1=Fuse; 2=Recloser; 3=Relay;  Type of OCP controller device

Original COM help: <https://opendss.epri.com/OCPDevType.html>
"""
function OCPDevType(dss::DSSContext)::Int
    return @checked dss_ccall(dss.capi.CktElement_Get_OCPDevType, dss.ctx)
end
OCPDevType() = OCPDevType(DSS_DEFAULT_CTX)

"""
Complex array of losses (kVA) by phase

Original COM help: <https://opendss.epri.com/PhaseLosses.html>
"""
function PhaseLosses(dss::DSSContext)::Vector{ComplexF64}
    return get_complex64_array(dss.capi.CktElement_Get_PhaseLosses, dss)
end
PhaseLosses() = PhaseLosses(DSS_DEFAULT_CTX)

"""
Complex array of powers (kVA) into each conductor of each terminal

Original COM help: <https://opendss.epri.com/Powers.html>
"""
function Powers(dss::DSSContext)::Vector{ComplexF64}
    return get_complex64_array(dss.capi.CktElement_Get_Powers, dss)
end
Powers() = Powers(DSS_DEFAULT_CTX)

"""
Residual currents for each terminal: (magnitude, angle in degrees)

Original COM help: <https://opendss.epri.com/Residuals.html>
"""
function Residuals(dss::DSSContext)::Matrix{Float64}
    r = get_float64_array(dss.capi.CktElement_Get_Residuals, dss)
    return reshape(r, (2, Int(length(r) / 2)))
end
Residuals() = Residuals(DSS_DEFAULT_CTX)

"""
Double array of symmetrical component currents (magnitudes only) into each 3-phase terminal

Original COM help: <https://opendss.epri.com/SeqCurrents.html>
"""
function SeqCurrents(dss::DSSContext)::Vector{Float64}
    return get_float64_array(dss.capi.CktElement_Get_SeqCurrents, dss)
end
SeqCurrents() = SeqCurrents(DSS_DEFAULT_CTX)

"""
Complex array of sequence powers (kW, kvar) into each 3-phase terminal

Original COM help: <https://opendss.epri.com/SeqPowers.html>
"""
function SeqPowers(dss::DSSContext)::Vector{ComplexF64}
    return get_complex64_array(dss.capi.CktElement_Get_SeqPowers, dss)
end
SeqPowers() = SeqPowers(DSS_DEFAULT_CTX)

"""
Double array of symmetrical component voltages (magnitudes only) at each 3-phase terminal

Original COM help: <https://opendss.epri.com/SeqVoltages1.html>
"""
function SeqVoltages(dss::DSSContext)::Vector{Float64}
    return get_float64_array(dss.capi.CktElement_Get_SeqVoltages, dss)
end
SeqVoltages() = SeqVoltages(DSS_DEFAULT_CTX)

"""
Returns an array with the total powers (complex, kVA) at ALL terminals of the active circuit element.

Original COM help: <https://opendss.epri.com/TotalPowers.html>
"""
function TotalPowers(dss::DSSContext)::Vector{ComplexF64}
    return get_complex64_array(dss.capi.CktElement_Get_TotalPowers, dss)
end
TotalPowers() = TotalPowers(DSS_DEFAULT_CTX)

"""
Complex array of voltages at terminals

Original COM help: <https://opendss.epri.com/Voltages1.html>
"""
function Voltages(dss::DSSContext)::Vector{ComplexF64}
    return get_complex64_array(dss.capi.CktElement_Get_Voltages, dss)
end
Voltages() = Voltages(DSS_DEFAULT_CTX)

"""
Voltages at each conductor in magnitude, angle form as array of doubles.

Original COM help: <https://opendss.epri.com/VoltagesMagAng.html>
"""
function VoltagesMagAng(dss::DSSContext)::Matrix{Float64}
    r = get_float64_array(dss.capi.CktElement_Get_VoltagesMagAng, dss)
    return reshape(r, (2, Int(length(r) / 2)))
end
VoltagesMagAng() = VoltagesMagAng(DSS_DEFAULT_CTX)

"""
YPrim matrix, column order, complex numbers

Original COM help: <https://opendss.epri.com/Yprim.html>
"""
function YPrim(dss::DSSContext)::Matrix{ComplexF64}
    r = get_complex64_array(dss.capi.CktElement_Get_Yprim, dss)
        # TODO: should we transpose here?
    return reshape(r, (Int(sqrt(length(r))), Int(sqrt(length(r)))))
end
YPrim() = YPrim(DSS_DEFAULT_CTX)

"""
Returns true if the current active element is isolated.
Note that this only fetches the current value. See also the Topology interface.

**(API Extension)**
"""
function IsIsolated(dss::DSSContext)::Bool
    return (@checked dss_ccall(dss.capi.CktElement_Get_IsIsolated, dss.ctx)) != 0
end
IsIsolated() = IsIsolated(DSS_DEFAULT_CTX)

"""
Array of integers, a copy of the internal NodeRef of the CktElement.

Be sure to run a solution to initialize the values after the circuit is created or modified.

**(API Extension)**
"""
function NodeRef(dss::DSSContext)::Vector{Int}
    return get_int32_array(dss.capi.CktElement_Get_NodeRef, dss)
end
NodeRef() = NodeRef(DSS_DEFAULT_CTX)

"""
Order (size) of the active circuit element's primite Y matrix (Yprim), typically `NumConductors * NumTerminals`

**(API Extension)**
"""
function YPrimOrder(dss::DSSContext)::Int
    return @checked dss_ccall(dss.capi.CktElement_Get_YprimOrder, dss.ctx)
end
YPrimOrder() = YPrimOrder(DSS_DEFAULT_CTX)

end
