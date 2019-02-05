module Relays

    import ..Lib
    import ..Utils
    import ..TypedDocStringExtensions

    TypedDocStringExtensions.@template (FUNCTIONS, METHODS) =
        """
        $(TypedDocStringExtensions.FULLSIGNATURES)
        $(TypedDocStringExtensions.DOCSTRING)
        """

    """Array of strings containing names of all Relay elements"""
    function AllNames()::Vector{String}
        return Utils.get_string_array(Lib.Relays_Get_AllNames)
    end

    """Number of Relays in circuit"""
    function Count()::Int
        return Lib.Relays_Get_Count()
    end

    """Set First Relay active. If none, returns 0."""
    function First()::Int
        return Lib.Relays_Get_First()
    end

    """Full name of object this Relay is monitoring. (Getter)"""
    function MonitoredObj()::String
        return Utils.get_string(Lib.Relays_Get_MonitoredObj())
    end

    """Full name of object this Relay is monitoring. (Setter)"""
    function MonitoredObj(Value::String)
        Lib.Relays_Set_MonitoredObj(Value)
    end

    """Number of terminal of monitored element that this Relay is monitoring. (Getter)"""
    function MonitoredTerm()::Int
        return Lib.Relays_Get_MonitoredTerm()
    end

    """Number of terminal of monitored element that this Relay is monitoring. (Setter)"""
    function MonitoredTerm(Value::Int)
        Lib.Relays_Set_MonitoredTerm(Value)
    end

    """Name of active relay. (Getter)"""
    function Name()::String
        return Utils.get_string(Lib.Relays_Get_Name())
    end

    """Name of active relay. (Setter)"""
    function Name(Value::String)
        Lib.Relays_Set_Name(Value)
    end

    """Advance to next Relay object. Returns 0 when no more relays."""
    function Next()::Int
        return Lib.Relays_Get_Next()
    end

    """Full name of element that will be switched when relay trips. (Getter)"""
    function SwitchedObj()::String
        return Utils.get_string(Lib.Relays_Get_SwitchedObj())
    end

    """Full name of element that will be switched when relay trips. (Setter)"""
    function SwitchedObj(Value::String)
        Lib.Relays_Set_SwitchedObj(Value)
    end

    """Terminal number of the switched object that will be opened when the relay trips. (Getter)"""
    function SwitchedTerm()::Int
        return Lib.Relays_Get_SwitchedTerm()
    end

    """Terminal number of the switched object that will be opened when the relay trips. (Setter)"""
    function SwitchedTerm(Value::Int)
        Lib.Relays_Set_SwitchedTerm(Value)
    end

    """Active Relay by index into the Relay list. 1..Count (Getter)"""
    function Idx()::Int
        return Lib.Relays_Get_idx()
    end

    """Active Relay by index into the Relay list. 1..Count (Setter)"""
    function Idx(Value::Int)
        Lib.Relays_Set_idx(Value)
    end

end

