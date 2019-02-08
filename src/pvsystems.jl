module PVsystems

    import ..Lib
    import ..Utils
    import ..TypedDocStringExtensions

    TypedDocStringExtensions.@template (FUNCTIONS, METHODS) =
        """
        $(TypedDocStringExtensions.FULLSIGNATURES)
        $(TypedDocStringExtensions.DOCSTRING)
        """

    """Variant array of strings with all PVSystem names"""
    function AllNames()::Vector{String}
        return Utils.get_string_array(Lib.PVSystems_Get_AllNames)
    end

    """Number of PVSystems"""
    function Count()::Int
        return Lib.PVSystems_Get_Count()
    end

    """Set first PVSystem active; returns 0 if none."""
    function First()::Int
        return Lib.PVSystems_Get_First()
    end

    """Present value of the Irradiance property in W/sq-m (Getter)"""
    function Irradiance()::Float64
        return Lib.PVSystems_Get_Irradiance()
    end

    """Present value of the Irradiance property in W/sq-m (Setter)"""
    function Irradiance(Value::Float64)
        Lib.PVSystems_Set_Irradiance(Value)
    end

    """Name of the active PVSystem (Getter)"""
    function Name()::String
        return Utils.get_string(Lib.PVSystems_Get_Name())
    end

    """Name of the active PVSystem (Setter)"""
    function Name(Value::String)
        Lib.PVSystems_Set_Name(Cstring(pointer(Value)))
    end

    """Sets next PVSystem active; returns 0 if no more."""
    function Next()::Int
        return Lib.PVSystems_Get_Next()
    end

    """Power factor (Getter)"""
    function pf()::Float64
        return Lib.PVSystems_Get_PF()
    end

    """Power factor (Setter)"""
    function pf(Value::Float64)
        Lib.PVSystems_Set_PF(Value)
    end

    """Variant Array of PVSYSTEM energy meter register names"""
    function RegisterNames()::Vector{String}
        return Utils.get_string_array(Lib.PVSystems_Get_RegisterNames)
    end

    """Array of doubles containing values in PVSystem registers."""
    function RegisterValues()::Vector{Float64}
        return Utils.get_float64_array(Lib.PVSystems_Get_RegisterValues)
    end

    """Active PVSystem by index;  1..Count (Getter)"""
    function Idx()::Int
        return Lib.PVSystems_Get_idx()
    end

    """Active PVSystem by index;  1..Count (Setter)"""
    function Idx(Value::Int)
        Lib.PVSystems_Set_idx(Value)
    end

    """Rated kVA of the PVSystem (Getter)"""
    function kVARated()::Float64
        return Lib.PVSystems_Get_kVArated()
    end

    """Rated kVA of the PVSystem (Setter)"""
    function kVARated(Value::Float64)
        Lib.PVSystems_Set_kVArated(Value)
    end

    """get kW output"""
    function kW()::Float64
        return Lib.PVSystems_Get_kW()
    end

    """kvar value (Getter)"""
    function kvar()::Float64
        return Lib.PVSystems_Get_kvar()
    end

    """kvar value (Setter)"""
    function kvar(Value::Float64)
        Lib.PVSystems_Set_kvar(Value)
    end

end

