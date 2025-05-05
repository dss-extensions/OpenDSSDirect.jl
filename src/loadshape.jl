module LoadShape

using DocStringExtensions

using ..Lib
using ..Utils

@template (FUNCTIONS, METHODS) = """
                                 $(TYPEDSIGNATURES)
                                 $(DOCSTRING)
                                 """


"""Array of names of all LoadShape objects."""
function AllNames(dss::DSSContext)::Vector{String}
    return get_string_array(Lib.LoadShapes_Get_AllNames, dss.ctx)
end
AllNames() = AllNames(DSS_DEFAULT_CTX)

"""Gets the name of the active LoadShape object."""
function Name(dss::DSSContext)::String
    return get_string(@checked Lib.LoadShapes_Get_Name(dss.ctx))
end
Name() = Name(DSS_DEFAULT_CTX)

"""Sets a LoadShape object active by name."""
function Name(dss::DSSContext, Value::String)
    @checked Lib.LoadShapes_Set_Name(dss.ctx, Value)
end
Name(Value::String) = Name(DSS_DEFAULT_CTX, Value)

"""Number of LoadShapes in Active Circuit"""
function Count(dss::DSSContext)::Int
    return @checked Lib.LoadShapes_Get_Count(dss.ctx)
end
Count() = Count(DSS_DEFAULT_CTX)

"""
Sets first LoadShape to be active.
Returns 0 if none.
"""
function First(dss::DSSContext)::Int
    return @checked Lib.LoadShapes_Get_First(dss.ctx)
end
First() = First(DSS_DEFAULT_CTX)

"""
Sets next LoadShape to be active.
Returns 0 if no more.
"""
function Next(dss::DSSContext)::Int
    return @checked Lib.LoadShapes_Get_Next(dss.ctx)
end
Next() = Next(DSS_DEFAULT_CTX)

"""
Returns the index of the current active LoadShape (1-based)

(Getter)
"""
function Idx(dss::DSSContext)::Int
    return @checked Lib.LoadShapes_Get_idx(dss.ctx)
end
Idx() = Idx(DSS_DEFAULT_CTX)

"""
Activate LoadShape by index (1-based)

(Setter)
"""
function Idx(dss::DSSContext, Value::Int)
    @checked Lib.LoadShapes_Set_idx(dss.ctx, Value)
end
Idx(Value::Int) = Idx(DSS_DEFAULT_CTX, Value)

"""Create a new LoadShape, with default parameters"""
function New(dss::DSSContext, Name::String)::Int
    return @checked Lib.LoadShapes_New(dss.ctx, Name)
end
New(Name) = New(DSS_DEFAULT_CTX, Name)

"""Normalize the LoadShape data inplace"""
function Normalize(dss::DSSContext)
    @checked Lib.LoadShapes_Normalize(dss.ctx)
end
Normalize() = Normalize(DSS_DEFAULT_CTX)

"""
Fixed interval time value, in hours.

Original COM help: https://opendss.epri.com/HrInterval.html

(Getter)
"""
function HrInterval(dss::DSSContext)::Float64
    return @checked Lib.LoadShapes_Get_HrInterval(dss.ctx)
end
HrInterval() = HrInterval(DSS_DEFAULT_CTX)

"""
Fixed interval time value, in hours.

Original COM help: https://opendss.epri.com/HrInterval.html

(Setter)
"""
function HrInterval(dss::DSSContext, Value::Float64)
    @checked Lib.LoadShapes_Set_HrInterval(dss.ctx, Value)
end
HrInterval(Value::Float64) = HrInterval(DSS_DEFAULT_CTX, Value)

"""
Fixed Interval time value, in minutes

Original COM help: https://opendss.epri.com/MinInterval.html

(Getter)
"""
function MinInterval(dss::DSSContext)::Float64
    return @checked Lib.LoadShapes_Get_MinInterval(dss.ctx)
end
MinInterval() = MinInterval(DSS_DEFAULT_CTX)

"""
Fixed Interval time value, in minutes

Original COM help: https://opendss.epri.com/MinInterval.html

(Setter)
"""
function MinInterval(dss::DSSContext, Value::Float64)
    @checked Lib.LoadShapes_Set_MinInterval(dss.ctx, Value)
end
MinInterval(Value::Float64) = MinInterval(DSS_DEFAULT_CTX, Value)

