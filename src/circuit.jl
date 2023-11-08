module Circuit

using ..Lib
using ..Utils

"""Compute capacity"""
function Capacity(dss::DSSContext, Start, Increment)::Float64
    return @checked Lib.Circuit_Capacity(dss.ctx, Start, Increment)
end
Capacity(Start, Increment) = Capacity(DSS_DEFAULT_CTX, Start, Increment)

"""Disable circuit"""
function Disable(dss::DSSContext, Name::String)
    @checked Lib.Circuit_Disable(dss.ctx, Cstring(pointer(Name)))
end
Disable(Name::String) = Disable(DSS_DEFAULT_CTX, Name)

"""Enable circuit"""
function Enable(dss::DSSContext, Name::String)
    @checked Lib.Circuit_Enable(dss.ctx, Cstring(pointer(Name)))
end
Enable(Name::String) = Enable(DSS_DEFAULT_CTX, Name)

"""Do end of time step update and cleanup"""
function EndOfTimeStepUpdate(dss::DSSContext)
    @checked Lib.Circuit_EndOfTimeStepUpdate(dss.ctx)
end
EndOfTimeStepUpdate() = EndOfTimeStepUpdate(DSS_DEFAULT_CTX)

"""Set first element in active class to be active"""
function FirstElement(dss::DSSContext)::Int
    return @checked Lib.Circuit_FirstElement(dss.ctx)
end
FirstElement() = FirstElement(DSS_DEFAULT_CTX)

"""Set first PCElement to be active"""
function FirstPCElement(dss::DSSContext)::Int
    return @checked Lib.Circuit_FirstPCElement(dss.ctx)
end
FirstPCElement() = FirstPCElement(DSS_DEFAULT_CTX)

"""Set first PDElement to be active"""
function FirstPDElement(dss::DSSContext)::Int
    return @checked Lib.Circuit_FirstPDElement(dss.ctx)
end
FirstPDElement() = FirstPDElement(DSS_DEFAULT_CTX)

"""Returns an array of doubles representing the distances to parent EnergyMeter. Sequence of array corresponds to other node ByPhase properties."""
function AllNodeDistancesByPhase(dss::DSSContext, Phase::Int)::Vector{Float64}
    return get_float64_array(Lib.Circuit_Get_AllNodeDistancesByPhase, dss.ctx, Phase)
end
AllNodeDistancesByPhase(Phase::Int) = AllNodeDistancesByPhase(DSS_DEFAULT_CTX, Phase)

"""Return array of strings of the node names for the By Phase criteria. Sequence corresponds to other ByPhase properties."""
function AllNodeNamesByPhase(dss::DSSContext, Phase::Int)::Vector{String}
    return get_string_array(Lib.Circuit_Get_AllNodeNamesByPhase, dss.ctx, Phase)
end
AllNodeNamesByPhase(Phase::Int) = AllNodeNamesByPhase(DSS_DEFAULT_CTX, Phase)

"""Returns Array of doubles represent voltage magnitudes for nodes on the specified phase."""
function AllNodeVmagByPhase(dss::DSSContext, Phase::Int)::Vector{Float64}
    return get_float64_array(Lib.Circuit_Get_AllNodeVmagByPhase, dss.ctx, Phase)
end
AllNodeVmagByPhase(Phase::Int) = AllNodeVmagByPhase(DSS_DEFAULT_CTX, Phase)

"""Returns array of per unit voltage magnitudes for each node by phase"""
function AllNodeVmagPUByPhase(dss::DSSContext, Phase::Int)::Vector{Float64}
    return get_float64_array(Lib.Circuit_Get_AllNodeVmagPUByPhase, dss.ctx, Phase)
end
AllNodeVmagPUByPhase(Phase::Int) = AllNodeVmagPUByPhase(DSS_DEFAULT_CTX, Phase)

"""Set next element in active class to be active"""
function NextElement(dss::DSSContext)::Int
    return @checked Lib.Circuit_NextElement(dss.ctx)
end
NextElement() = NextElement(DSS_DEFAULT_CTX)

"""Set next PCElement to be active"""
function NextPCElement(dss::DSSContext)::Int
    return @checked Lib.Circuit_NextPCElement(dss.ctx)
end
NextPCElement() = NextPCElement(DSS_DEFAULT_CTX)

