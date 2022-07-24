module LineGeometries

using DocStringExtensions

using ..Lib
using ..Utils

@template (FUNCTIONS, METHODS) = """
                                 $(TYPEDSIGNATURES)
                                 $(DOCSTRING)
                                 """


"""Array of names of all LineGeometry objects."""
function AllNames()::Vector{String}
    return get_string_array(Lib.LineGeometries_Get_AllNames)
end

"""Sets a LineGeometry active by name."""
function Name()::String
    return get_string(@checked Lib.LineGeometries_Get_Name())
end

"""Sets a LineGeometry active by name."""
function Name(Value::String)
    @checked Lib.LineGeometries_Set_Name(Cstring(pointer(Value)))
end

"""Number of LineGeometry Objects in Active Circuit"""
function Count()::Int
    return @checked Lib.LineGeometries_Get_Count()
end

"""Sets first LineGeometry to be active.  Returns 0 if none."""
function First()::Int
    return @checked Lib.LineGeometries_Get_First()
end

"""Sets next LineGeometry to be active.  Returns 0 if no more."""
function Next()::Int
    return @checked Lib.LineGeometries_Get_Next()
end

"""Active LineGeometry by index.  1..Count (Getter)"""
function Idx()::Int
    return @checked Lib.LineGeometries_Get_idx()
end

"""Active LineGeometry by index.  1..Count (Setter)"""
function Idx(Value::Int)
    @checked Lib.LineGeometries_Set_idx(Value)
end

"""Get/Set the Y (vertical/height) coordinates of the conductors (Getter)"""
function Ycoords()::Array{Float64}
    return get_float64_array(Lib.LineGeometries_Get_Ycoords)
end

"""Get/Set the Y (vertical/height) coordinates of the conductors (Setter)"""
function Ycoords(Value::Array{Float64})
    set_float64_array(Lib.LineGeometries_Set_Ycoords, Value)
end

"""Get/Set the X (horizontal) coordinates of the conductors (Getter)"""
function Xcoords()::Array{Float64}
    return get_float64_array(Lib.LineGeometries_Get_Xcoords)
end

"""Get/Set the X (horizontal) coordinates of the conductors (Setter)"""
function Xcoords(Value::Float64)
    set_float64_array(Lib.LineGeometries_Set_Xcoords, Value)
end

"""RhoEarth (Getter)"""
function RhoEarth()::Float64
    return @checked Lib.LineGeometries_Get_RhoEarth()
end

"""RhoEarth (Setter)"""
function RhoEarth(Value::Float64)
    return @checked Lib.LineGeometries_Set_RhoEarth(Value)
end

"""Emergency ampere rating (Getter)"""
function EmergAmps()::Float64
    return @checked Lib.LineGeometries_Get_EmergAmps()
end

"""Emergency ampere rating (Setter)"""
function EmergAmps(Value::Float64)
    return @checked Lib.LineGeometries_Set_EmergAmps(Value)
end

"""Normal ampere rating (Getter)"""
function NormAmps()::Float64
    return @checked Lib.LineGeometries_Get_NormAmps()
end

"""Normal ampere rating (Setter)"""
function NormAmps(Value::Float64)
    return @checked Lib.LineGeometries_Set_NormAmps(Value)
end

"""Units (Getter)"""
function Units()::Array{Int}
    return get_in32_array(Lib.LineGeometries_Get_Units)
end

"""Units (Setter)"""
function Units(Value::Array{Int})
    set_int32_array(Lib.LineGeometries_Set_Units, Value)
end

"""Number of Phases (Getter)"""
function Phases()::Int
    return @checked Lib.LineGeometries_Get_Phases()
end

"""Number of Phases (Setter)"""
function Phases(Value::Int)
    return @checked Lib.LineGeometries_Set_Phases(Value)
end

"""Nconds (Getter)"""
function Nconds()::Int
    return @checked Lib.LineGeometries_Get_Nconds()
end

"""Nconds (Setter)"""
function Nconds(Value::Int)
    return @checked Lib.LineGeometries_Set_Nconds(Value)
end

"""Reduce (Getter)"""
function Reduce()::Bool
    return @checked Lib.LineGeometries_Get_Reduce()
end

"""Reduce (Setter)"""
function Reduce(Value::Bool)
    return (@checked Lib.LineGeometries_Set_Reduce(Value)) != 0
end

"""Array of strings with names of all conductors in the active LineGeometry object"""
function Conductors()::Array{String}
    return get_string_array(Lib.LineGeometries_Get_Conductors)
end

"""Reactance matrix, ohms"""
function Xmatrix(Frequency::Float64, Length::Float64, Units::Union{Int32,Lib.LineUnits})::Array{Float64}
    return get_float64_array(Lib.LineGeometries_Get_Xmatrix, Frequency, Length, Units)
end

"""Resistance matrix, ohms"""
function Rmatrix(Frequency::Float64, Length::Float64, Units::Union{Int32,Lib.LineUnits})::Array{Float64}
    return get_float64_array(Lib.LineGeometries_Get_Rmatrix, Frequency, Length, Units)
end

"""Capacitance matrix, nF"""
function Cmatrix(Frequency::Float64, Length::Float64, Units::Union{Int32,Lib.LineUnits})::Array{Float64}
    return get_float64_array(Lib.LineGeometries_Get_Cmatrix, Frequency, Length, Units)
end

"""Complex impedance matrix, ohms"""
function Zmatrix(Frequency::Float64, Length::Float64, Units::Union{Int32,Lib.LineUnits})::Array{ComplexF64}
    return get_complex64_array(Lib.LineGeometries_Get_Zmatrix, Frequency, Length, Units)
end

end