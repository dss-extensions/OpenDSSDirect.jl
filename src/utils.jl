module Utils

import ..TypedDocStringExtensions
const TDSE = TypedDocStringExtensions

using ..OpenDSSDirect

export get_string
export get_string_array
export get_int8_array
export get_int32_array
export get_float64_array
export get_complex64_array
export get_complex64
export prepare_float64_array
export prepare_int32_array
export prepare_string_array
export OpenDSSDirectException

function get_string(cstring::Cstring)::String
    return unsafe_string(cstring)
end

function get_string_array(func::Function)::Vector{String}
    ptr = Ref{Ptr{Cstring}}([])
    cnt = Vector{Cint}([0, 0])
    func(ptr, cnt)
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

function get_int32_array(func::Function)::Vector{Int}
    ptr = Ref{Ptr{Cint}}([])
    cnt = Vector{Cint}([0, 0])
    func(ptr, cnt)
    data = Vector{Int}([])
    for i in 1:cnt[1]
        push!(data, Int(unsafe_load(ptr[], i)))
    end
    OpenDSSDirect.Lib.DSS_Dispose_PInteger(ptr)
    return data
end

function get_int8_array(func::Function)::Vector{Int8}
    ptr = Ref{Ptr{Int8}}([])
    cnt = Vector{Cint}([0, 0])
    func(ptr, cnt)
    data = Vector{Int8}([])
    for i in 1:cnt[1]
        push!(data, unsafe_load(ptr[], i))
    end
    OpenDSSDirect.Lib.DSS_Dispose_PByte(ptr)
    return data
end


function get_float64_array(func::Function)::Vector{Float64}
    ptr = Ref{Ptr{Cdouble}}([])
    cnt = Vector{Cint}([0, 0])
    func(ptr, cnt)
    data = Vector{Float64}([])
    for i in 1:cnt[1]
        push!(data, unsafe_load(ptr[], i))
    end
    OpenDSSDirect.Lib.DSS_Dispose_PDouble(ptr)
    return data
end

function get_complex64_array(func::Function)::Vector{ComplexF64}
    r = get_float64_array(func)
    if length(r) == 1
        return ComplexF64[]
    else
        r = Array(reinterpret(ComplexF64, r))
    end
    return r
end

function get_complex64(func::Function)::ComplexF64
    return get_complex64_array(func)[1]
end

function prepare_float64_array(value::Vector{Float64})
    ptr = pointer(value)
    cnt = size(value)[1]
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


struct OpenDSSDirectException <: Exception end

"""
Return a column-format `NamedTuple` of all attributes of the given Module.

Example:

    nt = OpenDSSDirect.Utils.table(Loads)
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
$(TDSE.FULLSIGNATURES)
Download examples into a "electricdss-tst-master" folder in given argument path.
Defaults to the "examples" folder in the OpenDSSDirect package.

Returns the downloaded folder name.
"""
function Base.download(::Type{Examples}, folder::AbstractString=joinpath(@__DIR__, "../examples") |> abspath; force::Bool=false)
    directory = folder |> normpath |> abspath
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
    @assert success(`$home/7z x $filename -y -o$directory`) "Unable to extract $filename to $directory"
end

end