"""Set next PDElement to be active"""
function NextPDElement(dss::DSSContext)::Int
    return @checked Lib.Circuit_NextPDElement(dss.ctx)
end
NextPDElement() = NextPDElement(DSS_DEFAULT_CTX)

"""Sample all meters and monitors"""
function Sample(dss::DSSContext)
    @checked Lib.Circuit_Sample(dss.ctx)
end
Sample() = Sample(DSS_DEFAULT_CTX)

"""Save all all meters and monitors registers and buffers"""
function SaveSample(dss::DSSContext)
    @checked Lib.Circuit_SaveSample(dss.ctx)
end
SaveSample() = SaveSample(DSS_DEFAULT_CTX)

"""Set active bus name"""
function SetActiveBus(dss::DSSContext, BusName::String)::Int
    return @checked Lib.Circuit_SetActiveBus(dss.ctx, Cstring(pointer(BusName)))
end
SetActiveBus(BusName::String) = SetActiveBus(DSS_DEFAULT_CTX, BusName)

"""Set active bus index"""
function SetActiveBusi(dss::DSSContext, BusIndex::Int)::Int
    return @checked Lib.Circuit_SetActiveBusi(dss.ctx, BusIndex)
end
SetActiveBusi(BusIndex::Int) = SetActiveBusi(DSS_DEFAULT_CTX, BusIndex)

"""Set active class name"""
function SetActiveClass(dss::DSSContext, ClassName::String)::Int
    return @checked Lib.Circuit_SetActiveClass(dss.ctx, Cstring(pointer(ClassName)))
end
SetActiveClass(ClassName::String) = SetActiveClass(DSS_DEFAULT_CTX, ClassName)

"""Set active element full name"""
function SetActiveElement(dss::DSSContext, FullName::String)::Int
    return @checked Lib.Circuit_SetActiveElement(dss.ctx, Cstring(pointer(FullName)))
end
SetActiveElement(FullName::String) = SetActiveElement(DSS_DEFAULT_CTX, FullName)

"""Update storage"""
function UpdateStorage(dss::DSSContext)
    @checked Lib.Circuit_UpdateStorage(dss.ctx)
end
UpdateStorage() = UpdateStorage(DSS_DEFAULT_CTX)

"""Returns distance from each bus to parent EnergyMeter. Corresponds to sequence in AllBusNames."""
function AllBusDistances(dss::DSSContext)::Vector{Float64}
    return get_float64_array(Lib.Circuit_Get_AllBusDistances, dss.ctx)
end
AllBusDistances() = AllBusDistances(DSS_DEFAULT_CTX)

"""Array of strings containing names of all buses in circuit (see AllNodeNames)."""
function AllBusNames(dss::DSSContext)::Vector{String}
    return get_string_array(Lib.Circuit_Get_AllBusNames, dss.ctx)
end
AllBusNames() = AllBusNames(DSS_DEFAULT_CTX)

"""Array of magnitudes (doubles) of voltages at all buses"""
function AllBusVMag(dss::DSSContext)::Vector{Float64}
    return get_float64_array(Lib.Circuit_Get_AllBusVmag, dss.ctx)
end
AllBusVMag() = AllBusVMag(DSS_DEFAULT_CTX)

"""Double Array of all bus voltages (each node) magnitudes in Per unit"""
function AllBusMagPu(dss::DSSContext)::Vector{Float64}
    return get_float64_array(Lib.Circuit_Get_AllBusVmagPu, dss.ctx)
end
AllBusMagPu() = AllBusMagPu(DSS_DEFAULT_CTX)

"""Complex array of all bus, node voltages from most recent solution"""
function AllBusVolts(dss::DSSContext)::Vector{ComplexF64}
    return get_complex64_array(Lib.Circuit_Get_AllBusVolts, dss.ctx)
end
AllBusVolts() = AllBusVolts(DSS_DEFAULT_CTX)

"""Array of total losses (complex) in each circuit element"""
function AllElementLosses(dss::DSSContext)::Vector{Float64}
    return get_float64_array(Lib.Circuit_Get_AllElementLosses, dss.ctx)
end
AllElementLosses() = AllElementLosses(DSS_DEFAULT_CTX)

"""Array of strings containing Full Name of all elements."""
function AllElementNames(dss::DSSContext)::Vector{String}
    return get_string_array(Lib.Circuit_Get_AllElementNames, dss.ctx)
end
AllElementNames() = AllElementNames(DSS_DEFAULT_CTX)

