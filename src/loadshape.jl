
module LoadShape

using DocStringExtensions

using ..Lib
using ..Utils

@template (FUNCTIONS, METHODS) = """
                                 $(TYPEDSIGNATURES)
                                 $(DOCSTRING)
                                 """

"""Create new Load Shape"""
function New(dss::DSSContext, Name)::Int
    return @checked Lib.LoadShapes_New(dss.ctx, Cstring(pointer(Name)))
end
New(Name) = New(DSS_DEFAULT_CTX, Name)

"""Normalize Load Shape"""
function Normalize(dss::DSSContext)
    @checked Lib.LoadShapes_Normalize(dss.ctx)
end
Normalize() = Normalize(DSS_DEFAULT_CTX)

"""Array of strings containing names of all Loadshape objects currently defined."""
function AllNames(dss::DSSContext)::Vector{String}
    return get_string_array(Lib.LoadShapes_Get_AllNames, dss.ctx)
end
AllNames() = AllNames(DSS_DEFAULT_CTX)

"""Number of Loadshape objects currently defined in Loadshape collection"""
function Count(dss::DSSContext)::Int
    return @checked Lib.LoadShapes_Get_Count(dss.ctx)
end
Count() = Count(DSS_DEFAULT_CTX)

"""Set the first loadshape active and return integer index of the loadshape. Returns 0 if none."""
function First(dss::DSSContext)::Int
    return @checked Lib.LoadShapes_Get_First(dss.ctx)
end
First() = First(DSS_DEFAULT_CTX)

"""Fixed interval time value, hours."""
function HrInterval(dss::DSSContext)::Float64
    return @checked Lib.LoadShapes_Get_HrInterval(dss.ctx)
end
HrInterval() = HrInterval(DSS_DEFAULT_CTX)

"""Fixed interval time value, hours."""
function HrInterval(dss::DSSContext, Value::Float64)
    @checked Lib.LoadShapes_Set_HrInterval(dss.ctx, Value)
end
HrInterval(Value::Float64) = HrInterval(DSS_DEFAULT_CTX, Value)

"""Fixed Interval time value, in minutes"""
function MinInterval(dss::DSSContext)::Float64
    return @checked Lib.LoadShapes_Get_MinInterval(dss.ctx)
end
MinInterval() = MinInterval(DSS_DEFAULT_CTX)

"""Fixed Interval time value, in minutes"""
function MinInterval(dss::DSSContext, Value::Float64)
    @checked Lib.LoadShapes_Set_MinInterval(dss.ctx, Value)
end
MinInterval(Value::Float64) = MinInterval(DSS_DEFAULT_CTX, Value)

"""Name of the active Loadshape (Getter)"""
function Name(dss::DSSContext)::String
    return get_string(Lib.LoadShapes_Get_Name(dss.ctx))
end
Name() = Name(DSS_DEFAULT_CTX)

"""Name of the active Loadshape (Setter)"""
function Name(dss::DSSContext, Value::String)
    @checked Lib.LoadShapes_Set_Name(dss.ctx, Cstring(pointer(Value)))
end
Name(Value::String) = Name(DSS_DEFAULT_CTX, Value)

"""Advance active Loadshape to the next on in the collection. Returns 0 if no more loadshapes."""
function Next(dss::DSSContext)::Int
    return @checked Lib.LoadShapes_Get_Next(dss.ctx)
end
Next() = Next(DSS_DEFAULT_CTX)

"""Number of points in active Loadshape. (Getter)"""
function Npts(dss::DSSContext)::Int
    return @checked Lib.LoadShapes_Get_Npts(dss.ctx)
end
Npts() = Npts(DSS_DEFAULT_CTX)

"""Number of points in active Loadshape. (Setter)"""
function Npts(dss::DSSContext, Value::Int)
    @checked Lib.LoadShapes_Set_Npts(dss.ctx, Value)
end
Npts(Value::Int) = Npts(DSS_DEFAULT_CTX, Value)

"""Base for normalizing P curve (Getter)"""
function PBase(dss::DSSContext)::Float64
    return @checked Lib.LoadShapes_Get_PBase(dss.ctx)
end
PBase() = PBase(DSS_DEFAULT_CTX)

"""Base for normalizing P curve (Setter)"""
function PBase(dss::DSSContext, Value::Float64)
    @checked Lib.LoadShapes_Set_PBase(dss.ctx, Value)
end
PBase(Value::Float64) = PBase(DSS_DEFAULT_CTX, Value)

"""Array of Doubles for the P multiplier in the Loadshape. (Getter)"""
function PMult(dss::DSSContext)::Vector{Float64}
    return get_float64_array(Lib.LoadShapes_Get_Pmult, dss.ctx)
end
PMult() = PMult(DSS_DEFAULT_CTX)

