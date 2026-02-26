module Common

#TODO: simplify many functions here; a lot of repeated code
import Base: ==
using ...Utils: OpenDSSDirectException, DSS_DEFAULT_CTX, get_string
using ...OpenDSSDirect: DSSContext
using ..Enums.SetterFlags: SetterFlagsT
using ...Lib: DSSJSONFlags, dss_ccall, altdss_func_v_f64pp_i32p_vp, altdss_func_v_strs_i32p_vp, altdss_func_cstr_vp, DSSCFunctionPtr
export DSSContext, DSSJSONFlags, DSS_DEFAULT_CTX, dss_ccall

abstract type AbstractNamedObj end
abstract type AbstractBusObj <: AbstractNamedObj end
abstract type AbstractDSSObj <: AbstractNamedObj end
abstract type AbstractConductorData <: AbstractDSSObj end
abstract type AbstractCableData <: AbstractConductorData end
abstract type AbstractCircuitElement <: AbstractDSSObj end
abstract type AbstractMeterElement <: AbstractCircuitElement end
abstract type AbstractPCElement <: AbstractCircuitElement end
abstract type AbstractPDElement <: AbstractCircuitElement end
abstract type AbstractControlElement <: AbstractCircuitElement end
abstract type AbstractTransformer <: AbstractPDElement end
abstract type AbstractDynEqPCE <: AbstractPCElement end
abstract type AbstractInvBasedPCE <: AbstractDynEqPCE end

struct DSSObj <: AbstractDSSObj
    ptr::Ptr{Cvoid}
    dss::DSSContext
end

==(a::AbstractDSSObj, b::AbstractDSSObj) = (a.ptr == b.ptr)

"""
Wrap a DSS object, matching the DSS class with the equivalent struct in Julia
"""
function _wrap_dss_obj(ptr::Ptr{Cvoid}, dss::DSSContext)::AbstractDSSObj
    if ptr == C_NULL
        return nothing
    end
    _cls_idx = Int64(dss_ccall(dss.capi.Obj_GetClassIdx, ptr))
    _wrap_dss_obj(Val{_cls_idx}(), ptr, dss)
end

function Base.show(io::IO, obj::DSSObj) 
    name = obj_get_str(obj, obj.dss.capi.Obj_GetFullName)
    print("DSSObj(\"$name\")")
end

struct CircuitElement <: AbstractCircuitElement
    ptr::Ptr{Cvoid}
    dss::DSSContext
end

struct PCElement <: AbstractPCElement
    ptr::Ptr{Cvoid}
    dss::DSSContext
end

function Base.show(io::IO, obj::PCElement) 
    name = obj_get_str(obj, obj.dss.capi.Obj_GetFullName)
    print("PCElement(\"$name\")")
end

struct PDElement <: AbstractPDElement
    ptr::Ptr{Cvoid}
    dss::DSSContext
end

function Base.show(io::IO, obj::PDElement) 
    name = obj_get_str(obj, obj.dss.capi.Obj_GetFullName)
    print("PDElement(\"$name\")")
end

struct ControlElement <: AbstractControlElement
    ptr::Ptr{Cvoid}
    dss::DSSContext
end

struct CommonTransformer <: AbstractTransformer
    ptr::Ptr{Cvoid}
    dss::DSSContext
end

struct DynEqPCE <: AbstractDynEqPCE
    ptr::Ptr{Cvoid}
    dss::DSSContext
end

struct InvBasedPCE <: AbstractInvBasedPCE
    ptr::Ptr{Cvoid}
    dss::DSSContext
end

convert(::Type{DSSObj}, o::CircuitElement) = DSSObj(o.ptr, o.dss)
convert(::Type{DSSObj}, o::PCElement) = DSSObj(o.ptr, o.dss)
convert(::Type{DSSObj}, o::PDElement) = DSSObj(o.ptr, o.dss)
convert(::Type{DSSObj}, o::ControlElement) = DSSObj(o.ptr, o.dss)
convert(::Type{DSSObj}, o::CommonTransformer) = DSSObj(o.ptr, o.dss)
convert(::Type{DSSObj}, o::DynEqPCE) = DSSObj(o.ptr, o.dss)
convert(::Type{DSSObj}, o::InvBasedPCE) = DSSObj(o.ptr, o.dss)

