module LineSpacings

using DocStringExtensions

using ..Lib
using ..Utils

@template (FUNCTIONS, METHODS) = """
                                 $(TYPEDSIGNATURES)
                                 $(DOCSTRING)
                                 """


"""Array of names of all LineSpacing objects."""
function AllNames(dss::DSSContext)::Vector{String}
    return get_string_array(Lib.LineSpacings_Get_AllNames, dss.ctx)
end
AllNames() = AllNames(DSS_DEFAULT_CTX)

"""Sets a LineSpacing active by name."""
function Name(dss::DSSContext)::String
    return get_string(@checked Lib.LineSpacings_Get_Name(dss.ctx))
end
Name() = Name(DSS_DEFAULT_CTX)

"""Sets a LineSpacing active by name."""
function Name(dss::DSSContext, Value::String)
    @checked Lib.LineSpacings_Set_Name(dss.ctx, Cstring(pointer(Value)))
end
Name(Value::String) = Name(DSS_DEFAULT_CTX, Value)

"""Number of LineSpacing Objects in Active Circuit"""
function Count(dss::DSSContext)::Int
    return @checked Lib.LineSpacings_Get_Count(dss.ctx)
end
Count() = Count(DSS_DEFAULT_CTX)

"""Sets first LineSpacing to be active.  Returns 0 if none."""
function First(dss::DSSContext)::Int
    return @checked Lib.LineSpacings_Get_First(dss.ctx)
end
First() = First(DSS_DEFAULT_CTX)

"""Sets next LineSpacing to be active.  Returns 0 if no more."""
function Next(dss::DSSContext)::Int
    return @checked Lib.LineSpacings_Get_Next(dss.ctx)
end
Next() = Next(DSS_DEFAULT_CTX)

"""Active LineSpacing by index.  1..Count (Getter)"""
function Idx(dss::DSSContext)::Int
    return @checked Lib.LineSpacings_Get_idx(dss.ctx)
end
Idx() = Idx(DSS_DEFAULT_CTX)

"""Active LineSpacing by index.  1..Count (Setter)"""
function Idx(dss::DSSContext, Value::Int)
    @checked Lib.LineSpacings_Set_idx(dss.ctx, Value)
end
Idx(Value::Int) = Idx(DSS_DEFAULT_CTX, Value)

"""Nconds (Getter)"""
function Nconds(dss::DSSContext)::Int
    return @checked Lib.LineSpacings_Get_Nconds(dss.ctx)
end
Nconds() = Nconds(DSS_DEFAULT_CTX)

"""Nconds (Setter)"""
function Nconds(dss::DSSContext, Value::Int)
    return @checked Lib.LineSpacings_Set_Nconds(dss.ctx, Value)
end
Nconds(Value::Int) = Nconds(DSS_DEFAULT_CTX, Value)

"""Units (Getter)"""
function Units(dss::DSSContext)::Int
    return @checked Lib.LineSpacings_Get_Units(dss.ctx)
end
Units() = Units(DSS_DEFAULT_CTX)

"""Units (Setter)"""
function Units(dss::DSSContext, Value::Int)
    return @checked Lib.LineSpacings_Set_Units(dss.ctx, Value)
end
Units(Value::Int) = Units(DSS_DEFAULT_CTX, Value)

"""Get/Set the Y (vertical/height) coordinates of the conductors (Getter)"""
function Ycoords(dss::DSSContext)::Vector{Float64}
    return get_float64_array(Lib.LineSpacings_Get_Ycoords, dss.ctx)
end
Ycoords() = Ycoords(DSS_DEFAULT_CTX)

"""Get/Set the Y (vertical/height) coordinates of the conductors (Setter)"""
function Ycoords(dss::DSSContext, Value::Vector{Float64})
    set_float64_array(Lib.LineSpacings_Set_Ycoords, dss.ctx, Value)
end
Ycoords(Value::Vector{Float64}) = Ycoords(DSS_DEFAULT_CTX, Value)

"""Get/Set the X (horizontal) coordinates of the conductors (Getter)"""
function Xcoords(dss::DSSContext)::Vector{Float64}
    return get_float64_array(Lib.LineSpacings_Get_Xcoords, dss.ctx)
end
Xcoords() = Xcoords(DSS_DEFAULT_CTX)

"""Get/Set the X (horizontal) coordinates of the conductors (Setter)"""
function Xcoords(dss::DSSContext, Value::Vector{Float64})
    set_float64_array(Lib.LineSpacings_Set_Xcoords, dss.ctx, Value)
end
Xcoords(Value::Vector{Float64}) = Xcoords(DSS_DEFAULT_CTX, Value)

"""Number of Phases (Getter)"""
function Phases(dss::DSSContext)::Int
    return @checked Lib.LineSpacings_Get_Phases(dss.ctx)
end
Phases() = Phases(DSS_DEFAULT_CTX)

"""Number of Phases (Setter)"""
function Phases(dss::DSSContext, Value::Int)
    return @checked Lib.LineSpacings_Set_Phases(dss.ctx, Value)
end
Phases(Value::Int) = Phases(DSS_DEFAULT_CTX, Value)

end