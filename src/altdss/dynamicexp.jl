module DynamicExp
using ..Enums.SetterFlags: SetterFlagsT
using ..Enums: DynamicExpDomain
import Base: convert
using ..Common
using DocStringExtensions
@template (FUNCTIONS, METHODS) = """
                                 $(TYPEDSIGNATURES)
                                 $(DOCSTRING)
                                 """


const _cls_name = "DynamicExp"
const _cls_idx = 26

module _PropertyIndex
const NVariables = Int32(1)
const VarNames = Int32(2)
const Var = Int32(3)
const VarIdx = Int32(4)
const Expression = Int32(5)
const Domain = Int32(6)
const Like = Int32(7)
end

struct DynamicExpObj <: AbstractDSSObj
    ptr::Ptr{Cvoid}
    dss::DSSContext
end
export DynamicExpObj
Common._wrap_dss_obj(::Val{_cls_idx}, ptr::Ptr{Cvoid}, dss::DSSContext) = DynamicExpObj(ptr, dss)
const Obj = DynamicExpObj

function Base.show(io::IO, obj::DynamicExpObj) 
    name = obj_get_str(obj, obj.dss.capi.Obj_GetFullName)
    print(name)
end


include("dss_object.jl")


"""
(Int) Number of state variables to be considered in the differential equation.

Name: `NVariables`
Default: 0

(Getter)
"""
function NVariables(obj::Obj)::Int32
    obj_get_int32(obj, _PropertyIndex.NVariables)
end

"""
(Int) Number of state variables to be considered in the differential equation.

Name: `NVariables`
Default: 0

(Setter)
"""
function NVariables(obj::Obj, value::Int32, flags::SetterFlagsT=SetterFlagsT(0))
    obj_set_int32(obj, _PropertyIndex.NVariables, value, flags)
end

"""
([String]) Array of strings with the names of the state variables.

Name: `VarNames`

(Getter)
"""
function VarNames(obj::Obj)::Vector{String}
    obj_get_strs(obj, _PropertyIndex.VarNames)
end

"""
([String]) Array of strings with the names of the state variables.

Name: `VarNames`

(Setter)
"""
function VarNames(obj::Obj, value::Vector{String}, flags::SetterFlagsT=SetterFlagsT(0))
    obj_set_strs(obj, _PropertyIndex.VarNames, value, flags)
end

"""
(String) Activates the state variable using the given name.

Name: `Var`

(Getter)
"""
function Var(obj::Obj)::String
    obj_get_str(obj, _PropertyIndex.Var)
end

"""
(String) Activates the state variable using the given name.

Name: `Var`

(Setter)
"""
function Var(obj::Obj, value::String, flags::SetterFlagsT=SetterFlagsT(0))
    obj_set_str(obj, _PropertyIndex.Var, value, flags)
end

"""
(Int) read-only, returns the index of the active state variable.

**Read-only**

Name: `VarIdx`

(Getter)
"""
function VarIdx(obj::Obj)::Int32
    obj_get_int32(obj, _PropertyIndex.VarIdx)
end

"""
(Int) read-only, returns the index of the active state variable.

**Read-only**

Name: `VarIdx`

(Setter)
"""
function VarIdx(obj::Obj, value::Int32, flags::SetterFlagsT=SetterFlagsT(0))
    obj_set_int32(obj, _PropertyIndex.VarIdx, value, flags)
end

"""
It is the differential expression using OpenDSS RPN syntax. The expression must be contained within brackets in case of having multiple equations, for example:

expression="[w dt = 1 M / (P_m D*w - P_e -) *]"

Name: `Expression`

(Getter)
"""
function Expression(obj::Obj)::String
    obj_get_str(obj, _PropertyIndex.Expression)
end

"""
It is the differential expression using OpenDSS RPN syntax. The expression must be contained within brackets in case of having multiple equations, for example:

expression="[w dt = 1 M / (P_m D*w - P_e -) *]"

Name: `Expression`

(Setter)
"""
function Expression(obj::Obj, value::String, flags::SetterFlagsT=SetterFlagsT(0))
    obj_set_str(obj, _PropertyIndex.Expression, value, flags)
end

"""
It is the domain for which the equation is defined, it can be one of [time*, dq]. By deafult, dynamic epxressions are defined in the time domain.

Name: `Domain`
Default: Time

(Getter)
"""
function Domain(obj::Obj)::DynamicExpDomain.T
    DynamicExpDomain.T(obj_get_int32(obj, _PropertyIndex.Domain))
end

"""
It is the domain for which the equation is defined, it can be one of [time*, dq]. By deafult, dynamic epxressions are defined in the time domain.

Name: `Domain`
Default: Time

(Setter)
"""
function Domain(obj::Obj, value::String, flags::SetterFlagsT=SetterFlagsT(0))
    obj_set_str(obj, _PropertyIndex.Domain, value, flags)
end

"""
It is the domain for which the equation is defined, it can be one of [time*, dq]. By deafult, dynamic epxressions are defined in the time domain.

Name: `Domain`
Default: Time

(Setter)
"""
function Domain(obj::Obj, value::Union{Int,DynamicExpDomain.T}, flags::SetterFlagsT=SetterFlagsT(0))
    obj_set_int32(obj, _PropertyIndex.Domain, Int32(value), flags)
end

"""
It is the domain for which the equation is defined, it can be one of [time*, dq]. By deafult, dynamic epxressions are defined in the time domain.

Name: `Domain`
Default: Time

(Getter)
"""
function Domain_str(obj::Obj)::String
    obj_get_str(obj, _PropertyIndex.Domain)
end

"""
It is the domain for which the equation is defined, it can be one of [time*, dq]. By deafult, dynamic epxressions are defined in the time domain.

Name: `Domain`
Default: Time

(Setter)
"""
function Domain_str(obj::Obj, value::String, flags::SetterFlagsT=SetterFlagsT(0))
    Domain(obj, value, flags)
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

end # module DynamicExp
export DynamicExp
