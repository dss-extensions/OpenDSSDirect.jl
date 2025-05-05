module GICSources

using DocStringExtensions

using ..Lib
using ..Utils

@template (FUNCTIONS, METHODS) = """
                                 $(TYPEDSIGNATURES)
                                 $(DOCSTRING)
                                 """


"""Array of names of all GICSource objects."""
function AllNames(dss::DSSContext)::Vector{String}
    return get_string_array(Lib.GICSources_Get_AllNames, dss.ctx)
end
AllNames() = AllNames(DSS_DEFAULT_CTX)

"""Gets the name of the active GICSource object."""
function Name(dss::DSSContext)::String
    return get_string(@checked Lib.GICSources_Get_Name(dss.ctx))
end
Name() = Name(DSS_DEFAULT_CTX)

"""Sets a GICSource object active by name."""
function Name(dss::DSSContext, Value::String)
    @checked Lib.GICSources_Set_Name(dss.ctx, Value)
end
Name(Value::String) = Name(DSS_DEFAULT_CTX, Value)

"""Number of GICSource Objects in Active Circuit"""
function Count(dss::DSSContext)::Int
    return @checked Lib.GICSources_Get_Count(dss.ctx)
end
Count() = Count(DSS_DEFAULT_CTX)

"""
Sets first GICSource to be active.
Returns 0 if none.
"""
function First(dss::DSSContext)::Int
    return @checked Lib.GICSources_Get_First(dss.ctx)
end
First() = First(DSS_DEFAULT_CTX)

"""
Sets next GICSource to be active.
Returns 0 if no more.
"""
function Next(dss::DSSContext)::Int
    return @checked Lib.GICSources_Get_Next(dss.ctx)
end
Next() = Next(DSS_DEFAULT_CTX)

"""
Returns the index of the current active GICSource (1-based)

(Getter)
"""
function Idx(dss::DSSContext)::Int
    return @checked Lib.GICSources_Get_idx(dss.ctx)
end
Idx() = Idx(DSS_DEFAULT_CTX)

"""
Activate GICSource by index (1-based)

(Setter)
"""
function Idx(dss::DSSContext, Value::Int)
    @checked Lib.GICSources_Set_idx(dss.ctx, Value)
end
Idx(Value::Int) = Idx(DSS_DEFAULT_CTX, Value)

"""
Latitude of Bus2 (degrees)

(Getter)
"""
function Lat2(dss::DSSContext)::Float64
    return @checked Lib.GICSources_Get_Lat2(dss.ctx)
end
Lat2() = Lat2(DSS_DEFAULT_CTX)

"""
Latitude of Bus2 (degrees)

(Setter)
"""
function Lat2(dss::DSSContext, Value::Float64)
    return @checked Lib.GICSources_Set_Lat2(dss.ctx, Value)
end
Lat2(Value::Float64) = Lat2(DSS_DEFAULT_CTX, Value)

"""
Latitude of Bus1 (degrees)

(Getter)
"""
function Lat1(dss::DSSContext)::Float64
    return @checked Lib.GICSources_Get_Lat1(dss.ctx)
end
Lat1() = Lat1(DSS_DEFAULT_CTX)

"""
Latitude of Bus1 (degrees)

(Setter)
"""
function Lat1(dss::DSSContext, Value::Float64)
    return @checked Lib.GICSources_Set_Lat1(dss.ctx, Value)
end
Lat1(Value::Float64) = Lat1(DSS_DEFAULT_CTX, Value)

"""
Longitude of Bus1 (Degrees)

(Getter)
"""
function Lon1(dss::DSSContext)::Float64
    return @checked Lib.GICSources_Get_Lon1(dss.ctx)
end
Lon1() = Lon1(DSS_DEFAULT_CTX)

"""
Longitude of Bus1 (Degrees)

(Setter)
"""
function Lon1(dss::DSSContext, Value::Float64)
    return @checked Lib.GICSources_Set_Lon1(dss.ctx, Value)
end
Lon1(Value::Float64) = Lon1(DSS_DEFAULT_CTX, Value)

"""
Longitude of Bus2 (Degrees)

(Getter)
"""
function Lon2(dss::DSSContext)::Float64
    return @checked Lib.GICSources_Get_Lon2(dss.ctx)
end
Lon2() = Lon2(DSS_DEFAULT_CTX)

"""
Longitude of Bus2 (Degrees)

(Setter)
"""
function Lon2(dss::DSSContext, Value::Float64)
    return @checked Lib.GICSources_Set_Lon2(dss.ctx, Value)
end
Lon2(Value::Float64) = Lon2(DSS_DEFAULT_CTX, Value)

"""
Number of Phases, this GICSource element.

(Getter)
"""
function Phases(dss::DSSContext)::Int
    return @checked Lib.GICSources_Get_Phases(dss.ctx)
end
Phases() = Phases(DSS_DEFAULT_CTX)

"""
Number of Phases, this GICSource element.

(Setter)
"""
function Phases(dss::DSSContext, Value::Int)
    return @checked Lib.GICSources_Set_Phases(dss.ctx, Value)
end
Phases(Value::Int) = Phases(DSS_DEFAULT_CTX, Value)

"""
Northward E Field V/km

(Getter)
"""
function EN(dss::DSSContext)::Float64
    return @checked Lib.GICSources_Get_EN(dss.ctx)
end
EN() = EN(DSS_DEFAULT_CTX)

"""
Northward E Field V/km

(Setter)
"""
function EN(dss::DSSContext, Value::Float64)
    return @checked Lib.GICSources_Set_EN(dss.ctx, Value)
end
EN(Value::Float64) = EN(DSS_DEFAULT_CTX, Value)

"""
Eastward E Field, V/km

(Getter)
"""
function EE(dss::DSSContext)::Float64
    return @checked Lib.GICSources_Get_EE(dss.ctx)
end
EE() = EE(DSS_DEFAULT_CTX)

"""
Eastward E Field, V/km

(Setter)
"""
function EE(dss::DSSContext, Value::Float64)
    return @checked Lib.GICSources_Set_EE(dss.ctx, Value)
end
EE(Value::Float64) = EE(DSS_DEFAULT_CTX, Value)

"""
Specify dc voltage directly

(Getter)
"""
function Volts(dss::DSSContext)::Float64
    return @checked Lib.GICSources_Get_Volts(dss.ctx)
end
Volts() = Volts(DSS_DEFAULT_CTX)

"""
Specify dc voltage directly

(Setter)
"""
function Volts(dss::DSSContext, Value::Float64)
    return @checked Lib.GICSources_Set_Volts(dss.ctx, Value)
end
Volts(Value::Float64) = Volts(DSS_DEFAULT_CTX, Value)

"""
Second bus name
"""
function Bus2(dss::DSSContext)::String
    return get_string(@checked Lib.GICSources_Get_Bus2(dss.ctx))
end
Bus2() = Bus2(DSS_DEFAULT_CTX)

"""
First bus name of GICSource (Created name)
"""
function Bus1(dss::DSSContext)::String
    return get_string(@checked Lib.GICSources_Get_Bus1(dss.ctx))
end
Bus1() = Bus1(DSS_DEFAULT_CTX)

end