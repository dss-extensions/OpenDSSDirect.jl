module WireData

using DocStringExtensions

using ..Lib
using ..Utils

@template (FUNCTIONS, METHODS) = """
                                 $(TYPEDSIGNATURES)
                                 $(DOCSTRING)
                                 """


"""Array of names of all WireData objects."""
function AllNames()::Vector{String}
    return get_string_array(Lib.WireData_Get_AllNames)
end

"""Sets a WireData active by name."""
function Name()::String
    return get_string(@checked Lib.WireData_Get_Name())
end

"""Sets a WireData active by name."""
function Name(Value::String)
    @checked Lib.WireData_Set_Name(Cstring(pointer(Value)))
end

"""Number of WireData Objects in Active Circuit"""
function Count()::Int
    return @checked Lib.WireData_Get_Count()
end

"""Sets first WireData to be active.  Returns 0 if none."""
function First()::Int
    return @checked Lib.WireData_Get_First()
end

"""Sets next WireData to be active.  Returns 0 if no more."""
function Next()::Int
    return @checked Lib.WireData_Get_Next()
end

"""Active WireData by index.  1..Count (Getter)"""
function Idx()::Int
    return @checked Lib.WireData_Get_idx()
end

"""Active WireData by index.  1..Count (Setter)"""
function Idx(Value::Int)
    @checked Lib.WireData_Set_idx(Value)
end

"""Rac (Getter)"""
function Rac()::Float64
    return @checked Lib.WireData_Get_Rac()
end

"""Rac (Setter)"""
function Rac(Value::Float64)
    return @checked Lib.WireData_Set_Rac(Value)
end

"""Radius (Getter)"""
function Radius()::Float64
    return @checked Lib.WireData_Get_Radius()
end

"""Radius (Setter)"""
function Radius(Value::Float64)
    return @checked Lib.WireData_Set_Radius(Value)
end

"""Diameter (Getter)"""
function Diameter()::Float64
    return @checked Lib.WireData_Get_Diameter()
end

"""Diameter (Setter)"""
function Diameter(Value::Float64)
    return @checked Lib.WireData_Set_Diameter(Value)
end

"""RadiusUnits (Getter)"""
function RadiusUnits()::Float64
    return @checked Lib.WireData_Get_RadiusUnits()
end

"""RadiusUnits (Setter)"""
function RadiusUnits(Value::Float64)
    return @checked Lib.WireData_Set_RadiusUnits(Value)
end

"""CapRadius (Getter)"""
function CapRadius()::Float64
    return @checked Lib.WireData_Get_CapRadius()
end

"""CapRadius (Setter)"""
function CapRadius(Value::Float64)
    return @checked Lib.WireData_Set_CapRadius(Value)
end

"""Normal Ampere rating (Getter)"""
function NormAmps()::Float64
    return @checked Lib.WireData_Get_NormAmps()
end

"""Normal Ampere rating (Setter)"""
function NormAmps(Value::Float64)
    return @checked Lib.WireData_Set_NormAmps(Value)
end

"""Emergency ampere rating (Getter)"""
function EmergAmps()::Float64
    return @checked Lib.WireData_Get_EmergAmps()
end

"""Emergency ampere rating (Setter)"""
function EmergAmps(Value::Float64)
    return @checked Lib.WireData_Set_EmergAmps(Value)
end

"""Rdc (Getter)"""
function Rdc()::Float64
    return @checked Lib.WireData_Get_Rdc()
end

"""Rdc (Setter)"""
function Rdc(Value::Float64)
    return @checked Lib.WireData_Set_Rdc(Value)
end

"""GMRac (Getter)"""
function GMRac()::Float64
    return @checked Lib.WireData_Get_GMRac()
end

"""GMRac (Setter)"""
function GMRac(Value::Float64)
    return @checked Lib.WireData_Set_GMRac(Value)
end

"""ResistanceUnits (Getter)"""
function ResistanceUnits()::Lib.LineUnits
    return @checked Lib.WireData_Get_ResistanceUnits()
end

"""ResistanceUnits (Setter)"""
function ResistanceUnits(Value::Union{Int, Lib.LineUnits})
    return @checked Lib.WireData_Set_ResistanceUnits(Value)
end

"""GMRUnits (Getter)"""
function GMRUnits()::Lib.LineUnits
    return @checked Lib.WireData_Get_GMRUnits()
end

"""GMRUnits (Setter)"""
function GMRUnits(Value::Union{Int, Lib.LineUnits})
    return @checked Lib.WireData_Set_GMRUnits(Value)
end

end