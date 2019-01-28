module LineCodes

    using ..lib
    using ..utils

    """(read-only) Array of strings with names of all devices"""
    function AllNames()
        return get_string_array(lib.LineCodes_Get_AllNames)
    end

    """Zero-sequence capacitance, nF per unit length"""
    function C0()
        return lib.LineCodes_Get_C0()
    end

    """Zero-sequence capacitance, nF per unit length"""
    function C0(Value)
        lib.LineCodes_Set_C0(Value)
    end

    """Positive-sequence capacitance, nF per unit length"""
    function C1()
        return lib.LineCodes_Get_C1()
    end

    """Positive-sequence capacitance, nF per unit length"""
    function C1(Value)
        lib.LineCodes_Set_C1(Value)
    end

    """Capacitance matrix, nF per unit length"""
    function Cmatrix()
        return get_float64_array(lib.LineCodes_Get_Cmatrix)
    end

    """Capacitance matrix, nF per unit length"""
    function Cmatrix(Value)
        Value, ValuePtr, ValueCount = prepare_float64_array(Value)
        lib.LineCodes_Set_Cmatrix(ValuePtr, ValueCount)
    end

    """(read-only) Number of LineCodes"""
    function Count()
        return lib.LineCodes_Get_Count()
    end

    """Emergency ampere rating"""
    function EmergAmps()
        return lib.LineCodes_Get_EmergAmps()
    end

    """Emergency ampere rating"""
    function EmergAmps(Value)
        lib.LineCodes_Set_EmergAmps(Value)
    end

    function First()
        return lib.LineCodes_Get_First()
    end

    """(read-only) Flag denoting whether impedance data were entered in symmetrical components"""
    function IsZ1Z0()
        return lib.LineCodes_Get_IsZ1Z0() != 0
    end

    """Name of active LineCode"""
    function Name()
        return get_string(lib.LineCodes_Get_Name())
    end

    """Name of active LineCode"""
    function Name(Value::String)
        lib.LineCodes_Set_Name(Cstring(pointer(Value)))
    end

    function Next()
        return lib.LineCodes_Get_Next()
    end

    """Normal Ampere rating"""
    function NormAmps()
        return lib.LineCodes_Get_NormAmps()
    end

    """Normal Ampere rating"""
    function NormAmps(Value)
        lib.LineCodes_Set_NormAmps(Value)
    end

    """Number of Phases"""
    function Phases()
        return lib.LineCodes_Get_Phases()
    end

    """Number of Phases"""
    function Phases(Value)
        lib.LineCodes_Set_Phases(Value)
    end

    """Zero-Sequence Resistance, ohms per unit length"""
    function R0()
        return lib.LineCodes_Get_R0()
    end

    """Zero-Sequence Resistance, ohms per unit length"""
    function R0(Value)
        lib.LineCodes_Set_R0(Value)
    end

    """Positive-sequence resistance ohms per unit length"""
    function R1()
        return lib.LineCodes_Get_R1()
    end

    """Positive-sequence resistance ohms per unit length"""
    function R1(Value)
        lib.LineCodes_Set_R1(Value)
    end

    """Resistance matrix, ohms per unit length"""
    function Rmatrix()
        return get_float64_array(lib.LineCodes_Get_Rmatrix)
    end

    """Resistance matrix, ohms per unit length"""
    function Rmatrix(Value)
        Value, ValuePtr, ValueCount = prepare_float64_array(Value)
        lib.LineCodes_Set_Rmatrix(ValuePtr, ValueCount)
    end

    function Units()
        return lib.LineCodes_Get_Units()
    end

    function Units(Value)
        lib.LineCodes_Set_Units(Value)
    end

    """Zero Sequence Reactance, Ohms per unit length"""
    function X0()
        return lib.LineCodes_Get_X0()
    end

    """Zero Sequence Reactance, Ohms per unit length"""
    function X0(Value)
        lib.LineCodes_Set_X0(Value)
    end

    """Posiive-sequence reactance, ohms per unit length"""
    function X1()
        return lib.LineCodes_Get_X1()
    end

    """Posiive-sequence reactance, ohms per unit length"""
    function X1(Value)
        lib.LineCodes_Set_X1(Value)
    end

    """Reactance matrix, ohms per unit length"""
    function Xmatrix()
        return get_float64_array(lib.LineCodes_Get_Xmatrix)
    end

    """Reactance matrix, ohms per unit length"""
    function Xmatrix(Value)
        Value, ValuePtr, ValueCount = prepare_float64_array(Value)
        lib.LineCodes_Set_Xmatrix(ValuePtr, ValueCount)
    end

end

