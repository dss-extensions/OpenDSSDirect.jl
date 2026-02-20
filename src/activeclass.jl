module ActiveClass

using DocStringExtensions

using ..Lib
using ..Utils

@template (FUNCTIONS, METHODS) = """
                                 $(TYPEDSIGNATURES)
                                 $(DOCSTRING)
                                 """


"""Array of names of all objects in the current ActiveClass."""
function AllNames(dss::DSSContext)::Vector{String}
    return get_string_array(dss.capi.ActiveClass_Get_AllNames, dss)
end
AllNames() = AllNames(DSS_DEFAULT_CTX)

"""Gets the name of the active object in ActiveClass."""
function Name(dss::DSSContext)::String
    return get_string(@checked dss_ccall(dss.capi.ActiveClass_Get_Name, dss.ctx))
end
Name() = Name(DSS_DEFAULT_CTX)

"""Activates an object from ActiveClass by name."""
function Name(dss::DSSContext, Value::String)
    @checked dss_ccall(dss.capi.ActiveClass_Set_Name, dss.ctx, Value)
end
Name(Value::String) = Name(DSS_DEFAULT_CTX, Value)

"""Number of objects in the current ActiveClass in the Active Circuit"""
function Count(dss::DSSContext)::Int
    return @checked dss_ccall(dss.capi.ActiveClass_Get_Count, dss.ctx)
end
Count() = Count(DSS_DEFAULT_CTX)

"""
Activates the first object in the ActiveClass.
Returns 0 if none.
"""
function First(dss::DSSContext)::Int
    return @checked dss_ccall(dss.capi.ActiveClass_Get_First, dss.ctx)
end
First() = First(DSS_DEFAULT_CTX)

"""
Activates the next object in the ActiveClass.
Returns 0 if no more.
"""
function Next(dss::DSSContext)::Int
    return @checked dss_ccall(dss.capi.ActiveClass_Get_Next, dss.ctx)
end
Next() = Next(DSS_DEFAULT_CTX)

"""
Returns the current object index in ActiveClass (1-based)

(Getter)
"""
function Idx(dss::DSSContext)::Int
    return @checked dss_ccall(dss.capi.ActiveClass_Get_idx, dss.ctx)
end
Idx() = Idx(DSS_DEFAULT_CTX)

"""
Activate an object in the ActiveClass by index (1-based)

(Setter)
"""
function Idx(dss::DSSContext, Value::Int)
    @checked dss_ccall(dss.capi.ActiveClass_Set_idx, dss.ctx, Value)
end
Idx(Value::Int) = Idx(DSS_DEFAULT_CTX, Value)

"""
Returns name of active class.

Original COM help: <https://opendss.epri.com/ActiveClassName.html>
"""
function ActiveClassName(dss::DSSContext)::String
    return get_string(@checked dss_ccall(dss.capi.ActiveClass_Get_ActiveClassName, dss.ctx))
end
ActiveClassName() = ActiveClassName(DSS_DEFAULT_CTX)

"""
Get the name of the parent class of the active class

Original COM help: <https://opendss.epri.com/ActiveClassParent.html>
"""
function ActiveClassParent(dss::DSSContext)::String
    return get_string(@checked dss_ccall(dss.capi.ActiveClass_Get_ActiveClassParent, dss.ctx))
end
ActiveClassParent() = ActiveClassParent(DSS_DEFAULT_CTX)

"""
Number of elements in this class. Same as `Count()` function.

Original COM help: <https://opendss.epri.com/NumElements.html>
"""
function NumElements(dss::DSSContext)::Int
    return @checked dss_ccall(dss.capi.ActiveClass_Get_NumElements, dss.ctx)
end
NumElements() = NumElements(DSS_DEFAULT_CTX)

"""
Returns the data (as a list) of all elements from the active class as a JSON-encoded string.

The `options` parameter contains bit-flags to toggle specific features.
See `Obj_ToJSON` (C-API) for more, or `DSSObj.to_json` in Python.

Additionally, the `ExcludeDisabled` flag can be used to exclude disabled elements from the output.

**(API Extension)**
"""
function ToJSON(dss::DSSContext, Flags::Int32)::String #TODO: Use enum
    return get_string(@checked dss_ccall(dss.capi.ActiveClass_ToJSON, dss.ctx, Flags))
end
ToJSON(Flags::Int32) = ToJSON(DSS_DEFAULT_CTX, Flags)

end
