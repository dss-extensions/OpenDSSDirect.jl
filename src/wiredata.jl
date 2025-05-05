module WireData

using DocStringExtensions

using ..Lib
using ..Utils

@template (FUNCTIONS, METHODS) = """
                                 $(TYPEDSIGNATURES)
                                 $(DOCSTRING)
                                 """


"""
Array of names of all WireData objects.
"""
function AllNames(dss::DSSContext)::Vector{String}
    return get_string_array(Lib.WireData_Get_AllNames, dss.ctx)
end
AllNames() = AllNames(DSS_DEFAULT_CTX)

"""
Gets the name of the active WireData object.
"""
function Name(dss::DSSContext)::String
    return get_string(@checked Lib.WireData_Get_Name(dss.ctx))
end
Name() = Name(DSS_DEFAULT_CTX)

"""
Sets a WireData object active by name.
"""
function Name(dss::DSSContext, Value::String)
    @checked Lib.WireData_Set_Name(dss.ctx, Value)
end
Name(Value::String) = Name(DSS_DEFAULT_CTX, Value)

"""
Number of WireData objects in Active Circuit
"""
function Count(dss::DSSContext)::Int
    return @checked Lib.WireData_Get_Count(dss.ctx)
end
Count() = Count(DSS_DEFAULT_CTX)

"""
Sets first WireData to be active.
Returns 0 if none.
"""
function First(dss::DSSContext)::Int
    return @checked Lib.WireData_Get_First(dss.ctx)
end
First() = First(DSS_DEFAULT_CTX)

"""
Sets next WireData to be active.
Returns 0 if no more.
"""
function Next(dss::DSSContext)::Int
    return @checked Lib.WireData_Get_Next(dss.ctx)
end
Next() = Next(DSS_DEFAULT_CTX)

"""
Returns the index of the current active WireData (1-based)

(Getter)
"""
function Idx(dss::DSSContext)::Int
    return @checked Lib.WireData_Get_idx(dss.ctx)
end
Idx() = Idx(DSS_DEFAULT_CTX)

"""
Activate WireData by index (1-based)

(Setter)
"""
function Idx(dss::DSSContext, Value::Int)
    @checked Lib.WireData_Set_idx(dss.ctx, Value)
end
Idx(Value::Int) = Idx(DSS_DEFAULT_CTX, Value)

"""
Rac

(Getter)
"""
function Rac(dss::DSSContext)::Float64
    return @checked Lib.WireData_Get_Rac(dss.ctx)
end
Rac() = Rac(DSS_DEFAULT_CTX)

"""
Rac

(Setter)
"""
function Rac(dss::DSSContext, Value::Float64)
    return @checked Lib.WireData_Set_Rac(dss.ctx, Value)
end
Rac(Value::Float64) = Rac(DSS_DEFAULT_CTX, Value)

"""
Radius

(Getter)
"""
function Radius(dss::DSSContext)::Float64
    return @checked Lib.WireData_Get_Radius(dss.ctx)
end
Radius() = Radius(DSS_DEFAULT_CTX)

"""
Radius

(Setter)
"""
function Radius(dss::DSSContext, Value::Float64)
    return @checked Lib.WireData_Set_Radius(dss.ctx, Value)
end
Radius(Value::Float64) = Radius(DSS_DEFAULT_CTX, Value)

"""
Diameter

(Getter)
"""
function Diameter(dss::DSSContext)::Float64
    return @checked Lib.WireData_Get_Diameter(dss.ctx)
end
Diameter() = Diameter(DSS_DEFAULT_CTX)

"""
Diameter

(Setter)
"""
function Diameter(dss::DSSContext, Value::Float64)
    return @checked Lib.WireData_Set_Diameter(dss.ctx, Value)
end
Diameter(Value::Float64) = Diameter(DSS_DEFAULT_CTX, Value)

"""
RadiusUnits

(Getter)
"""
function RadiusUnits(dss::DSSContext)::Float64
    return @checked Lib.WireData_Get_RadiusUnits(dss.ctx)
end
RadiusUnits() = RadiusUnits(DSS_DEFAULT_CTX)

"""
RadiusUnits

(Setter)
"""
function RadiusUnits(dss::DSSContext, Value::Float64)
    return @checked Lib.WireData_Set_RadiusUnits(dss.ctx, Value)