convert(::Type{CircuitElement}, o::PCElement) = CircuitElement(o.ptr, o.dss)
convert(::Type{CircuitElement}, o::PDElement) = CircuitElement(o.ptr, o.dss)
convert(::Type{CircuitElement}, o::ControlElement) = CircuitElement(o.ptr, o.dss)
# convert(::Type{CircuitElement}, o::Transformer) = CircuitElement(o.ptr, o.dss)
convert(::Type{CircuitElement}, o::DynEqPCE) = CircuitElement(o.ptr, o.dss)
convert(::Type{CircuitElement}, o::InvBasedPCE) = CircuitElement(o.ptr, o.dss)

convert(::Type{PDElement}, o::CommonTransformer) = PDElement(o.ptr, o.dss)
convert(::Type{PCElement}, o::DynEqPCE) = PCElement(o.ptr, o.dss)
convert(::Type{PCElement}, o::InvBasedPCE) = PCElement(o.ptr, o.dss)

convert(::Type{DynEqPCE}, o::InvBasedPCE) = DynEqPCE(o.ptr, o.dss)

macro checked(expr)
    # @assert expr.head == :call "Can only use @checked on function calls"
    # @assert ( expr.args[1].head == :(.) ) && ( expr.args[1].args[1] == :Lib) "Can only use @checked on Lib.\$function"

    return esc(quote
        ans = $(expr)
        error_num = unsafe_load(obj.dss.error)
        if (error_num != 0)
            dss = obj.dss
            unsafe_store!(dss.error, 0)
            description = get_string(dss_ccall(dss.capi.Error_Get_Description, dss.ctx))
            throw(
                OpenDSSDirectException(
                    "[ERROR $error_num] $description"
                )
            )
        end
        ans
    end)
end

function obj_set_int32(obj, idx::Int32, value::Int32, flags::SetterFlagsT)
    @checked dss_ccall(obj.dss.capi.Obj_SetInt32, obj.ptr, idx, value, flags)
end

function obj_get_int32(obj, idx::Int32)::Int32
    @checked dss_ccall(obj.dss.capi.Obj_GetInt32, obj.ptr, idx)
end

function obj_get_int32(obj, func::DSSCFunctionPtr, args...)::Int32
    @checked dss_ccall(func, obj.ptr, args...)
end

function obj_get_int32(obj::AbstractBusObj, func::DSSCFunctionPtr, args...)::Int32
    @checked dss_ccall(func, obj.dss.ctx, obj.ptr, args...)
end

function obj_set_bool(obj, idx::Int32, value::Bool, flags::SetterFlagsT)
    @checked dss_ccall(obj.dss.capi.Obj_SetInt32, obj.ptr, idx, value, flags)
end

function obj_get_bool(obj, idx::Int32)::Bool
    (@checked dss_ccall(obj.dss.capi.Obj_GetInt32, obj.ptr, idx)) != 0 
end

function obj_get_bool(obj, func::DSSCFunctionPtr, args...)::Bool
    (@checked dss_ccall(func, obj.ptr, args...)) != 0 
end

function obj_get_bool(obj::AbstractBusObj, func::DSSCFunctionPtr, args...)::Bool
    (@checked dss_ccall(func, obj.dss.ctx, obj.ptr, args...)) != 0 
end

function obj_set_float64(obj, idx::Int32, value::Float64, flags::SetterFlagsT)
    @checked dss_ccall(obj.dss.capi.Obj_SetFloat64, obj.ptr, idx, value, flags)
end

function obj_set_float64(obj, func::DSSCFunctionPtr, value::Float64)
    @checked dss_ccall(func, obj.ptr, value)
end

function obj_generic_call(obj, func::DSSCFunctionPtr, args...)
    @checked dss_ccall(func, obj.ptr, args...)