"""Returns an array of distances from parent EnergyMeter for each Node. Corresponds to AllBusVMag sequence."""
function AllNodeDistances(dss::DSSContext)::Vector{Float64}
    return get_float64_array(Lib.Circuit_Get_AllNodeDistances, dss.ctx)
end
AllNodeDistances() = AllNodeDistances(DSS_DEFAULT_CTX)

"""Array of strings containing full name of each node in system in same order as returned by AllBusVolts, etc."""
function AllNodeNames(dss::DSSContext)::Vector{String}
    return get_string_array(Lib.Circuit_Get_AllNodeNames, dss.ctx)
end
AllNodeNames() = AllNodeNames(DSS_DEFAULT_CTX)

"""Complex total line losses in the circuit"""
function LineLosses(dss::DSSContext)::Complex
    return get_complex64(Lib.Circuit_Get_LineLosses, dss.ctx)
end
LineLosses() = LineLosses(DSS_DEFAULT_CTX)

"""Total losses in active circuit, complex number (two-element array of double)."""
function Losses(dss::DSSContext)::Complex
    return get_complex64(Lib.Circuit_Get_Losses, dss.ctx)
end
Losses() = Losses(DSS_DEFAULT_CTX)

"""Name of the active circuit."""
function Name(dss::DSSContext)::String
    return get_string(@checked Lib.Circuit_Get_Name(dss.ctx))
end
Name() = Name(DSS_DEFAULT_CTX)

"""Total number of Buses in the circuit."""
function NumBuses(dss::DSSContext)::Int
    return @checked Lib.Circuit_Get_NumBuses(dss.ctx)
end
NumBuses() = NumBuses(DSS_DEFAULT_CTX)

"""Number of CktElements in the circuit."""
function NumCktElements(dss::DSSContext)::Int
    return @checked Lib.Circuit_Get_NumCktElements(dss.ctx)
end
NumCktElements() = NumCktElements(DSS_DEFAULT_CTX)

"""Total number of nodes in the circuit."""
function NumNodes(dss::DSSContext)::Int
    return @checked Lib.Circuit_Get_NumNodes(dss.ctx)
end
NumNodes() = NumNodes(DSS_DEFAULT_CTX)

"""Sets Parent PD element, if any, to be the active circuit element and returns index>0; Returns 0 if it fails or not applicable."""
function ParentPDElement(dss::DSSContext)::Int
    return @checked Lib.Circuit_Get_ParentPDElement(dss.ctx)
end
ParentPDElement() = ParentPDElement(DSS_DEFAULT_CTX)

"""Complex losses in all transformers designated to substations."""
function SubstationLosses(dss::DSSContext)::Complex
    return get_complex64(Lib.Circuit_Get_SubstationLosses, dss.ctx)
end
SubstationLosses() = SubstationLosses(DSS_DEFAULT_CTX)

"""System Y matrix (after a solution has been performed)
Deprecated, consider using YMatrix.getYsparse() instead"""
function SystemY(dss::DSSContext)::Matrix{ComplexF64}
    r = get_float64_array(Lib.Circuit_Get_SystemY, dss.ctx)
    r = Array(reinterpret(ComplexF64, r))
    return reshape(r, (Int(sqrt(length(r))), Int(sqrt(length(r)))))
end
SystemY() = SystemY(DSS_DEFAULT_CTX)

"""Total power, watts delivered to the circuit"""
function TotalPower(dss::DSSContext)::Complex
    return get_complex64(Lib.Circuit_Get_TotalPower, dss.ctx)
end
TotalPower() = TotalPower(DSS_DEFAULT_CTX)

"""Array of doubles containing complex injection currents for the present solution. Is is the "I" vector of I=YV"""
function YCurrents(dss::DSSContext)::Vector{ComplexF64}
    return get_complex64_array(Lib.Circuit_Get_YCurrents, dss.ctx)
end
YCurrents() = YCurrents(DSS_DEFAULT_CTX)

"""Array of strings containing the names of the nodes in the same order as the Y matrix"""
function YNodeOrder(dss::DSSContext)::Vector{String}
    return get_string_array(Lib.Circuit_Get_YNodeOrder, dss.ctx)
end
YNodeOrder() = YNodeOrder(DSS_DEFAULT_CTX)

