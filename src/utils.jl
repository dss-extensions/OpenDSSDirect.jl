
module Utils

using ..OpenDSSDirect
using ..Lib
using Downloads

export get_string
export get_string_array
export get_int8_array
export get_int32_array
export get_float64_array
export get_complex64_array
export get_complex64
export set_float64_array
export set_int32_array
export prepare_float64_array
export prepare_complex64_array
export prepare_int32_array
export prepare_string_array
export OpenDSSDirectException
export Examples
export DSSContext
export DSS_DEFAULT_CTX
export @checked

const DSS_DEFAULT_CTX = DSSContext(C_NULL, OpenDSSDirect.DSS_DEFAULT_STRUCT, C_NULL)

function get_string(cstring::Cstring)::String
    if cstring != C_NULL
        return unsafe_string(cstring)
    else
        return ""
    end
end

function get_string_array(func::Lib.altdss_func_v_cvp_strs_i32p, dss::DSSContext)::Vector{String}
    ptr = Ref{Ptr{Cstring}}([])
    cnt = Vector{Int32}([0, 0, 0, 0])
    dss_ccall(func, dss.ctx, ptr, cnt)
    error_num = unsafe_load(dss.error)
    if (error_num != 0)
        unsafe_store!(dss.error, 0)
        description = get_string(dss_ccall(dss.capi.Error_Get_Description, dss.ctx))
        throw(
            OpenDSSDirectException(
                "[ERROR $error_num] $description"
            )
        )
    end
    data = Vector{String}([])
    for i in 1:cnt[1]
        p = unsafe_load(ptr[], i)
        if p != C_NULL
            push!(data, unsafe_string(p))
        end
    end
    dss_ccall(dss.capi.DSS_Dispose_PPAnsiChar, ptr, cnt[2])
    return data
end

function get_string_array(func::Union{Lib.altdss_func_v_cvp_strs_i32p_u16, Lib.altdss_func_v_cvp_strs_i32p_i32,Lib.altdss_func_v_cvp_strs_i32p_cstr}, dss::DSSContext, param::Union{Bool,Int,Cstring})::Vector{String}
    ptr = Ref{Ptr{Cstring}}([])
    cnt = Vector{Int32}([0, 0, 0, 0])
    dss_ccall(func, dss.ctx, ptr, cnt, param)
    error_num = unsafe_load(dss.error)
    if (error_num != 0)
        unsafe_store!(dss.error, 0)
        description = get_string(dss_ccall(dss.capi.Error_Get_Description, dss.ctx))
        throw(
            OpenDSSDirectException(
                "[ERROR $error_num] $description"
            )
        )
    end
    data = Vector{String}([])
    for i in 1:cnt[1]
        p = unsafe_load(ptr[], i)
        if p != C_NULL
            push!(data, unsafe_string(p))
        end
    end
    dss_ccall(dss.capi.DSS_Dispose_PPAnsiChar, ptr, cnt[2])
    return data
end

function get_int32_array(func::Lib.altdss_func_v_cvp_i32pp_i32p, dss::DSSContext)::Vector{Int}
    ptr = Ref{Ptr{Int32}}([])
    cnt = Vector{Int32}([0, 0, 0, 0])
    dss_ccall(func, dss.ctx, ptr, cnt)
    error_num = unsafe_load(dss.error)
    if (error_num != 0)
        unsafe_store!(dss.error, 0)
        description = get_string(dss_ccall(dss.capi.Error_Get_Description, dss.ctx))
        throw(
            OpenDSSDirectException(
                "[ERROR $error_num] $description"
            )
        )
    end
    data = Vector{Int}([])
    for i in 1:cnt[1]
        push!(data, Int(unsafe_load(ptr[], i)))
    end
    dss_ccall(dss.capi.DSS_Dispose_PInteger, ptr)
    return data
end

