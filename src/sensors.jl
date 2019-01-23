module Sensors

    using ..lib
    using ..utils

    function Reset()
        lib.Sensors_Reset()
    end

    function ResetAll()
        lib.Sensors_ResetAll()
    end

    """(read-only) Array of Sensor names."""
    function AllNames()
        return get_string_array(lib.Sensors_Get_AllNames)
    end

    """(read-only) Number of Sensors in Active Circuit."""
    function Count()
        return lib.Sensors_Get_Count()
    end

    """Array of doubles for the line current measurements; don't use with kWS and kVARS."""
    function Currents()
        return get_float64_array(lib.Sensors_Get_Currents)
    end

    """Array of doubles for the line current measurements; don't use with kWS and kVARS."""
    function Currents(Value)
        Value, ValuePtr, ValueCount = prepare_float64_array(Value)
        lib.Sensors_Set_Currents(ValuePtr, ValueCount)
    end

    """(read-only) Sets the first sensor active. Returns 0 if none."""
    function First()
        return lib.Sensors_Get_First()
    end

    """True if measured voltages are line-line. Currents are always line currents."""
    function IsDelta()
        return lib.Sensors_Get_IsDelta() != 0
    end

    """True if measured voltages are line-line. Currents are always line currents."""
    function IsDelta(Value)
        lib.Sensors_Set_IsDelta(Value)
    end

    """Full Name of the measured element"""
    function MeteredElement()
        return get_string(lib.Sensors_Get_MeteredElement())
    end

    """Full Name of the measured element"""
    function MeteredElement(Value::String)
        lib.Sensors_Set_MeteredElement(Value)
    end

    """Number of the measured terminal in the measured element."""
    function MeteredTerminal()
        return lib.Sensors_Get_MeteredTerminal()
    end

    """Number of the measured terminal in the measured element."""
    function MeteredTerminal(Value)
        lib.Sensors_Set_MeteredTerminal(Value)
    end

    """
    (read) Name of the active sensor.
    (write) Set the active Sensor by name.
    """
    function Name()
        return get_string(lib.Sensors_Get_Name())
    end

    """
    (read) Name of the active sensor.
    (write) Set the active Sensor by name.
    """
    function Name(Value::String)
        lib.Sensors_Set_Name(Value)
    end

    """(read-only) Sets the next Sensor active. Returns 0 if no more."""
    function Next()
        return lib.Sensors_Get_Next()
    end

    """Assumed percent error in the Sensor measurement. Default is 1."""
    function PctError()
        return lib.Sensors_Get_PctError()
    end

    """Assumed percent error in the Sensor measurement. Default is 1."""
    function PctError(Value)
        lib.Sensors_Set_PctError(Value)
    end

    """True if voltage measurements are 1-3, 3-2, 2-1."""
    function ReverseDelta()
        return lib.Sensors_Get_ReverseDelta() != 0
    end

    """True if voltage measurements are 1-3, 3-2, 2-1."""
    function ReverseDelta(Value)
        lib.Sensors_Set_ReverseDelta(Value)
    end

    """Weighting factor for this Sensor measurement with respect to other Sensors. Default is 1."""
    function Weight()
        return lib.Sensors_Get_Weight()
    end

    """Weighting factor for this Sensor measurement with respect to other Sensors. Default is 1."""
    function Weight(Value)
        lib.Sensors_Set_Weight(Value)
    end

    """Array of doubles for Q measurements. Overwrites Currents with a new estimate using kWS."""
    function kvar()
        return get_float64_array(lib.Sensors_Get_kVARS)
    end

    """Array of doubles for Q measurements. Overwrites Currents with a new estimate using kWS."""
    function kvar(Value)
        Value, ValuePtr, ValueCount = prepare_float64_array(Value)
        lib.Sensors_Set_kVARS(ValuePtr, ValueCount)
    end

    """Array of doubles for the LL or LN (depending on Delta connection) voltage measurements."""
    function kVS()
        return get_float64_array(lib.Sensors_Get_kVS)
    end

    """Array of doubles for the LL or LN (depending on Delta connection) voltage measurements."""
    function kVS(Value)
        Value, ValuePtr, ValueCount = prepare_float64_array(Value)
        lib.Sensors_Set_kVS(ValuePtr, ValueCount)
    end

    """Voltage base for the sensor measurements. LL for 2 and 3-phase sensors, LN for 1-phase sensors."""
    function kVBase()
        return lib.Sensors_Get_kVbase()
    end

    """Voltage base for the sensor measurements. LL for 2 and 3-phase sensors, LN for 1-phase sensors."""
    function kVBase(Value)
        lib.Sensors_Set_kVbase(Value)
    end

    """Array of doubles for P measurements. Overwrites Currents with a new estimate using kVARS."""
    function kW()
        return get_float64_array(lib.Sensors_Get_kWS)
    end

    """Array of doubles for P measurements. Overwrites Currents with a new estimate using kVARS."""
    function kW(Value)
        Value, ValuePtr, ValueCount = prepare_float64_array(Value)
        lib.Sensors_Set_kWS(ValuePtr, ValueCount)
    end

end
