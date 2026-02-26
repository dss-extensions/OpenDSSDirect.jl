module Text

using DocStringExtensions

using ..Lib
using ..Utils

@template (FUNCTIONS, METHODS) = """
                                 $(TYPEDSIGNATURES)
                                 $(DOCSTRING)
                                 """

export dss

"""
Input command string for the DSS.

(Getter)
"""
function Command(dss::DSSContext)::String
    return get_string(@checked dss_ccall(dss.capi.Text_Get_Command, dss.ctx))
end
Command() = Command(DSS_DEFAULT_CTX)

"""
Input command string for the DSS.

(Setter)
"""
function Command(dss::DSSContext, Value::String)::String
    value = readlines(IOBuffer(Value))
    r = Vector{String}([])
    for v in value
        @checked dss_ccall(dss.capi.Text_Set_Command, dss.ctx, v)
        push!(r, Result())
        if length(r[end]) > 0
            @warn "Result of running OpenDSS Command \"$v\" is: $(r[end])"
        end
    end
    res = strip(join(r, "\n"))
    return res
end
Command(Value::String) = Command(DSS_DEFAULT_CTX, Value)

"""
Result string for the last command.
"""
function Result(dss::DSSContext)::String
    return get_string(@checked dss_ccall(dss.capi.Text_Get_Result, dss.ctx))
end
Result() = Result(DSS_DEFAULT_CTX)

"""
Runs a list of commands all at once in the engine.
Ignores potential intermediate output in the global result.

**(API Extension)**
"""
function Command(dss::DSSContext, Value::Vector{String})
    Value, ValuePtr, ValueCount = prepare_string_array(Value)
    @checked dss_ccall(dss.capi.Text_CommandArray, dss.ctx, ValuePtr, ValueCount)
end
Command(Value::Vector{String}) = Command(DSS_DEFAULT_CTX, Value)

"""
Runs a large string (block) containing many lines of commands.
Ignores potential intermediate output in the global result.

**(API Extension)**
"""
function CommandBlock(dss::DSSContext, Value::String)::String
    @checked dss_ccall(dss.capi.Text_CommandBlock, dss.ctx, Value)
end
CommandBlock(Value::String) = CommandBlock(DSS_DEFAULT_CTX, Value)

const dss = Command

end
