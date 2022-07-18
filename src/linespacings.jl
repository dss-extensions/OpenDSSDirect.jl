module LineSpacings

using DocStringExtensions

using ..Lib
using ..Utils

@template (FUNCTIONS, METHODS) = """
                                 $(TYPEDSIGNATURES)
                                 $(DOCSTRING)
                                 """


"""Array of names of all LineSpacing objects."""
function AllNames()::Vector{String}
    return get_string_array(Lib.LineSpacings_Get_AllNames)
end

"""Sets a LineSpacing active by name."""
function Name()::String
    return get_string(@checked Lib.LineSpacings_Get_Name())
end

"""Sets a LineSpacing active by name."""
function Name(Value::String)
    @checked Lib.LineSpacings_Set_Name(Cstring(pointer(Value)))
end

"""Number of LineSpacing Objects in Active Circuit"""
function Count()::Int
    return @checked Lib.LineSpacings_Get_Count()
end

"""Sets first LineSpacing to be active.  Returns 0 if none."""
function First()::Int
    return @checked Lib.LineSpacings_Get_First()
end

"""Sets next LineSpacing to be active.  Returns 0 if no more."""
function Next()::Int
    return @checked Lib.LineSpacings_Get_Next()
end

"""Active LineSpacing by index.  1..Count (Getter)"""
function Idx()::Int
    return @checked Lib.LineSpacings_Get_idx()
end

"""Active LineSpacing by index.  1..Count (Setter)"""
function Idx(Value::Int)
    @checked Lib.LineSpacings_Set_idx(Value)
end

"""Nconds (Getter)"""
function Nconds()::Int
    return @checked Lib.LineSpacings_Get_Nconds()
end

"""Nconds (Setter)"""
function Nconds(Value::Int)
    return @checked Lib.LineSpacings_Set_Nconds(Value)
end

"""Units (Getter)"""
function Units()::Int
    return @checked Lib.LineSpacings_Get_Units()
end

"""Units (Setter)"""
function Units(Value::Int)
    return @checked Lib.LineSpacings_Set_Units(Value)
end

"""Get/Set the Y (vertical/height) coordinates of the conductors (Getter)"""
function Ycoords()::Vector{Float64}
    return get_float64_array(Lib.LineSpacings_Get_Ycoords)
end

"""Get/Set the Y (vertical/height) coordinates of the conductors (Setter)"""
function Ycoords(Value::Vector{Float64})
    set_float64_array(Lib.LineSpacings_Set_Ycoords, Value)
end

"""Get/Set the X (horizontal) coordinates of the conductors (Getter)"""
function Xcoords()::Vector{Float64}
    return get_float64_array(Lib.LineSpacings_Get_Xcoords)
end

"""Get/Set the X (horizontal) coordinates of the conductors (Setter)"""
function Xcoords(Value::Vector{Float64})
    set_float64_array(Lib.LineSpacings_Set_Xcoords, Value)
end

"""Number of Phases (Getter)"""
function Phases()::Int
    return @checked Lib.LineSpacings_Get_Phases()
end

"""Number of Phases (Setter)"""
function Phases(Value::Int)
    return @checked Lib.LineSpacings_Set_Phases(Value)
end

end