module Bus

using DocStringExtensions

using ..Lib
using ..Utils

@template (FUNCTIONS, METHODS) = """
                                 $(TYPEDSIGNATURES)
                                 $(DOCSTRING)
                                 """


"""
Array of names of all Bus objects.

See also `Circuit.AllNodeNames`.

Original COM help: <https://opendss.epri.com/AllBusNames.html>

Equivalent to `Circuit.AllBusnames`
"""
function AllNames(dss::DSSContext)::Vector{String}
    return get_string_array(dss.capi.Circuit_Get_AllBusNames, dss)
end
AllNames() = AllNames(DSS_DEFAULT_CTX)

"""
Gets the name of the active Bus object.

Original COM help: <https://opendss.epri.com/Name1.html>
"""
function Name(dss::DSSContext)::String
    return get_string(@checked dss_ccall(dss.capi.Bus_Get_Name, dss.ctx))
end
Name() = Name(DSS_DEFAULT_CTX)

"""
Sets Active bus by name.

Ignores node list. Returns bus index (zero based) compatible with `AllBusNames` and Buses collection.

Original COM help: <https://opendss.epri.com/SetActiveBus.html>

Equivalent to `Circuit.SetActiveBus`
"""
function Name(dss::DSSContext, Value::String)::Int
    return @checked dss_ccall(dss.capi.Circuit_SetActiveBus, dss.ctx, BusName)
end
Name(Value::String) = Name(DSS_DEFAULT_CTX, Value)

"""
Total number of Buses in the circuit.

Original COM help: <https://opendss.epri.com/NumBuses.html>

Equivalent to `Circuit.NumBuses`
"""
function Count(dss::DSSContext)::Int
    return @checked dss_ccall(dss.capi.Circuit_Get_NumBuses, dss.ctx)
end
Count() = Count(DSS_DEFAULT_CTX)

"""
Sets first Bus to be active. Returns -1 on error.
"""
function First(dss::DSSContext)::Int
    return @checked dss_ccall(dss.capi.Circuit_SetActiveBusi, dss.ctx, 0)
end
First() = First(DSS_DEFAULT_CTX)

"""
Sets next Bus to be active. 

Returns -1 if no more.
    
**NOTE:** With EPRI's OpenDSS distribution, nefore using `Next`, be sure to activate a bus by using `Name`, `Idx` or `First`.
    
**(API Extension)**    
"""
function Next(dss::DSSContext)::Int
    return @checked dss_ccall(dss.capi.Bus_Get_Next, dss.ctx)
end
Next() = Next(DSS_DEFAULT_CTX)

"""
Gets the index of the current active Bus

0-based index compatible with SetActiveBus return value and AllBusNames indexing.
Returns 0 if OK.

**NOTE:** since this an API Extension, it is not inherently available with EPRI's OpenDSS distribution.
On DSS-Extensions, if the user activates a bus by name, index, or using `First` and `Next`, our compatibility
layour tracks the bus number and this function can be used safely. That is, with EPRI's OpenDSS, if the 
engine changes the bus number internally, the number provided in this function should not be used.

**(API Extension)**
"""
function Idx(dss::DSSContext)::Int
    return @checked dss_ccall(dss.capi.Bus_Get_idx, dss.ctx)
end
Idx() = Idx(DSS_DEFAULT_CTX)

"""
Set ActiveBus by an integer value.

0-based index compatible with SetActiveBus return value and AllBusNames indexing.
Returns 0 if OK.

Original COM help: <https://opendss.epri.com/SetActiveBusi.html>

Equivalent to `Circuit.SetActiveBusi`
"""
function Idx(dss::DSSContext, Value::Int)::Int
    return @checked dss_ccall(dss.capi.Circuit_SetActiveBusi, dss.ctx, BusIndex)
end
Idx(Value::Int) = Idx(DSS_DEFAULT_CTX, Value)

"""
Return a unique node number at the active bus to avoid node collisions and adds
it to the node list for the bus.

Original COM help: <https://opendss.epri.com/GetUniqueNodeNumber.html>
"""
function GetUniqueNodeNumber(dss::DSSContext, StartNumber::Int)::Int
    return @checked dss_ccall(dss.capi.Bus_GetUniqueNodeNumber, dss.ctx, StartNumber)
