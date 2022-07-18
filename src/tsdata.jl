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
    return get_string_array(Lib.TSData_Get_AllNames)
end

"""Sets a TSData active by name."""
function Name()::String
    return get_string(@checked Lib.TSData_Get_Name())
end

"""Sets a TSData active by name."""
function Name(Value::String)
    @checked Lib.TSData_Set_Name(Cstring(pointer(Value)))
end

"""Number of TSData Objects in Active Circuit"""
function Count()::Int
    return @checked Lib.TSData_Get_Count()
end

"""Sets first TSData to be active.  Returns 0 if none."""
function First()::Int
    return @checked Lib.TSData_Get_First()
end

"""Sets next TSData to be active.  Returns 0 if no more."""
function Next()::Int
    return @checked Lib.TSData_Get_Next()
end

"""Active TSData by index.  1..Count (Getter)"""
function Idx()::Int
    return @checked Lib.TSData_Get_idx()
end

"""Active TSData by index.  1..Count (Setter)"""
function Idx(Value::Int)
    @checked Lib.TSData_Set_idx(Value)
end

"""Normal Ampere rating (Getter)"""
function NormAmps()::Float64
    return @checked Lib.TSData_Get_NormAmps()
end

"""Normal Ampere rating (Setter)"""
function NormAmps(Value::Float64)
    return @checked Lib.TSData_Set_NormAmps(Value)
end

"""GMRac (Getter)"""
function GMRac()::Float64
    return @checked Lib.TSData_Get_GMRac()
end

"""GMRac (Setter)"""
function GMRac(Value::Float64)
    return @checked Lib.TSData_Set_GMRac(Value)
end

"""Diameter (Getter)"""
function Diameter()::Float64
    return @checked Lib.TSData_Get_Diameter()
end

"""Diameter (Setter)"""
function Diameter(Value::Float64)
    return @checked Lib.TSData_Set_Diameter(Value)
end

"""InsLayer (Getter)"""
function InsLayer()::Float64
    return @checked Lib.TSData_Get_InsLayer()
end

"""InsLayer (Setter)"""
function InsLayer(Value::Float64)
    return @checked Lib.TSData_Set_InsLayer(Value)
end

"""EpsR (Getter)"""
function EpsR()::Float64
    return @checked Lib.TSData_Get_EpsR()
end

"""EpsR (Setter)"""
function EpsR(Value::Float64)
    return @checked Lib.TSData_Set_EpsR(Value)
end

"""TapeLayer (Getter)"""
function TapeLayer()::Float64
    return @checked Lib.TSData_Get_TapeLayer()
end

"""TapeLayer (Setter)"""
function TapeLayer(Value::Float64)
    return @checked Lib.TSData_Set_TapeLayer(Value)
end

"""GMRUnits (Getter)"""
function GMRUnits()::Lib.LineUnits
    return @checked Lib.TSData_Get_GMRUnits()
end

"""GMRUnits (Setter)"""
function GMRUnits(Value::Union{Int,Lib.LineUnits})
    return @checked Lib.TSData_Set_GMRUnits(Value)
end

"""TapeLap (Getter)"""
function TapeLap()::Float64
    return @checked Lib.TSData_Get_TapeLap()
end

"""TapeLap (Setter)"""
function TapeLap(Value::Float64)
    return @checked Lib.TSData_Set_TapeLap(Value)
end

"""DiaCable (Getter)"""
function DiaCable()::Float64
    return @checked Lib.TSData_Get_DiaCable()
end

"""DiaCable (Setter)"""
function DiaCable(Value::Float64)
    return @checked Lib.TSData_Set_DiaCable(Value)
end

"""ResistanceUnits (Getter)"""
function ResistanceUnits()::Lib.LineUnits
    return @checked Lib.TSData_Get_ResistanceUnits()
end

"""ResistanceUnits (Setter)"""
function ResistanceUnits(Value::Union{Int,Lib.LineUnits})
    return @checked Lib.TSData_Set_ResistanceUnits(Value)
end

"""Rac (Getter)"""
function Rac()::Float64
    return @checked Lib.TSData_Get_Rac()
end

"""Rac (Setter)"""
function Rac(Value::Float64)
    return @checked Lib.TSData_Set_Rac(Value)
end

"""Radius (Getter)"""
function Radius()::Float64
    return @checked Lib.TSData_Get_Radius()
end

"""Radius (Setter)"""
function Radius(Value::Float64)
    return @checked Lib.TSData_Set_Radius(Value)
end

"""DiaShield (Getter)"""
function DiaShield()::Float64
    return @checked Lib.TSData_Get_DiaShield()
end

"""DiaShield (Setter)"""
function DiaShield(Value::Float64)
    return @checked Lib.TSData_Set_DiaShield(Value)
end

"""RadiusUnits (Getter)"""
function RadiusUnits()::Lib.LineUnits
    return @checked Lib.TSData_Get_RadiusUnits()
end

"""RadiusUnits (Setter)"""
function RadiusUnits(Value::Union{Int,Lib.LineUnits})
    return @checked Lib.TSData_Set_RadiusUnits(Value)
end

"""Emergency ampere rating (Getter)"""
function EmergAmps()::Float64
    return @checked Lib.TSData_Get_EmergAmps()
end

"""Emergency ampere rating (Setter)"""
function EmergAmps(Value::Float64)
    return @checked Lib.TSData_Set_EmergAmps(Value)
end

"""DiaIns (Getter)"""
function DiaIns()::Float64
    return @checked Lib.TSData_Get_DiaIns()
end

"""DiaIns (Setter)"""
function DiaIns(Value::Float64)
    return @checked Lib.TSData_Set_DiaIns(Value)
end

"""Rdc (Getter)"""
function Rdc()::Float64
    return @checked Lib.TSData_Get_Rdc()
end

"""Rdc (Setter)"""
function Rdc(Value::Float64)
    return @checked Lib.TSData_Set_Rdc(Value)
end

end