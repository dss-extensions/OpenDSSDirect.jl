module Isource

using DocStringExtensions

using ..Lib
using ..Utils

@template (FUNCTIONS, METHODS) = """
                                 $(TYPEDSIGNATURES)
                                 $(DOCSTRING)
                                 """

"""Array of strings containing names of all ISOURCE elements."""
function AllNames()::Vector{String}
    return get_string_array(Lib.ISources_Get_AllNames, C_NULL_CTX)
end

"""Magnitude of the ISOURCE in amps"""
function Amps()::Float64
    return @checked Lib.ISources_Get_Amps(C_NULL_CTX)
end

"""Magnitude of the ISOURCE in amps"""
function Amps(Value::Float64)
    @checked Lib.ISources_Set_Amps(C_NULL_CTX, Value)
end

"""Phase angle for ISOURCE, degrees (Getter)"""
function AngleDeg()::Float64
    return @checked Lib.ISources_Get_AngleDeg(C_NULL_CTX)
end

"""Phase angle for ISOURCE, degrees (Setter)"""
function AngleDeg(Value::Float64)
    @checked Lib.ISources_Set_AngleDeg(C_NULL_CTX, Value)
end

"""Count: Number of ISOURCE elements."""
function Count()::Int
    return @checked Lib.ISources_Get_Count(C_NULL_CTX)
end

"""Set the First ISOURCE to be active; returns Zero if none."""
function First()::Int
    return @checked Lib.ISources_Get_First(C_NULL_CTX)
end

"""The present frequency of the ISOURCE, Hz (Getter)"""
function Frequency()::Float64
    return @checked Lib.ISources_Get_Frequency(C_NULL_CTX)
end

"""The present frequency of the ISOURCE, Hz (Setter)"""
function Frequency(Value::Float64)
    @checked Lib.ISources_Set_Frequency(C_NULL_CTX, Value)
end

"""Name of Active ISOURCE (Getter)"""
function Name()::String
    return get_string(@checked Lib.ISources_Get_Name(C_NULL_CTX))
end

"""Name of Active ISOURCE (Setter)"""
function Name(Value::String)
    @checked Lib.ISources_Set_Name(C_NULL_CTX, Cstring(pointer(Value)))
end

"""Sets the next ISOURCE element to be the active one. Returns Zero if no more."""
function Next()::Int
    return @checked Lib.ISources_Get_Next(C_NULL_CTX)
end

"""ISOURCE Index (Getter)"""
function Idx()::Int
    return @checked Lib.ISources_Get_idx(C_NULL_CTX)
end

"""ISOURCE Index (Setter)"""
function Idx(Value::Int)
    @checked Lib.ISources_Set_idx(C_NULL_CTX, Value)
end

end
