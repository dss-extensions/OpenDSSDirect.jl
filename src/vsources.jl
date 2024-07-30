
module Vsources

using DocStringExtensions

using ..Lib
using ..Utils

@template (FUNCTIONS, METHODS) = """
                                 $(TYPEDSIGNATURES)
                                 $(DOCSTRING)
                                 """

"""Names of all Vsource objects in the circuit"""
function AllNames(dss::DSSContext)::Vector{String}
    return get_string_array(Lib.Vsources_Get_AllNames, dss.ctx)
end
AllNames() = AllNames(DSS_DEFAULT_CTX)

"""Phase angle of first phase in degrees (Getter)"""
function AngleDeg(dss::DSSContext)::Float64
    return @checked Lib.Vsources_Get_AngleDeg(dss.ctx)
end
AngleDeg() = AngleDeg(DSS_DEFAULT_CTX)

"""Phase angle of first phase in degrees (Setter)"""
function AngleDeg(dss::DSSContext, Value::Float64)
    @checked Lib.Vsources_Set_AngleDeg(dss.ctx, Value)
end
AngleDeg(Value::Float64) = AngleDeg(DSS_DEFAULT_CTX, Value)

"""Source voltage in kV (Getter)"""
function BasekV(dss::DSSContext)::Float64
    return @checked Lib.Vsources_Get_BasekV(dss.ctx)
end
BasekV() = BasekV(DSS_DEFAULT_CTX)

"""Source voltage in kV (Setter)"""
function BasekV(dss::DSSContext, Value::Float64)
    @checked Lib.Vsources_Set_BasekV(dss.ctx, Value)
end
BasekV(Value::Float64) = BasekV(DSS_DEFAULT_CTX, Value)

"""Number of Vsource Object"""
function Count(dss::DSSContext)::Int
    return @checked Lib.Vsources_Get_Count(dss.ctx)
end
Count() = Count(DSS_DEFAULT_CTX)

"""Sets the first VSOURCE to be active; Returns 0 if none"""
function First(dss::DSSContext)::Int
    return @checked Lib.Vsources_Get_First(dss.ctx)
end
First() = First(DSS_DEFAULT_CTX)

"""Source frequency in Hz (Getter)"""
function Frequency(dss::DSSContext)::Float64
    return @checked Lib.Vsources_Get_Frequency(dss.ctx)
end
Frequency() = Frequency(DSS_DEFAULT_CTX)

"""Source frequency in Hz (Setter)"""
function Frequency(dss::DSSContext, Value::Float64)
    @checked Lib.Vsources_Set_Frequency(dss.ctx, Value)
end
Frequency(Value::Float64) = Frequency(DSS_DEFAULT_CTX, Value)

"""Gets the name of the active VSource object."""
function Name(dss::DSSContext)::String
    return get_string(@checked Lib.Vsources_Get_Name(dss.ctx))
end
Name() = Name(DSS_DEFAULT_CTX)

"""Sets the active VSource object by name."""
function Name(dss::DSSContext, Value::String)
    @checked Lib.Vsources_Set_Name(dss.ctx, Value)
end
Name(Value::String) = Name(DSS_DEFAULT_CTX, Value)

"""Sets the next VSOURCE object to be active; returns zero if no more"""
function Next(dss::DSSContext)::Int
    return @checked Lib.Vsources_Get_Next(dss.ctx)
end
Next() = Next(DSS_DEFAULT_CTX)

"""Number of phases (Getter)"""
function Phases(dss::DSSContext)::Int
    return @checked Lib.Vsources_Get_Phases(dss.ctx)
end
Phases() = Phases(DSS_DEFAULT_CTX)

"""Number of phases (Setter)"""
function Phases(dss::DSSContext, Value::Int)
    @checked Lib.Vsources_Set_Phases(dss.ctx, Value)
end
Phases(Value::Int) = Phases(DSS_DEFAULT_CTX, Value)

"""Source pu voltage. (Getter)"""
function PU(dss::DSSContext)::Float64
    return @checked Lib.Vsources_Get_pu(dss.ctx)
end
PU() = PU(DSS_DEFAULT_CTX)

"""Source pu voltage. (Setter)"""
function PU(dss::DSSContext, Value::Float64)
    @checked Lib.Vsources_Set_pu(dss.ctx, Value)
end
PU(Value::Float64) = PU(DSS_DEFAULT_CTX, Value)

"""VSOURCE Index (Getter)"""
function Idx(dss::DSSContext)::Int
    return @checked Lib.Vsources_Get_idx(dss.ctx)
end
Idx() = Idx(DSS_DEFAULT_CTX)

"""VSOURCE Index (Setter)"""
function Idx(dss::DSSContext, Value::Int)
    @checked Lib.Vsources_Set_idx(dss.ctx, Value)
end
Idx(Value::Int) = Idx(DSS_DEFAULT_CTX, Value)

end