"""Array of Doubles for the P multiplier in the Loadshape. (Setter)"""
function PMult(dss::DSSContext, Value::Vector{Float64})
    Value, ValuePtr, ValueCount = prepare_float64_array(Value)
    @checked Lib.LoadShapes_Set_Pmult(dss.ctx, ValuePtr, ValueCount)
end
PMult(Value::Vector{Float64}) = PMult(DSS_DEFAULT_CTX, Value)

"""Base for normalizing Q curve. If left at zero, the peak value is used. (Getter)"""
function QBase(dss::DSSContext)::Float64
    return @checked Lib.LoadShapes_Get_Qbase(dss.ctx)
end
QBase() = QBase(DSS_DEFAULT_CTX)

"""Base for normalizing Q curve. If left at zero, the peak value is used. (Setter)"""
function QBase(dss::DSSContext, Value::Float64)
    @checked Lib.LoadShapes_Set_Qbase(dss.ctx, Value)
end
QBase(Value::Float64) = QBase(DSS_DEFAULT_CTX, Value)

"""Array of doubles containing the Q multipliers. (Getter)"""
function QMult(dss::DSSContext)::Vector{Float64}
    return get_float64_array(Lib.LoadShapes_Get_Qmult, dss.ctx)
end
QMult() = QMult(DSS_DEFAULT_CTX)

"""Array of doubles containing the Q multipliers. (Setter)"""
function QMult(dss::DSSContext, Value::Vector{Float64})
    Value, ValuePtr, ValueCount = prepare_float64_array(Value)
    @checked Lib.LoadShapes_Set_Qmult(dss.ctx, ValuePtr, ValueCount)
end
QMult(Value::Vector{Float64}) = QMult(DSS_DEFAULT_CTX, Value)

"""Time array in hours correscponding to P and Q multipliers when the Interval=0. (Getter)"""
function TimeArray(dss::DSSContext)::Vector{Float64}
    return get_float64_array(Lib.LoadShapes_Get_TimeArray, dss.ctx)
end
TimeArray() = TimeArray(DSS_DEFAULT_CTX)

"""Time array in hours correscponding to P and Q multipliers when the Interval=0. (Setter)"""
function TimeArray(dss::DSSContext, Value::Vector{Float64})
    Value, ValuePtr, ValueCount = prepare_float64_array(Value)
    @checked Lib.LoadShapes_Set_TimeArray(dss.ctx, ValuePtr, ValueCount)
end
TimeArray(Value::Vector{Float64}) = TimeArray(DSS_DEFAULT_CTX, Value)

"""T/F flag to let Loads know to use the actual value in the curve rather than use the value as a multiplier. (Getter)"""
function UseActual(dss::DSSContext)::Bool
    return @checked(Lib.LoadShapes_Get_UseActual(dss.ctx)) != 0
end
UseActual() = UseActual(DSS_DEFAULT_CTX)

"""T/F flag to let Loads know to use the actual value in the curve rather than use the value as a multiplier. (Setter)"""
function UseActual(dss::DSSContext, Value::Bool)
    @checked Lib.LoadShapes_Set_UseActual(dss.ctx, Value ? 1 : 0)
end
UseActual(Value::Bool) = UseActual(DSS_DEFAULT_CTX, Value)

"""Interval of active loadshape in seconds (Getter)"""
function SInterval(dss::DSSContext)::Float64
    return @checked Lib.LoadShapes_Get_SInterval(dss.ctx)
end
SInterval() = SInterval(DSS_DEFAULT_CTX)

"""Interval of active loadshape in seconds (Setter)"""
function SInterval(dss::DSSContext, Value::Float64)
    @checked Lib.LoadShapes_Set_SInterval(dss.ctx, Value)
end
SInterval(Value::Float64) = SInterval(DSS_DEFAULT_CTX, Value)

"""LoadShape Index (Getter)"""
function Idx(dss::DSSContext)::Int
    return @checked Lib.LoadShapes_Get_idx(dss.ctx)
end
Idx() = Idx(DSS_DEFAULT_CTX)

"""LoadShape Index (Setter)"""
function Idx(dss::DSSContext, Value::Int)
    @checked Lib.LoadShapes_Set_idx(dss.ctx, Value)
end
Idx(Value::Int) = Idx(DSS_DEFAULT_CTX, Value)

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
function UseFloat32(dss::DSSContext)
    @checked Lib.LoadShapes_UseFloat32(dss.ctx)
end
UseFloat32() = UseFloat32(DSS_DEFAULT_CTX)

"""Converts the current LoadShape data to float64/double precision.
If there is no data or the data is already represented using float64, nothing is done.

(API Extension)"""
function UseFloat64(dss::DSSContext)
    @checked Lib.LoadShapes_UseFloat64(dss.ctx)
end
UseFloat64() = UseFloat64(DSS_DEFAULT_CTX)

end
