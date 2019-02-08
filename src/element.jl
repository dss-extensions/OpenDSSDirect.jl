module Element

    import ..Lib
    import ..Utils
    import ..TypedDocStringExtensions

    TypedDocStringExtensions.@template (FUNCTIONS, METHODS) =
        """
        $(TypedDocStringExtensions.FULLSIGNATURES)
        $(TypedDocStringExtensions.DOCSTRING)
        """

    """Array of strings containing the names of all properties for the active DSS object."""
    function AllPropertyNames()::Vector{String}
        return Utils.get_string_array(Lib.DSSElement_Get_AllPropertyNames)
    end

    """Full Name of Active DSS Object (general element or circuit element)."""
    function Name()::String
        return Utils.get_string(Lib.DSSElement_Get_Name())
    end

    """Number of Properties for the active DSS object."""
    function NumProperties()::Int
        return Lib.DSSElement_Get_NumProperties()
    end

end