"""
Get/set Number of points in active Loadshape.

Original COM help: https://opendss.epri.com/Npts.html

(Getter)
"""
function Npts(dss::DSSContext)::Int
    return @checked Lib.LoadShapes_Get_Npts(dss.ctx)
end
Npts() = Npts(DSS_DEFAULT_CTX)

"""
Get/set Number of points in active Loadshape.

Original COM help: https://opendss.epri.com/Npts.html

(Setter)
"""
function Npts(dss::DSSContext, Value::Int)
    @checked Lib.LoadShapes_Set_Npts(dss.ctx, Value)
end
Npts(Value::Int) = Npts(DSS_DEFAULT_CTX, Value)

"""
Base P value for normalization. Default is zero, meaning the peak will be used.

Original COM help: https://opendss.epri.com/Pbase.html

(Getter)
"""
function PBase(dss::DSSContext)::Float64
    return @checked Lib.LoadShapes_Get_PBase(dss.ctx)
end
PBase() = PBase(DSS_DEFAULT_CTX)

"""
Base P value for normalization. Default is zero, meaning the peak will be used.

Original COM help: https://opendss.epri.com/Pbase.html

(Setter)
"""
function PBase(dss::DSSContext, Value::Float64)
    @checked Lib.LoadShapes_Set_PBase(dss.ctx, Value)
end
PBase(Value::Float64) = PBase(DSS_DEFAULT_CTX, Value)

"""
Array of doubles for the P multiplier in the Loadshape.

Original COM help: https://opendss.epri.com/Pmult.html

(Getter)
"""
function PMult(dss::DSSContext)::Vector{Float64}
    return get_float64_array(Lib.LoadShapes_Get_Pmult, dss.ctx)
end
PMult() = PMult(DSS_DEFAULT_CTX)

"""
Array of doubles for the P multiplier in the Loadshape.

Original COM help: https://opendss.epri.com/Pmult.html

(Setter)
"""
function PMult(dss::DSSContext, Value::Vector{Float64})
    Value, ValuePtr, ValueCount = prepare_float64_array(Value)
    @checked Lib.LoadShapes_Set_Pmult(dss.ctx, ValuePtr, ValueCount)
end
PMult(Value::Vector{Float64}) = PMult(DSS_DEFAULT_CTX, Value)

"""
Base for normalizing Q curve. If left at zero, the peak value is used.

Original COM help: https://opendss.epri.com/Qbase.html

(Getter)
"""
function QBase(dss::DSSContext)::Float64
    return @checked Lib.LoadShapes_Get_Qbase(dss.ctx)
end
QBase() = QBase(DSS_DEFAULT_CTX)

"""
Base for normalizing Q curve. If left at zero, the peak value is used.

Original COM help: https://opendss.epri.com/Qbase.html

(Setter)
"""
function QBase(dss::DSSContext, Value::Float64)
    @checked Lib.LoadShapes_Set_Qbase(dss.ctx, Value)
end
QBase(Value::Float64) = QBase(DSS_DEFAULT_CTX, Value)

"""
Array of doubles containing the Q multipliers.

Original COM help: https://opendss.epri.com/Qmult.html

(Getter)
"""
function QMult(dss::DSSContext)::Vector{Float64}
    return get_float64_array(Lib.LoadShapes_Get_Qmult, dss.ctx)
end
QMult() = QMult(DSS_DEFAULT_CTX)

"""
Array of doubles containing the Q multipliers.

Original COM help: https://opendss.epri.com/Qmult.html

(Setter)
"""
function QMult(dss::DSSContext, Value::Vector{Float64})
    Value, ValuePtr, ValueCount = prepare_float64_array(Value)
    @checked Lib.LoadShapes_Set_Qmult(dss.ctx, ValuePtr, ValueCount)
end
QMult(Value::Vector{Float64}) = QMult(DSS_DEFAULT_CTX, Value)

"""
Time array in hours corresponding to P and Q multipliers when the Interval=0.

Original COM help: https://opendss.epri.com/TimeArray.html

(Getter)
"""
function TimeArray(dss::DSSContext)::Vector{Float64}
    return get_float64_array(Lib.LoadShapes_Get_TimeArray, dss.ctx)
end
TimeArray() = TimeArray(DSS_DEFAULT_CTX)

