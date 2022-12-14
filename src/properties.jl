module Properties

using DocStringExtensions

using ..Lib
using ..Utils

@template (FUNCTIONS, METHODS) = """
                                 $(TYPEDSIGNATURES)
                                 $(DOCSTRING)
                                 """

"""Description of the property."""
function Description()::String
    return get_string(@checked Lib.DSSProperty_Get_Description(C_NULL_CTX))
end

"""Name of Property"""
function Name()::String
    return get_string(@checked Lib.DSSProperty_Get_Name(C_NULL_CTX))
end

"""Sets the current DSS property based on a 1-based integer (or integer as a string) as an property index, or a string as a property name."""
function _setCurrentProperty(argIndex::Int)
    if argIndex <= 0
        error("argIndex must be positive, not $argIndex.")
    end
    @checked Lib.DSSProperty_Set_Index(C_NULL_CTX, argIndex - 1)
end

function _setCurrentProperty(Name::String)
    argIndex = tryparse(Int, Name)
    if argIndex isa Int
        _setCurrentProperty(argIndex)
    else
        @checked Lib.DSSProperty_Set_Name(C_NULL_CTX, Name)
    end

end

"""Value of Property (Getter)"""
function Value()::String
    return get_string(@checked Lib.DSSProperty_Get_Val(C_NULL_CTX))
end

"""Value of Property of Index or Name (getter)"""
function Value(argIndex_or_Name::Union{String,Int})::String
    _setCurrentProperty(argIndex_or_Name)
    return get_string(@checked Lib.DSSProperty_Get_Val(C_NULL_CTX))
end

"""Value of Property of Index or Name (setter)"""
function Value(argIndex_or_Name::Union{String,Int}, Value::String)
    _setCurrentProperty(argIndex_or_Name)
    @checked Lib.DSSProperty_Set_Val(C_NULL_CTX, Value)
end

end
