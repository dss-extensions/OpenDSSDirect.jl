module LineGeometries

using DocStringExtensions

using ..Lib
using ..Utils

@template (FUNCTIONS, METHODS) = """
                                 $(TYPEDSIGNATURES)
                                 $(DOCSTRING)
                                 """


"""Array of names of all LineGeometry objects."""
function AllNames(dss::DSSContext)::Vector{String}
    return get_string_array(Lib.LineGeometries_Get_AllNames, dss.ctx)
end
AllNames() = AllNames(DSS_DEFAULT_CTX)

"""Gets the name of the active LineGeometry object."""
function Name(dss::DSSContext)::String
    return get_string(@checked Lib.LineGeometries_Get_Name(dss.ctx))
end
Name() = Name(DSS_DEFAULT_CTX)

"""Sets a LineGeometry object active by name."""
function Name(dss::DSSContext, Value::String)
    @checked Lib.LineGeometries_Set_Name(dss.ctx, Cstring(pointer(Value)))
end
Name(Value::String) = Name(DSS_DEFAULT_CTX, Value)

"""Number of LineGeometry Objects in Active Circuit"""
function Count(dss::DSSContext)::Int
    return @checked Lib.LineGeometries_Get_Count(dss.ctx)
end
Count() = Count(DSS_DEFAULT_CTX)

"""
Sets first LineGeometry to be active.
Returns 0 if none.
"""
function First(dss::DSSContext)::Int
    return @checked Lib.LineGeometries_Get_First(dss.ctx)
end
First() = First(DSS_DEFAULT_CTX)

"""
Sets next LineGeometry to be active.
Returns 0 if no more.
"""
function Next(dss::DSSContext)::Int
    return @checked Lib.LineGeometries_Get_Next(dss.ctx)
end
Next() = Next(DSS_DEFAULT_CTX)

"""
Returns the index of the current active LineGeometry (1-based)

(Getter)
"""
function Idx(dss::DSSContext)::Int
    return @checked Lib.LineGeometries_Get_idx(dss.ctx)
end
Idx() = Idx(DSS_DEFAULT_CTX)

"""
Activate LineGeometry by index (1-based)

(Setter)
"""
function Idx(dss::DSSContext, Value::Int)
    @checked Lib.LineGeometries_Set_idx(dss.ctx, Value)
end
Idx(Value::Int) = Idx(DSS_DEFAULT_CTX, Value)

"""
Get/Set the Y (vertical/height) coordinates of the conductors

(Getter)
"""
function Ycoords(dss::DSSContext)::Array{Float64}
    return get_float64_array(Lib.LineGeometries_Get_Ycoords, dss.ctx)
end
Ycoords() = Ycoords(DSS_DEFAULT_CTX)

"""
Get/Set the Y (vertical/height) coordinates of the conductors

(Setter)
"""
function Ycoords(dss::DSSContext, Value::Array{Float64})
    set_float64_array(Lib.LineGeometries_Set_Ycoords, dss.ctx, Value)
end
Ycoords(Value::Array{Float64}) = Ycoords(DSS_DEFAULT_CTX, Value)

"""
Get/Set the X (horizontal) coordinates of the conductors

(Getter)
"""
function Xcoords(dss::DSSContext)::Array{Float64}
    return get_float64_array(Lib.LineGeometries_Get_Xcoords, dss.ctx)
end
Xcoords() = Xcoords(DSS_DEFAULT_CTX)

"""
Get/Set the X (horizontal) coordinates of the conductors

(Setter)
"""
function Xcoords(dss::DSSContext, Value::Float64)
    set_float64_array(Lib.LineGeometries_Set_Xcoords, dss.ctx, Value)
end
Xcoords(Value::Float64) = Xcoords(DSS_DEFAULT_CTX, Value)

"""
RhoEarth

(Getter)
"""
function RhoEarth(dss::DSSContext)::Float64
    return @checked Lib.LineGeometries_Get_RhoEarth(dss.ctx)
end
RhoEarth() = RhoEarth(DSS_DEFAULT_CTX)

"""
RhoEarth

(Setter)
"""
function RhoEarth(dss::DSSContext, Value::Float64)
    return @checked Lib.LineGeometries_Set_RhoEarth(dss.ctx, Value)
end
RhoEarth(Value::Float64) = RhoEarth(DSS_DEFAULT_CTX, Value)

"""
Emergency ampere rating

(Getter)
"""
function EmergAmps(dss::DSSContext)::Float64
    return @checked Lib.LineGeometries_Get_EmergAmps(dss.ctx)
end
EmergAmps() = EmergAmps(DSS_DEFAULT_CTX)

"""
Emergency ampere rating

(Setter)
"""
function EmergAmps(dss::DSSContext, Value::Float64)
    return @checked Lib.LineGeometries_Set_EmergAmps(dss.ctx, Value)
end
EmergAmps(Value::Float64) = EmergAmps(DSS_DEFAULT_CTX, Value)

"""
Normal ampere rating

(Getter)
"""
function NormAmps(dss::DSSContext)::Float64
    return @checked Lib.LineGeometries_Get_NormAmps(dss.ctx)
end
NormAmps() = NormAmps(DSS_DEFAULT_CTX)

