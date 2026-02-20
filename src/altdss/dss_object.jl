"""
Returns the name of a DSS object
"""
function Name(obj::Obj)::String
    obj_get_str_nodisp(obj, obj.dss.capi.Obj_GetName)
end

"""
Returns the full name of a DSS object, including DSS class (e.g. `"Load.load_name"`)
"""
function FullName(obj::Obj)::String
    obj_get_str(obj, obj.dss.capi.Obj_GetFullName)
end

"""
Returns an element's data as a JSON-encoded string.

The `options` parameter contains bit-flags to toggle specific features.

By default (`options = 0`), only the properties explicitly set. The properties are returned in the order they are set in the input.
As a reminder, OpenDSS is sensitive to the order of the properties.

The `options` bit-flags are available in the `DSSJSONFlags` enum.
Values used by this function are:

- `Full`: if set, all properties are returned, ordered by property index instead.
- `SkipRedundant`: if used with `Full`, all properties except redundant and unused ones are returned.
- `EnumAsInt`: enumerated properties are returned as integer values instead of strings.
- `FullNames`: any element reference will use the full name (`{class name}.{element name}`) even if not required.
- `Pretty`: more whitespace is used in the output for a "prettier" format.
- `SkipDSSClass`: do not add the "DSSClass" property to the JSON objects.

**NOT IMPLEMENTED YET**:
- `State`: include run-time state information
- `Debug`: include debug information

Other bit-flags are reserved for future uses. Please use `DSSJSONFlags` enum to avoid potential conflicts.
"""
function ToJSON(obj::Obj, flags::DSSJSONFlags=DSSJSONFlags(0))::String
    obj_get_str(obj, obj.dss.capi.Obj_ToJSON, convert(Int32, Integer(flags)))
end


"""
Returns an object from the collection by name.
"""
function Get(dss::DSSContext, name::String)::Obj
    @assert (dss.capi.isAltDSS != 0) "Only the AltDSS engine supports this API"
    ptr = dss_ccall(dss.capi.Obj_GetHandleByName, dss.ctx, _cls_idx, name)
    if ptr == C_NULL
        throw(
            OpenDSSDirectException(
                "[ERROR] Could not find object by name \"$name\"."
            )
        )
    end
    return Obj(ptr, dss)
end
Get(name::String) = Get(DSS_DEFAULT_CTX, name)

"""
Returns an object from the collection by index; the index must be one-based.
"""
function Get(dss::DSSContext, idx::Int)::Obj
    @assert (dss.capi.isAltDSS != 0) "Only the AltDSS engine supports this API"
    ptr = dss_ccall(dss.capi.Obj_GetHandleByIdx, dss.ctx, _cls_idx, idx)
    if ptr == C_NULL
        throw(
            OpenDSSDirectException(
                "[ERROR] Could not find object by index \"$idx\"."
            )
        )
    end
    return Obj(ptr, dss)
end
Get(idx::Int) = Get(DSS_DEFAULT_CTX, idx)

"""
Returns the number of $_cls_name objects in the circuit.
"""
function Count(dss::DSSContext)::Int
    return dss_ccall(dss.capi.Obj_GetCount, dss.ctx, _cls_idx)
end
Count() = Count(DSS_DEFAULT_CTX)

"""
Convenience function: apply a function to all $_cls_name objects in the circuit, collecting the results in a vector
"""
function All(dss::DSSContext, func, args...)::Vector
    [func(Get(idx), args...) for idx in 1:Count(dss)]
end
All(func, args...) = All(DSS_DEFAULT_CTX, func, args...)

"""
Convenience function: apply a function to all $_cls_name objects in the input vector, collecting the results in a vector
"""
function All(objs::Vector, func, args...)::Vector
    @show func
    @show objs
    [obj === nothing ? nothing : func(obj, args...) for obj in objs]
end

"""
Create a new $_cls_name object

Return a reference to the new object.

Note: this is a simplified version of the `new` function. Future updates will allow the user to populate the object
from the new function and more.
"""
function New(dss::DSSContext, name::String)::Obj
    ptr = dss_ccall(dss.capi.Obj_New, dss.ctx, _cls_idx, name, 0, 0)
    # Check the API for error messages
    error_num = unsafe_load(dss.error)
    if (error_num != 0)
        unsafe_store!(dss.error, 0)
        description = get_string(dss_ccall(dss.capi.Error_Get_Description, dss.ctx))
        throw(
            OpenDSSDirectException(
                "[ERROR $error_num] $description"
            )
        )
    end
    if ptr == C_NULL
        # Generic error message, just in case
        throw(
            OpenDSSDirectException(
                "[ERROR] Could not create a new $_cls_name object named \"$name\"."
            )
        )
    end
    Obj(ptr, dss)
end
New(name::String) = New(DSS_DEFAULT_CTX, name)

#TODO: iterator (iterate using Obj_GetHandleByIdx)
