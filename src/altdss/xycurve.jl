module XYcurve
using ..Enums.SetterFlags: SetterFlagsT
import Base: convert
using ..Common
using DocStringExtensions
@template (FUNCTIONS, METHODS) = """
                                 $(TYPEDSIGNATURES)
                                 $(DOCSTRING)
                                 """


const _cls_name = "XYcurve"
const _cls_idx = 5

module _PropertyIndex
const NPts = Int32(1)
const Points = Int32(2)
const YArray = Int32(3)
const XArray = Int32(4)
const CSVFile = Int32(5)
const SngFile = Int32(6)
const DblFile = Int32(7)
const X = Int32(8)
const Y = Int32(9)
const XShift = Int32(10)
const YShift = Int32(11)
const XScale = Int32(12)
const YScale = Int32(13)
const Like = Int32(14)
end

struct XYcurveObj <: AbstractDSSObj
    ptr::Ptr{Cvoid}
    dss::DSSContext
end
export XYcurveObj
Common._wrap_dss_obj(::Val{_cls_idx}, ptr::Ptr{Cvoid}, dss::DSSContext) = XYcurveObj(ptr, dss)
const Obj = XYcurveObj

function Base.show(io::IO, obj::XYcurveObj) 
    name = obj_get_str(obj, obj.dss.capi.Obj_GetFullName)
    print(name)
end


include("dss_object.jl")


"""
Max number of points to expect in curve. This could get reset to the actual number of points defined if less than specified.

Name: `NPts`

(Getter)
"""
function NPts(obj::Obj)::Int32
    obj_get_int32(obj, _PropertyIndex.NPts)
end

"""
Max number of points to expect in curve. This could get reset to the actual number of points defined if less than specified.

Name: `NPts`

(Setter)
"""
function NPts(obj::Obj, value::Int32, flags::SetterFlagsT=SetterFlagsT(0))
    obj_set_int32(obj, _PropertyIndex.NPts, value, flags)
end

"""
Alternate way to enter Y values. Enter an array of Y values corresponding to the X values.  You can also use the syntax: 
Yarray = (file=filename)     !for text file one value per line
Yarray = (dblfile=filename)  !for packed file of doubles
Yarray = (sngfile=filename)  !for packed file of singles 

Note: this property will reset Npts to a smaller value if the  number of values in the files are fewer.

Name: `YArray`

(Getter)
"""
function YArray(obj::Obj)::Vector{Float64}
    obj_get_float64s(obj, _PropertyIndex.YArray)
end

"""
Alternate way to enter Y values. Enter an array of Y values corresponding to the X values.  You can also use the syntax: 
Yarray = (file=filename)     !for text file one value per line
Yarray = (dblfile=filename)  !for packed file of doubles
Yarray = (sngfile=filename)  !for packed file of singles 

Note: this property will reset Npts to a smaller value if the  number of values in the files are fewer.

Name: `YArray`

(Setter)
"""
function YArray(obj::Obj, value::Vector{Float64}, flags::SetterFlagsT=SetterFlagsT(0))
    obj_get_float64s(obj, _PropertyIndex.YArray, value, flags)
end

"""
Alternate way to enter X values. Enter an array of X values corresponding to the Y values.  You can also use the syntax: 
Xarray = (file=filename)     !for text file one value per line
Xarray = (dblfile=filename)  !for packed file of doubles
Xarray = (sngfile=filename)  !for packed file of singles 

Note: this property will reset Npts to a smaller value if the  number of values in the files are fewer.

Name: `XArray`

(Getter)
"""
function XArray(obj::Obj)::Vector{Float64}
    obj_get_float64s(obj, _PropertyIndex.XArray)
end

"""
Alternate way to enter X values. Enter an array of X values corresponding to the Y values.  You can also use the syntax: 
Xarray = (file=filename)     !for text file one value per line
Xarray = (dblfile=filename)  !for packed file of doubles
Xarray = (sngfile=filename)  !for packed file of singles 

Note: this property will reset Npts to a smaller value if the  number of values in the files are fewer.

Name: `XArray`

(Setter)
"""
function XArray(obj::Obj, value::Vector{Float64}, flags::SetterFlagsT=SetterFlagsT(0))
    obj_get_float64s(obj, _PropertyIndex.XArray, value, flags)
end

"""
Switch input of X-Y curve data to a CSV file containing X, Y points one per line. NOTE: This action may reset the number of points to a lower value.

Name: `CSVFile`

(Getter)
"""
function CSVFile(obj::Obj)::String
    obj_get_str(obj, _PropertyIndex.CSVFile)
end

"""
Switch input of X-Y curve data to a CSV file containing X, Y points one per line. NOTE: This action may reset the number of points to a lower value.

Name: `CSVFile`

(Setter)
"""
function CSVFile(obj::Obj, value::String, flags::SetterFlagsT=SetterFlagsT(0))
    obj_set_str(obj, _PropertyIndex.CSVFile, value, flags)
end

"""
Switch input of X-Y curve data to a binary file of SINGLES containing X, Y points packed one after another. NOTE: This action may reset the number of points to a lower value.

Name: `SngFile`

(Getter)
"""
function SngFile(obj::Obj)::String
    obj_get_str(obj, _PropertyIndex.SngFile)