"""
Time array in hours corresponding to P and Q multipliers when the Interval=0.

Original COM help: https://opendss.epri.com/TimeArray.html

(Setter)
"""
function TimeArray(dss::DSSContext, Value::Vector{Float64})
    Value, ValuePtr, ValueCount = prepare_float64_array(Value)
    @checked Lib.LoadShapes_Set_TimeArray(dss.ctx, ValuePtr, ValueCount)
end
TimeArray(Value::Vector{Float64}) = TimeArray(DSS_DEFAULT_CTX, Value)

"""
Boolean flag to let Loads know to use the actual value in the curve rather than use the value as a multiplier.

Original COM help: https://opendss.epri.com/UseActual.html

(Getter)
"""
function UseActual(dss::DSSContext)::Bool
    return @checked(Lib.LoadShapes_Get_UseActual(dss.ctx)) != 0
end
UseActual() = UseActual(DSS_DEFAULT_CTX)

"""
Boolean flag to let Loads know to use the actual value in the curve rather than use the value as a multiplier.

Original COM help: https://opendss.epri.com/UseActual.html

(Setter)
"""
function UseActual(dss::DSSContext, Value::Bool)
    @checked Lib.LoadShapes_Set_UseActual(dss.ctx, Value ? 1 : 0)
end
UseActual(Value::Bool) = UseActual(DSS_DEFAULT_CTX, Value)

"""
Fixed interval time value, in seconds.

Original COM help: https://opendss.epri.com/Sinterval.html

(Getter)
"""
function SInterval(dss::DSSContext)::Float64
    return @checked Lib.LoadShapes_Get_SInterval(dss.ctx)
end
SInterval() = SInterval(DSS_DEFAULT_CTX)

"""
Fixed interval time value, in seconds.

Original COM help: https://opendss.epri.com/Sinterval.html

(Setter)
"""
function SInterval(dss::DSSContext, Value::Float64)
    @checked Lib.LoadShapes_Set_SInterval(dss.ctx, Value)
end
SInterval(Value::Float64) = SInterval(DSS_DEFAULT_CTX, Value)

# """kvar value at the time of max kW power.
# This is set automatically set upon reading in a loadshape, but for external-memory loadshapes, the user must provide the value.
# This property can also be used to override the value automatically computed or to retrieve the value computed.

# (Getter)
# **(API Extension)**"""
# function MaxQ()::Float64
#     return @checked Lib.LoadShapes_Get_MaxQ()
# end

# """kW value at the time of max power. This is set automatically set upon reading in a loadshape, but for external-memory loadshapes, the user must provide the value.
# This property can also be used to override the value automatically computed or to retrieve the value computed.

# (Setter)
# **(API Extension)**"""
# function MaxQ(Value::Float64)
#     return @checked Lib.LoadShapes_Set_MaxQ(Value)
# end

# """kW value at the time of max power. This is set automatically set upon reading in a loadshape, but for external-memory loadshapes, the user must provide the value.
# This property can also be used to override the value automatically computed or to retrieve the value computed.

# (Getter)
# **(API Extension)**"""
# function MaxP()::Float64
#     return @checked Lib.LoadShapes_Get_MaxP()
# end

# """kW value at the time of max power. This is set automatically set upon reading in a loadshape, but for external-memory loadshapes, the user must provide the value.
# This property can also be used to override the value automatically computed or to retrieve the value computed.

# (Setter)
# **(API Extension)**
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

# **(API Extension)**"""
# function Points(Npts::Int, HoursPtr, PMultPtr, QMultPtr, ExternalMemory::Bool, IsFloat32::Bool, Stride::Int)
#     return @checked Lib.LoadShapes_Set_Points(Nptr, HoursPtr, PMultPtr, QMultPtr, ExternalMemory, IsFloat32, Stride)
# end

"""
Converts the current LoadShape data to float32/single precision.
If there is no data or the data is already represented using float32, nothing is done.

**(API Extension)**
"""
function UseFloat32(dss::DSSContext)
    @checked Lib.LoadShapes_UseFloat32(dss.ctx)
end
UseFloat32() = UseFloat32(DSS_DEFAULT_CTX)

"""
Converts the current LoadShape data to float64/double precision.
If there is no data or the data is already represented using float64, nothing is done.

**(API Extension)**
"""
function UseFloat64(dss::DSSContext)
    @checked Lib.LoadShapes_UseFloat64(dss.ctx)
end
UseFloat64() = UseFloat64(DSS_DEFAULT_CTX)

end
