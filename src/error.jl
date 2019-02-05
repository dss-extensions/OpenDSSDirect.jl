module Error

    import ..Lib
    import ..Utils
    import ..TypedDocStringExtensions

    TypedDocStringExtensions.@template (FUNCTIONS, METHODS) =
        """
        $(TypedDocStringExtensions.FULLSIGNATURES)
        $(TypedDocStringExtensions.DOCSTRING)
        """

    """(read-only) Description of error for last operation"""
    function Description()::String
        return Utils.get_string(lib.Error_Get_Description())
    end

    """(read-only) Error Number"""
    function Number()::Int
        return lib.Error_Get_Number()
    end

end

