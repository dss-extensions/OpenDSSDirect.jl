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
    return get_string_array(Lib.WireData_Get_AllNames, C_NULL_CTX)
end

"""Sets a WireData active by name."""
function Name()::String
    return get_string(@checked Lib.WireData_Get_Name(C_NULL_CTX))
end

"""Sets a WireData active by name."""
function Name(Value::String)
    @checked Lib.WireData_Set_Name(C_NULL_CTX, Cstring(pointer(Value)))
end

"""Number of WireData Objects in Active Circuit"""
function Count()::Int
    return @checked Lib.WireData_Get_Count(C_NULL_CTX)
end

"""Sets first WireData to be active.  Returns 0 if none."""
function First()::Int
    return @checked Lib.WireData_Get_First(C_NULL_CTX)
end

"""Sets next WireData to be active.  Returns 0 if no more."""
function Next()::Int
    return @checked Lib.WireData_Get_Next(C_NULL_CTX)
end

"""Active WireData by index.  1..Count (Getter)"""
function Idx()::Int
    return @checked Lib.WireData_Get_idx(C_NULL_CTX)
end

"""Active WireData by index.  1..Count (Setter)"""
function Idx(Value::Int)
    @checked Lib.WireData_Set_idx(C_NULL_CTX, Value)
end

"""Rac (Getter)"""
function Rac()::Float64
    return @checked Lib.WireData_Get_Rac(C_NULL_CTX)
end

"""Rac (Setter)"""
function Rac(Value::Float64)
    return @checked Lib.WireData_Set_Rac(C_NULL_CTX, Value)
end

"""Radius (Getter)"""
function Radius()::Float64
    return @checked Lib.WireData_Get_Radius(C_NULL_CTX)
end

"""Radius (Setter)"""
function Radius(Value::Float64)
    return @checked Lib.WireData_Set_Radius(C_NULL_CTX, Value)
end

"""Diameter (Getter)"""
function Diameter()::Float64
    return @checked Lib.WireData_Get_Diameter(C_NULL_CTX)
end

"""Diameter (Setter)"""
function Diameter(Value::Float64)
    return @checked Lib.WireData_Set_Diameter(C_NULL_CTX, Value)
end

"""RadiusUnits (Getter)"""
function RadiusUnits()::Float64
    return @checked Lib.WireData_Get_RadiusUnits(C_NULL_CTX)
end

"""RadiusUnits (Setter)"""
function RadiusUnits(Value::Float64)
    return @checked Lib.WireData_Set_RadiusUnits(C_NULL_CTX, Value)
end

"""CapRadius (Getter)"""
function CapRadius()::Float64
    return @checked Lib.WireData_Get_CapRadius(C_NULL_CTX)
end

"""CapRadius (Setter)"""
function CapRadius(Value::Float64)
    return @checked Lib.WireData_Set_CapRadius(C_NULL_CTX, Value)
end

"""Normal Ampere rating (Getter)"""
function NormAmps()::Float64
    return @checked Lib.WireData_Get_NormAmps(C_NULL_CTX)
end

"""Normal Ampere rating (Setter)"""
function NormAmps(Value::Float64)
    return @checked Lib.WireData_Set_NormAmps(C_NULL_CTX, Value)
end

"""Emergency ampere rating (Getter)"""
function EmergAmps()::Float64
    return @checked Lib.WireData_Get_EmergAmps(C_NULL_CTX)
end

"""Emergency ampere rating (Setter)"""
function EmergAmps(Value::Float64)
    return @checked Lib.WireData_Set_EmergAmps(C_NULL_CTX, Value)
end

"""Rdc (Getter)"""
function Rdc()::Float64
    return @checked Lib.WireData_Get_Rdc(C_NULL_CTX)
end

"""Rdc (Setter)"""
function Rdc(Value::Float64)
    return @checked Lib.WireData_Set_Rdc(C_NULL_CTX, Value)
end

"""GMRac (Getter)"""
function GMRac()::Float64
    return @checked Lib.WireData_Get_GMRac(C_NULL_CTX)
end

"""GMRac (Setter)"""
function GMRac(Value::Float64)
    return @checked Lib.WireData_Set_GMRac(C_NULL_CTX, Value)
end

"""ResistanceUnits (Getter)"""
function ResistanceUnits()::Lib.LineUnits
    return @checked Lib.WireData_Get_ResistanceUnits(C_NULL_CTX)
end

"""ResistanceUnits (Setter)"""
function ResistanceUnits(Value::Union{Int, Lib.LineUnits})
    return @checked Lib.WireData_Set_ResistanceUnits(C_NULL_CTX, Value)
end

"""GMRUnits (Getter)"""
function GMRUnits()::Lib.LineUnits
    return @checked Lib.WireData_Get_GMRUnits(C_NULL_CTX)
end

"""GMRUnits (Setter)"""
function GMRUnits(Value::Union{Int, Lib.LineUnits})
    return @checked Lib.WireData_Set_GMRUnits(C_NULL_CTX, Value)
end

end