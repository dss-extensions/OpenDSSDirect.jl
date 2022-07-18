
module LoadShape

using DocStringExtensions

using ..Lib
using ..Utils

@template (FUNCTIONS, METHODS) = """
                                 $(TYPEDSIGNATURES)
                                 $(DOCSTRING)
                                 """

"""Create new Load Shape"""
function New(Name)::Int
    return @checked Lib.LoadShapes_New(Cstring(pointer(Name)))
end

"""Normalize Load Shape"""
function Normalize()
    @checked Lib.LoadShapes_Normalize()
end

"""Array of strings containing names of all Loadshape objects currently defined."""
function AllNames()::Vector{String}
    return get_string_array(Lib.LoadShapes_Get_AllNames)
end

"""Number of Loadshape objects currently defined in Loadshape collection"""
function Count()::Int
    return @checked Lib.LoadShapes_Get_Count()
end

"""Set the first loadshape active and return integer index of the loadshape. Returns 0 if none."""
function First()::Int
    return @checked Lib.LoadShapes_Get_First()
end

"""Fixed interval time value, hours."""
function HrInterval()::Float64
    return @checked Lib.LoadShapes_Get_HrInterval()
end

"""Fixed interval time value, hours."""
function HrInterval(Value::Float64)
    @checked Lib.LoadShapes_Set_HrInterval(Value)
end

"""Fixed Interval time value, in minutes"""
function MinInterval()::Float64
    return @checked Lib.LoadShapes_Get_MinInterval()
end

"""Fixed Interval time value, in minutes"""
function MinInterval(Value::Float64)
    @checked Lib.LoadShapes_Set_MinInterval(Value)
end

"""Name of the active Loadshape (Getter)"""
function Name()::String
    return get_string(Lib.LoadShapes_Get_Name())
end

"""Name of the active Loadshape (Setter)"""
function Name(Value::String)
    @checked Lib.LoadShapes_Set_Name(Cstring(pointer(Value)))
end

"""Advance active Loadshape to the next on in the collection. Returns 0 if no more loadshapes."""
function Next()::Int
    return @checked Lib.LoadShapes_Get_Next()
end

"""Number of points in active Loadshape. (Getter)"""
function Npts()::Int
    return @checked Lib.LoadShapes_Get_Npts()
end

"""Number of points in active Loadshape. (Setter)"""
function Npts(Value::Int)
    @checked Lib.LoadShapes_Set_Npts(Value)
end

"""Base for normalizing P curve (Getter)"""
function PBase()::Float64
    return @checked Lib.LoadShapes_Get_PBase()
end

"""Base for normalizing P curve (Setter)"""
function PBase(Value::Float64)
    @checked Lib.LoadShapes_Set_PBase(Value)
end

"""Array of Doubles for the P multiplier in the Loadshape. (Getter)"""
function PMult()::Vector{Float64}
    return get_float64_array(Lib.LoadShapes_Get_Pmult)
end

"""Array of Doubles for the P multiplier in the Loadshape. (Setter)"""
function PMult(Value::Vector{Float64})
    Value, ValuePtr, ValueCount = prepare_float64_array(Value)
    @checked Lib.LoadShapes_Set_Pmult(ValuePtr, ValueCount)
end

"""Base for normalizing Q curve. If left at zero, the peak value is used. (Getter)"""
function QBase()::Float64
    return @checked Lib.LoadShapes_Get_Qbase()
end

"""Base for normalizing Q curve. If left at zero, the peak value is used. (Setter)"""
function QBase(Value::Float64)
    @checked Lib.LoadShapes_Set_Qbase(Value)
end

"""Array of doubles containing the Q multipliers. (Getter)"""
function QMult()::Vector{Float64}
    return get_float64_array(Lib.LoadShapes_Get_Qmult)
end

"""Array of doubles containing the Q multipliers. (Setter)"""
function QMult(Value::Vector{Float64})
    Value, ValuePtr, ValueCount = prepare_float64_array(Value)
    @checked Lib.LoadShapes_Set_Qmult(ValuePtr, ValueCount)
end

"""Time array in hours correscponding to P and Q multipliers when the Interval=0. (Getter)"""
function TimeArray()::Vector{Float64}
    return get_float64_array(Lib.LoadShapes_Get_TimeArray)
end

