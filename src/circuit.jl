module Circuit

using DocStringExtensions

using ..Lib
using ..Utils

@template (FUNCTIONS, METHODS) = """
                                 $(TYPEDSIGNATURES)
                                 $(DOCSTRING)
                                 """

"""
Compute the maximum load the active circuit can serve in the PRESENT YEAR.

This method uses the EnergyMeter objects with the registers set with the
`SET UEREGS= (...)` command for the AutoAdd functions.

Returns the metered kW (load + losses - generation) and per unit load multiplier
for the loading level at which something in the system reports an overload or
undervoltage. If no violations, then it returns the metered kW for peak load
for the year (1.0 multiplier).

Aborts and returns 0 if no EnergyMeters.

Original COM help: https://opendss.epri.com/Capacity1.html
"""
function Capacity(dss::DSSContext, Start, Increment)::Float64
    return @checked Lib.Circuit_Capacity(dss.ctx, Start, Increment)
end
Capacity(Start, Increment) = Capacity(DSS_DEFAULT_CTX, Start, Increment)

"""
Disable a circuit element by name (removes from circuit but leave in database).

Original COM help: https://opendss.epri.com/Disable.html
"""
function Disable(dss::DSSContext, Name::String)
    @checked Lib.Circuit_Disable(dss.ctx, Cstring(pointer(Name)))
end
Disable(Name::String) = Disable(DSS_DEFAULT_CTX, Name)

"""
Enable a circuit element by name

Original COM help: https://opendss.epri.com/Enable.html
"""
function Enable(dss::DSSContext, Name::String)
    @checked Lib.Circuit_Enable(dss.ctx, Cstring(pointer(Name)))
end
Enable(Name::String) = Enable(DSS_DEFAULT_CTX, Name)

"""
Call `EndOfTimeStepCleanup` in SolutionAlgs (Do cleanup, sample monitors, and increment time).

Original COM help: https://opendss.epri.com/EndOfTimeStepUpdate.html
"""
function EndOfTimeStepUpdate(dss::DSSContext)
    @checked Lib.Circuit_EndOfTimeStepUpdate(dss.ctx)
end
EndOfTimeStepUpdate() = EndOfTimeStepUpdate(DSS_DEFAULT_CTX)

"""
Set the first element of active class to be the Active element in the active circuit.

Returns 0 if none.

Original COM help: https://opendss.epri.com/FirstElement.html
"""
function FirstElement(dss::DSSContext)::Int
    return @checked Lib.Circuit_FirstElement(dss.ctx)
end
FirstElement() = FirstElement(DSS_DEFAULT_CTX)

"""
Set the first Power Conversion (PC) element to be the active element.

Returns 0 if none.

Original COM help: https://opendss.epri.com/FirstPCElement.html
"""
function FirstPCElement(dss::DSSContext)::Int
    return @checked Lib.Circuit_FirstPCElement(dss.ctx)
end
FirstPCElement() = FirstPCElement(DSS_DEFAULT_CTX)

"""
Set the first Power Delivery (PD) element to be the active element.

Returns 0 if none.

Original COM help: https://opendss.epri.com/FirstPDElement.html
"""
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

"""
Set the next element of the active class to be the active element in the active circuit.
Returns 0 if no more elements..

Original COM help: https://opendss.epri.com/NextElement.html
"""
function NextElement(dss::DSSContext)::Int
    return @checked Lib.Circuit_NextElement(dss.ctx)
end
NextElement() = NextElement(DSS_DEFAULT_CTX)

"""
Get the next Power Conversion (PC) element to be the active element.

Original COM help: https://opendss.epri.com/NextPCElement.html
"""
function NextPCElement(dss::DSSContext)::Int
    return @checked Lib.Circuit_NextPCElement(dss.ctx)
end
NextPCElement() = NextPCElement(DSS_DEFAULT_CTX)

"""
Get the next Power Delivery (PD) element to be the active element.

Original COM help: https://opendss.epri.com/NextPDElement.html
"""
function NextPDElement(dss::DSSContext)::Int
    return @checked Lib.Circuit_NextPDElement(dss.ctx)
end
NextPDElement() = NextPDElement(DSS_DEFAULT_CTX)

"""
Force all Meters and Monitors to take a sample.

Original COM help: https://opendss.epri.com/Sample.html
"""
function Sample(dss::DSSContext)
    @checked Lib.Circuit_Sample(dss.ctx)
end
Sample() = Sample(DSS_DEFAULT_CTX)

"""
Force all meters and monitors to save their current buffers.

Original COM help: https://opendss.epri.com/SaveSample.html
"""
function SaveSample(dss::DSSContext)
    @checked Lib.Circuit_SaveSample(dss.ctx)
end
SaveSample() = SaveSample(DSS_DEFAULT_CTX)

