"""
The CircuitElement module contains shared functions for all circuit elements.
Its functions are reexported in the dedicated modules for the concrete types 
(e.g. `Load`, `Transformer`, `Generator` reexport these functions).
"""
module CircuitElement
using ..Common
using ..Enums: OCPDevType

"""
Object's GUID/UUID. Currently used only in the CIM-related methods.

Original COM help: https://opendss.epri.com/GUID.html
"""
function GUID(obj::AbstractCircuitElement)::String
    obj_get_str(obj, obj.dss.capi.Alt_CE_Get_GUID)
end

"""
Display name of the object (not necessarily unique)

Original COM help: https://opendss.epri.com/DisplayName.html

(Getter)
"""
function DisplayName(obj::AbstractCircuitElement)::String
    obj_get_str(obj, obj.dss.capi.Alt_CE_Get_DisplayName)
end

"""
Display name of the object (not necessarily unique)

Original COM help: https://opendss.epri.com/DisplayName.html

(Setter)
"""
function DisplayName(obj::AbstractCircuitElement, value::String)
    obj_get_str(obj, obj.dss.capi.Alt_CE_Set_DisplayName)
end

"""
Index of this element into the circuit's element list.

Original COM help: https://opendss.epri.com/Handle.html
"""
function Handle(obj::AbstractCircuitElement)::Int32
    obj_get_int32(obj, obj.dss.capi.Alt_CE_Get_Handle)
end

"""
Number of conductors per terminal

Original COM help: https://opendss.epri.com/NumConductors.html
"""
function NumConductors(obj::AbstractCircuitElement)::Int32
    obj_get_int32(obj, obj.dss.capi.Alt_CE_Get_NumConductors)
end

"""
Number of phases

Original COM help: https://opendss.epri.com/NumPhases.html
"""
function NumPhases(obj::AbstractCircuitElement)::Int32 #TODO remove? Redundant
    obj_get_int32(obj, obj.dss.capi.Alt_CE_Get_NumPhases)
end

"""
Number of terminals in this circuit element

Original COM help: https://opendss.epri.com/NumTerminals.html
"""
function NumTerminals(obj::AbstractCircuitElement)::Int32
    obj_get_int32(obj, obj.dss.capi.Alt_CE_Get_NumTerminals)
end

"""
Number of controllers connected to this device. 

Original COM help: https://opendss.epri.com/NumControls.html
"""
function NumControllers(obj::AbstractCircuitElement)::Int32
    obj_get_int32(obj, obj.dss.capi.Alt_CE_Get_NumControllers)
end

"""
Returns (as a Python object) the OCP device controlling this element, if any.
"""
function OCPDevice(obj::AbstractCircuitElement)::Union{DSSObj, Nothing}
    obj_get_obj(obj, obj.dss.capi.Alt_CE_Get_OCPDevice)
end

"""
Index into controller list of OCP Device controlling this circuit element

Original COM help: https://opendss.epri.com/OCPDevIndex.html
"""
function OCPDeviceIndex(obj::AbstractCircuitElement)::Int32
    obj_get_int32(obj, obj.dss.capi.Alt_CE_Get_OCPDeviceIndex)
end

"""
Type of OCP controller device

Original COM help: https://opendss.epri.com/OCPDevType.html
"""
function OCPDeviceType(obj::AbstractCircuitElement)::OCPDevType.T
    convert(OCPDevType.T, obj_get_int32(obj, obj.dss.capi.OCPDeviceType))
end

"""
Returns true if the element is isolated.
Note that this only fetches the current value. See also the Topology interface.
"""
function IsIsolated(obj::AbstractCircuitElement)::Bool
    obj_get_bool(obj, obj.dss.capi.Alt_CE_Get_IsIsolated)
end

"""
Returns true if a recloser, relay, or fuse controlling the circuit element.

OCP = Overcurrent Protection 

Original COM help: https://opendss.epri.com/HasOCPDevice.html
"""
function HasOCPDevice(obj::AbstractCircuitElement)::Bool
    obj_get_bool(obj, obj.dss.capi.Alt_CE_Get_HasOCPDevice)
