module LoadShape
using ..Enums.SetterFlags: SetterFlagsT
using ..Enums: LoadShapeAction, LoadShapeInterpolation
import Base: convert
using ..Common
using DocStringExtensions
@template (FUNCTIONS, METHODS) = """
                                 $(TYPEDSIGNATURES)
                                 $(DOCSTRING)
                                 """


const _cls_name = "LoadShape"
const _cls_idx = 2

module _PropertyIndex
const NPts = Int32(1)
const Interval = Int32(2)
const Mult = Int32(3)
const Hour = Int32(4)
const Mean = Int32(5)
const StdDev = Int32(6)
const CSVFile = Int32(7)
const SngFile = Int32(8)
const DblFile = Int32(9)
const Action = Int32(10)
const QMult = Int32(11)
const UseActual = Int32(12)
const PMax = Int32(13)
const QMax = Int32(14)
const SInterval = Int32(15)
const MInterval = Int32(16)
const PBase = Int32(17)
const QBase = Int32(18)
const PMult = Int32(19)
const PQCSVFile = Int32(20)
const MemoryMapping = Int32(21)
const Interpolation = Int32(22)
const Like = Int32(23)
end

struct LoadShapeObj <: AbstractDSSObj
    ptr::Ptr{Cvoid}
    dss::DSSContext
end
export LoadShapeObj
Common._wrap_dss_obj(::Val{_cls_idx}, ptr::Ptr{Cvoid}, dss::DSSContext) = LoadShapeObj(ptr, dss)
const Obj = LoadShapeObj

function Base.show(io::IO, obj::LoadShapeObj) 
    name = obj_get_str(obj, obj.dss.capi.Obj_GetFullName)
    print(name)
end


include("dss_object.jl")
include("loadshape_extras.jl")


"""
Max number of points to expect in load shape vectors. This gets reset to the number of multiplier values found (in files only) if less than specified.

Name: `NPts`

(Getter)
"""
function NPts(obj::Obj)::Int32
    obj_get_int32(obj, _PropertyIndex.NPts)
end

"""
Max number of points to expect in load shape vectors. This gets reset to the number of multiplier values found (in files only) if less than specified.

Name: `NPts`

(Setter)
"""
function NPts(obj::Obj, value::Int32, flags::SetterFlagsT=SetterFlagsT(0))
    obj_set_int32(obj, _PropertyIndex.NPts, value, flags)
end

"""
Time interval for fixed interval data, hrs. If Interval is set to 0, then time data (in hours) may be at either regular or  irregular intervals and time value must be specified using either the Hour property or input files. Then values are interpolated when Interval=0, but not for fixed interval data.  

See also "sinterval" and "minterval".

Name: `Interval`
Units: hour
Default: 1.0

(Getter)
"""
function Interval(obj::Obj)::Float64
    obj_get_float64(obj, _PropertyIndex.Interval)
end

"""
Time interval for fixed interval data, hrs. If Interval is set to 0, then time data (in hours) may be at either regular or  irregular intervals and time value must be specified using either the Hour property or input files. Then values are interpolated when Interval=0, but not for fixed interval data.  

See also "sinterval" and "minterval".

Name: `Interval`
Units: hour
Default: 1.0

(Setter)
"""
function Interval(obj::Obj, value::Float64, flags::SetterFlagsT=SetterFlagsT(0))
    obj_set_float64(obj, _PropertyIndex.Interval, value, flags)
end

"""
Array of hour values. Only necessary to define for variable interval data (Interval=0). If you set Interval>0 to denote fixed interval data, DO NOT USE THIS PROPERTY. You can also use the syntax: 
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
Array of hour values. Only necessary to define for variable interval data (Interval=0). If you set Interval>0 to denote fixed interval data, DO NOT USE THIS PROPERTY. You can also use the syntax: 
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
Mean of the active power multipliers.  This is computed on demand the first time a value is needed.  However, you may set it to another value independently. Used for Monte Carlo load simulations.

Name: `Mean`

(Getter)
"""
function Mean(obj::Obj)::Float64
    obj_get_float64(obj, _PropertyIndex.Mean)
