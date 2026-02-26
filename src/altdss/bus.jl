module Bus
using ..Load: LoadObj
using ..Line: LineObj
using ..Common

struct BusObj <: AbstractBusObj
    ptr::Ptr{Cvoid}
    dss::DSSContext
end

function Base.show(io::IO, obj::BusObj) 
    name = obj_get_str_nodisp(obj, obj.dss.capi.Alt_Bus_Get_Name)
    print("Bus.$name")
end

"""
Return a unique node number at this bus to avoid node collisions and adds 
it to the node list for the bus.

Original COM help: https://opendss.epri.com/GetUniqueNodeNumber.html
"""
function GetUniqueNodeNumber(obj::BusObj, start_number::Int)::Int
    obj_get_int32(obj, obj.dss.capi.Alt_Bus_GetUniqueNodeNumber, start_number)
end

"""
Refreshes the Zsc matrix for this bus.

Original COM help: https://opendss.epri.com/ZSCRefresh.html
"""
function ZSCRefresh(obj::BusObj)::Bool
    obj_get_bool(obj, obj.dss.capi.Alt_Bus_ZscRefresh)
end

"""
Indicates whether a coordinate has been defined for this bus

Original COM help: https://opendss.epri.com/Coorddefined.html
"""
function CoordDefined(obj::BusObj)::Bool
    obj_get_bool(obj, obj.dss.capi.Alt_Bus_Get_CoordDefined)
end

"""
Complex sequence voltages (0, 1, 2) at this bus.

Original COM help: https://opendss.epri.com/CplxSeqVoltages.html
"""
function ComplexSeqVoltages(obj::BusObj)::Vector{ComplexF64}
    obj_get_complex128s(obj, obj.dss.capi.Alt_Bus_Get_ComplexSeqVoltages)
end

"""
Accumulated customer outage durations.

*Requires a previous call to `RelCalc` command*

Original COM help: https://opendss.epri.com/Cust_Duration.html
"""
function CustDuration(obj::BusObj)::Float64
    obj_get_float64(obj, obj.dss.capi.Alt_Bus_Get_CustDuration)
end

"""
Annual number of customer-interruptions from this bus.

*Requires a previous call to `RelCalc` command*

Original COM help: https://opendss.epri.com/Cust_Interrupts.html
"""
function CustInterrupts(obj::BusObj)::Float64
    obj_get_float64(obj, obj.dss.capi.Alt_Bus_Get_CustInterrupts)
end

"""
Distance from EnergyMeter (if non-zero)

*Requires an energy meter with an updated zone.*

Original COM help: https://opendss.epri.com/Distance.html
"""
function Distance(obj::BusObj)::Float64
    obj_get_float64(obj, obj.dss.capi.Alt_Bus_Get_Distance)
end

"""
Average interruption duration in hours.

*Requires a previous call to `RelCalc` command*

Original COM help: https://opendss.epri.com/Int_Duration.html
"""
function IntDuration(obj::BusObj)::Float64
    obj_get_float64(obj, obj.dss.capi.Alt_Bus_Get_IntDuration)
end

"""
Short circuit currents (\$I_{SC}\$) at this bus.

*Requires a previous solution in `FaultStudy` mode.*

Original COM help: https://opendss.epri.com/Isc.html
"""
function ISC(obj::BusObj)::Vector{ComplexF64}
    obj_get_complex128s(obj, obj.dss.capi.Alt_Bus_Get_Isc)
end

"""
Accumulated failure rate downstream from this bus; faults per year

*Requires a previous call to `RelCalc` command*

Original COM help: https://opendss.epri.com/Lambda.html
"""
function Lambda(obj::BusObj)::Float64
    obj_get_float64(obj, obj.dss.capi.Alt_Bus_Get_Lambda)
end

"""
Total numbers of customers served downline from this bus

*Requires a previous call to `RelCalc` command*

Original COM help: https://opendss.epri.com/N_Customers.html
"""
function NumCustomers(obj::BusObj)::Int
    obj_get_int32(obj, obj.dss.capi.Alt_Bus_Get_NumCustomers)