end

"""
Returns true if the element has a SwtControl attached.

Original COM help: https://opendss.epri.com/HasSwitchControl.html
"""
function HasSwitchControl(obj::AbstractCircuitElement)::Bool
    obj_get_bool(obj, obj.dss.capi.Alt_CE_Get_HasSwitchControl)
end

"""
Returns true if the element has a CapControl or RegControl attached.

Original COM help: https://opendss.epri.com/HasVoltControl.html
"""
function HasVoltControl(obj::AbstractCircuitElement)::Bool
    obj_get_bool(obj, obj.dss.capi.Alt_CE_Get_HasVoltControl)
end

"""
Returns true if the specified terminal and phase are open.

If the `phase` parameter is zero, returns if **any** conductor at the terminal is open.
"""
function IsOpen(obj::AbstractCircuitElement, terminal::Int, phase::Int=0)::Bool
    obj_get_bool(obj, obj.dss.capi.Alt_CE_IsOpen, terminal, phase)
end

"""
Returns the maximum current (magnitude) at the specified terminal. 
Use -1 as terminal to get the value across all terminals.
"""
function MaxCurrent(obj::AbstractCircuitElement, terminal::Int=-1)::Float64
    obj_get_float64(obj, obj.dss.capi.Alt_CE_MaxCurrent, terminal)
end

"""
Open the specified terminal and phase, if non-zero, or all conductors at the terminal.

Original COM help: https://opendss.epri.com/Open1.html
"""
function Open(obj::AbstractCircuitElement, terminal::Int, phase::Int=0)
    obj_generic_call(obj, obj.dss.capi.Alt_CE_Open, terminal, phase)
end

"""
Close the specified terminal and phase, if non-zero, or all conductors at the terminal.

Original COM help: https://opendss.epri.com/Close1.html
"""
function Close(obj::AbstractCircuitElement, terminal::Int, phase::Int=0)
    obj_generic_call(obj, obj.dss.capi.Alt_CE_Close, terminal, phase)
end

"""
Array of integer containing the node numbers (representing phases, for example) for each conductor of each terminal.

Be sure to run a solution to initialize the values after the circuit is created or modified.
"""
function NodeOrder(obj::AbstractCircuitElement)::Vector{Int32}
    obj_get_int32s(obj, obj.dss.capi.Alt_CE_Get_NodeOrder)
end

"""
Array of integers, a copy of the internal NodeRef of the CktElement.

Be sure to run a solution to initialize the values after the circuit is created or modified.
"""
function NodeRef(obj::AbstractCircuitElement)::Vector{Int32}
    obj_get_int32s(obj, obj.dss.capi.Alt_CE_Get_NodeRef)
end

"""
Complex array of sequence voltages for all terminals of this circuit element.

Each column represents a terminal.

Original COM help: https://opendss.epri.com/CplxSeqVoltages1.html
"""
function ComplexSeqVoltages(obj::AbstractCircuitElement)::Matrix{ComplexF64}
    obj_get_complex128s(obj, obj.dss.capi.Alt_CE_Get_ComplexSeqVoltages; matrix=true)
end

"""
Complex array of sequence currents for all terminals of this circuit element.

Each column represents a terminal.

Original COM help: https://opendss.epri.com/CplxSeqCurrents.html
"""
function ComplexSeqCurrents(obj::AbstractCircuitElement)::Matrix{ComplexF64}
    obj_get_complex128s(obj, obj.dss.capi.Alt_CE_Get_ComplexSeqCurrents; matrix=true)
end

"""
Complex array of currents into each conductor of each terminal

Original COM help: https://opendss.epri.com/Currents1.html
"""
function Currents(obj::AbstractCircuitElement)::Matrix{ComplexF64}
    obj_get_complex128s(obj, obj.dss.capi.Alt_CE_Get_Currents; matrix=true)
end

"""
Currents in magnitude, angle (degrees) format as a array of doubles.

Original COM help: https://opendss.epri.com/CurrentsMagAng.html
"""
function CurrentsMagAng(obj::AbstractCircuitElement)::Matrix{Float64}
    obj_get_float64s(obj, obj.dss.capi.Alt_CE_Get_CurrentsMagAng; matrix=true)
