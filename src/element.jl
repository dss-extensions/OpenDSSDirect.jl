module Element

    using ..lib
    using ..utils

    """(read-only) Array of strings containing the names of all properties for the active DSS object."""
    function AllPropertyNames()::Vector{String}
        return get_string_array(lib.DSSElement_Get_AllPropertyNames)
    end

    """(read-only) Full Name of Active DSS Object (general element or circuit element)."""
    function Name()::String
        return get_string(lib.DSSElement_Get_Name())
    end

    """(read-only) Number of Properties for the active DSS object."""
    function NumProperties()::Int
        return lib.DSSElement_Get_NumProperties()
    end

end

