module XYCurves

using DocStringExtensions

using ..Lib
using ..Utils

@template (FUNCTIONS, METHODS) = """
                                 $(TYPEDSIGNATURES)
                                 $(DOCSTRING)
                                 """


"""Array of names of all XYCurve objects."""
function AllNames(dss::DSSContext)::Vector{String}
    return get_string_array(Lib.XYCurves_Get_AllNames, dss.ctx)
end
AllNames() = AllNames(DSS_DEFAULT_CTX)

"""Gets the name of the active XYCurve object."""
function Name(dss::DSSContext)::String
    return get_string(@checked Lib.XYCurves_Get_Name(dss.ctx))
end
Name() = Name(DSS_DEFAULT_CTX)

"""Sets a XYCurve object active by name."""
function Name(dss::DSSContext, Value::String)
    @checked Lib.XYCurves_Set_Name(dss.ctx, Value)
end
Name(Value::String) = Name(DSS_DEFAULT_CTX, Value)

"""Number of XYCurve Objects in Active Circuit"""
function Count(dss::DSSContext)::Int
    return @checked Lib.XYCurves_Get_Count(dss.ctx)
end
Count() = Count(DSS_DEFAULT_CTX)

"""
Sets first XYCurve to be active.
Returns 0 if none.
"""
function First(dss::DSSContext)::Int
    return @checked Lib.XYCurves_Get_First(dss.ctx)
end
First() = First(DSS_DEFAULT_CTX)

"""
Sets next XYCurve to be active.
Returns 0 if no more.
"""
function Next(dss::DSSContext)::Int
    return @checked Lib.XYCurves_Get_Next(dss.ctx)
end
Next() = Next(DSS_DEFAULT_CTX)

"""
Returns the index of the current active XYCurve (1-based)

(Getter)
"""
function Idx(dss::DSSContext)::Int
    return @checked Lib.XYCurves_Get_idx(dss.ctx)
end
Idx() = Idx(DSS_DEFAULT_CTX)

"""
Activate XYCurve by index (1-based)

(Setter)
"""
function Idx(dss::DSSContext, Value::Int)
    @checked Lib.XYCurves_Set_idx(dss.ctx, Value)
end
Idx(Value::Int) = Idx(DSS_DEFAULT_CTX, Value)

"""
Number of points in X-Y curve

Original COM help: https://opendss.epri.com/Npts1.html

(Getter)
"""
function Npts(dss::DSSContext)::Int
    return @checked Lib.XYCurves_Get_Npts(dss.ctx)
end
Npts() = Npts(DSS_DEFAULT_CTX)

"""
Number of points in X-Y curve

Original COM help: https://opendss.epri.com/Npts1.html

(Setter)
"""
function Npts(dss::DSSContext, Value::Int)
    @checked Lib.XYCurves_Set_Npts(dss.ctx, Value)
end
Npts(Value::Int) = Npts(DSS_DEFAULT_CTX, Value)

"""
Get X values as an array of doubles.

Original COM help: https://opendss.epri.com/Xarray.html

(Getter)
"""
function XArray(dss::DSSContext)::Vector{Float64}
    return get_float64_array(Lib.XYCurves_Get_Xarray, dss.ctx)
end
XArray() = XArray(DSS_DEFAULT_CTX)

"""
Set X values as an array of doubles. Remember to set Npts to max number expected values.

Original COM help: https://opendss.epri.com/Xarray.html

(Setter)
"""
function XArray(dss::DSSContext, Value::Vector{Float64})
    Value, ValuePtr, ValueCount = prepare_float64_array(Value)
    @checked Lib.XYCurves_Set_Xarray(dss.ctx, ValuePtr, ValueCount)
end
XArray(Value::Vector{Float64}) = XArray(DSS_DEFAULT_CTX, Value)

"""
Factor to scale X values from original curve

Original COM help: https://opendss.epri.com/Xscale.html

(Getter)
"""
function XScale(dss::DSSContext)::Float64
    return @checked Lib.XYCurves_Get_Xscale(dss.ctx)
end
XScale() = XScale(DSS_DEFAULT_CTX)

"""
Factor to scale X values from original curve

Original COM help: https://opendss.epri.com/Xscale.html

(Setter)
"""
function XScale(dss::DSSContext, Value::Float64)
    @checked Lib.XYCurves_Set_Xscale(dss.ctx, Value)