end

"""
Complex array of voltages at terminals

Original COM help: https://opendss.epri.com/Voltages1.html
"""
function Voltages(obj::AbstractCircuitElement)::Matrix{ComplexF64}
    obj_get_complex128s(obj, obj.dss.capi.Alt_CE_Get_Voltages; matrix=true)
end

"""
Total (complex) losses in the element, in VA (watts, vars)

Original COM help: https://opendss.epri.com/Losses1.html
"""
function Losses(obj::AbstractCircuitElement)::ComplexF64
    obj_get_complex128(obj, obj.dss.capi.Alt_CE_Get_Losses)
end

"""
Complex array of losses (kVA) by phase

Original COM help: https://opendss.epri.com/PhaseLosses.html
"""
function PhaseLosses(obj::AbstractCircuitElement)::Vector{ComplexF64}
    obj_get_complex128s(obj, obj.dss.capi.Alt_CE_Get_PhaseLosses)
end

"""
Complex array of powers (kVA) into each conductor of each terminal

Original COM help: https://opendss.epri.com/Powers.html
"""
function Powers(obj::AbstractCircuitElement)::Matrix{ComplexF64}
    obj_get_complex128s(obj, obj.dss.capi.Alt_CE_Get_Powers; matrix=true)
end

"""
Array of symmetrical component currents (magnitudes only) into each 3-phase terminal

Original COM help: https://opendss.epri.com/SeqCurrents.html
"""
function SeqCurrents(obj::AbstractCircuitElement)::Matrix{Float64}
    obj_get_float64s(obj, obj.dss.capi.Alt_CE_Get_SeqCurrents; matrix=true)
end

"""
Complex array of sequence powers (kW, kvar) into each 3-phase terminal

Each column represents a terminal.

Original COM help: https://opendss.epri.com/SeqPowers.html
"""
function SeqPowers(obj::AbstractCircuitElement)::Matrix{ComplexF64}
    obj_get_complex128s(obj, obj.dss.capi.Alt_CE_Get_SeqPowers; matrix=true)
end

"""
Array of symmetrical component voltages (magnitudes only) at each 3-phase terminal

Each column represents a terminal.

Original COM help: https://opendss.epri.com/SeqVoltages1.html
"""
function SeqVoltages(obj::AbstractCircuitElement)::Matrix{Float64}
    obj_get_float64s(obj, obj.dss.capi.Alt_CE_Get_SeqVoltages; matrix=true)
end

"""
Residual currents for each terminal: (magnitude, angle in degrees)

Original COM help: https://opendss.epri.com/Residuals.html
"""
function Residuals(obj::AbstractCircuitElement)::Matrix{Float64}
    obj_get_float64s(obj, obj.dss.capi.Alt_CE_Get_Residuals; matrix=true)
end

"""
YPrim matrix, column order, complex numbers

Original COM help: https://opendss.epri.com/Yprim.html
"""
function YPrim(obj::AbstractCircuitElement)::Matrix{ComplexF64}
    obj_get_complex128s(obj, obj.dss.capi.Alt_CE_Get_YPrim; matrix=true)
end

"""
Voltages at each conductor in magnitude, angle form as array of doubles.

Original COM help: https://opendss.epri.com/VoltagesMagAng.html
"""
function VoltagesMagAng(obj::AbstractCircuitElement)::Vector{Float64}
    obj_get_float64s(obj, obj.dss.capi.Alt_CE_Get_VoltagesMagAng)
end

"""
Returns an array with the total powers (complex, kVA) at ALL terminals of this circuit element.

Original COM help: https://opendss.epri.com/TotalPowers.html
"""
function TotalPowers(obj::AbstractCircuitElement)::Vector{ComplexF64}
    obj_get_complex128s(obj, obj.dss.capi.Alt_CE_Get_TotalPowers)
end

include("circuit_element_exports.jl")

end # module CircuitElement
export CircuitElement
