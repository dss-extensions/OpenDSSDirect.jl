module Bus

using DocStringExtensions

using ..Lib
using ..Utils

@template (FUNCTIONS, METHODS) = """
                                 $(TYPEDSIGNATURES)
                                 $(DOCSTRING)
                                 """

"""Get unique node number"""
function GetUniqueNodeNumber(StartNumber::Int)::Int
    return @checked Lib.Bus_GetUniqueNodeNumber(C_NULL_CTX, StartNumber)
end

"""Check if DoZscRefresh is set"""
function ZscRefresh()::Bool
    return @checked(Lib.Bus_ZscRefresh(C_NULL_CTX)) != 0
end

"""Indicates whether a coordinate has been defined for this bus"""
function Coorddefined()::Bool
    return @checked(Lib.Bus_Get_Coorddefined(C_NULL_CTX)) != 0
end

"""Complex Double array of Sequence Voltages (0, 1, 2) at this Bus."""
function CplxSeqVoltages()::Vector{ComplexF64}
    return get_complex64_array(Lib.Bus_Get_CplxSeqVoltages, C_NULL_CTX)
end

"""Accumulated customer outage durations"""
function Cust_Duration()::Float64
    return @checked Lib.Bus_Get_Cust_Duration(C_NULL_CTX)
end

"""Annual number of customer-interruptions from this bus"""
function Cust_Interrupts()::Float64
    return @checked Lib.Bus_Get_Cust_Interrupts(C_NULL_CTX)
end

"""Distance from energymeter (if non-zero)"""
function Distance()::Float64
    return @checked Lib.Bus_Get_Distance(C_NULL_CTX)
end

"""Average interruption duration, hr."""
function Int_Duration()::Float64
    return @checked Lib.Bus_Get_Int_Duration(C_NULL_CTX)
end

"""Short circuit currents at bus; Complex Array."""
function Isc()::Vector{ComplexF64}
    return get_complex64_array(Lib.Bus_Get_Isc, C_NULL_CTX)
end

"""Accumulated failure rate downstream from this bus; faults per year"""
function Lambda()::Float64
    return @checked Lib.Bus_Get_Lambda(C_NULL_CTX)
end

"""Total numbers of customers served downline from this bus"""
function N_Customers()::Int
    return @checked Lib.Bus_Get_N_Customers(C_NULL_CTX)
end

"""Number of interruptions this bus per year"""
function N_interrupts()::Float64
    return @checked Lib.Bus_Get_N_interrupts(C_NULL_CTX)
end

"""Name of Bus"""
function Name()::String
    return get_string(@checked Lib.Bus_Get_Name(C_NULL_CTX))
end

"""Integer Array of Node Numbers defined at the bus in same order as the voltages."""
function Nodes()::Vector{Int}
    return get_int32_array(Lib.Bus_Get_Nodes, C_NULL_CTX)
end

"""Number of Nodes this bus."""
function NumNodes()::Int
    return @checked Lib.Bus_Get_NumNodes(C_NULL_CTX)
end

"""Integer ID of the feeder section in which this bus is located."""
function SectionID()::Int
    return @checked Lib.Bus_Get_SectionID(C_NULL_CTX)
end

"""Double Array of sequence voltages at this bus."""
function SeqVoltages()::Vector{Float64}
    return get_float64_array(Lib.Bus_Get_SeqVoltages, C_NULL_CTX)
end

"""Total length of line downline from this bus, in miles. For recloser siting algorithm."""
function TotalMiles()::Float64
    return @checked Lib.Bus_Get_TotalMiles(C_NULL_CTX)
end

"""For 2- and 3-phase buses, returns array of complex numbers representing L-L voltages in volts. Returns -1.0 for 1-phase bus. If more than 3 phases, returns only first 3."""
function VLL()::Vector{ComplexF64}
    return get_complex64_array(Lib.Bus_Get_VLL, C_NULL_CTX)
end

"""Variant Array of doubles containing voltages in Magnitude (VLN), angle (deg) """
function VMagAngle()::Vector{Float64}
    return get_float64_array(Lib.Bus_Get_VMagAngle, C_NULL_CTX)