end
RadiusUnits(Value::Float64) = RadiusUnits(DSS_DEFAULT_CTX, Value)

"""
Equivalent conductor radius for capacitance calcs. Specify this for bundled conductors. Defaults to same value as radius.

(Getter)
"""
function CapRadius(dss::DSSContext)::Float64
    return @checked Lib.WireData_Get_CapRadius(dss.ctx)
end
CapRadius() = CapRadius(DSS_DEFAULT_CTX)

"""
Equivalent conductor radius for capacitance calcs. Specify this for bundled conductors. Defaults to same value as radius.

(Setter)
"""
function CapRadius(dss::DSSContext, Value::Float64)
    return @checked Lib.WireData_Set_CapRadius(dss.ctx, Value)
end
CapRadius(Value::Float64) = CapRadius(DSS_DEFAULT_CTX, Value)

"""
Normal Ampere rating

(Getter)
"""
function NormAmps(dss::DSSContext)::Float64
    return @checked Lib.WireData_Get_NormAmps(dss.ctx)
end
NormAmps() = NormAmps(DSS_DEFAULT_CTX)

"""
Normal Ampere rating

(Setter)
"""
function NormAmps(dss::DSSContext, Value::Float64)
    return @checked Lib.WireData_Set_NormAmps(dss.ctx, Value)
end
NormAmps(Value::Float64) = NormAmps(DSS_DEFAULT_CTX, Value)

"""
Emergency ampere rating

(Getter)
"""
function EmergAmps(dss::DSSContext)::Float64
    return @checked Lib.WireData_Get_EmergAmps(dss.ctx)
end
EmergAmps() = EmergAmps(DSS_DEFAULT_CTX)

"""
Emergency ampere rating

(Setter)
"""
function EmergAmps(dss::DSSContext, Value::Float64)
    return @checked Lib.WireData_Set_EmergAmps(dss.ctx, Value)
end
EmergAmps(Value::Float64) = EmergAmps(DSS_DEFAULT_CTX, Value)

"""
Rdc

(Getter)
"""
function Rdc(dss::DSSContext)::Float64
    return @checked Lib.WireData_Get_Rdc(dss.ctx)
end
Rdc() = Rdc(DSS_DEFAULT_CTX)

"""
Rdc

(Setter)
"""
function Rdc(dss::DSSContext, Value::Float64)
    return @checked Lib.WireData_Set_Rdc(dss.ctx, Value)
end
Rdc(Value::Float64) = Rdc(DSS_DEFAULT_CTX, Value)

"""
GMRac

(Getter)
"""
function GMRac(dss::DSSContext)::Float64
    return @checked Lib.WireData_Get_GMRac(dss.ctx)
end
GMRac() = GMRac(DSS_DEFAULT_CTX)

"""
GMRac

(Setter)
"""
function GMRac(dss::DSSContext, Value::Float64)
    return @checked Lib.WireData_Set_GMRac(dss.ctx, Value)
end
GMRac(Value::Float64) = GMRac(DSS_DEFAULT_CTX, Value)

"""
ResistanceUnits

(Getter)
"""
function ResistanceUnits(dss::DSSContext)::Lib.LineUnits
    return @checked Lib.WireData_Get_ResistanceUnits(dss.ctx)
end
ResistanceUnits() = ResistanceUnits(DSS_DEFAULT_CTX)

"""
ResistanceUnits

(Setter)
"""
function ResistanceUnits(dss::DSSContext, Value::Union{Int,Lib.LineUnits})
    return @checked Lib.WireData_Set_ResistanceUnits(dss.ctx, Value)
end
ResistanceUnits(Value::Union{Int,Lib.LineUnits}) = ResistanceUnits(DSS_DEFAULT_CTX, Value)

"""
GMRUnits

(Getter)
"""
function GMRUnits(dss::DSSContext)::Lib.LineUnits
    return @checked Lib.WireData_Get_GMRUnits(dss.ctx)
end
GMRUnits() = GMRUnits(DSS_DEFAULT_CTX)

"""
GMRUnits

(Setter)
"""
function GMRUnits(dss::DSSContext, Value::Union{Int,Lib.LineUnits})
    return @checked Lib.WireData_Set_GMRUnits(dss.ctx, Value)
end
GMRUnits(Value::Union{Int,Lib.LineUnits}) = GMRUnits(DSS_DEFAULT_CTX, Value)

end