end

"""
Number of interruptions on this bus per year

*Requires a previous call to `RelCalc` command*

Original COM help: https://opendss.epri.com/N_interrupts.html
"""
function NumInterrupts(obj::BusObj)::Float64
    obj_get_float64(obj, obj.dss.capi.Alt_Bus_Get_NumInterrupts)
end

"""Name of this bus"""
function Name(obj::BusObj)::String
    obj_get_str_nodisp(obj, obj.dss.capi.Alt_Bus_Get_Name)
end

"""
Node numbers defined at the bus in same order as the voltages.

Original COM help: https://opendss.epri.com/Nodes.html
"""
function Nodes(obj::BusObj)::Vector{Int32}
    obj_get_int32s(obj, obj.dss.capi.Alt_Bus_Get_Nodes)
end

"""
Number of nodes this bus.

Original COM help: https://opendss.epri.com/NumNodes.html
"""
function NumNodes(obj::BusObj)::Int
    obj_get_int32(obj, obj.dss.capi.Alt_Bus_Get_NumNodes)
end

"""
Integer ID of the feeder section in which this bus is located.

*Requires a previous call to `RelCalc` command*

Original COM help: https://opendss.epri.com/SectionID.html
"""
function SectionID(obj::BusObj)::Int
    obj_get_int32(obj, obj.dss.capi.Alt_Bus_Get_SectionID)
end

"""
Sequence voltages at this bus. Magnitudes only.

Original COM help: https://opendss.epri.com/SeqVoltages.html
"""
function SeqVoltages(obj::BusObj)::Vector{Float64}
    obj_get_float64s(obj, obj.dss.capi.Alt_Bus_Get_SeqVoltages)
end

"""
Total length of line downline from this bus, in miles. For recloser siting algorithm.

*Requires a previous call to `RelCalc` command*

Original COM help: https://opendss.epri.com/TotalMiles.html
"""
function TotalMiles(obj::BusObj)::Float64
    obj_get_float64(obj, Alt_Bus_Get_TotalMiles)
end

"""
Total length of line downline from this bus, in kilometers.

*Requires a previous call to `RelCalc` command*
"""
function TotalKilometers(obj::BusObj)::Float64
    obj_get_float64(obj, obj.dss.capi.Alt_Bus_Get_TotalMiles) * 1.609344
end

"""
For 2- and 3-phase buses, returns array of complex numbers representing L-L voltages in volts. 

Returns -1.0 for 1-phase bus. 

If more than 3 phases, returns only first 3.

Original COM help: https://opendss.epri.com/VLL.html
"""
function VLL(obj::BusObj)::Vector{ComplexF64}
    obj_get_complex128s(obj, obj.dss.capi.Alt_Bus_Get_VLL)
end

"""
Voltages in magnitude (VLN) and angle (degrees) pairs.

Original COM help: https://opendss.epri.com/VMagAngle.html
"""
function VMagAngle(obj::BusObj)::Vector{Float64}
    obj_get_float64s(obj, obj.dss.capi.Alt_Bus_Get_VMagAngle)
end

"""
Open circuit voltages.

*Requires a previous solution in `FaultStudy` mode.*

Original COM help: https://opendss.epri.com/Voc.html
"""
function VOC(obj::BusObj)::Vector{ComplexF64}
    obj_get_complex128s(obj, obj.dss.capi.Alt_Bus_Get_Voc)
end

"""
Complex voltages at this bus.

Original COM help: https://opendss.epri.com/Voltages.html
"""
function Voltages(obj::BusObj)::Vector{ComplexF64}
    obj_get_complex128s(obj, obj.dss.capi.Alt_Bus_Get_Voltages)
end

"""
YSC (\$Y_{SC}\$) matrix at bus.

*Requires a previous solution in `FaultStudy` mode or a call to `ZSCRefresh`.*

Original COM help: https://opendss.epri.com/YscMatrix.html
"""
function YSC(obj::BusObj)::Matrix{ComplexF64}
    obj_get_complex128s_matrix(obj, obj.dss.capi.Alt_Bus_Get_YscMatrix; matrix=true)
