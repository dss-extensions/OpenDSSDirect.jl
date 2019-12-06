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
    return get_string_array(Lib.DSSElement_Get_AllPropertyNames)
end

"""Full Name of Active DSS Object (general element or circuit element)."""
function Name()::String
    return get_string(Lib.DSSElement_Get_Name())
end

"""Number of Properties for the active DSS object."""
function NumProperties()::Int
    return @checked Lib.DSSElement_Get_NumProperties()
end

end