"""
Sets Active bus by name.

Ignores node list. Returns bus index (zero based) compatible with `AllBusNames` and Buses collection.

Original COM help: https://opendss.epri.com/SetActiveBus.html
"""
function SetActiveBus(dss::DSSContext, BusName::String)::Int
    return @checked Lib.Circuit_SetActiveBus(dss.ctx, Cstring(pointer(BusName)))
end
SetActiveBus(BusName::String) = SetActiveBus(DSS_DEFAULT_CTX, BusName)

"""
Set ActiveBus by an integer value.

0-based index compatible with SetActiveBus return value and AllBusNames indexing.
Returns 0 if OK.

Original COM help: https://opendss.epri.com/SetActiveBusi.html
"""
function SetActiveBusi(dss::DSSContext, BusIndex::Int)::Int
    return @checked Lib.Circuit_SetActiveBusi(dss.ctx, BusIndex)
end
SetActiveBusi(BusIndex::Int) = SetActiveBusi(DSS_DEFAULT_CTX, BusIndex)

"""
Set the active class by name.

Use FirstElement, NextElement to iterate through the class. Returns -1 if fails.

Original COM help: https://opendss.epri.com/SetActiveClass.html
"""
function SetActiveClass(dss::DSSContext, ClassName::String)::Int
    return @checked Lib.Circuit_SetActiveClass(dss.ctx, Cstring(pointer(ClassName)))
end
SetActiveClass(ClassName::String) = SetActiveClass(DSS_DEFAULT_CTX, ClassName)

"""
Set the Active Circuit Element using the full object name (e.g. "generator.g1").

Returns -1 if not found. Else index to be used in CktElements collection or `AllElementNames`.

Original COM help: https://opendss.epri.com/SetActiveElement.html
"""
function SetActiveElement(dss::DSSContext, FullName::String)::Int
    return @checked Lib.Circuit_SetActiveElement(dss.ctx, Cstring(pointer(FullName)))
end
SetActiveElement(FullName::String) = SetActiveElement(DSS_DEFAULT_CTX, FullName)

"""
Force an update to all storage classes.

Typically done after a solution. Done automatically in intrinsic solution modes.

Original COM help: https://opendss.epri.com/UpdateStorage.html
"""
function UpdateStorage(dss::DSSContext)
    @checked Lib.Circuit_UpdateStorage(dss.ctx)
end
UpdateStorage() = UpdateStorage(DSS_DEFAULT_CTX)

"""
Returns distance from each bus to parent EnergyMeter. Corresponds to sequence in AllBusNames.

Original COM help: https://opendss.epri.com/AllBusDistances.html
"""
function AllBusDistances(dss::DSSContext)::Vector{Float64}
    return get_float64_array(Lib.Circuit_Get_AllBusDistances, dss.ctx)
end
AllBusDistances() = AllBusDistances(DSS_DEFAULT_CTX)

"""
Array of strings containing names of all buses in circuit (see AllNodeNames).

Original COM help: https://opendss.epri.com/AllBusNames.html
"""
function AllBusNames(dss::DSSContext)::Vector{String}
    return get_string_array(Lib.Circuit_Get_AllBusNames, dss.ctx)
end
AllBusNames() = AllBusNames(DSS_DEFAULT_CTX)

"""
Array of magnitudes (doubles) of voltages at all buses

Original COM help: https://opendss.epri.com/AllBusVmag.html
"""
function AllBusVMag(dss::DSSContext)::Vector{Float64}
    return get_float64_array(Lib.Circuit_Get_AllBusVmag, dss.ctx)
end
AllBusVMag() = AllBusVMag(DSS_DEFAULT_CTX)

"""
Array of all bus voltages (each node) magnitudes in Per unit

Original COM help: https://opendss.epri.com/AllBusVmagPu.html
"""
function AllBusMagPu(dss::DSSContext)::Vector{Float64}
    return get_float64_array(Lib.Circuit_Get_AllBusVmagPu, dss.ctx)
end
AllBusMagPu() = AllBusMagPu(DSS_DEFAULT_CTX)

"""
Complex array of all bus, node voltages from most recent solution

Original COM help: https://opendss.epri.com/AllBusVolts.html
"""
function AllBusVolts(dss::DSSContext)::Vector{ComplexF64}
    return get_complex64_array(Lib.Circuit_Get_AllBusVolts, dss.ctx)
end
AllBusVolts() = AllBusVolts(DSS_DEFAULT_CTX)

"""
Array of total losses (complex) in each circuit element

Original COM help: https://opendss.epri.com/AllElementLosses.html
"""
function AllElementLosses(dss::DSSContext)::Vector{Float64}
    return get_float64_array(Lib.Circuit_Get_AllElementLosses, dss.ctx)
