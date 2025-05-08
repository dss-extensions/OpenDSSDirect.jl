module Element

using DocStringExtensions

using ..Lib
using ..Utils

@template (FUNCTIONS, METHODS) = """
                                 $(TYPEDSIGNATURES)
                                 $(DOCSTRING)
                                 """

"""
Array of strings containing the names of all properties for the active DSS object.

Original COM help: <https://opendss.epri.com/AllPropertyNames1.html>
"""
function AllPropertyNames(dss::DSSContext)::Vector{String}
    return get_string_array(dss.capi.DSSElement_Get_AllPropertyNames, dss)
end
AllPropertyNames() = AllPropertyNames(DSS_DEFAULT_CTX)

"""
Full Name of Active DSS Object (general element or circuit element).

Original COM help: <https://opendss.epri.com/Name5.html>
"""
function Name(dss::DSSContext)::String
    return get_string(dss_ccall(dss.capi.DSSElement_Get_Name, dss.ctx))
end
Name() = Name(DSS_DEFAULT_CTX)

"""
Number of Properties for the active DSS object.

Original COM help: <https://opendss.epri.com/NumProperties1.html>
"""
function NumProperties(dss::DSSContext)::Int
    return @checked dss_ccall(dss.capi.DSSElement_Get_NumProperties, dss.ctx)
end
NumProperties() = NumProperties(DSS_DEFAULT_CTX)

"""
Returns the properties of the active DSS object as a JSON-encoded string.

The `options` parameter contains bit-flags to toggle specific features.
See `Obj_ToJSON` (C-API) for more.

**(API Extension)**
"""
function ToJSON(dss::DSSContext, Flags::Int32)::String #TODO: use enum
    return get_string(@checked dss_ccall(dss.capi.DSSElement_ToJSON, dss.ctx, Flags))
end
ToJSON(Flags::Int32) = ToJSON(DSS_DEFAULT_CTX, Flags)

end
