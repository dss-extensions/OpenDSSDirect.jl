module Utils

using ..OpenDSSDirect

export get_string
export get_string_array
export get_int8_array
export get_int32_array
export get_float64_array
export get_complex64_array
export get_complex64
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
    ptr = Ref{Ptr{Cdouble}}([])
    cnt = Vector{Cint}([0, 0])
    func(ptr, cnt)
    data = Vector{ComplexF64}([])
    for i in 1:2:cnt[1]
        push!(data, ComplexF64(unsafe_load(ptr[], i), unsafe_load(ptr[], i+1)))
    end
    OpenDSSDirect.Lib.DSS_Dispose_PDouble(ptr)
    return data
end

function get_complex64(func::Function)::ComplexF64
    return get_complex64_array(func)[1]
end

struct OpenDSSDirectException <: Exception end

end