function get_int8_array(func::Lib.altdss_func_v_cvp_i8pp_i32p, dss::DSSContext)::Vector{Int8}
    ptr = Ref{Ptr{Int8}}([])
    cnt = Vector{Int32}([0, 0, 0, 0])
    dss_ccall(func, dss.ctx, ptr, cnt)
    error_num = unsafe_load(dss.error)
    if (error_num != 0)
        unsafe_store!(dss.error, 0)
        description = get_string(dss_ccall(dss.capi.Error_Get_Description, dss.ctx))
        throw(
            OpenDSSDirectException(
                "[ERROR $error_num] $description"
            )
        )
    end
    data = Vector{Int8}([])
    for i in 1:cnt[1]
        push!(data, unsafe_load(ptr[], i))
    end
    dss_ccall(dss.capi.DSS_Dispose_PByte, ptr)
    return data
end

function get_int8_array(func::Lib.altdss_func_v_cvp_i8pp_i32p_cstr, dss::DSSContext, param::Cstring)::Vector{Int8}
    ptr = Ref{Ptr{Int8}}([])
    cnt = Vector{Int32}([0, 0, 0, 0])
    dss_ccall(func, dss.ctx, ptr, cnt, param)
    error_num = unsafe_load(dss.error)
    if (error_num != 0)
        unsafe_store!(dss.error, 0)
        description = get_string(dss_ccall(dss.capi.Error_Get_Description, dss.ctx))
        throw(
            OpenDSSDirectException(
                "[ERROR $error_num] $description"
            )
        )
    end
    data = Vector{Int8}([])
    for i in 1:cnt[1]
        push!(data, unsafe_load(ptr[], i))
    end
    dss_ccall(dss.capi.DSS_Dispose_PByte, ptr)
    return data
end

function get_float64_array(func::Lib.altdss_func_v_cvp_f64pp_i32p, dss::DSSContext)::Vector{Float64}
    ptr = Ref{Ptr{Float64}}([])
    cnt = Vector{Int32}([0, 0, 0, 0])
    dss_ccall(func, dss.ctx, ptr, cnt)
    error_num = unsafe_load(dss.error)
    if (error_num != 0)
        unsafe_store!(dss.error, 0)
        description = get_string(dss_ccall(dss.capi.Error_Get_Description, dss.ctx))
        throw(
            OpenDSSDirectException(
                "[ERROR $error_num] $description"
            )
        )
    end
    data = Vector{Float64}([])
    for i in 1:cnt[1]
        push!(data, unsafe_load(ptr[], i))
    end
    dss_ccall(dss.capi.DSS_Dispose_PDouble, ptr)
    return data
end

function get_float64_array(func::Union{Lib.altdss_func_v_cvp_f64pp_i32p_u16,Lib.altdss_func_v_cvp_f64pp_i32p_i32}, dss::DSSContext, param::Union{Bool,Int})::Vector{Float64}
    ptr = Ref{Ptr{Float64}}([])
    cnt = Vector{Int32}([0, 0, 0, 0])
    dss_ccall(func, dss.ctx, ptr, cnt, param)
    error_num = unsafe_load(dss.error)
    if (error_num != 0)
        unsafe_store!(dss.error, 0)
        description = get_string(dss_ccall(dss.capi.Error_Get_Description, dss.ctx))
        throw(
            OpenDSSDirectException(
                "[ERROR $error_num] $description"
            )
        )
    end
    data = Vector{Float64}([])
    for i in 1:cnt[1]
        push!(data, unsafe_load(ptr[], i))
    end
    dss_ccall(dss.capi.DSS_Dispose_PDouble, ptr)
    return data
end

function get_float64_array(func::Lib.altdss_func_v_cvp_f64pp_i32p_i32p_i32, dss::DSSContext, param1::Ptr{Int32}, param2::Int32)::Vector{Float64}
    ptr = Ref{Ptr{Float64}}([])
    cnt = Vector{Int32}([0, 0, 0, 0])
    dss_ccall(func, dss.ctx, ptr, cnt, param1, param2)
    error_num = unsafe_load(dss.error)
    if (error_num != 0)
        unsafe_store!(dss.error, 0)
        description = get_string(dss_ccall(dss.capi.Error_Get_Description, dss.ctx))
        throw(
            OpenDSSDirectException(
                "[ERROR $error_num] $description"
            )
        )
    end
    data = Vector{Float64}([])
    for i in 1:cnt[1]
        push!(data, unsafe_load(ptr[], i))
    end
    dss_ccall(dss.capi.DSS_Dispose_PDouble, ptr)
    return data
end

