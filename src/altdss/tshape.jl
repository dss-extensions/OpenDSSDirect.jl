module TShape
using ..Enums.SetterFlags: SetterFlagsT
using ..Enums: TShapeAction
import Base: convert
using ..Common
using DocStringExtensions
@template (FUNCTIONS, METHODS) = """
                                 $(TYPEDSIGNATURES)
                                 $(DOCSTRING)
                                 """


const _cls_name = "TShape"
const _cls_idx = 3

module _PropertyIndex
const NPts = Int32(1)
const Interval = Int32(2)
const Temp = Int32(3)
const Hour = Int32(4)
const Mean = Int32(5)
const StdDev = Int32(6)
const CSVFile = Int32(7)
const SngFile = Int32(8)
const DblFile = Int32(9)
const SInterval = Int32(10)
const MInterval = Int32(11)
const Action = Int32(12)
const Like = Int32(13)
end

struct TShapeObj <: AbstractDSSObj
    ptr::Ptr{Cvoid}
    dss::DSSContext
end
export TShapeObj
Common._wrap_dss_obj(::Val{_cls_idx}, ptr::Ptr{Cvoid}, dss::DSSContext) = TShapeObj(ptr, dss)
const Obj = TShapeObj

function Base.show(io::IO, obj::TShapeObj) 
    name = obj_get_str(obj, obj.dss.capi.Obj_GetFullName)
    print(name)
end


include("dss_object.jl")


"""
Max number of points to expect in temperature shape vectors. This gets reset to the number of Temperature values found if less than specified.

Name: `NPts`

(Getter)
"""
function NPts(obj::Obj)::Int32
    obj_get_int32(obj, _PropertyIndex.NPts)
end

"""
Max number of points to expect in temperature shape vectors. This gets reset to the number of Temperature values found if less than specified.

Name: `NPts`

(Setter)
"""
function NPts(obj::Obj, value::Int32, flags::SetterFlagsT=SetterFlagsT(0))
    obj_set_int32(obj, _PropertyIndex.NPts, value, flags)
end

"""
Time interval for fixed interval data, hrs. Default = 1. If Interval = 0 then time data (in hours) may be at irregular intervals and time value must be specified using either the Hour property or input files. Then values are interpolated when Interval=0, but not for fixed interval data.  

See also "sinterval" and "minterval".

Name: `Interval`
Default: 1.0

(Getter)
"""
function Interval(obj::Obj)::Float64
    obj_get_float64(obj, _PropertyIndex.Interval)
end

"""
Time interval for fixed interval data, hrs. Default = 1. If Interval = 0 then time data (in hours) may be at irregular intervals and time value must be specified using either the Hour property or input files. Then values are interpolated when Interval=0, but not for fixed interval data.  

See also "sinterval" and "minterval".

Name: `Interval`
Default: 1.0

(Setter)
"""
function Interval(obj::Obj, value::Float64, flags::SetterFlagsT=SetterFlagsT(0))
    obj_set_float64(obj, _PropertyIndex.Interval, value, flags)
end

"""
Array of temperature values.  Units should be compatible with the object using the data. You can also use the syntax: 
Temp = (file=filename)     !for text file one value per line
Temp = (dblfile=filename)  !for packed file of doubles
Temp = (sngfile=filename)  !for packed file of singles 

Note: this property will reset Npts if the  number of values in the files are fewer.

Name: `Temp`

(Getter)
"""
function Temp(obj::Obj)::Vector{Float64}
    obj_get_float64s(obj, _PropertyIndex.Temp)
end

"""
Array of temperature values.  Units should be compatible with the object using the data. You can also use the syntax: 
Temp = (file=filename)     !for text file one value per line
Temp = (dblfile=filename)  !for packed file of doubles
Temp = (sngfile=filename)  !for packed file of singles 

Note: this property will reset Npts if the  number of values in the files are fewer.

Name: `Temp`

(Setter)
"""
function Temp(obj::Obj, value::Vector{Float64}, flags::SetterFlagsT=SetterFlagsT(0))
    obj_get_float64s(obj, _PropertyIndex.Temp, value, flags)
end

"""
Array of hour values. Only necessary to define this property for variable interval data. If the data are fixed interval, do not use this property. You can also use the syntax: 
hour = (file=filename)     !for text file one value per line
hour = (dblfile=filename)  !for packed file of doubles
hour = (sngfile=filename)  !for packed file of singles 

Name: `Hour`

(Getter)
"""
function Hour(obj::Obj)::Vector{Float64}
    obj_get_float64s(obj, _PropertyIndex.Hour)
end

"""
Array of hour values. Only necessary to define this property for variable interval data. If the data are fixed interval, do not use this property. You can also use the syntax: 
hour = (file=filename)     !for text file one value per line
hour = (dblfile=filename)  !for packed file of doubles
hour = (sngfile=filename)  !for packed file of singles 

Name: `Hour`

(Setter)
"""
function Hour(obj::Obj, value::Vector{Float64}, flags::SetterFlagsT=SetterFlagsT(0))
    obj_get_float64s(obj, _PropertyIndex.Hour, value, flags)
end

"""
Mean of the temperature curve values.  This is computed on demand the first time a value is needed.  However, you may set it to another value independently. Used for Monte Carlo load simulations.

Name: `Mean`

(Getter)
"""
function Mean(obj::Obj)::Float64
    obj_get_float64(obj, _PropertyIndex.Mean)
end

"""
Mean of the temperature curve values.  This is computed on demand the first time a value is needed.  However, you may set it to another value independently. Used for Monte Carlo load simulations.

Name: `Mean`

(Setter)
"""
function Mean(obj::Obj, value::Float64, flags::SetterFlagsT=SetterFlagsT(0))
    obj_set_float64(obj, _PropertyIndex.Mean, value, flags)
