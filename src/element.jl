module Element

using DocStringExtensions

using ..Lib
using ..Utils

@template (FUNCTIONS, METHODS) = """
                                 $(TYPEDSIGNATURES)
                                 $(DOCSTRING)
                                 """

"""Array of strings containing the names of all properties for the active DSS object."""
function AllPropertyNames()::Vector{String}
    return get_string_array(Lib.DSSElement_Get_AllPropertyNames, C_NULL_CTX)
end

"""Full Name of Active DSS Object (general element or circuit element)."""
function Name()::String
    return get_string(Lib.DSSElement_Get_Name(C_NULL_CTX))
end

"""Number of Properties for the active DSS object."""
function NumProperties()::Int
    return @checked Lib.DSSElement_Get_NumProperties(C_NULL_CTX)
end

"""Returns the properties of the active DSS object as a JSON-encoded string.

The `options` parameter contains bit-flags to toggle specific features.
See `Obj_ToJSON` (C-API) for more.

(API Extension)
"""
function ToJSON(Flags::Int)::String #TODO: use enum
    return getstring(@checked Lib.DSSElement_ToJSON(C_NULL_CTX, Flags))
end

end
