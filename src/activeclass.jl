module ActiveClass

using DocStringExtensions

using ..Lib
using ..Utils

@template (FUNCTIONS, METHODS) = """
                                 $(TYPEDSIGNATURES)
                                 $(DOCSTRING)
                                 """

"""Returns name of active class."""
function ActiveClassName()::String
    return get_string(@checked Lib.ActiveClass_Get_ActiveClassName(C_NULL_CTX))
end


"""Returns the name of the parent class of the active class."""
function ActiveClassParent()::String
    return get_string(@checked Lib.ActiveClass_Get_ActiveClassParent(C_NULL_CTX))
end


"""Array of strings consisting of all element names in the active class."""
function AllNames()::Vector{String}
    return get_string_array(Lib.ActiveClass_Get_AllNames, C_NULL_CTX)
end


"""Number of elements in Active Class. Same as NumElements Property."""
function Count()::Int
    return @checked Lib.ActiveClass_Get_Count(C_NULL_CTX)
end


"""Sets first element in the active class to be the active DSS object. If object is a CktElement, ActiveCktELment also points to this element. Returns 0 if none."""
function First()::Int
    return @checked Lib.ActiveClass_Get_First(C_NULL_CTX)
end


"""Name of the Active Element of the Active Class (Getter)"""
function Name()::String
    return get_string(Lib.ActiveClass_Get_Name(C_NULL_CTX))
end

"""Name of the Active Element of the Active Class (Setter)"""
function Name(Value::String)
    @checked Lib.ActiveClass_Set_Name(C_NULL_CTX, Cstring(pointer(Value)))
end


"""Sets next element in active class to be the active DSS object. If object is a CktElement, ActiveCktElement also points to this element.  Returns 0 if no more."""
function Next()::Int
    return @checked Lib.ActiveClass_Get_Next(C_NULL_CTX)
end


"""Number of elements in this class. Same as Count property."""
function NumElements()::Int
    return @checked Lib.ActiveClass_Get_NumElements(C_NULL_CTX)
end

"""Returns the data (as a list) of all elements from the active class as a JSON-encoded string.

The `options` parameter contains bit-flags to toggle specific features.
See `Obj_ToJSON` (C-API) for more.

Additionally, the `ExcludeDisabled` flag can be used to exclude disabled elements from the output.

(API Extension)"""
function ToJSON(Flags::Int)::String #TODO: Use enum
    return getstring(@checked Lib.ActiveClass_ToJSON(C_NULL_CTX, Flags))
end

end # ActiveClass