end
GetUniqueNodeNumber(StartNumber::Int) = GetUniqueNodeNumber(DSS_DEFAULT_CTX, StartNumber)

"""
Refreshes the Zsc matrix for the active bus.

Original COM help: <https://opendss.epri.com/ZscRefresh.html>
"""
function ZscRefresh(dss::DSSContext)::Bool
    return @checked(dss_ccall(dss.capi.Bus_ZscRefresh, dss.ctx)) != 0
end
ZscRefresh() = ZscRefresh(DSS_DEFAULT_CTX)

"""
Indicates whether a coordinate has been defined for this bus

Original COM help: <https://opendss.epri.com/Coorddefined.html>
"""
function Coorddefined(dss::DSSContext)::Bool
    return @checked(dss_ccall(dss.capi.Bus_Get_Coorddefined, dss.ctx)) != 0
end
Coorddefined() = Coorddefined(DSS_DEFAULT_CTX)

"""
Complex array of Sequence Voltages (0, 1, 2) at this Bus.

Original COM help: <https://opendss.epri.com/CplxSeqVoltages.html>
"""
function CplxSeqVoltages(dss::DSSContext)::Vector{ComplexF64}
    return get_complex64_array(dss.capi.Bus_Get_CplxSeqVoltages, dss)
end
CplxSeqVoltages() = CplxSeqVoltages(DSS_DEFAULT_CTX)

"""
Accumulated customer outage durations

*Requires a previous call to `RelCalc` command*

Original COM help: <https://opendss.epri.com/Cust_Duration.html>
"""
function Cust_Duration(dss::DSSContext)::Float64
    return @checked dss_ccall(dss.capi.Bus_Get_Cust_Duration, dss.ctx)
end
Cust_Duration() = Cust_Duration(DSS_DEFAULT_CTX)

"""
Annual number of customer-interruptions from this bus

*Requires a previous call to `RelCalc` command*

Original COM help: <https://opendss.epri.com/Cust_Interrupts.html>
"""
function Cust_Interrupts(dss::DSSContext)::Float64
    return @checked dss_ccall(dss.capi.Bus_Get_Cust_Interrupts, dss.ctx)
end
Cust_Interrupts() = Cust_Interrupts(DSS_DEFAULT_CTX)

"""
Distance from EnergyMeter (if non-zero)

*Requires an energy meter with an updated zone.*

Original COM help: <https://opendss.epri.com/Distance.html>
"""
function Distance(dss::DSSContext)::Float64
    return @checked dss_ccall(dss.capi.Bus_Get_Distance, dss.ctx)
end
Distance() = Distance(DSS_DEFAULT_CTX)

"""
Average interruption duration, hours.

*Requires a previous call to `RelCalc` command*

Original COM help: <https://opendss.epri.com/Int_Duration.html>
"""
function Int_Duration(dss::DSSContext)::Float64
    return @checked dss_ccall(dss.capi.Bus_Get_Int_Duration, dss.ctx)
end
Int_Duration() = Int_Duration(DSS_DEFAULT_CTX)

"""
Short circuit currents at bus; Complex Array.

*Requires a previous solution in `FaultStudy` mode.*

Original COM help: <https://opendss.epri.com/Isc.html>
"""
function Isc(dss::DSSContext)::Vector{ComplexF64}
    return get_complex64_array(dss.capi.Bus_Get_Isc, dss)
end
Isc() = Isc(DSS_DEFAULT_CTX)

"""
Accumulated failure rate downstream from this bus; faults per year

*Requires a previous call to `RelCalc` command*

Original COM help: <https://opendss.epri.com/Lambda.html>
"""
function Lambda(dss::DSSContext)::Float64
    return @checked dss_ccall(dss.capi.Bus_Get_Lambda, dss.ctx)
end
Lambda() = Lambda(DSS_DEFAULT_CTX)

"""
Total numbers of customers served downline from this bus

*Requires a previous call to `RelCalc` command*

Original COM help: <https://opendss.epri.com/N_Customers.html>
"""
function N_Customers(dss::DSSContext)::Int
    return @checked dss_ccall(dss.capi.Bus_Get_N_Customers, dss.ctx)
