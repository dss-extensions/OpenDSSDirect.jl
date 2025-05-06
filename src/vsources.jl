module Vsources

using DocStringExtensions

using ..Lib
using ..Utils

@template (FUNCTIONS, METHODS) = """
                                 $(TYPEDSIGNATURES)
                                 $(DOCSTRING)
                                 """


"""Array of names of all Vsource objects."""
function AllNames(dss::DSSContext)::Vector{String}
    return get_string_array(dss.capi.Vsources_Get_AllNames, dss)
end
AllNames() = AllNames(DSS_DEFAULT_CTX)

"""Gets the name of the active Vsource object."""
function Name(dss::DSSContext)::String
    return get_string(@checked dss_ccall(dss.capi.Vsources_Get_Name, dss.ctx))
end
Name() = Name(DSS_DEFAULT_CTX)

"""Sets a Vsource object active by name."""
function Name(dss::DSSContext, Value::String)
    @checked dss_ccall(dss.capi.Vsources_Set_Name, dss.ctx, Value)
end
Name(Value::String) = Name(DSS_DEFAULT_CTX, Value)

"""Number of Vsource Objects in Active Circuit"""
function Count(dss::DSSContext)::Int
    return @checked dss_ccall(dss.capi.Vsources_Get_Count, dss.ctx)
end
Count() = Count(DSS_DEFAULT_CTX)

"""
Sets first Vsource to be active.
Returns 0 if none.
"""
function First(dss::DSSContext)::Int
    return @checked dss_ccall(dss.capi.Vsources_Get_First, dss.ctx)
end
First() = First(DSS_DEFAULT_CTX)

"""
Sets next Vsource to be active.
Returns 0 if no more.
"""
function Next(dss::DSSContext)::Int
    return @checked dss_ccall(dss.capi.Vsources_Get_Next, dss.ctx)
end
Next() = Next(DSS_DEFAULT_CTX)

"""
Returns the current active VSource index (1-based)

(Getter)
"""
function Idx(dss::DSSContext)::Int
    return @checked dss_ccall(dss.capi.Vsources_Get_idx, dss.ctx)
end
Idx() = Idx(DSS_DEFAULT_CTX)

"""
Activate VSource by index (1-based)

(Setter)
"""
function Idx(dss::DSSContext, Value::Int)
    @checked dss_ccall(dss.capi.Vsources_Set_idx, dss.ctx, Value)
end
Idx(Value::Int) = Idx(DSS_DEFAULT_CTX, Value)

"""
Phase angle of first phase in degrees

Original COM help: https://opendss.epri.com/AngleDeg1.html

(Getter)
"""
function AngleDeg(dss::DSSContext)::Float64
    return @checked dss_ccall(dss.capi.Vsources_Get_AngleDeg, dss.ctx)
end
AngleDeg() = AngleDeg(DSS_DEFAULT_CTX)

"""
Phase angle of first phase in degrees

Original COM help: https://opendss.epri.com/AngleDeg1.html

(Setter)
"""
function AngleDeg(dss::DSSContext, Value::Float64)
    @checked dss_ccall(dss.capi.Vsources_Set_AngleDeg, dss.ctx, Value)
end
AngleDeg(Value::Float64) = AngleDeg(DSS_DEFAULT_CTX, Value)

"""
Source voltage in kV

Original COM help: https://opendss.epri.com/BasekV.html

(Getter)
"""
function BasekV(dss::DSSContext)::Float64
    return @checked dss_ccall(dss.capi.Vsources_Get_BasekV, dss.ctx)
end
BasekV() = BasekV(DSS_DEFAULT_CTX)

"""
Source voltage in kV

Original COM help: https://opendss.epri.com/BasekV.html

(Setter)
"""
function BasekV(dss::DSSContext, Value::Float64)
    @checked dss_ccall(dss.capi.Vsources_Set_BasekV, dss.ctx, Value)
end
BasekV(Value::Float64) = BasekV(DSS_DEFAULT_CTX, Value)

"""
Source frequency in Hz

Original COM help: https://opendss.epri.com/Frequency2.html

(Getter)
"""
function Frequency(dss::DSSContext)::Float64
    return @checked dss_ccall(dss.capi.Vsources_Get_Frequency, dss.ctx)
end
Frequency() = Frequency(DSS_DEFAULT_CTX)

"""
Source frequency in Hz

Original COM help: https://opendss.epri.com/Frequency2.html

(Setter)
"""
function Frequency(dss::DSSContext, Value::Float64)
    @checked dss_ccall(dss.capi.Vsources_Set_Frequency, dss.ctx, Value)
end
Frequency(Value::Float64) = Frequency(DSS_DEFAULT_CTX, Value)

"""
Number of phases

Original COM help: https://opendss.epri.com/Phases3.html

(Getter)
"""
function Phases(dss::DSSContext)::Int
    return @checked dss_ccall(dss.capi.Vsources_Get_Phases, dss.ctx)
end
Phases() = Phases(DSS_DEFAULT_CTX)

"""
Number of phases

Original COM help: https://opendss.epri.com/Phases3.html

(Setter)
"""
function Phases(dss::DSSContext, Value::Int)
    @checked dss_ccall(dss.capi.Vsources_Set_Phases, dss.ctx, Value)
end
Phases(Value::Int) = Phases(DSS_DEFAULT_CTX, Value)

"""
Per-unit value of source voltage

Original COM help: https://opendss.epri.com/pu.html

(Getter)
"""
function PU(dss::DSSContext)::Float64
    return @checked dss_ccall(dss.capi.Vsources_Get_pu, dss.ctx)
end
PU() = PU(DSS_DEFAULT_CTX)

"""
Per-unit value of source voltage

Original COM help: https://opendss.epri.com/pu.html

(Setter)
"""
function PU(dss::DSSContext, Value::Float64)
    @checked dss_ccall(dss.capi.Vsources_Set_pu, dss.ctx, Value)
end
PU(Value::Float64) = PU(DSS_DEFAULT_CTX, Value)

end
