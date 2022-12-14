module Parser

using DocStringExtensions

using ..Lib
using ..Utils

@template (FUNCTIONS, METHODS) = """
                                 $(TYPEDSIGNATURES)
                                 $(DOCSTRING)
                                 """

"""Use this property to parse a Matrix token in OpenDSS format.  Returns square matrix of order specified. Order same as default Fortran order: column by column."""
function Matrix(ExpectedOrder)::Vector{Float64}
    return get_float64_array(Lib.Parser_Get_Matrix, C_NULL_CTX, ExpectedOrder)
end

"""Use this property to parse a matrix token specified in lower triangle form. Symmetry is forced."""
function SymMatrix(ExpectedOrder)::Vector{Float64}
    return get_float64_array(Lib.Parser_Get_SymMatrix, C_NULL_CTX, ExpectedOrder)
end

"""Returns token as array of doubles. For parsing quoted array syntax."""
function Vector(ExpectedSize)::Vector{Float64}
    return get_float64_array(Lib.Parser_Get_Vector, C_NULL_CTX, ExpectedSize)
end

function ResetDelimiters()
    @checked Lib.Parser_ResetDelimiters(C_NULL_CTX)
end

"""Default is FALSE. If TRUE parser automatically advances to next token after DblValue, IntValue, or StrValue. Simpler when you don't need to check for parameter names."""
function AutoIncrement()::Bool
    return @checked(Lib.Parser_Get_AutoIncrement(C_NULL_CTX)) != 0
end

"""Default is FALSE. If TRUE parser automatically advances to next token after DblValue, IntValue, or StrValue. Simpler when you don't need to check for parameter names."""
function AutoIncrement(Value::Bool)
    @checked Lib.Parser_Set_AutoIncrement(C_NULL_CTX, Value ? 1 : 0)
end

"""String containing the the characters for Quoting in OpenDSS scripts. Matching pairs defined in EndQuote. Default is "'([{."""
function BeginQuote()::String
    return get_string(Lib.Parser_Get_BeginQuote(C_NULL_CTX))
end

"""String containing the the characters for Quoting in OpenDSS scripts. Matching pairs defined in EndQuote. Default is "'([{."""
function BeginQuote(Value::String)
    @checked Lib.Parser_Set_BeginQuote(C_NULL_CTX, Value)
end

"""String to be parsed. Loading this string resets the Parser to the beginning of the line. Then parse off the tokens in sequence."""
function CmdString()::String
    return get_string(@checked Lib.Parser_Get_CmdString(C_NULL_CTX))
end

"""String to be parsed. Loading this string resets the Parser to the beginning of the line. Then parse off the tokens in sequence."""
function CmdString(Value::String)
    @checked Lib.Parser_Set_CmdString(C_NULL_CTX, Value)
end

"""Return next parameter as a double."""
function DblValue()::Float64
    return @checked Lib.Parser_Get_DblValue(C_NULL_CTX)
end

"""String defining hard delimiters used to separate token on the command string. Default is , and =. The = separates token name from token value. These override whitesspace to separate tokens."""
function Delimiters()::String
    return get_string(@checked Lib.Parser_Get_Delimiters(C_NULL_CTX))
end

"""String defining hard delimiters used to separate token on the command string. Default is , and =. The = separates token name from token value. These override whitesspace to separate tokens."""
function Delimiters(Value::String)
    @checked Lib.Parser_Set_Delimiters(C_NULL_CTX, Value)
end

"""String containing characters, in order, that match the beginning quote characters in BeginQuote. Default is `"')]}` (Getter)"""
function EndQuote()::String
    return get_string(@checked Lib.Parser_Get_EndQuote(C_NULL_CTX))
end

"""String containing characters, in order, that match the beginning quote characters in BeginQuote. Default is `"')]}` (Setter)"""
function EndQuote(Value::String)
    @checked Lib.Parser_Set_EndQuote(C_NULL_CTX, Value)
end

"""Return next parameter as a long integer."""
function IntValue()::Int
    return @checked Lib.Parser_Get_IntValue(C_NULL_CTX)
end

"""Get next token and return tag name (before = sign) if any. See AutoIncrement."""
function NextParam()::String
    return get_string(@checked Lib.Parser_Get_NextParam(C_NULL_CTX))
end

"""Return next parameter as a string"""
function StrValue()::String
    return get_string(@checked Lib.Parser_Get_StrValue(C_NULL_CTX))
end

"""Characters used for White space in the command string.  Default is blank and Tab. (Getter)"""
function WhiteSpace()::String
    return get_string(@checked Lib.Parser_Get_WhiteSpace(C_NULL_CTX))
end

"""Characters used for White space in the command string.  Default is blank and Tab. (Setter)"""
function WhiteSpace(Value::String)
    @checked Lib.Parser_Set_WhiteSpace(C_NULL_CTX, Value)
end

end
