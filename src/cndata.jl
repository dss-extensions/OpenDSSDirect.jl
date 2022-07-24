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
    return get_string_array(Lib.CNData_Get_AllNames)
end

"""Sets a CNData active by name."""
function Name()::String
    return get_string(@checked Lib.CNData_Get_Name())
end

"""Sets a CNData active by name."""
function Name(Value::String)
    @checked Lib.CNData_Set_Name(Cstring(pointer(Value)))
end

"""Number of CNData Objects in Active Circuit"""
function Count()::Int
    return @checked Lib.CNData_Get_Count()
end

"""Sets first CNData to be active.  Returns 0 if none."""
function First()::Int
    return @checked Lib.CNData_Get_First()
end

"""Sets next CNData to be active.  Returns 0 if no more."""
function Next()::Int
    return @checked Lib.CNData_Get_Next()
end

"""Active CNData by index.  1..Count (Getter)"""
function Idx()::Int
    return @checked Lib.CNData_Get_idx()
end

"""Active CNData by index.  1..Count (Setter)"""
function Idx(Value::Int)
    @checked Lib.CNData_Set_idx(Value)
end

"""Emergency ampere rating (Getter)"""
function EmergAmps()::Float64
    return @checked Lib.CNData_Get_EmergAmps()
end

"""Emergency ampere rating (Setter)"""
function EmergAmps(Value::Float64)
    return @checked Lib.CNData_Set_EmergAmps(Value)
end

"""Rdc (Getter)"""
function Rdc()::Float64
    return @checked Lib.CNData_Get_Rdc()
end

"""Rdc (Setter)"""
function Rdc(Value::Float64)
    return @checked Lib.CNData_Set_Rdc(Value)
end

"""GMRac (Getter)"""
function GMRac()::Float64
    return @checked Lib.CNData_Get_GMRac()
end

"""GMRac (Setter)"""
function GMRac(Value::Float64)
    return @checked Lib.CNData_Set_GMRac(Value)
end

"""DiaStrand (Getter)"""
function DiaStrand()::Float64
    return @checked Lib.CNData_Get_DiaStrand()
end

"""DiaStrand (Setter)"""
function DiaStrand(Value::Float64)
    return @checked Lib.CNData_Set_DiaStrand(Value)
end

"""InsLayer (Getter)"""
function InsLayer()::Float64
    return @checked Lib.CNData_Get_InsLayer()
end

"""InsLayer (Setter)"""
function InsLayer(Value::Float64)
    return @checked Lib.CNData_Set_InsLayer(Value)
end

"""Diameter (Getter)"""
function Diameter()::Float64
    return @checked Lib.CNData_Get_Diameter()
end

"""Diameter (Setter)"""
function Diameter(Value::Float64)
    return @checked Lib.CNData_Set_Diameter(Value)
end

"""RStrand (Getter)"""
function RStrand()::Float64
    return @checked Lib.CNData_Get_RStrand()
end

"""RStrand (Setter)"""
function RStrand(Value::Float64)
    return @checked Lib.CNData_Set_RStrand(Value)
end

"""GmrStrand (Getter)"""
function GmrStrand()::Float64
    return @checked Lib.CNData_Get_GmrStrand()
end

"""GmrStrand (Setter)"""
function GmrStrand(Value::Float64)
    return @checked Lib.CNData_Set_GmrStrand(Value)
end

"""ResistanceUnits (Getter)"""
function ResistanceUnits()::Lib.LineUnits
    return @checked Lib.CNData_Get_ResistanceUnits()
end

"""ResistanceUnits (Setter)"""
function ResistanceUnits(Value::Union{Int,Lib.LineUnits})
    return @checked Lib.CNData_Set_ResistanceUnits(Value)
end

"""GMRUnits (Getter)"""
function GMRUnits()::Lib.LineUnits
    return @checked Lib.CNData_Get_GMRUnits()
end

"""GMRUnits (Setter)"""
function GMRUnits(Value::Union{Int,Lib.LineUnits})
    return @checked Lib.CNData_Set_GMRUnits(Value)
end

"""DiaIns (Getter)"""
function DiaIns()::Float64
    return @checked Lib.CNData_Get_DiaIns()
end

"""DiaIns (Setter)"""
function DiaIns(Value::Float64)
    return @checked Lib.CNData_Set_DiaIns(Value)
end

"""DiaCable (Getter)"""
function DiaCable()::Float64
    return @checked Lib.CNData_Get_DiaCable()
end

"""DiaCable (Setter)"""
function DiaCable(Value::Float64)
    return @checked Lib.CNData_Set_DiaCable(Value)
end

"""Radius (Getter)"""
function Radius()::Float64
    return @checked Lib.CNData_Get_Radius()
end

"""Radius (Setter)"""
function Radius(Value::Float64)
    return @checked Lib.CNData_Set_Radius(Value)
end

"""k (Getter)"""
function k()::Float64
    return @checked Lib.CNData_Get_k()
end

"""k (Setter)"""
function k(Value::Float64)
    return @checked Lib.CNData_Set_k(Value)
end

"""Normal Ampere rating (Getter)"""
function NormAmps()::Float64
    return @checked Lib.CNData_Get_NormAmps()
end

"""Normal Ampere rating (Setter)"""
function NormAmps(Value::Float64)
    return @checked Lib.CNData_Set_NormAmps(Value)
end

"""EpsR (Getter)"""
function EpsR()::Float64
    return @checked Lib.CNData_Get_EpsR()
end

"""EpsR (Setter)"""
function EpsR(Value::Float64)
    return @checked Lib.CNData_Set_EpsR(Value)
end

"""Rac (Getter)"""
function Rac()::Float64
    return @checked Lib.CNData_Get_Rac()
end

"""Rac (Setter)"""
function Rac(Value::Float64)
    return @checked Lib.CNData_Set_Rac(Value)
end

"""RadiusUnits (Getter)"""
function RadiusUnits()::Lib.LineUnits
    return @checked Lib.CNData_Get_RadiusUnits()
end

"""RadiusUnits (Setter)"""
function RadiusUnits(Value::Union{Int,Lib.LineUnits})
    return @checked Lib.CNData_Set_RadiusUnits(Value)
end

end