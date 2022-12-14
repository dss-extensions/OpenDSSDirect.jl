module CNData

using DocStringExtensions

using ..Lib
using ..Utils

@template (FUNCTIONS, METHODS) = """
                                 $(TYPEDSIGNATURES)
                                 $(DOCSTRING)
                                 """


"""Array of names of all CNData objects."""
function AllNames()::Vector{String}
    return get_string_array(Lib.CNData_Get_AllNames, C_NULL_CTX)
end

"""Sets a CNData active by name."""
function Name()::String
    return get_string(@checked Lib.CNData_Get_Name(C_NULL_CTX))
end

"""Sets a CNData active by name."""
function Name(Value::String)
    @checked Lib.CNData_Set_Name(C_NULL_CTX, Cstring(pointer(Value)))
end

"""Number of CNData Objects in Active Circuit"""
function Count()::Int
    return @checked Lib.CNData_Get_Count(C_NULL_CTX)
end

"""Sets first CNData to be active.  Returns 0 if none."""
function First()::Int
    return @checked Lib.CNData_Get_First(C_NULL_CTX)
end

"""Sets next CNData to be active.  Returns 0 if no more."""
function Next()::Int
    return @checked Lib.CNData_Get_Next(C_NULL_CTX)
end

"""Active CNData by index.  1..Count (Getter)"""
function Idx()::Int
    return @checked Lib.CNData_Get_idx(C_NULL_CTX)
end

"""Active CNData by index.  1..Count (Setter)"""
function Idx(Value::Int)
    @checked Lib.CNData_Set_idx(C_NULL_CTX, Value)
end

"""Emergency ampere rating (Getter)"""
function EmergAmps()::Float64
    return @checked Lib.CNData_Get_EmergAmps(C_NULL_CTX)
end

"""Emergency ampere rating (Setter)"""
function EmergAmps(Value::Float64)
    return @checked Lib.CNData_Set_EmergAmps(C_NULL_CTX, Value)
end

"""Rdc (Getter)"""
function Rdc()::Float64
    return @checked Lib.CNData_Get_Rdc(C_NULL_CTX)
end

"""Rdc (Setter)"""
function Rdc(Value::Float64)
    return @checked Lib.CNData_Set_Rdc(C_NULL_CTX, Value)
end

"""GMRac (Getter)"""
function GMRac()::Float64
    return @checked Lib.CNData_Get_GMRac(C_NULL_CTX)
end

"""GMRac (Setter)"""
function GMRac(Value::Float64)
    return @checked Lib.CNData_Set_GMRac(C_NULL_CTX, Value)
end

"""DiaStrand (Getter)"""
function DiaStrand()::Float64
    return @checked Lib.CNData_Get_DiaStrand(C_NULL_CTX)
end

"""DiaStrand (Setter)"""
function DiaStrand(Value::Float64)
    return @checked Lib.CNData_Set_DiaStrand(C_NULL_CTX, Value)
end

"""InsLayer (Getter)"""
function InsLayer()::Float64
    return @checked Lib.CNData_Get_InsLayer(C_NULL_CTX)
end

"""InsLayer (Setter)"""
function InsLayer(Value::Float64)
    return @checked Lib.CNData_Set_InsLayer(C_NULL_CTX, Value)
end

"""Diameter (Getter)"""
function Diameter()::Float64
    return @checked Lib.CNData_Get_Diameter(C_NULL_CTX)
end

"""Diameter (Setter)"""
function Diameter(Value::Float64)
    return @checked Lib.CNData_Set_Diameter(C_NULL_CTX, Value)
end

"""RStrand (Getter)"""
function RStrand()::Float64
    return @checked Lib.CNData_Get_RStrand(C_NULL_CTX)
end

"""RStrand (Setter)"""
function RStrand(Value::Float64)
    return @checked Lib.CNData_Set_RStrand(C_NULL_CTX, Value)
end

"""GmrStrand (Getter)"""
function GmrStrand()::Float64
    return @checked Lib.CNData_Get_GmrStrand(C_NULL_CTX)
end

"""GmrStrand (Setter)"""
function GmrStrand(Value::Float64)
    return @checked Lib.CNData_Set_GmrStrand(C_NULL_CTX, Value)
end

"""ResistanceUnits (Getter)"""
function ResistanceUnits()::Lib.LineUnits
    return @checked Lib.CNData_Get_ResistanceUnits(C_NULL_CTX)
end

"""ResistanceUnits (Setter)"""
function ResistanceUnits(Value::Union{Int,Lib.LineUnits})
    return @checked Lib.CNData_Set_ResistanceUnits(C_NULL_CTX, Value)
end

"""GMRUnits (Getter)"""
function GMRUnits()::Lib.LineUnits
    return @checked Lib.CNData_Get_GMRUnits(C_NULL_CTX)
end

"""GMRUnits (Setter)"""
function GMRUnits(Value::Union{Int,Lib.LineUnits})
    return @checked Lib.CNData_Set_GMRUnits(C_NULL_CTX, Value)
end

"""DiaIns (Getter)"""
function DiaIns()::Float64
    return @checked Lib.CNData_Get_DiaIns(C_NULL_CTX)
end

"""DiaIns (Setter)"""
function DiaIns(Value::Float64)
    return @checked Lib.CNData_Set_DiaIns(C_NULL_CTX, Value)
end

"""DiaCable (Getter)"""
function DiaCable()::Float64
    return @checked Lib.CNData_Get_DiaCable(C_NULL_CTX)
end

"""DiaCable (Setter)"""
function DiaCable(Value::Float64)
    return @checked Lib.CNData_Set_DiaCable(C_NULL_CTX, Value)
end

"""Radius (Getter)"""
function Radius()::Float64
    return @checked Lib.CNData_Get_Radius(C_NULL_CTX)
end

"""Radius (Setter)"""
function Radius(Value::Float64)
    return @checked Lib.CNData_Set_Radius(C_NULL_CTX, Value)
end

"""k (Getter)"""
function k()::Float64
    return @checked Lib.CNData_Get_k(C_NULL_CTX)
end

"""k (Setter)"""
function k(Value::Float64)
    return @checked Lib.CNData_Set_k(C_NULL_CTX, Value)
end

"""Normal Ampere rating (Getter)"""
function NormAmps()::Float64
    return @checked Lib.CNData_Get_NormAmps(C_NULL_CTX)
end

"""Normal Ampere rating (Setter)"""
function NormAmps(Value::Float64)
    return @checked Lib.CNData_Set_NormAmps(C_NULL_CTX, Value)
end

"""EpsR (Getter)"""
function EpsR()::Float64
    return @checked Lib.CNData_Get_EpsR(C_NULL_CTX)
end

"""EpsR (Setter)"""
function EpsR(Value::Float64)
    return @checked Lib.CNData_Set_EpsR(C_NULL_CTX, Value)
end

"""Rac (Getter)"""
function Rac()::Float64
    return @checked Lib.CNData_Get_Rac(C_NULL_CTX)
end

"""Rac (Setter)"""
function Rac(Value::Float64)
    return @checked Lib.CNData_Set_Rac(C_NULL_CTX, Value)
end

"""RadiusUnits (Getter)"""
function RadiusUnits()::Lib.LineUnits
    return @checked Lib.CNData_Get_RadiusUnits(C_NULL_CTX)
end

"""RadiusUnits (Setter)"""
function RadiusUnits(Value::Union{Int,Lib.LineUnits})
    return @checked Lib.CNData_Set_RadiusUnits(C_NULL_CTX, Value)
end

end