end

"""Open circuit voltage; Complex array."""
function Voc()::Vector{ComplexF64}
    return get_complex64_array(Lib.Bus_Get_Voc, C_NULL_CTX)
end

"""Complex array of voltages at this bus."""
function Voltages()::Vector{ComplexF64}
    return get_complex64_array(Lib.Bus_Get_Voltages, C_NULL_CTX)
end

"""Complex array of Ysc matrix at bus. Column by column."""
function YscMatrix()::Vector{ComplexF64}
    return get_complex64_array(Lib.Bus_Get_YscMatrix, C_NULL_CTX)
end

"""Complex Zero-Sequence short circuit impedance at bus."""
function Zsc0()
    return get_complex64(Lib.Bus_Get_Zsc0, C_NULL_CTX)
end

"""Complex Positive-Sequence short circuit impedance at bus.."""
function Zsc1()
    return get_complex64(Lib.Bus_Get_Zsc1, C_NULL_CTX)
end

"""Complex array of Zsc matrix at bus. Column by column."""
function ZscMatrix()::Vector{ComplexF64}
    return get_complex64_array(Lib.Bus_Get_ZscMatrix, C_NULL_CTX)
end

"""Base voltage at bus in kV"""
function kVBase()::Float64
    return @checked Lib.Bus_Get_kVBase(C_NULL_CTX)
end

"""Returns Complex array of pu L-L voltages for 2- and 3-phase buses. Returns -1.0 for 1-phase bus. If more than 3 phases, returns only 3 phases."""
function puVLL()::Vector{ComplexF64}
    return get_complex64_array(Lib.Bus_Get_puVLL, C_NULL_CTX)
end

"""Array of doubles containing voltage magnitude, angle pairs in per unit"""
function puVmagAngle()::Vector{Float64}
    return get_float64_array(Lib.Bus_Get_puVmagAngle, C_NULL_CTX)
end

"""Complex Array of pu voltages at the bus."""
function PuVoltage()::Vector{ComplexF64}
    return get_complex64_array(Lib.Bus_Get_puVoltages, C_NULL_CTX)
end

"""X Coordinate for bus (double) (Getter)"""
function X()::Float64
    return @checked Lib.Bus_Get_x(C_NULL_CTX)
end

"""X Coordinate for bus (double) (Setter)"""
function X(Value::Float64)
    @checked Lib.Bus_Set_x(C_NULL_CTX, Value)
end

"""Y coordinate for bus (double) (Getter)"""
function Y()::Float64
    return @checked Lib.Bus_Get_y(C_NULL_CTX)
end

"""Y coordinate for bus (double)"""
function Y(Value::Float64)
    @checked Lib.Bus_Set_y(C_NULL_CTX, Value)
end

"""Array of strings: Full Names of LINE elements connected to the active bus."""
function LineList()::Vector{String}
    return get_string_array(Lib.Bus_Get_LineList, C_NULL_CTX)
end

"""Array of strings: Full Names of LOAD elements connected to the active bus."""
function LoadList()::Vector{String}
    return get_string_array(Lib.Bus_Get_LoadList, C_NULL_CTX)
end

"""Array with the names of all PCE connected to the active bus"""
function AllPCEatBus()::Vector{String}
    return get_string_array(Lib.Bus_Get_AllPCEatBus, C_NULL_CTX)
end

"""Array with the names of all PDE connected to the active bus"""
function AllPDEatBus()::Vector{String}
    return get_string_array(Lib.Bus_Get_AllPDEatBus, C_NULL_CTX)
end

"""Activates the next bus"""
function Next()::Int
    return @checked Lib.Bus_Get_Next(C_NULL_CTX)
end

"""3x3 complex matrix containing the complete 012 Zsc matrix"""
function ZSC012Matrix()::Matrix{ComplexF64}
    r = get_complex64_array(Lib.Bus_Get_ZSC012Matrix, C_NULL_CTX)
    return reshape(r, (3, 3))
end

end