end

"""
Mean of the active power multipliers.  This is computed on demand the first time a value is needed.  However, you may set it to another value independently. Used for Monte Carlo load simulations.

Name: `Mean`

(Setter)
"""
function Mean(obj::Obj, value::Float64, flags::SetterFlagsT=SetterFlagsT(0))
    obj_set_float64(obj, _PropertyIndex.Mean, value, flags)
end

"""
Standard deviation of active power multipliers.  This is computed on demand the first time a value is needed.  However, you may set it to another value independently.Is overwritten if you subsequently read in a curve

Used for Monte Carlo load simulations.

Name: `StdDev`

(Getter)
"""
function StdDev(obj::Obj)::Float64
    obj_get_float64(obj, _PropertyIndex.StdDev)
end

"""
Standard deviation of active power multipliers.  This is computed on demand the first time a value is needed.  However, you may set it to another value independently.Is overwritten if you subsequently read in a curve

Used for Monte Carlo load simulations.

Name: `StdDev`

(Setter)
"""
function StdDev(obj::Obj, value::Float64, flags::SetterFlagsT=SetterFlagsT(0))
    obj_set_float64(obj, _PropertyIndex.StdDev, value, flags)
end

"""
Switch input of active power load curve data to a CSV text file containing (hour, mult) points, or simply (mult) values for fixed time interval data, one per line. NOTE: This action may reset the number of points to a lower value.

Name: `CSVFile`

(Getter)
"""
function CSVFile(obj::Obj)::String
    obj_get_str(obj, _PropertyIndex.CSVFile)
end

"""
Switch input of active power load curve data to a CSV text file containing (hour, mult) points, or simply (mult) values for fixed time interval data, one per line. NOTE: This action may reset the number of points to a lower value.

Name: `CSVFile`

(Setter)
"""
function CSVFile(obj::Obj, value::String, flags::SetterFlagsT=SetterFlagsT(0))
    obj_set_str(obj, _PropertyIndex.CSVFile, value, flags)
end

"""
Switch input of active power load curve data to a binary file of singles containing (hour, mult) points, or simply (mult) values for fixed time interval data, packed one after another. NOTE: This action may reset the number of points to a lower value.

Name: `SngFile`

(Getter)
"""
function SngFile(obj::Obj)::String
    obj_get_str(obj, _PropertyIndex.SngFile)
end

"""
Switch input of active power load curve data to a binary file of singles containing (hour, mult) points, or simply (mult) values for fixed time interval data, packed one after another. NOTE: This action may reset the number of points to a lower value.

Name: `SngFile`

(Setter)
"""
function SngFile(obj::Obj, value::String, flags::SetterFlagsT=SetterFlagsT(0))
    obj_set_str(obj, _PropertyIndex.SngFile, value, flags)
end

"""
Switch input of active power load curve data to a binary file of doubles containing (hour, mult) points, or simply (mult) values for fixed time interval data, packed one after another. NOTE: This action may reset the number of points to a lower value.

Name: `DblFile`

(Getter)
"""
function DblFile(obj::Obj)::String
    obj_get_str(obj, _PropertyIndex.DblFile)
end

"""
Switch input of active power load curve data to a binary file of doubles containing (hour, mult) points, or simply (mult) values for fixed time interval data, packed one after another. NOTE: This action may reset the number of points to a lower value.

Name: `DblFile`

(Setter)
"""
function DblFile(obj::Obj, value::String, flags::SetterFlagsT=SetterFlagsT(0))
    obj_set_str(obj, _PropertyIndex.DblFile, value, flags)
end

"""
{NORMALIZE | DblSave | SngSave} After defining load curve data, setting action=normalize will modify the multipliers so that the peak is 1.0. The mean and std deviation are recomputed.

Setting action=DblSave or SngSave will cause the present mult and qmult values to be written to either a packed file of double or single. The filename is the loadshape name. The mult array will have a "_P" appended on the file name and the qmult array, if it exists, will have "_Q" appended.

Name: `Action`
"""
function Action(obj::Obj, value::Union{Int,LoadShapeAction.T}, flags::SetterFlagsT=SetterFlagsT(0))
    obj_set_int32(obj, _PropertyIndex.Action, Int32(value), flags)
