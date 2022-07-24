module GICSources

using DocStringExtensions

using ..Lib
using ..Utils

@template (FUNCTIONS, METHODS) = """
                                 $(TYPEDSIGNATURES)
                                 $(DOCSTRING)
                                 """


"""Array of names of all GICSource objects."""
function AllNames()::Vector{String}
    return get_string_array(Lib.GICSources_Get_AllNames)
end

"""Sets a GICSource active by name."""
function Name()::String
    return get_string(@checked Lib.GICSources_Get_Name())
end

"""Sets a GICSource active by name."""
function Name(Value::String)
    @checked Lib.GICSources_Set_Name(Cstring(pointer(Value)))
end

"""Number of GICSource Objects in Active Circuit"""
function Count()::Int
    return @checked Lib.GICSources_Get_Count()
end

"""Sets first GICSource to be active.  Returns 0 if none."""
function First()::Int
    return @checked Lib.GICSources_Get_First()
end

"""Sets next GICSource to be active.  Returns 0 if no more."""
function Next()::Int
    return @checked Lib.GICSources_Get_Next()
end

"""Active GICSource by index.  1..Count (Getter)"""
function Idx()::Int
    return @checked Lib.GICSources_Get_idx()
end

"""Active GICSource by index.  1..Count (Setter)"""
function Idx(Value::Int)
    @checked Lib.GICSources_Set_idx(Value)
end

"""Latitude of Bus2 (degrees) (Getter)"""
function Lat2()::Float64
    return @checked Lib.GICSources_Get_Lat2()
end

"""Latitude of Bus2 (degrees) (Setter)"""
function Lat2(Value::Float64)
    return @checked Lib.GICSources_Set_Lat2(Value)
end

"""Latitude of Bus1 (degrees) (Getter)"""
function Lat1()::Float64
    return @checked Lib.GICSources_Get_Lat1()
end

"""Latitude of Bus1 (degrees) (Setter)"""
function Lat1(Value::Float64)
    return @checked Lib.GICSources_Set_Lat1(Value)
end

"""Longitude of Bus1 (Getter)"""
function Lon1()::Float64
    return @checked Lib.GICSources_Get_Lon1()
end

"""Longitude of Bus1 (Setter)"""
function Lon1(Value::Float64)
    return @checked Lib.GICSources_Set_Lon1(Value)
end

"""Longitude of Bus2 (Getter)"""
function Lon2()::Float64
    return @checked Lib.GICSources_Get_Lon2()
end

"""Longitude of Bus2 (Setter)"""
function Lon2(Value::Float64)
    return @checked Lib.GICSources_Set_Lon2(Value)
end

"""Phases (Getter)"""
function Phases()::Int
    return @checked Lib.GICSources_Get_Phases()
end

"""Phases (Setter)"""
function Phases(Value::Int)
    return @checked Lib.GICSources_Set_Phases(Value)
end

"""Northward E Field V/km (Getter)"""
function EN()::Float64
    return @checked Lib.GICSources_Get_EN()
end

"""Northward E Field V/km (Setter)"""
function EN(Value::Float64)
    return @checked Lib.GICSources_Set_EN(Value)
end

"""Eastward E Field, V/km (Getter)"""
function EE()::Float64
    return @checked Lib.GICSources_Get_EE()
end

"""Eastward E Field, V/km (Setter)"""
function EE(Value::Float64)
    return @checked Lib.GICSources_Set_EE(Value)
end

"""Specify dc voltage directly (Getter)"""
function Volts()::Float64
    return @checked Lib.GICSources_Get_Volts()
end

"""Specify dc voltage directly (Setter)"""
function Volts(Value::Float64)
    return @checked Lib.GICSources_Set_Volts(Value)
end

"""Second bus name"""
function Bus2()::String
    return get_string(@checked Lib.GICSources_Get_Bus2())
end

"""First bus name of GICSource (Created name)"""
function Bus1()::String
    return get_string(@checked Lib.GICSources_Get_Bus1())
end

end