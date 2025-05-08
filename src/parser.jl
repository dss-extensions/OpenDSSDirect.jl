module Parser

using DocStringExtensions

using ..Lib
using ..Utils

@template (FUNCTIONS, METHODS) = """
                                 $(TYPEDSIGNATURES)
                                 $(DOCSTRING)
                                 """

"""
Use this property to parse a Matrix token in OpenDSS format.
Returns square matrix of order specified. Order same as default Fortran order: column by column.
"""
function Matrix(dss::DSSContext, ExpectedOrder)::Vector{Float64}
    return get_float64_array(dss.capi.Parser_Get_Matrix, dss, ExpectedOrder)
end
Matrix(ExpectedOrder) = Matrix(DSS_DEFAULT_CTX, ExpectedOrder)

"""Use this property to parse a matrix token specified in lower triangle form. Symmetry is forced."""
function SymMatrix(dss::DSSContext, ExpectedOrder)::Vector{Float64}
    return get_float64_array(dss.capi.Parser_Get_SymMatrix, dss, ExpectedOrder)
end
SymMatrix(ExpectedOrder) = SymMatrix(DSS_DEFAULT_CTX, ExpectedOrder)

"""Returns token as array of doubles. For parsing quoted array syntax."""
function Vector(dss::DSSContext, ExpectedSize)::Vector{Float64}
    return get_float64_array(dss.capi.Parser_Get_Vector, dss, ExpectedSize)
end
Vector(ExpectedSize) = Vector(DSS_DEFAULT_CTX, ExpectedSize)

"""
Reset the delimiters to their default values.

Original COM help: <https://opendss.epri.com/ResetDelimiters.html>
"""
function ResetDelimiters(dss::DSSContext)
    @checked dss_ccall(dss.capi.Parser_ResetDelimiters, dss.ctx)
end
ResetDelimiters() = ResetDelimiters(DSS_DEFAULT_CTX)

"""
Default is FALSE. If TRUE, the parser automatically advances to next token after DblValue, IntValue, or StrValue. Simpler when you don't need to check for parameter names.

Original COM help: <https://opendss.epri.com/AutoIncrement.html>

(Getter)
"""
function AutoIncrement(dss::DSSContext)::Bool
    return @checked(dss_ccall(dss.capi.Parser_Get_AutoIncrement, dss.ctx)) != 0
end
AutoIncrement() = AutoIncrement(DSS_DEFAULT_CTX)

"""
Default is FALSE. If TRUE, the parser automatically advances to next token after DblValue, IntValue, or StrValue. Simpler when you don't need to check for parameter names.

Original COM help: <https://opendss.epri.com/AutoIncrement.html>

(Setter)
"""
function AutoIncrement(dss::DSSContext, Value::Bool)
    @checked dss_ccall(dss.capi.Parser_Set_AutoIncrement, dss.ctx, Value ? 1 : 0)
end
AutoIncrement(Value::Bool) = AutoIncrement(DSS_DEFAULT_CTX, Value)

"""
Get/Set String containing the the characters for Quoting in OpenDSS scripts. Matching pairs defined in EndQuote. Default is "'([{.

Original COM help: <https://opendss.epri.com/BeginQuote.html>

(Getter)
"""
function BeginQuote(dss::DSSContext)::String
    return get_string(dss_ccall(dss.capi.Parser_Get_BeginQuote, dss.ctx))
end
BeginQuote() = BeginQuote(DSS_DEFAULT_CTX)

"""
Get/Set String containing the the characters for Quoting in OpenDSS scripts. Matching pairs defined in EndQuote. Default is "'([{.

Original COM help: <https://opendss.epri.com/BeginQuote.html>

(Setter)
"""
function BeginQuote(dss::DSSContext, Value::String)
    @checked dss_ccall(dss.capi.Parser_Set_BeginQuote, dss.ctx, Value)
end
BeginQuote(Value::String) = BeginQuote(DSS_DEFAULT_CTX, Value)

"""
String to be parsed. Loading this string resets the Parser to the beginning of the line. Then parse off the tokens in sequence.

Original COM help: <https://opendss.epri.com/CmdString.html>

(Getter)
"""
function CmdString(dss::DSSContext)::String
    return get_string(@checked dss_ccall(dss.capi.Parser_Get_CmdString, dss.ctx))
end
CmdString() = CmdString(DSS_DEFAULT_CTX)

