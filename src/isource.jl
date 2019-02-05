module Isource

    import ..Lib
    import ..Utils
    import ..TypedDocStringExtensions

    TypedDocStringExtensions.@template (FUNCTIONS, METHODS) =
        """
        $(TypedDocStringExtensions.FULLSIGNATURES)
        $(TypedDocStringExtensions.DOCSTRING)
        """

    """Array of strings containing names of all ISOURCE elements."""
    function AllNames()::Vector{String}
        return Utils.get_string_array(Lib.ISources_Get_AllNames)
    end

    """Magnitude of the ISOURCE in amps"""
    function Amps()::Float64
        return Lib.ISources_Get_Amps()
    end

    """Magnitude of the ISOURCE in amps"""
    function Amps(Value::Float64)
        Lib.ISources_Set_Amps(Value)
    end

    """Phase angle for ISOURCE, degrees (Getter)"""
    function AngleDeg()::Float64
        return Lib.ISources_Get_AngleDeg()
    end

    """Phase angle for ISOURCE, degrees (Setter)"""
    function AngleDeg(Value::Float64)
        Lib.ISources_Set_AngleDeg(Value)
    end

    """Count: Number of ISOURCE elements."""
    function Count()::Int
        return Lib.ISources_Get_Count()
    end

    """Set the First ISOURCE to be active; returns Zero if none."""
    function First()::Int
        return Lib.ISources_Get_First()
    end

    """The present frequency of the ISOURCE, Hz (Getter)"""
    function Frequency()::Float64
        return Lib.ISources_Get_Frequency()
    end

    """The present frequency of the ISOURCE, Hz (Setter)"""
    function Frequency(Value::Float64)
        Lib.ISources_Set_Frequency(Value)
    end

    """Name of Active ISOURCE (Getter)"""
    function Name()::String
        return Utils.get_string(Lib.ISources_Get_Name())
    end

    """Name of Active ISOURCE (Setter)"""
    function Name(Value::String)
        Lib.ISources_Set_Name(Cstring(pointer(Value)))
    end

    """Sets the next ISOURCE element to be the active one. Returns Zero if no more."""
    function Next()::Int
        return Lib.ISources_Get_Next()
    end

end

