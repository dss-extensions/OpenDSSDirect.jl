module Properties

    using ..Lib
    using ..Utils

    """(read-only) Description of the property."""
    function Description()::String
        return get_string(Lib.DSSProperty_Get_Description())
    end

    """(read-only) Name of Property"""
    function Name()::String
        return get_string(Lib.DSSProperty_Get_Name())
    end

    """
    Sets the current DSS property based on a 1-based integer (or integer as
    a string) as an property index, or a string as a property name.
    """
    function _setCurrentProperty(argIndex_or_Name)
        # TODO: better implementation?
    end

    function Value()
        # TODO: redo implementation
    end

end

