module TSData

using DocStringExtensions

using ..Lib
using ..Utils

@template (FUNCTIONS, METHODS) = """
                                 $(TYPEDSIGNATURES)
                                 $(DOCSTRING)
                                 """


"""Array of names of all TSData objects."""
function AllNames(dss::DSSContext)::Vector{String}
    return get_string_array(Lib.TSData_Get_AllNames, dss.ctx)
end
AllNames() = AllNames(DSS_DEFAULT_CTX)

"""Sets a TSData active by name."""
function Name(dss::DSSContext)::String
    return get_string(@checked Lib.TSData_Get_Name(dss.ctx))
end
Name() = Name(DSS_DEFAULT_CTX)

"""Sets a TSData active by name."""
function Name(dss::DSSContext, Value::String)
    @checked Lib.TSData_Set_Name(dss.ctx, Cstring(pointer(Value)))
end
Name(Value::String) = Name(DSS_DEFAULT_CTX, Value)

"""Number of TSData Objects in Active Circuit"""
function Count(dss::DSSContext)::Int
    return @checked Lib.TSData_Get_Count(dss.ctx)
end
Count() = Count(DSS_DEFAULT_CTX)

"""Sets first TSData to be active.  Returns 0 if none."""
function First(dss::DSSContext)::Int
    return @checked Lib.TSData_Get_First(dss.ctx)
end
First() = First(DSS_DEFAULT_CTX)

"""Sets next TSData to be active.  Returns 0 if no more."""
function Next(dss::DSSContext)::Int
    return @checked Lib.TSData_Get_Next(dss.ctx)
end
Next() = Next(DSS_DEFAULT_CTX)

"""Active TSData by index.  1..Count (Getter)"""
function Idx(dss::DSSContext)::Int
    return @checked Lib.TSData_Get_idx(dss.ctx)
end
Idx() = Idx(DSS_DEFAULT_CTX)

"""Active TSData by index.  1..Count (Setter)"""
function Idx(dss::DSSContext, Value::Int)
    @checked Lib.TSData_Set_idx(dss.ctx, Value)
end
Idx(Value::Int) = Idx(DSS_DEFAULT_CTX, Value)

"""Normal Ampere rating (Getter)"""
function NormAmps(dss::DSSContext)::Float64
    return @checked Lib.TSData_Get_NormAmps(dss.ctx)
end
NormAmps() = NormAmps(DSS_DEFAULT_CTX)

"""Normal Ampere rating (Setter)"""
function NormAmps(dss::DSSContext, Value::Float64)
    return @checked Lib.TSData_Set_NormAmps(dss.ctx, Value)
end
NormAmps(Value::Float64) = NormAmps(DSS_DEFAULT_CTX, Value)

"""GMRac (Getter)"""
function GMRac(dss::DSSContext)::Float64
    return @checked Lib.TSData_Get_GMRac(dss.ctx)
end
GMRac() = GMRac(DSS_DEFAULT_CTX)

"""GMRac (Setter)"""
function GMRac(dss::DSSContext, Value::Float64)
    return @checked Lib.TSData_Set_GMRac(dss.ctx, Value)
end
GMRac(Value::Float64) = GMRac(DSS_DEFAULT_CTX, Value)

"""Diameter (Getter)"""
function Diameter(dss::DSSContext)::Float64
    return @checked Lib.TSData_Get_Diameter(dss.ctx)
end
Diameter() = Diameter(DSS_DEFAULT_CTX)

"""Diameter (Setter)"""
function Diameter(dss::DSSContext, Value::Float64)
    return @checked Lib.TSData_Set_Diameter(dss.ctx, Value)
end
Diameter(Value::Float64) = Diameter(DSS_DEFAULT_CTX, Value)

"""InsLayer (Getter)"""
function InsLayer(dss::DSSContext)::Float64
    return @checked Lib.TSData_Get_InsLayer(dss.ctx)
end
InsLayer() = InsLayer(DSS_DEFAULT_CTX)

"""InsLayer (Setter)"""
function InsLayer(dss::DSSContext, Value::Float64)
    return @checked Lib.TSData_Set_InsLayer(dss.ctx, Value)
end
InsLayer(Value::Float64) = InsLayer(DSS_DEFAULT_CTX, Value)

"""EpsR (Getter)"""
function EpsR(dss::DSSContext)::Float64
    return @checked Lib.TSData_Get_EpsR(dss.ctx)
end
EpsR() = EpsR(DSS_DEFAULT_CTX)

"""EpsR (Setter)"""
function EpsR(dss::DSSContext, Value::Float64)
    return @checked Lib.TSData_Set_EpsR(dss.ctx, Value)
end
EpsR(Value::Float64) = EpsR(DSS_DEFAULT_CTX, Value)

"""TapeLayer (Getter)"""
function TapeLayer(dss::DSSContext)::Float64
    return @checked Lib.TSData_Get_TapeLayer(dss.ctx)
end
TapeLayer() = TapeLayer(DSS_DEFAULT_CTX)

"""TapeLayer (Setter)"""
function TapeLayer(dss::DSSContext, Value::Float64)
    return @checked Lib.TSData_Set_TapeLayer(dss.ctx, Value)
end
TapeLayer(Value::Float64) = TapeLayer(DSS_DEFAULT_CTX, Value)

"""GMRUnits (Getter)"""
function GMRUnits(dss::DSSContext)::Lib.LineUnits
    return @checked Lib.TSData_Get_GMRUnits(dss.ctx)
end
GMRUnits() = GMRUnits(DSS_DEFAULT_CTX)

"""GMRUnits (Setter)"""
function GMRUnits(dss::DSSContext, Value::Union{Int,Lib.LineUnits})
    return @checked Lib.TSData_Set_GMRUnits(dss.ctx, Value)
