module Bus

using DocStringExtensions

using ..Lib
using ..Utils

@template (FUNCTIONS, METHODS) = """
                                 $(TYPEDSIGNATURES)
                                 $(DOCSTRING)
                                 """

"""Get unique node number"""
function GetUniqueNodeNumber(dss::DSSContext, StartNumber::Int)::Int
    return @checked Lib.Bus_GetUniqueNodeNumber(dss.ctx, StartNumber)
end
GetUniqueNodeNumber(StartNumber::Int) = GetUniqueNodeNumber(DSS_DEFAULT_CTX, StartNumber)

"""Check if DoZscRefresh is set"""
function ZscRefresh(dss::DSSContext)::Bool
    return @checked(Lib.Bus_ZscRefresh(dss.ctx)) != 0
end
ZscRefresh() = ZscRefresh(DSS_DEFAULT_CTX)

"""Indicates whether a coordinate has been defined for this bus"""
function Coorddefined(dss::DSSContext)::Bool
    return @checked(Lib.Bus_Get_Coorddefined(dss.ctx)) != 0
end
Coorddefined() = Coorddefined(DSS_DEFAULT_CTX)

"""Complex Double array of Sequence Voltages (0, 1, 2) at this Bus."""
function CplxSeqVoltages(dss::DSSContext)::Vector{ComplexF64}
    return get_complex64_array(Lib.Bus_Get_CplxSeqVoltages, dss.ctx)
end
CplxSeqVoltages() = CplxSeqVoltages(DSS_DEFAULT_CTX)

"""Accumulated customer outage durations"""
function Cust_Duration(dss::DSSContext)::Float64
    return @checked Lib.Bus_Get_Cust_Duration(dss.ctx)
end
Cust_Duration() = Cust_Duration(DSS_DEFAULT_CTX)

"""Annual number of customer-interruptions from this bus"""
function Cust_Interrupts(dss::DSSContext)::Float64
    return @checked Lib.Bus_Get_Cust_Interrupts(dss.ctx)
end
Cust_Interrupts() = Cust_Interrupts(DSS_DEFAULT_CTX)

"""Distance from energymeter (if non-zero)"""
function Distance(dss::DSSContext)::Float64
    return @checked Lib.Bus_Get_Distance(dss.ctx)
end
Distance() = Distance(DSS_DEFAULT_CTX)

"""Average interruption duration, hr."""
function Int_Duration(dss::DSSContext)::Float64
    return @checked Lib.Bus_Get_Int_Duration(dss.ctx)
end
Int_Duration() = Int_Duration(DSS_DEFAULT_CTX)

"""Short circuit currents at bus; Complex Array."""
function Isc(dss::DSSContext)::Vector{ComplexF64}
    return get_complex64_array(Lib.Bus_Get_Isc, dss.ctx)
end
Isc() = Isc(DSS_DEFAULT_CTX)

"""Accumulated failure rate downstream from this bus; faults per year"""
function Lambda(dss::DSSContext)::Float64
    return @checked Lib.Bus_Get_Lambda(dss.ctx)
end
Lambda() = Lambda(DSS_DEFAULT_CTX)

"""Total numbers of customers served downline from this bus"""
function N_Customers(dss::DSSContext)::Int
    return @checked Lib.Bus_Get_N_Customers(dss.ctx)
end
N_Customers() = N_Customers(DSS_DEFAULT_CTX)

"""Number of interruptions this bus per year"""
function N_interrupts(dss::DSSContext)::Float64
    return @checked Lib.Bus_Get_N_interrupts(dss.ctx)
end
N_interrupts() = N_interrupts(DSS_DEFAULT_CTX)

"""Name of Bus"""
function Name(dss::DSSContext)::String
    return get_string(@checked Lib.Bus_Get_Name(dss.ctx))
end
Name() = Name(DSS_DEFAULT_CTX)