"""
String to be parsed. Loading this string resets the Parser to the beginning of the line. Then parse off the tokens in sequence.

Original COM help: <https://opendss.epri.com/CmdString.html>

(Setter)
"""
function CmdString(dss::DSSContext, Value::String)
    @checked dss_ccall(dss.capi.Parser_Set_CmdString, dss.ctx, Value)
end
CmdString(Value::String) = CmdString(DSS_DEFAULT_CTX, Value)

"""
Return next parameter as a double.

Original COM help: <https://opendss.epri.com/DblValue.html>
"""
function DblValue(dss::DSSContext)::Float64
    return @checked dss_ccall(dss.capi.Parser_Get_DblValue, dss.ctx)
end
DblValue() = DblValue(DSS_DEFAULT_CTX)

"""
String defining hard delimiters used to separate token on the command string. Default is , and =. The = separates token name from token value. These override whitespace to separate tokens.

Original COM help: <https://opendss.epri.com/Delimiters.html>

(Getter)
"""
function Delimiters(dss::DSSContext)::String
    return get_string(@checked dss_ccall(dss.capi.Parser_Get_Delimiters, dss.ctx))
end
Delimiters() = Delimiters(DSS_DEFAULT_CTX)

"""
String defining hard delimiters used to separate token on the command string. Default is , and =. The = separates token name from token value. These override whitespace to separate tokens.

Original COM help: <https://opendss.epri.com/Delimiters.html>

(Setter)
"""
function Delimiters(dss::DSSContext, Value::String)
    @checked dss_ccall(dss.capi.Parser_Set_Delimiters, dss.ctx, Value)
end
Delimiters(Value::String) = Delimiters(DSS_DEFAULT_CTX, Value)

"""
String containing characters, in order, that match the beginning quote characters in BeginQuote. Default is "')]}

Original COM help: <https://opendss.epri.com/EndQuote.html>

(Getter)
"""
function EndQuote(dss::DSSContext)::String
    return get_string(@checked dss_ccall(dss.capi.Parser_Get_EndQuote, dss.ctx))
end
EndQuote() = EndQuote(DSS_DEFAULT_CTX)

"""
String containing characters, in order, that match the beginning quote characters in BeginQuote. Default is "')]}

Original COM help: <https://opendss.epri.com/EndQuote.html>

(Setter)
"""
function EndQuote(dss::DSSContext, Value::String)
    @checked dss_ccall(dss.capi.Parser_Set_EndQuote, dss.ctx, Value)
end
EndQuote(Value::String) = EndQuote(DSS_DEFAULT_CTX, Value)

"""
Return next parameter as a long integer.

Original COM help: <https://opendss.epri.com/IntValue.html>
"""
function IntValue(dss::DSSContext)::Int
    return @checked dss_ccall(dss.capi.Parser_Get_IntValue, dss.ctx)
end
IntValue() = IntValue(DSS_DEFAULT_CTX)

"""
Get next token and return tag name (before = sign) if any. See AutoIncrement.

Original COM help: <https://opendss.epri.com/NextParam.html>
"""
function NextParam(dss::DSSContext)::String
    return get_string(@checked dss_ccall(dss.capi.Parser_Get_NextParam, dss.ctx))
end
NextParam() = NextParam(DSS_DEFAULT_CTX)

"""
Return next parameter as a string

Original COM help: <https://opendss.epri.com/StrValue.html>
"""
function StrValue(dss::DSSContext)::String
    return get_string(@checked dss_ccall(dss.capi.Parser_Get_StrValue, dss.ctx))
end
StrValue() = StrValue(DSS_DEFAULT_CTX)

"""
Get/set the characters used for White space in the command string.  Default is blank and Tab.

Original COM help: <https://opendss.epri.com/WhiteSpace.html>

(Getter)
"""
function WhiteSpace(dss::DSSContext)::String
    return get_string(@checked dss_ccall(dss.capi.Parser_Get_WhiteSpace, dss.ctx))
end
WhiteSpace() = WhiteSpace(DSS_DEFAULT_CTX)

"""
Get/set the characters used for White space in the command string.  Default is blank and Tab.

Original COM help: <https://opendss.epri.com/WhiteSpace.html>

(Setter)
"""
function WhiteSpace(dss::DSSContext, Value::String)
    @checked dss_ccall(dss.capi.Parser_Set_WhiteSpace, dss.ctx, Value)
end
WhiteSpace(Value::String) = WhiteSpace(DSS_DEFAULT_CTX, Value)

end