end

"""
{NORMALIZE | DblSave | SngSave} After defining load curve data, setting action=normalize will modify the multipliers so that the peak is 1.0. The mean and std deviation are recomputed.

Setting action=DblSave or SngSave will cause the present mult and qmult values to be written to either a packed file of double or single. The filename is the loadshape name. The mult array will have a "_P" appended on the file name and the qmult array, if it exists, will have "_Q" appended.

Name: `Action`
"""
function Action(obj::Obj, value::String, flags::SetterFlagsT=SetterFlagsT(0))
    obj_set_str(obj, _PropertyIndex.Action, value)
end

"""Shortcut to Action(LoadShapeAction.Normalize)"""
function Normalize(obj::Obj, flags::SetterFlagsT=SetterFlagsT(0))
    obj_set_int32(obj, _PropertyIndex.Action, LoadShapeAction.T.Normalize, flags)
end

"""Shortcut to Action(LoadShapeAction.DblSave)"""
function DblSave(obj::Obj, flags::SetterFlagsT=SetterFlagsT(0))
    obj_set_int32(obj, _PropertyIndex.Action, LoadShapeAction.T.DblSave, flags)
end

"""Shortcut to Action(LoadShapeAction.SngSave)"""
function SngSave(obj::Obj, flags::SetterFlagsT=SetterFlagsT(0))
    obj_set_int32(obj, _PropertyIndex.Action, LoadShapeAction.T.SngSave, flags)
end

"""
Array of multiplier values for reactive power (Q).  You can also use the syntax: 
qmult = (file=filename)     !for text file one value per line
qmult = (dblfile=filename)  !for packed file of doubles
qmult = (sngfile=filename)  !for packed file of singles 
qmult = (file=MyCSVFile.csv, col=4, header=yes)  !for multicolumn CSV files 

Name: `QMult`

(Getter)
"""
function QMult(obj::Obj)::Vector{Float64}
    obj_get_float64s(obj, _PropertyIndex.QMult)
end

"""
Array of multiplier values for reactive power (Q).  You can also use the syntax: 
qmult = (file=filename)     !for text file one value per line
qmult = (dblfile=filename)  !for packed file of doubles
qmult = (sngfile=filename)  !for packed file of singles 
qmult = (file=MyCSVFile.csv, col=4, header=yes)  !for multicolumn CSV files 

Name: `QMult`

(Setter)
"""
function QMult(obj::Obj, value::Vector{Float64}, flags::SetterFlagsT=SetterFlagsT(0))
    obj_get_float64s(obj, _PropertyIndex.QMult, value, flags)
end

"""
If true, signifies to Load, Generator, Vsource, or other objects to use the return value as the actual kW, kvar, kV, or other value rather than a multiplier. Nominally for AMI Load data but may be used for other functions.

Name: `UseActual`
Default: False

(Getter)
"""
function UseActual(obj::Obj)::Bool
    return obj_get_bool(obj, _PropertyIndex.UseActual)
end

"""
If true, signifies to Load, Generator, Vsource, or other objects to use the return value as the actual kW, kvar, kV, or other value rather than a multiplier. Nominally for AMI Load data but may be used for other functions.

Name: `UseActual`
Default: False

(Setter)
"""
function UseActual(obj::Obj, value::Bool, flags::SetterFlagsT=SetterFlagsT(0))
    obj_set_bool(obj, _PropertyIndex.UseActual, value, flags)
end

"""
kW value at the time of max power. Is automatically set upon reading in a loadshape. Use this property to override the value automatically computed or to retrieve the value computed.

Name: `PMax`
Units: kW
Default: 1.0

(Getter)
"""
function PMax(obj::Obj)::Float64
    obj_get_float64(obj, _PropertyIndex.PMax)
end