end

function obj_get_float64(obj, idx::Int32)::Float64
    @checked dss_ccall(obj.dss.capi.Obj_GetFloat64, obj.ptr, idx)
end

function obj_get_float64(obj, func::DSSCFunctionPtr, args...)::Float64
    @checked dss_ccall(func, obj.ptr, args...)
end

function obj_get_float64(obj::AbstractBusObj, func::DSSCFunctionPtr, args...)::Float64
    @checked dss_ccall(func, obj.dss.ctx, obj.ptr, args...)
end

function obj_set_str(obj, idx::Int32, value::String, flags::SetterFlagsT)
    @checked dss_ccall(obj.dss.capi.Obj_SetString, obj.ptr, idx, value, flags)
end

function obj_get_str(obj, idx::Int32)::String
    cstring = @checked dss_ccall(obj.dss.capi.Obj_GetString, obj.ptr, idx)
    if cstring != C_NULL
        result = unsafe_string(cstring)
        dss_ccall(obj.dss.capi.DSS_Dispose_String, cstring)
        return result
    end
    return ""
end

function obj_get_str(obj, func::DSSCFunctionPtr, args...)::String
    cstring = @checked dss_ccall(func, obj.ptr, args...)
    if cstring != C_NULL
        result = unsafe_string(cstring)
        dss_ccall(obj.dss.capi.DSS_Dispose_String, cstring)
        return result
    end
    return ""
end

function obj_get_str(obj::AbstractBusObj, func::DSSCFunctionPtr, args...)::String
    cstring = @checked dss_ccall(func, obj.dss.ctx, obj.ptr, args...)
    if cstring != C_NULL
        result = unsafe_string(cstring)
        dss_ccall(obj.dss.capi.DSS_Dispose_String, cstring)
        return result
    end
    return ""
end

function obj_get_str_nodisp(obj, func::DSSCFunctionPtr, args...)::String
    cstring = @checked dss_ccall(func, obj.ptr, args...)
    if cstring != C_NULL
        return unsafe_string(cstring)
    end
    return ""
end

function obj_get_str_nodisp(obj::AbstractBusObj, func::DSSCFunctionPtr, args...)::String
    cstring = @checked dss_ccall(func, obj.dss.ctx, obj.ptr, args...)
    if cstring != C_NULL
        return unsafe_string(cstring)
    end
    return ""
end

function obj_set_obj(obj, idx::Int32, value, flags::SetterFlagsT)
    @checked dss_ccall(obj.dss.capi.Obj_SetObject, obj.ptr, idx, (value === nothing) ? C_NULL : value.ptr, flags)
end

function obj_get_obj(obj, idx::Int32, T::Union{Type,Function}=_wrap_dss_obj)
    ptr = @checked dss_ccall(obj.dss.capi.Obj_GetObject, obj.ptr, idx)
    if ptr == C_NULL
        return nothing
    end
    return T(ptr, obj.dss)
end

function obj_get_obj(obj, func::DSSCFunctionPtr, T::Union{Type,Function}=_wrap_dss_obj, args...)
    ptr = @checked dss_ccall(func, obj.ptr, args...)
    if ptr == C_NULL
        return nothing
    end
    return T(ptr, obj.dss)
end

function obj_set_int32s(obj, idx::Int32, value::Vector{Int32}, flags::SetterFlagsT)
    value_ptr = pointer(value)
    cnt = size(value)[1]
    @checked dss_ccall(obj.dss.capi.Obj_SetInt32Array, obj.ptr, idx, value_ptr, cnt, flags)
end

function obj_get_int32s(obj, idx::Int32; matrix::Bool=false)::Union{Vector{Int32}, Matrix{Int32}} #TODO: use Int?
    ptr = Ref{Ptr{Int32}}([])
    cnt = Vector{Int32}([0, 0, 0, 0])
    @checked dss_ccall(obj.dss.capi.Obj_GetInt32Array, ptr, cnt, obj.ptr, idx)
    data = Vector{Int32}(undef, cnt[1])
    #TODO copy(unsafe_wrap(Vector{Int32}, ptr, cnt[1], own=false))
    for i in 1:cnt[1]
        data[i] = unsafe_load(ptr[], i)
    end
    dss_ccall(obj.dss.capi.DSS_Dispose_PInteger, ptr)
    if matrix && cnt[4] != 0
        return reshape(data, (cnt[3], cnt[4]))
    end
    return data
