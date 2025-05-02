module Properties

using DocStringExtensions

using ..Lib
using ..Utils

@template (FUNCTIONS, METHODS) = """
                                 $(TYPEDSIGNATURES)
                                 $(DOCSTRING)
                                 """

"""Description of the property."""
function Description(dss::DSSContext)::String
    return get_string(@checked Lib.DSSProperty_Get_Description(dss.ctx))
end
Description() = Description(DSS_DEFAULT_CTX)

"""Name of Property"""
function Name(dss::DSSContext)::String
    return get_string(@checked Lib.DSSProperty_Get_Name(dss.ctx))
end
Name() = Name(DSS_DEFAULT_CTX)

"""
Sets the current DSS property based on a 1-based integer (or integer as a string) as an property index, or a string as a property name.
"""
function _setCurrentProperty(dss::DSSContext, argIndex::Int)
    if argIndex <= 0
        error("argIndex must be positive, not $argIndex.")
    end
    @checked Lib.DSSProperty_Set_Index(dss.ctx, argIndex - 1)
end
_setCurrentProperty(argIndex::Int) = _setCurrentProperty(DSS_DEFAULT_CTX, argIndex)

function _setCurrentProperty(dss::DSSContext, Name::String)
    argIndex = tryparse(Int, Name)
    if argIndex isa Int
        _setCurrentProperty(argIndex)
    else
        @checked Lib.DSSProperty_Set_Name(dss.ctx, Name)
    end

end
_setCurrentProperty(Name::String) = _setCurrentProperty(DSS_DEFAULT_CTX, Name)

"""
Value of Property

(Getter)
"""
function Value(dss::DSSContext)::String
    return get_string(@checked Lib.DSSProperty_Get_Val(dss.ctx))
end
Value() = Value(DSS_DEFAULT_CTX)

"""
Value of Property of Index or Name 

(Getter)
"""
function Value(dss::DSSContext, argIndex_or_Name::Union{String,Int})::String
    _setCurrentProperty(argIndex_or_Name)
    return get_string(@checked Lib.DSSProperty_Get_Val(dss.ctx))
end
Value(argIndex_or_Name::Union{String,Int}) = Value(DSS_DEFAULT_CTX, argIndex_or_Name)

"""
Value of Property of Index or Name

(Setter)
"""
function Value(dss::DSSContext, argIndex_or_Name::Union{String,Int}, value::String)
    _setCurrentProperty(argIndex_or_Name)
    @checked Lib.DSSProperty_Set_Val(dss.ctx, value)
end
Value(argIndex_or_Name::Union{String,Int}, value::String) = Value(DSS_DEFAULT_CTX, argIndex_or_Name, value)

end