end
AllElementLosses() = AllElementLosses(DSS_DEFAULT_CTX)

"""
Array of strings containing Full Name of all elements.

Original COM help: https://opendss.epri.com/AllElementNames.html
"""
function AllElementNames(dss::DSSContext)::Vector{String}
    return get_string_array(Lib.Circuit_Get_AllElementNames, dss.ctx)
end
AllElementNames() = AllElementNames(DSS_DEFAULT_CTX)

"""
Returns an array of distances from parent EnergyMeter for each Node. Corresponds to AllBusVMag sequence.

Original COM help: https://opendss.epri.com/AllNodeDistances.html
"""
function AllNodeDistances(dss::DSSContext)::Vector{Float64}
    return get_float64_array(Lib.Circuit_Get_AllNodeDistances, dss.ctx)
end
AllNodeDistances() = AllNodeDistances(DSS_DEFAULT_CTX)

"""
Array of strings containing full name of each node in system in same order as returned by AllBusVolts, etc.

Original COM help: https://opendss.epri.com/AllNodeNames.html
"""
function AllNodeNames(dss::DSSContext)::Vector{String}
    return get_string_array(Lib.Circuit_Get_AllNodeNames, dss.ctx)
end
AllNodeNames() = AllNodeNames(DSS_DEFAULT_CTX)

"""
Complex total line losses in the circuit

Original COM help: https://opendss.epri.com/LineLosses.html
"""
function LineLosses(dss::DSSContext)::Complex
    return get_complex64(Lib.Circuit_Get_LineLosses, dss.ctx)
end
LineLosses() = LineLosses(DSS_DEFAULT_CTX)

"""
Total losses in active circuit, complex number (two-element array of double).

Original COM help: https://opendss.epri.com/Losses.html
"""
function Losses(dss::DSSContext)::Complex
    return get_complex64(Lib.Circuit_Get_Losses, dss.ctx)
end
Losses() = Losses(DSS_DEFAULT_CTX)

"""Name of the active circuit."""
function Name(dss::DSSContext)::String
    return get_string(@checked Lib.Circuit_Get_Name(dss.ctx))
end
Name() = Name(DSS_DEFAULT_CTX)

"""
Total number of Buses in the circuit.

Original COM help: https://opendss.epri.com/NumBuses.html
"""
function NumBuses(dss::DSSContext)::Int
    return @checked Lib.Circuit_Get_NumBuses(dss.ctx)
end
NumBuses() = NumBuses(DSS_DEFAULT_CTX)

"""
Number of CktElements in the circuit.

Original COM help: https://opendss.epri.com/NumCktElements.html
"""
function NumCktElements(dss::DSSContext)::Int
    return @checked Lib.Circuit_Get_NumCktElements(dss.ctx)
end
NumCktElements() = NumCktElements(DSS_DEFAULT_CTX)

"""
Total number of nodes in the circuit.

Original COM help: https://opendss.epri.com/NumNodes1.html
"""
function NumNodes(dss::DSSContext)::Int
    return @checked Lib.Circuit_Get_NumNodes(dss.ctx)
end
NumNodes() = NumNodes(DSS_DEFAULT_CTX)

"""
Sets Parent PD element, if any, to be the active circuit element and returns index>0; Returns 0 if it fails or not applicable.

Original COM help: https://opendss.epri.com/ParentPDElement.html
"""
function ParentPDElement(dss::DSSContext)::Int
    return @checked Lib.Circuit_Get_ParentPDElement(dss.ctx)
end
ParentPDElement() = ParentPDElement(DSS_DEFAULT_CTX)

"""
Complex losses in all transformers designated to substations.

Original COM help: https://opendss.epri.com/SubstationLosses.html
"""
function SubstationLosses(dss::DSSContext)::Complex
    return get_complex64(Lib.Circuit_Get_SubstationLosses, dss.ctx)
end
SubstationLosses() = SubstationLosses(DSS_DEFAULT_CTX)

"""
System Y matrix (after a solution has been performed).
This is deprecated as it returns a dense matrix. Only use it for small systems.
For large-scale systems, prefer YMatrix.GetCompressedYMatrix.

Original COM help: https://opendss.epri.com/SystemY.html
"""
function SystemY(dss::DSSContext)::Matrix{ComplexF64}
    r = get_float64_array(Lib.Circuit_Get_SystemY, dss.ctx)
    r = Array(reinterpret(ComplexF64, r))
    return reshape(r, (Int(sqrt(length(r))), Int(sqrt(length(r)))))
end
SystemY() = SystemY(DSS_DEFAULT_CTX)

"""
Total power (complex), kVA delivered to the circuit

Original COM help: https://opendss.epri.com/TotalPower.html
"""
function TotalPower(dss::DSSContext)::Complex
    return get_complex64(Lib.Circuit_Get_TotalPower, dss.ctx)
