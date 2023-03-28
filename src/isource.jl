module Isource

using DocStringExtensions

using ..Lib
using ..Utils

@template (FUNCTIONS, METHODS) = """
                                 $(TYPEDSIGNATURES)
                                 $(DOCSTRING)
                                 """

"""Array of strings containing names of all ISOURCE elements."""
function AllNames(dss::DSSContext)::Vector{String}
    return get_string_array(Lib.ISources_Get_AllNames, dss.ctx)
end
AllNames() = AllNames(DSS_DEFAULT_CTX)

"""Magnitude of the ISOURCE in amps"""
function Amps(dss::DSSContext)::Float64
    return @checked Lib.ISources_Get_Amps(dss.ctx)
end
Amps() = Amps(DSS_DEFAULT_CTX)

"""Magnitude of the ISOURCE in amps"""
function Amps(dss::DSSContext, Value::Float64)
    @checked Lib.ISources_Set_Amps(dss.ctx, Value)
end
Amps(Value::Float64) = Amps(DSS_DEFAULT_CTX, Value)

"""Phase angle for ISOURCE, degrees (Getter)"""
function AngleDeg(dss::DSSContext)::Float64
    return @checked Lib.ISources_Get_AngleDeg(dss.ctx)
end
AngleDeg() = AngleDeg(DSS_DEFAULT_CTX)

"""Phase angle for ISOURCE, degrees (Setter)"""
function AngleDeg(dss::DSSContext, Value::Float64)
    @checked Lib.ISources_Set_AngleDeg(dss.ctx, Value)
end
AngleDeg(Value::Float64) = AngleDeg(DSS_DEFAULT_CTX, Value)

"""Count: Number of ISOURCE elements."""
function Count(dss::DSSContext)::Int
    return @checked Lib.ISources_Get_Count(dss.ctx)
end
Count() = Count(DSS_DEFAULT_CTX)

"""Set the First ISOURCE to be active; returns Zero if none."""
function First(dss::DSSContext)::Int
    return @checked Lib.ISources_Get_First(dss.ctx)
end
First() = First(DSS_DEFAULT_CTX)

"""The present frequency of the ISOURCE, Hz (Getter)"""
function Frequency(dss::DSSContext)::Float64
    return @checked Lib.ISources_Get_Frequency(dss.ctx)
end
Frequency() = Frequency(DSS_DEFAULT_CTX)

"""The present frequency of the ISOURCE, Hz (Setter)"""
function Frequency(dss::DSSContext, Value::Float64)
    @checked Lib.ISources_Set_Frequency(dss.ctx, Value)
end
Frequency(Value::Float64) = Frequency(DSS_DEFAULT_CTX, Value)

"""Name of Active ISOURCE (Getter)"""
function Name(dss::DSSContext)::String
    return get_string(@checked Lib.ISources_Get_Name(dss.ctx))
end
Name() = Name(DSS_DEFAULT_CTX)

"""Name of Active ISOURCE (Setter)"""
function Name(dss::DSSContext, Value::String)
    @checked Lib.ISources_Set_Name(dss.ctx, Cstring(pointer(Value)))
end
Name(Value::String) = Name(DSS_DEFAULT_CTX, Value)

"""Sets the next ISOURCE element to be the active one. Returns Zero if no more."""
function Next(dss::DSSContext)::Int
    return @checked Lib.ISources_Get_Next(dss.ctx)
end
Next() = Next(DSS_DEFAULT_CTX)

"""ISOURCE Index (Getter)"""
function Idx(dss::DSSContext)::Int
    return @checked Lib.ISources_Get_idx(dss.ctx)
end
Idx() = Idx(DSS_DEFAULT_CTX)

"""ISOURCE Index (Setter)"""
function Idx(dss::DSSContext, Value::Int)
    @checked Lib.ISources_Set_idx(dss.ctx, Value)
end
Idx(Value::Int) = Idx(DSS_DEFAULT_CTX, Value)

end