end
XScale(Value::Float64) = XScale(DSS_DEFAULT_CTX, Value)

"""
Amount to shift X value from original curve

Original COM help: https://opendss.epri.com/Xshift.html

(Getter)
"""
function XShift(dss::DSSContext)::Float64
    return @checked Lib.XYCurves_Get_Xshift(dss.ctx)
end
XShift() = XShift(DSS_DEFAULT_CTX)

"""
Amount to shift X value from original curve

Original COM help: https://opendss.epri.com/Xshift.html

(Setter)
"""
function XShift(dss::DSSContext, Value::Float64)
    @checked Lib.XYCurves_Set_Xshift(dss.ctx, Value)
end
XShift(Value::Float64) = XShift(DSS_DEFAULT_CTX, Value)

"""
Get Y values as an array of doubles.

Original COM help: https://opendss.epri.com/Yarray.html

(Getter)
"""
function YArray(dss::DSSContext)::Vector{Float64}
    return get_float64_array(Lib.XYCurves_Get_Yarray, dss.ctx)
end
YArray() = YArray(DSS_DEFAULT_CTX)

"""
Set Y values as an array of doubles. Remember to set Npts to max number expected values.

Original COM help: https://opendss.epri.com/Yarray.html

(Setter)
"""
function YArray(dss::DSSContext, Value::Vector{Float64})
    Value, ValuePtr, ValueCount = prepare_float64_array(Value)
    @checked Lib.XYCurves_Set_Yarray(dss.ctx, ValuePtr, ValueCount)
end
YArray(Value::Vector{Float64}) = YArray(DSS_DEFAULT_CTX, Value)

"""
Factor to scale Y values from original curve

Original COM help: https://opendss.epri.com/Yscale.html

(Getter)
"""
function YScale(dss::DSSContext)::Float64
    return @checked Lib.XYCurves_Get_Yscale(dss.ctx)
end
YScale() = YScale(DSS_DEFAULT_CTX)

"""
Factor to scale Y values from original curve

Original COM help: https://opendss.epri.com/Yscale.html

(Setter)
"""
function YScale(dss::DSSContext, Value::Float64)
    @checked Lib.XYCurves_Set_Yscale(dss.ctx, Value)
end
YScale(Value::Float64) = YScale(DSS_DEFAULT_CTX, Value)

"""
Amount to shift Y value from original curve

Original COM help: https://opendss.epri.com/Yshift.html

(Getter)
"""
function YShift(dss::DSSContext)::Float64
    return @checked Lib.XYCurves_Get_Yshift(dss.ctx)
end
YShift() = YShift(DSS_DEFAULT_CTX)

"""
Amount to shift Y value from original curve

Original COM help: https://opendss.epri.com/Yshift.html

(Setter)
"""
function YShift(dss::DSSContext, Value::Float64)
    @checked Lib.XYCurves_Set_Yshift(dss.ctx, Value)
end
YShift(Value::Float64) = YShift(DSS_DEFAULT_CTX, Value)

"""
Interpolated X value for a given Y (set Y first).

Original COM help: https://opendss.epri.com/x4.html

(Getter)
"""
function X(dss::DSSContext)::Float64
    return @checked Lib.XYCurves_Get_x(dss.ctx)
end
X() = X(DSS_DEFAULT_CTX)

"""
Set X value

Call Y getter aftewards to get the interpolated Y value according to this X value.

Original COM help: https://opendss.epri.com/x4.html

(Setter)
"""
function X(dss::DSSContext, Value::Float64)
    @checked Lib.XYCurves_Set_x(dss.ctx, Value)
end
X(Value::Float64) = X(DSS_DEFAULT_CTX, Value)

"""
Interpolated Y value for a given X (set X first).

Original COM help: https://opendss.epri.com/y1.html

(Getter)
"""
function Y(dss::DSSContext)::Float64
    return @checked Lib.XYCurves_Get_y(dss.ctx)
end
Y() = Y(DSS_DEFAULT_CTX)

"""
Set Y value

Call X getter aftewards to get the interpolated X value according to this Y value.

Original COM help: https://opendss.epri.com/y1.html

(Setter)
"""
function Y(dss::DSSContext, Value::Float64)
    @checked Lib.XYCurves_Set_y(dss.ctx, Value)
end
Y(Value::Float64) = Y(DSS_DEFAULT_CTX, Value)

end
