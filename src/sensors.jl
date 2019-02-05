module Sensors

    import ..Lib
    import ..Utils
    import ..TypedDocStringExtensions

    TypedDocStringExtensions.@template (FUNCTIONS, METHODS) =
        """
        $(TypedDocStringExtensions.FULLSIGNATURES)
        $(TypedDocStringExtensions.DOCSTRING)
        """

    function Reset()
        Lib.Sensors_Reset()
    end

    function ResetAll()
        Lib.Sensors_ResetAll()
    end

    """Array of Sensor names."""
    function AllNames()::Vector{String}
        return Utils.get_string_array(Lib.Sensors_Get_AllNames)
    end

    """Number of Sensors in Active Circuit."""
    function Count()::Int
        return Lib.Sensors_Get_Count()
    end

    """Array of doubles for the line current measurements; don't use with kW and kVAR. (Getter)"""
    function Currents()::Vector{Float64}
        return Utils.get_float64_array(Lib.Sensors_Get_Currents)
    end

    """Array of doubles for the line current measurements; don't use with kW and kVAR. (Setter)"""
    function Currents(Value::Vector{Float64})
        Value, ValuePtr, ValueCount = Utils.prepare_float64_array(Value)
        Lib.Sensors_Set_Currents(ValuePtr, ValueCount)
    end

    """Sets the first sensor active. Returns 0 if none."""
    function First()::Int
        return Lib.Sensors_Get_First()
    end

    """True if measured voltages are line-line. Currents are always line currents. (Getter)"""
    function IsDelta()::Bool
        return Lib.Sensors_Get_IsDelta() != 0
    end

    """True if measured voltages are line-line. Currents are always line currents. (Setter)"""
    function IsDelta(Value::Bool)
        Lib.Sensors_Set_IsDelta(Value ? 1 : 0)
    end

    """Full Name of the measured element (Getter)"""
    function MeteredElement()::String
        return Utils.get_string(Lib.Sensors_Get_MeteredElement())
    end

    """Full Name of the measured element (Setter)"""
    function MeteredElement(Value::String)
        Lib.Sensors_Set_MeteredElement(Value)
    end

    """Number of the measured terminal in the measured element. (Getter)"""
    function MeteredTerminal()::Int
        return Lib.Sensors_Get_MeteredTerminal()
    end

    """Number of the measured terminal in the measured element. (Setter)"""
    function MeteredTerminal(Value::Int)
        Lib.Sensors_Set_MeteredTerminal(Value)
    end

    """Name of the active sensor. (Getter)"""
    function Name()::String
        return Utils.get_string(Lib.Sensors_Get_Name())
    end

    """Name of the active sensor. (Setter)"""
    function Name(Value::String)
        Lib.Sensors_Set_Name(Value)
    end

    """Sets the next Sensor active. Returns 0 if no more."""
    function Next()::Int
        return Lib.Sensors_Get_Next()
    end

    """Assumed percent error in the Sensor measurement. Default is 1. (Getter)"""
    function PctError()::Int
        return Lib.Sensors_Get_PctError()
    end

    """Assumed percent error in the Sensor measurement. Default is 1. (Setter)"""
    function PctError(Value::Int)
        Lib.Sensors_Set_PctError(Value)
    end

    """True if voltage measurements are 1-3, 3-2, 2-1. (Getter)"""
    function ReverseDelta()::Bool
        return Lib.Sensors_Get_ReverseDelta() != 0
    end

    """True if voltage measurements are 1-3, 3-2, 2-1. (Setter)"""
    function ReverseDelta(Value::Bool)
        Lib.Sensors_Set_ReverseDelta(Value ? 1 : 0)
    end

    """Weighting factor for this Sensor measurement with respect to other Sensors. Default is 1. (Getter)"""
    function Weight()::Float64
        return Lib.Sensors_Get_Weight()
    end

    """Weighting factor for this Sensor measurement with respect to other Sensors. Default is 1. (Setter)"""
    function Weight(Value::Float64)
        Lib.Sensors_Set_Weight(Value)
    end

    """Array of doubles for Q measurements. Overwrites Currents with a new estimate using kW. (Getter)"""
    function kvar()::Vector{Float64}
        return Utils.get_float64_array(Lib.Sensors_Get_kVARS)
    end

    """Array of doubles for Q measurements. Overwrites Currents with a new estimate using kW. (Setter)"""
    function kvar(Value::Vector{Float64})
        Value, ValuePtr, ValueCount = Utils.prepare_float64_array(Value)
        Lib.Sensors_Set_kVARS(ValuePtr, ValueCount)
    end

    """Array of doubles for the LL or LN (depending on Delta connection) voltage measurements. (Getter)"""
    function kVS()::Vector{Float64}
        return Utils.get_float64_array(Lib.Sensors_Get_kVS)
    end

    """Array of doubles for the LL or LN (depending on Delta connection) voltage measurements. (Setter)"""
    function kVS(Value::Vector{Float64})
        Value, ValuePtr, ValueCount = Utils.prepare_float64_array(Value)
        Lib.Sensors_Set_kVS(ValuePtr, ValueCount)
    end

    """Voltage base for the sensor measurements. LL for 2 and 3-phase sensors, LN for 1-phase sensors. (Getter)"""
    function kVBase()::Float64
        return Lib.Sensors_Get_kVbase()
    end

    """Voltage base for the sensor measurements. LL for 2 and 3-phase sensors, LN for 1-phase sensors. (Setter)"""
    function kVBase(Value::Float64)
        Lib.Sensors_Set_kVbase(Value)
    end

    """Array of doubles for P measurements. Overwrites Currents with a new estimate using kVAR. (Getter)"""
    function kW()::Vector{Float64}
        return Utils.get_float64_array(Lib.Sensors_Get_kWS)
    end

    """Array of doubles for P measurements. Overwrites Currents with a new estimate using kVAR. (Setter)"""
    function kW(Value::Vector{Float64})
        Value, ValuePtr, ValueCount = Utils.prepare_float64_array(Value)
        Lib.Sensors_Set_kWS(ValuePtr, ValueCount)
    end

end
