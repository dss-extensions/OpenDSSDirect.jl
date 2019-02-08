module Parser

    import ..Lib
    import ..Utils
    import ..TypedDocStringExtensions

    TypedDocStringExtensions.@template (FUNCTIONS, METHODS) =
        """
        $(TypedDocStringExtensions.FULLSIGNATURES)
        $(TypedDocStringExtensions.DOCSTRING)
        """

    """Use this property to parse a Matrix token in OpenDSS format.  Returns square matrix of order specified. Order same as default Fortran order: column by column."""
    function Matrix(ExpectedOrder)::Vector{Float64}
        error("Not implemented yet. Please contact the developer.")
        return Utils.get_float64_array(Lib.Parser_Get_Matrix, ExpectedOrder)
    end

    """Use this property to parse a matrix token specified in lower triangle form. Symmetry is forced."""
    function SymMatrix(ExpectedOrder)::Vector{Float64}
        error("Not implemented yet. Please contact the developer.")
        return Utils.get_float64_array(Lib.Parser_Get_SymMatrix, ExpectedOrder)
    end

    """Returns token as array of doubles. For parsing quoted array syntax."""
    function Vector(ExpectedSize)::Vector{Float64}
        error("Not implemented yet. Please contact the developer.")
        return Utils.get_float64_array(Lib.Parser_Get_Vector, ExpectedSize)
    end

    function ResetDelimiters()
        Lib.Parser_ResetDelimiters()
    end

    """Default is FALSE. If TRUE parser automatically advances to next token after DblValue, IntValue, or StrValue. Simpler when you don't need to check for parameter names."""
    function AutoIncrement()::Bool
        return Lib.Parser_Get_AutoIncrement() != 0
    end

    """Default is FALSE. If TRUE parser automatically advances to next token after DblValue, IntValue, or StrValue. Simpler when you don't need to check for parameter names."""
    function AutoIncrement(Value::Bool)
        Lib.Parser_Set_AutoIncrement(Value ? 1 : 0)
    end

    """String containing the the characters for Quoting in OpenDSS scripts. Matching pairs defined in EndQuote. Default is "'([{."""
    function BeginQuote()::String
        return Utils.get_string(Lib.Parser_Get_BeginQuote())
    end

    """String containing the the characters for Quoting in OpenDSS scripts. Matching pairs defined in EndQuote. Default is "'([{."""
    function BeginQuote(Value::String)
        Lib.Parser_Set_BeginQuote(Value)
    end

    """String to be parsed. Loading this string resets the Parser to the beginning of the line. Then parse off the tokens in sequence."""
    function CmdString()::String
        return Utils.get_string(Lib.Parser_Get_CmdString())
    end

    """String to be parsed. Loading this string resets the Parser to the beginning of the line. Then parse off the tokens in sequence."""
    function CmdString(Value::String)
        Lib.Parser_Set_CmdString(Value)
    end

    """Return next parameter as a double."""
    function DblValue()::Float64
        return Lib.Parser_Get_DblValue()
    end

    """String defining hard delimiters used to separate token on the command string. Default is , and =. The = separates token name from token value. These override whitesspace to separate tokens."""
    function Delimiters()::String
        return Utils.get_string(Lib.Parser_Get_Delimiters())
    end

    """String defining hard delimiters used to separate token on the command string. Default is , and =. The = separates token name from token value. These override whitesspace to separate tokens."""
    function Delimiters(Value::String)
        Lib.Parser_Set_Delimiters(Value)
    end

    """String containing characters, in order, that match the beginning quote characters in BeginQuote. Default is `"')]}` (Getter)"""
    function EndQuote()::String
        return Utils.get_string(Lib.Parser_Get_EndQuote())
    end

    """String containing characters, in order, that match the beginning quote characters in BeginQuote. Default is `"')]}` (Setter)"""
    function EndQuote(Value::String)
        Lib.Parser_Set_EndQuote(Value)
    end

    """Return next parameter as a long integer."""
    function IntValue()::Int
        return Lib.Parser_Get_IntValue()
    end

    """Get next token and return tag name (before = sign) if any. See AutoIncrement."""
    function NextParam()::String
        return Utils.get_string(Lib.Parser_Get_NextParam())
    end

    """Return next parameter as a string"""
    function StrValue()::String
        return Utils.get_string(Lib.Parser_Get_StrValue())
    end

    """Characters used for White space in the command string.  Default is blank and Tab. (Getter)"""
    function WhiteSpace()::String
        return Utils.get_string(Lib.Parser_Get_WhiteSpace())
    end

    """Characters used for White space in the command string.  Default is blank and Tab. (Setter)"""
    function WhiteSpace(Value::String)
        Lib.Parser_Set_WhiteSpace(Value)
    end

end

