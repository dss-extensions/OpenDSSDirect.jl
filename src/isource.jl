module Isource

    using ..lib
    using ..utils

    """(read-only) Array of strings containing names of all ISOURCE elements."""
    function AllNames()
        return get_string_array(lib.ISources_Get_AllNames)
    end

    """Magnitude of the ISOURCE in amps"""
    function Amps()
        return lib.ISources_Get_Amps()
    end

    """Magnitude of the ISOURCE in amps"""
    function Amps(Value)
        lib.ISources_Set_Amps(Value)
    end

    """Phase angle for ISOURCE, degrees"""
    function AngleDeg()
        return lib.ISources_Get_AngleDeg()
    end

    """Phase angle for ISOURCE, degrees"""
    function AngleDeg(Value)
        lib.ISources_Set_AngleDeg(Value)
    end

    """(read-only) Count: Number of ISOURCE elements."""
    function Count()
        return lib.ISources_Get_Count()
    end

    """(read-only) Set the First ISOURCE to be active; returns Zero if none."""
    function First()
        return lib.ISources_Get_First()
    end

    """The present frequency of the ISOURCE, Hz"""
    function Frequency()
        return lib.ISources_Get_Frequency()
    end

    """The present frequency of the ISOURCE, Hz"""
    function Frequency(Value)
        lib.ISources_Set_Frequency(Value)
    end

    """
    (read) Get name of active ISOURCE
    (write) Set Active ISOURCE by name
    """
    function Name()
        return get_string(lib.ISources_Get_Name())
    end

    """
    (read) Get name of active ISOURCE
    (write) Set Active ISOURCE by name
    """
    function Name(Value)
        lib.ISources_Set_Name(Cstring(pointer(Value)))
    end

    """(read-only) Sets the next ISOURCE element to be the active one. Returns Zero if no more."""
    function Next()
        return lib.ISources_Get_Next()
    end

end

