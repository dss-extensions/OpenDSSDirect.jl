module Text

using DocStringExtensions

using ..Lib
using ..Utils

@template (FUNCTIONS, METHODS) = """
                                 $(TYPEDSIGNATURES)
                                 $(DOCSTRING)
                                 """

export dss

"""Input command string for the DSS. (Getter)"""
function Command()::String
    return get_string(@checked Lib.Text_Get_Command(C_NULL_CTX))
end

"""Input command string for the DSS. (Setter)"""
function Command(Value::String)::String
    value = readlines(IOBuffer(Value))
    r = Vector{String}([])
    for v in value
        @checked Lib.Text_Set_Command(C_NULL_CTX, v)
        push!(r, Result())
        if length(r[end]) > 0
            @warn "Result of running OpenDSS Command \"$v\" is: $(r[end])"
        end
    end
    res = strip(join(r, "\n"))
    return res
end

"""Result string for the last command."""
function Result()::String
    return get_string(@checked Lib.Text_Get_Result(C_NULL_CTX))
end

"""Runs a list of commands all at once in the engine.
Ignores potential intermediate output in the global result.

(API Extension)"""
function Command(Value::Vector{String})
    Value, ValuePtr, ValueCount = prepare_string_array(Value)
    @checked Lib.Text_CommandArray(C_NULL_CTX, ValuePtr, ValueCount)
end

"""Runs a large string (block) containing many lines of commands.
Ignores potential intermediate output in the global result.

(API Extension)"""
function CommandBlock(Value::String)::String
    @checked Lib.Text_CommandBlock(C_NULL_CTX, Value)
end

const dss = Command

end