end
N_Customers() = N_Customers(DSS_DEFAULT_CTX)

"""
Number of interruptions this bus per year

*Requires a previous call to `RelCalc` command*

Original COM help: <https://opendss.epri.com/N_interrupts.html>
"""
function N_interrupts(dss::DSSContext)::Float64
    return @checked dss_ccall(dss.capi.Bus_Get_N_interrupts, dss.ctx)
end
N_interrupts() = N_interrupts(DSS_DEFAULT_CTX)

"""
Integer Array of Node Numbers defined at the bus in same order as the voltages.

Original COM help: <https://opendss.epri.com/Nodes.html>
"""
function Nodes(dss::DSSContext)::Vector{Int}
    return get_int32_array(dss.capi.Bus_Get_Nodes, dss)
end
Nodes() = Nodes(DSS_DEFAULT_CTX)

"""
Number of Nodes this bus.

Original COM help: <https://opendss.epri.com/NumNodes.html>
"""
function NumNodes(dss::DSSContext)::Int
    return @checked dss_ccall(dss.capi.Bus_Get_NumNodes, dss.ctx)
end
NumNodes() = NumNodes(DSS_DEFAULT_CTX)

"""
Integer ID of the feeder section in which this bus is located.

*Requires a previous call to `RelCalc` command*

Original COM help: <https://opendss.epri.com/SectionID.html>
"""
function SectionID(dss::DSSContext)::Int
    return @checked dss_ccall(dss.capi.Bus_Get_SectionID, dss.ctx)
end
SectionID() = SectionID(DSS_DEFAULT_CTX)

"""
Double Array of sequence voltages at this bus. Magnitudes only.

Original COM help: <https://opendss.epri.com/SeqVoltages.html>
"""
function SeqVoltages(dss::DSSContext)::Vector{Float64}
    return get_float64_array(dss.capi.Bus_Get_SeqVoltages, dss)
end
SeqVoltages() = SeqVoltages(DSS_DEFAULT_CTX)

"""
Total length of line downline from this bus, in miles. For recloser siting algorithm.

*Requires a previous call to `RelCalc` command*

Original COM help: <https://opendss.epri.com/TotalMiles.html>
"""
function TotalMiles(dss::DSSContext)::Float64
    return @checked dss_ccall(dss.capi.Bus_Get_TotalMiles, dss.ctx)
end
TotalMiles() = TotalMiles(DSS_DEFAULT_CTX)

"""
For 2- and 3-phase buses, returns array of complex numbers representing L-L voltages in volts. Returns -1.0 for 1-phase bus. If more than 3 phases, returns only first 3.

Original COM help: <https://opendss.epri.com/VLL.html>
"""
function VLL(dss::DSSContext)::Vector{ComplexF64}
    return get_complex64_array(dss.capi.Bus_Get_VLL, dss)
end
VLL() = VLL(DSS_DEFAULT_CTX)

"""
Array of doubles containing voltages in Magnitude (VLN), angle (degrees)

Original COM help: <https://opendss.epri.com/VMagAngle.html>
"""
function VMagAngle(dss::DSSContext)::Vector{Float64}
    return get_float64_array(dss.capi.Bus_Get_VMagAngle, dss)
end
VMagAngle() = VMagAngle(DSS_DEFAULT_CTX)

"""
Open circuit voltage; Complex array.

*Requires a previous solution in `FaultStudy` mode.*

Original COM help: <https://opendss.epri.com/Voc.html>
"""
function Voc(dss::DSSContext)::Vector{ComplexF64}
    return get_complex64_array(dss.capi.Bus_Get_Voc, dss)
end
Voc() = Voc(DSS_DEFAULT_CTX)

"""
Complex array of voltages at this bus.

Original COM help: <https://opendss.epri.com/Voltages.html>
"""
function Voltages(dss::DSSContext)::Vector{ComplexF64}
    return get_complex64_array(dss.capi.Bus_Get_Voltages, dss)
end
Voltages() = Voltages(DSS_DEFAULT_CTX)

