module TCC_Curve
using ..Enums.SetterFlags: SetterFlagsT
import Base: convert
using ..Common
using DocStringExtensions
@template (FUNCTIONS, METHODS) = """
                                 $(TYPEDSIGNATURES)
                                 $(DOCSTRING)
                                 """


const _cls_name = "TCC_Curve"
const _cls_idx = 7

module _PropertyIndex
const NPts = Int32(1)
const C_Array = Int32(2)
const T_Array = Int32(3)
const Like = Int32(4)
end

struct TCC_CurveObj <: AbstractDSSObj
    ptr::Ptr{Cvoid}
    dss::DSSContext
end
export TCC_CurveObj
Common._wrap_dss_obj(::Val{_cls_idx}, ptr::Ptr{Cvoid}, dss::DSSContext) = TCC_CurveObj(ptr, dss)
const Obj = TCC_CurveObj

function Base.show(io::IO, obj::TCC_CurveObj) 
    name = obj_get_str(obj, obj.dss.capi.Obj_GetFullName)
    print(name)
end


include("dss_object.jl")


"""
Number of points to expect in time-current arrays.

Name: `NPts`

(Getter)
"""
function NPts(obj::Obj)::Int32
    obj_get_int32(obj, _PropertyIndex.NPts)
end

"""
Number of points to expect in time-current arrays.

Name: `NPts`

(Setter)
"""
function NPts(obj::Obj, value::Int32, flags::SetterFlagsT=SetterFlagsT(0))
    obj_set_int32(obj, _PropertyIndex.NPts, value, flags)
end

"""
Array of current (or voltage) values corresponding to time values (see help on T_Array).

Name: `C_Array`

(Getter)
"""
function C_Array(obj::Obj)::Vector{Float64}
    obj_get_float64s(obj, _PropertyIndex.C_Array)
end

"""
Array of current (or voltage) values corresponding to time values (see help on T_Array).

Name: `C_Array`

(Setter)
"""
function C_Array(obj::Obj, value::Vector{Float64}, flags::SetterFlagsT=SetterFlagsT(0))
    obj_get_float64s(obj, _PropertyIndex.C_Array, value, flags)
end

"""
Array of time values in sec. Typical array syntax: 
t_array = (1, 2, 3, 4, ...)

Can also substitute a file designation: 
t_array =  (file=filename)

The specified file has one value per line.

Name: `T_Array`

(Getter)
"""
function T_Array(obj::Obj)::Vector{Float64}
    obj_get_float64s(obj, _PropertyIndex.T_Array)
end

"""
Array of time values in sec. Typical array syntax: 
t_array = (1, 2, 3, 4, ...)

Can also substitute a file designation: 
t_array =  (file=filename)

The specified file has one value per line.

Name: `T_Array`

(Setter)
"""
function T_Array(obj::Obj, value::Vector{Float64}, flags::SetterFlagsT=SetterFlagsT(0))
    obj_get_float64s(obj, _PropertyIndex.T_Array, value, flags)
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

end # module TCC_Curve
export TCC_Curve