end
TotalPower() = TotalPower(DSS_DEFAULT_CTX)

"""
Array of doubles containing complex injection currents for the present solution. It is the "I" vector of I=YV

Original COM help: https://opendss.epri.com/YCurrents.html
"""
function YCurrents(dss::DSSContext)::Vector{ComplexF64}
    return get_complex64_array(Lib.Circuit_Get_YCurrents, dss.ctx)
end
YCurrents() = YCurrents(DSS_DEFAULT_CTX)

"""
Array of strings containing the names of the nodes in the same order as the Y matrix

Original COM help: https://opendss.epri.com/YNodeOrder.html
"""
function YNodeOrder(dss::DSSContext)::Vector{String}
    return get_string_array(Lib.Circuit_Get_YNodeOrder, dss.ctx)
end
YNodeOrder() = YNodeOrder(DSS_DEFAULT_CTX)

"""
Complex array of actual node voltages in same order as SystemY matrix.

Original COM help: https://opendss.epri.com/YNodeVarray.html
"""
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

"""
Array of total losses (complex) in a selection of elements.
Use the element indices (starting at 1) as parameter.

**(API Extension)**
"""
function ElementLosses(dss::DSSContext, Idx::Vector{Int32})::Vector{ComplexF64}
    value, value_ptr, value_cnt = prepare_int32_array(Idx)
    return get_complex64_array(Lib.Circuit_Get_ElementLosses, dss.ctx, value_ptr, value_cnt)
end
ElementLosses(Idx::Vector{Int32}) = ElementLosses(DSS_DEFAULT_CTX, Idx)

"""
**EXPERIMENTAL:** Loads a full circuit from a JSON-encoded string, replacing the current circuit.
The data must be encoded using the proposed AltDSS Schema, see
https://github.com/dss-extensions/altdss-schema/ and 
https://github.com/orgs/dss-extensions/discussions/ for links to docs and to
provide feedback for future revisions.

The options argument is an integer bitset from the enum `DSSJSONFlags`.

**(API Extension)**
"""
function FromJSON(dss::DSSContext, circ::String, options::Int32)
    @checked Lib.Circuit_FromJSON(dss.ctx, Cstring(pointer(circ)), options)
end
FromJSON(dss::DSSContext, circ::String) = FromJSON(dss, circ, 0)
FromJSON(circ::String, options::Int32) = FromJSON(DSS_DEFAULT_CTX, circ, options)
FromJSON(circ::String) = FromJSON(DSS_DEFAULT_CTX, circ, 0)

"""
**EXPERIMENTAL:** Returns the general circuit data, including all DSS objects, as a
JSON-encoded string. The data is encoded using the proposed AltDSS Schema, see
https://github.com/dss-extensions/altdss-schema/ and 
https://github.com/orgs/dss-extensions/discussions/ for links to docs and to
provide feedback for future revisions.

The options argument is an integer bitset from the enum `DSSJSONFlags`.

**(API Extension)**
"""
function ToJSON(dss::DSSContext, options::Int32)::String
    return get_string(@checked Lib.Circuit_ToJSON(dss.ctx, options))
end
ToJSON(dss::DSSContext) = ToJSON(dss, 0)
ToJSON(options::Int32) = ToJSON(DSS_DEFAULT_CTX, options)
ToJSON() = ToJSON(DSS_DEFAULT_CTX, 0)

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

If `SingleFile` is enabled, the path argument (`dirOrFilePath`) is the file path,
otherwise it is the folder path. For string output, the argument is not used.

**(API Extension)**
"""
function Save(dss::DSSContext, dirOrFilePath::String, saveFlags::Int32)::String
    return get_string(@checked Lib.Circuit_Save(dss.ctx, Cstring(pointer(dirOrFilePath)), saveFlags))
end
Save(dirOrFilePath::String, saveFlags::Int32) = Save(DSS_DEFAULT_CTX, dirOrFilePath, saveFlags)

"""
Flatten the circuit

Flatten the circuit, removing any object of the following types:

- XfmrCode
- LineCode
- LineSpacing
- LineGeometry
- WireData
- CNData
- TSData

The general data from those objects is propagated to the referencing Line and Transformer objects,
and the properties on the latter are updated to remove any references to the removed objects.

This is useful for some converting the DSS circuit to another format, without requiring the user to handle all 
the types listed above. This, of course, results in some limitations since a lot of detail is removed. Numerically,
a normal snapshot or daily solution should be the same before and after the flatten operation.

Available only on AltDSS.

**(API Extension)**
"""
function Flatten(dss::DSSContext)
    Lib.Circuit_Flatten(dss)
end
Flatten() = Flatten(DSS_DEFAULT_CTX)

end