"""
kW value at the time of max power. Is automatically set upon reading in a loadshape. Use this property to override the value automatically computed or to retrieve the value computed.

Name: `PMax`
Units: kW
Default: 1.0

(Setter)
"""
function PMax(obj::Obj, value::Float64, flags::SetterFlagsT=SetterFlagsT(0))
    obj_set_float64(obj, _PropertyIndex.PMax, value, flags)
end

"""
kvar value at the time of max kW power. Is automatically set upon reading in a loadshape. Use this property to override the value automatically computed or to retrieve the value computed.

Name: `QMax`
Units: kvar
Default: 0.0

(Getter)
"""
function QMax(obj::Obj)::Float64
    obj_get_float64(obj, _PropertyIndex.QMax)
end

"""
kvar value at the time of max kW power. Is automatically set upon reading in a loadshape. Use this property to override the value automatically computed or to retrieve the value computed.

Name: `QMax`
Units: kvar
Default: 0.0

(Setter)
"""
function QMax(obj::Obj, value::Float64, flags::SetterFlagsT=SetterFlagsT(0))
    obj_set_float64(obj, _PropertyIndex.QMax, value, flags)
end

"""
Specify fixed interval in SECONDS. Alternate way to specify Interval property.

Name: `SInterval`
Units: s

(Getter)
"""
function SInterval(obj::Obj)::Float64
    obj_get_float64(obj, _PropertyIndex.SInterval)
end

"""
Specify fixed interval in SECONDS. Alternate way to specify Interval property.

Name: `SInterval`
Units: s

(Setter)
"""
function SInterval(obj::Obj, value::Float64, flags::SetterFlagsT=SetterFlagsT(0))
    obj_set_float64(obj, _PropertyIndex.SInterval, value, flags)
end

"""
Specify fixed interval in MINUTES. Alternate way to specify Interval property.

Name: `MInterval`
Units: minute

(Getter)
"""
function MInterval(obj::Obj)::Float64
    obj_get_float64(obj, _PropertyIndex.MInterval)
end

"""
Specify fixed interval in MINUTES. Alternate way to specify Interval property.

Name: `MInterval`
Units: minute

(Setter)
"""
function MInterval(obj::Obj, value::Float64, flags::SetterFlagsT=SetterFlagsT(0))
    obj_set_float64(obj, _PropertyIndex.MInterval, value, flags)
end

"""
Base P value for normalization. Default is zero, meaning the peak will be used.

Name: `PBase`
Units: kW
Default: 0.0

(Getter)
"""
function PBase(obj::Obj)::Float64
    obj_get_float64(obj, _PropertyIndex.PBase)
end

"""
Base P value for normalization. Default is zero, meaning the peak will be used.

Name: `PBase`
Units: kW
Default: 0.0

(Setter)
"""
function PBase(obj::Obj, value::Float64, flags::SetterFlagsT=SetterFlagsT(0))
    obj_set_float64(obj, _PropertyIndex.PBase, value, flags)
end

"""
Base Q value for normalization. Default is zero, meaning the peak will be used.

Name: `QBase`
Units: kvar
Default: 0.0

(Getter)
"""
function QBase(obj::Obj)::Float64
    obj_get_float64(obj, _PropertyIndex.QBase)
end

"""
Base Q value for normalization. Default is zero, meaning the peak will be used.

Name: `QBase`
Units: kvar
Default: 0.0

(Setter)
"""
function QBase(obj::Obj, value::Float64, flags::SetterFlagsT=SetterFlagsT(0))
    obj_set_float64(obj, _PropertyIndex.QBase, value, flags)
end

"""
Synonym for "mult".

Name: `PMult`

(Getter)
"""
function PMult(obj::Obj)::Vector{Float64}
    obj_get_float64s(obj, _PropertyIndex.PMult)
end

"""
Synonym for "mult".

Name: `PMult`

(Setter)
"""
function PMult(obj::Obj, value::Vector{Float64}, flags::SetterFlagsT=SetterFlagsT(0))
    obj_get_float64s(obj, _PropertyIndex.PMult, value, flags)
end

