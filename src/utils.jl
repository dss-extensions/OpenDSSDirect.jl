module utils

using ..OpenDSSDirect

export get_string, get_string_array, get_float64_array, OpenDSSDirectException

function get_string(cstring::Cstring)::String
    return unsafe_string(cstring)
end

function get_string_array(func::Function)
    ptr = Ref{Ptr{Cstring}}([])
    cnt = Vector{Cint}([0, 0])
    func(ptr, cnt)
    data = Vector{String}([])
    for i in 1:cnt[1]
        push!(data, unsafe_string(unsafe_load(ptr[], i)))
    end
    OpenDSSDirect.lib.DSS_Dispose_PPAnsiChar(ptr, cnt[2])
    return data
end

function get_float64_array(func::Function)
    ptr = Ref{Ptr{Cdouble}}([])
    cnt = Vector{Cint}([0, 0])
    func(ptr, cnt)
    data = Vector{Float64}([])
    for i in 1:cnt[1]
        push!(data, unsafe_load(ptr[], i))
    end
    OpenDSSDirect.lib.DSS_Dispose_PDouble(ptr)
    return data
end

struct OpenDSSDirectException <: Exception end

end
