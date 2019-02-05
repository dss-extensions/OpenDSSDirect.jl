module Properties

    import ..Lib
    import ..Utils
    import ..TypedDocStringExtensions

    TypedDocStringExtensions.@template (FUNCTIONS, METHODS) =
        """
        $(TypedDocStringExtensions.FULLSIGNATURES)
        $(TypedDocStringExtensions.DOCSTRING)
        """

    """(read-only) Description of the property."""
    function Description()::String
        return Utils.get_string(Lib.DSSProperty_Get_Description())
    end

    """(read-only) Name of Property"""
    function Name()::String
        return Utils.get_string(Lib.DSSProperty_Get_Name())
    end

    """
    Sets the current DSS property based on a 1-based integer (or integer as
    a string) as an property index, or a string as a property name.
    """
    function _setCurrentProperty(argIndex::Int)
        if argIndex <= 0
            error("argIndex must be positive, not $argIndex.")
        end
        Lib.DSSProperty_Set_Index(argIndex - 1)
    end

    function _setCurrentProperty(Name::String)
        argIndex = tryparse(Int, Name)
        if argIndex isa Int
            _setCurrentProperty(argIndex)
        else
            Lib.DSSProperty_Set_Name(Name)
        end

    end

    """(read-only) Value of Property"""
    function Value()::String
        return Utils.get_string(Lib.DSSProperty_Get_Val())
    end

    """(read-only) Value of Property (getter)"""
    function Value(argIndex_or_Name::Union{String, Int})::String
        _setCurrentProperty(argIndex_or_Name)
        return get_string(Lib.DSSProperty_Get_Val())
    end

    """(read-only) Value of Property (setter)"""
    function Value(argIndex::Union{String, Int}, Value::String)
        _setCurrentProperty(argIndex_or_Name)
        Lib.DSSProperty_Set_Val(Value)
    end

end