"""
Switch input to a CSV text file containing (active, reactive) power (P, Q) multiplier pairs, one per row. 
If the interval=0, there should be 3 items on each line: (hour, Pmult, Qmult)

Name: `PQCSVFile`

(Getter)
"""
function PQCSVFile(obj::Obj)::String
    obj_get_str(obj, _PropertyIndex.PQCSVFile)
end

"""
Switch input to a CSV text file containing (active, reactive) power (P, Q) multiplier pairs, one per row. 
If the interval=0, there should be 3 items on each line: (hour, Pmult, Qmult)

Name: `PQCSVFile`

(Setter)
"""
function PQCSVFile(obj::Obj, value::String, flags::SetterFlagsT=SetterFlagsT(0))
    obj_set_str(obj, _PropertyIndex.PQCSVFile, value, flags)
end

"""
Enables the memory mapping functionality for dealing with large amounts of load shapes. 
By default is False. Use it to accelerate the model loading when the containing a large number of load shapes.

Name: `MemoryMapping`
Default: False

(Getter)
"""
function MemoryMapping(obj::Obj)::Bool
    return obj_get_bool(obj, _PropertyIndex.MemoryMapping)
end

"""
Enables the memory mapping functionality for dealing with large amounts of load shapes. 
By default is False. Use it to accelerate the model loading when the containing a large number of load shapes.

Name: `MemoryMapping`
Default: False

(Setter)
"""
function MemoryMapping(obj::Obj, value::Bool, flags::SetterFlagsT=SetterFlagsT(0))
    obj_set_bool(obj, _PropertyIndex.MemoryMapping, value, flags)
end

"""
Defines the interpolation method used for connecting distant dots within the load shape.

By default is AVG (average), which will return a multiplier for missing intervals based on the closest multiplier in time.
EDGE interpolation keeps the last known value for missing intervals until the next defined multiplier arrives.

Name: `Interpolation`
Default: Avg

(Getter)
"""
function Interpolation(obj::Obj)::LoadShapeInterpolation.T
    LoadShapeInterpolation.T(obj_get_int32(obj, _PropertyIndex.Interpolation))
end

"""
Defines the interpolation method used for connecting distant dots within the load shape.

By default is AVG (average), which will return a multiplier for missing intervals based on the closest multiplier in time.
EDGE interpolation keeps the last known value for missing intervals until the next defined multiplier arrives.

Name: `Interpolation`
Default: Avg

(Setter)
"""
function Interpolation(obj::Obj, value::String, flags::SetterFlagsT=SetterFlagsT(0))
    obj_set_str(obj, _PropertyIndex.Interpolation, value, flags)
end

"""
Defines the interpolation method used for connecting distant dots within the load shape.

By default is AVG (average), which will return a multiplier for missing intervals based on the closest multiplier in time.
EDGE interpolation keeps the last known value for missing intervals until the next defined multiplier arrives.

Name: `Interpolation`
Default: Avg

(Setter)
"""
function Interpolation(obj::Obj, value::Union{Int,LoadShapeInterpolation.T}, flags::SetterFlagsT=SetterFlagsT(0))
    obj_set_int32(obj, _PropertyIndex.Interpolation, Int32(value), flags)
end

"""
Defines the interpolation method used for connecting distant dots within the load shape.

By default is AVG (average), which will return a multiplier for missing intervals based on the closest multiplier in time.
EDGE interpolation keeps the last known value for missing intervals until the next defined multiplier arrives.

Name: `Interpolation`
Default: Avg

(Getter)
"""
function Interpolation_str(obj::Obj)::String
    obj_get_str(obj, _PropertyIndex.Interpolation)
end

"""
Defines the interpolation method used for connecting distant dots within the load shape.

By default is AVG (average), which will return a multiplier for missing intervals based on the closest multiplier in time.
EDGE interpolation keeps the last known value for missing intervals until the next defined multiplier arrives.

Name: `Interpolation`
Default: Avg

(Setter)
"""
function Interpolation_str(obj::Obj, value::String, flags::SetterFlagsT=SetterFlagsT(0))
    Interpolation(obj, value, flags)
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

end # module LoadShape
export LoadShape
