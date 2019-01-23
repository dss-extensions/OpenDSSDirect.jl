
module Vsources

    using ..lib
    using ..utils

    """(read-only) Names of all Vsource objects in the circuit"""
    function AllNames()
        return get_string_array(lib.Vsources_Get_AllNames)
    end

    """
    (read) Phase angle of first phase in degrees
    (write) phase angle in degrees
    """
    function AngleDeg()
        return lib.Vsources_Get_AngleDeg()
    end

    """
    (read) Phase angle of first phase in degrees
    (write) phase angle in degrees
    """
    function AngleDeg(Value)
        lib.Vsources_Set_AngleDeg(Value)
    end

    """Source voltage in kV"""
    function BasekV()
        return lib.Vsources_Get_BasekV()
    end

    """Source voltage in kV"""
    function BasekV(Value)
        lib.Vsources_Set_BasekV(Value)
    end

    """(read-only) Number of Vsource Object"""
    function Count()
        return lib.Vsources_Get_Count()
    end

    """(read-only) Sets the first VSOURCE to be active; Returns 0 if none"""
    function First()
        return lib.Vsources_Get_First()
    end

    """Source frequency in Hz"""
    function Frequency()
        return lib.Vsources_Get_Frequency()
    end

    """Source frequency in Hz"""
    function Frequency(Value)
        lib.Vsources_Set_Frequency(Value)
    end

    """
    (read) Get Active VSOURCE name
    (write) Set Active VSOURCE by Name
    """
    function Name()
        return get_string(lib.Vsources_Get_Name())
    end

    """
    (read) Get Active VSOURCE name
    (write) Set Active VSOURCE by Name
    """
    function Name(Value::String)
        lib.Vsources_Set_Name(Value)
    end

    """(read-only) Sets the next VSOURCE object to be active; returns zero if no more"""
    function Next()
        return lib.Vsources_Get_Next()
    end

    """Number of phases"""
    function Phases()
        return lib.Vsources_Get_Phases()
    end

    """Number of phases"""
    function Phases(Value)
        lib.Vsources_Set_Phases(Value)
    end

    """
    (read) Source pu voltage.
    (write) Per-unit value of source voltage based on kV
    """
    function PU()
        return lib.Vsources_Get_pu()
    end

    """
    (read) Source pu voltage.
    (write) Per-unit value of source voltage based on kV
    """
    function PU(Value)
        lib.Vsources_Set_pu(Value)
    end

end

