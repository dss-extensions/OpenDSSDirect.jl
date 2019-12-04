
module Progress

    import ..Lib
    import ..Utils
    import ..TypedDocStringExtensions

    TypedDocStringExtensions.@template (FUNCTIONS, METHODS) =
        """
        $(TypedDocStringExtensions.FULLSIGNATURES)
        $(TypedDocStringExtensions.DOCSTRING)
        """

    """Close progress"""
    function Close()
        Utils.@checked Lib.DSSProgress_Close()
    end

    """Show progress"""
    function Show()
        Utils.@checked Lib.DSSProgress_Show()
    end

    """Caption to appear on the bottom of the DSS Progress form."""
    function Caption(Value::String)
        Utils.@checked Lib.DSSProgress_Set_Caption(Value)
    end

    """Percent progress to indicate [0..100]"""
    function PctProgress(Value::Int)
        Utils.@checked Lib.DSSProgress_Set_PctProgress(Value)
    end

end