"""Integer Array of Node Numbers defined at the bus in same order as the voltages."""
function Nodes(dss::DSSContext)::Vector{Int}
    return get_int32_array(Lib.Bus_Get_Nodes, dss.ctx)
end
Nodes() = Nodes(DSS_DEFAULT_CTX)

"""Number of Nodes this bus."""
function NumNodes(dss::DSSContext)::Int
    return @checked Lib.Bus_Get_NumNodes(dss.ctx)
end
NumNodes() = NumNodes(DSS_DEFAULT_CTX)

"""Integer ID of the feeder section in which this bus is located."""
function SectionID(dss::DSSContext)::Int
    return @checked Lib.Bus_Get_SectionID(dss.ctx)
end
SectionID() = SectionID(DSS_DEFAULT_CTX)

"""Double Array of sequence voltages at this bus."""
function SeqVoltages(dss::DSSContext)::Vector{Float64}
    return get_float64_array(Lib.Bus_Get_SeqVoltages, dss.ctx)
end
SeqVoltages() = SeqVoltages(DSS_DEFAULT_CTX)

"""Total length of line downline from this bus, in miles. For recloser siting algorithm."""
function TotalMiles(dss::DSSContext)::Float64
    return @checked Lib.Bus_Get_TotalMiles(dss.ctx)
end
TotalMiles() = TotalMiles(DSS_DEFAULT_CTX)

"""For 2- and 3-phase buses, returns array of complex numbers representing L-L voltages in volts. Returns -1.0 for 1-phase bus. If more than 3 phases, returns only first 3."""
function VLL(dss::DSSContext)::Vector{ComplexF64}
    return get_complex64_array(Lib.Bus_Get_VLL, dss.ctx)
end
VLL() = VLL(DSS_DEFAULT_CTX)

"""Variant Array of doubles containing voltages in Magnitude (VLN), angle (deg) """
function VMagAngle(dss::DSSContext)::Vector{Float64}
    return get_float64_array(Lib.Bus_Get_VMagAngle, dss.ctx)
end
VMagAngle() = VMagAngle(DSS_DEFAULT_CTX)

"""Open circuit voltage; Complex array."""
function Voc(dss::DSSContext)::Vector{ComplexF64}
    return get_complex64_array(Lib.Bus_Get_Voc, dss.ctx)
end
Voc() = Voc(DSS_DEFAULT_CTX)

"""Complex array of voltages at this bus."""
function Voltages(dss::DSSContext)::Vector{ComplexF64}
    return get_complex64_array(Lib.Bus_Get_Voltages, dss.ctx)
end
Voltages() = Voltages(DSS_DEFAULT_CTX)

"""Complex array of Ysc matrix at bus. Column by column."""
function YscMatrix(dss::DSSContext)::Vector{ComplexF64}
    return get_complex64_array(Lib.Bus_Get_YscMatrix, dss.ctx)
end
YscMatrix() = YscMatrix(DSS_DEFAULT_CTX)

"""Complex Zero-Sequence short circuit impedance at bus."""
function Zsc0(dss::DSSContext)
    return get_complex64(Lib.Bus_Get_Zsc0, dss.ctx)
end
Zsc0() = Zsc0(DSS_DEFAULT_CTX)

"""Complex Positive-Sequence short circuit impedance at bus.."""
function Zsc1(dss::DSSContext)
    return get_complex64(Lib.Bus_Get_Zsc1, dss.ctx)
end
Zsc1() = Zsc1(DSS_DEFAULT_CTX)

"""Complex array of Zsc matrix at bus. Column by column."""
function ZscMatrix(dss::DSSContext)::Vector{ComplexF64}
    return get_complex64_array(Lib.Bus_Get_ZscMatrix, dss.ctx)
end
ZscMatrix() = ZscMatrix(DSS_DEFAULT_CTX)

"""Base voltage at bus in kV"""
function kVBase(dss::DSSContext)::Float64
    return @checked Lib.Bus_Get_kVBase(dss.ctx)