"""Time array in hours correscponding to P and Q multipliers when the Interval=0. (Setter)"""
function TimeArray(Value::Vector{Float64})
    Value, ValuePtr, ValueCount = prepare_float64_array(Value)
    @checked Lib.LoadShapes_Set_TimeArray(ValuePtr, ValueCount)
end

"""T/F flag to let Loads know to use the actual value in the curve rather than use the value as a multiplier. (Getter)"""
function UseActual()::Bool
    return @checked(Lib.LoadShapes_Get_UseActual()) != 0
end

"""T/F flag to let Loads know to use the actual value in the curve rather than use the value as a multiplier. (Setter)"""
function UseActual(Value::Bool)
    @checked Lib.LoadShapes_Set_UseActual(Value ? 1 : 0)
end

"""Interval of active loadshape in seconds (Getter)"""
function SInterval()::Float64
    return @checked Lib.LoadShapes_Get_SInterval()
end

"""Interval of active loadshape in seconds (Setter)"""
function SInterval(Value::Float64)
    @checked Lib.LoadShapes_Set_SInterval(Value)
end

"""LoadShape Index (Getter)"""
function Idx()::Int
    return @checked Lib.LoadShapes_Get_idx()
end

"""LoadShape Index (Setter)"""
function Idx(Value::Int)
    @checked Lib.LoadShapes_Set_idx(Value)
end

# """kvar value at the time of max kW power.
# This is set automatically set upon reading in a loadshape, but for external-memory loadshapes, the user must provide the value.
# This property can also be used to override the value automatically computed or to retrieve the value computed.

# (Getter)
# (API Extension)"""
# function MaxQ()::Float64
#     return @checked Lib.LoadShapes_Get_MaxQ()
# end

# """kW value at the time of max power. This is set automatically set upon reading in a loadshape, but for external-memory loadshapes, the user must provide the value.
# This property can also be used to override the value automatically computed or to retrieve the value computed.

# (Setter)
# (API Extension)"""
# function MaxQ(Value::Float64)
#     return @checked Lib.LoadShapes_Set_MaxQ(Value)
# end

# """kW value at the time of max power. This is set automatically set upon reading in a loadshape, but for external-memory loadshapes, the user must provide the value.
# This property can also be used to override the value automatically computed or to retrieve the value computed.

# (Getter)
# (API Extension)"""
# function MaxP()::Float64
#     return @checked Lib.LoadShapes_Get_MaxP()
# end

# """kW value at the time of max power. This is set automatically set upon reading in a loadshape, but for external-memory loadshapes, the user must provide the value.
# This property can also be used to override the value automatically computed or to retrieve the value computed.

# (Setter)
# (API Extension)
# """
# function MaxP(Value::Float64)
#     return @checked Lib.LoadShapes_Set_MaxP(Value)
# end

# """Sets all numeric arrays for the active LoadShape.

# If ExternalMemory is 0/False, the data is copied, allocating memory.
# If ExternalMemory is 1/True, the data is NOT copied. The caller is required to keep the
# pointers alive while the LoadShape is used, as well as deallocating them later.

# If IsFloat32 is 0/False, the pointers are interpreted as pointers to float64/double precision numbers.
# Otherwise, the pointers are interpreted as pointers to float32/single precision numbers.

# Stride: number of elements to skip to reach the next indexed element.
# Stride is only used when ExternalMemory is 1/True (ignored otherwise).
# For non-contiguous series and transposed data. Depending on how much that is used, a row-major matrix is
# preferred over a column-major one.

# Remember to set MaxP and MaxQ accordingly.

# (API Extension)"""
# function Points(Npts::Int, HoursPtr, PMultPtr, QMultPtr, ExternalMemory::Bool, IsFloat32::Bool, Stride::Int)
#     return @checked Lib.LoadShapes_Set_Points(Nptr, HoursPtr, PMultPtr, QMultPtr, ExternalMemory, IsFloat32, Stride)
# end

"""Converts the current LoadShape data to float32/single precision.
If there is no data or the data is already represented using float32, nothing is done.

(API Extension)"""
function UseFloat32()
    @checked Lib.LoadShapes_UseFloat32()
end

"""Converts the current LoadShape data to float64/double precision.
If there is no data or the data is already represented using float64, nothing is done.

(API Extension)"""
function UseFloat64()
    @checked Lib.LoadShapes_UseFloat64()
end

end
