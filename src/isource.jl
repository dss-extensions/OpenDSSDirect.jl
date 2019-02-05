module Isource

    import ..Lib
    import ..Utils
    import ..TypedDocStringExtensions

    TypedDocStringExtensions.@template (FUNCTIONS, METHODS) =
        """
        $(TypedDocStringExtensions.FULLSIGNATURES)
        $(TypedDocStringExtensions.DOCSTRING)
        """

    """(read-only) Array of strings containing names of all ISOURCE elements."""
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

    """Phase angle for ISOURCE, degrees"""
    function AngleDeg()::Float64
        return Lib.ISources_Get_AngleDeg()
    end

    """Phase angle for ISOURCE, degrees"""
    function AngleDeg(Value::Float64)
        Lib.ISources_Set_AngleDeg(Value)
    end

    """(read-only) Count: Number of ISOURCE elements."""
    function Count()::Int
        return Lib.ISources_Get_Count()
    end

    """(read-only) Set the First ISOURCE to be active; returns Zero if none."""
    function First()::Int
        return Lib.ISources_Get_First()
    end

    """The present frequency of the ISOURCE, Hz"""
    function Frequency()::Float64
        return Lib.ISources_Get_Frequency()
    end

    """The present frequency of the ISOURCE, Hz"""
    function Frequency(Value::Float64)
        Lib.ISources_Set_Frequency(Value)
    end

    """
    (read) Get name of active ISOURCE
    (write) Set Active ISOURCE by name
    """
    function Name()::String
        return Utils.get_string(Lib.ISources_Get_Name())
    end

    """
    (read) Get name of active ISOURCE
    (write) Set Active ISOURCE by name
    """
    function Name(Value::String)
        Lib.ISources_Set_Name(Cstring(pointer(Value)))
    end

    """(read-only) Sets the next ISOURCE element to be the active one. Returns Zero if no more."""
    function Next()::Int
        return Lib.ISources_Get_Next()
    end

end