"""Complex array of actual node voltages in same order as SystemY matrix."""
function YNodeVArray(dss::DSSContext)::Vector{ComplexF64}
    return get_complex64_array(Lib.Circuit_Get_YNodeVarray, dss.ctx)
end
YNodeVArray() = YNodeVArray(DSS_DEFAULT_CTX)

"""Activates a circuit element by the given index"""
function SetCktElement(dss::DSSContext, Idx::Int)
    @checked Lib.Circuit_SetCktElementIndex(dss.ctx, Idx)
end
SetCktElement(Idx::Int) = SetCktElement(DSS_DEFAULT_CTX, Idx)

"""Activates a circuit element by the given name"""
function SetCktElement(dss::DSSContext, Name::String)
    @checked Lib.Circuit_SetCktElementName(dss.ctx, Name)
end
SetCktElement(Name::String) = SetCktElement(DSS_DEFAULT_CTX, Name)

"""Array of total losses (complex) in a selection of elements.
Use the element indices (starting at 1) as parameter.

(API Extension)"""
function ElementLosses(dss::DSSContext, Idx::Vector{Int32})::Vector{ComplexF64}
    value, value_ptr, value_cnt = prepare_int32_array(Idx)
    return get_complex64_array(Lib.Circuit_Get_ElementLosses, dss.ctx, value_ptr, value_cnt)
end
ElementLosses(Idx::Vector{Int32}) = ElementLosses(DSS_DEFAULT_CTX, Idx)

"""EXPERIMENTAL: Loads a full circuit from a JSON-encoded string. The data must 
be encoded using the proposed AltDSS Schema, see
https://github.com/dss-extensions/altdss-schema/ and 
https://github.com/orgs/dss-extensions/discussions/ for links to docs and to
provide feedback for future revisions.

The options argument is an integer bitset from the enum `DSSJSONFlags`.

(API Extension)"""
function FromJSON(dss::DSSContext, circ::String, options::Int32)
    @checked Lib.Circuit_FromJSON(dss.ctx, Cstring(pointer(circ)), options)
end
FromJSON(circ::String, options::Int32) = FromJSON(DSS_DEFAULT_CTX, circ, options)

"""EXPERIMENTAL: Returns the general circuit data, including all DSS objects, as a
JSON-encoded string. The data is encoded using the proposed AltDSS Schema, see
https://github.com/dss-extensions/altdss-schema/ and 
https://github.com/orgs/dss-extensions/discussions/ for links to docs and to
provide feedback for future revisions.

The options argument is an integer bitset from the enum `DSSJSONFlags`.

(API Extension)"""
function ToJSON(dss::DSSContext, options::Int32)::String
    return get_string(@checked Lib.Circuit_ToJSON(dss.ctx, options))
end
ToJSON(options::Int32) = ToJSON(DSS_DEFAULT_CTX, options)

"""
Equivalent of the "save circuit" DSS command, but allows customization
through the `saveFlags` argument, which is a set of bit flags. 
See the `DSSSaveFlags` enumeration for available flags:

- `CalcVoltageBases`: Include the command CalcVoltageBases.
- `SetVoltageBases`: Include commands to set the voltage bases individually.
- `IncludeOptions`: Include most of the options (from the Set/Get DSS commands).
- `IncludeDisabled`: Include disabled circuit elements (and LoadShapes).
- `ExcludeDefault`: Exclude default DSS items if they are not modified by the user.
- `SingleFile`: Use a single file instead of a folder for output.
- `KeepOrder`: Save the circuit elements in the order they were loaded in the active circuit. Guarantees better reproducibility, especially when the system is ill-conditioned. Requires "SingleFile" flag.
- `ExcludeMeterZones`: Do not export meter zones (as "feeders") separately. Has no effect when using a single file.
- `IsOpen`: Export commands to open terminals of elements.
- `ToString`: to the result string. Requires "SingleFile" flag.

If `SingleFile` is enabled, the path name argument (`dirOrFilePath`) is the file path,
otherwise it is the folder path. For string output, the argument is not used.

(API Extension)"""
function Save(dss::DSSContext, dirOrFilePath::String, saveFlags::Int32)::String
    return get_string(@checked Lib.Circuit_Save(dss.ctx, Cstring(pointer(dirOrFilePath)), saveFlags))
end
Save(dirOrFilePath::String, saveFlags::Int32) = Save(DSS_DEFAULT_CTX, dirOrFilePath, saveFlags)

end