end

"""
Switch input of X-Y curve data to a binary file of SINGLES containing X, Y points packed one after another. NOTE: This action may reset the number of points to a lower value.

Name: `SngFile`

(Setter)
"""
function SngFile(obj::Obj, value::String, flags::SetterFlagsT=SetterFlagsT(0))
    obj_set_str(obj, _PropertyIndex.SngFile, value, flags)
end

"""
Switch input of X-Y  curve data to a binary file of DOUBLES containing X, Y points packed one after another. NOTE: This action may reset the number of points to a lower value.

Name: `DblFile`

(Getter)
"""
function DblFile(obj::Obj)::String
    obj_get_str(obj, _PropertyIndex.DblFile)
end

"""
Switch input of X-Y  curve data to a binary file of DOUBLES containing X, Y points packed one after another. NOTE: This action may reset the number of points to a lower value.

Name: `DblFile`

(Setter)
"""
function DblFile(obj::Obj, value::String, flags::SetterFlagsT=SetterFlagsT(0))
    obj_set_str(obj, _PropertyIndex.DblFile, value, flags)
end

"""
Enter a value and then retrieve the interpolated Y value from the Y property. On input shifted then scaled to original curve. Scaled then shifted on output.

Name: `X`

(Getter)
"""
function X(obj::Obj)::Float64
    obj_get_float64(obj, _PropertyIndex.X)
end

"""
Enter a value and then retrieve the interpolated Y value from the Y property. On input shifted then scaled to original curve. Scaled then shifted on output.

Name: `X`

(Setter)
"""
function X(obj::Obj, value::Float64, flags::SetterFlagsT=SetterFlagsT(0))
    obj_set_float64(obj, _PropertyIndex.X, value, flags)
end

"""
Enter a value and then retrieve the interpolated X value from the X property. On input shifted then scaled to original curve. Scaled then shifted on output.

Name: `Y`

(Getter)
"""
function Y(obj::Obj)::Float64
    obj_get_float64(obj, _PropertyIndex.Y)
end

"""
Enter a value and then retrieve the interpolated X value from the X property. On input shifted then scaled to original curve. Scaled then shifted on output.

Name: `Y`

(Setter)
"""
function Y(obj::Obj, value::Float64, flags::SetterFlagsT=SetterFlagsT(0))
    obj_set_float64(obj, _PropertyIndex.Y, value, flags)
end

"""
Shift X property values (in/out) by this amount of offset. Does not change original definition of arrays.

Name: `XShift`
Default: 0.0

(Getter)
"""
function XShift(obj::Obj)::Float64
    obj_get_float64(obj, _PropertyIndex.XShift)
end

"""
Shift X property values (in/out) by this amount of offset. Does not change original definition of arrays.

Name: `XShift`
Default: 0.0

(Setter)
"""
function XShift(obj::Obj, value::Float64, flags::SetterFlagsT=SetterFlagsT(0))
    obj_set_float64(obj, _PropertyIndex.XShift, value, flags)
end

"""
Shift Y property values (in/out) by this amount of offset. Does not change original definition of arrays.

Name: `YShift`
Default: 0.0

(Getter)
"""
function YShift(obj::Obj)::Float64
    obj_get_float64(obj, _PropertyIndex.YShift)
end

"""
Shift Y property values (in/out) by this amount of offset. Does not change original definition of arrays.

Name: `YShift`
Default: 0.0

(Setter)
"""
function YShift(obj::Obj, value::Float64, flags::SetterFlagsT=SetterFlagsT(0))
    obj_set_float64(obj, _PropertyIndex.YShift, value, flags)
end

"""
Scale X property values (in/out) by this factor. Does not change original definition of arrays.

Name: `XScale`
Default: 1.0

(Getter)
"""
function XScale(obj::Obj)::Float64
    obj_get_float64(obj, _PropertyIndex.XScale)
end

"""
Scale X property values (in/out) by this factor. Does not change original definition of arrays.

Name: `XScale`
Default: 1.0

(Setter)
"""
function XScale(obj::Obj, value::Float64, flags::SetterFlagsT=SetterFlagsT(0))
    obj_set_float64(obj, _PropertyIndex.XScale, value, flags)
end

"""
Scale Y property values (in/out) by this factor. Does not change original definition of arrays.

Name: `YScale`
Default: 1.0

(Getter)
"""
function YScale(obj::Obj)::Float64
    obj_get_float64(obj, _PropertyIndex.YScale)
end

"""
Scale Y property values (in/out) by this factor. Does not change original definition of arrays.

Name: `YScale`
Default: 1.0

(Setter)
"""
function YScale(obj::Obj, value::Float64, flags::SetterFlagsT=SetterFlagsT(0))
    obj_set_float64(obj, _PropertyIndex.YScale, value, flags)
end

"""
Make like another object, e.g.:

New Capacitor.C2 like=c1  ...

**Deprecated:** `Like` has been deprecated since at least 2021, see https://sourceforge.net/p/electricdss/discussion/861977/thread/8b59d21eb6/#b57c/f668

Name: `Like`
"""
function Like(obj::Obj, value::String)
    obj_set_str(obj, _PropertyIndex.Like, value)
end

end # module XYcurve
export XYcurve