function get_float64_array(func::Lib.altdss_func_v_cvp_f64pp_i32p_f64_f64_i32, dss::DSSContext, param1::Float64, param2::Float64, param3::Int32)::Vector{Float64}
    ptr = Ref{Ptr{Float64}}([])
    cnt = Vector{Int32}([0, 0, 0, 0])
    dss_ccall(func, dss.ctx, ptr, cnt, param1, param2, param3)
    error_num = unsafe_load(dss.error)
    if (error_num != 0)
        unsafe_store!(dss.error, 0)
        description = get_string(dss_ccall(dss.capi.Error_Get_Description, dss.ctx))
        throw(
            OpenDSSDirectException(
                "[ERROR $error_num] $description"
            )
        )
    end
    data = Vector{Float64}([])
    for i in 1:cnt[1]
        push!(data, unsafe_load(ptr[], i))
    end
    dss_ccall(dss.capi.DSS_Dispose_PDouble, ptr)
    return data
end


function get_complex64_array(func::Lib.altdss_func_v_cvp_f64pp_i32p_i32p_i32, dss::DSSContext, param1::Ptr{Int32}, param2::Int32)::Vector{ComplexF64}
    r = get_float64_array(func, dss, param1, param2)
    if length(r) == 1
        return ComplexF64[]
    else
        r = Array(reinterpret(ComplexF64, r))
    end
    return r
end

function get_complex64_array(func::Union{Lib.altdss_func_v_cvp_f64pp_i32p_u16,Lib.altdss_func_v_cvp_f64pp_i32p_i32}, dss::DSSContext, param::Union{Bool,Int})::Vector{ComplexF64}
    r = get_float64_array(func, dss, param)
    if length(r) == 1
        return ComplexF64[]
    else
        r = Array(reinterpret(ComplexF64, r))
    end
    return r
end

function get_complex64_array(func::Lib.altdss_func_v_cvp_f64pp_i32p_f64_f64_i32, dss::DSSContext, param1::Float64, param2::Float64, param3::Int32)::Vector{ComplexF64}
    r = get_float64_array(func, dss, param1, param2, param3)
    if length(r) == 1
        return ComplexF64[]
    else
        r = Array(reinterpret(ComplexF64, r))
    end
    return r
end

function get_complex64_array(func::Lib.altdss_func_v_cvp_f64pp_i32p, dss::DSSContext)::Vector{ComplexF64}
    r = get_float64_array(func, dss)
    if length(r) == 1
        return ComplexF64[]
    else
        r = Array(reinterpret(ComplexF64, r))
    end
    return r
end

function get_complex64(func::Lib.altdss_func_v_cvp_f64pp_i32p, dss::DSSContext)::ComplexF64
    return get_complex64_array(func, dss)[1]
end

function prepare_float64_array(value::Vector{Float64})
    ptr = pointer(value)
    cnt = size(value)[1]
    return value, ptr, cnt
end

function set_int32_array(func::Lib.altdss_func_v_cvp_ci32p_i32, dss::DSSContext, value::Vector{Int32})
    dss_ccall(func, dss.ctx, pointer(value), size(value)[1])
    error_num = unsafe_load(dss.error)
    if (error_num != 0)
        unsafe_store!(dss.error, 0)
        description = get_string(dss_ccall(dss.capi.Error_Get_Description, dss.ctx))
        throw(
            OpenDSSDirectException(
                "[ERROR $error_num] $description"
            )
        )
    end
end

function set_float64_array(func::Lib.altdss_func_v_cvp_cf64p_i32, dss::DSSContext, value::Vector{Float64})
    dss_ccall(func, dss.ctx, pointer(value), size(value)[1])
    error_num = unsafe_load(dss.error)
    if (error_num != 0)
        unsafe_store!(dss.error, 0)
        description = get_string(dss_ccall(dss.capi.Error_Get_Description, dss.ctx))
        throw(
            OpenDSSDirectException(
                "[ERROR $error_num] $description"
            )
        )
    end
end

function prepare_complex64_array(value::Vector{ComplexF64})
    ptr = pointer(value)
    cnt = size(value)[1] * 2
    return value, ptr, cnt
end

function prepare_float64_array(value::Array{ComplexF64, 2})
    r, c = size(value)
    value = reshape(value, 1, r*c)
    arr = Vector{Float64}([])
    for v in value
        push!(arr, v.re)
        push!(arr, v.im)
    end
    prepare_float64_array(arr)