"""
Normal ampere rating

(Setter)
"""
function NormAmps(dss::DSSContext, Value::Float64)
    return @checked Lib.LineGeometries_Set_NormAmps(dss.ctx, Value)
end
NormAmps(Value::Float64) = NormAmps(DSS_DEFAULT_CTX, Value)

"""
Units

(Getter)
"""
function Units(dss::DSSContext)::Array{Int}
    return get_in32_array(Lib.LineGeometries_Get_Units, dss.ctx)
end
Units() = Units(DSS_DEFAULT_CTX)

"""
Units

(Setter)
"""
function Units(dss::DSSContext, Value::Array{Int})
    set_int32_array(Lib.LineGeometries_Set_Units, dss.ctx, Value)
end
Units(Value::Array{Int}) = Units(DSS_DEFAULT_CTX, Value)

"""
Number of Phases

(Getter)
"""
function Phases(dss::DSSContext)::Int
    return @checked Lib.LineGeometries_Get_Phases(dss.ctx)
end
Phases() = Phases(DSS_DEFAULT_CTX)

"""
Number of Phases

(Setter)
"""
function Phases(dss::DSSContext, Value::Int)
    return @checked Lib.LineGeometries_Set_Phases(dss.ctx, Value)
end
Phases(Value::Int) = Phases(DSS_DEFAULT_CTX, Value)

"""
Number of conductors in this geometry. Default is 3. Triggers memory allocations. Define first!

(Getter)
"""
function Nconds(dss::DSSContext)::Int
    return @checked Lib.LineGeometries_Get_Nconds(dss.ctx)
end
Nconds() = Nconds(DSS_DEFAULT_CTX)

"""
Number of conductors in this geometry. Default is 3. Triggers memory allocations. Define first!

(Setter)
"""
function Nconds(dss::DSSContext, Value::Int)
    return @checked Lib.LineGeometries_Set_Nconds(dss.ctx, Value)
end
Nconds(Value::Int) = Nconds(DSS_DEFAULT_CTX, Value)

"""
If true, mark the object to perform a Kron reduction when obtaining the final matrices. 

The matrix order is reduced to the number of phases.

(Getter)
"""
function Reduce(dss::DSSContext)::Bool
    return @checked Lib.LineGeometries_Get_Reduce(dss.ctx)
end
Reduce() = Reduce(DSS_DEFAULT_CTX)

"""
If true, mark the object to perform a Kron reduction when obtaining the final matrices. 

The matrix order is reduced to the number of phases.

(Setter)
"""
function Reduce(dss::DSSContext, Value::Bool)
    return (@checked Lib.LineGeometries_Set_Reduce(dss.ctx, Value)) != 0
end
Reduce(Value::Bool) = Reduce(DSS_DEFAULT_CTX, Value)

"""Array of strings with names of all conductors in the active LineGeometry object"""
function Conductors(dss::DSSContext)::Array{String}
    return get_string_array(dss.ctx, Lib.LineGeometries_Get_Conductors)
end
Conductors() = Conductors(DSS_DEFAULT_CTX)

"""Reactance matrix, ohms"""
function Xmatrix(dss::DSSContext, Frequency::Float64, Length::Float64, Units::Union{Int32,Lib.LineUnits})::Array{Float64}
    return get_float64_array(Lib.LineGeometries_Get_Xmatrix, dss.ctx, Frequency, Length, Int32(Units))
    #TODO
end
Xmatrix(Frequency::Float64, Length::Float64, Units::Union{Int32,Lib.LineUnits}) = Xmatrix(DSS_DEFAULT_CTX, Frequency, Length, Units)

"""Resistance matrix, ohms"""
function Rmatrix(dss::DSSContext, Frequency::Float64, Length::Float64, Units::Union{Int32,Lib.LineUnits})::Array{Float64}
    return get_float64_array(Lib.LineGeometries_Get_Rmatrix, dss.ctx, Frequency, Length, Int32(Units))
    #TODO
end
Rmatrix(Frequency::Float64, Length::Float64, Units::Union{Int32,Lib.LineUnits}) = Rmatrix(DSS_DEFAULT_CTX, Frequency, Length, Units)

"""Capacitance matrix, nF"""
function Cmatrix(dss::DSSContext, Frequency::Float64, Length::Float64, Units::Union{Int32,Lib.LineUnits})::Array{Float64}
    return get_float64_array(Lib.LineGeometries_Get_Cmatrix, dss.ctx, Frequency, Length, Int32(Units))
end
Cmatrix(Frequency::Float64, Length::Float64, Units::Union{Int32,Lib.LineUnits}) = Cmatrix(DSS_DEFAULT_CTX, Frequency, Length, Units)

"""Complex impedance matrix, ohms"""
function Zmatrix(dss::DSSContext, Frequency::Float64, Length::Float64, Units::Union{Int32,Lib.LineUnits})::Array{ComplexF64}
    return get_complex64_array(Lib.LineGeometries_Get_Zmatrix, dss.ctx, Frequency, Length, Int32(Units))
end
Zmatrix(Frequency::Float64, Length::Float64, Units::Union{Int32,Lib.LineUnits}) = Zmatrix(DSS_DEFAULT_CTX, Frequency, Length, Units)

end