end

function obj_get_int32s(obj, func::DSSCFunctionPtr, args...; matrix::Bool=false)::Union{Vector{Int32}, Matrix{Int32}}
    ptr = Ref{Ptr{Int32}}([])
    cnt = Vector{Int32}([0, 0, 0, 0])
    @checked dss_ccall(func, ptr, cnt, obj.ptr, args...)
    data = Vector{Int32}(undef, cnt[1])
    #TODO copy(unsafe_wrap(Vector{Int8}, ptr, cnt[1], own=false))
    for i in 1:cnt[1]
        data[i] = unsafe_load(ptr[], i)
    end
    dss_ccall(obj.dss.capi.DSS_Dispose_PInteger, ptr)
    if matrix && cnt[4] != 0
        return reshape(data, (cnt[3], cnt[4]))
    end
    return data
end

function obj_get_int32s(obj::AbstractBusObj, func::DSSCFunctionPtr, args...; matrix::Bool=false)::Union{Vector{Int32}, Matrix{Int32}}
    ptr = Ref{Ptr{Int32}}([])
    cnt = Vector{Int32}([0, 0, 0, 0])
    @checked dss_ccall(func, obj.dss.ctx, ptr, cnt, obj.ptr, args...)
    data = Vector{Int32}(undef, cnt[1])
    #TODO copy(unsafe_wrap(Vector{Int8}, ptr, cnt[1], own=false))
    for i in 1:cnt[1]
        data[i] = unsafe_load(ptr[], i)
    end
    dss_ccall(obj.dss.capi.DSS_Dispose_PInteger, ptr)
    if matrix && cnt[4] != 0
        return reshape(data, (cnt[3], cnt[4]))
    end
    return data
end

function obj_get_int8s(obj, func::DSSCFunctionPtr, args...)::Vector{Int8}
    ptr = Ref{Ptr{Int8}}([])
    cnt = Vector{Int32}([0, 0, 0, 0])
    @checked dss_ccall(func, ptr, cnt, obj.ptr, args...)
    data = Vector{Int8}(undef, cnt[1])
    #TODO copy(unsafe_wrap(Vector{Int8}, ptr, cnt[1], own=false))
    for i in 1:cnt[1]
        data[i] = unsafe_load(ptr[], i)
    end
    dss_ccall(obj.dss.capi.DSS_Dispose_PByte, ptr)
    return data
end

function obj_set_float64s(obj, idx::Int32, value::Vector{Float64}, flags::SetterFlagsT)
    value_ptr = pointer(value)
    cnt = size(value)[1]
    @checked dss_ccall(obj.dss.capi.Obj_SetFloat64Array, obj.ptr, idx, value_ptr, cnt, flags)
end

function obj_get_float64s(obj, idx::Int32; matrix::Bool=false)::Union{Vector{Float64}, Matrix{Float64}}
    ptr = Ref{Ptr{Float64}}([])
    cnt = Vector{Int32}([0, 0, 0, 0])
    @checked dss_ccall(obj.dss.capi.Obj_GetFloat64Array, ptr, cnt, obj.ptr, idx)
    data = Vector{Float64}(undef, cnt[1])
    #TODO copy(unsafe_wrap(Vector{Float64}, ptr, cnt[1], own=false))
    for i in 1:cnt[1]
        data[i] = unsafe_load(ptr[], i)
    end
    dss_ccall(obj.dss.capi.DSS_Dispose_PDouble, ptr)
    if matrix && cnt[4] != 0
        return reshape(data, (cnt[3], cnt[4]))
    end
    return data
end

