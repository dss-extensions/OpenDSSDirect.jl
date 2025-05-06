module Isource

using DocStringExtensions

using ..Lib
using ..Utils

@template (FUNCTIONS, METHODS) = """
                                 $(TYPEDSIGNATURES)
                                 $(DOCSTRING)
                                 """


"""Array of names of all ISource objects."""
function AllNames(dss::DSSContext)::Vector{String}
    return get_string_array(dss.capi.ISources_Get_AllNames, dss)
end
AllNames() = AllNames(DSS_DEFAULT_CTX)

"""Gets the name of the active ISource object."""
function Name(dss::DSSContext)::String
    return get_string(@checked dss_ccall(dss.capi.ISources_Get_Name, dss.ctx))
end
Name() = Name(DSS_DEFAULT_CTX)

"""Sets an ISource object active by name."""
function Name(dss::DSSContext, Value::String)
    @checked dss_ccall(dss.capi.ISources_Set_Name, dss.ctx, Value)
end
Name(Value::String) = Name(DSS_DEFAULT_CTX, Value)

"""Number of ISource Objects in Active Circuit"""
function Count(dss::DSSContext)::Int
    return @checked dss_ccall(dss.capi.ISources_Get_Count, dss.ctx)
end
Count() = Count(DSS_DEFAULT_CTX)

"""
Sets first ISource to be active.
Returns 0 if none.
"""
function First(dss::DSSContext)::Int
    return @checked dss_ccall(dss.capi.ISources_Get_First, dss.ctx)
end
First() = First(DSS_DEFAULT_CTX)

"""
Sets next ISource to be active.
Returns 0 if no more.
"""
function Next(dss::DSSContext)::Int
    return @checked dss_ccall(dss.capi.ISources_Get_Next, dss.ctx)
end
Next() = Next(DSS_DEFAULT_CTX)

"""
Returns the index of the current active ISource (1-based)

(Getter)
"""
function Idx(dss::DSSContext)::Int
    return @checked dss_ccall(dss.capi.ISources_Get_idx, dss.ctx)
end
Idx() = Idx(DSS_DEFAULT_CTX)

"""
Activate ISource by index (1-based)

(Setter)
"""
function Idx(dss::DSSContext, Value::Int)
    @checked dss_ccall(dss.capi.ISources_Set_idx, dss.ctx, Value)
end
Idx(Value::Int) = Idx(DSS_DEFAULT_CTX, Value)

"""
Magnitude of the ISource in amps

Original COM help: https://opendss.epri.com/Amps.html

(Getter)
"""
function Amps(dss::DSSContext)::Float64
    return @checked dss_ccall(dss.capi.ISources_Get_Amps, dss.ctx)
end
Amps() = Amps(DSS_DEFAULT_CTX)

"""
Magnitude of the ISource in amps

Original COM help: https://opendss.epri.com/Amps.html

(Setter)
"""
function Amps(dss::DSSContext, Value::Float64)
    @checked dss_ccall(dss.capi.ISources_Set_Amps, dss.ctx, Value)
end
Amps(Value::Float64) = Amps(DSS_DEFAULT_CTX, Value)

"""
Phase angle for ISource, degrees

Original COM help: https://opendss.epri.com/AngleDeg.html

(Getter)
"""
function AngleDeg(dss::DSSContext)::Float64
    return @checked dss_ccall(dss.capi.ISources_Get_AngleDeg, dss.ctx)
end
AngleDeg() = AngleDeg(DSS_DEFAULT_CTX)

"""
Phase angle for ISource, degrees

Original COM help: https://opendss.epri.com/AngleDeg.html

(Setter)
"""
function AngleDeg(dss::DSSContext, Value::Float64)
    @checked dss_ccall(dss.capi.ISources_Set_AngleDeg, dss.ctx, Value)
end
AngleDeg(Value::Float64) = AngleDeg(DSS_DEFAULT_CTX, Value)

"""
The present frequency of the ISource, Hz

Original COM help: https://opendss.epri.com/Frequency.html

(Getter)
"""
function Frequency(dss::DSSContext)::Float64
    return @checked dss_ccall(dss.capi.ISources_Get_Frequency, dss.ctx)
end
Frequency() = Frequency(DSS_DEFAULT_CTX)

"""
The present frequency of the ISource, Hz

Original COM help: https://opendss.epri.com/Frequency.html

(Setter)
"""
function Frequency(dss::DSSContext, Value::Float64)
    @checked dss_ccall(dss.capi.ISources_Set_Frequency, dss.ctx, Value)
end
Frequency(Value::Float64) = Frequency(DSS_DEFAULT_CTX, Value)

end
