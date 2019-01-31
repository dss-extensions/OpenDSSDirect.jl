module Bus

    using ..Lib
    using ..Utils

    function GetUniqueNodeNumber(StartNumber::Int)::Int
        return Lib.Bus_GetUniqueNodeNumber(StartNumber)
    end

    function ZscRefresh()::Bool
        return Lib.Bus_ZscRefresh() != 0
    end

    """(read-only) False=0 else True. Indicates whether a coordinate has been defined for this bus"""
    function Coorddefined()::Bool
        return Lib.Bus_Get_Coorddefined() != 0
    end

    """(read-only) Complex Double array of Sequence Voltages (0, 1, 2) at this Bus."""
    function CplxSeqVoltages()::Vector{ComplexF64}
        return get_complex64_array(Lib.Bus_Get_CplxSeqVoltages)
    end

    """(read-only) Accumulated customer outage durations"""
    function Cust_Duration()::Float64
        return Lib.Bus_Get_Cust_Duration()
    end

    """(read-only) Annual number of customer-interruptions from this bus"""
    function Cust_Interrupts()::Float64
        return Lib.Bus_Get_Cust_Interrupts()
    end

    """(read-only) Distance from energymeter (if non-zero)"""
    function Distance()::Float64
        return Lib.Bus_Get_Distance()
    end

    """(read-only) Average interruption duration, hr."""
    function Int_Duration()::Float64
        return Lib.Bus_Get_Int_Duration()
    end

    """(read-only) Short circuit currents at bus; Complex Array."""
    function Isc()::Vector{ComplexF64}
        return get_complex64_array(Lib.Bus_Get_Isc)
    end

    """(read-only) Accumulated failure rate downstream from this bus; faults per year"""
    function Lambda()::Float64
        return Lib.Bus_Get_Lambda()
    end

    """(read-only) Total numbers of customers served downline from this bus"""
    function N_Customers()::Int
        return Lib.Bus_Get_N_Customers()
    end

    """(read-only) Number of interruptions this bus per year"""
    function N_interrupts()::Float64
        return Lib.Bus_Get_N_interrupts()
    end

    """(read-only) Name of Bus"""
    function Name()::String
        return get_string(Lib.Bus_Get_Name())
    end

    """(read-only) Integer Array of Node Numbers defined at the bus in same order as the voltages."""
    function Nodes()::Vector{Int}
        return get_int32_array(Lib.Bus_Get_Nodes)
    end

    """(read-only) Number of Nodes this bus."""
    function NumNodes()::Int
        return Lib.Bus_Get_NumNodes()
    end

    """(read-only) Integer ID of the feeder section in which this bus is located."""
    function SectionID()::Int
        return Lib.Bus_Get_SectionID()
    end

    """(read-only) Double Array of sequence voltages at this bus."""
    function SeqVoltages()::Vector{Float64}
        return get_float64_array(Lib.Bus_Get_SeqVoltages)
    end

    """(read-only) Total length of line downline from this bus, in miles. For recloser siting algorithm."""
    function TotalMiles()::Float64
        return Lib.Bus_Get_TotalMiles()
    end

    """(read-only) For 2- and 3-phase buses, returns array of complex numbers represetin L-L voltages in volts. Returns -1.0 for 1-phase bus. If more than 3 phases, returns only first 3."""
    function VLL()::Vector{ComplexF64}
        return get_complex64_array(Lib.Bus_Get_VLL)
    end

    """(read-only) Variant Array of doubles containing voltages in Magnitude (VLN), angle (deg) """
    function VMagAngle()::Vector{Float64}
        return get_float64_array(Lib.Bus_Get_VMagAngle)
    end

    """(read-only) Open circuit voltage; Complex array."""
    function Voc()::Vector{ComplexF64}
        return get_complex64_array(Lib.Bus_Get_Voc)
    end

    """(read-only) Complex array of voltages at this bus."""
    function Voltages()::Vector{ComplexF64}
        return get_complex64_array(Lib.Bus_Get_Voltages)
    end

    """(read-only) Complex array of Ysc matrix at bus. Column by column."""
    function YscMatrix()::Vector{ComplexF64}
        return get_complex64_array(Lib.Bus_Get_YscMatrix)
    end

    """(read-only) Complex Zero-Sequence short circuit impedance at bus."""
    function Zsc0()
        return get_complex64(Lib.Bus_Get_Zsc0)
    end

    """(read-only) Complex Positive-Sequence short circuit impedance at bus.."""
    function Zsc1()
        return get_complex64(Lib.Bus_Get_Zsc1)
    end

    """(read-only) Complex array of Zsc matrix at bus. Column by column."""
    function ZscMatrix()::Vector{ComplexF64}
        return get_complex64_array(Lib.Bus_Get_ZscMatrix)
    end

    """(read-only) Base voltage at bus in kV"""
    function kVBase()::Float64
        return Lib.Bus_Get_kVBase()
    end

    """(read-only) Returns Complex array of pu L-L voltages for 2- and 3-phase buses. Returns -1.0 for 1-phase bus. If more than 3 phases, returns only 3 phases."""
    function puVLL()::Vector{ComplexF64}
        return get_complex64_array(Lib.Bus_Get_puVLL)
    end

    """(read-only) Array of doubles containig voltage magnitude, angle pairs in per unit"""
    function puVmagAngle()::Vector{Float64}
        return get_float64_array(Lib.Bus_Get_puVmagAngle)
    end

    """(read-only) Complex Array of pu voltages at the bus."""
    function PuVoltage()::Vector{ComplexF64}
        return get_complex64_array(Lib.Bus_Get_puVoltages)
    end

    """X Coordinate for bus (double) (Getter)"""
    function X()
        return Lib.Bus_Get_x()
    end

    """X Coordinate for bus (double) (Setter)"""
    function X(Value::Float64)
        Lib.Bus_Set_x(Value)
    end

    """Y coordinate for bus(double) (Getter)"""
    function Y()
        return Lib.Bus_Get_y()
    end

    """Y coordinate for bus(double)"""
    function Y(Value::Float64)
        Lib.Bus_Set_y(Value)
    end

end