function obj_get_float64s(obj, func::altdss_func_v_f64pp_i32p_vp; matrix::Bool=false)::Union{Vector{Float64}, Matrix{Float64}}
    ptr = Ref{Ptr{Float64}}([])
    cnt = Vector{Int32}([0, 0, 0, 0])
    @checked dss_ccall(func, ptr, cnt, obj.ptr)
    data = Vector{Float64}(undef, cnt[1])
    #TODO copy(unsafe_wrap(Vector{Float64}, ptr, cnt[1], own=false))
    for i in 1:cnt[1]
        data[i] = unsafe_load(ptr[], i)
    end
    dss_ccall(obj.dss.capi.DSS_Dispose_PDouble, ptr)
    if matrix && cnt[4] != 0
        return reshape(data, (cnt[3], cnt[4]))
    end
    return data
end

function obj_get_float64s(obj::AbstractBusObj, func::DSSCFunctionPtr; matrix::Bool=false)::Union{Vector{Float64}, Matrix{Float64}}
    ptr = Ref{Ptr{Float64}}([])
    cnt = Vector{Int32}([0, 0, 0, 0])
    @checked dss_ccall(func, obj.dss.ctx, ptr, cnt, obj.ptr)
    data = Vector{Float64}(undef, cnt[1])
    #TODO copy(unsafe_wrap(Vector{Float64}, ptr, cnt[1], own=false))
    for i in 1:cnt[1]
        data[i] = unsafe_load(ptr[], i)
    end
    dss_ccall(obj.dss.capi.DSS_Dispose_PDouble, ptr)
    if matrix && cnt[4] != 0
        return reshape(data, (cnt[3], cnt[4]))
    end
    return data
end

function obj_get_strs(obj, idx::Int32)::Vector{String}
    ptr = Ref{Ptr{Cstring}}([])
    cnt = Vector{Int32}([0, 0, 0, 0])
    @checked dss_ccall(obj.dss.capi.Obj_GetStringArray, ptr, cnt, obj.ptr, idx)
    data = Vector{String}(undef, cnt[1])
    for i in 1:cnt[1]
        p = unsafe_load(ptr[], i)
        if p != C_NULL
            data[i] = unsafe_string(p)
        else
            data[i] = ""
        end
    end
    dss_ccall(obj.dss.capi.DSS_Dispose_PPAnsiChar, ptr, cnt[2])
    return data
end

function obj_get_strs(obj, func::altdss_func_v_strs_i32p_vp)::Vector{String}
    ptr = Ref{Ptr{Cstring}}([])
    cnt = Vector{Int32}([0, 0, 0, 0])
    @checked dss_ccall(func, ptr, cnt, obj.ptr)
    data = Vector{String}(undef, cnt[1])
    for i in 1:cnt[1]
        p = unsafe_load(ptr[], i)
        if p != C_NULL
            data[i] = unsafe_string(p)
        else
            data[i] = ""
        end
    end
    dss_ccall(obj.dss.capi.DSS_Dispose_PPAnsiChar, ptr, cnt[2])
    return data
end

function obj_set_strs(obj, idx::Int32, value::Vector{String}, flags::SetterFlagsT)
    value_ptr = pointer(value)
    cnt = size(value)[1]
    @checked dss_ccall(obj.dss.capi.Obj_SetStringArray, obj.ptr, idx, value_ptr, cnt, flags)
end

function obj_get_objs(obj, idx::Int32, T::Union{Type,Function}=_wrap_dss_obj)
    ptr = Ref{Ptr{Ptr{Cvoid}}}([])
    cnt = Vector{Int32}([0, 0, 0, 0])
    @checked dss_ccall(obj.dss.capi.Obj_GetObjectArray, ptr, cnt, obj.ptr, idx)
    data = Vector(undef, cnt[1])
    for i in 1:cnt[1]
        item_ptr = unsafe_load(ptr[], i)
        data[i] = (item_ptr != C_NULL) ? T(item_ptr, obj.dss) : nothing
    end
    dss_ccall(obj.dss.capi.DSS_Dispose_PPointer, ptr)
    return data
end

