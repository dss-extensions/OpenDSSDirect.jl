module SwtControls

    using ..Lib
    using ..Utils

    function Reset()
        Lib.SwtControls_Reset()
    end

    """Open or Close the switch. No effect if switch is locked.  However, Reset removes any lock and then closes the switch (shelf state)."""
    function Action()::Int
        return Lib.SwtControls_Get_Action()
    end

    """Open or Close the switch. No effect if switch is locked.  However, Reset removes any lock and then closes the switch (shelf state)."""
    function Action(Value::Int)
        Lib.SwtControls_Set_Action(Value)
    end

    """(read-only) Array of strings with all SwtControl names in the active circuit."""
    function AllNames()::Vector{String}
        return get_string_array(Lib.SwtControls_Get_AllNames)
    end

    function Count()::Int
        return Lib.SwtControls_Get_Count()
    end

    """Time delay [s] betwen arming and opening or closing the switch.  Control may reset before actually operating the switch."""
    function Delay()::Float64
        return Lib.SwtControls_Get_Delay()
    end

    """Time delay [s] betwen arming and opening or closing the switch.  Control may reset before actually operating the switch."""
    function Delay(Value::Float64)
        Lib.SwtControls_Set_Delay(Value)
    end

    """(read-only) Sets the first SwtControl active. Returns 0 if no more."""
    function First()::Int
        return Lib.SwtControls_Get_First()
    end

    """The lock prevents both manual and automatic switch operation."""
    function IsLocked()::Bool
        return Lib.SwtControls_Get_IsLocked() != 0
    end

    """The lock prevents both manual and automatic switch operation."""
    function IsLocked(Value::Bool)
        Lib.SwtControls_Set_IsLocked(Value ? 1 : 0)
    end

    """Sets a SwtControl active by Name."""
    function Name()::String
        return get_string(Lib.SwtControls_Get_Name())
    end

    """Sets a SwtControl active by Name."""
    function Name(Value::String)
        Lib.SwtControls_Set_Name(Value)
    end

    """(read-only) Sets the next SwtControl active. Returns 0 if no more."""
    function Next()::Int
        return Lib.SwtControls_Get_Next()
    end

    """
    (read) Get Normal state of switch
    (write) set Normal state of switch  (see actioncodes) dssActionOpen or dssActionClose
    """
    function NormalState()::Int
        return Lib.SwtControls_Get_NormalState()
    end

    """
    (read) Get Normal state of switch
    (write) set Normal state of switch  (see actioncodes) dssActionOpen or dssActionClose
    """
    function NormalState(Value::Int)
        Lib.SwtControls_Set_NormalState(Value)
    end

    """
    (read) Force switch to specified state
    (write) Get Present state of switch
    """
    function State()::Int
        return Lib.SwtControls_Get_State()
    end

    """
    (read) Force switch to specified state
    (write) Get Present state of switch
    """
    function State(Value::Int)
        Lib.SwtControls_Set_State(Value)
    end

    """Full name of the switched element."""
    function SwitchedObj()::String
        return get_string(Lib.SwtControls_Get_SwitchedObj())
    end

    """Full name of the switched element."""
    function SwitchedObj(Value::String)
        Lib.SwtControls_Set_SwitchedObj(Value)
    end

    """Terminal number where the switch is located on the SwitchedObj"""
    function SwitchedTerm()::Int
        return Lib.SwtControls_Get_SwitchedTerm()
    end

    """Terminal number where the switch is located on the SwitchedObj"""
    function SwitchedTerm(Value::Int)
        Lib.SwtControls_Set_SwitchedTerm(Value)

    end

end

