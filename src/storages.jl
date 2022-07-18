module Storages

using DocStringExtensions

using ..Lib
using ..Utils

@template (FUNCTIONS, METHODS) = """
                                 $(TYPEDSIGNATURES)
                                 $(DOCSTRING)
                                 """

"""List of strings with all Storage names"""
function AllNames()::Vector{String}
    return get_string_array(Lib.Storages_Get_AllNames)
end

"""Number of Storages"""
function Count()
    return @checked Lib.Storages_Get_Count()
end

"""Active Storage by index;   1..Count (Getter)"""
function Idx()::Int
    return @checked Lib.Storages_Get_idx()
end

"""Active Storage by index;   1..Count (Setter)"""
function Idx(Value::Int)
    @checked Lib.Storages_Set_idx(Value)
end

"""Set first Storage active; returns 0 if none."""
function First()
    return @checked Lib.Storages_Get_First()
end

"""Sets next Storage active; returns 0 if no more."""
function Next()
    return @checked Lib.Storages_Get_Next()
end

"""Get the name of the active Storage"""
function Name()::String
    return get_string(@checked Lib.Storages_Get_Name())
end

"""Set the name active Storage by name"""
function Name(Value::String)
    @checked Lib.Storages_Set_Name(Cstring(pointer(Value)))
end

"""Per unit state of charge (Getter)"""
function puSOC()::Float64
    return @checked Lib.Storages_Get_puSOC()
end

"""Per unit state of charge (Setter)"""
function puSOC(Value::Float64)
    @checked Lib.Storages_Set_puSOC(Value)
end

"""
Get state: 0=Idling; 1=Discharging; -1=Charging;

Related enumeration: StorageStates
"""
function State()::Lib.StorageStates
    return @checked Lib.Storages_Get_State()
end

"""
Set state: 0=Idling; 1=Discharging; -1=Charging;

Related enumeration: StorageStates
"""
function State(Value::Union{Lib.StorageStates, Int})
    @checked Lib.Storages_Set_State(Value)
end

"""Array of Names of all Storage energy meter registers"""
function RegisterNames()::Vector{String}
    return get_string_array(Lib.Storages_Get_RegisterNames)
end

"""Array of values in Storage registers."""
function RegisterValues()
    return get_float64_array(Lib.Storages_Get_RegisterValues)
end

end