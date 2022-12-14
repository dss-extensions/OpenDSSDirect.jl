
module XYCurves

using DocStringExtensions

using ..Lib
using ..Utils

@template (FUNCTIONS, METHODS) = """
                                 $(TYPEDSIGNATURES)
                                 $(DOCSTRING)
                                 """

"""List of strings with all XYCurve names"""
function AllNames()::Vector{String}
    return get_string_array(Lib.XYCurves_Get_AllNames, C_NULL_CTX)
end

"""Number of XYCurve Objects"""
function Count()::Int
    return @checked Lib.XYCurves_Get_Count(C_NULL_CTX)
end

"""Sets first XYcurve object active; returns 0 if none."""
function First()::Int
    return @checked Lib.XYCurves_Get_First(C_NULL_CTX)
end

"""Name of active XYCurve Object (Getter)"""
function Name()::String
    return get_string(@checked Lib.XYCurves_Get_Name(C_NULL_CTX))
end

"""Name of active XYCurve Object (Setter)"""
function Name(Value::String)
    @checked Lib.XYCurves_Set_Name(C_NULL_CTX, Value)
end

"""Advances to next XYCurve object; returns 0 if no more objects of this class"""
function Next()::Int
    return @checked Lib.XYCurves_Get_Next(C_NULL_CTX)
end

"""Number of points in X-Y curve (Getter)"""
function Npts()::Int
    return @checked Lib.XYCurves_Get_Npts(C_NULL_CTX)
end

"""Number of points in X-Y curve (Setter)"""
function Npts(Value::Int)
    @checked Lib.XYCurves_Set_Npts(C_NULL_CTX, Value)
end

"""X values as a Array of doubles. Set Npts to max number expected if setting (Getter)"""
function XArray()::Vector{Float64}
    return get_float64_array(Lib.XYCurves_Get_Xarray, C_NULL_CTX)
end

"""X values as a Array of doubles. Set Npts to max number expected if setting (Setter)"""
function XArray(Value::Vector{Float64})
    Value, ValuePtr, ValueCount = prepare_float64_array(Value)
    @checked Lib.XYCurves_Set_Xarray(C_NULL_CTX, ValuePtr, ValueCount)
end

"""Factor to scale X values from original curve (Getter)"""
function XScale()::Float64
    return @checked Lib.XYCurves_Get_Xscale(C_NULL_CTX)
end

"""Factor to scale X values from original curve (Setter)"""
function XScale(Value::Float64)
    @checked Lib.XYCurves_Set_Xscale(C_NULL_CTX, Value)
end

"""Amount to shift X value from original curve (Getter)"""
function XShift()::Float64
    return @checked Lib.XYCurves_Get_Xshift(C_NULL_CTX)
end

"""Amount to shift X value from original curve (Setter)"""
function XShift(Value::Float64)
    @checked Lib.XYCurves_Set_Xshift(C_NULL_CTX, Value)
end

"""Y values in curve; Set Npts to max number expected if setting (Getter)"""
function YArray()::Vector{Float64}
    return get_float64_array(Lib.XYCurves_Get_Yarray, C_NULL_CTX)
end

"""Y values in curve; Set Npts to max number expected if setting (Setter)"""
function YArray(Value::Vector{Float64})
    Value, ValuePtr, ValueCount = prepare_float64_array(Value)
    @checked Lib.XYCurves_Set_Yarray(C_NULL_CTX, ValuePtr, ValueCount)
end

"""Factor to scale Y values from original curve. Represents a curve shift. (Getter)"""
function YScale()::Float64
    return @checked Lib.XYCurves_Get_Yscale(C_NULL_CTX)
end

"""Factor to scale Y values from original curve. Represents a curve shift. (Setter)"""
function YScale(Value::Float64)
    @checked Lib.XYCurves_Set_Yscale(C_NULL_CTX, Value)
end

"""Amount to shift Y value from original curve (Getter)"""
function YShift()::Float64
    return @checked Lib.XYCurves_Get_Yshift(C_NULL_CTX)
end

"""Amount to shift Y value from original curve (Setter)"""
function YShift(Value::Float64)
    @checked Lib.XYCurves_Set_Yshift(C_NULL_CTX, Value)
end

"""X value for given Y. (Getter)"""
function X()::Float64
    return @checked Lib.XYCurves_Get_x(C_NULL_CTX)
end

"""X value for given Y. (Setter)"""
function X(Value::Float64)
    @checked Lib.XYCurves_Set_x(C_NULL_CTX, Value)
end

"""Y value for given X. (Getter)"""
function Y()::Float64
    return @checked Lib.XYCurves_Get_y(C_NULL_CTX)
end

"""Y value for given X. (Setter)"""
function Y(Value::Float64)
    @checked Lib.XYCurves_Set_y(C_NULL_CTX, Value)
end

"""XYCurve Index (Getter)"""
function Idx()::Int
    return @checked Lib.XYCurves_Get_idx(C_NULL_CTX)
end

"""XYCurve Index (Setter)"""
function Idx(Value::Int)
    @checked Lib.XYCurves_Set_idx(C_NULL_CTX, Value)
end

end
