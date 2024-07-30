module ActiveClass

using DocStringExtensions

using ..Lib
using ..Utils

@template (FUNCTIONS, METHODS) = """
                                 $(TYPEDSIGNATURES)
                                 $(DOCSTRING)
                                 """

"""Returns name of active class."""
function ActiveClassName(dss::DSSContext)::String
    return get_string(@checked Lib.ActiveClass_Get_ActiveClassName(dss.ctx))
end
ActiveClassName() = ActiveClassName(DSS_DEFAULT_CTX)


"""Returns the name of the parent class of the active class."""
function ActiveClassParent(dss::DSSContext)::String
    return get_string(@checked Lib.ActiveClass_Get_ActiveClassParent(dss.ctx))
end
ActiveClassParent() = ActiveClassParent(DSS_DEFAULT_CTX)


"""Array of strings consisting of all element names in the active class."""
function AllNames(dss::DSSContext)::Vector{String}
    return get_string_array(Lib.ActiveClass_Get_AllNames, dss.ctx)
end
AllNames() = AllNames(DSS_DEFAULT_CTX)


"""Number of elements in Active Class. Same as NumElements Property."""
function Count(dss::DSSContext)::Int
    return @checked Lib.ActiveClass_Get_Count(dss.ctx)
end
Count() = Count(DSS_DEFAULT_CTX)


"""Sets first element in the active class to be the active DSS object. If object is a CktElement, ActiveCktELment also points to this element. Returns 0 if none."""
function First(dss::DSSContext)::Int
    return @checked Lib.ActiveClass_Get_First(dss.ctx)
end
First() = First(DSS_DEFAULT_CTX)


"""Name of the Active Element of the Active Class (Getter)"""
function Name(dss::DSSContext)::String
    return get_string(Lib.ActiveClass_Get_Name(dss.ctx))
end
Name() = Name(DSS_DEFAULT_CTX)

"""Name of the Active Element of the Active Class (Setter)"""
function Name(dss::DSSContext, Value::String)
    @checked Lib.ActiveClass_Set_Name(dss.ctx, Cstring(pointer(Value)))
end
Name(Value::String) = Name(DSS_DEFAULT_CTX, Value)


"""Sets next element in active class to be the active DSS object. If object is a CktElement, ActiveCktElement also points to this element.  Returns 0 if no more."""
function Next(dss::DSSContext)::Int
    return @checked Lib.ActiveClass_Get_Next(dss.ctx)
end
Next() = Next(DSS_DEFAULT_CTX)


"""Number of elements in this class. Same as Count property."""
function NumElements(dss::DSSContext)::Int
    return @checked Lib.ActiveClass_Get_NumElements(dss.ctx)
end
NumElements() = NumElements(DSS_DEFAULT_CTX)

"""Returns the data (as a list) of all elements from the active class as a JSON-encoded string.

The `options` parameter contains bit-flags to toggle specific features.
See `Obj_ToJSON` (C-API) for more.

Additionally, the `ExcludeDisabled` flag can be used to exclude disabled elements from the output.

(API Extension)"""
function ToJSON(dss::DSSContext, Flags::Int)::String #TODO: Use enum
    return get_string(@checked Lib.ActiveClass_ToJSON(dss.ctx, Flags))
end
ToJSON(Flags::Int) = ToJSON(DSS_DEFAULT_CTX, Flags)

end # ActiveClass