end

"""
Zero-sequence short circuit impedance at bus.

*Requires a previous solution in `FaultStudy` mode or a call to `ZSCRefresh`.*

Original COM help: https://opendss.epri.com/Zsc0.html
"""
function ZSC0(obj::BusObj)::ComplexF64
    obj_get_complex128(obj, obj.dss.capi.Alt_Bus_Get_Zsc0)
end

"""
Positive-sequence short circuit impedance at bus.

*Requires a previous solution in `FaultStudy` mode or a call to `ZSCRefresh`.*

Original COM help: https://opendss.epri.com/Zsc1.html
"""
function ZSC1(obj::BusObj)::ComplexF64
    obj_get_complex128(obj, obj.dss.capi.Alt_Bus_Get_Zsc1)
end

"""
ZSC (\$Z_{SC}\$) matrix at the bus. 

*Requires a previous solution in `FaultStudy` mode or a call to `ZSCRefresh`.*

Original COM help: https://opendss.epri.com/ZscMatrix.html
"""
function ZSC(obj::BusObj)::Matrix{ComplexF64}
    obj_get_complex128s(obj, obj.dss.capi.Alt_Bus_Get_ZscMatrix; matrix=true)
end

"""
Base voltage at bus in kV

Original COM help: https://opendss.epri.com/kVBase.html
"""
function kVBase(obj::BusObj)::Float64 #TODO: add setter
    obj_get_float64(obj, obj.dss.capi.Alt_Bus_Get_kVBase)
end

"""
Complex pu L-L voltages for 2- and 3-phase buses.

Returns -1.0 for 1-phase bus.
If more than 3 phases, returns only 3 phases.

Original COM help: https://opendss.epri.com/puVLL.html
"""
function puVLL(obj::BusObj)::Vector{ComplexF64}
    obj_get_complex128s(obj, obj.dss.capi.Alt_Bus_Get_puVLL)
end

"""
Voltage magnitudes and angles (degrees), paired, in per unit

Original COM help: https://opendss.epri.com/puVmagAngle.html
"""
function puVMagAngle(obj::BusObj)::Vector{Float64}
    obj_get_float64s(obj, obj.dss.capi.Alt_Bus_Get_puVMagAngle)
end

"""
Complex pu voltages at the bus.

Original COM help: https://opendss.epri.com/puVoltages.html
"""
function puVoltages(obj::BusObj)::Vector{ComplexF64}
    obj_get_complex128s(obj, obj.dss.capi.Alt_Bus_Get_puVoltages)
end

"""
Complete 012 ZSC (\$Z_{SC}\$) matrix. 
Only available for buses with 3 nodes. 
Only available after Zsc is computed.

*Requires a previous solution in `FaultStudy` mode or a call to `ZSCRefresh`.*

Original COM help: https://opendss.epri.com/ZSC012Matrix.html
"""
function ZSC012(obj::BusObj)::Matrix{ComplexF64}
    obj_get_complex128s(obj, obj.dss.capi.Alt_Bus_Get_Zsc012Matrix; matrix=true)
end

"""
X coordinate for the bus

Original COM help: https://opendss.epri.com/x.html

(Getter)
"""
function X(obj::BusObj)::Float64
    obj_get_float64(obj, obj.dss.capi.Alt_Bus_Get_X)
end

"""
X coordinate for the bus

Original COM help: https://opendss.epri.com/x.html

(Setter)
"""
function X(obj::BusObj, value::Float64)
    obj_set_float64(obj, obj.dss.capi.Alt_Bus_Set_X, value)
end

"""
Y coordinate for the bus

Original COM help: https://opendss.epri.com/y.html

(Getter)
"""
function Y(obj::BusObj)::Float64
    obj_get_float64(obj, obj.dss.capi.Alt_Bus_Get_Y)
end