end
GMRUnits(Value::Union{Int,Lib.LineUnits}) = GMRUnits(DSS_DEFAULT_CTX, Value)

"""TapeLap (Getter)"""
function TapeLap(dss::DSSContext)::Float64
    return @checked Lib.TSData_Get_TapeLap(dss.ctx)
end
TapeLap() = TapeLap(DSS_DEFAULT_CTX)

"""TapeLap (Setter)"""
function TapeLap(dss::DSSContext, Value::Float64)
    return @checked Lib.TSData_Set_TapeLap(dss.ctx, Value)
end
TapeLap(Value::Float64) = TapeLap(DSS_DEFAULT_CTX, Value)

"""DiaCable (Getter)"""
function DiaCable(dss::DSSContext)::Float64
    return @checked Lib.TSData_Get_DiaCable(dss.ctx)
end
DiaCable() = DiaCable(DSS_DEFAULT_CTX)

"""DiaCable (Setter)"""
function DiaCable(dss::DSSContext, Value::Float64)
    return @checked Lib.TSData_Set_DiaCable(dss.ctx, Value)
end
DiaCable(Value::Float64) = DiaCable(DSS_DEFAULT_CTX, Value)

"""ResistanceUnits (Getter)"""
function ResistanceUnits(dss::DSSContext)::Lib.LineUnits
    return @checked Lib.TSData_Get_ResistanceUnits(dss.ctx)
end
ResistanceUnits() = ResistanceUnits(DSS_DEFAULT_CTX)

"""ResistanceUnits (Setter)"""
function ResistanceUnits(dss::DSSContext, Value::Union{Int,Lib.LineUnits})
    return @checked Lib.TSData_Set_ResistanceUnits(dss.ctx, Value)
end
ResistanceUnits(Value::Union{Int,Lib.LineUnits}) = ResistanceUnits(DSS_DEFAULT_CTX, Value)

"""Rac (Getter)"""
function Rac(dss::DSSContext)::Float64
    return @checked Lib.TSData_Get_Rac(dss.ctx)
end
Rac() = Rac(DSS_DEFAULT_CTX)

"""Rac (Setter)"""
function Rac(dss::DSSContext, Value::Float64)
    return @checked Lib.TSData_Set_Rac(dss.ctx, Value)
end
Rac(Value::Float64) = Rac(DSS_DEFAULT_CTX, Value)

"""Radius (Getter)"""
function Radius(dss::DSSContext)::Float64
    return @checked Lib.TSData_Get_Radius(dss.ctx)
end
Radius() = Radius(DSS_DEFAULT_CTX)

"""Radius (Setter)"""
function Radius(dss::DSSContext, Value::Float64)
    return @checked Lib.TSData_Set_Radius(dss.ctx, Value)
end
Radius(Value::Float64) = Radius(DSS_DEFAULT_CTX, Value)

"""DiaShield (Getter)"""
function DiaShield(dss::DSSContext)::Float64
    return @checked Lib.TSData_Get_DiaShield(dss.ctx)
end
DiaShield() = DiaShield(DSS_DEFAULT_CTX)

"""DiaShield (Setter)"""
function DiaShield(dss::DSSContext, Value::Float64)
    return @checked Lib.TSData_Set_DiaShield(dss.ctx, Value)
end
DiaShield(Value::Float64) = DiaShield(DSS_DEFAULT_CTX, Value)

"""RadiusUnits (Getter)"""
function RadiusUnits(dss::DSSContext)::Lib.LineUnits
    return @checked Lib.TSData_Get_RadiusUnits(dss.ctx)
end
RadiusUnits() = RadiusUnits(DSS_DEFAULT_CTX)

"""RadiusUnits (Setter)"""
function RadiusUnits(dss::DSSContext, Value::Union{Int,Lib.LineUnits})
    return @checked Lib.TSData_Set_RadiusUnits(dss.ctx, Value)
end
RadiusUnits(Value::Union{Int,Lib.LineUnits}) = RadiusUnits(DSS_DEFAULT_CTX, Value)

"""Emergency ampere rating (Getter)"""
function EmergAmps(dss::DSSContext)::Float64
    return @checked Lib.TSData_Get_EmergAmps(dss.ctx)
end
EmergAmps() = EmergAmps(DSS_DEFAULT_CTX)

"""Emergency ampere rating (Setter)"""
function EmergAmps(dss::DSSContext, Value::Float64)
    return @checked Lib.TSData_Set_EmergAmps(dss.ctx, Value)
end
EmergAmps(Value::Float64) = EmergAmps(DSS_DEFAULT_CTX, Value)

"""DiaIns (Getter)"""
function DiaIns(dss::DSSContext)::Float64
    return @checked Lib.TSData_Get_DiaIns(dss.ctx)
end
DiaIns() = DiaIns(DSS_DEFAULT_CTX)

"""DiaIns (Setter)"""
function DiaIns(dss::DSSContext, Value::Float64)
    return @checked Lib.TSData_Set_DiaIns(dss.ctx, Value)
end
DiaIns(Value::Float64) = DiaIns(DSS_DEFAULT_CTX, Value)

"""Rdc (Getter)"""
function Rdc(dss::DSSContext)::Float64
    return @checked Lib.TSData_Get_Rdc(dss.ctx)
end
Rdc() = Rdc(DSS_DEFAULT_CTX)

"""Rdc (Setter)"""
function Rdc(dss::DSSContext, Value::Float64)
    return @checked Lib.TSData_Set_Rdc(dss.ctx, Value)
end
Rdc(Value::Float64) = Rdc(DSS_DEFAULT_CTX, Value)

end