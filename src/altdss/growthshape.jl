module GrowthShape
using ..Enums.SetterFlags: SetterFlagsT
import Base: convert
using ..Common
using DocStringExtensions
@template (FUNCTIONS, METHODS) = """
                                 $(TYPEDSIGNATURES)
                                 $(DOCSTRING)
                                 """


const _cls_name = "GrowthShape"
const _cls_idx = 6

module _PropertyIndex
const NPts = Int32(1)
const Year = Int32(2)
const Mult = Int32(3)
const CSVFile = Int32(4)
const SngFile = Int32(5)
const DblFile = Int32(6)
const Like = Int32(7)
end

struct GrowthShapeObj <: AbstractDSSObj
    ptr::Ptr{Cvoid}
    dss::DSSContext
end
export GrowthShapeObj
Common._wrap_dss_obj(::Val{_cls_idx}, ptr::Ptr{Cvoid}, dss::DSSContext) = GrowthShapeObj(ptr, dss)
const Obj = GrowthShapeObj

function Base.show(io::IO, obj::GrowthShapeObj) 
    name = obj_get_str(obj, obj.dss.capi.Obj_GetFullName)
    print(name)
end


include("dss_object.jl")


"""
Number of points to expect in subsequent vector.

Name: `NPts`

(Getter)
"""
function NPts(obj::Obj)::Int32
    obj_get_int32(obj, _PropertyIndex.NPts)
end

"""
Number of points to expect in subsequent vector.

Name: `NPts`

(Setter)
"""
function NPts(obj::Obj, value::Int32, flags::SetterFlagsT=SetterFlagsT(0))
    obj_set_int32(obj, _PropertyIndex.NPts, value, flags)
end

"""
Array of year values, or a text file spec, corresponding to the multipliers. Enter only those years where the growth changes. May be any integer sequence -- just so it is consistent. See help on Mult.

Name: `Year`

(Getter)
"""
function Year(obj::Obj)::Vector{Float64}
    obj_get_float64s(obj, _PropertyIndex.Year)
end

"""
Array of year values, or a text file spec, corresponding to the multipliers. Enter only those years where the growth changes. May be any integer sequence -- just so it is consistent. See help on Mult.

Name: `Year`

(Setter)
"""
function Year(obj::Obj, value::Vector{Float64}, flags::SetterFlagsT=SetterFlagsT(0))
    obj_get_float64s(obj, _PropertyIndex.Year, value, flags)
end

"""
Array of growth multiplier values, or a text file spec, corresponding to the year values. Enter the multiplier by which you would multiply the previous year's load to get the present year's.

Examples:

  Year = [1, 2, 5]   Mult=[1.05, 1.025, 1.02].
  Year= (File=years.txt) Mult= (file=mults.txt).

Text files contain one value per line.

Name: `Mult`

(Getter)
"""
function Mult(obj::Obj)::Vector{Float64}
    obj_get_float64s(obj, _PropertyIndex.Mult)
end

"""
Array of growth multiplier values, or a text file spec, corresponding to the year values. Enter the multiplier by which you would multiply the previous year's load to get the present year's.

Examples:

  Year = [1, 2, 5]   Mult=[1.05, 1.025, 1.02].
  Year= (File=years.txt) Mult= (file=mults.txt).

Text files contain one value per line.

Name: `Mult`

(Setter)
"""
function Mult(obj::Obj, value::Vector{Float64}, flags::SetterFlagsT=SetterFlagsT(0))
    obj_get_float64s(obj, _PropertyIndex.Mult, value, flags)
end

"""
Switch input of growth curve data to a csv file containing (year, mult) points, one per line.

Name: `CSVFile`

(Getter)
"""
function CSVFile(obj::Obj)::String
    obj_get_str(obj, _PropertyIndex.CSVFile)
end

"""
Switch input of growth curve data to a csv file containing (year, mult) points, one per line.

Name: `CSVFile`

(Setter)
"""
function CSVFile(obj::Obj, value::String, flags::SetterFlagsT=SetterFlagsT(0))
    obj_set_str(obj, _PropertyIndex.CSVFile, value, flags)
end

"""
Switch input of growth curve data to a binary file of singles containing (year, mult) points, packed one after another.

Name: `SngFile`

(Getter)
"""
function SngFile(obj::Obj)::String
    obj_get_str(obj, _PropertyIndex.SngFile)
end

"""
Switch input of growth curve data to a binary file of singles containing (year, mult) points, packed one after another.

Name: `SngFile`

(Setter)
"""
function SngFile(obj::Obj, value::String, flags::SetterFlagsT=SetterFlagsT(0))
    obj_set_str(obj, _PropertyIndex.SngFile, value, flags)
end

"""
Switch input of growth curve data to a binary file of doubles containing (year, mult) points, packed one after another.

Name: `DblFile`

(Getter)
"""
function DblFile(obj::Obj)::String
    obj_get_str(obj, _PropertyIndex.DblFile)
end

"""
Switch input of growth curve data to a binary file of doubles containing (year, mult) points, packed one after another.

Name: `DblFile`

(Setter)
"""
function DblFile(obj::Obj, value::String, flags::SetterFlagsT=SetterFlagsT(0))
    obj_set_str(obj, _PropertyIndex.DblFile, value, flags)
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

end # module GrowthShape
export GrowthShape
