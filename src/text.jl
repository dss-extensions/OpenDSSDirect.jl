module Text

    import ..Lib
    import ..Utils
    import ..TypedDocStringExtensions

    TypedDocStringExtensions.@template (FUNCTIONS, METHODS) =
        """
        $(TypedDocStringExtensions.FULLSIGNATURES)
        $(TypedDocStringExtensions.DOCSTRING)
        """

    export dss

    """Input command string for the DSS. (Getter)"""
    function Command()::String
        return Utils.get_string(Utils.@checked Lib.Text_Get_Command())
    end

    """Input command string for the DSS. (Setter)"""
    function Command(Value::String)::String
        value = readlines(IOBuffer(Value))
        r = Vector{String}([])
        for v in value
            Utils.@checked Lib.Text_Set_Command(v)
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
        return Utils.get_string(Utils.@checked Lib.Text_Get_Result())
    end

    const dss = Command

end

