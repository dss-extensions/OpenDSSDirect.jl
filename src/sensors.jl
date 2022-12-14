module Sensors

using DocStringExtensions

using ..Lib
using ..Utils

@template (FUNCTIONS, METHODS) = """
                                 $(TYPEDSIGNATURES)
                                 $(DOCSTRING)
                                 """

function Reset()
    @checked Lib.Sensors_Reset(C_NULL_CTX)
end

function ResetAll()
    @checked Lib.Sensors_ResetAll(C_NULL_CTX)
end

"""Array of Sensor names."""
function AllNames()::Vector{String}
    return get_string_array(Lib.Sensors_Get_AllNames, C_NULL_CTX)
end

"""Number of Sensors in Active Circuit."""
function Count()::Int
    return @checked Lib.Sensors_Get_Count(C_NULL_CTX)
end

"""Array of doubles for the line current measurements; don't use with kW and kVAR. (Getter)"""
function Currents()::Vector{Float64}
    return get_float64_array(Lib.Sensors_Get_Currents, C_NULL_CTX)
end

"""Array of doubles for the line current measurements; don't use with kW and kVAR. (Setter)"""
function Currents(Value::Vector{Float64})
    Value, ValuePtr, ValueCount = prepare_float64_array(Value)
    @checked Lib.Sensors_Set_Currents(C_NULL_CTX, ValuePtr, ValueCount)
end

"""Sets the first sensor active. Returns 0 if none."""
function First()::Int
    return @checked Lib.Sensors_Get_First(C_NULL_CTX)
end

"""True if measured voltages are line-line. Currents are always line currents. (Getter)"""
function IsDelta()::Bool
    return @checked(Lib.Sensors_Get_IsDelta(C_NULL_CTX)) != 0
end

"""True if measured voltages are line-line. Currents are always line currents. (Setter)"""
function IsDelta(Value::Bool)
    @checked Lib.Sensors_Set_IsDelta(C_NULL_CTX, Value ? 1 : 0)
end

"""Full Name of the measured element (Getter)"""
function MeteredElement()::String
    return get_string(@checked Lib.Sensors_Get_MeteredElement(C_NULL_CTX))
end

"""Full Name of the measured element (Setter)"""
function MeteredElement(Value::String)
    @checked Lib.Sensors_Set_MeteredElement(C_NULL_CTX, Value)
end

"""Number of the measured terminal in the measured element. (Getter)"""
function MeteredTerminal()::Int
    return @checked Lib.Sensors_Get_MeteredTerminal(C_NULL_CTX)
end

"""Number of the measured terminal in the measured element. (Setter)"""
function MeteredTerminal(Value::Int)
    @checked Lib.Sensors_Set_MeteredTerminal(C_NULL_CTX, Value)
end

"""Name of the active sensor. (Getter)"""
function Name()::String
    return get_string(@checked Lib.Sensors_Get_Name(C_NULL_CTX))
end

"""Name of the active sensor. (Setter)"""
function Name(Value::String)
    @checked Lib.Sensors_Set_Name(C_NULL_CTX, Value)
end

"""Sets the next Sensor active. Returns 0 if no more."""
function Next()::Int
    return @checked Lib.Sensors_Get_Next(C_NULL_CTX)
end

"""Assumed percent error in the Sensor measurement. Default is 1. (Getter)"""
function PctError()::Int
    return @checked Lib.Sensors_Get_PctError(C_NULL_CTX)
end

"""Assumed percent error in the Sensor measurement. Default is 1. (Setter)"""
function PctError(Value::Int)
    @checked Lib.Sensors_Set_PctError(C_NULL_CTX, Value)
end

"""True if voltage measurements are 1-3, 3-2, 2-1. (Getter)"""
function ReverseDelta()::Bool
    return @checked(Lib.Sensors_Get_ReverseDelta(C_NULL_CTX)) != 0
end

"""True if voltage measurements are 1-3, 3-2, 2-1. (Setter)"""
function ReverseDelta(Value::Bool)
    @checked Lib.Sensors_Set_ReverseDelta(C_NULL_CTX, Value ? 1 : 0)
end

"""Weighting factor for this Sensor measurement with respect to other Sensors. Default is 1. (Getter)"""
function Weight()::Float64
    return @checked Lib.Sensors_Get_Weight(C_NULL_CTX)
end

"""Weighting factor for this Sensor measurement with respect to other Sensors. Default is 1. (Setter)"""
function Weight(Value::Float64)
    @checked Lib.Sensors_Set_Weight(C_NULL_CTX, Value)
end

"""Array of doubles for Q measurements. Overwrites Currents with a new estimate using kW. (Getter)"""
function kvar()::Vector{Float64}
    return get_float64_array(Lib.Sensors_Get_kVARS, C_NULL_CTX)
end

"""Array of doubles for Q measurements. Overwrites Currents with a new estimate using kW. (Setter)"""
function kvar(Value::Vector{Float64})
    Value, ValuePtr, ValueCount = prepare_float64_array(Value)
    @checked Lib.Sensors_Set_kVARS(C_NULL_CTX, ValuePtr, ValueCount)
end

"""Array of doubles for the LL or LN (depending on Delta connection) voltage measurements. (Getter)"""
function kVS()::Vector{Float64}
    return get_float64_array(Lib.Sensors_Get_kVS, C_NULL_CTX)
end

"""Array of doubles for the LL or LN (depending on Delta connection) voltage measurements. (Setter)"""
function kVS(Value::Vector{Float64})
    Value, ValuePtr, ValueCount = prepare_float64_array(Value)
    @checked Lib.Sensors_Set_kVS(C_NULL_CTX, ValuePtr, ValueCount)
end

"""Voltage base for the sensor measurements. LL for 2 and 3-phase sensors, LN for 1-phase sensors. (Getter)"""
function kVBase()::Float64
    return @checked Lib.Sensors_Get_kVbase(C_NULL_CTX)
end

"""Voltage base for the sensor measurements. LL for 2 and 3-phase sensors, LN for 1-phase sensors. (Setter)"""
function kVBase(Value::Float64)
    @checked Lib.Sensors_Set_kVbase(C_NULL_CTX, Value)
end

"""Array of doubles for P measurements. Overwrites Currents with a new estimate using kVAR. (Getter)"""
function kW()::Vector{Float64}
    return get_float64_array(Lib.Sensors_Get_kWS, C_NULL_CTX)
end

"""Array of doubles for P measurements. Overwrites Currents with a new estimate using kVAR. (Setter)"""
function kW(Value::Vector{Float64})
    Value, ValuePtr, ValueCount = prepare_float64_array(Value)
    @checked Lib.Sensors_Set_kWS(C_NULL_CTX, ValuePtr, ValueCount)
end

"""Sensor Index (Getter)"""
function Idx()::Int
    return @checked Lib.Sensors_Get_idx(C_NULL_CTX)
end

"""Sensor Index (Setter)"""
function Idx(Value::Int)
    @checked Lib.Sensors_Set_idx(C_NULL_CTX, Value)
end

"""Array of doubles for the allocation factors for each phase."""
function AllocationFactor()::Vector{Float64}
    return get_float64_array(Lib.Sensors_Get_AllocationFactor, C_NULL_CTX)
end

end