function obj_get_objs(obj, func::DSSCFunctionPtr, T::Union{Type,Function}=_wrap_dss_obj)
    ptr = Ref{Ptr{Ptr{Cvoid}}}([])
    cnt = Vector{Int32}([0, 0, 0, 0])
    @checked dss_ccall(func, ptr, cnt, obj.ptr)
    data = Vector(undef, cnt[1])
    for i in 1:cnt[1]
        item_ptr = unsafe_load(ptr[], i)
        data[i] = (item_ptr != C_NULL) ? T(item_ptr, obj.dss) : nothing
    end
    dss_ccall(obj.dss.capi.DSS_Dispose_PPointer, ptr)
    return data
end

function obj_get_objs(obj::AbstractBusObj, func::DSSCFunctionPtr, T::Union{Type,Function}=_wrap_dss_obj)
    ptr = Ref{Ptr{Ptr{Cvoid}}}([])
    cnt = Vector{Int32}([0, 0, 0, 0])
    @checked dss_ccall(func, obj.dss.ctx, ptr, cnt, obj.ptr)
    data = Vector(undef, cnt[1])
    for i in 1:cnt[1]
        item_ptr = unsafe_load(ptr[], i)
        data[i] = (item_ptr != C_NULL) ? T(item_ptr, obj.dss) : nothing
    end
    dss_ccall(obj.dss.capi.DSS_Dispose_PPointer, ptr)
    return data
end

function obj_set_objs(obj, idx::Int32, value::Vector, flags::SetterFlagsT)
    ptrs = [(v === nothing ? C_NULL : v.ptr) for v in value]
    value_ptr = pointer(ptrs)
    cnt = size(value)[1]
    @checked dss_ccall(obj.dss.capi.Obj_SetStringArray, obj.ptr, idx, value_ptr, cnt, flags)
end

function obj_set_complex128(obj, idx::Int32, value::ComplexF64, flags::SetterFlagsT)
    value_ptr = pointer(value)
    @checked dss_ccall(obj.dss.capi.Obj_SetFloat64Array, obj.ptr, idx, value_ptr, 2, flags)
end

function obj_get_complex128(obj, idx::Int32)::ComplexF64
    ptr = Ref{Ptr{Float64}}([])
    cnt = Vector{Int32}([0, 0, 0, 0])
    @checked dss_ccall(obj.dss.capi.Obj_GetFloat64Array, ptr, cnt, obj.ptr, idx)
    @assert (cnt[1] == 2)
    data = ComplexF64(unsafe_load(ptr[], 1), unsafe_load(ptr[], 2))
    dss_ccall(obj.dss.capi.DSS_Dispose_PDouble, ptr)
    return data
end

function obj_get_complex128(obj, func::altdss_func_v_f64pp_i32p_vp)::ComplexF64
    ptr = Ref{Ptr{Float64}}([])
    cnt = Vector{Int32}([0, 0, 0, 0])
    @checked dss_ccall(func, ptr, cnt, obj.ptr)
    @assert (cnt[1] == 2)
    data = ComplexF64(unsafe_load(ptr[], 1), unsafe_load(ptr[], 2))
    dss_ccall(obj.dss.capi.DSS_Dispose_PDouble, ptr)
    return data
end

function obj_get_complex128(obj::AbstractBusObj, func::DSSCFunctionPtr)::ComplexF64
    ptr = Ref{Ptr{Float64}}([])
    cnt = Vector{Int32}([0, 0, 0, 0])
    @checked dss_ccall(func, obj.dss.ctx, ptr, cnt, obj.ptr)
    @assert (cnt[1] == 2)
    data = ComplexF64(unsafe_load(ptr[], 1), unsafe_load(ptr[], 2))
    dss_ccall(obj.dss.capi.DSS_Dispose_PDouble, ptr)
    return data
end

