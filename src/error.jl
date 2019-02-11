module Error

    import ..Lib
    import ..Utils
    import ..TypedDocStringExtensions

    TypedDocStringExtensions.@template (FUNCTIONS, METHODS) =
        """
        $(TypedDocStringExtensions.FULLSIGNATURES)
        $(TypedDocStringExtensions.DOCSTRING)
        """

    """Description of error for last operation"""
    function Description()::String
        return Utils.get_string(Lib.Error_Get_Description())
    end

    """Error Number"""
    function Number()::Int
        return Lib.Error_Get_Number()
    end

end

