module Utils

using ..OpenDSSDirect

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
export @checked

const C_NULL_CTX = C_NULL;

function get_string(cstring::Cstring)::String
    if cstring != C_NULL
        return unsafe_string(cstring)
    else
        return ""
    end
end

function get_string_array(func::Function, ctx::Ptr{Cvoid})::Vector{String}
    ptr = Ref{Ptr{Cstring}}([])
    cnt = Vector{Cint}([0, 0])
    func(ctx, ptr, cnt)
    error_num = OpenDSSDirect.Lib.Error_Get_Number(ctx)
    if (error_num != 0)
        description = get_string(OpenDSSDirect.Lib.Error_Get_Description(ctx))
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
    OpenDSSDirect.Lib.DSS_Dispose_PPAnsiChar(ptr, cnt[2])
    return data
end

function get_string_array(func::Function, ctx::Ptr{Cvoid}, param::Union{Bool,Int,Cstring})::Vector{String}
    ptr = Ref{Ptr{Cstring}}([])
    cnt = Vector{Cint}([0, 0])
    func(ctx, ptr, cnt, param)
    error_num = OpenDSSDirect.Lib.Error_Get_Number(ctx)
    if (error_num != 0)
        description = get_string(OpenDSSDirect.Lib.Error_Get_Description(ctx))
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
    OpenDSSDirect.Lib.DSS_Dispose_PPAnsiChar(ptr, cnt[2])
    return data
end

function get_int32_array(func::Function, ctx::Ptr{Cvoid})::Vector{Int}
    ptr = Ref{Ptr{Cint}}([])
    cnt = Vector{Cint}([0, 0])
    func(ctx, ptr, cnt)
    error_num = OpenDSSDirect.Lib.Error_Get_Number(ctx)
    if (error_num != 0)
        description = get_string(OpenDSSDirect.Lib.Error_Get_Description(ctx))
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
    OpenDSSDirect.Lib.DSS_Dispose_PInteger(ptr)
    return data
end

function get_int8_array(func::Function, ctx::Ptr{Cvoid})::Vector{Int8}
    ptr = Ref{Ptr{Int8}}([])
    cnt = Vector{Cint}([0, 0])
    func(ctx, ptr, cnt)
    error_num = OpenDSSDirect.Lib.Error_Get_Number(ctx)
    if (error_num != 0)
        description = get_string(OpenDSSDirect.Lib.Error_Get_Description(ctx))
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
    OpenDSSDirect.Lib.DSS_Dispose_PByte(ptr)
    return data
end

function get_int8_array(func::Function, ctx::Ptr{Cvoid}, param::Cstring)::Vector{Int8}
    ptr = Ref{Ptr{Int8}}([])
    cnt = Vector{Cint}([0, 0])
    func(ctx, ptr, cnt, param)
    error_num = OpenDSSDirect.Lib.Error_Get_Number(ctx)
    if (error_num != 0)
        description = get_string(OpenDSSDirect.Lib.Error_Get_Description(ctx))
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
    OpenDSSDirect.Lib.DSS_Dispose_PByte(ptr)
    return data
end

function get_float64_array(func::Function, ctx::Ptr{Cvoid})::Vector{Float64}
    ptr = Ref{Ptr{Cdouble}}([])
    cnt = Vector{Cint}([0, 0])
    func(ctx, ptr, cnt)
    error_num = OpenDSSDirect.Lib.Error_Get_Number(ctx)
    if (error_num != 0)
        description = get_string(OpenDSSDirect.Lib.Error_Get_Description(ctx))
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
    OpenDSSDirect.Lib.DSS_Dispose_PDouble(ptr)
    return data
end

function get_float64_array(func::Function, ctx::Ptr{Cvoid}, param::Union{Bool,Int})::Vector{Float64}
    ptr = Ref{Ptr{Cdouble}}([])
    cnt = Vector{Cint}([0, 0])
    func(ctx, ptr, cnt, param)
    error_num = OpenDSSDirect.Lib.Error_Get_Number(ctx)
    if (error_num != 0)
        description = get_string(OpenDSSDirect.Lib.Error_Get_Description(ctx))
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
    OpenDSSDirect.Lib.DSS_Dispose_PDouble(ptr)
    return data
end

function get_float64_array(func::Function, ctx::Ptr{Cvoid}, param1::Ptr{Int32}, param2::Int32)::Vector{Float64}
    ptr = Ref{Ptr{Cdouble}}([])
    cnt = Vector{Cint}([0, 0])
    func(ctx, ptr, cnt, param1, param2)
    error_num = OpenDSSDirect.Lib.Error_Get_Number(ctx)
    if (error_num != 0)
        description = get_string(OpenDSSDirect.Lib.Error_Get_Description(ctx))
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
    OpenDSSDirect.Lib.DSS_Dispose_PDouble(ptr)
    return data