function obj_get_complex128s(obj, idx::Int32; matrix::Bool=false)::Union{Vector{ComplexF64}, Matrix{ComplexF64}}
    ptr = Ref{Ptr{Float64}}([])
    cnt = Vector{Int32}([0, 0, 0, 0])
    @checked dss_ccall(obj.dss.capi.Obj_GetFloat64Array, ptr, cnt, obj.ptr, idx)
    @assert (cnt[1] % 2 == 0)
    complexcnt = cnt[1] ÷ 2
    data = Vector{ComplexF64}(undef, complexcnt)
    #TODO copy(unsafe_wrap(Vector{ComplexF64}, ptr, cnt[1] / 2, own=false))
    cptr = reinterpret(Ptr{ComplexF64}, ptr[])
    for i in 1:complexcnt
        data[i] = unsafe_load(cptr, i)
    end
    dss_ccall(obj.dss.capi.DSS_Dispose_PDouble, ptr)
    if matrix && cnt[4] != 0
        return reshape(data, (cnt[3], cnt[4]))
    end
    return data
end

function obj_get_complex128s(obj, func::DSSCFunctionPtr, args...; matrix::Bool=false)::Union{Vector{ComplexF64}, Matrix{ComplexF64}}
    ptr = Ref{Ptr{Float64}}([])
    cnt = Vector{Int32}([0, 0, 0, 0])
    @checked dss_ccall(func, ptr, cnt, obj.ptr, args...)
    @assert (cnt[1] % 2 == 0)
    complexcnt = cnt[1] ÷ 2
    data = Vector{ComplexF64}(undef, complexcnt)
    #TODO copy(unsafe_wrap(Vector{ComplexF64}, ptr, cnt[1] / 2, own=false))
    cptr = reinterpret(Ptr{ComplexF64}, ptr[])
    for i in 1:complexcnt
        data[i] = unsafe_load(cptr, i)
    end
    dss_ccall(obj.dss.capi.DSS_Dispose_PDouble, ptr)
    if matrix && cnt[4] != 0
        return reshape(data, (cnt[3], cnt[4]))
    end
    return data
end

function obj_get_complex128s(obj::AbstractBusObj, func::DSSCFunctionPtr, args...; matrix::Bool=false)::Union{Vector{ComplexF64}, Matrix{ComplexF64}}
    ptr = Ref{Ptr{Float64}}([])
    cnt = Vector{Int32}([0, 0, 0, 0])
    @checked dss_ccall(func, obj.dss.ctx, ptr, cnt, obj.ptr, args...)
    @assert (cnt[1] % 2 == 0)
    complexcnt = cnt[1] ÷ 2
    data = Vector{ComplexF64}(undef, complexcnt)
    #TODO copy(unsafe_wrap(Vector{ComplexF64}, ptr, cnt[1] / 2, own=false))
    cptr = reinterpret(Ptr{ComplexF64}, ptr[])
    for i in 1:complexcnt
        data[i] = unsafe_load(cptr, i)
    end
    dss_ccall(obj.dss.capi.DSS_Dispose_PDouble, ptr)
    if matrix && cnt[4] != 0
        return reshape(data, (cnt[3], cnt[4]))
    end
    return data
end

export AbstractNamedObj
export AbstractBusObj
export AbstractDSSObj
export AbstractConductorData
export AbstractCableData
export AbstractCircuitElement
export AbstractMeterElement
export AbstractPCElement
export AbstractPDElement
export AbstractControlElement
export AbstractTransformer
export AbstractDynEqPCE
export AbstractInvBasedPCE

export DSSObj
export CircuitElement
export PCElement
export PDElement
export ControlElement
export CommonTransformer
export DynEqPCE
export InvBasedPCE

export obj_get_bool, obj_set_bool
export obj_get_int8s
export obj_get_int32, obj_set_int32
export obj_get_int32s, obj_set_int32s
export obj_get_float64, obj_set_float64
export obj_get_float64s, obj_set_float64s
export obj_get_complex128, obj_set_complex128
export obj_get_complex128s
export obj_get_str, obj_get_str_nodisp, obj_set_str
export obj_set_strs, obj_set_strs
export obj_get_obj, obj_set_obj
export obj_get_objs, obj_set_objs
export obj_generic_call

end