"""
Y coordinate for the bus

Original COM help: https://opendss.epri.com/y.html

(Setter)
"""
function Y(obj::BusObj, value::Float64)
    obj_set_float64(obj, obj.dss.capi.Alt_Bus_Set_Y, value)
end

"""All load objects connected to this bus."""
function Loads(obj::BusObj)::Vector{LoadObj}
    #TODO: LoadBatch
    obj_get_objs(obj, obj.dss.capi.Alt_Bus_Get_Loads, LoadObj)
end

"""All line objects connected to this bus."""
function Lines(obj::BusObj)::Vector{LineObj}
    #TODO: LineBatch
    obj_get_objs(obj, obj.dss.capi.Alt_Bus_Get_Lines, LineObj)
end

"""
All power conversion (PC) elements connected to this bus.

This also includes shunt Capacitors/Reactors.

Original COM help: https://opendss.epri.com/AllPCEatBus.html
"""
function PCElements(obj::BusObj)::Vector{AbstractCircuitElement}
    #TODO: PCElementBatch
    obj_get_objs(obj, obj.dss.capi.Alt_Bus_Get_PCElements, Common._wrap_dss_obj)
end

"""
All power delivery (PD) elements connected to this bus.

This excludes shunt Capacitors/Reactors.

Original COM help: https://opendss.epri.com/AllPDEatBus1.html
"""
function PDElements(obj::BusObj)::Vector{AbstractPDElement}
    #TODO: PDElementBatch
    obj_get_objs(obj, obj.dss.capi.Alt_Bus_Get_PDElements, Common._wrap_dss_obj)
end

"""
Returns the data of this bus as a JSON-encoded string.

Currently, only the basic data is included (name, coordinates, base voltage).
"""
function ToJSON(obj::BusObj, flags::DSSJSONFlags=DSSJSONFlags(0))::String
    obj_get_str(obj, obj.dss.capi.Alt_Bus_ToJSON, convert(Int32, Integer(flags)))
end

"""
Returns an object from the collection by name.
"""
function Get(dss::DSSContext, name::String)::BusObj
    @assert (dss.capi.isAltDSS != 0) "Only the AltDSS engine supports this API"
    ptr = dss_ccall(dss.capi.Alt_Bus_GetByName, dss.ctx, name)
    if ptr == C_NULL
        throw(
            OpenDSSDirectException(
                "[ERROR] Could not find Bus by name \"$name\"."
            )
        )
    end
    return BusObj(ptr, dss)
end
Get(name::String) = Get(DSS_DEFAULT_CTX, name)

"""
Returns a bus object from the circuit by index; the index must be one-based.
"""
function Get(dss::DSSContext, idx::Int)::BusObj
    @assert (dss.capi.isAltDSS != 0) "Only the AltDSS engine supports this API"
    ptr = dss_ccall(dss.capi.Alt_Bus_GetByIndex, dss.ctx, idx - 1)
    if ptr == C_NULL
        throw(
            OpenDSSDirectException(
                "[ERROR] Could not find Bus by index \"$idx\"."
            )
        )
    end
    return BusObj(ptr, dss)
end
Get(idx::Int) = Get(DSS_DEFAULT_CTX, idx)

"""
Returns the number of buses in the circuit.
"""
function Count(dss::DSSContext)::Int
    return dss_ccall(dss.capi.Circuit_Get_NumBuses, dss.ctx)
end
Count() = Count(DSS_DEFAULT_CTX)

#TODO: iterator

"""
Convenience function: apply a function to all buses, collecting the results in a vector
"""
function All(dss::DSSContext, func, args...)::Vector
    [func(Get(idx), args...) for idx in 1:Count(dss)]
end
All(func, args...) = All(DSS_DEFAULT_CTX, func, args...)

"""
Convenience function: apply a function to all bus objects in the input vector, collecting the results in a vector
"""
function All(objs::Vector{BusObj}, func, args...)::Vector
    [func(obj, args...) for obj in objs]
end

end # module Bus
export Bus
