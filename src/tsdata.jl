module TSData

using DocStringExtensions

using ..Lib
using ..Utils

@template (FUNCTIONS, METHODS) = """
                                 $(TYPEDSIGNATURES)
                                 $(DOCSTRING)
                                 """


"""Array of names of all TSData objects."""
function AllNames()::Vector{String}
    return get_string_array(Lib.TSData_Get_AllNames, C_NULL_CTX)
end

"""Sets a TSData active by name."""
function Name()::String
    return get_string(@checked Lib.TSData_Get_Name(C_NULL_CTX))
end

"""Sets a TSData active by name."""
function Name(Value::String)
    @checked Lib.TSData_Set_Name(C_NULL_CTX, Cstring(pointer(Value)))
end

"""Number of TSData Objects in Active Circuit"""
function Count()::Int
    return @checked Lib.TSData_Get_Count(C_NULL_CTX)
end

"""Sets first TSData to be active.  Returns 0 if none."""
function First()::Int
    return @checked Lib.TSData_Get_First(C_NULL_CTX)
end

"""Sets next TSData to be active.  Returns 0 if no more."""
function Next()::Int
    return @checked Lib.TSData_Get_Next(C_NULL_CTX)
end

"""Active TSData by index.  1..Count (Getter)"""
function Idx()::Int
    return @checked Lib.TSData_Get_idx(C_NULL_CTX)
end

"""Active TSData by index.  1..Count (Setter)"""
function Idx(Value::Int)
    @checked Lib.TSData_Set_idx(C_NULL_CTX, Value)
end

"""Normal Ampere rating (Getter)"""
function NormAmps()::Float64
    return @checked Lib.TSData_Get_NormAmps(C_NULL_CTX)
end

"""Normal Ampere rating (Setter)"""
function NormAmps(Value::Float64)
    return @checked Lib.TSData_Set_NormAmps(C_NULL_CTX, Value)
end

"""GMRac (Getter)"""
function GMRac()::Float64
    return @checked Lib.TSData_Get_GMRac(C_NULL_CTX)
end

"""GMRac (Setter)"""
function GMRac(Value::Float64)
    return @checked Lib.TSData_Set_GMRac(C_NULL_CTX, Value)
end

"""Diameter (Getter)"""
function Diameter()::Float64
    return @checked Lib.TSData_Get_Diameter(C_NULL_CTX)
end

"""Diameter (Setter)"""
function Diameter(Value::Float64)
    return @checked Lib.TSData_Set_Diameter(C_NULL_CTX, Value)
end

"""InsLayer (Getter)"""
function InsLayer()::Float64
    return @checked Lib.TSData_Get_InsLayer(C_NULL_CTX)
end

"""InsLayer (Setter)"""
function InsLayer(Value::Float64)
    return @checked Lib.TSData_Set_InsLayer(C_NULL_CTX, Value)
end

"""EpsR (Getter)"""
function EpsR()::Float64
    return @checked Lib.TSData_Get_EpsR(C_NULL_CTX)
end

"""EpsR (Setter)"""
function EpsR(Value::Float64)
    return @checked Lib.TSData_Set_EpsR(C_NULL_CTX, Value)
end

"""TapeLayer (Getter)"""
function TapeLayer()::Float64
    return @checked Lib.TSData_Get_TapeLayer(C_NULL_CTX)
end

"""TapeLayer (Setter)"""
function TapeLayer(Value::Float64)
    return @checked Lib.TSData_Set_TapeLayer(C_NULL_CTX, Value)
end

"""GMRUnits (Getter)"""
function GMRUnits()::Lib.LineUnits
    return @checked Lib.TSData_Get_GMRUnits(C_NULL_CTX)
end

"""GMRUnits (Setter)"""
function GMRUnits(Value::Union{Int,Lib.LineUnits})
    return @checked Lib.TSData_Set_GMRUnits(C_NULL_CTX, Value)
end

"""TapeLap (Getter)"""
function TapeLap()::Float64
    return @checked Lib.TSData_Get_TapeLap(C_NULL_CTX)
end

"""TapeLap (Setter)"""
function TapeLap(Value::Float64)
    return @checked Lib.TSData_Set_TapeLap(C_NULL_CTX, Value)
end

"""DiaCable (Getter)"""
function DiaCable()::Float64
    return @checked Lib.TSData_Get_DiaCable(C_NULL_CTX)
end

"""DiaCable (Setter)"""
function DiaCable(Value::Float64)
    return @checked Lib.TSData_Set_DiaCable(C_NULL_CTX, Value)
end

"""ResistanceUnits (Getter)"""
function ResistanceUnits()::Lib.LineUnits
    return @checked Lib.TSData_Get_ResistanceUnits(C_NULL_CTX)
end

"""ResistanceUnits (Setter)"""
function ResistanceUnits(Value::Union{Int,Lib.LineUnits})
    return @checked Lib.TSData_Set_ResistanceUnits(C_NULL_CTX, Value)
end

"""Rac (Getter)"""
function Rac()::Float64
    return @checked Lib.TSData_Get_Rac(C_NULL_CTX)
end

"""Rac (Setter)"""
function Rac(Value::Float64)
    return @checked Lib.TSData_Set_Rac(C_NULL_CTX, Value)
end

"""Radius (Getter)"""
function Radius()::Float64
    return @checked Lib.TSData_Get_Radius(C_NULL_CTX)
end

"""Radius (Setter)"""
function Radius(Value::Float64)
    return @checked Lib.TSData_Set_Radius(C_NULL_CTX, Value)
end

"""DiaShield (Getter)"""
function DiaShield()::Float64
    return @checked Lib.TSData_Get_DiaShield(C_NULL_CTX)
end

"""DiaShield (Setter)"""
function DiaShield(Value::Float64)
    return @checked Lib.TSData_Set_DiaShield(C_NULL_CTX, Value)
end

"""RadiusUnits (Getter)"""
function RadiusUnits()::Lib.LineUnits
    return @checked Lib.TSData_Get_RadiusUnits(C_NULL_CTX)
end

"""RadiusUnits (Setter)"""
function RadiusUnits(Value::Union{Int,Lib.LineUnits})
    return @checked Lib.TSData_Set_RadiusUnits(C_NULL_CTX, Value)
end

"""Emergency ampere rating (Getter)"""
function EmergAmps()::Float64
    return @checked Lib.TSData_Get_EmergAmps(C_NULL_CTX)
end

"""Emergency ampere rating (Setter)"""
function EmergAmps(Value::Float64)
    return @checked Lib.TSData_Set_EmergAmps(C_NULL_CTX, Value)
end

"""DiaIns (Getter)"""
function DiaIns()::Float64
    return @checked Lib.TSData_Get_DiaIns(C_NULL_CTX)
end

"""DiaIns (Setter)"""
function DiaIns(Value::Float64)
    return @checked Lib.TSData_Set_DiaIns(C_NULL_CTX, Value)
end

"""Rdc (Getter)"""
function Rdc()::Float64
    return @checked Lib.TSData_Get_Rdc(C_NULL_CTX)
end

"""Rdc (Setter)"""
function Rdc(Value::Float64)
    return @checked Lib.TSData_Set_Rdc(C_NULL_CTX, Value)
end

end