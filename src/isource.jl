module Isource

    using ..lib
    using ..utils

    """(read-only) Array of strings containing names of all ISOURCE elements."""
    function AllNames()::Vector{String}
        return get_string_array(lib.ISources_Get_AllNames)
    end

    """Magnitude of the ISOURCE in amps"""
    function Amps()::Float64
        return lib.ISources_Get_Amps()
    end

    """Magnitude of the ISOURCE in amps"""
    function Amps(Value::Float64)
        lib.ISources_Set_Amps(Value)
    end

    """Phase angle for ISOURCE, degrees"""
    function AngleDeg()::Float64
        return lib.ISources_Get_AngleDeg()
    end

    """Phase angle for ISOURCE, degrees"""
    function AngleDeg(Value::Float64)
        lib.ISources_Set_AngleDeg(Value)
    end

    """(read-only) Count: Number of ISOURCE elements."""
    function Count()::Int
        return lib.ISources_Get_Count()
    end

    """(read-only) Set the First ISOURCE to be active; returns Zero if none."""
    function First()::Int
        return lib.ISources_Get_First()
    end

    """The present frequency of the ISOURCE, Hz"""
    function Frequency()::Float64
        return lib.ISources_Get_Frequency()
    end

    """The present frequency of the ISOURCE, Hz"""
    function Frequency(Value::Float64)
        lib.ISources_Set_Frequency(Value)
    end

    """
    (read) Get name of active ISOURCE
    (write) Set Active ISOURCE by name
    """
    function Name()::String
        return get_string(lib.ISources_Get_Name())
    end

    """
    (read) Get name of active ISOURCE
    (write) Set Active ISOURCE by name
    """
    function Name(Value::String)
        lib.ISources_Set_Name(Cstring(pointer(Value)))
    end

    """(read-only) Sets the next ISOURCE element to be the active one. Returns Zero if no more."""
    function Next()::Int
        return lib.ISources_Get_Next()
    end

end

