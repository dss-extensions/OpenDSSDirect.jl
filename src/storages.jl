module Storages

using DocStringExtensions

using ..Lib
using ..Utils

@template (FUNCTIONS, METHODS) = """
                                 $(TYPEDSIGNATURES)
                                 $(DOCSTRING)
                                 """

"""List of strings with all Storage names"""
function AllNames(dss::DSSContext)::Vector{String}
    return get_string_array(Lib.Storages_Get_AllNames, dss.ctx)
end
AllNames() = AllNames(DSS_DEFAULT_CTX)

"""Number of Storages"""
function Count(dss::DSSContext)
    return @checked Lib.Storages_Get_Count(dss.ctx)
end
Count() = Count(DSS_DEFAULT_CTX)

"""Active Storage by index;   1..Count (Getter)"""
function Idx(dss::DSSContext)::Int
    return @checked Lib.Storages_Get_idx(dss.ctx)
end
Idx() = Idx(DSS_DEFAULT_CTX)

"""Active Storage by index;   1..Count (Setter)"""
function Idx(dss::DSSContext, Value::Int)
    @checked Lib.Storages_Set_idx(dss.ctx, Value)
end
Idx(Value::Int) = Idx(DSS_DEFAULT_CTX, Value)

"""Set first Storage active; returns 0 if none."""
function First(dss::DSSContext)
    return @checked Lib.Storages_Get_First(dss.ctx)
end
First() = First(DSS_DEFAULT_CTX)

"""Sets next Storage active; returns 0 if no more."""
function Next(dss::DSSContext)
    return @checked Lib.Storages_Get_Next(dss.ctx)
end
Next() = Next(DSS_DEFAULT_CTX)

"""Get the name of the active Storage"""
function Name(dss::DSSContext)::String
    return get_string(@checked Lib.Storages_Get_Name(dss.ctx))
end
Name() = Name(DSS_DEFAULT_CTX)

"""Set the name active Storage by name"""
function Name(dss::DSSContext, Value::String)
    @checked Lib.Storages_Set_Name(dss.ctx, Cstring(pointer(Value)))
end
Name(Value::String) = Name(DSS_DEFAULT_CTX, Value)

"""Per unit state of charge (Getter)"""
function puSOC(dss::DSSContext)::Float64
    return @checked Lib.Storages_Get_puSOC(dss.ctx)
end
puSOC() = puSOC(DSS_DEFAULT_CTX)

"""Per unit state of charge (Setter)"""
function puSOC(dss::DSSContext, Value::Float64)
    @checked Lib.Storages_Set_puSOC(dss.ctx, Value)
end
puSOC(Value::Float64) = puSOC(DSS_DEFAULT_CTX, Value)

"""
Get state: 0=Idling; 1=Discharging; -1=Charging;

Related enumeration: StorageStates
"""
function State(dss::DSSContext)::Lib.StorageStates
    return @checked Lib.Storages_Get_State(dss.ctx)
end
State() = State(DSS_DEFAULT_CTX)

"""
Set state: 0=Idling; 1=Discharging; -1=Charging;

Related enumeration: StorageStates
"""
function State(dss::DSSContext, Value::Union{Lib.StorageStates,Int})
    @checked Lib.Storages_Set_State(dss.ctx, Value)
end
State(Value::Union{Lib.StorageStates,Int}) = State(DSS_DEFAULT_CTX, Value)

"""Array of Names of all Storage energy meter registers"""
function RegisterNames(dss::DSSContext)::Vector{String}
    return get_string_array(Lib.Storages_Get_RegisterNames, dss.ctx)
end
RegisterNames() = RegisterNames(DSS_DEFAULT_CTX)

"""Array of values in Storage registers."""
function RegisterValues(dss::DSSContext)
    return get_float64_array(Lib.Storages_Get_RegisterValues, dss.ctx)
end
RegisterValues() = RegisterValues(DSS_DEFAULT_CTX)

end