end

function get_float64_array(func::Function, ctx::Ptr{Cvoid}, param1::Float64, param2::Float64, param3::Int32)::Vector{Float64}
    ptr = Ref{Ptr{Cdouble}}([])
    cnt = Vector{Cint}([0, 0])
    func(ctx, ptr, cnt, param1, param2, param3)
    error_num = OpenDSSDirect.Lib.Error_Get_Number(ctx)
    if (error_num != 0)
        description = get_string(OpenDSSDirect.Lib.Error_Get_Description(ctx))
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
    OpenDSSDirect.Lib.DSS_Dispose_PDouble(ptr)
    return data
end


function get_complex64_array(func::Function, ctx::Ptr{Cvoid}, param1::Ptr{Int32}, param2::Int32)::Vector{ComplexF64}
    r = get_float64_array(func, ctx, param1, param2)
    if length(r) == 1
        return ComplexF64[]
    else
        r = Array(reinterpret(ComplexF64, r))
    end
    return r
end

function get_complex64_array(func::Function, ctx::Ptr{Cvoid}, param::Union{Bool,Int})::Vector{ComplexF64}
    r = get_float64_array(func, ctx, param)
    if length(r) == 1
        return ComplexF64[]
    else
        r = Array(reinterpret(ComplexF64, r))
    end
    return r
end

function get_complex64_array(func::Function, ctx::Ptr{Cvoid}, param1::Float64, param2::Float64, param3::Int32)::Vector{ComplexF64}
    r = get_float64_array(func, ctx, param1, param2, param3)
    if length(r) == 1
        return ComplexF64[]
    else
        r = Array(reinterpret(ComplexF64, r))
    end
    return r
end

function get_complex64_array(func::Function, ctx::Ptr{Cvoid})::Vector{ComplexF64}
    r = get_float64_array(func, ctx)
    if length(r) == 1
        return ComplexF64[]
    else
        r = Array(reinterpret(ComplexF64, r))
    end
    return r
end

function get_complex64(func::Function, ctx::Ptr{Cvoid})::ComplexF64
    return get_complex64_array(func, ctx)[1]
end

function prepare_float64_array(value::Vector{Float64})
    ptr = pointer(value)
    cnt = size(value)[1]
    return value, ptr, cnt
end

function set_int32_array(func::Function, ctx::Ptr{Cvoid}, value::Vector{Int32})
    func(ctx, pointer(value), size(value)[1])
    error_num = OpenDSSDirect.Lib.Error_Get_Number(ctx)
    if (error_num != 0)
        description = get_string(OpenDSSDirect.Lib.Error_Get_Description(ctx))
        throw(
            OpenDSSDirectException(
                "[ERROR $error_num] $description"
            )
        )
    end
end

function set_float64_array(func::Function, ctx::Ptr{Cvoid}, value::Vector{Float64})
    func(ctx, pointer(value), size(value)[1])
    error_num = OpenDSSDirect.Lib.Error_Get_Number(ctx)
    if (error_num != 0)
        description = get_string(OpenDSSDirect.Lib.Error_Get_Description(ctx))
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
    @assert expr.head == :call "Can only use @checked on function calls"
    @assert ( expr.args[1].head == :(.) ) && ( expr.args[1].args[1] == :Lib) "Can only use @checked on Lib.\$function"

    return esc(quote
        ans = $(expr)
        error_num = Lib.Error_Get_Number(C_NULL_CTX)
        if (error_num != 0)
            description = get_string(Lib.Error_Get_Description(C_NULL_CTX))
            throw(
                OpenDSSDirectException(
                    "[ERROR $error_num] $description"
                )
            )
        end
        ans
    end)
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
function Base.download(::Type{Examples}, folder::AbstractString=joinpath(@__DIR__, "../examples"); force::Bool=false)
    directory = abspath(normpath(folder))
    electricdss_tst_master_folder = joinpath(directory, "electricdss-tst-master")
    if force || !isdir(electricdss_tst_master_folder)
        url = "https://github.com/dss-extensions/electricdss-tst/archive/master.tar.gz"
        tempfilename = Base.download(url)
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
        bin7z = "$(joinpath(home, "..", "libexec", "7z"))"
    end
    @assert success(`$bin7z x $filename -y -o$directory`) "Unable to extract $filename to $directory"
end

end