end

"""
Standard deviation of the temperatures.  This is computed on demand the first time a value is needed.  However, you may set it to another value independently.Is overwritten if you subsequently read in a curve

Used for Monte Carlo load simulations.

Name: `StdDev`

(Getter)
"""
function StdDev(obj::Obj)::Float64
    obj_get_float64(obj, _PropertyIndex.StdDev)
end

"""
Standard deviation of the temperatures.  This is computed on demand the first time a value is needed.  However, you may set it to another value independently.Is overwritten if you subsequently read in a curve

Used for Monte Carlo load simulations.

Name: `StdDev`

(Setter)
"""
function StdDev(obj::Obj, value::Float64, flags::SetterFlagsT=SetterFlagsT(0))
    obj_set_float64(obj, _PropertyIndex.StdDev, value, flags)
end

"""
Switch input of  temperature curve data to a csv file containing (hour, Temp) points, or simply (Temp) values for fixed time interval data, one per line. NOTE: This action may reset the number of points to a lower value.

Name: `CSVFile`

(Getter)
"""
function CSVFile(obj::Obj)::String
    obj_get_str(obj, _PropertyIndex.CSVFile)
end

"""
Switch input of  temperature curve data to a csv file containing (hour, Temp) points, or simply (Temp) values for fixed time interval data, one per line. NOTE: This action may reset the number of points to a lower value.

Name: `CSVFile`

(Setter)
"""
function CSVFile(obj::Obj, value::String, flags::SetterFlagsT=SetterFlagsT(0))
    obj_set_str(obj, _PropertyIndex.CSVFile, value, flags)
end

"""
Switch input of  temperature curve data to a binary file of singles containing (hour, Temp) points, or simply (Temp) values for fixed time interval data, packed one after another. NOTE: This action may reset the number of points to a lower value.

Name: `SngFile`

(Getter)
"""
function SngFile(obj::Obj)::String
    obj_get_str(obj, _PropertyIndex.SngFile)
end

"""
Switch input of  temperature curve data to a binary file of singles containing (hour, Temp) points, or simply (Temp) values for fixed time interval data, packed one after another. NOTE: This action may reset the number of points to a lower value.

Name: `SngFile`

(Setter)
"""
function SngFile(obj::Obj, value::String, flags::SetterFlagsT=SetterFlagsT(0))
    obj_set_str(obj, _PropertyIndex.SngFile, value, flags)
end

"""
Switch input of  temperature curve data to a binary file of doubles containing (hour, Temp) points, or simply (Temp) values for fixed time interval data, packed one after another. NOTE: This action may reset the number of points to a lower value.

Name: `DblFile`

(Getter)
"""
function DblFile(obj::Obj)::String
    obj_get_str(obj, _PropertyIndex.DblFile)
end

"""
Switch input of  temperature curve data to a binary file of doubles containing (hour, Temp) points, or simply (Temp) values for fixed time interval data, packed one after another. NOTE: This action may reset the number of points to a lower value.

Name: `DblFile`

(Setter)
"""
function DblFile(obj::Obj, value::String, flags::SetterFlagsT=SetterFlagsT(0))
    obj_set_str(obj, _PropertyIndex.DblFile, value, flags)
end

"""
Specify fixed interval in SECONDS. Alternate way to specify Interval property.

Name: `SInterval`

(Getter)
"""
function SInterval(obj::Obj)::Float64
    obj_get_float64(obj, _PropertyIndex.SInterval)
end

"""
Specify fixed interval in SECONDS. Alternate way to specify Interval property.

Name: `SInterval`

(Setter)
"""
function SInterval(obj::Obj, value::Float64, flags::SetterFlagsT=SetterFlagsT(0))
    obj_set_float64(obj, _PropertyIndex.SInterval, value, flags)
end

"""
Specify fixed interval in MINUTES. Alternate way to specify Interval property.

Name: `MInterval`

(Getter)
"""
function MInterval(obj::Obj)::Float64
    obj_get_float64(obj, _PropertyIndex.MInterval)
end

"""
Specify fixed interval in MINUTES. Alternate way to specify Interval property.

Name: `MInterval`

(Setter)
"""
function MInterval(obj::Obj, value::Float64, flags::SetterFlagsT=SetterFlagsT(0))
    obj_set_float64(obj, _PropertyIndex.MInterval, value, flags)
end

"""
{DblSave | SngSave} After defining temperature curve data... Setting action=DblSave or SngSave will cause the present "Temp" values to be written to either a packed file of double or single. The filename is the Tshape name. 

Name: `Action`
"""
function Action(obj::Obj, value::Union{Int,TShapeAction.T}, flags::SetterFlagsT=SetterFlagsT(0))
    obj_set_int32(obj, _PropertyIndex.Action, Int32(value), flags)
end

"""
{DblSave | SngSave} After defining temperature curve data... Setting action=DblSave or SngSave will cause the present "Temp" values to be written to either a packed file of double or single. The filename is the Tshape name. 

Name: `Action`
"""
function Action(obj::Obj, value::String, flags::SetterFlagsT=SetterFlagsT(0))
    obj_set_str(obj, _PropertyIndex.Action, value)
end

"""Shortcut to Action(TShapeAction.DblSave)"""
function DblSave(obj::Obj, flags::SetterFlagsT=SetterFlagsT(0))
    obj_set_int32(obj, _PropertyIndex.Action, TShapeAction.T.DblSave, flags)
end

"""Shortcut to Action(TShapeAction.SngSave)"""
function SngSave(obj::Obj, flags::SetterFlagsT=SetterFlagsT(0))
    obj_set_int32(obj, _PropertyIndex.Action, TShapeAction.T.SngSave, flags)
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

end # module TShape
export TShape