"""
Complex array of Ysc matrix at bus. Column by column.

*Requires a previous solution in `FaultStudy` mode or a call to `ZscRefresh`.*

Original COM help: <https://opendss.epri.com/YscMatrix.html>
"""
function YscMatrix(dss::DSSContext)::Vector{ComplexF64}
    return get_complex64_array(dss.capi.Bus_Get_YscMatrix, dss)
end
YscMatrix() = YscMatrix(DSS_DEFAULT_CTX)

"""
Complex Zero-Sequence short circuit impedance at bus.

*Requires a previous solution in `FaultStudy` mode or a call to `ZscRefresh`.*

Original COM help: <https://opendss.epri.com/Zsc0.html>
"""
function Zsc0(dss::DSSContext)
    return get_complex64(dss.capi.Bus_Get_Zsc0, dss)
end
Zsc0() = Zsc0(DSS_DEFAULT_CTX)

"""
Complex Positive-Sequence short circuit impedance at bus.

*Requires a previous solution in `FaultStudy` mode or a call to `ZscRefresh`.*

Original COM help: <https://opendss.epri.com/Zsc1.html>
"""
function Zsc1(dss::DSSContext)
    return get_complex64(dss.capi.Bus_Get_Zsc1, dss)
end
Zsc1() = Zsc1(DSS_DEFAULT_CTX)

"""
Complex array of Zsc matrix at bus. Column by column.

*Requires a previous solution in `FaultStudy` mode or a call to `ZscRefresh`.*

Original COM help: <https://opendss.epri.com/ZscMatrix.html>
"""
function ZscMatrix(dss::DSSContext)::Vector{ComplexF64}
    return get_complex64_array(dss.capi.Bus_Get_ZscMatrix, dss)
end
ZscMatrix() = ZscMatrix(DSS_DEFAULT_CTX)

"""
Base voltage at bus in kV

Original COM help: <https://opendss.epri.com/kVBase.html>
"""
function kVBase(dss::DSSContext)::Float64
    return @checked dss_ccall(dss.capi.Bus_Get_kVBase, dss.ctx)
end
kVBase() = kVBase(DSS_DEFAULT_CTX)

"""
Returns Complex array of pu L-L voltages for 2- and 3-phase buses. Returns -1.0 for 1-phase bus. If more than 3 phases, returns only 3 phases.

Original COM help: <https://opendss.epri.com/puVLL.html>
"""
function puVLL(dss::DSSContext)::Vector{ComplexF64}
    return get_complex64_array(dss.capi.Bus_Get_puVLL, dss)
end
puVLL() = puVLL(DSS_DEFAULT_CTX)

"""
Array of doubles containing voltage magnitude, angle (degrees) pairs in per unit

Original COM help: <https://opendss.epri.com/puVmagAngle.html>
"""
function puVmagAngle(dss::DSSContext)::Vector{Float64}
    return get_float64_array(dss.capi.Bus_Get_puVmagAngle, dss)
end
puVmagAngle() = puVmagAngle(DSS_DEFAULT_CTX)

"""
Complex Array of pu voltages at the bus.

Original COM help: <https://opendss.epri.com/puVoltages.html>
"""
function PuVoltage(dss::DSSContext)::Vector{ComplexF64}
    return get_complex64_array(dss.capi.Bus_Get_puVoltages, dss)
end
PuVoltage() = PuVoltage(DSS_DEFAULT_CTX)

"""
X Coordinate for bus

Original COM help: <https://opendss.epri.com/x.html>

(Getter)
"""
function X(dss::DSSContext)::Float64
    return @checked dss_ccall(dss.capi.Bus_Get_x, dss.ctx)
end
X() = X(DSS_DEFAULT_CTX)

"""
X Coordinate for bus

Original COM help: <https://opendss.epri.com/x.html>

(Setter)
"""
function X(dss::DSSContext, Value::Float64)
    @checked dss_ccall(dss.capi.Bus_Set_x, dss.ctx, Value)
end
X(Value::Float64) = X(DSS_DEFAULT_CTX, Value)

