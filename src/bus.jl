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
    return @checked Lib.Bus_GetUniqueNodeNumber(StartNumber)
end

"""Check if DoZscRefresh is set"""
function ZscRefresh()::Bool
    return @checked(Lib.Bus_ZscRefresh()) != 0
end

"""Indicates whether a coordinate has been defined for this bus"""
function Coorddefined()::Bool
    return @checked(Lib.Bus_Get_Coorddefined()) != 0
end

"""Complex Double array of Sequence Voltages (0, 1, 2) at this Bus."""
function CplxSeqVoltages()::Vector{ComplexF64}
    return get_complex64_array(Lib.Bus_Get_CplxSeqVoltages)
end

"""Accumulated customer outage durations"""
function Cust_Duration()::Float64
    return @checked Lib.Bus_Get_Cust_Duration()
end

"""Annual number of customer-interruptions from this bus"""
function Cust_Interrupts()::Float64
    return @checked Lib.Bus_Get_Cust_Interrupts()
end

"""Distance from energymeter (if non-zero)"""
function Distance()::Float64
    return @checked Lib.Bus_Get_Distance()
end

"""Average interruption duration, hr."""
function Int_Duration()::Float64
    return @checked Lib.Bus_Get_Int_Duration()
end

"""Short circuit currents at bus; Complex Array."""
function Isc()::Vector{ComplexF64}
    return get_complex64_array(Lib.Bus_Get_Isc)
end

"""Accumulated failure rate downstream from this bus; faults per year"""
function Lambda()::Float64
    return @checked Lib.Bus_Get_Lambda()
end

"""Total numbers of customers served downline from this bus"""
function N_Customers()::Int
    return @checked Lib.Bus_Get_N_Customers()
end

"""Number of interruptions this bus per year"""
function N_interrupts()::Float64
    return @checked Lib.Bus_Get_N_interrupts()
end

"""Name of Bus"""
function Name()::String
    return get_string(@checked Lib.Bus_Get_Name())
end

"""Integer Array of Node Numbers defined at the bus in same order as the voltages."""
function Nodes()::Vector{Int}
    return get_int32_array(Lib.Bus_Get_Nodes)
end

"""Number of Nodes this bus."""
function NumNodes()::Int
    return @checked Lib.Bus_Get_NumNodes()
end

"""Integer ID of the feeder section in which this bus is located."""
function SectionID()::Int
    return @checked Lib.Bus_Get_SectionID()
end

"""Double Array of sequence voltages at this bus."""
function SeqVoltages()::Vector{Float64}
    return get_float64_array(Lib.Bus_Get_SeqVoltages)
end

"""Total length of line downline from this bus, in miles. For recloser siting algorithm."""
function TotalMiles()::Float64
    return @checked Lib.Bus_Get_TotalMiles()
end

"""For 2- and 3-phase buses, returns array of complex numbers representing L-L voltages in volts. Returns -1.0 for 1-phase bus. If more than 3 phases, returns only first 3."""
function VLL()::Vector{ComplexF64}
    return get_complex64_array(Lib.Bus_Get_VLL)
end

"""Variant Array of doubles containing voltages in Magnitude (VLN), angle (deg) """
function VMagAngle()::Vector{Float64}
    return get_float64_array(Lib.Bus_Get_VMagAngle)
end

"""Open circuit voltage; Complex array."""
function Voc()::Vector{ComplexF64}
    return get_complex64_array(Lib.Bus_Get_Voc)
end

"""Complex array of voltages at this bus."""
function Voltages()::Vector{ComplexF64}
    return get_complex64_array(Lib.Bus_Get_Voltages)
end

"""Complex array of Ysc matrix at bus. Column by column."""
function YscMatrix()::Vector{ComplexF64}
    return get_complex64_array(Lib.Bus_Get_YscMatrix)
end

"""Complex Zero-Sequence short circuit impedance at bus."""
function Zsc0()
    return get_complex64(Lib.Bus_Get_Zsc0)
end

"""Complex Positive-Sequence short circuit impedance at bus.."""
function Zsc1()
    return get_complex64(Lib.Bus_Get_Zsc1)
end

"""Complex array of Zsc matrix at bus. Column by column."""
function ZscMatrix()::Vector{ComplexF64}
    return get_complex64_array(Lib.Bus_Get_ZscMatrix)
end

"""Base voltage at bus in kV"""
function kVBase()::Float64
    return @checked Lib.Bus_Get_kVBase()
end

"""Returns Complex array of pu L-L voltages for 2- and 3-phase buses. Returns -1.0 for 1-phase bus. If more than 3 phases, returns only 3 phases."""
function puVLL()::Vector{ComplexF64}
    return get_complex64_array(Lib.Bus_Get_puVLL)
end

"""Array of doubles containing voltage magnitude, angle pairs in per unit"""
function puVmagAngle()::Vector{Float64}
    return get_float64_array(Lib.Bus_Get_puVmagAngle)
end

"""Complex Array of pu voltages at the bus."""
function PuVoltage()::Vector{ComplexF64}
    return get_complex64_array(Lib.Bus_Get_puVoltages)
end

"""X Coordinate for bus (double) (Getter)"""
function X()::Float64
    return @checked Lib.Bus_Get_x()
end

"""X Coordinate for bus (double) (Setter)"""
function X(Value::Float64)
    @checked Lib.Bus_Set_x(Value)
end

"""Y coordinate for bus (double) (Getter)"""
function Y()::Float64
    return @checked Lib.Bus_Get_y()
end

"""Y coordinate for bus (double)"""
function Y(Value::Float64)
    @checked Lib.Bus_Set_y(Value)
end

"""Array of strings: Full Names of LINE elements connected to the active bus."""
function LineList()::Vector{String}
    return get_string_array(Lib.Bus_Get_LineList)
end

"""Array of strings: Full Names of LOAD elements connected to the active bus."""
function LoadList()::Vector{String}
    return get_string_array(Lib.Bus_Get_LoadList)
end

"""Array with the names of all PCE connected to the active bus"""
function AllPCEatBus()::Vector{String}
    return get_string_array(Lib.Bus_Get_AllPCEatBus)
end

"""Array with the names of all PDE connected to the active bus"""
function AllPDEatBus()::Vector{String}
    return get_string_array(Lib.Bus_Get_AllPDEatBus)
end

"""Activates the next bus"""
function Next()::Int
    return @checked Lib.Bus_Get_Next()
end

"""3x3 complex matrix containing the complete 012 Zsc matrix"""
function ZSC012Matrix()::Matrix{ComplexF64}
    r = get_complex64_array(Lib.Bus_Get_ZSC012Matrix)
    return reshape(r, (3, 3))
end

end
