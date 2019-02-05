module PVsystems

    import ..Lib
    import ..Utils
    import ..TypedDocStringExtensions

    TypedDocStringExtensions.@template (FUNCTIONS, METHODS) =
        """
        $(TypedDocStringExtensions.FULLSIGNATURES)
        $(TypedDocStringExtensions.DOCSTRING)
        """

    """(read-only) Vairant array of strings with all PVSystem names"""
    function AllNames()::Vector{String}
        return Utils.get_string_array(Lib.PVSystems_Get_AllNames)
    end

    """(read-only) Number of PVSystems"""
    function Count()::Int
        return Lib.PVSystems_Get_Count()
    end

    """(read-only) Set first PVSystem active; returns 0 if none."""
    function First()::Int
        return Lib.PVSystems_Get_First()
    end

    """
    (read) Get the present value of the Irradiance property in W/sq-m
    (write) Set the present Irradiance value in W/sq-m
    """
    function Irradiance()::Float64
        return Lib.PVSystems_Get_Irradiance()
    end

    """
    (read) Get the present value of the Irradiance property in W/sq-m
    (write) Set the present Irradiance value in W/sq-m
    """
    function Irradiance(Value::Float64)
        Lib.PVSystems_Set_Irradiance(Value)
    end

    """
    (read) Get the name of the active PVSystem
    (write) Set the name of the active PVSystem
    """
    function Name()::String
        return Utils.get_string(Lib.PVSystems_Get_Name())
    end

    """
    (read) Get the name of the active PVSystem
    (write) Set the name of the active PVSystem
    """
    function Name(Value::String)
        Lib.PVSystems_Set_Name(Cstring(pointer(Value)))
    end

    """(read-only) Sets next PVSystem active; returns 0 if no more."""
    function Next()::Int
        return Lib.PVSystems_Get_Next()
    end

    """
    (read) Get Power factor
    (write) Set PF
    """
    function pf()::Float64
        return Lib.PVSystems_Get_PF()
    end

    """
    (read) Get Power factor
    (write) Set PF
    """
    function pf(Value::Float64)
        Lib.PVSystems_Set_PF(Value)
    end

    """(read-only) Variant Array of PVSYSTEM energy meter register names"""
    function RegisterNames()::Vector{String}
        return Utils.get_string_array(Lib.PVSystems_Get_RegisterNames)
    end

    """(read-only) Array of doubles containing values in PVSystem registers."""
    function RegisterValues()::Vector{Float64}
        return Utils.get_float64_array(Lib.PVSystems_Get_RegisterValues)
    end

    """
    (read) Get/set active PVSystem by index;  1..Count
    (write) Get/Set Active PVSystem by index:  1.. Count
    """
    function Idx()::Int
        return Lib.PVSystems_Get_idx()
    end

    """
    (read) Get/set active PVSystem by index;  1..Count
    (write) Get/Set Active PVSystem by index:  1.. Count
    """
    function Idx(Value::Int)
        Lib.PVSystems_Set_idx(Value)
    end

    """
    (read) Get Rated kVA of the PVSystem
    (write) Set kva rated
    """
    function kVARated()::Float64
        return Lib.PVSystems_Get_kVArated()
    end

    """
    (read) Get Rated kVA of the PVSystem
    (write) Set kva rated
    """
    function kVARated(Value::Float64)
        Lib.PVSystems_Set_kVArated(Value)
    end

    """(read-only) get kW output"""
    function kW()::Float64
        return Lib.PVSystems_Get_kW()
    end

    """
    (read) Get kvar value
    (write) Set kvar output value
    """
    function kvar()::Float64
        return Lib.PVSystems_Get_kvar()
    end

    """
    (read) Get kvar value
    (write) Set kvar output value
    """
    function kvar(Value::Float64)
        Lib.PVSystems_Set_kvar(Value)
    end

end