"""
Y coordinate for bus

Original COM help: <https://opendss.epri.com/y.html>

(Getter)
"""
function Y(dss::DSSContext)::Float64
    return @checked dss_ccall(dss.capi.Bus_Get_y, dss.ctx)
end
Y() = Y(DSS_DEFAULT_CTX)

"""
Y coordinate for bus

Original COM help: <https://opendss.epri.com/y.html>

(Setter)
"""
function Y(dss::DSSContext, Value::Float64)
    @checked dss_ccall(dss.capi.Bus_Set_y, dss.ctx, Value)
end
Y(Value::Float64) = Y(DSS_DEFAULT_CTX, Value)

"""
List of strings: Full Names of LINE elements connected to the active bus.

Original COM help: <https://opendss.epri.com/LineList.html>
"""
function LineList(dss::DSSContext)::Vector{String}
    return get_string_array(dss.capi.Bus_Get_LineList, dss)
end
LineList() = LineList(DSS_DEFAULT_CTX)

"""
List of strings: Full Names of LOAD elements connected to the active bus.

Original COM help: <https://opendss.epri.com/LoadList.html>
"""
function LoadList(dss::DSSContext)::Vector{String}
    return get_string_array(dss.capi.Bus_Get_LoadList, dss)
end
LoadList() = LoadList(DSS_DEFAULT_CTX)

"""
Returns an array with the names of all PCE connected to the active bus

Original COM help: <https://opendss.epri.com/AllPCEatBus.html>
"""
function AllPCEatBus(dss::DSSContext)::Vector{String}
    return get_string_array(dss.capi.Bus_Get_AllPCEatBus, dss)
end
AllPCEatBus() = AllPCEatBus(DSS_DEFAULT_CTX)

"""
Returns an array with the names of all PDE connected to the active bus

Original COM help: <https://opendss.epri.com/AllPDEatBus1.html>
"""
function AllPDEatBus(dss::DSSContext)::Vector{String}
    return get_string_array(dss.capi.Bus_Get_AllPDEatBus, dss)
end
AllPDEatBus() = AllPDEatBus(DSS_DEFAULT_CTX)

"""
Complex array containing the complete 012 Zsc matrix.
Only available after Zsc is computed, either through the "ZscRefresh" command, or running a "FaultStudy" solution.
Only available for buses with 3 nodes.

*Requires a previous solution in `FaultStudy` mode or a call to `ZscRefresh`.*

Original COM help: <https://opendss.epri.com/ZSC012Matrix.html>
"""
function ZSC012Matrix(dss::DSSContext)::Matrix{ComplexF64}
    r = get_complex64_array(dss.capi.Bus_Get_ZSC012Matrix, dss)
    return reshape(r, (3, 3))
end
ZSC012Matrix() = ZSC012Matrix(DSS_DEFAULT_CTX)

"""
Longitude

On the AltDSS engine, this is currently a synonym to the X coordinate.

(Getter)
"""
function Longitude(dss::DSSContext)::Float64
    return @checked dss_ccall(dss.capi.Bus_Get_Longitude, dss.ctx)
end
Longitude() = Longitude(DSS_DEFAULT_CTX)

"""
Longitude

On the AltDSS engine, this is currently a synonym to the X coordinate.

(Setter)
"""
function Longitude(dss::DSSContext, Value::Float64)
    @checked dss_ccall(dss.capi.Bus_Set_Longitude, dss.ctx, Value)
end
Longitude(Value::Float64) = Longitude(DSS_DEFAULT_CTX, Value)

"""
Latitude

On the AltDSS engine, this is currently a synonym to the Y coordinate.

(Getter)
"""
function Latitude(dss::DSSContext)::Float64
    return @checked dss_ccall(dss.capi.Bus_Get_Latitude, dss.ctx)
end
Latitude() = Latitude(DSS_DEFAULT_CTX)

"""
Latitude

On the AltDSS engine, this is currently a synonym to the Y coordinate.

(Setter)
"""
function Latitude(dss::DSSContext, Value::Float64)
    @checked dss_ccall(dss.capi.Bus_Set_Latitude, dss.ctx, Value)
end
Latitude(Value::Float64) = Latitude(DSS_DEFAULT_CTX, Value)

end
