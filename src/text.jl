module Text

    using ..Lib
    using ..Utils

    """Input command string for the DSS. (Getter)"""
    function Command()::String
        get_string(Lib.Text_Get_Command())
    end

    """Input command string for the DSS. (Setter)"""
    function Command(Value::String)::String
        Value = readlines(IOBuffer(Value))
        r = Vector{String}([])
        for v in Value
            Lib.Text_Set_Command(v)
            # TODO: Lib.CheckForError()
            push!(r, Result())
        end
        res = join(r, "\n") |> strip
        if length(res) > 0
            @warn "Result of running OpenDSS Command: $res"
        end
        return res
    end

    """(read-only) Result string for the last command."""
    function Result()::String
        get_string(Lib.Text_Get_Result())
    end

end