end
kVBase() = kVBase(DSS_DEFAULT_CTX)

"""Returns Complex array of pu L-L voltages for 2- and 3-phase buses. Returns -1.0 for 1-phase bus. If more than 3 phases, returns only 3 phases."""
function puVLL(dss::DSSContext)::Vector{ComplexF64}
    return get_complex64_array(Lib.Bus_Get_puVLL, dss.ctx)
end
puVLL() = puVLL(DSS_DEFAULT_CTX)

"""Array of doubles containing voltage magnitude, angle pairs in per unit"""
function puVmagAngle(dss::DSSContext)::Vector{Float64}
    return get_float64_array(Lib.Bus_Get_puVmagAngle, dss.ctx)
end
puVmagAngle() = puVmagAngle(DSS_DEFAULT_CTX)

"""Complex Array of pu voltages at the bus."""
function PuVoltage(dss::DSSContext)::Vector{ComplexF64}
    return get_complex64_array(Lib.Bus_Get_puVoltages, dss.ctx)
end
PuVoltage() = PuVoltage(DSS_DEFAULT_CTX)

"""X Coordinate for bus (double) (Getter)"""
function X(dss::DSSContext)::Float64
    return @checked Lib.Bus_Get_x(dss.ctx)
end
X() = X(DSS_DEFAULT_CTX)

"""X Coordinate for bus (double) (Setter)"""
function X(dss::DSSContext, Value::Float64)
    @checked Lib.Bus_Set_x(dss.ctx, Value)
end
X(Value::Float64) = X(DSS_DEFAULT_CTX, Value)

"""Y coordinate for bus (double) (Getter)"""
function Y(dss::DSSContext)::Float64
    return @checked Lib.Bus_Get_y(dss.ctx)
end
Y() = Y(DSS_DEFAULT_CTX)

"""Y coordinate for bus (double)"""
function Y(dss::DSSContext, Value::Float64)
    @checked Lib.Bus_Set_y(dss.ctx, Value)
end
Y(Value::Float64) = Y(DSS_DEFAULT_CTX, Value)

"""Array of strings: Full Names of LINE elements connected to the active bus."""
function LineList(dss::DSSContext)::Vector{String}
    return get_string_array(Lib.Bus_Get_LineList, dss.ctx)
end
LineList() = LineList(DSS_DEFAULT_CTX)

"""Array of strings: Full Names of LOAD elements connected to the active bus."""
function LoadList(dss::DSSContext)::Vector{String}
    return get_string_array(Lib.Bus_Get_LoadList, dss.ctx)
end
LoadList() = LoadList(DSS_DEFAULT_CTX)

"""Array with the names of all PCE connected to the active bus"""
function AllPCEatBus(dss::DSSContext)::Vector{String}
    return get_string_array(Lib.Bus_Get_AllPCEatBus, dss.ctx)
end
AllPCEatBus() = AllPCEatBus(DSS_DEFAULT_CTX)

"""Array with the names of all PDE connected to the active bus"""
function AllPDEatBus(dss::DSSContext)::Vector{String}
    return get_string_array(Lib.Bus_Get_AllPDEatBus, dss.ctx)
end
AllPDEatBus() = AllPDEatBus(DSS_DEFAULT_CTX)

"""Activates the next bus"""
function Next(dss::DSSContext)::Int
    return @checked Lib.Bus_Get_Next(dss.ctx)
end
Next() = Next(DSS_DEFAULT_CTX)

"""3x3 complex matrix containing the complete 012 Zsc matrix"""
function ZSC012Matrix(dss::DSSContext)::Matrix{ComplexF64}
    r = get_complex64_array(Lib.Bus_Get_ZSC012Matrix, dss.ctx)
    return reshape(r, (3, 3))
end
ZSC012Matrix() = ZSC012Matrix(DSS_DEFAULT_CTX)

end