end

function prepare_string_array(value::Vector{String})
    ptr = pointer(value)
    cnt = size(value)[1]
    return value, ptr, cnt
end

function prepare_int32_array(value::Vector{Int32})
    ptr = pointer(value)
    cnt = size(value)[1]
    return value, ptr, cnt
end

function prepare_int32_array(value::Vector{Int64})
    prepare_int32_array(Vector{Int32}(value))
end

macro checked(expr)
    # @assert expr.head == :call "Can only use @checked on function calls"
    # @assert ( expr.args[1].head == :(.) ) && ( expr.args[1].args[1] == :Lib) "Can only use @checked on Lib.\$function"

    return esc(quote
        ans = $(expr)
        error_num = unsafe_load(dss.error)
        if (error_num != 0)
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

function finalize_capi(capi::AltDSSCAPI)
    # This unloads the actual library for the specific engine that was loaded,
    # then we can just discard the Julia struct.
    Lib.AltDSSCAPILibClose(Ref(capi))
end

function finalize_ctx(dss::DSSContext)
    if dss.ctx == C_NULL
        return
    end
    if dss.capi.isAltDSS != 0
        # The Prime context is left as-is, the rest can be disposed
        if dss_ccall(dss.capi.ctx_Get_Prime) == dss.ctx
            return
        end
    end

    # For Oddie (EPRI's OpenDSS and OpenDSS-C)
    dss_ccall(dss.capi.ctx_Dispose, dss.ctx)
end

struct OpenDSSDirectException <: Exception
    msg::String
end

"""
Return a column-format `NamedTuple` of all attributes of the given Module.

Example:

    nt = OpenDSSDirect.table(Loads)
    nt.kW
    df = DataFrame(nt)
"""
function table(m::Module)
    m.First()
    nt = NamedTuple{tuple(m._columns...)}([getfield(m, col)()] for col in m._columns)
    while m.Next() > 0
        for col in m._columns
            push!(getfield(nt, col), getfield(m, col)())
        end
    end
    return nt
end

abstract type AbstractOS end
abstract type Unix <: AbstractOS end
abstract type BSD <: Unix end

abstract type Windows <: AbstractOS end
abstract type MacOS <: BSD end
abstract type Linux <: BSD end

if Sys.iswindows()
    const os = Windows
elseif Sys.isapple()
    const os = MacOS
else
    const os = Linux
end

abstract type Examples end

"""
Download examples into a "electricdss-tst-master" folder in given argument path.
Defaults to the "examples" folder in the OpenDSSDirect package.

Returns the downloaded folder name.
"""
function Downloads.download(::Type{Examples}, folder::AbstractString=joinpath(@__DIR__, "../examples"); force::Bool=false)
    directory = abspath(normpath(folder))
    electricdss_tst_master_folder = joinpath(directory, "electricdss-tst-master")
    if force || !isdir(electricdss_tst_master_folder)
        url = "https://github.com/dss-extensions/electricdss-tst/archive/master.tar.gz"
        tempfilename = Downloads.download(url)
        mkpath(directory)
        rm(electricdss_tst_master_folder, recursive=true, force=true)
        unzip(os, tempfilename, directory)
        filename = electricdss_tst_master_folder
    else
        filename = electricdss_tst_master_folder
        @warn "$filename already exists. Use `force=true` if you want to redownload the data."
    end
    return filename
end

function unzip(::Type{<:BSD}, filename, directory)
    @assert success(`tar -xvf $filename -C $directory`) "Unable to extract $filename to $directory"
end

function unzip(::Type{Windows}, filename, directory)
    home = (Base.VERSION < v"0.7-") ? JULIA_HOME : Sys.BINDIR
    if Base.VERSION < v"1.3.0"
        bin7z = "$home/7z"
    else
        bin7z = "$(joinpath(home, "..", "libexec", "7z.exe"))"
        if !isfile(bin7z)
            bin7z = "$(joinpath(home, "..", "libexec", "julia", "7z.exe"))"
        end
    end
    @assert success(`$bin7z x $filename -y -o$directory`) "Unable to extract $filename to $directory"
end

end
